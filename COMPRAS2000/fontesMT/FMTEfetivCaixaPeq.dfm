inherited FrmMTEfetivCaixaPeq: TFrmMTEfetivCaixaPeq
  Left = 0
  Top = 54
  HelpContext = 1130020
  Caption = 'Efetiva Lançamento de Caixa Pequeno'
  ClientHeight = 395
  ClientWidth = 726
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 726
    Height = 356
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
      Left = 17
      Top = 67
      Width = 174
      Height = 13
      Caption = 'Valor Total dos Lançamentos :'
    end
    object lblDataLanc: TLabel
      Left = 16
      Top = 96
      Width = 111
      Height = 13
      Caption = 'Data da Efetivação'
    end
    object Label4: TLabel
      Left = 400
      Top = 64
      Width = 69
      Height = 13
      Caption = 'Observação'
    end
    object Label5: TLabel
      Left = 168
      Top = 96
      Width = 63
      Height = 13
      Caption = 'Referência'
    end
    object dblcCaixaPeq: TCMDBLookupCombo
      Left = 16
      Top = 32
      Width = 369
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCCAIXAPEQ'#9'60'#9'descrição'#9'F')
      LookupTable = cdsCxPeq
      LookupField = 'IDCAIXAPEQUENO'
      Options = [loTitles]
      Style = csDropDownList
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      OrderByDisplay = False
      AllowClearKey = True
      ShowMatchText = True
      OnCloseUp = dblcCaixaPeqCloseUp
    end
    object edFavo: TDBEdit
      Left = 400
      Top = 32
      Width = 321
      Height = 21
      TabStop = False
      Color = clGray
      DataField = 'RAZAOSOCIAL'
      DataSource = dsCxPeq
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object edDataEfet: TCMDateTimePicker
      Left = 16
      Top = 112
      Width = 121
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      ButtonStyle = cbsCustom
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
      TabOrder = 2
    end
    object memObs: TMemo
      Left = 400
      Top = 80
      Width = 321
      Height = 54
      Lines.Strings = (
        '')
      MaxLength = 1000
      TabOrder = 4
    end
    object edRef: TEdit
      Left = 168
      Top = 112
      Width = 217
      Height = 21
      MaxLength = 30
      TabOrder = 3
    end
    object chkEncerra: TCheckBox
      Left = 400
      Top = 139
      Width = 233
      Height = 17
      Caption = 'Encerra Caixa Pequeno'
      TabOrder = 5
    end
    object pgc: TPageControl
      Left = 1
      Top = 162
      Width = 724
      Height = 193
      ActivePage = TabLanc
      Align = alBottom
      TabOrder = 6
      object TabLanc: TTabSheet
        Caption = 'Lançamentos'
        object Panel1: TPanel
          Left = 0
          Top = -26
          Width = 716
          Height = 191
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 0
          object Grdlanc: TwwDBGrid
            Left = 0
            Top = 27
            Width = 500
            Height = 164
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
            TabOrder = 0
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
            Left = 500
            Top = 27
            Width = 216
            Height = 164
            Align = alRight
            BevelOuter = bvNone
            Caption = 'Panel4'
            TabOrder = 1
            object Panel3: TPanel
              Left = 0
              Top = 0
              Width = 216
              Height = 33
              Align = alTop
              BevelOuter = bvNone
              Caption = 'Histórico'
              TabOrder = 0
            end
            object memHist: TDBMemo
              Left = 0
              Top = 33
              Width = 216
              Height = 131
              TabStop = False
              Align = alClient
              DataField = 'HISTLANCAMENTO'
              DataSource = dsLanc
              ReadOnly = True
              TabOrder = 1
            end
          end
          object Panel2: TPanel
            Left = 0
            Top = 0
            Width = 716
            Height = 27
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
            TabOrder = 2
          end
        end
      end
      object TabEncerra: TTabSheet
        Caption = 'Parametros para Encerramento'
        ImageIndex = 1
        object Label6: TLabel
          Left = 16
          Top = 8
          Width = 112
          Height = 13
          Caption = 'Tipo de Documento'
        end
        object Label7: TLabel
          Left = 16
          Top = 56
          Width = 102
          Height = 13
          Caption = 'Tipo de Cobrança'
        end
        object Label8: TLabel
          Left = 16
          Top = 104
          Width = 122
          Height = 13
          Caption = 'Tipo de Recebimento'
        end
        object Label9: TLabel
          Left = 280
          Top = 8
          Width = 160
          Height = 13
          Caption = 'Centro de Responsabilidade'
        end
        object Label10: TLabel
          Left = 280
          Top = 56
          Width = 108
          Height = 13
          Caption = 'Atividade / Projeto'
        end
        object Label11: TLabel
          Left = 280
          Top = 104
          Width = 92
          Height = 13
          Caption = 'Centro de Custo'
        end
        object dblcTipoDoc: TCMDBLookupCombo
          Left = 16
          Top = 24
          Width = 241
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'35'#9'Descrição')
          DataField = 'CODTIPDOC'
          LookupTable = cdsTipoDocRec
          LookupField = 'CODTIPDOC'
          Options = [loTitles]
          Style = csDropDownList
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
        object dblcForma: TCMDBLookupCombo
          Left = 16
          Top = 72
          Width = 241
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'35'#9'Descrição')
          DataField = 'CODFORMA'
          LookupTable = cdsTipoCobranca
          LookupField = 'CODFORMA'
          Options = [loTitles]
          Style = csDropDownList
          TabOrder = 1
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
        object dblcTipRec: TCMDBLookupCombo
          Left = 16
          Top = 120
          Width = 241
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'35'#9'Descrição'#9'F')
          LookupTable = cdsTipoReceb
          LookupField = 'CODTIPRECDES'
          Options = [loTitles]
          Style = csDropDownList
          TabOrder = 2
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
        object dblcCentRespon: TwwDBLookupCombo
          Left = 280
          Top = 24
          Width = 249
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'30'#9'Descrição'
            'CODCENTRORESPON'#9'10'#9'Código')
          DataField = 'CODCENTRORESPON'
          LookupTable = cdsCentroRespon
          LookupField = 'CODCENTRORESPON'
          Options = [loTitles]
          TabOrder = 3
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
        object dblcAtiv: TwwDBLookupCombo
          Left = 280
          Top = 72
          Width = 249
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'25'#9'Descrição'
            'UNIDNEGOC'#9'10'#9'Código')
          DataField = 'UNIDNEGOC'
          LookupTable = cdsAtivProj
          LookupField = 'UNIDNEGOC'
          Options = [loTitles]
          TabOrder = 4
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
        object dblcCCust: TwwDBLookupCombo
          Left = 280
          Top = 120
          Width = 249
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'30'#9'Nome'
            'CODCENTROCUSTO'#9'10'#9'Código')
          LookupTable = cdsCentroCusto
          LookupField = 'CODCENTROCUSTO'
          Options = [loTitles]
          TabOrder = 5
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
      end
    end
    object edValTot: TDBRealEdit
      Left = 200
      Top = 64
      Width = 185
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
      TabOrder = 7
      WordWrap = False
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
      DataField = 'TOTAL'
      DataSource = dsTot
    end
  end
  inherited Dock971: TDock97
    Top = 356
    Width = 726
    object lbProc: TLabel [0]
      Left = 16
      Top = 13
      Width = 139
      Height = 13
      Caption = 'Processando Integração'
      Transparent = True
    end
    inherited tb97Fundo: TToolbar97
      Left = 476
      DockPos = 492
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
        HelpContext = 1130020
      end
      object BtnEfetiva: TBitBtn
        Left = 0
        Top = 0
        Width = 80
        Height = 33
        Caption = '&Efetivar'
        TabOrder = 2
        OnClick = BtnEfetivaClick
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888088888888888888800888888888888880B0888888888888880B088
          8888888800000B088888888880BBBBB08888888880BBB00008888888880BBB08
          88888880000BFBF088888880BFBFB000088888880BFBF088888888880FBFBF08
          8888888880FBFBF0888888888000000088888888888888888888}
      end
    end
    object barProc: TProgressBar
      Left = 169
      Top = 10
      Width = 304
      Height = 21
      Min = 0
      Max = 100
      TabOrder = 1
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 779
    Top = 65523
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
    Left = 701
    Top = 200
  end
  object dsTot: TwwDataSource
    AutoEdit = False
    DataSet = cdsTot
    Left = 699
    Top = 248
  end
  object dsCxPeq: TwwDataSource
    AutoEdit = False
    DataSet = cdsCxPeq
    Left = 339
    Top = 24
  end
  object cdsCentroCusto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 463
    Top = 295
  end
  object cdsTipoReceb: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 206
    Top = 277
  end
  object cdsCentroRespon: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 467
    Top = 196
  end
  object cdsAtivProj: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 465
    Top = 243
  end
  object cdsTipoCobranca: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 206
    Top = 237
  end
  object cdsTipoDocRec: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 206
    Top = 189
  end
  object cdsCxPeq: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 279
    Top = 23
  end
  object cdsCliente: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 705
    Top = 299
  end
  object cdsFornecedor: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 657
    Top = 299
  end
  object cdsTot: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 655
    Top = 247
  end
  object cdsLanc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 647
    Top = 199
  end
end
