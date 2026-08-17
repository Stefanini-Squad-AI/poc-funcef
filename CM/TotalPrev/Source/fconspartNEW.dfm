object FconspartNew: TFconspartNew
  Left = 16
  Top = 10
  Width = 784
  Height = 523
  Caption = 'FRMconspartNew'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object fcOutlookBar1: TfcOutlookBar
    Left = 0
    Top = 0
    Width = 145
    Height = 457
    ActivePage = fcOutlookBar1fcShapeBtn1
    Align = alLeft
    Animation.Enabled = True
    Animation.Interval = 1
    Animation.Steps = 7
    AutoBold = False
    BevelOuter = bvNone
    BorderStyle = bsSingle
    ButtonSize = 20
    ButtonClassName = 'TfcShapeBtn'
    Layout = loVertical
    Options = [cboAutoCreateOutlookList]
    PanelAlignment = paDynamic
    ShowButtons = True
    TabOrder = 0
    object fcOutlookBar1fcShapeBtn1: TfcShapeBtn
      Left = 0
      Top = 0
      Width = 141
      Height = 20
      Caption = '&Funcionário'
      Color = clBtnFace
      DitherColor = clWhite
      Down = True
      GroupIndex = 1
      ParentClipping = False
      RoundRectBias = 25
      ShadeStyle = fbsHighlight
      TabOrder = 0
      TextOptions.Alignment = taCenter
      TextOptions.VAlignment = vaVCenter
    end
    object fcOutlookBar1fcShapeBtn2: TfcShapeBtn
      Left = 0
      Top = 433
      Width = 141
      Height = 20
      Caption = 'fcOutlookBar1fcShapeBtn2'
      Color = clBtnFace
      DitherColor = clWhite
      GroupIndex = 1
      NumGlyphs = 0
      ParentClipping = False
      RoundRectBias = 25
      ShadeStyle = fbsHighlight
      TabOrder = 2
      TextOptions.Alignment = taCenter
      TextOptions.VAlignment = vaVCenter
    end
    object TfcOutlookPanel
      Left = 0
      Top = 20
      Width = 141
      Height = 413
      object fcOutlookBar1OutlookList1: TfcOutlookList
        Left = 0
        Top = 0
        Width = 141
        Height = 413
        Align = alClient
        BorderStyle = bsNone
        ClickStyle = csClick
        Color = clBtnShadow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        HotTrackStyle = hsIconHilite
        ItemHighlightColor = clBtnFace
        ItemHotTrackColor = clBtnShadow
        ItemLayout = blGlyphTop
        ItemShadowColor = clBtnText
        ItemSelectedDitherColor = clBtnHighlight
        Items = <
          item
            ImageIndex = 0
            Selected = False
            Separation = 10
            Tag = 0
            Text = 'Dados &Pessoais'
            OnClick = fcOutlookBar1OutlookList1Items0Click
          end
          item
            ImageIndex = 0
            Selected = False
            Separation = 10
            Tag = 0
            Text = 'Dados &Funcionais'
          end>
        ItemSpacing = 20
        ItemsWidth = 0
        Layout = loVertical
        ScrollButtonsVisible = True
        ScrollInterval = 250
        Transparent = False
      end
    end
    object TfcOutlookPanel
      Left = 0
      Top = 0
      Width = 0
      Height = 0
      object fcOutlookBar1OutlookList2: TfcOutlookList
        Left = 0
        Top = 0
        Width = 0
        Height = 0
        Align = alClient
        BorderStyle = bsNone
        ClickStyle = csClick
        Color = clBtnShadow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        HotTrackStyle = hsIconHilite
        ItemHighlightColor = clBtnFace
        ItemHotTrackColor = clBtnShadow
        ItemLayout = blGlyphTop
        ItemShadowColor = clBtnText
        ItemSelectedDitherColor = clBtnHighlight
        Items = <>
        ItemSpacing = 20
        ItemsWidth = 0
        Layout = loVertical
        ScrollButtonsVisible = True
        ScrollInterval = 250
        Transparent = False
      end
    end
  end
  object DadosPessoais: TNotebook
    Left = 145
    Top = 0
    Width = 631
    Height = 457
    Align = alClient
    TabOrder = 1
    OnEnter = DadosPessoaisEnter
    object TPage
      Left = 0
      Top = 0
      Caption = 'Default'
      object ScrollBox1: TScrollBox
        Left = 0
        Top = 0
        Width = 631
        Height = 129
        Align = alTop
        Color = clBtnFace
        ParentColor = False
        TabOrder = 0
        object lblNomePai: TLabel
          Left = 9
          Top = 1
          Width = 61
          Height = 13
          Cursor = crNo
          Caption = 'Nome do Pai'
        end
        object lblNomeMae: TLabel
          Left = 318
          Top = 1
          Width = 67
          Height = 13
          Cursor = crNo
          Caption = 'Nome da Mãe'
        end
        object lblsexo: TLabel
          Left = 454
          Top = 38
          Width = 24
          Height = 13
          Cursor = crNo
          Caption = 'Sexo'
        end
        object lbldataFalecimento: TLabel
          Left = 319
          Top = 38
          Width = 98
          Height = 13
          Cursor = crNo
          Caption = 'Data de Falecimento'
        end
        object lbldataNascimento: TLabel
          Left = 179
          Top = 38
          Width = 97
          Height = 13
          Cursor = crNo
          Caption = 'Data de Nascimento'
        end
        object lblEstadoCivil: TLabel
          Left = 8
          Top = 79
          Width = 55
          Height = 13
          Cursor = crNo
          Caption = 'Estado Civil'
        end
        object lblEMail: TLabel
          Left = 138
          Top = 79
          Width = 28
          Height = 13
          Caption = 'E-mail'
        end
        object Label63: TLabel
          Left = 8
          Top = 38
          Width = 20
          Height = 13
          Cursor = crNo
          Caption = 'CPF'
        end
        object dbednomepai: TwwDBEdit
          Left = 7
          Top = 15
          Width = 292
          Height = 21
          Cursor = crNo
          TabStop = False
          Color = clGray
          DataField = 'NOMEPAI'
          DataSource = dtmConsPart.dspartgeral
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbednomemae: TwwDBEdit
          Left = 316
          Top = 15
          Width = 292
          Height = 21
          Cursor = crNo
          TabStop = False
          Color = clGray
          DataField = 'NOMEMAE'
          DataSource = dtmConsPart.dspartgeral
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbeddatafalecimento: TwwDBEdit
          Left = 317
          Top = 53
          Width = 121
          Height = 21
          Cursor = crNo
          TabStop = False
          Color = clGray
          DataField = 'DATAMORTE'
          DataSource = dtmConsPart.dspartgeral
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbeddatanasc: TwwDBEdit
          Left = 178
          Top = 53
          Width = 121
          Height = 21
          Cursor = crNo
          TabStop = False
          Color = clGray
          DataField = 'DATANASC'
          DataSource = dtmConsPart.dspartgeral
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbedSexo: TwwDBEdit
          Left = 454
          Top = 53
          Width = 108
          Height = 21
          Cursor = crNo
          TabStop = False
          Color = clGray
          DataField = 'SEXO'
          DataSource = dtmConsPart.dspartgeral
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbedEstadoCivil: TwwDBEdit
          Left = 7
          Top = 94
          Width = 121
          Height = 21
          Cursor = crNo
          TabStop = False
          Color = clGray
          DataField = 'ESTADOCIVIL'
          DataSource = dtmConsPart.dspartgeral
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 5
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbedEMail: TwwDBEdit
          Left = 136
          Top = 94
          Width = 247
          Height = 21
          Cursor = crNo
          TabStop = False
          Color = clGray
          DataField = 'EMAIL'
          DataSource = dtmConsPart.dspartgeral
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 6
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwwEdtCPF: TwwDBEdit
          Left = 9
          Top = 53
          Width = 155
          Height = 21
          Cursor = crNo
          TabStop = False
          Color = clGray
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 7
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
      end
      object dbgriddepen: TwwDBGrid
        Left = 2
        Top = 159
        Width = 631
        Height = 127
        Selected.Strings = (
          'NOME'#9'38'#9'Nome'#9'F'
          'FLGCONTAIMPOSTOR'#9'5'#9'IRRF'#9'F'
          'FLGCONTASALARIOF'#9'7'#9'Sal. Fam.'#9'F'
          'FLGDEPLEGAL'#9'10'#9'Dep. Legal'#9'F'
          'DESCRICAO'#9'16'#9'Grau de Parentesco'#9'F'
          'DATANASC'#9'10'#9'Nascimento'#9'F'
          'DESCBLOQUEIO'#9'9'#9'Situação'#9'F'
          'DEPENDENCIA'#9'50'#9'Dependência'#9'F')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        DataSource = dtmConsPart.dsdepentit
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
        TabOrder = 1
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        TitleLines = 1
        TitleButtons = False
        UseTFields = False
        IndicatorColor = icBlack
      end
      object pnlDependentes: TPanel
        Left = 2
        Top = 132
        Width = 629
        Height = 27
        BevelInner = bvLowered
        BevelWidth = 2
        Caption = 'Dependentes'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        TabOrder = 2
      end
      object pnlEnderecos: TPanel
        Left = 1
        Top = 290
        Width = 629
        Height = 27
        BevelInner = bvLowered
        BevelWidth = 2
        Caption = 'Endereços'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        TabOrder = 3
      end
      object dbgridenderecos: TwwDBGrid
        Left = 1
        Top = 317
        Width = 631
        Height = 137
        Selected.Strings = (
          'NOME'#9'30'#9'Local'
          'LOGRADOURO'#9'30'#9'Logradouro'
          'NUMERO'#9'8'#9'Número'
          'COMPLEMENTO'#9'20'#9'Complemento'
          'BAIRRO'#9'20'#9'Bairro'
          'CIDADE'#9'30'#9'Cidade'
          'ESTADO'#9'30'#9'Estado'
          'UF'#9'3'#9'UF'
          'CEP'#9'8'#9'CEP'
          'NOMEPAIS'#9'20'#9'País')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        DataSource = dtmConsPart.dsendereco
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
        TabOrder = 4
        TitleAlignment = taCenter
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
  end
  object Dock971: TDock97
    Left = 0
    Top = 457
    Width = 776
    Height = 39
    AllowDrag = False
    Background.Data = {
      760F0000424D760F0000000000007600000028000000800000003C0000000100
      040000000000000F000000000000000000001000000000000000000000008080
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
      777777777777171717777777777777177771777777777777777077F7FF7FFFF7
      77F77F77F7F7F7F7F7F7F7F7F777777777771777177777777777777777777777
      777777777771717717777777777777777717777777777777777777777FFFFF7F
      7F7F77F7F7F7F7F7F7F7F7F77777777777777717177777777777777777777777
      77777777777777171777777777777777717777777777777777777777777FF7FF
      7F77777777F7F7FF7F7F77F77F77777777777777177777777777777777777777
      7777777777771771777777777777777771777777777777777777777777777FFF
      FF7F7777F7F7F7F7F7F77F777777777777777771717777777777777777777777
      777777777777771777777777777777777777777777777777777777777777777F
      F7F7F7F777F7F7F7F7F7F7F7F777777777777777177777777777777777777777
      7777777777777777777777777777777777777777777777777777777777777777
      FFFF7F7F7F7F7F7F7F7F777777777F7777777777777777777777777777777777
      7777777777777777777777777777777777777777777777777777777777777777
      7FF7F7F7F7F7F7FFFFF7F7F7F7F7777777777777717717177777777777777777
      7777777777777777777777777777777777777777777777777777777777777771
      77FFFFF7F7777F77F7F7F77F77777F7777777777777171777777777777777777
      7777777777777177777777777777777777777777777777777777777777777777
      777FFFFFF7F7F77F7F7FF7F7F77F777777777777777777177777777777777777
      7777777777777777771777777777777777777777777777777777777777777777
      7177FFFF7F7F77F7F7FF7FF7F7F7F77F77777777777171717777777777777777
      7777777777777717771777777777777777777777777777777777777777777777
      77777FFFFF7F7777F7F7FF7FF7F77F7777777777777777777777771777777777
      7777777777777771777777777777777777777777777777777777777777777777
      777777FFFF7F77F7F7F7F7F7F7F7F77F7F777777777771717771777177177777
      7777777777777777777777777777777777777777777777777777777777777777
      777777FFFFFF7F77F7F7F7FF7FF7F7F7777F7777777777771717717777777777
      7777777777777777177777777777777777777777777777777777777777777777
      7777777FFFF7F7F777F7F7F7F7F7F777F7777F77777777717771777777777777
      7777777777777777717777777777777777777777777777777777777777777777
      7777777F7FFF7F77F7F77F7FFF7F7F7F777F7777777777171717717777777F77
      7777777777777777777771777777777777777777777777777777777777777777
      7777777FFFF7F7777777F7F7F7F7F7F77F77F7777777777771771777777F7777
      F7F7777777777777771777777777177777777777777777777777777777777777
      77777177FFFFF7F777F77F7F7FF7F7F7F77F77F777777777171717177777F777
      777F7F7777777777777177177771717777777777777777777777777777777777
      77777777FFFF7F777777F7F7FF7F7F7F7F7F7F77777777777771717717777777
      77777F7F77777777777717771777777777777777777777777777777777777777
      777777177FFFF7F7F77F7F7FF7F7FF7F7F7F7F7F777777777717177177777777
      1777777777777777777771717717777177777777777777777777777777777777
      777777777FFFF7F77777777F7F7FF7F7F7F7F777F77777777771771717777771
      7777777777771777777777177771777777777777777777777777777777777777
      77777771777F7F7F77777F7F7F7F7F7F7F7F7F7F777777777777771717717717
      7777777777777777777771777777777777777777777777777777777777777777
      777777777777F7F7F7F77F7F7F7F7F7F7F7F7777777F77777777717717171717
      7777777777171777777717777777777777777777777777777777777777777777
      77777777777777F7F77777777F7F7F7F7F7F7F7F7F7777777777777777717777
      7777777777777177777771777777777777777777777777777777777777777777
      777777777777777F7F77777F7F7F7F7F7F7F7F777777F77F7777771777717777
      7777777777777777777771177777777777777777777777777777777777777777
      7177777777777777F7F7777777F77F7F7FF7F7F7F7F777777777777777717777
      7777777777777777777777777777777777777777777777777777777777777777
      7777777777777777777777777F77F7F7F7F7F7F77777F7777777777771777777
      7777777777777777777771717777777777777777777777777777777777777777
      777777177777771777777777777F7F7F7F7F7F7F7F7F777F7777777777717777
      7777777777777777777777171777777777777777777777777777777777777777
      71777777777777777777777777F7F7F7F7F7F7F7F7F77F777777777777177777
      7777777777777777777777177777777777777777777777777777777777777717
      77777777777777717777777777777F77F7F7F7F7F7F7F7777777777777777777
      77777777777777777777777777777777777F7777777777777777777777777171
      7171777777777777171777777777F77F7F7F7F7F7F7F7F777777777777777777
      771777777777777777777777777777777177F777777777777777777777777717
      171777177777777717771777777777F7F7F7F7FF7F7F77F77777777777777171
      7777777777777777777777777777777777777F77777777777777777777777777
      77717177777777777171717177777F77F7F7F7F7F7F7F77F7777777777777171
      7177777177777777777777777777777777777FF7F77771777777777777777777
      1717777777777777771777777777777F7F7F7F7F7F7F77F7F777777777777777
      7777777717777777777777777777777777777777777777777777777777777777
      717777777777777777777777717777F77F7F7F7F7F7F7F7F77F7777777777771
      7177777777777777777777777777777777771777777777777777777777777777
      77177777777777777777777777777777F7F77F7F7F7F7F7FF777F77777777717
      777777F777777777777777777777777777777777717177717777777777777777
      77177777777777777777777771777777777F77F7F7F7F7F777F7777777777777
      171777F7F7777777777777177777777777777777777777777777777777777777
      777777777777777777777777177177777F77F7F7F7F7F7F7F7F7F7F777777777
      7777777F77777777777777777777777777777777777777777777777777777777
      77777777777777777777777771777777777F77F7F7F7F7F7F7F77777F7777777
      7717777F77777777777777717177777777777777777777777777777777777777
      7777777777777777777777777717777777777F7F7F7F7F7F7777F7F777777777
      777777777F777777777777777717777777777777777777777777777777777777
      777777777777777777777777777777777777F7F7F7F7F7F7F7F7F77777777777
      7777777777777777777777771777777777777777777777777777777777777777
      77777777777777777777777777717771777777F7F77F7F7F7F7F77F777777777
      7777777777777777777777777717177777777771777777777777777777777777
      7777777777777777777777777777177777777F7F77F7F7F7F7F77F777F777777
      7777777777777177777777777777777777777717177777777777777777777777
      77777777777777777177777777717171777777777F7F7FF7F7F7F77F77777777
      7777777777717777777777777717177777777777777777777777777777777777
      777777777777777777177777777711717777777F7F7F7F7F7F77F7F7F7F77777
      777777777717171717777777777777777777777771777777777F777777777777
      777777777777777777777777777117117777777777F77F7F7F7F77F77777F777
      77777777171777777777777777777777777777777777777777F7F77777777777
      77777777777777777771777777771117177777777F77F7F7F777F7F7F7F77777
      7777777777171777777777777777777777777777777777777777777777777777
      777777777777777777777777777771777777777777F77F7F7F7F7F7F777F7777
      7777777717177777777777777777777777777777777777777777777777777777
      77777777777777777777777777777777777177777777F77F7F77F7F7F7F77F77
      7777777777171777777777777777777777777777777777777777777777777777
      7777777777777777777777777777777777177777777F7F7F7F7F7F7F777F7777
      77777777777777777F7F77777717777777777777777777777777777771777777
      7777777777777777777777777777777777717777777777F7F7F77F7F7F7F77F7
      77777777777777777F7F7F777777777777777777777777777777771777777777
      77777777177777777777777777771777777717777777F7F7F77F7F7F7F77F777
      777777777777777777FFF77F7777717777777777777777777777777777177777
      77777777777777777777777777771777777771777777777777F7F7F7F77F77F7
      77F7777777777777777777F77777777777777777777777777777777777777777
      77777777777777777777777777777777777777171777777F7F77F7F7F7F77F77
      F77777777777777777777777F7F7777777777777777777777777777777777777
      777777777717777777777777777777777777717777777777777F7F7F7F77F77F
      77F77777777F77777717777777F7777777777777777777777777777777777777
      77777777777177777777777777777777777777777177777777F7F7F77F7F77F7
      7F77F77777777F77777717777777777777777777777777777777777777777777
      7777777777771777777777777777777777777777777777777F77F7F7F777F777
      F77F777777777777771771777777771777777777777777777777777777777777
      777777777777777771777777777777777777777777177777777F7F7F7F7F77F7
      F7F7777777777777777717171777777777777777777777777777777777777777
      77777777777771777777777777777177777777777771777777777777F777F777
      7777777777777777777171717177771777777777777777777777777777777777
      77777777777777777777777777777777777777777777777777777F7F7F7F7777
      F77F77F777777777777771771717177777777777777777777777777777777777
      7777777777777777777777777777777777777777777177777777}
    BoundLines = [blTop, blBottom]
    FixAlign = True
    LimitToOneRow = True
    Position = dpBottom
    object lblBloqueio: TLabel
      Left = 223
      Top = 4
      Width = 109
      Height = 24
      Caption = 'Bloqueado'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -21
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      Visible = False
    end
    object tb97Fundo: TToolbar97
      Left = 521
      Top = 0
      Caption = 'tb97Fundo'
      Color = clNone
      CloseButton = False
      DefaultDock = Dock971
      DockPos = 521
      TabOrder = 0
      object sep1: TToolbarSep97
        Left = 160
        Top = 0
        Blank = True
        SizeHorz = 3
      end
      object sep3: TToolbarSep97
        Left = 243
        Top = 0
        Blank = True
        SizeHorz = 3
      end
      object bbtnSair: TBitBtn
        Left = 80
        Top = 0
        Width = 80
        Height = 33
        Cancel = True
        Caption = '&Sair'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        Glyph.Data = {
          F6010000424DF601000000000000760000002800000030000000100000000100
          0400000000008001000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FF8F8FF8F00F
          8F77FF8F8FF8F00F8F778FF8F8FF8F8FF8F7F8FF8F8FF0E0FF87F8FF8F8FF0E0
          FF878F8FF8F8FF8F8FF7F8F8FF8F80E608F7F8F8FF8F80E608F7FF8F8FF8F8FF
          8F87000000FF80E66007000000FF80E66007F8FF8F8FF8F8FF87777770F8F0E6
          6087777770F8F0E6608777777066666668777777007770E660877777007770E6
          608777777066666668777777007770E660877777007770E66087777770666666
          68777788060770E760877788060770E76087777770666666687770000E6070E0
          608770000E6070E0608777777066666668770EEEEEE600E660870EEEEEE600E6
          608777777067666668770EEEEEE600E660870EEEEEE600E66087777770606666
          687770000E6070E6608770000E6070E6608777777066666668777777060770E6
          60877777060770E66087777770666666687777770077770E608777770077770E
          60877777706666666877777770777770E087777770777770E087777770666666
          687777777000000000777777700000000077777770EEEEEEE877}
        NumGlyphs = 3
        Spacing = 2
      end
      object bbtnAjuda: TmaHelpBitBtn
        Left = 163
        Top = 0
        Width = 80
        Height = 33
        Caption = 'Ajuda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        Kind = bkHelp
        Spacing = 2
        ClickHelpContext = 0
      end
      object bbtnProcurar: TBitBtn
        Left = 0
        Top = 0
        Width = 80
        Height = 33
        Cancel = True
        Caption = '&Procurar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        Glyph.Data = {
          4E010000424D4E01000000000000760000002800000012000000120000000100
          040000000000D800000000000000000000001000000010000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
          DDDDDD000000DDDDDDDDDDDDDDDDDD000000D000000000000DD00D000000D0FF
          FFFFFFFF0D000D000000D0FFFFFFF0000800DD000000D0FFFFFF0877808DDD00
          0000D0FFFFF0877E880DDD000000D0FFFFF07777870DDD000000D0FFFFF07E77
          870DDD000000D0FFFFF08EE7880DDD000000D0FFFFFF087780DDDD000000D0FF
          FFFFF0000DDDDD000000D0FFFFFFFFFF0DDDDD000000D0FFFFFFF0000DDDDD00
          0000D0FFFFFFF070DDDDDD000000D0FFFFFFF00DDDDDDD000000DD00000000DD
          DDDDDD000000DDDDDDDDDDDDDDDDDD000000}
        Spacing = 2
      end
    end
  end
  object MSConsPart: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Participante/Dependente'
    Colunas.Strings = (
      'VWPARTICIPDEPEN.MATRICULA'
      'VWPARTICIPDEPEN.NOME'
      'VWPARTICIPDEPEN.NUMDOCUMENTO'
      'PARTPREVPLAN.INSCRICAONUMERO'
      'PLANPREV.NOME'
      'PJ.NOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'N'
      'C'
      'C')
    Descricao.Strings = (
      'Matrícula'
      'Nome'
      'CPF'
      'Inscrição'
      'Plano'
      'Patrocinadora')
    SensivelACaixa.Strings = (
      'S'
      'N'
      'S'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'PESSOA PJ'
      'ELEGPATRO'
      'PLANPREV'
      'PARTPREVPLAN'
      'SITPART'
      'VWPARTICIPDEPEN')
    CamposChave.Strings = (
      'PESSOA.NOME'
      'PESSOA.NUMDOCUMENTO'
      'ELEGPATRO.MATRICULA'
      'PARTPREVPLAN.INSCRICAONUMERO'
      'PLANPREV.NOME'
      'PJ.NOME'
      'PJ.IDPESSOA'
      'VWPARTICIPDEPEN.IDTITULAR'
      'SITPART.DESCRICAO'
      'VWPARTICIPDEPEN.IDPESSOA'
      'PLANPREV.IDPLANOPREV'
      'PARTPREVPLAN.SEQPROPOSTA')
    Filtro.Strings = (
      '    VWPARTICIPDEPEN.IDPESSOA   = ELEGPATRO.IDPESSOA '
      '    ELEGPATRO.IDPESSOA         = PESSOA.IDPESSOA '
      '    ELEGPATRO.IDPESSJUR        = PJ.IDPESSOA(+) '
      '    PARTPREVPLAN.IDPESSOA(+)   = ELEGPATRO.IDPESSOA '
      '    PARTPREVPLAN.IDPESSJUR(+)  = ELEGPATRO.IDPESSJUR '
      '    PARTPREVPLAN.IDSITPART     = SITPART.IDSITPART(+) '
      '    PARTPREVPLAN.IDPLANOPREV   = PLANPREV.IDPLANOPREV(+) ')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '13'
      '60'
      '18'
      '10'
      '10'
      '50')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 557
    Top = 82
  end
  object qryAux: TwwQuery
    ValidateWithMask = True
    Left = 720
    Top = 80
  end
end
