inherited frmLgLayout: TfrmLgLayout
  Left = 101
  Top = 46
  ActiveControl = pnlFundo
  BorderIcons = [biHelp]
  BorderStyle = bsSingle
  Caption = 'Associação de Lay-Out a arquivo'
  ClientHeight = 447
  ClientWidth = 610
  PixelsPerInch = 96
  TextHeight = 13
  object Label5: TLabel [0]
    Left = 404
    Top = 109
    Width = 46
    Height = 13
    Caption = 'Formato'
  end
  inherited Dock971: TDock97 [1]
    Top = 408
    Width = 610
    inherited tb97Fundo: TToolbar97
      Left = 444
      DockPos = 599
    end
  end
  inherited pnlFundo: TPanel [2]
    Width = 610
    Height = 408
    object GroupBox2: TGroupBox
      Left = 5
      Top = 208
      Width = 600
      Height = 195
      Align = alBottom
      Caption = 'Associação'
      TabOrder = 0
      object dbgLgLayout: TwwDBGrid
        Left = 2
        Top = 15
        Width = 596
        Height = 178
        Selected.Strings = (
          'DESCASSOC'#9'45'#9'Associação'
          'CONTEUDO'#9'255'#9'Conteudo ou Formato')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = dsLgLayout
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        TitleLines = 1
        TitleButtons = False
        IndicatorColor = icBlack
      end
    end
    object Panel1: TPanel
      Left = 5
      Top = 5
      Width = 600
      Height = 57
      Align = alTop
      TabOrder = 1
      object gbDestino: TGroupBox
        Left = 260
        Top = 1
        Width = 336
        Height = 55
        Align = alLeft
        Caption = 'Descrição da Origem ou Destino das Informações'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object cbArquivo: TComboBox
          Left = 8
          Top = 22
          Width = 318
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 0
          OnClick = cbArquivoClick
          Items.Strings = (
            'TABELA DE CAPITAIS DE SEGURO')
        end
      end
      object gbDescLayout: TGroupBox
        Left = 1
        Top = 1
        Width = 259
        Height = 55
        Align = alLeft
        Caption = 'Descrição do Lay_Out'
        TabOrder = 1
        object dblktipo: TwwDBLookupCombo
          Left = 8
          Top = 22
          Width = 241
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'36'#9'Descrição'#9'F')
          LookupTable = qryTpLayout
          LookupField = 'IDLAYOUT'
          Options = [loColLines, loRowLines, loTitles]
          Style = csDropDownList
          TabOrder = 0
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = False
          ShowMatchText = True
          OnCloseUp = dblktipoCloseUp
        end
      end
    end
    object Panel2: TPanel
      Left = 5
      Top = 62
      Width = 600
      Height = 139
      Align = alTop
      TabOrder = 2
      object Label1: TLabel
        Left = 8
        Top = 8
        Width = 105
        Height = 13
        Caption = 'Campo do Lay-Out'
      end
      object Label2: TLabel
        Left = 268
        Top = 6
        Width = 137
        Height = 13
        Caption = 'Campo para Associação'
      end
      object Label4: TLabel
        Left = 473
        Top = 51
        Width = 46
        Height = 13
        Caption = 'Formato'
      end
      object cbCampoDisponivel: TComboBox
        Left = 267
        Top = 22
        Width = 316
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
      end
      object dblkCampoLayout: TwwDBLookupCombo
        Left = 8
        Top = 22
        Width = 241
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMECPO'#9'20'#9'Nome do Campo'#9'F'
          'POSINICIAL'#9'7'#9'P. Inicial'#9'F'
          'POSFINAL'#9'7'#9'P. Final'#9'F')
        LookupTable = qryCpLayout
        LookupField = 'IDCPLAYOUT'
        Options = [loColLines, loRowLines, loTitles]
        Style = csDropDownList
        TabOrder = 1
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
        OnCloseUp = dblkCampoLayoutCloseUp
      end
      object EditConteudo: TEdit
        Left = 8
        Top = 66
        Width = 441
        Height = 21
        TabOrder = 2
      end
      object Panel3: TPanel
        Left = 1
        Top = 94
        Width = 598
        Height = 44
        Align = alBottom
        TabOrder = 3
        object LabelTitObs: TLabel
          Left = 8
          Top = 4
          Width = 169
          Height = 13
          Caption = 'Tipo do Campo Definido no Lay-Out'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object LabelObs: TLabel
          Left = 10
          Top = 19
          Width = 240
          Height = 13
          AutoSize = False
          Caption = 'VALOR'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          WordWrap = True
        end
        object btnColocar: TBitBtn
          Left = 264
          Top = 8
          Width = 95
          Height = 27
          Caption = '&Colocar'
          TabOrder = 0
          OnClick = btnColocarClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333303333
            333333333337F33333333333333033333333333333373F333333333333090333
            33333333337F7F33333333333309033333333333337373F33333333330999033
            3333333337F337F33333333330999033333333333733373F3333333309999903
            333333337F33337F33333333099999033333333373333373F333333099999990
            33333337FFFF3FF7F33333300009000033333337777F77773333333333090333
            33333333337F7F33333333333309033333333333337F7F333333333333090333
            33333333337F7F33333333333309033333333333337F7F333333333333090333
            33333333337F7F33333333333300033333333333337773333333}
          NumGlyphs = 2
        end
        object btnRetirar: TBitBtn
          Left = 376
          Top = 8
          Width = 95
          Height = 27
          Caption = '&Retirar'
          TabOrder = 1
          OnClick = btnRetirarClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000333
            3333333333777F33333333333309033333333333337F7F333333333333090333
            33333333337F7F33333333333309033333333333337F7F333333333333090333
            33333333337F7F33333333333309033333333333FF7F7FFFF333333000090000
            3333333777737777F333333099999990333333373F3333373333333309999903
            333333337F33337F33333333099999033333333373F333733333333330999033
            3333333337F337F3333333333099903333333333373F37333333333333090333
            33333333337F7F33333333333309033333333333337373333333333333303333
            333333333337F333333333333330333333333333333733333333}
          NumGlyphs = 2
        end
      end
      object cbFormato: TComboBox
        Left = 471
        Top = 66
        Width = 111
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 4
      end
      object chkConteudoFixo: TCheckBox
        Left = 10
        Top = 49
        Width = 121
        Height = 17
        BiDiMode = bdLeftToRight
        Caption = 'Conteúdo Fixo'
        ParentBiDiMode = False
        TabOrder = 5
        OnClick = chkConteudoFixoClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 24
    Top = 315
  end
  object qryTpLayout: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDLAYOUT, DESCRICAO'
      'FROM TPLAYOUT'
      'ORDER BY DESCRICAO')
    ValidateWithMask = True
    Left = 82
    Top = 315
    object qryTpLayoutDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 36
      FieldName = 'DESCRICAO'
      Origin = 'BASEDADOS.TPLAYOUT.DESCRICAO'
      Size = 30
    end
    object qryTpLayoutIDLAYOUT: TFloatField
      FieldName = 'IDLAYOUT'
      Origin = 'BASEDADOS.TPLAYOUT.IDLAYOUT'
      Visible = False
    end
  end
  object dsTpLayout: TwwDataSource
    DataSet = qryTpLayout
    Left = 113
    Top = 315
  end
  object qryCpLayout: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT IDLAYOUT, IDCPLAYOUT, NOMECPO, POSINICIAL, POSFINAL, FLGV' +
        'ALOR'
      'FROM CPLAYOUT'
      'WHERE IDLAYOUT= :IDTPLAYOUT'
      'ORDER BY POSINICIAL'
      ' ')
    ValidateWithMask = True
    Left = 164
    Top = 315
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTPLAYOUT'
        ParamType = ptUnknown
      end>
    object qryCpLayoutNOMECPO: TStringField
      DisplayLabel = 'Nome do Campo'
      DisplayWidth = 20
      FieldName = 'NOMECPO'
      Origin = 'BASEDADOS.CPLAYOUT.NOMECPO'
    end
    object qryCpLayoutPOSINICIAL: TFloatField
      DisplayLabel = 'P. Inicial'
      DisplayWidth = 7
      FieldName = 'POSINICIAL'
      Origin = 'BASEDADOS.CPLAYOUT.POSINICIAL'
    end
    object qryCpLayoutPOSFINAL: TFloatField
      DisplayLabel = 'P. Final'
      DisplayWidth = 7
      FieldName = 'POSFINAL'
      Origin = 'BASEDADOS.CPLAYOUT.POSFINAL'
    end
    object qryCpLayoutFLGVALOR: TStringField
      DisplayLabel = 'Indicador de Valor'
      DisplayWidth = 17
      FieldName = 'FLGVALOR'
      Origin = 'BASEDADOS.CPLAYOUT.FLGVALOR'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryCpLayoutIDLAYOUT: TFloatField
      FieldName = 'IDLAYOUT'
      Origin = 'BASEDADOS.CPLAYOUT.IDLAYOUT'
      Visible = False
    end
    object qryCpLayoutIDCPLAYOUT: TFloatField
      FieldName = 'IDCPLAYOUT'
      Origin = 'BASEDADOS.CPLAYOUT.IDCPLAYOUT'
      Visible = False
    end
  end
  object dsCpLayout: TwwDataSource
    DataSet = qryCpLayout
    Left = 218
    Top = 315
  end
  object qryLgLayout: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT LG.IDLAYOUT,LG.IDCPLAYOUT, LG.IDLGLAYOUT,'
      '       LG.DESCASSOC, LG.CONTEUDO, CP.POSINICIAL, CP.POSFINAL'
      'FROM CPLAYOUT CP, LGLAYOUT LG'
      'WHERE (CP.IDLAYOUT = LG.IDLAYOUT) AND'
      '      (CP.IDCPLAYOUT = LG.IDCPLAYOUT) AND'
      '      (CP.IDLAYOUT= :IDLAYOUT)'
      ''
      'ORDER BY CP.POSINICIAL')
    ValidateWithMask = True
    Left = 272
    Top = 315
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDLAYOUT'
        ParamType = ptUnknown
      end>
    object qryLgLayoutDESCASSOC: TStringField
      DisplayLabel = 'Associação'
      DisplayWidth = 45
      FieldName = 'DESCASSOC'
      Size = 60
    end
    object qryLgLayoutCONTEUDO: TStringField
      DisplayLabel = 'Conteudo ou Formato'
      DisplayWidth = 255
      FieldName = 'CONTEUDO'
      Origin = 'BASEDADOS.LGLAYOUT.CONTEUDO'
      Size = 255
    end
    object qryLgLayoutPOSINICIAL: TFloatField
      DisplayLabel = 'P. Inicial'
      DisplayWidth = 10
      FieldName = 'POSINICIAL'
      Origin = 'BASEDADOS.CPLAYOUT.POSINICIAL'
      Visible = False
    end
    object qryLgLayoutPOSFINAL: TFloatField
      DisplayLabel = 'P.Final'
      DisplayWidth = 10
      FieldName = 'POSFINAL'
      Origin = 'BASEDADOS.CPLAYOUT.POSFINAL'
      Visible = False
    end
    object qryLgLayoutIDLAYOUT: TFloatField
      DisplayWidth = 10
      FieldName = 'IDLAYOUT'
      Visible = False
    end
    object qryLgLayoutIDCPLAYOUT: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCPLAYOUT'
      Visible = False
    end
    object qryLgLayoutIDLGLAYOUT: TFloatField
      DisplayWidth = 10
      FieldName = 'IDLGLAYOUT'
      Visible = False
    end
  end
  object dsLgLayout: TwwDataSource
    DataSet = qryLgLayout
    Left = 336
    Top = 315
  end
  object qryIns: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 392
    Top = 314
  end
  object qrytabela: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 448
    Top = 314
  end
end
