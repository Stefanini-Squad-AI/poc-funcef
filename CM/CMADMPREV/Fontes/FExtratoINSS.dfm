inherited frmExtratoINSS: TfrmExtratoINSS
  Left = 116
  Top = 90
  HelpContext = 160096
  Caption = 'Extrato Individual de Conciliação dos Proventos INSS'
  ClientHeight = 483
  ClientWidth = 949
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 949
    Height = 444
    object Splitter1: TSplitter
      Left = 1
      Top = 85
      Width = 947
      Height = 3
      Cursor = crVSplit
      Align = alTop
    end
    object Splitter2: TSplitter
      Left = 1
      Top = 392
      Width = 947
      Height = 3
      Cursor = crVSplit
      Align = alBottom
    end
    object pnlTopo: TPanel
      Left = 1
      Top = 1
      Width = 947
      Height = 84
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object Label1: TLabel
        Left = 16
        Top = 8
        Width = 18
        Height = 13
        Anchors = [akLeft]
        Caption = 'NB'
      end
      object Label2: TLabel
        Left = 128
        Top = 8
        Width = 55
        Height = 13
        Anchors = [akLeft]
        Caption = 'Matrícula'
      end
      object Label3: TLabel
        Left = 256
        Top = 8
        Width = 33
        Height = 13
        Anchors = [akLeft]
        Caption = 'Nome'
      end
      object Label4: TLabel
        Left = 584
        Top = 8
        Width = 152
        Height = 13
        Anchors = [akLeft]
        Caption = 'Mantenedora do Benefício'
      end
      object Label5: TLabel
        Left = 456
        Top = 43
        Width = 101
        Height = 13
        Anchors = [akLeft]
        Caption = 'Entidade Contábil'
      end
      object Label6: TLabel
        Left = 192
        Top = 43
        Width = 56
        Height = 13
        Anchors = [akLeft]
        Caption = 'Benefício'
      end
      object Label7: TLabel
        Left = 16
        Top = 43
        Width = 22
        Height = 13
        Anchors = [akLeft]
        Caption = 'DIB'
      end
      object Label10: TLabel
        Left = 104
        Top = 43
        Width = 46
        Height = 13
        Anchors = [akLeft]
        Caption = 'Espécie'
      end
      object Label13: TLabel
        Left = 624
        Top = 43
        Width = 118
        Height = 13
        Anchors = [akLeft]
        Caption = 'Plano Previdenciário'
      end
      object Label19: TLabel
        Left = 789
        Top = 43
        Width = 124
        Height = 13
        Anchors = [akLeft]
        Caption = 'Perfil de Investimento'
      end
      object edNB: TEdit
        Left = 16
        Top = 20
        Width = 97
        Height = 21
        Anchors = [akLeft]
        TabOrder = 1
        Visible = False
        OnExit = edNBExit
      end
      object CbxNBs: TwwDBComboBox
        Left = 16
        Top = 20
        Width = 97
        Height = 21
        Anchors = [akLeft]
        ShowButton = True
        Style = csDropDown
        MapList = False
        AllowClearKey = False
        DropDownCount = 8
        ItemHeight = 0
        Sorted = False
        TabOrder = 0
        UnboundDataType = wwDefault
        OnCloseUp = CbxNBsCloseUp
        OnExit = CbxNBsExit
        OnKeyPress = CbxNBsKeyPress
      end
      object edMatricula: TEdit
        Left = 128
        Top = 20
        Width = 88
        Height = 21
        Anchors = [akLeft]
        TabOrder = 4
        OnExit = edMatriculaExit
        OnKeyPress = edMatriculaKeyPress
      end
      object dblkMatricula: TwwDBLookupCombo
        Left = 128
        Top = 20
        Width = 88
        Height = 21
        Anchors = [akLeft]
        DropDownAlignment = taLeftJustify
        LookupTable = qryMatricula
        LookupField = 'MATRICULA'
        TabOrder = 2
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
        OnCloseUp = dblkMatriculaCloseUp
      end
      object BtPesqPorMatricula: TBitBtn
        Left = 215
        Top = 20
        Width = 24
        Height = 21
        Anchors = [akLeft]
        Caption = '?'
        TabOrder = 3
        OnClick = BtPesqPorMatriculaClick
      end
      object edNome: TEdit
        Left = 256
        Top = 20
        Width = 313
        Height = 21
        Anchors = [akLeft]
        Color = clInfoBk
        Enabled = False
        ReadOnly = True
        TabOrder = 5
        OnExit = edNBExit
      end
      object edMantenedora: TEdit
        Left = 584
        Top = 20
        Width = 193
        Height = 21
        Anchors = [akLeft]
        Color = clInfoBk
        Enabled = False
        ReadOnly = True
        TabOrder = 6
        OnExit = edNBExit
      end
      object edDIB: TEdit
        Left = 16
        Top = 55
        Width = 73
        Height = 21
        Anchors = [akLeft]
        Color = clInfoBk
        Enabled = False
        ReadOnly = True
        TabOrder = 7
        OnExit = edNBExit
      end
      object edEspecie: TEdit
        Left = 104
        Top = 55
        Width = 73
        Height = 21
        Anchors = [akLeft]
        Color = clInfoBk
        Enabled = False
        ReadOnly = True
        TabOrder = 8
        OnExit = edNBExit
      end
      object edBeneficio: TEdit
        Left = 192
        Top = 55
        Width = 249
        Height = 21
        Anchors = [akLeft]
        Color = clInfoBk
        Enabled = False
        ReadOnly = True
        TabOrder = 9
        OnExit = edNBExit
      end
      object edEntidade: TEdit
        Left = 456
        Top = 55
        Width = 153
        Height = 21
        Anchors = [akLeft]
        Color = clInfoBk
        Enabled = False
        ReadOnly = True
        TabOrder = 10
        OnExit = edNBExit
      end
      object EdNomePlanoPrev: TEdit
        Left = 624
        Top = 55
        Width = 153
        Height = 21
        Anchors = [akLeft]
        Color = clInfoBk
        Enabled = False
        ReadOnly = True
        TabOrder = 11
        OnExit = edNBExit
      end
      object edPerfilInvest: TEdit
        Left = 789
        Top = 55
        Width = 153
        Height = 21
        Anchors = [akLeft]
        Color = clInfoBk
        Enabled = False
        ReadOnly = True
        TabOrder = 12
        OnExit = edNBExit
      end
    end
    object Panel1: TPanel
      Left = 1
      Top = 88
      Width = 947
      Height = 304
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object Splitter3: TSplitter
        Left = 0
        Top = 139
        Width = 947
        Height = 3
        Cursor = crVSplit
        Align = alTop
      end
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 947
        Height = 139
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object wwDBGrid5: TwwDBGrid
          Left = 0
          Top = 24
          Width = 947
          Height = 115
          Selected.Strings = (
            'MESCOBRANCA'#9'7'#9'Cobrança'
            'CODPROVDESC'#9'7'#9'Rubrica~INSS'
            'VALORPROVENTO'#9'11'#9'Valor'
            'SINAL'#9'4'#9'Sinal'
            'DESCRRUBRICA'#9'42'#9'Descrição da Rubrica'
            'MES'#9'8'#9'Referência'
            'IDRUBRICA'#9'8'#9'Rubrica~TotalPrev'
            'DATAPAGTO'#9'10'#9'Data~Pagto'
            'IDPLANOCONTABIL'#9'10'#9'Entidade Contábil'
            'IDPLANOPREV'#9'10'#9'Plano Previdenciário')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsFolhaFuncef
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          ReadOnly = True
          TabOrder = 0
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 2
          TitleButtons = False
          IndicatorColor = icBlack
          object wwDBGrid5IButton: TwwIButton
            Left = 0
            Top = 0
            Width = 13
            Height = 22
            AllowAllUp = True
          end
        end
        object Panel10: TPanel
          Left = 0
          Top = 0
          Width = 947
          Height = 24
          Align = alTop
          Caption = 'Desembolso Funcef'
          Color = clNavy
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindow
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          object chkInibirPA: TCheckBox
            Left = 12
            Top = 5
            Width = 257
            Height = 17
            Caption = 'Inibir rubricas de pensão alimentícia'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindow
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            OnClick = chkRubInfoClick
          end
        end
      end
      object Panel4: TPanel
        Left = 0
        Top = 142
        Width = 947
        Height = 162
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object DBgrdComPlano: TwwDBGrid
          Left = 0
          Top = 24
          Width = 947
          Height = 138
          Selected.Strings = (
            'MESCOBRANCA'#9'7'#9'Cobrança'
            'RUBRICAINSS'#9'6'#9'Rubrica'
            'VALORINSS'#9'12'#9'Valor'
            'SINAL'#9'4'#9'Sinal'
            'DESCRRUBRICA'#9'37'#9'Descrição da Rubrica'
            'IDPLANOPREV'#9'10'#9'Código~da Entidade'
            'ENTIDADECONTABIL'#9'23'#9'Entidade Contábil'
            'IDPLANOPREVPREV'#9'10'#9'Código do~Plano'
            'NOMEPLANOPREV'#9'28'#9'Plano Previdenciário'
            'CODMANTENEDORA'#9'10'#9'Código~Mantenedora'
            'MESREFERENCIA'#9'8'#9'Referência'
            'RMREAJ'#9'10'#9'RMREAJ'
            'APREAJ'#9'10'#9'APREAJ'
            'CODCONCESSORINSS'#9'11'#9'OL Concessor'
            'CODMANTENEDORINSS'#9'13'#9'OL Mantenedor'
            'NOMEMANTENEDORA'#9'60'#9'Mantenedora'
            'CODSINONIMO'#9'10'#9'Código Sinônimo'
            'DTINICIOCRED'#9'18'#9'Data Inicio Crédito'
            'DTFIMCRED'#9'18'#9'Data Fim Crédito')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsReembolso
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          ReadOnly = True
          TabOrder = 1
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 2
          TitleButtons = False
          Visible = False
          OnCalcCellColors = DBgrdComPlanoCalcCellColors
          IndicatorColor = icBlack
        end
        object DBgrdSemPlano: TwwDBGrid
          Left = 0
          Top = 24
          Width = 947
          Height = 138
          Selected.Strings = (
            'MESCOBRANCA'#9'7'#9'Cobrança'#9'F'
            'RUBRICAINSS'#9'6'#9'Rubrica'#9'F'
            'VALORINSS'#9'12'#9'Valor'#9'F'
            'SINAL'#9'4'#9'Sinal'#9'F'
            'DESCRRUBRICA'#9'37'#9'Descrição da Rubrica'#9'F'
            'CODMANTENEDORA'#9'10'#9'Código~Mantenedora'#9'F'
            'MESREFERENCIA'#9'8'#9'Referência'#9'F'
            'RMREAJ'#9'10'#9'RMREAJ'#9'F'
            'APREAJ'#9'10'#9'APREAJ'#9'F'
            'CODCONCESSORINSS'#9'11'#9'OL Concessor'#9'F'
            'CODMANTENEDORINSS'#9'12'#9'OL Mantenedor'#9'F'
            'NOMEMANTENEDORA'#9'60'#9'Mantenedora'#9'F'
            'CODSINONIMO'#9'12'#9'Código~Sinônimo'#9'F'
            'DTINICIOCRED'#9'18'#9'Data Inicio Crédito'#9'F'
            'DTFIMCRED'#9'18'#9'Data Fim Crédito'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dtsSemPlano
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          ReadOnly = True
          TabOrder = 2
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 2
          TitleButtons = False
          OnCalcCellColors = DBgrdComPlanoCalcCellColors
          IndicatorColor = icBlack
        end
        object Panel11: TPanel
          Left = 0
          Top = 0
          Width = 947
          Height = 24
          Align = alTop
          Caption = 'Reembolso INSS'
          Color = clNavy
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindow
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object chkRubInfo: TCheckBox
            Left = 766
            Top = 4
            Width = 174
            Height = 16
            Anchors = [akTop, akRight]
            Caption = 'Exibir rubricas Informativas'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            OnClick = chkRubInfoClick
          end
          object chkReembolsoFundacao: TCheckBox
            Left = 12
            Top = 4
            Width = 269
            Height = 17
            Caption = 'Apenas reembolso p/ mantenedora Funcef'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            OnClick = chkRubInfoClick
          end
        end
      end
    end
    object Panel2: TPanel
      Left = 1
      Top = 395
      Width = 947
      Height = 48
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 2
      object Label15: TLabel
        Left = 432
        Top = 8
        Width = 69
        Height = 13
        Anchors = [akLeft]
        Caption = 'Desembolso'
      end
      object Label16: TLabel
        Left = 520
        Top = 8
        Width = 63
        Height = 13
        Anchors = [akLeft]
        Caption = 'Reembolso'
      end
      object Label8: TLabel
        Left = 608
        Top = 8
        Width = 56
        Height = 13
        Anchors = [akLeft]
        Caption = 'Diferença'
      end
      object Label9: TLabel
        Left = 696
        Top = 8
        Width = 33
        Height = 13
        Anchors = [akLeft]
        Caption = 'Glosa'
      end
      object Label11: TLabel
        Left = 8
        Top = 7
        Width = 84
        Height = 13
        Anchors = [akLeft]
        Caption = 'Período Inicial'
      end
      object Label12: TLabel
        Left = 60
        Top = 19
        Width = 6
        Height = 20
        Anchors = [akLeft]
        Caption = '/'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label14: TLabel
        Left = 181
        Top = 19
        Width = 6
        Height = 20
        Anchors = [akLeft]
        Caption = '/'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label17: TLabel
        Left = 128
        Top = 7
        Width = 77
        Height = 13
        Anchors = [akLeft]
        Caption = 'Período Final'
      end
      object Label18: TLabel
        Left = 114
        Top = 22
        Width = 8
        Height = 13
        Anchors = [akLeft]
        Caption = 'a'
      end
      object wwDBEdit6: TwwDBEdit
        Left = 432
        Top = 20
        Width = 81
        Height = 21
        Anchors = [akLeft]
        Color = clInfoBk
        DataField = 'VALOR'
        DataSource = dsFolhaFuncef
        ReadOnly = True
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object medReembolso: TMaskEdit
        Left = 520
        Top = 20
        Width = 81
        Height = 21
        Anchors = [akLeft]
        BiDiMode = bdRightToLeft
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object medDiferenca: TMaskEdit
        Left = 608
        Top = 20
        Width = 81
        Height = 21
        Anchors = [akLeft]
        BiDiMode = bdRightToLeft
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
      object wwDBEdit8: TwwDBEdit
        Left = 696
        Top = 20
        Width = 81
        Height = 21
        Anchors = [akLeft]
        Color = clInfoBk
        DataField = 'VLRGLOSA'
        DataSource = dsGlosa
        ReadOnly = True
        TabOrder = 3
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object spAno: TSpinEdit
        Left = 8
        Top = 19
        Width = 51
        Height = 22
        Anchors = [akLeft]
        AutoSize = False
        MaxValue = 9999
        MinValue = 0
        TabOrder = 4
        Value = 1997
        OnChange = spAnoChange
      end
      object spMes: TSpinEdit
        Left = 69
        Top = 19
        Width = 40
        Height = 22
        Anchors = [akLeft]
        AutoSize = False
        MaxValue = 12
        MinValue = 1
        TabOrder = 5
        Value = 5
        OnChange = spAnoChange
      end
      object ChBxAutoPesquisa: TCheckBox
        Left = 264
        Top = 28
        Width = 153
        Height = 17
        Anchors = [akLeft]
        Caption = 'Pesquisa Automática'
        Checked = True
        State = cbChecked
        TabOrder = 6
        Visible = False
      end
      object SpAnoFim: TSpinEdit
        Left = 128
        Top = 19
        Width = 51
        Height = 22
        Anchors = [akLeft]
        AutoSize = False
        MaxValue = 9999
        MinValue = 0
        TabOrder = 7
        Value = 2004
        OnChange = spAnoChange
      end
      object SpMesFim: TSpinEdit
        Left = 190
        Top = 19
        Width = 40
        Height = 22
        Anchors = [akLeft]
        AutoSize = False
        MaxValue = 12
        MinValue = 1
        TabOrder = 8
        Value = 1
        OnChange = spAnoChange
      end
      object chkExibePlano: TCheckBox
        Left = 264
        Top = 8
        Width = 153
        Height = 17
        Caption = 'Exibir Plano'
        TabOrder = 9
        OnClick = chkRubInfoClick
      end
    end
  end
  inherited Dock971: TDock97
    Top = 444
    Width = 949
    inherited tb97Fundo: TToolbar97
      Left = 549
      DockPos = 549
      inherited sep1: TToolbarSep97
        Left = 163
      end
      object ToolbarSep971: TToolbarSep97 [1]
        Left = 80
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      inherited bbtnSair: TBitBtn
        Left = 82
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 165
      end
      object btnImprimir: TBitBtn
        Left = 0
        Top = 0
        Width = 80
        Height = 33
        Caption = '&Imprimir'
        TabOrder = 2
        OnClick = btnImprimirClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
          00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
          8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
          8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
          8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
          03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
          03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
          33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
          33333337FFFF7733333333300000033333333337777773333333}
        NumGlyphs = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 987
    Top = 3
    TargetsData = (
      1
      2
      (
        ''
        'DisplayLabel'
        0)
      (
        ''
        'Filter'
        0))
  end
  object UpdateSQL1: TUpdateSQL
    Left = 296
    Top = 128
  end
  object ppLeituraArq: TppBDEPipeline
    UserName = 'LeituraArq'
    Left = 472
    Top = 128
    object ppLeituraArqppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'RUBRICA'
      FieldName = 'RUBRICA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 6
      Position = 0
    end
    object ppLeituraArqppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'QUANTIDADE'
      FieldName = 'QUANTIDADE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 8
      Position = 1
    end
    object ppLeituraArqppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR'
      FieldName = 'VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 25
      Position = 2
    end
    object ppLeituraArqppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'TIPO'
      FieldName = 'TIPO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 4
      Position = 3
    end
    object ppLeituraArqppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORINFO'
      FieldName = 'VALORINFO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
  end
  object prLeituaArq: TppReport
    AutoStop = False
    DataPipeline = ppLeituraArq
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 592
    Top = 176
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppLeituraArq'
    object ppHeaderBand15: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 44715
      mmPrintPosition = 0
      object ppDBImage14: TppDBImage
        UserName = 'DBImage3'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppFundacao'
        mmHeight = 25135
        mmLeft = 1323
        mmTop = 1058
        mmWidth = 39688
        BandType = 0
      end
      object ppDBText212: TppDBText
        UserName = 'DBText41'
        AutoSize = True
        DataField = 'NOME'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 5821
        mmLeft = 41540
        mmTop = 1323
        mmWidth = 14817
        BandType = 0
      end
      object ppDBText213: TppDBText
        UserName = 'DBText42'
        AutoSize = True
        DataField = 'RAZAOSOCIAL'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 4233
        mmLeft = 41540
        mmTop = 7673
        mmWidth = 25929
        BandType = 0
      end
      object ppDBText214: TppDBText
        UserName = 'DBText46'
        AutoSize = True
        DataField = 'LOGRADOURO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 41540
        mmTop = 12965
        mmWidth = 20373
        BandType = 0
      end
      object ppDBText215: TppDBText
        UserName = 'DBText47'
        AutoSize = True
        DataField = 'NUMERO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 96044
        mmTop = 12965
        mmWidth = 12435
        BandType = 0
      end
      object ppDBText216: TppDBText
        UserName = 'DBText48'
        AutoSize = True
        DataField = 'CODESTADO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 96044
        mmTop = 17463
        mmWidth = 17992
        BandType = 0
      end
      object ppDBText217: TppDBText
        UserName = 'DBText49'
        AutoSize = True
        DataField = 'CIDADE'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 70379
        mmTop = 17463
        mmWidth = 10583
        BandType = 0
      end
      object ppDBText218: TppDBText
        UserName = 'DBText50'
        AutoSize = True
        DataField = 'BAIRRO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 41540
        mmTop = 17463
        mmWidth = 10848
        BandType = 0
      end
      object ppLabel206: TppLabel
        UserName = 'Label56'
        Caption = 'CEP'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 41540
        mmTop = 21960
        mmWidth = 5821
        BandType = 0
      end
      object ppDBText219: TppDBText
        UserName = 'DBText51'
        AutoSize = True
        DataField = 'CEP'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3175
        mmLeft = 48948
        mmTop = 21960
        mmWidth = 5821
        BandType = 0
      end
      object ppLabel210: TppLabel
        UserName = 'Label65'
        Caption = 'Resultado da Leitura do Arquivo DataPrev'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 58208
        mmTop = 27517
        mmWidth = 84931
        BandType = 0
      end
      object ppLine62: TppLine
        UserName = 'Line9'
        Pen.Color = clWindowText
        Pen.Width = 3
        Position = lpBottom
        Weight = 2.25
        mmHeight = 794
        mmLeft = 0
        mmTop = 33338
        mmWidth = 284428
        BandType = 0
      end
      object ppLabel212: TppLabel
        UserName = 'Label212'
        Caption = 'Rubrica'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 30427
        mmTop = 39423
        mmWidth = 13229
        BandType = 0
      end
      object ppLabel214: TppLabel
        UserName = 'Label214'
        Caption = 'Quantidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 76729
        mmTop = 39423
        mmWidth = 19579
        BandType = 0
      end
      object ppLine64: TppLine
        UserName = 'Line64'
        Weight = 0.75
        mmHeight = 794
        mmLeft = 529
        mmTop = 43921
        mmWidth = 225161
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 130969
        mmTop = 39423
        mmWidth = 8996
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'Tipo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 265
        mmTop = 39423
        mmWidth = 7673
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Valor Info.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 168275
        mmTop = 39423
        mmWidth = 17463
        BandType = 0
      end
    end
    object ppDetailBand16: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3175
      mmPrintPosition = 0
      object shp1: TppShape
        UserName = 'shp1'
        Pen.Color = clWhite
        mmHeight = 3175
        mmLeft = 0
        mmTop = 0
        mmWidth = 197380
        BandType = 4
      end
      object ppDBText220: TppDBText
        UserName = 'DBText220'
        DataField = 'RUBRICA'
        DataPipeline = ppLeituraArq
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppLeituraArq'
        mmHeight = 3175
        mmLeft = 30427
        mmTop = 0
        mmWidth = 18256
        BandType = 4
      end
      object ppDBText221: TppDBText
        UserName = 'DBText221'
        DataField = 'QUANTIDADE'
        DataPipeline = ppLeituraArq
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppLeituraArq'
        mmHeight = 3175
        mmLeft = 79111
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        AutoSize = True
        DataField = 'VALOR'
        DataPipeline = ppLeituraArq
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppLeituraArq'
        mmHeight = 3175
        mmLeft = 130440
        mmTop = 0
        mmWidth = 9525
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2201'
        DataField = 'TIPO'
        DataPipeline = ppLeituraArq
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppLeituraArq'
        mmHeight = 3175
        mmLeft = 0
        mmTop = 0
        mmWidth = 18256
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        AutoSize = True
        DataField = 'VALORINFO'
        DataPipeline = ppLeituraArq
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppLeituraArq'
        mmHeight = 3175
        mmLeft = 176213
        mmTop = 0
        mmWidth = 9525
        BandType = 4
      end
    end
    object ppFooterBand15: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 7938
      mmPrintPosition = 0
      object ppLine63: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel213: TppLabel
        UserName = 'LblSistema'
        AutoSize = False
        Caption = 'Administraçao Previdenciária'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 2910
        mmWidth = 284163
        BandType = 8
      end
      object ppSystemVariable27: TppSystemVariable
        UserName = 'Calc2'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 0
        mmTop = 3175
        mmWidth = 197644
        BandType = 8
      end
    end
    object ppSummaryBand13: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        AutoSize = True
        DataField = 'VALOR'
        DataPipeline = ppLeituraArq
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppLeituraArq'
        mmHeight = 3387
        mmLeft = 119686
        mmTop = 0
        mmWidth = 20278
        BandType = 7
      end
      object ppDBCalc2: TppDBCalc
        UserName = 'DBCalc2'
        AutoSize = True
        DataField = 'QUANTIDADE'
        DataPipeline = ppLeituraArq
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppLeituraArq'
        mmHeight = 3387
        mmLeft = 67056
        mmTop = 0
        mmWidth = 29252
        BandType = 7
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Total Geral :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 43656
        mmTop = 0
        mmWidth = 16140
        BandType = 7
      end
      object ppDBCalc3: TppDBCalc
        UserName = 'DBCalc3'
        AutoSize = True
        DataField = 'VALORINFO'
        DataPipeline = ppLeituraArq
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppLeituraArq'
        mmHeight = 3387
        mmLeft = 158687
        mmTop = 0
        mmWidth = 27051
        BandType = 7
      end
    end
    object raCodeModule1: TraCodeModule
      ProgramStream = {00}
    end
  end
  object ppdsnLeituraArq: TppDesigner
    Caption = 'ReportBuilder'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Position = poScreenCenter
    Report = prLeituaArq
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    WindowState = wsMaximized
    Left = 552
    Top = 152
  end
  object qryFundacao: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT P.NOME , P.RAZAOSOCIAL, E.LOGRADOURO,'
      '       E.NUMERO, E.COMPLEMENTO, E.BAIRRO,'
      '       C.NOME AS CIDADE, C.CODESTADO, E.CEP, I.IMAGEM'
      'FROM PESSOA P, ENDPESS E, IMAGENS I, CIDADES C'
      'WHERE (P.IDPESSOA = :pFundacao) AND '
      '      (E.IDPESSOA(+) = P.IDPESSOA) AND'
      '      (E.IDCIDADES   = C.IDCIDADES(+))  AND'
      '      (I.IDIMAGEM(+) = P.IDIMAGEM)')
    ValidateWithMask = True
    Left = 696
    Top = 160
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pFundacao'
        ParamType = ptUnknown
        Value = 1
      end>
  end
  object dsFundacao: TwwDataSource
    DataSet = qryFundacao
    Left = 696
    Top = 144
  end
  object ppFundacao: TppBDEPipeline
    DataSource = dsFundacao
    UserName = 'Fundacao'
    Left = 696
    Top = 176
  end
  object qryAux: TwwQuery
    AutoCalcFields = False
    DatabaseName = 'basedados'
    ValidateWithMask = True
    Left = 120
    Top = 128
  end
  object dsFolhaFuncef: TwwDataSource
    DataSet = qryFolhaFuncef
    Left = 144
    Top = 328
  end
  object dsReembolso: TwwDataSource
    DataSet = qryReembolso
    Left = 208
    Top = 192
  end
  object qryFolhaFuncef: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  H.IDPLANOCONTABIL,H.IDPLANOPREV,'
      
        '  H.MES,H.MESCOBRANCA, H.IDRUBRICA, H.CODPROVDESC, H.VALORPROVEN' +
        'TO,'
      '  H.FONTEPAGADORA,     H.NUMPROCINSS,'
      '  TO_CHAR(H.DATAPAGAMENTO,'#39'DD/MM/YYYY'#39') AS DATAPAGTO,'
      '  DECODE(P.FLGDESCONTO,1,'#39'(-)'#39',0,'#39'(+)'#39') AS SINAL,'
      '  SUBSTR(P.DESCRICAO,1,30) AS DESCRRUBRICA,'
      '  TOTAL.VALOR'
      'FROM'
      '  HISTRUBSAL H, PROVDESC P,'
      '  (SELECT IDRUBIRRFINSS FROM PARAMAPREV )PA,'
      ''
      '  (SELECT'
      
        '     SUM(DECODE(P.FLGDESCONTO,0,VALORPROVENTO,1,-VALORPROVENTO,0' +
        ')) AS VALOR'
      '   FROM'
      '     HISTRUBSAL H, PROVDESC P,'
      '     (SELECT IDRUBIRRFINSS FROM PARAMAPREV )PA'
      '   WHERE'
      '     (H.IDPESSJUR = :IDPESSJUR)     AND'
      '     (H.IDPESSOA  = :IDPESSOA)      AND'
      '     ((H.MESCOBRANCA >= :MESCOB)     AND'
      '      (H.MESCOBRANCA <= :MESCOBFIM))     AND'
      '     ( ( (H.NUMPROCINSS = :NUMPROCINSS) AND (H.IDMODULO=18) ) OR'
      '       ( (H.NUMPROCINSS IS NULL) AND (H.IDMODULO=21) ) )AND'
      '       (H.IDMODULO IN (18,21))      AND'
      '     (H.IDRUBRICA = P.IDPROVENTO) AND'
      '     (H.IDRUBRICA <> PA.IDRUBIRRFINSS) AND'
      '     ( (H.FLGESTORNO = 0) OR (H.FLGESTORNO IS NULL) ) AND'
      
        '     ( (H.FONTEPAGADORA = 2 ) OR ( (H.FONTEPAGADORA IS NULL) AND' +
        ' (H.IDMODULO=21)  AND'
      '       (P.CODFONTEPAGADORA = 2) ) )'
      ''
      
        '  AND ( H.IDRUBRICA NOT IN(SELECT ER.IDRUBRICA FROM ESTRUTURAXRU' +
        'BRICA ER WHERE ER.IDESTRUTURA = 45))'
      
        '  AND ((2=:pConsideraPA) OR ( H.IDRUBRICA NOT IN(SELECT ER.IDRUB' +
        'RICA FROM ESTRUTURAXRUBRICA ER WHERE ER.IDESTRUTURA = 47))) '
      ''
      '  ) TOTAL'
      ''
      'WHERE'
      '  (H.IDPESSJUR = :IDPESSJUR)      AND'
      '  (H.IDPESSOA  = :IDPESSOA)       AND'
      '  ((H.MESCOBRANCA >= :MESCOB)     AND'
      '   (H.MESCOBRANCA <= :MESCOBFIM)) AND'
      '  ( ( (H.NUMPROCINSS = :NUMPROCINSS) AND (H.IDMODULO=18) ) OR'
      '    ( (H.NUMPROCINSS IS NULL) AND (H.IDMODULO=21) ))AND'
      '  (H.IDMODULO IN (18,21))            AND'
      '  (H.IDRUBRICA = P.IDPROVENTO)       AND'
      '  (H.IDRUBRICA <> PA.IDRUBIRRFINSS)  AND'
      '  ((H.FLGESTORNO = 0) OR (H.FLGESTORNO IS NULL)) AND'
      
        '  ((H.FONTEPAGADORA = 2 ) OR ( (H.FONTEPAGADORA IS NULL) AND (H.' +
        'IDMODULO=21) AND'
      '  (P.CODFONTEPAGADORA = 2) ) )'
      ''
      
        '  AND ( H.IDRUBRICA NOT IN(SELECT ER.IDRUBRICA FROM ESTRUTURAXRU' +
        'BRICA ER WHERE ER.IDESTRUTURA = 45))'
      
        '  AND ((2=:pConsideraPA) OR ( H.IDRUBRICA NOT IN(SELECT ER.IDRUB' +
        'RICA FROM ESTRUTURAXRUBRICA ER WHERE ER.IDESTRUTURA = 47))) '
      ''
      ''
      ''
      'ORDER BY'
      '  H.MESCOBRANCA DESC, H.MES DESC'
      ''
      ' '
      ' '
      ' ')
    PictureMasks.Strings = (
      'MES'#9'999,999,999.99'#9'T'#9'T')
    ValidateWithMask = True
    Left = 56
    Top = 328
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idpessjur'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'idpessoa'
        ParamType = ptUnknown
        Value = 1215012
      end
      item
        DataType = ftString
        Name = 'mescob'
        ParamType = ptUnknown
        Value = '2004/01'
      end
      item
        DataType = ftString
        Name = 'MESCOBFIM'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'numprocinss'
        ParamType = ptUnknown
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'pConsideraPA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'MESCOB'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'MESCOBFIM'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NUMPROCINSS'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pConsideraPA'
        ParamType = ptUnknown
      end>
    object qryFolhaFuncefMESCOBRANCA: TStringField
      DisplayLabel = 'Cobrança'
      DisplayWidth = 7
      FieldName = 'MESCOBRANCA'
      FixedChar = True
      Size = 7
    end
    object qryFolhaFuncefCODPROVDESC: TStringField
      DisplayLabel = 'Rubrica~INSS'
      DisplayWidth = 7
      FieldName = 'CODPROVDESC'
      Size = 15
    end
    object qryFolhaFuncefVALORPROVENTO: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 11
      FieldName = 'VALORPROVENTO'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object qryFolhaFuncefSINAL: TStringField
      DisplayLabel = 'Sinal'
      DisplayWidth = 4
      FieldName = 'SINAL'
      Size = 3
    end
    object qryFolhaFuncefDESCRRUBRICA: TStringField
      DisplayLabel = 'Descrição da Rubrica'
      DisplayWidth = 42
      FieldName = 'DESCRRUBRICA'
      Size = 30
    end
    object qryFolhaFuncefMES: TStringField
      DisplayLabel = 'Referência'
      DisplayWidth = 8
      FieldName = 'MES'
      FixedChar = True
      Size = 7
    end
    object qryFolhaFuncefIDRUBRICA: TFloatField
      DisplayLabel = 'Rubrica~TotalPrev'
      DisplayWidth = 8
      FieldName = 'IDRUBRICA'
    end
    object qryFolhaFuncefDATAPAGTO: TStringField
      DisplayLabel = 'Data~Pagto'
      DisplayWidth = 10
      FieldName = 'DATAPAGTO'
      Size = 10
    end
    object qryFolhaFuncefIDPLANOCONTABIL: TFloatField
      DisplayLabel = 'Entidade Contábil'
      DisplayWidth = 10
      FieldName = 'IDPLANOCONTABIL'
    end
    object qryFolhaFuncefIDPLANOPREV: TFloatField
      DisplayLabel = 'Plano Previdenciário'
      DisplayWidth = 10
      FieldName = 'IDPLANOPREV'
    end
    object qryFolhaFuncefNUMPROCINSS: TStringField
      DisplayLabel = 'NB'
      DisplayWidth = 15
      FieldName = 'NUMPROCINSS'
      Visible = False
      Size = 15
    end
    object qryFolhaFuncefFONTEPAGADORA: TFloatField
      DisplayWidth = 10
      FieldName = 'FONTEPAGADORA'
      Visible = False
    end
    object qryFolhaFuncefVALOR: TFloatField
      FieldName = 'VALOR'
      Visible = False
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
  end
  object qryReembolso: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   MESREFERENCIA, MESCOBRANCA, NUMPROCINSS, VALORINSS, MATRICULA' +
        ','
      '   SINAL, ESPECIE, RUBRICAINSS, DESCRRUBRICA, VALOR3, VALOR4,'
      '   IDPLANOPREV, ENTIDADECONTABIL, RMREAJ, APREAJ,'
      
        '   CODMANTENEDORA, NOMEMANTENEDORA, SEQUENCIAL, CODCONCESSORINSS' +
        ','
      '   CODMANTENEDORINSS, IDPLANOPREVPREV, NOMEPLANOPREV'
      '   ,CODSINONIMO,DTINICIOCRED, DTFIMCRED'
      'FROM'
      '   ('
      '   SELECT'
      
        '      D.MESREFERENCIA, D.MESCOBRANCA, D.NUMPROCINSS, D.VALORINSS' +
        ', D.MATRICULA,'
      '      DECODE(P.FLGDESCONTO,1,'#39'(-)'#39',0,'#39'(+)'#39') AS SINAL, D.ESPECIE,'
      
        '      D.RUBRICAINSS,SUBSTR(P.DESCRICAO,1,30) AS DESCRRUBRICA, TO' +
        'TAL.VALOR AS VALOR3, 0 AS VALOR4,'
      
        '      D.IDPLANOPREV, PL.NOME AS ENTIDADECONTABIL , D.RMREAJ, D.A' +
        'PREAJ, D.CODMANTENEDORA ,'
      
        '      NVL(M.NOME,'#39'FUNCEF'#39') AS NOMEMANTENEDORA, D.SEQUENCIAL, D.C' +
        'ODCONCESSORINSS, D.CODMANTENEDORINSS,'
      '      D.IDPLANOPREVPREV,'
      '      PP.NOME AS NOMEPLANOPREV'
      '      ,D.CODSINONIMO,D.DTINICIOCRED, D.DTFIMCRED'
      '   FROM'
      '      DETCONCINSS       D,'
      '      PROVDESC          P,'
      '      PLANPREVCONTABIL  PL,'
      '      MANTENEDORA       M,'
      '      PLANPREV          PP,'
      ''
      '      ('
      '      SELECT'
      
        '         SUM(DECODE(P.FLGDESCONTO,0,VALORINSS,1,-VALORINSS,0)) A' +
        'S VALOR'
      '      FROM'
      '         DETCONCINSS H,'
      '         PROVDESC    P'
      '      WHERE'
      '             (H.NUMPROCINSS= :numproc)'
      '         AND ((SUBSTR(H.RUBRICAINSS,2,1) <> '#39'3'#39')'
      '         AND (SUBSTR(H.RUBRICAINSS,2,1) <> '#39'9'#39'))'
      '         AND (H.IDRUBRICA = P.IDPROVENTO)'
      '         AND (H.FLGMANUAL <> 4 )'
      '         AND (H.FLGMANUAL <> 1)'
      '      ) TOTAL'
      ''
      '   WHERE'
      '          (D.NUMPROCINSS = :numproc)'
      '      AND ((SUBSTR(D.RUBRICAINSS,2,1) <> '#39'3'#39')'
      '      AND (SUBSTR(D.RUBRICAINSS,2,1) <> '#39'9'#39'))'
      '      AND (D.IDRUBRICA = P.IDPROVENTO)'
      '      AND (D.IDPLANOPREV = PL.IDPLANOPREV(+))'
      '      AND (D.IDPLANOPREVPREV = PP.IDPLANOPREV(+))'
      '      AND (D.FLGMANUAL <> 4 )'
      '      AND (D.FLGMANUAL <> 1)'
      '      AND (D.CODMANTENEDORA = M.CODMANTENEDORA(+))'
      ''
      '   UNION ALL'
      ''
      '   SELECT'
      
        '      D.MESREFERENCIA, D.MESPROCESSAMENTO AS MESCOBRANCA, D.NUMP' +
        'ROCINSS,'
      '      D.VLRRUBRICA1 AS VALORINSS, D.ESPECIE,D.MATRICULA,'
      '      DECODE(P.FLGDESCONTO,1,'#39'(-)'#39',0,'#39'(+)'#39','#39'(*)'#39' ) AS SINAL,'
      
        '      CODRUBRICA1 AS RUBRICAINSS, SUBSTR(P.DESCRICAO,1,30) AS DE' +
        'SCRRUBRICA, TOTAL.VALOR AS VALOR3,'
      
        '      0 AS VALOR4, 2 AS IDPLANOPREV, '#39'REPLAN'#39' AS ENTIDADECONTABI' +
        'L , D.RMREAJ, D.APREAJ,'
      
        '      '#39'14'#39' AS CODMANTENEDORA, '#39'FUNCEF'#39' AS NOMEMANTENEDORA, 1 AS ' +
        'SEQUENCIAL, D.CODCONCESSORINSS,'
      
        '      D.CODMANTENEDORINSS, 0 AS IDPLANOPREVPREV, '#39' '#39' AS NOMEPLAN' +
        'OPREV'
      '      ,D.CODSINONIMO,D.DTINICIOCRED, D.DTFIMCRED'
      '   FROM'
      '      TEMPCONCINSS D,'
      '      PROVDESC     P,'
      '      RUBRICAXINSS R,'
      ''
      '      ('
      '      SELECT'
      
        '         SUM(DECODE(P.FLGDESCONTO, 0, VLRRUBRICA1, 1, -VLRRUBRIC' +
        'A1, 0)) AS VALOR'
      '      FROM'
      '         TEMPCONCINSS H,'
      '         PROVDESC     P,'
      '         RUBRICAXINSS R'
      '      WHERE'
      '             (H.NUMPROCINSS= :numproc)'
      '         AND ((SUBSTR(H.CODRUBRICA1,2,1) <> '#39'3'#39')'
      '         AND (SUBSTR(H.CODRUBRICA1,2,1) <> '#39'9'#39'))'
      '         AND (TO_NUMBER(H.CODRUBRICA1) = R.RUBRICAINSS(+) )'
      '         AND (R.IDRUBRICA = P.IDPROVENTO(+))'
      '      ) TOTAL'
      ''
      '   WHERE'
      '          (D.NUMPROCINSS= :numproc)'
      '      AND ((SUBSTR(D.CODRUBRICA1,2,1) <> '#39'3'#39')'
      '      AND (SUBSTR(D.CODRUBRICA1,2,1) <> '#39'9'#39'))'
      '      AND (TO_NUMBER(D.CODRUBRICA1) = R.RUBRICAINSS(+) )'
      '      AND (R.IDRUBRICA = P.IDPROVENTO(+))'
      ''
      '   UNION ALL'
      ''
      '   SELECT'
      
        '      D.MESREFERENCIA, D.MESCOBRANCA, D.NUMPROCINSS, D.VALORINSS' +
        ', D.MATRICULA,'
      '      DECODE(P.FLGDESCONTO,1,'#39'(-)'#39',0,'#39'(+)'#39') AS SINAL, D.ESPECIE,'
      
        '      D.RUBRICAINSS,SUBSTR(P.DESCRICAO,1,30) AS DESCRRUBRICA, 0 ' +
        'AS VALOR3, TOTAL.VALOR AS VALOR4,'
      
        '      D.IDPLANOPREV, PL.NOME AS ENTIDADECONTABIL , D.RMREAJ, D.A' +
        'PREAJ,'
      
        '      D.CODMANTENEDORA, NVL(M.NOME,'#39'FUNCEF'#39') AS NOMEMANTENEDORA,' +
        ' D.SEQUENCIAL, D.CODCONCESSORINSS,'
      
        '      D.CODMANTENEDORINSS, D.IDPLANOPREVPREV,  PP.NOME AS NOMEPL' +
        'ANOPREV'
      '      ,D.CODSINONIMO,D.DTINICIOCRED, D.DTFIMCRED'
      '   FROM'
      '      DETCONCINSS D,'
      '      PROVDESC P,'
      '      PLANPREVCONTABIL PL,'
      '      MANTENEDORA M,'
      '      PLANPREV PP,'
      ''
      '      ('
      '      SELECT'
      
        '         DD.NUMPROCINSS, DD.CODMANTENEDORA, DD.MESREFERENCIA, DD' +
        '.SEQUENCIAL'
      '      FROM'
      '         DETCONCINSS DD'
      '      WHERE'
      '             (DD.NUMPROCINSS = :numproc)'
      '         AND ((SUBSTR(DD.RUBRICAINSS,2,1) <>'#39'3'#39')'
      '         AND (SUBSTR(DD.RUBRICAINSS,2,1)<>'#39'9'#39'))'
      '         AND (DD.FLGMANUAL = 3)'
      '      ) DTF3,'
      ''
      '      ('
      '      SELECT'
      
        '         SUM(DECODE(P.FLGDESCONTO, 0, VALORINSS, 1, -VALORINSS, ' +
        '0)) AS VALOR'
      '      FROM'
      '         DETCONCINSS H,'
      '         PROVDESC    P,'
      ''
      '         ('
      '         SELECT'
      
        '            DD.NUMPROCINSS, DD.CODMANTENEDORA, DD.MESREFERENCIA,' +
        ' DD.SEQUENCIAL'
      '         FROM'
      '            DETCONCINSS DD'
      '         WHERE'
      '                (DD.NUMPROCINSS = :numproc)'
      '            AND ((SUBSTR(DD.RUBRICAINSS,2,1) <> '#39'3'#39')'
      '            AND (SUBSTR(DD.RUBRICAINSS,2,1) <> '#39'9'#39'))'
      '            AND (DD.FLGMANUAL = 3)'
      '         ) DETF3'
      ''
      '      WHERE'
      '             (H.NUMPROCINSS= :numproc)'
      '         AND (H.IDRUBRICA = P.IDPROVENTO)'
      '         AND ((SUBSTR(H.RUBRICAINSS,2,1) <> '#39'3'#39')'
      '         AND (SUBSTR(H.RUBRICAINSS,2,1) <> '#39'9'#39'))'
      '         AND (H.FLGMANUAL =  4 )'
      '         AND (H.NUMPROCINSS = DETF3.NUMPROCINSS)'
      '         AND (H.MESREFERENCIA = DETF3.MESREFERENCIA)'
      '         AND (H.SEQUENCIAL+1 = DETF3.SEQUENCIAL)'
      '      ) TOTAL'
      ''
      '   WHERE'
      '          (D.NUMPROCINSS = :numproc)'
      '      AND (D.IDRUBRICA = P.IDPROVENTO)'
      '      AND (D.IDPLANOPREV = PL.IDPLANOPREV(+))'
      '      AND (D.IDPLANOPREVPREV = PL.IDPLANOPREV(+))'
      '      AND ((SUBSTR(D.RUBRICAINSS,2,1) <> '#39'3'#39')'
      '      AND (SUBSTR(D.RUBRICAINSS,2,1) <> '#39'9'#39'))'
      '      AND (D.FLGMANUAL =  4 )'
      '      AND (D.NUMPROCINSS = DTF3.NUMPROCINSS)'
      '      AND (D.MESREFERENCIA = DTF3.MESREFERENCIA)'
      '      AND (D.SEQUENCIAL+1 = DTF3.SEQUENCIAL)'
      '      AND (NVL(D.CODMANTENEDORA,14) = :codmant )'
      '      AND (D.CODMANTENEDORA = M.CODMANTENEDORA(+))'
      ''
      '   UNION ALL'
      ''
      '   SELECT'
      
        '      D.MESREFERENCIA, D.MESCOBRANCA, D.NUMPROCINSS, D.VALORINSS' +
        ', D.MATRICULA,'
      '      DECODE(P.FLGDESCONTO,1,'#39'(-)'#39',0,'#39'(+)'#39') AS SINAL, D.ESPECIE,'
      
        '      D.RUBRICAINSS,SUBSTR(P.DESCRICAO,1,30) AS DESCRRUBRICA, TO' +
        'TAL.VALOR AS VALOR3, 0 AS VALOR4,'
      
        '      D.IDPLANOPREV, PL.NOME AS ENTIDADECONTABIL , D.RMREAJ, D.A' +
        'PREAJ, D.CODMANTENEDORA,'
      
        '      NVL(M.NOME,'#39'FUNCEF'#39') AS NOMEMANTENEDORA, D.SEQUENCIAL, D.C' +
        'ODCONCESSORINSS, D.CODMANTENEDORINSS,'
      '      D.IDPLANOPREVPREV,'
      '      PP.NOME AS NOMEPLANOPREV'
      '      ,D.CODSINONIMO,D.DTINICIOCRED, D.DTFIMCRED'
      '   FROM'
      '      DETCONCINSS       D,'
      '      PROVDESC          P,'
      '      PLANPREVCONTABIL  PL,'
      '      MANTENEDORA       M,'
      '      PLANPREV          PP,'
      ''
      '      ('
      '      SELECT'
      
        '         SUM(DECODE(P.FLGDESCONTO, 0, VALORINSS, 1, -VALORINSS, ' +
        '0)) AS VALOR'
      '      FROM'
      '         DETCONCINSS H,'
      '         PROVDESC    P'
      '      WHERE'
      '             (H.NUMPROCINSS= :numproc)'
      '         AND (H.IDRUBRICA = P.IDPROVENTO)'
      '         AND ((H.FLGMANUAL = 1)'
      
        '         AND ((H.CODMANTENEDORA IS NULL ) OR (H.CODMANTENEDORA=1' +
        '4)))'
      '      ) TOTAL'
      ''
      '   WHERE'
      '          (D.NUMPROCINSS = :numproc)'
      '      AND (D.IDRUBRICA = P.IDPROVENTO)'
      '      AND (D.IDPLANOPREV = PL.IDPLANOPREV(+))'
      '      AND (D.IDPLANOPREVPREV = PP.IDPLANOPREV(+))'
      '      AND ('
      '              (D.FLGMANUAL = 1 )'
      '          AND ('
      '                  (D.CODMANTENEDORA IS NULL )'
      '              OR  (D.CODMANTENEDORA = 14)'
      '              )'
      '          )'
      '      AND (D.CODMANTENEDORA = M.CODMANTENEDORA(+))'
      '   )'
      ''
      'ORDER BY'
      '   MESCOBRANCA DESC')
    PictureMasks.Strings = (
      'MES'#9'999,999,999.99'#9'T'#9'T')
    ValidateWithMask = True
    Left = 456
    Top = 296
    ParamData = <
      item
        DataType = ftInteger
        Name = 'numproc'
        ParamType = ptUnknown
        Value = '123456'
      end
      item
        DataType = ftInteger
        Name = 'numproc'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'numproc'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'numproc'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'numproc'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'numproc'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'numproc'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'numproc'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'codmant'
        ParamType = ptUnknown
        Value = 14
      end
      item
        DataType = ftInteger
        Name = 'numproc'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'numproc'
        ParamType = ptUnknown
      end>
    object qryReembolsoMESCOBRANCA: TStringField
      DisplayLabel = 'Cobrança'
      DisplayWidth = 7
      FieldName = 'MESCOBRANCA'
      FixedChar = True
      Size = 7
    end
    object qryReembolsoRUBRICAINSS: TFloatField
      DisplayLabel = 'Rubrica'
      DisplayWidth = 6
      FieldName = 'RUBRICAINSS'
    end
    object qryReembolsoVALORINSS: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 12
      FieldName = 'VALORINSS'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object qryReembolsoSINAL: TStringField
      DisplayLabel = 'Sinal'
      DisplayWidth = 4
      FieldName = 'SINAL'
      Size = 3
    end
    object qryReembolsoDESCRRUBRICA: TStringField
      DisplayLabel = 'Descrição da Rubrica'
      DisplayWidth = 37
      FieldName = 'DESCRRUBRICA'
      Size = 40
    end
    object qryReembolsoIDPLANOPREV: TFloatField
      DisplayLabel = 'Código~da Entidade'
      DisplayWidth = 10
      FieldName = 'IDPLANOPREV'
    end
    object qryReembolsoENTIDADECONTABIL: TStringField
      DisplayLabel = 'Entidade Contábil'
      DisplayWidth = 23
      FieldName = 'ENTIDADECONTABIL'
      Size = 50
    end
    object qryReembolsoIDPLANOPREVPREV: TFloatField
      DisplayLabel = 'Código do~Plano'
      DisplayWidth = 10
      FieldName = 'IDPLANOPREVPREV'
    end
    object qryReembolsoNOMEPLANOPREV: TStringField
      DisplayLabel = 'Plano Previdenciário'
      DisplayWidth = 28
      FieldName = 'NOMEPLANOPREV'
      Size = 50
    end
    object qryReembolsoCODMANTENEDORA: TStringField
      DisplayLabel = 'Código~Mantenedora'
      DisplayWidth = 10
      FieldName = 'CODMANTENEDORA'
      Size = 10
    end
    object qryReembolsoMESREFERENCIA: TStringField
      DisplayLabel = 'Referência'
      DisplayWidth = 8
      FieldName = 'MESREFERENCIA'
      FixedChar = True
      Size = 7
    end
    object qryReembolsoRMREAJ: TFloatField
      DisplayWidth = 10
      FieldName = 'RMREAJ'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object qryReembolsoAPREAJ: TFloatField
      DisplayWidth = 10
      FieldName = 'APREAJ'
      DisplayFormat = ',0.00'
    end
    object qryReembolsoCODCONCESSORINSS: TStringField
      DisplayLabel = 'OL Concessor'
      DisplayWidth = 11
      FieldName = 'CODCONCESSORINSS'
      Size = 10
    end
    object qryReembolsoCODMANTENEDORINSS: TStringField
      DisplayLabel = 'OL Mantenedor'
      DisplayWidth = 13
      FieldName = 'CODMANTENEDORINSS'
      Size = 10
    end
    object qryReembolsoNOMEMANTENEDORA: TStringField
      DisplayLabel = 'Mantenedora'
      DisplayWidth = 60
      FieldName = 'NOMEMANTENEDORA'
      Size = 60
    end
    object qryReembolsoCODSINONIMO: TFloatField
      DisplayLabel = 'Código Sinônimo'
      DisplayWidth = 10
      FieldName = 'CODSINONIMO'
    end
    object qryReembolsoDTINICIOCRED: TDateTimeField
      DisplayLabel = 'Data Inicio Crédito'
      DisplayWidth = 18
      FieldName = 'DTINICIOCRED'
    end
    object qryReembolsoDTFIMCRED: TDateTimeField
      DisplayLabel = 'Data Fim Crédito'
      DisplayWidth = 18
      FieldName = 'DTFIMCRED'
    end
    object qryReembolsoNUMPROCINSS: TStringField
      DisplayWidth = 15
      FieldName = 'NUMPROCINSS'
      Visible = False
      Size = 15
    end
    object qryReembolsoESPECIE: TStringField
      DisplayWidth = 6
      FieldName = 'ESPECIE'
      Visible = False
      Size = 6
    end
    object qryReembolsoVALOR3: TFloatField
      DisplayWidth = 10
      FieldName = 'VALOR3'
      Visible = False
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object qryReembolsoVALOR4: TFloatField
      DisplayWidth = 10
      FieldName = 'VALOR4'
      Visible = False
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object qryReembolsoMATRICULA: TStringField
      DisplayWidth = 13
      FieldName = 'MATRICULA'
      Visible = False
      Size = 13
    end
    object qryReembolsoSEQUENCIAL: TFloatField
      DisplayWidth = 10
      FieldName = 'SEQUENCIAL'
      Visible = False
    end
  end
  object dsBeneficiario: TwwDataSource
    DataSet = qryBeneficiario
    Left = 384
    Top = 192
  end
  object dsGlosa: TwwDataSource
    DataSet = qryGlosaExtrato
    Left = 512
    Top = 240
  end
  object qryGlosaExtrato: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT SUM(VLRGLOSA) AS VLRGLOSA'
      
        'FROM (SELECT SUM(DECODE(SUBSTR(RUBRICAINSS, 2, 1), 1, -D.VALORIN' +
        'SS, D.VALORINSS)) AS VLRGLOSA'
      '  FROM DETCONCINSS D'
      ' WHERE (D.NUMPROCINSS = :numproc)'
      
        '   AND ((D.MESCOBRANCA >= :mescob) AND (D.MESCOBRANCA <= :MESCOB' +
        'FIM))'
      '      '
      '   AND ((SUBSTR(D.RUBRICAINSS, 1, 1) = '#39'9'#39') AND'
      '       (SUBSTR(D.RUBRICAINSS, 2, 1) <> '#39'9'#39') AND'
      '       (SUBSTR(D.RUBRICAINSS, 2, 1) <> '#39'3'#39'))'
      '      '
      
        '   AND ((:PMANTENEDORAFUND = 0) OR ((:PMANTENEDORAFUND = 1) AND ' +
        '(D.CODMANTENEDORA IS NULL OR'
      '       D.CODMANTENEDORA IN (6, 14, 99))))'
      'UNION'
      'SELECT SUM(DECODE(SUBSTR(CODRUBRICA1, 2, 1),'
      '                  1,'
      '                  -D.VLRRUBRICA1,'
      '                  D.VLRRUBRICA1)) AS VLRGLOSA'
      '  FROM TEMPCONCINSS D'
      ' WHERE (D.NUMPROCINSS = :numproc)'
      '   AND ((D.MESPROCESSAMENTO >= :mescob) AND'
      '       (D.MESPROCESSAMENTO <= :MESCOBFIM))'
      '   AND ((SUBSTR(D.CODRUBRICA1, 1, 1) = '#39'9'#39') AND'
      '       (SUBSTR(D.CODRUBRICA1, 2, 1) <> '#39'9'#39') AND'
      '       (SUBSTR(D.CODRUBRICA1, 2, 1) <> '#39'3'#39')'
      '))')
    PictureMasks.Strings = (
      'MES'#9'999,999,999.99'#9'T'#9'T')
    ValidateWithMask = True
    Left = 512
    Top = 176
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'numproc'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'mescob'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'MESCOBFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PMANTENEDORAFUND'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PMANTENEDORAFUND'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'numproc'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'mescob'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'MESCOBFIM'
        ParamType = ptUnknown
      end>
    object qryGlosaExtratoVLRGLOSA: TFloatField
      FieldName = 'VLRGLOSA'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
  end
  object qryMatricula: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '  BF.IDPESSOA, DP.MATRICULA, P.NOME'
      ''
      'FROM'
      '  BENEFBFCIARIO BF,'
      '  PESSOA        P,'
      '  DEPENTIT      DP,'
      '  BENEFPLANPREV BP,'
      '  BENEFICIO     B'
      ''
      'WHERE'
      '      BF.NUMPROCINSS      = :NUMPROC'
      '  AND BF.IDPESSOA         = P.IDPESSOA(+)'
      '  AND BF.IDBENEFICIO      = B.IDBENEFICIO(+)'
      '  AND BF.IDBENEFICIO      = BP.IDBENEFICIO(+)'
      '  AND BF.IDPLANOPREV      = BP.IDPLANOPREV(+)'
      '  AND BP.FLGREFERENCIA(+) = 1'
      '  AND BF.IDPESSOA         = DP.IDPESSOA(+)'
      '  AND BF.IDTITULAR        = DP.IDTITULAR(+)'
      ''
      'ORDER BY'
      '  BF.IDPESSOA')
    PictureMasks.Strings = (
      'MES'#9'999,999,999.99'#9'T'#9'T')
    ValidateWithMask = True
    Left = 552
    Top = 184
    ParamData = <
      item
        DataType = ftString
        Name = 'NUMPROC'
        ParamType = ptInput
      end>
  end
  object dsMatricula: TwwDataSource
    DataSet = qryMatricula
    Left = 656
    Top = 168
  end
  object qryDIB: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT MIN(DIB) AS DIB '
      'FROM DETCONCINSS D'
      'WHERE (D.NUMPROCINSS  = :NUMPROC)          AND'
      '           (D.DIB IS NOT NULL)                  AND'
      '           (TO_CHAR(DIB,'#39'YYYY'#39') > '#39'1970'#39')'
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    PictureMasks.Strings = (
      'MES'#9'999,999,999.99'#9'T'#9'T')
    ValidateWithMask = True
    Left = 448
    Top = 192
    ParamData = <
      item
        DataType = ftFloat
        Name = 'NUMPROC'
        ParamType = ptUnknown
        Value = '1218161229'
      end>
  end
  object dsDIB: TwwDataSource
    DataSet = qryDIB
    Left = 448
    Top = 176
  end
  object qryMantenedora: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT NVL(M.CODMANTENEDORA,'#39'14'#39') AS CODMANTENEDORA,'
      '                NVL(M.NOME,'#39'FUNCEF'#39') AS NOMEMANTENEDORA'
      'FROM DETCONCINSS D, MANTENEDORA M'
      'WHERE (D.NUMPROCINSS  = :NUMPROC) AND'
      '      (D.FLGMANUAL = 0)           AND'
      '      (D.CODMANTENEDORA = M.CODMANTENEDORA(+))'
      'UNION ALL'
      'SELECT DISTINCT '#39'999'#39' AS CODMANTENEDORA,'
      '                '#39'NÃO IDENTIFICADO'#39' AS NOMEMANTENEDORA'
      'FROM TEMPCONCINSS D'
      'WHERE (D.NUMPROCINSS  = :NUMPROC) AND'
      '      (D.FLGMANUAL = 0)           '
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' ')
    PictureMasks.Strings = (
      'MES'#9'999,999,999.99'#9'T'#9'T')
    ValidateWithMask = True
    Left = 296
    Top = 192
    ParamData = <
      item
        DataType = ftFloat
        Name = 'NUMPROC'
        ParamType = ptUnknown
        Value = '1218161229'
      end
      item
        DataType = ftFloat
        Name = 'NUMPROC'
        ParamType = ptUnknown
      end>
  end
  object dsMantenedora: TwwDataSource
    DataSet = qryMantenedora
    Left = 296
    Top = 176
  end
  object qryTotReembolso: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   SUM(DECODE(P.FLGDESCONTO,0,VALORINSS,1,-VALORINSS,0)) AS VALO' +
        'R'
      'FROM'
      '   DETCONCINSS H,'
      '   PROVDESC    P'
      'WHERE'
      '       (H.NUMPROCINSS                  =:numproc)'
      '   AND ((SUBSTR(H.RUBRICAINSS, 2, 1)  <> '#39'3'#39')'
      '   AND (SUBSTR(H.RUBRICAINSS, 2, 1)   <> '#39'9'#39'))'
      '   AND (H.IDRUBRICA                    = P.IDPROVENTO)'
      '   AND (H.FLGMANUAL                   <> 4)'
      '   AND (H.FLGMANUAL                   <> 1)'
      '   AND (H.FLGMANUAL                   <> 2)'
      ''
      'UNION ALL'
      ''
      'SELECT'
      
        '   SUM(DECODE(P.FLGDESCONTO, 0, VLRRUBRICA1, 1, -VLRRUBRICA1, 0)' +
        ') AS VALOR'
      'FROM'
      '   TEMPCONCINSS H,'
      '   PROVDESC     P,'
      '   RUBRICAXINSS R'
      'WHERE'
      '       (H.NUMPROCINSS                  =:numproc)'
      '   AND ((SUBSTR(H.CODRUBRICA1, 2, 1)  <> '#39'3'#39')'
      '   AND (SUBSTR(H.CODRUBRICA1, 2, 1)   <> '#39'9'#39'))'
      '   AND (TO_NUMBER(H.CODRUBRICA1)       = R.RUBRICAINSS(+))'
      '   AND (R.IDRUBRICA                    = P.IDPROVENTO(+))'
      ''
      'UNION ALL'
      ''
      'SELECT'
      
        '   SUM(DECODE(P.FLGDESCONTO, 0, VALORINSS, 1, -VALORINSS, 0)) AS' +
        ' VALOR'
      'FROM'
      '   DETCONCINSS H,'
      '   PROVDESC    P,'
      '   ('
      '   SELECT'
      
        '      DD.NUMPROCINSS, DD.CODMANTENEDORA, DD.MESREFERENCIA, DD.SE' +
        'QUENCIAL'
      '   FROM'
      '      DETCONCINSS DD'
      '   WHERE'
      '          (DD.NUMPROCINSS                 =:numproc)'
      '      AND ((SUBSTR(DD.RUBRICAINSS, 2, 1) <> '#39'3'#39')'
      '      AND (SUBSTR(DD.RUBRICAINSS, 2, 1)  <> '#39'9'#39'))'
      '      AND (DD.FLGMANUAL                   = 3)'
      '   ) DETF3'
      'WHERE'
      '       (H.NUMPROCINSS               =:numproc)'
      '   AND (H.IDRUBRICA                 = P.IDPROVENTO)'
      '   AND ((SUBSTR(H.RUBRICAINSS,2,1) <> '#39'3'#39')'
      '   AND (SUBSTR(H.RUBRICAINSS,2,1)  <> '#39'9'#39'))'
      '   AND (H.FLGMANUAL                 =  4 )'
      '   AND (H.NUMPROCINSS               = DETF3.NUMPROCINSS)'
      '   AND (NVL(H.CODMANTENEDORA, 14)   =:codmant )'
      '   AND (H.MESREFERENCIA             = DETF3.MESREFERENCIA)'
      '   AND (H.SEQUENCIAL + 1            = DETF3.SEQUENCIAL)'
      ''
      'UNION ALL'
      ''
      'SELECT'
      
        '   SUM(DECODE(P.FLGDESCONTO, 0, VALORINSS, 1, -VALORINSS, 0)) AS' +
        ' VALOR'
      'FROM'
      '   DETCONCINSS H,'
      '   PROVDESC    P'
      'WHERE'
      '       (H.NUMPROCINSS   = :numproc)'
      '   AND (H.IDRUBRICA     = P.IDPROVENTO)'
      '   AND ('
      '           ((H.FLGMANUAL      = 1) OR (H.FLGMANUAL = 2))'
      
        '       AND ((H.CODMANTENEDORA IS NULL ) OR (H.CODMANTENEDORA = 1' +
        '4))'
      '       )')
    PictureMasks.Strings = (
      'MES'#9'999,999,999.99'#9'T'#9'T')
    ValidateWithMask = True
    Left = 120
    Top = 192
    ParamData = <
      item
        DataType = ftString
        Name = 'numproc'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'numproc'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'numproc'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'numproc'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'codmant'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'numproc'
        ParamType = ptInput
      end>
    object qryTotReembolsoVALOR: TFloatField
      FieldName = 'VALOR'
    end
  end
  object dsTotReembolso: TDataSource
    DataSet = qryTotReembolso
    Left = 120
    Top = 176
  end
  object qryBeneficiario: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT BF.IDPESSOA'
      '      ,BF.NUMPROCINSS'
      '      ,NVL(PES.NOME,BF.NOME) NOME'
      '      ,DP.MATRICULA'
      '      ,B.NOME AS NOMEBENEFICIO'
      '      ,NVL(B.CODBENEFICIO,BF.ESPECIE) AS ESPECIE'
      '      ,PPC.NOME AS PLANOCONTABIL'
      '      ,BF.IDPLANOPREV'
      '      ,NVL(BF.NOMEPLANOPREV,PP.NOME) AS NOMEPLANOPREV'
      '      ,BF.IDSITBENEFICIO'
      '      ,BF.DATAFINAL'
      
        '      ,P.idperfilinvest ||'#39' - '#39'|| P.nome PERFINV         /*SIG58' +
        '556*/'
      '  FROM PLANPREV PP'
      '      ,BENEFICIO B'
      '      ,('
      '        SELECT 1 AS ORDEM'
      '              ,B.IDPESSOA'
      '              ,B.IDPLANOPREV'
      '              ,B.IDSITBENEFICIO'
      '              ,B.NUMPROCINSS'
      '              ,B.DATAFINAL'
      '              ,B.IDBENEFICIO'
      '              ,B.IDPLANPREVCONTAB'
      '              ,NULL               NOME'
      '              ,NULL               ESPECIE'
      '              ,NULL               NOMEPLANOPREV'
      
        '              ,NULL               PERFINV                /*SIG58' +
        '556*/'
      '          FROM BENEFBFCIARIO B'
      '         WHERE B.NUMPROCINSS = :numproc'
      '               AND B.FONTEPAGADORA = 2'
      '               AND (B.IDSITBENEFICIO = 1 OR'
      '               (B.IDSITBENEFICIO <> 1 AND NOT EXISTS'
      '                (SELECT 1'
      '                        FROM BENEFBFCIARIO B1'
      '                       WHERE B1.NUMPROCINSS = :numproc'
      '                             AND B1.IDPESSOA = B.IDPESSOA'
      '                             AND B1.IDTITULAR = B.IDTITULAR'
      '                             AND B1.IDSITBENEFICIO = 1) AND'
      '                B.DATAFINAL ='
      '                (SELECT MAX(B1.DATAFINAL)'
      '                        FROM BENEFBFCIARIO B1'
      '                       WHERE B1.NUMPROCINSS = :numproc'
      '                             AND B1.IDPESSOA = B.IDPESSOA'
      '                             AND B1.IDTITULAR = B.IDTITULAR)))'
      '        UNION ALL'
      '        SELECT *'
      '          FROM (SELECT 2 AS ORDEM'
      '                      ,D.IDPESSOA'
      '                      /*SIG64241*/'
      '                      /*,D.IDPLANOPREV*/'
      '                      ,D.IDPLANOPREVPREV IDPLANOPREV'
      '                      /*SIG64241*/'
      '                      ,NULL          IDSITBENEFICIO'
      '                      ,D.NUMPROCINSS'
      '                      ,NULL          DATAFINAL'
      '                      ,D.IDBENEFICIO'
      '                      ,D.IDPLANOPREV IDPLANPREVCONTAB'
      '                      ,D.NOME'
      '                      ,D.ESPECIE'
      '                      ,NULL          NOMOEPLANOPREV'
      
        '                      ,NULL          PERFINV             /*SIG58' +
        '556*/'
      '                  FROM DETCONCINSS D'
      '                 WHERE D.NUMPROCINSS = :numproc'
      '                       AND NOT EXISTS'
      '                 (SELECT 1'
      '                          FROM BENEFBFCIARIO B'
      '                         WHERE B.NUMPROCINSS = :numproc'
      '                               AND B.FONTEPAGADORA = 2'
      '                               AND B.IDPESSOA = D.IDPESSOA)'
      '                 ORDER BY D.IDPESSOA)'
      '         WHERE ROWNUM = 1'
      '        UNION ALL'
      '        SELECT *'
      '          FROM (SELECT 3 AS ORDEM'
      '                      ,D.IDPESSOA'
      '                      ,2 IDPLANOPREV'
      '                      ,NULL IDSITBENEFICIO'
      '                      ,D.NUMPROCINSS'
      '                      ,NULL DATAFINAL'
      '                      ,NULL IDBENEFICIO'
      '                      ,2 IDPLANPREVCONTAB'
      '                      ,D.NOME'
      '                      ,D.ESPECIE'
      '                      ,'#39'  '#39' NOMEPLANOPREV'
      
        '                      ,'#39#39' PERFINV                        /*SIG58' +
        '556*/'
      '                  FROM TEMPCONCINSS D'
      '                 WHERE D.NUMPROCINSS = :numproc'
      '                       AND (NOT EXISTS (SELECT 1'
      '                                          FROM BENEFBFCIARIO B'
      
        '                                         WHERE B.NUMPROCINSS = :' +
        'numproc'
      
        '                                               AND B.FONTEPAGADO' +
        'RA = 2) AND'
      '                        NOT EXISTS'
      '                        (SELECT 1'
      '                               FROM DETCONCINSS B'
      '                              WHERE B.NUMPROCINSS = :numproc))'
      '                 ORDER BY D.IDPESSOA)'
      '         WHERE ROWNUM = 1'
      '         ) BF'
      '      ,(SELECT DISTINCT IDPLANOPREV'
      '                       ,IDBENEFICIO'
      '          FROM BENEFPLANPREV'
      '         WHERE FLGREFERENCIA = 1) BPP'
      '      ,PESSOA PES'
      '      ,DEPENTIT DP'
      '      ,PLANPREVCONTABIL PPC'
      
        '      ,perfilinvest P                                    /*SIG58' +
        '556*/'
      'WHERE BF.NUMPROCINSS = :numproc'
      '      /*SIG64241*/'
      
        '      /*AND BF.IDPLANOPREV = P.IDPLANOPREV               /*SIG58' +
        '556*/'
      '      AND BF.IDPLANPREVCONTAB = P.IDPLANPREVCONTAB'
      '      /*SIG64241*/'
      
        '       AND (BF.IDSITBENEFICIO = 1 OR BF.IDSITBENEFICIO IS NULL O' +
        'R'
      '       BF.DATAFINAL ='
      '       (SELECT MAX(BFC.DATAFINAL)'
      '               FROM BENEFBFCIARIO BFC'
      '                   ,BENEFPLANPREV BPPP'
      '              WHERE BFC.NUMPROCINSS = :numproc'
      '                    AND BPPP.IDPLANOPREV = BFC.IDPLANOPREV'
      '                    AND BPPP.FLGREFERENCIA = 1'
      '                    AND BFC.IDBENEFICIO = BPPP.IDBENEFICIO))'
      '       AND BF.IDPLANOPREV = BPP.IDPLANOPREV(+)'
      '       AND BF.IDBENEFICIO = BPP.IDBENEFICIO(+)'
      '       AND BF.IDPESSOA = PES.IDPESSOA(+)'
      '       AND BF.IDPESSOA = DP.IDPESSOA(+)'
      '       AND BF.IDBENEFICIO = B.IDBENEFICIO(+)'
      '       AND BF.IDPLANOPREV = PP.IDPLANOPREV(+)'
      '       AND BF.IDPLANOPREV = PPC.IDPLANOPREVPREV(+)'
      '       AND BF.IDPLANPREVCONTAB = PPC.IDPLANOPREV(+)'
      'ORDER BY ORDEM'
      ' '
      ' ')
    PictureMasks.Strings = (
      'MES'#9'999,999,999.99'#9'T'#9'T')
    ValidateWithMask = True
    Left = 384
    Top = 136
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'numproc'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'numproc'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'numproc'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'numproc'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'numproc'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'numproc'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'numproc'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'numproc'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'numproc'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'numproc'
        ParamType = ptUnknown
      end>
  end
  object qrySemPlano: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      ''
      '   '
      '   SELECT'
      
        '   MESREFERENCIA, MESCOBRANCA, NUMPROCINSS, VALORINSS, MATRICULA' +
        ','
      '   SINAL, ESPECIE, RUBRICAINSS, DESCRRUBRICA, VALOR3, VALOR4,'
      '   IDPLANOPREV, ENTIDADECONTABIL, RMREAJ, APREAJ,'
      
        '   CODMANTENEDORA, NOMEMANTENEDORA, SEQUENCIAL, CODCONCESSORINSS' +
        ','
      '   CODMANTENEDORINSS, IDPLANOPREVPREV, NOMEPLANOPREV'
      '   ,CODSINONIMO,DTINICIOCRED, DTFIMCRED'
      'FROM'
      '   ('
      '   SELECT'
      
        '      D.MESREFERENCIA, D.MESCOBRANCA, D.NUMPROCINSS, D.VALORINSS' +
        ', D.MATRICULA,'
      '      DECODE(P.FLGDESCONTO,1,'#39'(-)'#39',0,'#39'(+)'#39') AS SINAL, D.ESPECIE,'
      
        '      D.RUBRICAINSS,SUBSTR(P.DESCRICAO,1,30) AS DESCRRUBRICA, TO' +
        'TAL.VALOR AS VALOR3, 0 AS VALOR4,'
      
        '      D.IDPLANOPREV, PL.NOME AS ENTIDADECONTABIL , D.RMREAJ, D.A' +
        'PREAJ, D.CODMANTENEDORA ,'
      
        '      NVL(M.NOME,'#39'FUNCEF'#39') AS NOMEMANTENEDORA, D.SEQUENCIAL, D.C' +
        'ODCONCESSORINSS, D.CODMANTENEDORINSS,'
      '      D.IDPLANOPREVPREV,'
      '      PP.NOME AS NOMEPLANOPREV'
      '      ,D.CODSINONIMO,D.DTINICIOCRED, D.DTFIMCRED'
      '   FROM'
      '      DETCONCINSS       D,'
      '      PROVDESC          P,'
      '      PLANPREVCONTABIL  PL,'
      '      MANTENEDORA       M,'
      '      PLANPREV          PP,'
      ''
      '      ('
      '      SELECT'
      
        '         SUM(DECODE(P.FLGDESCONTO,0,VALORINSS,1,-VALORINSS,0)) A' +
        'S VALOR'
      '      FROM'
      '         DETCONCINSS H,'
      '         PROVDESC    P'
      '      WHERE'
      '             (H.NUMPROCINSS= :numproc)'
      '         AND ((SUBSTR(H.RUBRICAINSS,2,1) <> '#39'3'#39')'
      '         AND (SUBSTR(H.RUBRICAINSS,2,1) <> '#39'9'#39'))'
      '         AND (H.IDRUBRICA = P.IDPROVENTO)'
      '         AND (H.FLGMANUAL <> 4 )'
      '         AND (H.FLGMANUAL <> 1)'
      '      ) TOTAL'
      ''
      '   WHERE'
      '          (D.NUMPROCINSS = :numproc)'
      '      AND ((SUBSTR(D.RUBRICAINSS,2,1) <> '#39'3'#39')'
      '      AND (SUBSTR(D.RUBRICAINSS,2,1) <> '#39'9'#39'))'
      '      AND (D.IDRUBRICA = P.IDPROVENTO)'
      '      AND (D.IDPLANOPREV = PL.IDPLANOPREV(+))'
      '      AND (D.IDPLANOPREVPREV = PP.IDPLANOPREV(+))'
      '      AND (D.FLGMANUAL <> 4 )'
      '      AND (D.FLGMANUAL <> 1)'
      '      AND (D.CODMANTENEDORA = M.CODMANTENEDORA(+))'
      ''
      '   UNION ALL'
      ''
      '   SELECT'
      
        '      D.MESREFERENCIA, D.MESPROCESSAMENTO AS MESCOBRANCA, D.NUMP' +
        'ROCINSS,'
      '      D.VLRRUBRICA1 AS VALORINSS, D.ESPECIE,D.MATRICULA,'
      '      DECODE(P.FLGDESCONTO,1,'#39'(-)'#39',0,'#39'(+)'#39','#39'(*)'#39' ) AS SINAL,'
      
        '      CODRUBRICA1 AS RUBRICAINSS, SUBSTR(P.DESCRICAO,1,30) AS DE' +
        'SCRRUBRICA, TOTAL.VALOR AS VALOR3,'
      
        '      0 AS VALOR4, 2 AS IDPLANOPREV, '#39'REPLAN'#39' AS ENTIDADECONTABI' +
        'L , D.RMREAJ, D.APREAJ,'
      
        '      '#39'14'#39' AS CODMANTENEDORA, '#39'FUNCEF'#39' AS NOMEMANTENEDORA, 1 AS ' +
        'SEQUENCIAL, D.CODCONCESSORINSS,'
      
        '      D.CODMANTENEDORINSS, 0 AS IDPLANOPREVPREV, '#39' '#39' AS NOMEPLAN' +
        'OPREV'
      '      ,D.CODSINONIMO,D.DTINICIOCRED, D.DTFIMCRED'
      '   FROM'
      '      TEMPCONCINSS D,'
      '      PROVDESC     P,'
      '      RUBRICAXINSS R,'
      ''
      '      ('
      '      SELECT'
      
        '         SUM(DECODE(P.FLGDESCONTO, 0, VLRRUBRICA1, 1, -VLRRUBRIC' +
        'A1, 0)) AS VALOR'
      '      FROM'
      '         TEMPCONCINSS H,'
      '         PROVDESC     P,'
      '         RUBRICAXINSS R'
      '      WHERE'
      '             (H.NUMPROCINSS= :numproc)'
      '         AND ((SUBSTR(H.CODRUBRICA1,2,1) <> '#39'3'#39')'
      '         AND (SUBSTR(H.CODRUBRICA1,2,1) <> '#39'9'#39'))'
      '         AND (TO_NUMBER(H.CODRUBRICA1) = R.RUBRICAINSS(+) )'
      '         AND (R.IDRUBRICA = P.IDPROVENTO(+))'
      '      ) TOTAL'
      ''
      '   WHERE'
      '          (D.NUMPROCINSS= :numproc)'
      '      AND ((SUBSTR(D.CODRUBRICA1,2,1) <> '#39'3'#39')'
      '      AND (SUBSTR(D.CODRUBRICA1,2,1) <> '#39'9'#39'))'
      '      AND (TO_NUMBER(D.CODRUBRICA1) = R.RUBRICAINSS(+) )'
      '      AND (R.IDRUBRICA = P.IDPROVENTO(+))'
      ''
      '   UNION ALL'
      ''
      '   SELECT'
      
        '      D.MESREFERENCIA, D.MESCOBRANCA, D.NUMPROCINSS, D.VALORINSS' +
        ', D.MATRICULA,'
      '      DECODE(P.FLGDESCONTO,1,'#39'(-)'#39',0,'#39'(+)'#39') AS SINAL, D.ESPECIE,'
      
        '      D.RUBRICAINSS,SUBSTR(P.DESCRICAO,1,30) AS DESCRRUBRICA, 0 ' +
        'AS VALOR3, TOTAL.VALOR AS VALOR4,'
      
        '      D.IDPLANOPREV, PL.NOME AS ENTIDADECONTABIL , D.RMREAJ, D.A' +
        'PREAJ,'
      
        '      D.CODMANTENEDORA, NVL(M.NOME,'#39'FUNCEF'#39') AS NOMEMANTENEDORA,' +
        ' D.SEQUENCIAL, D.CODCONCESSORINSS,'
      
        '      D.CODMANTENEDORINSS, D.IDPLANOPREVPREV,  PP.NOME AS NOMEPL' +
        'ANOPREV'
      '     ,D.CODSINONIMO,D.DTINICIOCRED, D.DTFIMCRED'
      '   FROM'
      '      DETCONCINSS D,'
      '      PROVDESC P,'
      '      PLANPREVCONTABIL PL,'
      '      MANTENEDORA M,'
      '      PLANPREV PP,'
      ''
      '      ('
      '      SELECT'
      
        '         DD.NUMPROCINSS, DD.CODMANTENEDORA, DD.MESREFERENCIA, DD' +
        '.SEQUENCIAL'
      '      FROM'
      '         DETCONCINSS DD'
      '      WHERE'
      '             (DD.NUMPROCINSS = :numproc)'
      '         AND ((SUBSTR(DD.RUBRICAINSS,2,1) <>'#39'3'#39')'
      '         AND (SUBSTR(DD.RUBRICAINSS,2,1)<>'#39'9'#39'))'
      '         AND (DD.FLGMANUAL = 3)'
      '      ) DTF3,'
      ''
      '      ('
      '      SELECT'
      
        '         SUM(DECODE(P.FLGDESCONTO, 0, VALORINSS, 1, -VALORINSS, ' +
        '0)) AS VALOR'
      '      FROM'
      '         DETCONCINSS H,'
      '         PROVDESC    P,'
      ''
      '         ('
      '         SELECT'
      
        '            DD.NUMPROCINSS, DD.CODMANTENEDORA, DD.MESREFERENCIA,' +
        ' DD.SEQUENCIAL'
      '         FROM'
      '            DETCONCINSS DD'
      '         WHERE'
      '                (DD.NUMPROCINSS = :numproc)'
      '            AND ((SUBSTR(DD.RUBRICAINSS,2,1) <> '#39'3'#39')'
      '            AND (SUBSTR(DD.RUBRICAINSS,2,1) <> '#39'9'#39'))'
      '            AND (DD.FLGMANUAL = 3)'
      '         ) DETF3'
      ''
      '      WHERE'
      '             (H.NUMPROCINSS= :numproc)'
      '         AND (H.IDRUBRICA = P.IDPROVENTO)'
      '         AND ((SUBSTR(H.RUBRICAINSS,2,1) <> '#39'3'#39')'
      '         AND (SUBSTR(H.RUBRICAINSS,2,1) <> '#39'9'#39'))'
      '         AND (H.FLGMANUAL =  4 )'
      '         AND (H.NUMPROCINSS = DETF3.NUMPROCINSS)'
      '         AND (H.MESREFERENCIA = DETF3.MESREFERENCIA)'
      '         AND (H.SEQUENCIAL+1 = DETF3.SEQUENCIAL)'
      '      ) TOTAL'
      ''
      '   WHERE'
      '          (D.NUMPROCINSS = :numproc)'
      '      AND (D.IDRUBRICA = P.IDPROVENTO)'
      '      AND (D.IDPLANOPREV = PL.IDPLANOPREV(+))'
      '      AND (D.IDPLANOPREVPREV = PL.IDPLANOPREV(+))'
      '      AND ((SUBSTR(D.RUBRICAINSS,2,1) <> '#39'3'#39')'
      '      AND (SUBSTR(D.RUBRICAINSS,2,1) <> '#39'9'#39'))'
      '      AND (D.FLGMANUAL =  4 )'
      '      AND (D.NUMPROCINSS = DTF3.NUMPROCINSS)'
      '      AND (D.MESREFERENCIA = DTF3.MESREFERENCIA)'
      '      AND (D.SEQUENCIAL+1 = DTF3.SEQUENCIAL)'
      '      AND (NVL(D.CODMANTENEDORA,14) = :codmant )'
      '      AND (D.CODMANTENEDORA = M.CODMANTENEDORA(+))'
      ''
      '   UNION ALL'
      ''
      '   SELECT'
      
        '      D.MESREFERENCIA, D.MESCOBRANCA, D.NUMPROCINSS, D.VALORINSS' +
        ', D.MATRICULA,'
      '      DECODE(P.FLGDESCONTO,1,'#39'(-)'#39',0,'#39'(+)'#39') AS SINAL, D.ESPECIE,'
      
        '      D.RUBRICAINSS,SUBSTR(P.DESCRICAO,1,30) AS DESCRRUBRICA, TO' +
        'TAL.VALOR AS VALOR3, 0 AS VALOR4,'
      
        '      D.IDPLANOPREV, PL.NOME AS ENTIDADECONTABIL , D.RMREAJ, D.A' +
        'PREAJ, D.CODMANTENEDORA,'
      
        '      NVL(M.NOME,'#39'FUNCEF'#39') AS NOMEMANTENEDORA, D.SEQUENCIAL, D.C' +
        'ODCONCESSORINSS, D.CODMANTENEDORINSS,'
      '      D.IDPLANOPREVPREV,'
      '      PP.NOME AS NOMEPLANOPREV'
      '      ,D.CODSINONIMO,D.DTINICIOCRED, D.DTFIMCRED'
      '   FROM'
      '      DETCONCINSS       D,'
      '      PROVDESC          P,'
      '      PLANPREVCONTABIL  PL,'
      '      MANTENEDORA       M,'
      '      PLANPREV          PP,'
      ''
      '      ('
      '      SELECT'
      
        '         SUM(DECODE(P.FLGDESCONTO, 0, VALORINSS, 1, -VALORINSS, ' +
        '0)) AS VALOR'
      '      FROM'
      '         DETCONCINSS H,'
      '         PROVDESC    P'
      '      WHERE'
      '             (H.NUMPROCINSS= :numproc)'
      '         AND (H.IDRUBRICA = P.IDPROVENTO)'
      '         AND ((H.FLGMANUAL = 1)'
      
        '         AND ((H.CODMANTENEDORA IS NULL ) OR (H.CODMANTENEDORA=1' +
        '4)))'
      '      ) TOTAL'
      ''
      '   WHERE'
      '          (D.NUMPROCINSS = :numproc)'
      '      AND (D.IDRUBRICA = P.IDPROVENTO)'
      '      AND (D.IDPLANOPREV = PL.IDPLANOPREV(+))'
      '      AND (D.IDPLANOPREVPREV = PP.IDPLANOPREV(+))'
      '      AND ('
      '              (D.FLGMANUAL = 1 )'
      '          AND ('
      '                  (D.CODMANTENEDORA IS NULL )'
      '              OR  (D.CODMANTENEDORA = 14)'
      '              )'
      '          )'
      '      AND (D.CODMANTENEDORA = M.CODMANTENEDORA(+))'
      '   )'
      ''
      'ORDER BY'
      '   MESCOBRANCA DESC'
      ''
      '   ')
    PictureMasks.Strings = (
      'MES'#9'999,999,999.99'#9'T'#9'T')
    ValidateWithMask = True
    Left = 336
    Top = 296
    ParamData = <
      item
        DataType = ftInteger
        Name = 'numproc'
        ParamType = ptUnknown
        Value = '123456'
      end
      item
        DataType = ftInteger
        Name = 'numproc'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'numproc'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'numproc'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'numproc'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'numproc'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'numproc'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'numproc'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'codmant'
        ParamType = ptUnknown
        Value = 14
      end
      item
        DataType = ftInteger
        Name = 'numproc'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'numproc'
        ParamType = ptUnknown
      end>
    object StringField1: TStringField
      DisplayLabel = 'Cobrança'
      DisplayWidth = 7
      FieldName = 'MESCOBRANCA'
      FixedChar = True
      Size = 7
    end
    object FloatField1: TFloatField
      DisplayLabel = 'Rubrica'
      DisplayWidth = 6
      FieldName = 'RUBRICAINSS'
    end
    object FloatField2: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 12
      FieldName = 'VALORINSS'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object StringField2: TStringField
      DisplayLabel = 'Sinal'
      DisplayWidth = 4
      FieldName = 'SINAL'
      Size = 3
    end
    object StringField3: TStringField
      DisplayLabel = 'Descrição da Rubrica'
      DisplayWidth = 37
      FieldName = 'DESCRRUBRICA'
      Size = 40
    end
    object StringField6: TStringField
      DisplayLabel = 'Código~Mantenedora'
      DisplayWidth = 10
      FieldName = 'CODMANTENEDORA'
      Size = 10
    end
    object StringField7: TStringField
      DisplayLabel = 'Referência'
      DisplayWidth = 8
      FieldName = 'MESREFERENCIA'
      FixedChar = True
      Size = 7
    end
    object FloatField5: TFloatField
      DisplayWidth = 10
      FieldName = 'RMREAJ'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object FloatField6: TFloatField
      DisplayWidth = 10
      FieldName = 'APREAJ'
      DisplayFormat = ',0.00'
    end
    object StringField8: TStringField
      DisplayLabel = 'OL Concessor'
      DisplayWidth = 11
      FieldName = 'CODCONCESSORINSS'
      Size = 10
    end
    object StringField9: TStringField
      DisplayLabel = 'OL Mantenedor'
      DisplayWidth = 12
      FieldName = 'CODMANTENEDORINSS'
      Size = 10
    end
    object StringField10: TStringField
      DisplayLabel = 'Mantenedora'
      DisplayWidth = 60
      FieldName = 'NOMEMANTENEDORA'
      Size = 60
    end
    object qrySemPlanoCODSINONIMO: TFloatField
      DisplayLabel = 'Código~Sinônimo'
      DisplayWidth = 12
      FieldName = 'CODSINONIMO'
    end
    object qrySemPlanoDTINICIOCRED: TDateTimeField
      DisplayLabel = 'Data Inicio Crédito'
      DisplayWidth = 18
      FieldName = 'DTINICIOCRED'
    end
    object qrySemPlanoDTFIMCRED: TDateTimeField
      DisplayLabel = 'Data Fim Crédito'
      DisplayWidth = 18
      FieldName = 'DTFIMCRED'
    end
    object StringField11: TStringField
      DisplayWidth = 15
      FieldName = 'NUMPROCINSS'
      Visible = False
      Size = 15
    end
    object StringField12: TStringField
      DisplayWidth = 6
      FieldName = 'ESPECIE'
      Visible = False
      Size = 6
    end
    object FloatField7: TFloatField
      DisplayWidth = 10
      FieldName = 'VALOR3'
      Visible = False
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object FloatField8: TFloatField
      DisplayWidth = 10
      FieldName = 'VALOR4'
      Visible = False
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object StringField13: TStringField
      DisplayWidth = 13
      FieldName = 'MATRICULA'
      Visible = False
      Size = 13
    end
  end
  object dtsSemPlano: TwwDataSource
    DataSet = qrySemPlano
    Left = 208
    Top = 88
  end
end
