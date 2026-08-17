inherited FrmMTReqManual: TFrmMTReqManual
  Left = 278
  Top = 73
  HelpContext = 50028
  Caption = 'Requsição Manual'
  ClientHeight = 431
  ClientWidth = 615
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 615
    Height = 345
    inherited pnlMestre: TPanel
      Width = 613
      Height = 156
      object Label12: TLabel
        Left = 17
        Top = 6
        Width = 134
        Height = 13
        Caption = 'Almoxarifado de Origem'
      end
      object Label3: TLabel
        Left = 16
        Top = 111
        Width = 108
        Height = 13
        Caption = 'Atividade / Projeto'
      end
      object rgTipMov: TRadioGroup
        Left = 16
        Top = 32
        Width = 172
        Height = 67
        Caption = ' Tipo de Movimentação '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Items.Strings = (
          'Transferência'
          'Custo'
          'Devolução de Custo')
        ParentFont = False
        TabOrder = 1
        OnClick = rgTipMovClick
      end
      object lbAlmox: TStaticText
        Left = 161
        Top = 5
        Width = 47
        Height = 17
        BorderStyle = sbsSunken
        Caption = 'lbAlmox'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object grpAlmoxCC: TGroupBox
        Left = 192
        Top = 32
        Width = 244
        Height = 115
        Caption = ' Destino '
        TabOrder = 2
        object Label1: TLabel
          Left = 13
          Top = 16
          Width = 73
          Height = 13
          Caption = 'Almoxarifado'
        end
        object Label2: TLabel
          Left = 13
          Top = 66
          Width = 92
          Height = 13
          Caption = 'Centro de Custo'
        end
        object dblcAlmox: TwwDBLookupCombo
          Left = 13
          Top = 30
          Width = 217
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCALMOX'#9'40'#9'Nome'
            'CODALMOXARIFADO'#9'10'#9'Código')
          DataField = 'CODALMOXTRANSF'
          DataSource = ds
          LookupTable = cdsAlmox
          LookupField = 'CODALMOXARIFADO'
          Options = [loTitles]
          Style = csDropDownList
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
          OnExit = dblcAlmoxExit
        end
        object dblcCCust: TwwDBLookupCombo
          Left = 13
          Top = 80
          Width = 216
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'30'#9'Nome'
            'CODCENTROCUSTO'#9'10'#9'Códigfo')
          DataField = 'CENTROCUSTODESTINO'
          DataSource = ds
          LookupTable = cdsCentCusto
          LookupField = 'CODCENTROCUSTO'
          Options = [loTitles]
          Style = csDropDownList
          TabOrder = 1
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
      end
      object dblcAtiv: TwwDBLookupCombo
        Left = 16
        Top = 126
        Width = 171
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'25'#9'Descrição'
          'UNIDNEGOC'#9'10'#9'Código')
        DataField = 'UNIDNEGOC'
        DataSource = ds
        LookupTable = cdsUnidNegoc
        LookupField = 'UNIDNEGOC'
        Options = [loTitles]
        TabOrder = 4
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object grpReq: TGroupBox
        Left = 440
        Top = 32
        Width = 155
        Height = 115
        Caption = ' Requisição '
        TabOrder = 3
        object Label13: TLabel
          Left = 16
          Top = 16
          Width = 28
          Height = 13
          Caption = 'Data'
        end
        object Label14: TLabel
          Left = 16
          Top = 64
          Width = 104
          Height = 13
          Caption = 'Nº  da Requisição'
        end
        object edDataReq: TCMDateTimePicker
          Left = 16
          Top = 32
          Width = 121
          Height = 21
          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
          CalendarAttributes.Font.Color = clWindowText
          CalendarAttributes.Font.Height = -11
          CalendarAttributes.Font.Name = 'MS Sans Serif'
          CalendarAttributes.Font.Style = []
          ButtonStyle = cbsCustom
          DataField = 'DATAREQ'
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
        object edNumReq: TDBRealEdit
          Left = 16
          Top = 80
          Width = 121
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '0')
          TabOrder = 1
          WordWrap = False
          IntDigits = 10
          DecDigits = 0
          NumberFormat = iNumber
          Signal = False
          DataField = 'NUMREQUISICAO'
          DataSource = ds
        end
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 157
      Width = 613
      Height = 187
      inherited pgctrlDetalhe: TPageControl
        Width = 515
        Height = 128
        inherited tbsDet: TTabSheet
          inherited dbgrdDet: TwwDBGrid [0]
            Width = 507
            Height = 100
            Selected.Strings = (
              'CODARTIGO'#9'14'#9'Código'
              'DESCRICAO'#9'30'#9'Descrição'
              'CODMEDIDA'#9'4'#9'Unid.'
              'QUANTIDADE'#9'10'#9'Qtde.'
              'VALOR'#9'10'#9'Valor'#9'F')
          end
          inherited pnlControlesDet: TPanel [1]
            Width = 507
            Height = 100
            object Label4: TLabel
              Left = 8
              Top = 0
              Width = 25
              Height = 13
              Caption = 'Item'
            end
            object Label6: TLabel
              Left = 112
              Top = 0
              Width = 104
              Height = 13
              Caption = 'Descrição do Item'
            end
            object Label7: TLabel
              Left = 384
              Top = 0
              Width = 32
              Height = 13
              Caption = 'Qtde.'
            end
            object Label8: TLabel
              Left = 320
              Top = 0
              Width = 31
              Height = 13
              Caption = 'Unid.'
            end
            object Label9: TLabel
              Left = 137
              Top = 49
              Width = 19
              Height = 13
              Caption = 'UN'
            end
            object Label10: TLabel
              Left = 8
              Top = 48
              Width = 103
              Height = 13
              Caption = 'Saldo em Estoque'
            end
            object Label11: TLabel
              Left = 200
              Top = 48
              Width = 79
              Height = 13
              Caption = 'Valor Baixado'
            end
            object dblcUN: TwwDBLookupCombo
              Left = 320
              Top = 16
              Width = 57
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'CODMEDIDA'#9'4'#9'Código'
                'DESCMEDIDA'#9'25'#9'Descrição')
              DataField = 'CODMEDIDA'
              DataSource = dsDet
              LookupTable = cdsUnMedida
              LookupField = 'CODMEDIDA'
              Options = [loTitles]
              Style = csDropDownList
              TabOrder = 2
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
              OnEnter = dblcUNEnter
            end
            object DbUN: TDBEdit
              Left = 136
              Top = 64
              Width = 49
              Height = 21
              Color = clSilver
              DataField = 'CODMEDCUSTO'
              DataSource = dsArtigo
              ReadOnly = True
              TabOrder = 5
            end
            object dblcDesc: TwwDBLookupCombo
              Left = 112
              Top = 16
              Width = 199
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'50'#9'Descrição'
                'CODARTIGO'#9'14'#9'Código')
              DataField = 'CODARTIGO'
              DataSource = dsDet
              LookupTable = cdsArtigo
              LookupField = 'CODARTIGO'
              Options = [loTitles]
              Style = csDropDownList
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
              OnCloseUp = dblcDescCloseUp
            end
            object dblcItem: TwwDBLookupCombo
              Left = 8
              Top = 16
              Width = 95
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'CODARTIGO'#9'14'#9'Código'
                'DESCRICAO'#9'50'#9'Descrição')
              DataField = 'CODARTIGO'
              DataSource = dsDet
              LookupTable = cdsArtigo
              LookupField = 'CODARTIGO'
              Options = [loTitles]
              Style = csDropDownList
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
              OnCloseUp = dblcItemCloseUp
            end
            object edValb: TRealEdit
              Left = 200
              Top = 64
              Width = 121
              Height = 21
              Alignment = taRightJustify
              Color = 14286847
              Lines.Strings = (
                '      0,00')
              ReadOnly = True
              TabOrder = 6
              WordWrap = False
              IntDigits = 10
              DecDigits = 5
              NumberFormat = fNumber
              Signal = False
            end
            object DbSaldoQtde: TRealEdit
              Left = 8
              Top = 64
              Width = 111
              Height = 21
              Alignment = taRightJustify
              Color = clSilver
              Lines.Strings = (
                '      0,00')
              ReadOnly = True
              TabOrder = 4
              WordWrap = False
              IntDigits = 10
              DecDigits = 5
              NumberFormat = fNumber
              Signal = False
            end
            object rgDest: TRadioGroup
              Left = 328
              Top = 40
              Width = 162
              Height = 48
              ItemIndex = 0
              Items.Strings = (
                'Insumo'
                'Ficha Técnica')
              TabOrder = 7
            end
            object edQtde: TDBRealEdit
              Left = 384
              Top = 16
              Width = 105
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '      0,00')
              TabOrder = 3
              WordWrap = False
              OnExit = edQtdeExit
              IntDigits = 10
              DecDigits = 5
              NumberFormat = fNumber
              Signal = False
              DataField = 'QUANTIDADE'
              DataSource = dsDet
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 605
      end
      inherited Dock974: TDock97
        Left = 519
        Height = 128
      end
    end
  end
  inherited Dock972: TDock97
    Width = 615
    inherited Toolbar971: TToolbar97
      inherited sbtnAlterar: TToolbarButton97
        Visible = False
      end
      inherited sbtnProcurar: TToolbarButton97
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 392
    Width = 615
    inherited tb97Fundo: TToolbar97
      Left = 443
      DockPos = 447
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 50028
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 274
      DockPos = 278
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 794
    Top = 65519
    TargetsData = (
      1
      2
      (
        'TRealEdit'
        'Text'
        0)
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 294
    Top = 7
  end
  inherited ImlPadrao: TImageList
    Left = 776
    Top = 65519
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 360
    Top = 7
  end
  inherited Cds: TCMClientDataSet
    Left = 428
    Top = 7
  end
  inherited MontaSelect: TMontaSelect
    Left = 776
    Top = 65527
  end
  inherited CmeDetalhe: TCmEventosCadastro
    BeforeConfirma = CmeDetalheBeforeConfirma
    Left = 108
    Top = 231
  end
  inherited dsDet: TwwDataSource
    DataSet = cdsItem
    Left = 166
    Top = 231
  end
  object cdsAlmox: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 373
    Top = 108
  end
  object cdsCentCusto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 373
    Top = 164
  end
  object cdsUnidNegoc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 125
    Top = 180
  end
  object cdsItem: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 229
    Top = 232
  end
  object cdsArtigo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 314
    Top = 233
  end
  object cdsUnMedida: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 397
    Top = 232
  end
  object dsArtigo: TwwDataSource
    AutoEdit = False
    DataSet = cdsArtigo
    Left = 230
    Top = 183
  end
  object CdsAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 549
    Top = 224
  end
  object cdsParamGlobal: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 501
    Top = 85
  end
end
