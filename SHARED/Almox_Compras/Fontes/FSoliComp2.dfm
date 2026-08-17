inherited FrmSoliComp2: TFrmSoliComp2
  Left = 153
  Top = 129
  HelpContext = 50016
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  Caption = 'Cadastro de Solicitação de Compra'
  ClientHeight = 469
  ClientWidth = 758
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 758
    Height = 383
    inherited tbcDetalhe: TTabControlDetalhe [0]
      Top = 117
      Width = 756
      Height = 265
      TabOrder = 0
      Tabs.Strings = (
        'Itens da Solicitação')
      inherited pgctrlDetalhe: TPageControl
        Width = 658
        Height = 206
        TabOrder = 0
        inherited tbsDet: TTabSheet
          Caption = 'Itens da Solicitação'
          inherited pnlControlesDet: TPanel [0]
            Width = 650
            Height = 178
            object grpArtigo: TGroupBox
              Left = 0
              Top = 0
              Width = 650
              Height = 178
              Align = alClient
              Caption = 'Artigo'
              TabOrder = 0
              object Label4: TLabel
                Left = 13
                Top = 13
                Width = 40
                Height = 13
                Caption = 'Código'
              end
              object Label5: TLabel
                Left = 171
                Top = 12
                Width = 58
                Height = 13
                Caption = 'Descrição'
              end
              object Label9: TLabel
                Left = 443
                Top = 12
                Width = 66
                Height = 13
                Caption = 'Quantidade'
              end
              object lblUnidade: TLabel
                Left = 559
                Top = 12
                Width = 48
                Height = 13
                Caption = 'Unidade'
                Enabled = False
              end
              object Label8: TLabel
                Left = 303
                Top = 94
                Width = 69
                Height = 13
                Caption = 'Observação'
              end
              object Label15: TLabel
                Left = 13
                Top = 94
                Width = 33
                Height = 13
                Caption = 'Plano'
              end
              object Label16: TLabel
                Left = 13
                Top = 54
                Width = 80
                Height = 13
                Caption = 'Patrocinadora'
              end
              object Label17: TLabel
                Left = 13
                Top = 135
                Width = 54
                Height = 13
                Caption = 'Programa'
              end
              object dblkcmbDesc: TwwDBLookupCombo
                Left = 171
                Top = 27
                Width = 259
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCPROD'#9'40'#9'Descrição')
                DataField = 'CODARTIGO'
                DataSource = dsDet
                LookupTable = qryArtigo
                LookupField = 'CODARTIGO'
                TabOrder = 1
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
                ShowMatchText = True
                OnCloseUp = dblkcmbDescCloseUp
              end
              object dblkcmbCodArtigo: TwwDBLookupCombo
                Left = 13
                Top = 27
                Width = 121
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'CODARTIGO'#9'14'#9'Código')
                DataField = 'CODARTIGO'
                DataSource = dsDet
                LookupTable = qryArtigo
                LookupField = 'CODARTIGO'
                TabOrder = 0
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
                ShowMatchText = True
                OnCloseUp = dblkcmbCodArtigoCloseUp
              end
              object dblkcmbUnidade: TwwDBLookupCombo
                Left = 559
                Top = 27
                Width = 73
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'CODMEDIDA'#9'4'#9'unidade')
                DataField = 'CODMEDIDA'
                DataSource = dsDet
                LookupTable = qryConversao
                LookupField = 'CODMEDIDA'
                Style = csDropDownList
                Enabled = False
                TabOrder = 3
                AutoDropDown = True
                ShowButton = True
                UseTFields = False
                AllowClearKey = True
                ShowMatchText = True
                OnCloseUp = dblkcmbUnidadeCloseUp
              end
              object dbQtde: TDBRealEdit
                Left = 443
                Top = 27
                Width = 99
                Height = 21
                Alignment = taRightJustify
                Lines.Strings = (
                  '0,00')
                TabOrder = 2
                WordWrap = False
                IntDigits = 10
                DecDigits = 2
                NumberFormat = fNumber
                Signal = False
                DataField = 'QTDEPEDIDA'
                DataSource = dsDet
              end
              object dbreOBS: TDBRichEdit
                Left = 303
                Top = 108
                Width = 331
                Height = 63
                DataField = 'OBSITEMSOLIC'
                DataSource = dsDet
                MaxLength = 200
                TabOrder = 8
              end
              object dblkcmbPlanoPrev: TwwDBLookupCombo
                Left = 13
                Top = 109
                Width = 281
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'NOME'#9'50'#9'NOME'#9'F')
                DataField = 'IDPLANOPREV'
                DataSource = dsDet
                LookupTable = qryPlano
                LookupField = 'IDPLANOPREV'
                TabOrder = 6
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
                ShowMatchText = True
              end
              object dblkcmbPatro: TwwDBLookupCombo
                Left = 13
                Top = 68
                Width = 281
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'NOME'#9'60'#9'Nome'#9'F')
                DataField = 'IDPATRO'
                DataSource = dsDet
                LookupTable = qryPatro
                LookupField = 'IDPESSOA'
                TabOrder = 5
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
                ShowMatchText = True
              end
              object dblkcmbPrograma: TwwDBLookupCombo
                Left = 13
                Top = 150
                Width = 281
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCPROGRAMA'#9'60'#9'Descrição'#9'F')
                DataField = 'IDPROGRAMA'
                DataSource = dsDet
                LookupTable = qryPrograma
                LookupField = 'IDPROGRAMA'
                TabOrder = 7
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = False
                ShowMatchText = True
              end
              object GroupBox1: TGroupBox
                Left = 333
                Top = 52
                Width = 292
                Height = 40
                Caption = 'Valor Unitário'
                TabOrder = 4
                object dbcmbTipoValor: TwwDBComboBox
                  Left = 8
                  Top = 14
                  Width = 137
                  Height = 21
                  ShowButton = True
                  Style = csDropDown
                  MapList = True
                  AllowClearKey = False
                  AutoSize = False
                  DropDownCount = 8
                  DropDownWidth = 100
                  ItemHeight = 0
                  Items.Strings = (
                    'Custo Médio'#9'0'
                    'Última Compra'#9'1')
                  ItemIndex = 0
                  Sorted = False
                  TabOrder = 0
                  UnboundDataType = wwDefault
                  OnCloseUp = dbcmbTipoValorCloseUp
                end
                object dbedValorUn: TDBRealEdit
                  Left = 152
                  Top = 14
                  Width = 131
                  Height = 21
                  Alignment = taRightJustify
                  Color = clSilver
                  Enabled = False
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlue
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  Lines.Strings = (
                    '0,00')
                  ParentFont = False
                  TabOrder = 1
                  WordWrap = False
                  IntDigits = 10
                  DecDigits = 2
                  NumberFormat = fNumber
                  Signal = False
                  DataField = 'VALORUN'
                  DataSource = dsDet
                end
              end
            end
          end
          inherited dbgrdDet: TwwDBGrid [1]
            Width = 650
            Height = 178
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
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TitleAlignment = taCenter
            TitleFont.Height = -12
            TitleButtons = True
            UseTFields = False
            OnDblClick = dbgrdDetDblClick
          end
        end
      end
      inherited Dock973: TDock97
        Width = 748
        object Label3: TLabel [0]
          Left = 465
          Top = 8
          Width = 67
          Height = 13
          Caption = 'Valor Total:'
        end
        object EdValorTotal: TRealEdit
          Left = 534
          Top = 3
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
          TabOrder = 1
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
        end
      end
      inherited Dock974: TDock97
        Left = 662
        Height = 206
      end
    end
    inherited pnlMestre: TPanel [1]
      Width = 756
      Height = 116
      TabOrder = 1
      object DbrgDestino: TDBRadioGroup
        Left = 8
        Top = 2
        Width = 105
        Height = 57
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
        Width = 251
        Height = 111
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
          LookupTable = qryCRespon
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
          LookupTable = qryUnid
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
        object btnOrcamento: TSpeedButton
          Left = 169
          Top = 19
          Width = 23
          Height = 22
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            0400000000008000000000000000000000001000000010000000000000000000
            BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
            77777000000000000007707778FF7FF7FF077077788F78F78F07708888877877
            87077077780078F78F077077780E0FF78F0770888870E0777707700000FF0E07
            FF077077770F70E0FF07077777707F0E0F070F7555707FF0E0070F7577704444
            0E070F757770000000E070FFF707777777007700007777777777}
          OnClick = btnOrcamentoClick
        end
        object ReResOrc: TRealEdit
          Left = 17
          Top = 19
          Width = 152
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '0')
          TabOrder = 0
          WordWrap = False
          OnExit = ReResOrcExit
          IntDigits = 10
          DecDigits = 0
          NumberFormat = iNumber
          Signal = False
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 758
  end
  inherited Dock971: TDock97
    Top = 430
    Width = 758
    inherited tb97Fundo: TToolbar97
      Left = 581
      DockPos = 581
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 50016
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 412
      DockPos = 412
    end
  end
  object twObs: TToolWindow97 [3]
    Left = 56
    Top = 64
    Caption = ' Observação'
    ClientAreaHeight = 209
    ClientAreaWidth = 369
    TabOrder = 3
    Visible = False
    object Panel2: TPanel
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
    Left = 779
    TargetsData = (
      1
      2
      (
        'TDBRichEdit'
        'Text'
        0)
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  inherited dsDet: TwwDataSource
    DataSet = QryItemSoli
    Left = 185
    Top = 135
  end
  inherited ds: TwwDataSource
    Top = 6
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update SoliComp'
      'set'
      '  NUMSOLCOMPRA = :NUMSOLCOMPRA,'
      '  IDPESSOA = :IDPESSOA,'
      '  DATAENTREGA = :DATAENTREGA,'
      '  IDEMPRESA = :IDEMPRESA,'
      '  CODCENTROCUSTO = :CODCENTROCUSTO,'
      '  ALGUMPARAESTOQUE = :ALGUMPARAESTOQUE,'
      '  DATAEMISSAO = :DATAEMISSAO,'
      '  SOLICIATENDIDA = :SOLICIATENDIDA,'
      '  SOLICIACEITA = :SOLICIACEITA,'
      '  CUSTOESTOQUE = :CUSTOESTOQUE,'
      '  IMPRESSO = :IMPRESSO,'
      '  CODCENTRORESPON = :CODCENTRORESPON,'
      '  UNIDNEGOC = :UNIDNEGOC,'
      '  CODALMOXARIFADO = :CODALMOXARIFADO,'
      '  FLGPREPRONTA = :FLGPREPRONTA,'
      '  IDRESERVAORCAMEN = :IDRESERVAORCAMEN,'
      '  IDPROCESSO = :IDPROCESSO'
      'where'
      '  NUMSOLCOMPRA = :OLD_NUMSOLCOMPRA')
    InsertSQL.Strings = (
      'insert into SoliComp'
      '  (NUMSOLCOMPRA, IDPESSOA, DATAENTREGA, IDEMPRESA, '
      'CODCENTROCUSTO, ALGUMPARAESTOQUE, '
      '   DATAEMISSAO, SOLICIATENDIDA, SOLICIACEITA, CUSTOESTOQUE, '
      'IMPRESSO, CODCENTRORESPON, '
      '   UNIDNEGOC, CODALMOXARIFADO, FLGPREPRONTA, IDRESERVAORCAMEN, '
      'IDPROCESSO)'
      'values'
      '  (:NUMSOLCOMPRA, :IDPESSOA, :DATAENTREGA, :IDEMPRESA, '
      ':CODCENTROCUSTO, '
      
        '   :ALGUMPARAESTOQUE, :DATAEMISSAO, :SOLICIATENDIDA, :SOLICIACEI' +
        'TA, '
      ':CUSTOESTOQUE, '
      '   :IMPRESSO, :CODCENTRORESPON, :UNIDNEGOC, :CODALMOXARIFADO, '
      ':FLGPREPRONTA, '
      '   :IDRESERVAORCAMEN, :IDPROCESSO)')
    DeleteSQL.Strings = (
      'delete from SoliComp'
      'where'
      '  NUMSOLCOMPRA = :OLD_NUMSOLCOMPRA')
    Left = 297
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'SoliComp.NumSolCompra'
      'Solicomp.dataemissao'
      'Solicomp.dataentrega'
      'SOLICOMP.CODALMOXARIFADO'
      'UNIDNEGOCIO.NOME'
      'CENTRESPON.NOME'
      'ITEMSOLI.CODARTIGO'
      'PRODUTO.DESCPROD')
    TipodeDado.Strings = (
      'N'
      'D'
      'D'
      'N'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Nº da Solicitação'
      'Data de Emissao'
      'Data de Entrega'
      'Almoxarifado'
      'Atividade/Projeto'
      'Centro de Responsabilidade'
      'Código do Artigo'
      'Descrição do Artigo')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'SoliComp'
      'UNIDNEGOCIO'
      'CENTRESPON'
      'ITEMSOLI'
      'PRODUTO')
    CamposChave.Strings = (
      'SoliComp.NumSolCompra')
    Filtro.Strings = (
      'UNIDNEGOCIO.UNIDNEGOC = SOLICOMP.UNIDNEGOC'
      'CENTRESPON.CODCENTRORESPON = SOLICOMP.CODCENTRORESPON'
      'SOLICOMP.NUMSOLCOMPRA = ITEMSOLI.NUMSOLCOMPRA'
      'SUBSTR(ITEMSOLI.CODARTIGO,1,6) = PRODUTO.CODPRODUTO')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '10'
      '10'
      '10'
      '25'
      '30'
      '14'
      '40')
    Left = 271
    Top = 13
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 414
    Top = 10
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'Select S.*, A.DescAlmox, '
      'A.CodAlmoxarifado As CodAlmoxaDest, '
      'A.CodCusteio As CodCusteioDest '
      'From SoliComp S, Almox A '
      'Where S.NumSolCompra = 1'
      'and S.CodAlmoxarifado=A.CodAlmoxarifado(+)')
    Left = 344
    Top = 26
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 408
    Top = 164
  end
  object QryItemSoli: TwwQuery
    AutoCalcFields = False
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  PT.NOME AS NOMEPATRO,'
      '  PP.NOME AS NOMEPLANO,'
      '  P.DESCPROGRAMA,'
      '  I.*,'
      '  SUBSTR(DECODE(PV.IDPRODVARI, NULL, '
      
        '          (P.DESCPROD||'#39' '#39'||A.CODCOR||'#39' '#39'||A.CODTAMANHO), PV.DES' +
        'CPRODVARI), 1, 60) AS DESCRICAO,'
      '  P.CODMEDCUSTO,'
      '  P.CODPRODUTO,'
      '  CO.FATOR,'
      '  CF.FATOR,'
      '  (C.CUSTOMEDIO*CF.FATOR/CO.FATOR) AS VALORUN,'
      '  (C.CUSTOMEDIO*CF.FATOR/CO.FATOR) * I.QTDEPEDIDA AS VALORTOTAL,'
      '  (-1) AS IDFORNE,'
      '  (0)  AS VALORUN,'
      '  (0)  AS PRAZOPAG  '
      ' '
      'FROM'
      '  ITEMSOLI I,'
      '  ARTIGO A,'
      '  PRODUTO P,'
      '  CUSTOMED C,'
      '  CONVER CO,'
      '  CONVER CF,'
      '  PRODVARI PV,'
      ''
      '  PROGRAMA P,'
      '  PLANPREVCONTABIL PP,'
      '  PESSOA PT'
      ''
      'WHERE (I.NUMSOLCOMPRA   = 0)'
      '  AND (I.CODARTIGO      = A.CODARTIGO)'
      '  AND (A.CODPRODUTO     = P.CODPRODUTO)'
      '  AND (A.CODARTIGO      = C.CODARTIGO(+))'
      '  AND (P.CODPRODUTO     = CO.CODPRODUTO)'
      '  AND (CO.CODMEDIDA     = P.CODMEDCUSTO)'
      '  AND (P.CODPRODUTO     = CF.CODPRODUTO)'
      '  AND (CF.CODMEDIDA     = I.CODMEDIDA)'
      '  AND (PV.IDPRODVARI(+) = I.IDPRODVARI)'
      '  AND (I.IDPROGRAMA     = P.IDPROGRAMA)'
      '  AND (I.IDPLANOPREV    = PP.IDPLANOPREV)'
      '  AND (I.IDPATRO        = PT.IDPESSOA)'
      ''
      ''
      'ORDER BY'
      '  A.CODARTIGO,'
      '  P.DESCPROD')
    UpdateObject = UpItemSoli
    ValidateWithMask = True
    Left = 219
    Top = 153
  end
  object UpItemSoli: TUpdateSQL
    ModifySQL.Strings = (
      'update ITEMSOLI'
      'set'
      '  NUMSOLCOMPRA = :NUMSOLCOMPRA,'
      '  CODARTIGO = :CODARTIGO,'
      '  CODMEDIDA = :CODMEDIDA,'
      '  QTDEPEDIDA = :QTDEPEDIDA,'
      '  SALDOACOMPRAR = :SALDOACOMPRAR,'
      '  QTDEPENDENTE = :QTDEPENDENTE,'
      '  SOLICIACEITA = :SOLICIACEITA,'
      '  IDCOMPRADOR = :IDCOMPRADOR,'
      '  CODPROCESSO = :CODPROCESSO,'
      '  OBSITEMSOLIC = :OBSITEMSOLIC,'
      '  IDPRODVARI = :IDPRODVARI,'
      '  IDCONTRATOPROD = :IDCONTRATOPROD,'
      '  IDITEMSOLI = :IDITEMSOLI,'
      '  IDPLANOPREV = :IDPLANOPREV,'
      '  IDPATRO = :IDPATRO,'
      '  IDPROGRAMA = :IDPROGRAMA'
      'where'
      '  IDITEMSOLI = :OLD_IDITEMSOLI')
    InsertSQL.Strings = (
      'insert into ITEMSOLI'
      '  (NUMSOLCOMPRA, CODARTIGO, CODMEDIDA, QTDEPEDIDA,'
      'SALDOACOMPRAR, QTDEPENDENTE,'
      '   SOLICIACEITA, IDCOMPRADOR, CODPROCESSO, OBSITEMSOLIC,'
      'IDPRODVARI, IDCONTRATOPROD,'
      '   IDITEMSOLI, IDPLANOPREV, IDPATRO, IDPROGRAMA)'
      'values'
      '  (:NUMSOLCOMPRA, :CODARTIGO, :CODMEDIDA, :QTDEPEDIDA,'
      ':SALDOACOMPRAR,'
      '   :QTDEPENDENTE, :SOLICIACEITA, :IDCOMPRADOR, :CODPROCESSO,'
      ':OBSITEMSOLIC,'
      
        '   :IDPRODVARI, :IDCONTRATOPROD, :IDITEMSOLI, :IDPLANOPREV,:IDPA' +
        'TRO, :IDPROGRAMA)'
      ' '
      ' ')
    DeleteSQL.Strings = (
      'delete from ITEMSOLI'
      'where'
      '  IDITEMSOLI = :OLD_IDITEMSOLI')
    Left = 226
    Top = 198
  end
  object QryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 144
    Top = 143
  end
  object QryValorUn: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 321
    Top = 216
  end
  object qryCRespon: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     U.CODCENTRORESPON,'
      '     U.NOME'
      'FROM'
      ' ('
      '  (SELECT'
      '        CR.CODCENTRORESPON,'
      '        CR.NOME'
      '   FROM'
      '        CENTRESPON CR,'
      '        PESSOAXCRESP PR'
      '   WHERE'
      '         (CR.CODCENTRORESPON = PR.CODCENTRORESPON)'
      '     AND (CR.IDPESSOA = PR.IDPESSOA)'
      '     AND (CR.IDPESSOA = :pIDPESS)'
      '     AND (CR.ATIVO    = '#39'S'#39')'
      '     AND (CR.ANALITICOSINTET = '#39'A'#39')'
      '     AND (PR.IDPESSOAACESSO = :IDUSUARIO))'
      '  UNION ALL'
      '    (SELECT'
      '          CR.CODCENTRORESPON,'
      '          CR.NOME'
      '     FROM'
      '          CENTRESPON CR'
      '     WHERE'
      '           (CR.IDPESSOA = :pIDPESS)'
      '       AND (CR.ATIVO    = '#39'S'#39')'
      '       AND (CR.ANALITICOSINTET = '#39'A'#39')'
      '       AND (NOT EXISTS (SELECT 1'
      '                        FROM PESSOAXCRESP PR'
      '                        WHERE (PR.IDPESSOA = :pIDPESS)'
      '                          AND (PR.IDPESSOAACESSO = :IDUSUARIO)))'
      '     )'
      '  ) U'
      'ORDER BY U.NOME')
    ValidateWithMask = True
    Left = 693
    Top = 12
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIDPESS'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDUSUARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDPESS'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDPESS'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDUSUARIO'
        ParamType = ptUnknown
      end>
  end
  object qryUnid: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'Select  UnidNegoc,Nome  From UnidNegocio where unetipo='#39'A'#39' and a' +
        'tivo='#39'S'#39)
    ValidateWithMask = True
    Left = 678
    Top = 149
  end
  object qryConversao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select codproduto,codmedida,fator'
      'from conver '
      'where (RTRIM(codproduto)  = :codproduto )')
    ValidateWithMask = True
    Left = 685
    Top = 378
    ParamData = <
      item
        DataType = ftString
        Name = 'codproduto'
        ParamType = ptUnknown
      end>
  end
  object qryAlmoxaOrigem: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODALMOXARIFADO,DESCALMOX'
      'FROM ALMOX'
      'WHERE CODALMOXARIFADO <> :codalmoxarifado'
      'AND IDPESSOA = :idpessoa')
    ValidateWithMask = True
    Left = 685
    Top = 320
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codalmoxarifado'
        ParamType = ptUnknown
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'idpessoa'
        ParamType = ptUnknown
        Value = 0
      end>
  end
  object MsResORc: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'RESERVAORCAMEN.NUMRESERVA'
      'RESERVAORCAMEN.VLRRESERVA'
      'RESERVAORCAMEN.DATAREFERENCIA'
      'RESERVAORCAMEN.EXERCICIO'
      'RESERVAORCAMEN.PERIODO'
      'CONTASORCAMEN.IDCONTAORCAMEN'
      'CONTASORCAMEN.NOMECONTAORCAMEN'
      'RESERVAORCAMEN.IDOPERACAO')
    TipodeDado.Strings = (
      'N'
      'N'
      'D'
      'N'
      'N'
      'C'
      'C'
      'N')
    Descricao.Strings = (
      'Número da Reserva'
      'Valor'
      'Data Ref.'
      'Exercício'
      'Período'
      'Nº da Conta Orçamentária'
      'Nome da Conta Orçamentária'
      'Operação')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'RESERVAORCAMEN'
      'RADINSTPROCESSO'
      'CONTASORCAMEN')
    CamposChave.Strings = (
      'RESERVAORCAMEN.IDRESERVAORCAMEN'
      'RESERVAORCAMEN.NUMRESERVA')
    Filtro.Strings = (
      'RESERVAORCAMEN.FLGRESERVA = '#39'A'#39
      'RESERVAORCAMEN.FLGRESCOMP = '#39'R'#39
      'RADINSTPROCESSO.IDPROCESSO(+) = RESERVAORCAMEN.IDPROCESSO'
      
        '((RADINSTPROCESSO.FLGOK = '#39'S'#39')  OR (RADINSTPROCESSO.FLGOK IS NUL' +
        'L))'
      'CONTASORCAMEN.IDCONTAORCAMEN = RESERVAORCAMEN.IDCONTAORCAMEN'
      'CONTASORCAMEN.IDPLANOORCAMEN = RESERVAORCAMEN.IDPLANOORCAMEN')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '10'
      '10'
      '10'
      '10'
      '25'
      '60'
      '10')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 541
    Top = 12
  end
  object qryArtigo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     U.CODARTIGO,'
      '     U.DESCPROD,'
      '     U.FLGVARIAVEL,'
      '     U.DESCRCOMPL'
      'FROM'
      '('
      '  SELECT'
      '       A.CODARTIGO,'
      
        '       (P.DESCPROD || '#39' '#39' || A.CODTAMANHO || '#39' '#39' || A.CODCOR)  A' +
        'S DESCPROD,'
      '       P.FLGVARIAVEL,'
      '       P.DESCRCOMPL'
      '  FROM'
      '      ARTIGO A,'
      '      PRODUTO P'
      '  WHERE'
      
        '          (((A.FLGBLOQUEADO <> '#39'C'#39')  AND (A.FLGBLOQUEADO <> '#39'A'#39')' +
        ') OR (A.FLGBLOQUEADO IS NULL))'
      '      AND (A.FLGATIVO = '#39'S'#39')'
      '      AND (A.CODPRODUTO = P.CODPRODUTO )'
      
        '      AND (NOT EXISTS (SELECT 1 FROM USUXGRUPPROD WHERE  (IDUSUA' +
        'RIO = :IDUSUARIO) AND (IDPESSOA = :IDPESSOA)))'
      '  UNION ALL'
      '  SELECT'
      '       A.CODARTIGO,'
      
        '       (P.DESCPROD || '#39' '#39' || A.CODTAMANHO || '#39' '#39' || A.CODCOR)  A' +
        'S DESCPROD,'
      '       P.FLGVARIAVEL,'
      '       P.DESCRCOMPL'
      '  FROM'
      '      ARTIGO A,'
      '      PRODUTO P,'
      '      USUXGRUPPROD UXG'
      '  WHERE'
      
        '          (((A.FLGBLOQUEADO <> '#39'C'#39')  AND (A.FLGBLOQUEADO <> '#39'A'#39')' +
        ') OR (A.FLGBLOQUEADO IS NULL))'
      '      AND (A.FLGATIVO = '#39'S'#39')'
      '      AND (IDUSUARIO = :IDUSUARIO)'
      '      AND (IDPESSOA = :IDPESSOA)'
      '      AND (P.CODGRUPOPROD = UXG.CODGRUPOPROD)'
      '      AND (A.CODPRODUTO = P.CODPRODUTO )'
      ') U'
      'ORDER BY U.DESCPROD'
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 393
    Top = 214
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDUSUARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDUSUARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object qryArtigoDESCPROD: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 40
      FieldName = 'DESCPROD'
      Size = 50
    end
    object qryArtigoCODARTIGO: TStringField
      DisplayLabel = 'Código'
      DisplayWidth = 14
      FieldName = 'CODARTIGO'
      Origin = 'ARTIGO.CODARTIGO'
      Visible = False
      Size = 14
    end
    object qryArtigoFLGVARIAVEL: TStringField
      DisplayWidth = 1
      FieldName = 'FLGVARIAVEL'
      Origin = 'PRODUTO.FLGVARIAVEL'
      Visible = False
      Size = 1
    end
    object qryArtigoDESCRCOMPL: TMemoField
      FieldName = 'DESCRCOMPL'
      BlobType = ftMemo
      Size = 500
    end
  end
  object qryContrato: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      C.IDCONTRATOPROD,'
      '      C.CODARTIGO,'
      '      C.CODMEDIDA,'
      '      C.VLRUNITARIO,'
      '      C.QTDEESPERADA,'
      '      C.IDFORCLI,'
      '      C.PRAZOPAG,'
      '      C.IDCOMPRADOR,'
      '      P.RAZAOSOCIAL'
      'FROM'
      '      PESSOA P,'
      '      CONTRATOPROD C'
      'WHERE'
      '       (C.CODARTIGO = :pCODART)'
      '   AND (C.IDFORCLI = P.IDPESSOA)'
      'ORDER BY C.IDCONTRATOPROD')
    ValidateWithMask = True
    Left = 456
    Top = 216
    ParamData = <
      item
        DataType = ftString
        Name = 'pCODART'
        ParamType = ptUnknown
      end>
    object qryContratoIDCONTRATOPROD: TFloatField
      DisplayLabel = 'Nº  do Contrato'
      DisplayWidth = 10
      FieldName = 'IDCONTRATOPROD'
    end
    object qryContratoRAZAOSOCIAL: TStringField
      DisplayLabel = 'Fornecedor'
      DisplayWidth = 35
      FieldName = 'RAZAOSOCIAL'
      Size = 60
    end
    object qryContratoCODMEDIDA: TStringField
      DisplayLabel = 'Unidade~Media'
      DisplayWidth = 4
      FieldName = 'CODMEDIDA'
      Size = 4
    end
    object qryContratoVLRUNITARIO: TFloatField
      DisplayLabel = 'Valor~Unitário'
      DisplayWidth = 10
      FieldName = 'VLRUNITARIO'
    end
    object qryContratoQTDEESPERADA: TFloatField
      DisplayLabel = 'Quantidade'
      DisplayWidth = 10
      FieldName = 'QTDEESPERADA'
    end
    object qryContratoCODARTIGO: TStringField
      DisplayWidth = 14
      FieldName = 'CODARTIGO'
      Visible = False
      Size = 14
    end
    object qryContratoIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
    end
    object qryContratoPRAZOPAG: TFloatField
      FieldName = 'PRAZOPAG'
    end
    object qryContratoIDCOMPRADOR: TFloatField
      FieldName = 'IDCOMPRADOR'
    end
  end
  object qryAux1: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 338
    Top = 172
  end
  object qryAgregProd: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   CODTIPOCUSTAGREG '
      'FROM'
      '   IMPOSTOSXPRODUTOS'
      'WHERE '
      '       (RTRIM(CODPRODUTO) = :CODPRODUTO )'
      '   AND (IDPESSOA   = :IDPESSOA)')
    ValidateWithMask = True
    Left = 501
    Top = 164
    ParamData = <
      item
        DataType = ftString
        Name = 'CODPRODUTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object qryAgregProdCODTIPOCUSTAGREG: TFloatField
      FieldName = 'CODTIPOCUSTAGREG'
      Origin = 'IMPOSTOSXPRODUTOS.CODTIPOCUSTAGREG'
    end
  end
  object qryForn: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     ES.CODESTADO,'
      '     ES.IDPAIS'
      'FROM'
      '    PESSOA P,'
      '    ENDPESS E,'
      '    CIDADES CI,'
      '    ESTADO  ES'
      'WHERE'
      '      (P.IDPESSOA     = :IDPESSOA)'
      '  AND (E.IDPESSOA(+)  = P.IDPESSOA)'
      '  AND (E.IDENDERECO(+)= P.IDENDCOMERCIAL)'
      '  AND (E.IDCIDADES    = CI.IDCIDADES(+))'
      '  AND (ES.IDESTADO(+) = CI.IDESTADO)'
      '')
    ValidateWithMask = True
    Left = 272
    Top = 152
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object qryFornCODESTADO: TStringField
      FieldName = 'CODESTADO'
      Size = 3
    end
    object qryFornIDPAIS: TFloatField
      FieldName = 'IDPAIS'
    end
  end
  object qryParamCompras: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    OPDESTINO'
      'FROM'
      '    PARAMCOMPRAS'
      '')
    ValidateWithMask = True
    Left = 605
    Top = 4
    object qryParamComprasOPDESTINO: TStringField
      FieldName = 'OPDESTINO'
      Origin = 'BASEDADOS.PARAMCOMPRAS.OPDESTINO'
      FixedChar = True
      Size = 1
    end
  end
  object qryPatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PES.IDPESSOA, PES.NOME'
      'FROM PESSOA PES, PATRO PAT'
      'WHERE PES.IDPESSOA = PAT.IDPESSOA'
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 328
    Top = 279
  end
  object qryPrograma: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  '
      '        IDPROGRAMA ,'
      '        DESCPROGRAMA   '
      'FROM PROGRAMA')
    ValidateWithMask = True
    Left = 456
    Top = 319
  end
  object dsPatro: TwwDataSource
    AutoEdit = False
    DataSet = qryPatro
    Left = 409
    Top = 263
  end
  object dsPrograma: TwwDataSource
    AutoEdit = False
    DataSet = qryPrograma
    Left = 545
    Top = 319
  end
  object qryParamAlmox: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      'FROM PARALMOX')
    ValidateWithMask = True
    Left = 512
    Top = 215
    object qryParamAlmoxMASCGRUPOPROD: TStringField
      FieldName = 'MASCGRUPOPROD'
      Origin = 'BASEDADOS.PARALMOX.MASCGRUPOPROD'
      FixedChar = True
      Size = 10
    end
    object qryParamAlmoxIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.PARALMOX.IDPESSOA'
    end
    object qryParamAlmoxCODALTDEVOLUCAO: TFloatField
      FieldName = 'CODALTDEVOLUCAO'
      Origin = 'BASEDADOS.PARALMOX.CODALTDEVOLUCAO'
    end
    object qryParamAlmoxCODTIPDOC: TFloatField
      FieldName = 'CODTIPDOC'
      Origin = 'BASEDADOS.PARALMOX.CODTIPDOC'
    end
    object qryParamAlmoxEXISTEDV: TStringField
      FieldName = 'EXISTEDV'
      Origin = 'BASEDADOS.PARALMOX.EXISTEDV'
      FixedChar = True
      Size = 1
    end
    object qryParamAlmoxRECEBAUTOMATICO: TStringField
      FieldName = 'RECEBAUTOMATICO'
      Origin = 'BASEDADOS.PARALMOX.RECEBAUTOMATICO'
      FixedChar = True
      Size = 1
    end
    object qryParamAlmoxEXISTECOMPRA: TStringField
      FieldName = 'EXISTECOMPRA'
      Origin = 'BASEDADOS.PARALMOX.EXISTECOMPRA'
      FixedChar = True
      Size = 1
    end
    object qryParamAlmoxCODTABPRODUTIL: TStringField
      FieldName = 'CODTABPRODUTIL'
      Origin = 'BASEDADOS.PARALMOX.CODTABPRODUTIL'
      Size = 5
    end
    object qryParamAlmoxEXISTECONTASPAGAR: TStringField
      FieldName = 'EXISTECONTASPAGAR'
      Origin = 'BASEDADOS.PARALMOX.EXISTECONTASPAGAR'
      FixedChar = True
      Size = 1
    end
    object qryParamAlmoxEXISTECONTABIL: TStringField
      FieldName = 'EXISTECONTABIL'
      Origin = 'BASEDADOS.PARALMOX.EXISTECONTABIL'
      FixedChar = True
      Size = 1
    end
    object qryParamAlmoxFLGINFOVALORUN: TStringField
      FieldName = 'FLGINFOVALORUN'
      Origin = 'BASEDADOS.PARALMOX.FLGINFOVALORUN'
      FixedChar = True
      Size = 1
    end
    object qryParamAlmoxDATAREPRESA: TDateTimeField
      FieldName = 'DATAREPRESA'
      Origin = 'BASEDADOS.PARALMOX.DATAREPRESA'
    end
    object qryParamAlmoxDATAULTINTEGRA: TDateTimeField
      FieldName = 'DATAULTINTEGRA'
      Origin = 'BASEDADOS.PARALMOX.DATAULTINTEGRA'
    end
    object qryParamAlmoxTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
      Origin = 'BASEDADOS.PARALMOX.TRGDTINCLUSAO'
    end
    object qryParamAlmoxTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Origin = 'BASEDADOS.PARALMOX.TRGUSERINCLUSAO'
      Size = 30
    end
    object qryParamAlmoxDATAIMPLANTA: TDateTimeField
      FieldName = 'DATAIMPLANTA'
      Origin = 'BASEDADOS.PARALMOX.DATAIMPLANTA'
    end
    object qryParamAlmoxFLGCONTABGRUPO: TStringField
      FieldName = 'FLGCONTABGRUPO'
      Origin = 'BASEDADOS.PARALMOX.FLGCONTABGRUPO'
      FixedChar = True
      Size = 1
    end
    object qryParamAlmoxFLGCONTABTRANSF: TStringField
      FieldName = 'FLGCONTABTRANSF'
      Origin = 'BASEDADOS.PARALMOX.FLGCONTABTRANSF'
      FixedChar = True
      Size = 1
    end
    object qryParamAlmoxPERCREQMAT: TFloatField
      FieldName = 'PERCREQMAT'
      Origin = 'BASEDADOS.PARALMOX.PERCREQMAT'
    end
    object qryParamAlmoxFLGINTEGRALIVRO: TStringField
      FieldName = 'FLGINTEGRALIVRO'
      Origin = 'BASEDADOS.PARALMOX.FLGINTEGRALIVRO'
      FixedChar = True
      Size = 1
    end
    object qryParamAlmoxPERCRECEBCOMOC: TFloatField
      FieldName = 'PERCRECEBCOMOC'
      Origin = 'BASEDADOS.PARALMOX.PERCRECEBCOMOC'
    end
    object qryParamAlmoxCODTIPDOCDEVOL: TFloatField
      FieldName = 'CODTIPDOCDEVOL'
      Origin = 'BASEDADOS.PARALMOX.CODTIPDOCDEVOL'
    end
    object qryParamAlmoxIDPATRO: TFloatField
      FieldName = 'IDPATRO'
      Origin = 'BASEDADOS.PARALMOX.IDPATRO'
    end
    object qryParamAlmoxIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Origin = 'BASEDADOS.PARALMOX.IDPLANOPREV'
    end
    object qryParamAlmoxNUMNOTANFDEVOL: TFloatField
      FieldName = 'NUMNOTANFDEVOL'
      Origin = 'BASEDADOS.PARALMOX.NUMNOTANFDEVOL'
    end
    object qryParamAlmoxFLGUSAGRUPOREQ: TStringField
      FieldName = 'FLGUSAGRUPOREQ'
      Origin = 'BASEDADOS.PARALMOX.FLGUSAGRUPOREQ'
      FixedChar = True
      Size = 1
    end
    object qryParamAlmoxFLGREQSEMSALDO: TStringField
      FieldName = 'FLGREQSEMSALDO'
      Origin = 'BASEDADOS.PARALMOX.FLGREQSEMSALDO'
      FixedChar = True
      Size = 1
    end
    object qryParamAlmoxIDPROGRAMA: TFloatField
      FieldName = 'IDPROGRAMA'
      Origin = 'BASEDADOS.PARALMOX.IDPROGRAMA'
    end
    object qryParamAlmoxFLGCONBILIZAREQ: TStringField
      FieldName = 'FLGCONBILIZAREQ'
      Origin = 'BASEDADOS.PARALMOX.FLGCONBILIZAREQ'
      FixedChar = True
      Size = 1
    end
    object qryParamAlmoxFLGINTEGRAORC: TFloatField
      FieldName = 'FLGINTEGRAORC'
      Origin = 'BASEDADOS.PARALMOX.FLGINTEGRAORC'
    end
  end
  object cdsValUnit: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 181
    Top = 343
  end
  object qryPlano: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * '
      'FROM PLANPREVCONTABIL'
      'WHERE ATIVO = '#39'S'#39
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 64
    Top = 239
  end
  object dsPlano: TwwDataSource
    AutoEdit = False
    DataSet = qryPlano
    Left = 225
    Top = 319
  end
end
