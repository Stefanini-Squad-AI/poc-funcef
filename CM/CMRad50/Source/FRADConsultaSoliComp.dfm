inherited frmRADConsultaSoliComp: TfrmRADConsultaSoliComp
  Left = 136
  Top = 176
  BorderStyle = bsSingle
  Caption = 'Consulta Solicitação de Compras'
  ClientHeight = 462
  ClientWidth = 758
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 758
    Height = 423
    object pnlMestre: TPanel
      Left = 1
      Top = 1
      Width = 756
      Height = 146
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object DbrgDestino: TDBRadioGroup
        Left = 8
        Top = 2
        Width = 105
        Height = 57
        Anchors = [akLeft, akTop, akRight, akBottom]
        Caption = ' Destino '
        DataField = 'CUSTOESTOQUE'
        DataSource = ds
        Items.Strings = (
          'Estoque'
          'Custo')
        TabOrder = 0
        Values.Strings = (
          'E'
          'C')
        OnChange = DbrgDestinoChange
      end
      object DbrgAtendida: TDBRadioGroup
        Left = 8
        Top = 59
        Width = 105
        Height = 54
        Caption = ' SC Atendida '
        Columns = 2
        DataField = 'SOLICIATENDIDA'
        DataSource = ds
        Items.Strings = (
          'Sim'
          'Não')
        ReadOnly = True
        TabOrder = 2
        Values.Strings = (
          'T'
          'F')
      end
      object PnlDatas: TPanel
        Left = 116
        Top = 7
        Width = 213
        Height = 52
        Anchors = [akLeft, akTop, akRight, akBottom]
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 1
        object Label1: TLabel
          Left = 9
          Top = 9
          Width = 47
          Height = 13
          Caption = 'Emissão'
        end
        object Label2: TLabel
          Left = 113
          Top = 9
          Width = 74
          Height = 13
          Caption = 'Necessidade'
        end
        object dbdteNecessidade: TCMDateTimePicker
          Left = 113
          Top = 22
          Width = 94
          Height = 21
          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
          CalendarAttributes.Font.Color = clWindowText
          CalendarAttributes.Font.Height = -11
          CalendarAttributes.Font.Name = 'MS Sans Serif'
          CalendarAttributes.Font.Style = []
          ButtonStyle = cbsCustom
          DataField = 'DATAENTREGA'
          DataSource = ds
          Epoch = 1950
          ButtonGlyph.Data = {
            06050000424D06050000000000003604000028000000100000000D0000000100
            080000000000D000000000000000000000000001000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
            A6000020400000206000002080000020A0000020C0000020E000004000000040
            20000040400000406000004080000040A0000040C0000040E000006000000060
            20000060400000606000006080000060A0000060C0000060E000008000000080
            20000080400000806000008080000080A0000080C0000080E00000A0000000A0
            200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
            200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
            200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
            20004000400040006000400080004000A0004000C0004000E000402000004020
            20004020400040206000402080004020A0004020C0004020E000404000004040
            20004040400040406000404080004040A0004040C0004040E000406000004060
            20004060400040606000406080004060A0004060C0004060E000408000004080
            20004080400040806000408080004080A0004080C0004080E00040A0000040A0
            200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
            200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
            200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
            20008000400080006000800080008000A0008000C0008000E000802000008020
            20008020400080206000802080008020A0008020C0008020E000804000008040
            20008040400080406000804080008040A0008040C0008040E000806000008060
            20008060400080606000806080008060A0008060C0008060E000808000008080
            20008080400080806000808080008080A0008080C0008080E00080A0000080A0
            200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
            200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
            200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
            2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
            2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
            2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
            2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
            2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
            2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
            2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00010000000000
            000000000000000000FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF07A407
            A407A4F9A407A4FF00FFFF00FFA407A407A4F9A4F9A407FF00FFFF00FF07A407
            A407A4F9A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FF07A407
            A407A407A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FFFFFFFF
            FFFFFFFFFFFFFFFF00FFFF00FF04FC04FC04FCA4A4A4A4FF00FFFF00FFFC04FC
            04FC04A4A4A4A4FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF0000000000
            000000000000000000FF}
          ShowButton = True
          TabOrder = 1
        end
        object dbdteEmissao: TCMDateTimePicker
          Left = 9
          Top = 22
          Width = 94
          Height = 21
          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
          CalendarAttributes.Font.Color = clWindowText
          CalendarAttributes.Font.Height = -11
          CalendarAttributes.Font.Name = 'MS Sans Serif'
          CalendarAttributes.Font.Style = []
          ButtonStyle = cbsCustom
          DataField = 'DATAEMISSAO'
          DataSource = ds
          Epoch = 1950
          ButtonGlyph.Data = {
            06050000424D06050000000000003604000028000000100000000D0000000100
            080000000000D000000000000000000000000001000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
            A6000020400000206000002080000020A0000020C0000020E000004000000040
            20000040400000406000004080000040A0000040C0000040E000006000000060
            20000060400000606000006080000060A0000060C0000060E000008000000080
            20000080400000806000008080000080A0000080C0000080E00000A0000000A0
            200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
            200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
            200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
            20004000400040006000400080004000A0004000C0004000E000402000004020
            20004020400040206000402080004020A0004020C0004020E000404000004040
            20004040400040406000404080004040A0004040C0004040E000406000004060
            20004060400040606000406080004060A0004060C0004060E000408000004080
            20004080400040806000408080004080A0004080C0004080E00040A0000040A0
            200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
            200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
            200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
            20008000400080006000800080008000A0008000C0008000E000802000008020
            20008020400080206000802080008020A0008020C0008020E000804000008040
            20008040400080406000804080008040A0008040C0008040E000806000008060
            20008060400080606000806080008060A0008060C0008060E000808000008080
            20008080400080806000808080008080A0008080C0008080E00080A0000080A0
            200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
            200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
            200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
            2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
            2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
            2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
            2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
            2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
            2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
            2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00010000000000
            000000000000000000FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF07A407
            A407A4F9A407A4FF00FFFF00FFA407A407A4F9A4F9A407FF00FFFF00FF07A407
            A407A4F9A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FF07A407
            A407A407A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FFFFFFFF
            FFFFFFFFFFFFFFFF00FFFF00FF04FC04FC04FCA4A4A4A4FF00FFFF00FFFC04FC
            04FC04A4A4A4A4FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF0000000000
            000000000000000000FF}
          ShowButton = True
          TabOrder = 0
        end
      end
      object Panel1: TPanel
        Left = 332
        Top = 7
        Width = 146
        Height = 106
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 3
        object Label12: TLabel
          Left = 8
          Top = 10
          Width = 73
          Height = 13
          Caption = 'Nº  da S.C.I.'
        end
        object lbAlmoxDestino: TLabel
          Left = 8
          Top = 54
          Width = 120
          Height = 13
          Caption = 'Almoxarifado Destino'
        end
        object dbedSeqSoliComp: TwwDBEdit
          Left = 8
          Top = 23
          Width = 129
          Height = 21
          TabStop = False
          Color = clBtnFace
          DataField = 'NUMSOLCOMPRA'
          DataSource = ds
          ReadOnly = True
          TabOrder = 0
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object EdAlmoxaDestino: TEdit
          Left = 8
          Top = 68
          Width = 130
          Height = 21
          TabStop = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
      end
      object grp: TGroupBox
        Left = 482
        Top = 2
        Width = 263
        Height = 111
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 4
        object Label6: TLabel
          Left = 7
          Top = 15
          Width = 160
          Height = 13
          Caption = 'Centro de Responsabilidade'
        end
        object Label7: TLabel
          Left = 7
          Top = 61
          Width = 108
          Height = 13
          Caption = 'Atividade / Projeto'
        end
        object dblcCentRespon: TwwDBLookupCombo
          Left = 7
          Top = 30
          Width = 238
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'30'#9'Descrição'
            'CODCENTRORESPON'#9'10'#9'Código')
          DataField = 'CODCENTRORESPON'
          DataSource = ds
          LookupTable = cdsCRespon
          LookupField = 'CODCENTRORESPON'
          Options = [loTitles]
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
        object dblcAtiv: TwwDBLookupCombo
          Left = 7
          Top = 76
          Width = 238
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'25'#9'Descrição'
            'UNIDNEGOC'#9'10'#9'Código')
          DataField = 'UNIDNEGOC'
          DataSource = ds
          LookupTable = cdsUnid
          LookupField = 'UNIDNEGOC'
          Options = [loTitles]
          TabOrder = 1
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
      end
      object GpDotOrc: TGroupBox
        Left = 116
        Top = 59
        Width = 213
        Height = 54
        Caption = ' Reserva  Orçamentária '
        TabOrder = 5
        object ReResOrc: TRealEdit
          Left = 17
          Top = 19
          Width = 180
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '0')
          TabOrder = 0
          WordWrap = False
          IntDigits = 10
          DecDigits = 0
          NumberFormat = iNumber
          Signal = False
        end
      end
      object Panel2: TPanel
        Left = 0
        Top = 115
        Width = 756
        Height = 31
        Align = alBottom
        TabOrder = 6
        object Label3: TLabel
          Left = 518
          Top = 8
          Width = 67
          Height = 13
          Caption = 'Valor Total:'
        end
        object EdValorTotal: TRealEdit
          Left = 594
          Top = 4
          Width = 121
          Height = 21
          TabStop = False
          Alignment = taRightJustify
          Color = 14876158
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Lines.Strings = (
            '      0,00')
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
        end
      end
    end
    object pgctrlDetalhe: TPageControl
      Left = 1
      Top = 147
      Width = 756
      Height = 275
      ActivePage = tbsDet
      Align = alClient
      TabOrder = 1
      object tbsDet: TTabSheet
        Caption = 'Itens da Solicitação'
        object dbgrdDet: TwwDBGrid
          Left = 0
          Top = 0
          Width = 748
          Height = 247
          Hint = 'Duplo Click para vizualizar a observação do item'
          Selected.Strings = (
            'CODARTIGO'#9'8'#9'Código'#9'F'
            'DESCRICAO'#9'30'#9'Descrição'#9'F'
            'CODMEDIDA'#9'4'#9'Unidade'#9'F'
            'QTDEPEDIDA'#9'10'#9'Qtde Pedida'#9'F'
            'SALDOACOMPRAR'#9'10'#9'Qtde. a Comprar'#9'F'
            'QTDEPENDENTE'#9'10'#9'Qtde. Pendente Receb.'#9'F'
            'VALORUN'#9'10'#9'Valor Unitário'#9'F'
            'VALORTOTAL'#9'10'#9'Valor Total'#9'F'
            'NOMEPATRO'#9'40'#9'Patrocinadora'#9'F'
            'NOMEPLANO'#9'40'#9'Plano Previdenciário'#9'F'
            'DESCPROGRAMA'#9'20'#9'Programa'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsDet
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          TitleAlignment = taCenter
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = True
          UseTFields = False
          OnDblClick = dbgrdDetDblClick
          IndicatorColor = icBlack
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 423
    Width = 758
    inherited tb97Fundo: TToolbar97
      Left = 421
    end
  end
  object twObs: TToolWindow97 [2]
    Left = 72
    Top = 32
    Caption = ' Observação'
    ClientAreaHeight = 209
    ClientAreaWidth = 369
    TabOrder = 2
    Visible = False
    object Panel3: TPanel
      Left = 0
      Top = 176
      Width = 369
      Height = 33
      Align = alBottom
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 0
      object BitBtn1: TBitBtn
        Left = 149
        Top = 4
        Width = 75
        Height = 25
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = BitBtn1Click
        Kind = bkOK
      end
    end
    object DBRichEdit1: TDBRichEdit
      Left = 0
      Top = 0
      Width = 369
      Height = 176
      Align = alClient
      DataField = 'OBSITEMSOLIC'
      DataSource = dsDet
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 200
      ParentFont = False
      ScrollBars = ssBoth
      TabOrder = 1
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      3
      (
        'TRealEdit'
        'Text'
        0)
      (
        'TDBRealEdit'
        'Text'
        0)
      (
        'TDBRichEdit'
        'Text'
        0))
  end
  object ds: TwwDataSource
    AutoEdit = False
    DataSet = cdsSoliComp
    Left = 130
    Top = 110
  end
  object dsDet: TwwDataSource
    AutoEdit = False
    DataSet = cdsItemSoli
    Left = 81
    Top = 111
  end
  object dsPatro: TwwDataSource
    AutoEdit = False
    Left = 169
    Top = 111
  end
  object dsPrograma: TwwDataSource
    AutoEdit = False
    Left = 217
    Top = 111
  end
  object dsPlano: TwwDataSource
    AutoEdit = False
    Left = 33
    Top = 111
  end
  object cdsPatro: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 85
    Top = 213
  end
  object cdsPrograma: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 77
    Top = 338
  end
  object cdsAlmoxOrigem: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 165
    Top = 282
  end
  object cdsArtigo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 21
    Top = 267
  end
  object cdsCRespon: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 85
    Top = 274
  end
  object cdsUnid: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 21
    Top = 331
  end
  object cdsSoliComp: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 165
    Top = 339
  end
  object cdsItemSoli: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 253
    Top = 330
  end
  object cdsParamCompras: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 165
    Top = 218
  end
  object cdsAlmoxCompras: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 253
    Top = 274
  end
  object cdsPlano: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 21
    Top = 211
  end
end
