object FrmAnaliseGeracaoContasOrcamen: TFrmAnaliseGeracaoContasOrcamen
  Left = 397
  Top = 235
  Width = 694
  Height = 512
  Caption = 'Análise de Geração de Contas Orçamentárias'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 686
    Height = 51
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 5
      Top = 5
      Width = 96
      Height = 13
      Caption = 'Código de Grupo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtCodGrupo: TEdit
      Left = 7
      Top = 23
      Width = 121
      Height = 21
      ReadOnly = True
      TabOrder = 0
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 51
    Width = 185
    Height = 415
    Align = alLeft
    BevelOuter = bvNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object GroupBox1: TGroupBox
      Left = 0
      Top = 0
      Width = 185
      Height = 193
      Align = alTop
      Caption = 'Parâmetros Utilizados'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object chkGO: TCheckBox
        Left = 8
        Top = 28
        Width = 121
        Height = 17
        Caption = 'Grupo Orçamentário'
        Enabled = False
        TabOrder = 0
      end
      object chkCC: TCheckBox
        Left = 8
        Top = 48
        Width = 121
        Height = 17
        Caption = 'Centro de Custo'
        Enabled = False
        TabOrder = 1
      end
      object chkAP: TCheckBox
        Left = 8
        Top = 67
        Width = 121
        Height = 17
        Caption = 'Atividade / Projeto'
        Enabled = False
        TabOrder = 2
      end
      object chkPP: TCheckBox
        Left = 8
        Top = 102
        Width = 121
        Height = 17
        Caption = 'Plano Previdenciário'
        Enabled = False
        TabOrder = 3
      end
      object chkPT: TCheckBox
        Left = 8
        Top = 84
        Width = 121
        Height = 17
        Caption = 'Patrocinadora'
        Enabled = False
        TabOrder = 4
      end
      object chkCR: TCheckBox
        Left = 8
        Top = 125
        Width = 156
        Height = 17
        Caption = 'Centro de Responsabilidade'
        Enabled = False
        TabOrder = 5
      end
      object chkPR: TCheckBox
        Left = 8
        Top = 146
        Width = 121
        Height = 17
        Caption = 'Programa'
        Enabled = False
        TabOrder = 6
      end
      object chkTD: TCheckBox
        Left = 8
        Top = 165
        Width = 121
        Height = 17
        Caption = 'Tipo de Despesa'
        Enabled = False
        TabOrder = 7
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 466
    Width = 686
    Height = 19
    Panels = <
      item
        Width = 200
      end
      item
        Width = 50
      end>
    SimplePanel = False
  end
  object PageControl1: TPageControl
    Left = 185
    Top = 51
    Width = 501
    Height = 415
    ActivePage = TabSheet2
    Align = alClient
    TabOrder = 3
    object TabSheet1: TTabSheet
      Caption = 'Códigos de Contas Orçamentários Gerados'
      object wwDBGrid1: TwwDBGrid
        Left = 0
        Top = 0
        Width = 493
        Height = 387
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = dsCodigos
        TabOrder = 0
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        TitleLines = 1
        TitleButtons = False
        OnTitleButtonClick = wwDBGrid1TitleButtonClick
        IndicatorColor = icBlack
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Códigos que têm no grupo e não foarm gerados'
      ImageIndex = 1
      object wwDBGrid3: TwwDBGrid
        Left = 0
        Top = 0
        Width = 493
        Height = 387
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = dsContOrcamenFaltante
        TabOrder = 0
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        TitleLines = 1
        TitleButtons = False
        OnTitleButtonClick = wwDBGrid1TitleButtonClick
        IndicatorColor = icBlack
      end
    end
  end
  object cdsCodigos: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ValidateWithMask = True
    Left = 384
    Top = 104
  end
  object dsCodigos: TDataSource
    DataSet = cdsCodigos
    Left = 384
    Top = 144
  end
  object qryContOrcamenFaltante: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT C.* FROM CONTASORCAMEN C JOIN GRUPOORCAMEN G  ON G.IDGRUP' +
        'OORCAMEN = C.IDGRUPOORCAMEN  '
      'WHERE G.CODGRUPOORC =  '#39'1120201'#39' '
      'ORDER BY IDCONTAORCAMEN')
    ValidateWithMask = True
    Left = 421
    Top = 251
  end
  object dsContOrcamenFaltante: TDataSource
    DataSet = qryContOrcamenFaltante
    Left = 416
    Top = 336
  end
end
