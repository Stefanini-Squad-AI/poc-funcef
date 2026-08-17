inherited frmMedicaoContratosMT: TfrmMedicaoContratosMT
  Left = 287
  Top = 74
  HelpContext = 120002
  Caption = 'Medição de Contratos'
  ClientHeight = 683
  ClientWidth = 863
  PixelsPerInch = 96
  TextHeight = 13
  object Label13: TLabel [0]
    Left = 522
    Top = 57
    Width = 80
    Height = 13
    Caption = 'Data Medição'
  end
  inherited pnlFundo: TPanel
    Width = 863
    Height = 597
    inherited tbcDetalhe: TTabControlDetalhe [0]
      Top = 227
      Width = 861
      Height = 369
      Tabs.Strings = (
        'Itens'
        'Observação do Contrato'
        'Ficha de Compensação'
        'Nota Fiscal de Serviço'
        'Tributação'
        'ANS')
      detdbGrids.Strings = (
        'dbgrdDet'
        ''
        ''
        ''
        'dbgrdTributacao'
        'dbgrdANS')
      inherited pgctrlDetalhe: TPageControl
        Width = 763
        Height = 310
        inherited tbsDet: TTabSheet
          Caption = 'Itens'
          inherited dbgrdDet: TwwDBGrid [0]
            Width = 755
            Height = 282
            Selected.Strings = (
              'NOME_ITEM'#9'20'#9'Item'#9'F'
              'NOMEOBJETO'#9'22'#9'Objeto'#9'F'
              'QTDEMEDICAO'#9'10'#9'Quantidade'#9'F'
              'VALORUNITARIOOBJETO'#9'12'#9'Valor Unitário'#9'F'
              'VALORMEDICAO'#9'14'#9'Valor da Medição'#9'F'
              'PARCELANUM'#9'10'#9'Prox. Parc.'#9'F'
              'NUMPARC2'#9'10'#9'Qtd. Parc.'#9'F')
            OnRowChanged = dbgrdDetRowChanged
            UseTFields = False
          end
          inherited pnlControlesDet: TPanel [1]
            Width = 755
            Height = 282
            object pnlItemDados: TPanel
              Left = 0
              Top = 0
              Width = 462
              Height = 282
              Align = alLeft
              BevelInner = bvLowered
              BevelOuter = bvLowered
              TabOrder = 0
              object Label7: TLabel
                Left = 8
                Top = 10
                Width = 25
                Height = 13
                Caption = 'Item'
              end
              object Label12: TLabel
                Left = 8
                Top = 97
                Width = 69
                Height = 13
                Caption = 'Observação'
              end
              object Label8: TLabel
                Left = 8
                Top = 54
                Width = 94
                Height = 13
                Caption = 'Serviço/Produto'
              end
              object Label2: TLabel
                Left = 8
                Top = 138
                Width = 66
                Height = 13
                Caption = 'Quantidade'
              end
              object Label3: TLabel
                Left = 9
                Top = 187
                Width = 78
                Height = 13
                Caption = 'Valor Unitário'
              end
              object Label1: TLabel
                Left = 191
                Top = 188
                Width = 63
                Height = 13
                Caption = 'Valor Total'
              end
              object lblParcela: TLabel
                Left = 191
                Top = 138
                Width = 44
                Height = 13
                Caption = 'Parcela'
              end
              object lblDe: TLabel
                Left = 235
                Top = 158
                Width = 15
                Height = 13
                Caption = 'de'
              end
              object dblcItem: TwwDBLookupCombo
                Left = 8
                Top = 25
                Width = 360
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'NOME_ITEM'#9'30'#9'Item')
                DataField = 'IDITEM'
                DataSource = dsDet
                LookupTable = cdsItem
                LookupField = 'IDITEM'
                Style = csDropDownList
                TabOrder = 0
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
                ShowMatchText = True
                OnChange = dblcItemChange
              end
              object dbeObservacao: TwwDBEdit
                Left = 8
                Top = 112
                Width = 431
                Height = 21
                DataField = 'OBSERVACAO'
                DataSource = dsDet
                TabOrder = 1
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
              end
              object dblcObjeto: TwwDBLookupCombo
                Left = 8
                Top = 69
                Width = 432
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'NOMEOBJETO'#9'30'#9'Objeto')
                DataField = 'IDOBJETO'
                DataSource = dsDet
                LookupTable = cdsObjeto
                LookupField = 'IDOBJETO'
                Style = csDropDownList
                TabOrder = 2
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
                ShowMatchText = True
                OnChange = dblcObjetoChange
              end
              object reValor: TRealEdit
                Left = 385
                Top = 25
                Width = 57
                Height = 21
                TabStop = False
                Alignment = taRightJustify
                Color = clScrollBar
                Enabled = False
                Lines.Strings = (
                  '      0,00')
                TabOrder = 3
                Visible = False
                WordWrap = False
                IntDigits = 10
                DecDigits = 2
                NumberFormat = fNumber
                Signal = False
              end
              object dbeQuantidade: TDBRealEdit
                Left = 8
                Top = 153
                Width = 129
                Height = 21
                TabStop = False
                Alignment = taRightJustify
                Lines.Strings = (
                  '0,00')
                TabOrder = 4
                WordWrap = False
                OnChange = dbeQuantidadeChange
                IntDigits = 10
                DecDigits = 2
                NumberFormat = fNumber
                Signal = False
                DataField = 'QTDEMEDICAO'
                DataSource = dsDet
              end
              object dbeValorUnitario: TDBRealEdit
                Left = 9
                Top = 202
                Width = 137
                Height = 21
                TabStop = False
                Alignment = taRightJustify
                Lines.Strings = (
                  '0,00')
                TabOrder = 5
                WordWrap = False
                OnChange = dbeValorUnitarioChange
                IntDigits = 10
                DecDigits = 2
                NumberFormat = fNumber
                Signal = False
                DataField = 'VALORUNITARIOOBJETO'
                DataSource = dsDet
              end
              object dbeValorTotal: TDBRealEdit
                Left = 192
                Top = 203
                Width = 137
                Height = 21
                TabStop = False
                Alignment = taRightJustify
                Color = clMenu
                Enabled = False
                Lines.Strings = (
                  '0,00')
                ReadOnly = True
                TabOrder = 6
                WordWrap = False
                IntDigits = 10
                DecDigits = 2
                NumberFormat = fNumber
                Signal = False
                DataField = 'VALORMEDICAO'
                DataSource = dsDet
              end
              object btnRateioDif: TButton
                Left = 294
                Top = 243
                Width = 143
                Height = 25
                Caption = 'Rateio Diferenciado'
                TabOrder = 7
                OnClick = btnRateioDifClick
              end
              object dbedtPARCELANUM: TwwDBEdit
                Left = 192
                Top = 153
                Width = 41
                Height = 21
                TabStop = False
                Color = clBtnFace
                DataField = 'PARCELANUM'
                DataSource = dsDet
                Enabled = False
                TabOrder = 8
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
              end
              object dbedtNUMPARCELAS: TwwDBEdit
                Left = 253
                Top = 153
                Width = 41
                Height = 21
                TabStop = False
                Color = clBtnFace
                DataField = 'NUMPARC2'
                DataSource = dsDet
                Enabled = False
                TabOrder = 9
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
              end
              object rbPadrao: TRadioButton
                Left = 10
                Top = 247
                Width = 115
                Height = 17
                Caption = 'Rateio Padrão'
                Checked = True
                TabOrder = 10
                TabStop = True
                OnClick = rbPadraoClick
              end
              inline molOrcamento1: TmolOrcamento
                Left = 343
                Top = 137
                Width = 101
                TabOrder = 11
                inherited edtCompOrc: TDBRealEdit
                  Lines.Strings = ()
                end
              end
              object rbRateioFDO: TRadioButton
                Left = 139
                Top = 247
                Width = 116
                Height = 17
                Caption = 'Rateio via FDO:'
                TabOrder = 12
                TabStop = True
                OnClick = rbRateioFDOClick
              end
            end
            object pnlListaFDO: TPanel
              Left = 462
              Top = 0
              Width = 296
              Height = 282
              Align = alLeft
              BevelInner = bvLowered
              BevelOuter = bvLowered
              TabOrder = 1
              object Panel3: TPanel
                Left = 2
                Top = 251
                Width = 292
                Height = 29
                Align = alBottom
                BevelInner = bvLowered
                TabOrder = 0
                object Label27: TLabel
                  Left = 113
                  Top = 9
                  Width = 34
                  Height = 13
                  Caption = 'Total:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object btnRateioFDO: TSpeedButton
                  Left = 8
                  Top = 5
                  Width = 71
                  Height = 21
                  Hint = 'Processar o rateio'
                  Caption = 'Ratear'
                  Flat = True
                  Glyph.Data = {
                    36050000424D3605000000000000360400002800000010000000100000000100
                    08000000000000010000C40E0000C40E00000001000000000000000000008080
                    8000000080000080800000800000808000008000000080008000408080004040
                    0000FF80000080400000FF00400000408000FFFFFF00C0C0C0000000FF0000FF
                    FF0000FF0000FFFF0000FF000000FF00FF0080FFFF0080FF0000FFFF8000FF80
                    80008000FF004080FF00C0DCC000F0CAA6000800000010000000180000002100
                    0000290000003100000039000000100800000008080018080000420000004A00
                    000021080000520000005A000000290800001808080031080000630000002108
                    080039080000290808006B000000420800004A08000031080800730000007B00
                    00003908080052080000101008004208080018100800840000005A0800008C00
                    00004A08080063080000211008002910080094000000520808006B0800007308
                    0000311008005A080800211010009C0000006B0808006308080029101000A500
                    00007B080000391008003110100073080800421008004A100800840800008C08
                    00005210080039101000940800005A100800421010006B1000007B1000004A10
                    1000211810006310080073100000291810008410000052101000181818008C10
                    0000311810009C0808005A1010007310080029181800391810006B180000A508
                    0800631010007B100800731010006B10100031181800AD080800421810005A18
                    08007B180000391818007B101000521810008410100042181800841800008C10
                    10004A1818009C100800941010006B181000521818005A181800731810003121
                    18007B18100039211800631818006B1818004221180029212100841810007B18
                    1800B5101000731818004A2118008C181000522118007B210800841818008421
                    08005A211800732110008C18180063211800AD1810008C2108004A2121009C18
                    18006B211800732118007B211800312929009C211000422921006B2121008421
                    1800392929008C21180094211800732121007B2121005A292100842121005229
                    2100632921008C2910007B2918008C21210084291800AD2118009C2121007329
                    2100A52121007B292100BD211800842921008C292100942921008C3118009C29
                    21008C292900842929007B31210094311800523131009C2929009C311800AD29
                    29008C312900A531210073313100AD31210094312900523931009C312900B531
                    210094313100A53129008C313100943921009C3131009C392100A53921008C39
                    2900A5313100AD313100B53131007B393900943931009C393100A5393100AD39
                    3100C63929009C3939009C422900A5393900AD39390094423100A5422900B539
                    3900BD393900C63939009C423900B5423100A5423900A54A2900B5423900AD42
                    39009C424200A5424200AD424200A54A3900B5424200B54A3100BD424200AD4A
                    3900D64239009C4A4200C64A3900AD4A4200CE4A3900B54A42000F0F0F0F0F0F
                    00010F0F0F0F0F0F0F0F0F0F0F0F0F0F0100010F0F0F0F0F0F0F0F0F0F0F0F0F
                    0F0000010F0F0F0F0F0F0F0F0F0F0F0F0F001100010F0F0F0F0F0F0F0F0F0F00
                    0000001100010F0F0F0F0F0F0F0F0F0011110E111100010F0F0F0F0F0F0F0F0F
                    000E11000000000F0F0F0F0F0F0F0F0F00110E1100010F0F0F0F0F0F0F000000
                    0000110E1100010F0F0F0F0F0F000E110E110E110E1100010F0F0F0F0F0F000E
                    110E11000000000F0F0F0F0F0F0F00110E110E1100010F0F0F0F0F0F0F0F0F00
                    110E110E1100010F0F0F0F0F0F0F0F000F0F0F110F0F00010F0F0F0F0F0F0F0F
                    000F110F0F110F00010F0F0F0F0F0F0F0000000000000000000F}
                  ParentShowHint = False
                  ShowHint = True
                  Spacing = 8
                  OnClick = btnRateioFDOClick
                end
                object meTotalFDOS: TDBRealEdit
                  Left = 150
                  Top = 4
                  Width = 125
                  Height = 21
                  TabStop = False
                  Alignment = taRightJustify
                  Color = clMenu
                  Enabled = False
                  Lines.Strings = (
                    '0,00')
                  ReadOnly = True
                  TabOrder = 0
                  WordWrap = False
                  IntDigits = 10
                  DecDigits = 2
                  NumberFormat = fNumber
                  Signal = False
                end
              end
              object Panel5: TPanel
                Left = 2
                Top = 2
                Width = 292
                Height = 30
                Align = alTop
                BevelInner = bvLowered
                TabOrder = 1
                object btnRateioOk: TSpeedButton
                  Left = 262
                  Top = 5
                  Width = 20
                  Height = 20
                  Hint = 'Visualiza do rateio efetuado'
                  Enabled = False
                  Flat = True
                  Glyph.Data = {
                    76010000424D7601000000000000760000002800000020000000100000000100
                    0400000000000001000000000000000000001000000000000000000000000000
                    8000008000000080800080000000800080008080000080808000C0C0C0000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                    8888888888888888888888888888888888888888888888888888888188888888
                    88888887F88888888888888118888888888888877F8888888888888111888888
                    8888888777F888888888888811100008888888887777777888888888810E8E80
                    88888888877888878888888880E8E8E80888888887F8888878888888808E8E8E
                    0888888887F888887888888880E8E8E80888888887F8888878888888808E8E8E
                    08888888878F8888788888888808E8E0888888888878FFF78888888888800008
                    8888888888877778888888888888888888888888888888888888888888888888
                    8888888888888888888888888888888888888888888888888888}
                  NumGlyphs = 2
                  ParentShowHint = False
                  ShowHint = True
                  Spacing = 5
                  OnClick = btnRateioOkClick
                end
                object Label26: TLabel
                  Left = 8
                  Top = 9
                  Width = 87
                  Height = 13
                  Caption = 'Informe o FDO:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object btnIncluirFDO: TSpeedButton
                  Left = 212
                  Top = 5
                  Width = 20
                  Height = 20
                  Hint = 'Inclui FDO na lista'
                  Flat = True
                  Glyph.Data = {
                    36050000424D3605000000000000360400002800000010000000100000000100
                    08000000000000010000C40E0000C40E00000001000000000000000000000000
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
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00070707070000
                    0000000000000000000007070707FFFFFFFFFFFFFFFFFFFFFF0007070707FFFF
                    0000FF00000000FFFF0007070707FFFFFFFFFFFFFFFFFFFFFF0007070707FF00
                    0000FF0000FF0000FF0007070707FA020200FFFFFFFFFFFFFF0007070707FA02
                    0200FF0000FF0000FF0007070707FA020200FFFFFFFFFFFFFF0007000000FA02
                    020000000000FFFFFF00FA0202020202020202020200FFFFFF00FA0202020202
                    02020202020000000000FAFAFAFAFA0202FAFAFAFAFF00FF000707070707FA02
                    0200FFFFFFFF0000070707070707FA020200000000000007070707070707FA02
                    0200070707070707070707070707FAFAFA070707070707070707}
                  ParentShowHint = False
                  ShowHint = True
                  OnClick = btnIncluirFDOClick
                end
                object btnExcFDO: TSpeedButton
                  Left = 235
                  Top = 5
                  Width = 20
                  Height = 20
                  Hint = 'Exclui FDO selecionado da lista'
                  Flat = True
                  Glyph.Data = {
                    F6000000424DF600000000000000760000002800000010000000100000000100
                    04000000000080000000C40E0000C40E00001000000000000000000000000000
                    8000008000000080800080000000800080008080000080808000C0C0C0000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
                    777777770000000000007777FFFFFFFFFFF07777FF00F0000FF07777FFFFFFFF
                    FFF07777F000F00F00F07777FFFFFFFFFFF07777FF00F00F00F07777FFFFFFFF
                    FFF0700000000000FFF0999999999990FFF099999999999F000011111111111F
                    0F077777FFFFFFFF007777770000000007777777777777777777}
                  ParentShowHint = False
                  ShowHint = True
                  Spacing = 0
                  OnClick = btnExcFDOClick
                end
                object edNumFDO: TMaskEdit
                  Left = 96
                  Top = 5
                  Width = 112
                  Height = 21
                  Hint = 'Use a tecle + para inserir o item na lista'
                  EditMask = '!\F\D\O\-999\-99\/9999;1; '
                  MaxLength = 15
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 0
                  Text = 'FDO-   -  /    '
                  OnKeyPress = edNumFDOKeyPress
                end
              end
              object lvListadeFDOS: TListView
                Left = 2
                Top = 54
                Width = 292
                Height = 197
                Align = alClient
                Color = clWhite
                Columns = <
                  item
                    Caption = 'Nº FDO'
                    ImageIndex = 16
                    MaxWidth = 146
                    Width = 146
                  end
                  item
                    Alignment = taRightJustify
                    Caption = 'Valor'
                    ImageIndex = 15
                    MaxWidth = 150
                    Width = 125
                  end>
                ColumnClick = False
                DragMode = dmAutomatic
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                FlatScrollBars = True
                GridLines = True
                HideSelection = False
                IconOptions.WrapText = False
                RowSelect = True
                ParentFont = False
                SmallImages = ImageList1
                TabOrder = 2
                TabStop = False
                ViewStyle = vsReport
                OnCustomDrawItem = lvListadeFDOSCustomDrawItem
                OnEditing = lvListadeFDOSEditing
              end
              object Panel1: TPanel
                Left = 2
                Top = 32
                Width = 292
                Height = 22
                Align = alTop
                BevelInner = bvLowered
                BevelOuter = bvNone
                Caption = 'Panel1'
                TabOrder = 3
                object spbLimparLista: TSpeedButton
                  Left = 269
                  Top = 1
                  Width = 20
                  Height = 20
                  Hint = 'Limpa a lista de FDOs selecionados'
                  Flat = True
                  Glyph.Data = {
                    36030000424D3603000000000000360000002800000010000000100000000100
                    18000000000000030000C40E0000C40E00000000000000000000C6C3C6C6C3C6
                    C6C3C6C6C3C60000000000000000000000000000000000000000000000000000
                    00000000000000000000C6C3C6C6C3C6C6C3C6C6C3C6FFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000C6C3C6C6C3C6
                    C6C3C6C6C3C6FFFFFFFFFFFF000000000000FFFFFF0000000000000000000000
                    00FFFFFFFFFFFF000000C6C3C6C6C3C6C6C3C6C6C3C6FFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000C6C3C6C6C3C6
                    C6C3C6C6C3C6FFFFFF000000000000000000FFFFFF000000000000FFFFFF0000
                    00000000FFFFFF000000C6C3C6C0C0C0C0C0C0C0C0C0FFFFFFFFFFFFFFFFFFFF
                    00FFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000C6C3C6C0C0C0
                    C0C0C0C0C0C0FFFFFFFFFFFF00007B0000FF00007B00007BFFFFFFFFFFFF0000
                    00000000FFFFFF000000C6C3C6C0C0C0C0C0C0C0C0C0FFFFFF00007B0000FF00
                    FFFF0000FF00007B00007BFFFFFFFFFFFFFFFFFFFFFFFF000000C6C3C6C0C0C0
                    C0C0C000000000007B0000FF00FFFF0000FFFF00FFFF00FF00007BFFFFFFFFFF
                    FFFFFFFFFFFFFF000000C6C3C6C0C0C0C0C0C000000000FF000000000000FFFF
                    00FFFF00FF0000FF00007BFFFFFFFFFFFFFFFFFFFFFFFF000000C6C3C6000000
                    00000000FF0000FF0000FF00000000FF00FF0000FF00007BFFFFFFFFFFFF0000
                    00000000000000000000C6C3C600000000000000000000FF0000FF00007D0000
                    0000000000FFFFFFFFFFFFFFFFFF000000FFFFFF000000C6C3C600000000FFFF
                    00FFFF000000000000007D00007D00000000FFFFFFFFFFFFFFFFFFFFFFFF0000
                    00000000C6C3C6C6C3C600FFFFC0C0C000FFFF007D7B00000000000000000000
                    0000000000000000000000000000000000C6C3C6C6C3C6C6C3C6C6C3C600FFFF
                    00FFFF007D7B007D7B000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C6C3C6C6C3
                    C6C6C3C6C6C3C6C6C3C600FFFF00FFFF007D7B007D7B000000000000C0C0C0C0
                    C0C0C0C0C0C0C0C0C0C0C0C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6}
                  ParentShowHint = False
                  ShowHint = True
                  OnClick = spbLimparListaClick
                end
                object Panel6: TPanel
                  Left = 1
                  Top = 1
                  Width = 267
                  Height = 21
                  BevelInner = bvLowered
                  BevelOuter = bvNone
                  Caption = 'Lista de FDO´s'
                  Color = 8404992
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWhite
                  Font.Height = -15
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TabOrder = 0
                end
              end
            end
          end
        end
        object tbsObsContrato: TTabSheet
          Caption = 'Observação do Contrato'
          ImageIndex = 1
          object DBObservacao: TDBMemo
            Left = 0
            Top = 0
            Width = 755
            Height = 282
            Align = alClient
            DataField = 'OBSERVACAO'
            DataSource = dsContratos
            MaxLength = 500
            ReadOnly = True
            ScrollBars = ssVertical
            TabOrder = 0
          end
        end
        object tbsFicha: TTabSheet
          Caption = 'Ficha de Compensação'
          ImageIndex = 2
          object GroupBox4: TGroupBox
            Left = 12
            Top = 18
            Width = 437
            Height = 61
            Caption = 'Nr. da Ficha de Compensação'
            TabOrder = 0
            object Label15: TLabel
              Left = 8
              Top = 16
              Width = 98
              Height = 13
              Caption = 'Código de Barras'
            end
            object Label16: TLabel
              Left = 223
              Top = 16
              Width = 86
              Height = 13
              Caption = 'Linha Digitável'
            end
            object DBedtCodBarra: TwwDBEdit
              Left = 8
              Top = 32
              Width = 201
              Height = 21
              DataField = 'NUMLEITCODBARRAS'
              DataSource = ds
              TabOrder = 0
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object DBEdtLinhaDig: TwwDBEdit
              Left = 222
              Top = 32
              Width = 201
              Height = 21
              DataField = 'NUMDIGCODBARRAS'
              DataSource = ds
              MaxLength = 47
              TabOrder = 1
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
          end
        end
        object tbsNFS: TTabSheet
          Caption = 'Nota Fiscal de Serviço'
          ImageIndex = 4
          object Label14: TLabel
            Left = 10
            Top = 5
            Width = 98
            Height = 13
            Caption = 'Núm. Nota Fiscal'
          end
          object Label18: TLabel
            Left = 221
            Top = 5
            Width = 81
            Height = 13
            Caption = 'Núm. de Série'
          end
          object Label19: TLabel
            Left = 10
            Top = 62
            Width = 99
            Height = 13
            Caption = 'Dados Adicionais'
          end
          object Label20: TLabel
            Left = 516
            Top = 5
            Width = 64
            Height = 13
            Caption = 'Valor Bruto'
          end
          object Label21: TLabel
            Left = 369
            Top = 5
            Width = 96
            Height = 13
            Caption = 'Data de Emissão'
          end
          object Label22: TLabel
            Left = 10
            Top = 111
            Width = 241
            Height = 13
            Caption = 'Atividade, Produto ou Serviço relacionado'
          end
          object dbEdtNumNFS: TwwDBEdit
            Left = 10
            Top = 19
            Width = 183
            Height = 21
            DataField = 'NFSNUMERO'
            DataSource = ds
            TabOrder = 0
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbEdtNumSerieNFS: TwwDBEdit
            Left = 221
            Top = 19
            Width = 121
            Height = 21
            DataField = 'NFSSERIE'
            DataSource = ds
            TabOrder = 1
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbDtpDataEmissaoNFS: TCMDateTimePicker
            Left = 369
            Top = 19
            Width = 121
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            DataField = 'NFSDATAEMISSAO'
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
            TabOrder = 2
            DisplayFormat = 'dd/MM/yyyy'
          end
          object edtVlrBruto: TRealEdit
            Left = 516
            Top = 19
            Width = 121
            Height = 21
            Alignment = taRightJustify
            Enabled = False
            Lines.Strings = (
              '0,00')
            TabOrder = 3
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
          object dbMmObsNFS: TDBMemo
            Left = 10
            Top = 80
            Width = 625
            Height = 25
            DataField = 'NFSOBS'
            DataSource = ds
            ScrollBars = ssVertical
            TabOrder = 4
          end
          object cmProcListaServicos: TCMProcura
            Left = 10
            Top = 125
            Width = 556
            Height = 27
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            MostraMensagens = True
            Mensagens.EmBranco = 'Chave não pode estar em branco'
            Mensagens.NaoExiste = 'Chave não existe'
            PermiteChaveInvalida = False
            PermiteChaveEmBranco = False
            OnApertouBotao = cmProcListaServicosApertouBotao
            OnValidaDados = cmProcListaServicosValidaDados
            DataSource = ds
            DataField = 'NFSSERVICO'
            LookupChave = 'IDSERVICO'
            LookupDescricao = 'NOME'
            MontaSelect = msListaServico
            LookupTabela = 'LISTA_SERVICOS'
            DataBaseName = 'BASEDADOS'
            ReadOnly = True
          end
          object btnAddAlteradores: TBitBtn
            Left = 581
            Top = 125
            Width = 145
            Height = 27
            Caption = 'Adicionar tributação'
            TabOrder = 6
            Visible = False
            OnClick = btnAddAlteradoresClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333303333
              333333333337FF3333333333330003333333333333777F333333333333080333
              3333333F33777FF33F3333B33B000B33B3333373F777773F7333333BBB0B0BBB
              33333337737F7F77F333333BBB0F0BBB33333337337373F73F3333BBB0F7F0BB
              B333337F3737F73F7F3333BB0FB7BF0BB3333F737F37F37F73FFBBBB0BF7FB0B
              BBB3773F7F37337F377333BB0FBFBF0BB333337F73F333737F3333BBB0FBF0BB
              B3333373F73FF7337333333BBB000BBB33333337FF777337F333333BBBBBBBBB
              3333333773FF3F773F3333B33BBBBB33B33333733773773373333333333B3333
              333333333337F33333333333333B333333333333333733333333}
            NumGlyphs = 2
          end
          object chkOptanteSimples: TCheckBox
            Left = 10
            Top = 43
            Width = 415
            Height = 17
            Caption = 'Empresa isenta de tributação ou optante pelo Simples Nacional'
            TabOrder = 7
            OnClick = chkOptanteSimplesClick
          end
        end
        object tbsTributacao: TTabSheet
          Caption = 'Tributação'
          ImageIndex = 5
          object pnlTributacao: TPanel
            Left = 0
            Top = 0
            Width = 755
            Height = 282
            Align = alClient
            TabOrder = 1
            object lblDataLanctoTrib: TLabel
              Left = 339
              Top = 58
              Width = 119
              Height = 13
              Caption = 'Data de Lançamento'
            end
            object lblValorTrib: TLabel
              Left = 10
              Top = 58
              Width = 95
              Height = 13
              Caption = 'Valor Tributação'
            end
            object Label23: TLabel
              Left = 174
              Top = 58
              Width = 121
              Height = 13
              Caption = 'Valor Base Retenção'
            end
            object Label24: TLabel
              Left = 10
              Top = 10
              Width = 124
              Height = 13
              Caption = 'Alterador de retenção'
            end
            object Label25: TLabel
              Left = 10
              Top = 107
              Width = 142
              Height = 13
              Caption = 'Histórico de Lançamento'
            end
            object dtpDataLancTrib: TCMDateTimePicker
              Left = 339
              Top = 74
              Width = 121
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATALANCTO'
              DataSource = dsTributacao
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
            object lkpAlteradorTrib: TwwDBLookupCombo
              Left = 10
              Top = 26
              Width = 449
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'50'#9'Alterador'#9'F')
              DataField = 'CODALTERADOR'
              DataSource = dsTributacao
              LookupTable = cdsAlterador
              LookupField = 'CODALTERADOR'
              TabOrder = 0
              AutoDropDown = False
              ShowButton = True
              AllowClearKey = False
            end
            object edtHistoricoTrib: TwwDBEdit
              Left = 10
              Top = 123
              Width = 449
              Height = 21
              DataField = 'HISTORICOCOMPL'
              DataSource = dsTributacao
              TabOrder = 2
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object edtValorTrib: TDBRealEdit
              Left = 10
              Top = 74
              Width = 160
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              TabOrder = 3
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'VALOR'
              DataSource = dsTributacao
            end
            object edtValorBaseTrib: TDBRealEdit
              Left = 174
              Top = 74
              Width = 160
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              TabOrder = 4
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'VALORBASERETENCAO'
              DataSource = dsTributacao
            end
          end
          object dbgrdTributacao: TwwDBGrid
            Left = 0
            Top = 0
            Width = 755
            Height = 282
            Selected.Strings = (
              'DESCRICAO'#9'30'#9'Tributo'#9'F'
              'DATALANCTO'#9'15'#9'Data Lançamento'#9'F'
              'VALOR'#9'15'#9'Valor Tributação'#9'F'
              'VALORBASERETENCAO'#9'20'#9'Valor Base de Retenção'#9'F'
              'HISTORICOCOMPL'#9'52'#9'Histórico Lançamento'#9'F')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsTributacao
            TabOrder = 0
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            OnDrawDataCell = dbgrdTributacaoDrawDataCell
            IndicatorColor = icBlack
          end
        end
        object tbsANS: TTabSheet
          Caption = 'ANS'
          ImageIndex = 3
          object dbgrdANS: TwwDBGrid
            Left = 0
            Top = 0
            Width = 755
            Height = 282
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsANS
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            TabOrder = 1
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            IndicatorColor = icBlack
          end
          object Panel4: TPanel
            Left = 0
            Top = 0
            Width = 755
            Height = 282
            Align = alClient
            TabOrder = 0
            object lblRef: TLabel
              Left = 8
              Top = 87
              Width = 92
              Height = 13
              Caption = 'Mês/Referência'
            end
            object lblNumCI: TLabel
              Left = 8
              Top = 48
              Width = 64
              Height = 13
              Caption = 'Solicitação'
            end
            object lblVlrMensal: TLabel
              Left = 9
              Top = 10
              Width = 88
              Height = 13
              Caption = 'Parcela Mensal'
            end
            object lblVlrANS: TLabel
              Left = 158
              Top = 10
              Width = 101
              Height = 13
              Caption = 'Penalidade (ANS)'
            end
            object lblObs: TLabel
              Left = 296
              Top = 9
              Width = 75
              Height = 13
              Caption = 'Observações'
            end
            object dbedtNumCI: TwwDBEdit
              Left = 8
              Top = 64
              Width = 281
              Height = 21
              DataField = 'NUMCI'
              DataSource = dsANS
              TabOrder = 3
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dbmmoObs: TDBMemo
              Left = 296
              Top = 24
              Width = 417
              Height = 99
              DataField = 'OBS'
              DataSource = dsANS
              ScrollBars = ssVertical
              TabOrder = 2
            end
            object dbedtVlrMensal: TDBRealEdit
              Left = 9
              Top = 24
              Width = 131
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              TabOrder = 0
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'VLRMENSAL'
              DataSource = dsANS
            end
            object dbedtVlrANS: TDBRealEdit
              Left = 158
              Top = 24
              Width = 131
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              TabOrder = 1
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'VLRANS'
              DataSource = dsANS
            end
            object medtRef: TMaskEdit
              Left = 7
              Top = 100
              Width = 121
              Height = 21
              EditMask = '99/9999;1;_'
              MaxLength = 7
              TabOrder = 4
              Text = '  /    '
              OnKeyPress = medtRefKeyPress
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 853
        object lblVlrTotalANS: TLabel [0]
          Left = 727
          Top = 8
          Width = 110
          Height = 13
          Caption = 'R$ 000.000.000,00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Visible = False
        end
        object lblTotalANS: TLabel [1]
          Left = 586
          Top = 8
          Width = 138
          Height = 13
          Caption = 'Total Penalidade (ANS):'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Visible = False
        end
      end
      inherited Dock974: TDock97
        Left = 767
        Height = 310
      end
    end
    inherited pnlMestre: TPanel [1]
      Width = 861
      Height = 226
      object lblContrato: TLabel
        Left = 8
        Top = 4
        Width = 49
        Height = 13
        Caption = 'Contrato'
      end
      object Label9: TLabel
        Left = 519
        Top = 40
        Width = 98
        Height = 13
        Caption = 'Num. Documento'
      end
      object Label10: TLabel
        Left = 622
        Top = 57
        Width = 7
        Height = 13
        Caption = '/'
      end
      object Label4: TLabel
        Left = 519
        Top = 4
        Width = 66
        Height = 13
        Caption = 'Dt Medição'
      end
      object lblFormaPG: TLabel
        Left = 8
        Top = 40
        Width = 120
        Height = 13
        Caption = 'Forma de Pagamento'
        Enabled = False
      end
      object Label11: TLabel
        Left = 329
        Top = 80
        Width = 69
        Height = 13
        Caption = 'Observação'
      end
      object Label6: TLabel
        Left = 749
        Top = 4
        Width = 84
        Height = 13
        Caption = 'Dt Vencimento'
      end
      object Label5: TLabel
        Left = 8
        Top = 185
        Width = 134
        Height = 13
        Caption = 'Histórico Complementar'
      end
      object lblDataLanc: TLabel
        Left = 634
        Top = 4
        Width = 87
        Height = 13
        Caption = 'Dt Lançamento'
      end
      object dblcContrato: TwwDBLookupCombo
        Left = 8
        Top = 18
        Width = 313
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMECONTRATO'#9'30'#9'Nome'#9'F'
          'CODCONTRATOEMPR'#9'20'#9'Nr. Processo'#9'F')
        DataField = 'IDCONTRATO'
        DataSource = ds
        LookupTable = cdsContratos
        LookupField = 'IDCONTRATO'
        Options = [loColLines, loTitles]
        Style = csDropDownList
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnChange = dblcContratoChange
        OnCloseUp = dblcContratoCloseUp
        OnEnter = dblcContratoEnter
        OnExit = dblcContratoExit
      end
      object edDataMEdicao: TCMDateTimePicker
        Left = 519
        Top = 18
        Width = 97
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        DataField = 'DATAMEDICAO'
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
        TabOrder = 2
        DisplayFormat = 'dd/MM/yyyy'
      end
      object edDataVenc: TCMDateTimePicker
        Left = 749
        Top = 18
        Width = 97
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        DataField = 'DATAPREVISTAVENC'
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
        TabOrder = 4
        DisplayFormat = 'dd/MM/yyyy'
        OnCloseUp = edDataVencExit
        OnExit = edDataVencExit
      end
      object dblcFormaPG: TwwDBLookupCombo
        Left = 8
        Top = 54
        Width = 313
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'30'#9'Descrição')
        DataField = 'CODFORMA'
        DataSource = ds
        LookupTable = cdsFormasPagamento
        LookupField = 'CODFORMA'
        Style = csDropDownList
        Enabled = False
        TabOrder = 7
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnChange = dblcFormaPGChange
        OnExit = dblcFormaPGExit
      end
      object GpConta: TGroupBox
        Left = 8
        Top = 89
        Width = 313
        Height = 58
        Caption = 'Conta Bancária '
        TabOrder = 8
        object lblBanco: TLabel
          Left = 10
          Top = 15
          Width = 37
          Height = 13
          Caption = 'Banco'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblNo: TLabel
          Left = 118
          Top = 14
          Width = 19
          Height = 13
          Caption = 'Nº '
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblAgencia: TLabel
          Left = 58
          Top = 15
          Width = 47
          Height = 13
          Caption = 'Agência'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object BtnBuscaContaCor: TSpeedButton
          Left = 277
          Top = 26
          Width = 25
          Height = 25
          Hint = 'Altera Conta Bancária'
          Enabled = False
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            33033333333333333F7F3333333333333000333333333333F777333333333333
            000333333333333F777333333333333000333333333333F77733333333333300
            033333333FFF3F777333333700073B703333333F7773F77733333307777700B3
            33333377333777733333307F8F8F7033333337F333F337F3333377F8F9F8F773
            3333373337F3373F3333078F898F870333337F33F7FFF37F333307F99999F703
            33337F377777337F3333078F898F8703333373F337F33373333377F8F9F8F773
            333337F3373337F33333307F8F8F70333333373FF333F7333333330777770333
            333333773FF77333333333370007333333333333777333333333}
          NumGlyphs = 2
          OnClick = BtnBuscaContaCorClick
        end
        object dbeBanco: TwwDBEdit
          Left = 10
          Top = 30
          Width = 42
          Height = 21
          DataField = 'NUMBANCO'
          DataSource = ds
          TabOrder = 0
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbeAgencia: TwwDBEdit
          Left = 58
          Top = 30
          Width = 55
          Height = 21
          DataField = 'NUMAGENCIA'
          DataSource = ds
          TabOrder = 1
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbeConta: TwwDBEdit
          Left = 118
          Top = 30
          Width = 155
          Height = 21
          DataField = 'CONTACORRENTE'
          DataSource = ds
          TabOrder = 2
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
      end
      object dbeComplDoc: TwwDBEdit
        Left = 634
        Top = 54
        Width = 41
        Height = 21
        DataField = 'COMPLDOCUMENTO'
        DataSource = ds
        TabOrder = 6
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbeNumDocumento: TDBRealEdit
        Left = 519
        Top = 54
        Width = 97
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '0')
        TabOrder = 5
        WordWrap = False
        OnExit = dbeNumDocumentoExit
        IntDigits = 10
        DecDigits = 0
        NumberFormat = iNumber
        Signal = False
        DataField = 'NODOCUMENTO'
        DataSource = ds
      end
      object dbmemoObs: TDBMemo
        Left = 329
        Top = 94
        Width = 517
        Height = 73
        DataField = 'OBS'
        DataSource = ds
        ScrollBars = ssVertical
        TabOrder = 9
      end
      object dbedtHistComp: TwwDBEdit
        Left = 8
        Top = 199
        Width = 838
        Height = 21
        DataField = 'HISTORICOCOMPL'
        DataSource = ds
        TabOrder = 10
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object edDataLancto: TCMDateTimePicker
        Left = 634
        Top = 18
        Width = 97
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        DataField = 'DATALANCAMENTO'
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
        TabOrder = 3
        DisplayFormat = 'dd/MM/yyyy'
        OnExit = edDataLanctoExit
      end
      object grpMesRef: TGroupBox
        Left = 329
        Top = 4
        Width = 178
        Height = 71
        Caption = 'Competência / Referência'
        TabOrder = 1
        TabStop = True
        object lblMesRef: TLabel
          Left = 6
          Top = 22
          Width = 24
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Mês'
        end
        object lblAnoRef: TLabel
          Left = 104
          Top = 22
          Width = 23
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Ano'
        end
        object cbbMesRef: TwwDBComboBox
          Left = 6
          Top = 36
          Width = 97
          Height = 21
          Anchors = [akTop, akRight]
          ShowButton = True
          Style = csDropDownList
          MapList = True
          AllowClearKey = True
          ShowMatchText = True
          DataField = 'MES_REFERENCIA'
          DataSource = ds
          DropDownCount = 8
          ItemHeight = 0
          Items.Strings = (
            'Janeiro'#9'01'
            'Fevereiro'#9'02'
            'Março'#9'03'
            'Abril'#9'04'
            'Maio'#9'05'
            'Junho'#9'06'
            'Julho'#9'07'
            'Agosto'#9'08'
            'Setembro'#9'09'
            'Outubro'#9'10'
            'Novembro'#9'11'
            'Dezembro'#9'12')
          Sorted = False
          TabOrder = 0
          UnboundDataType = wwDefault
        end
        object spinedtAnoRef: TwwDBSpinEdit
          Left = 104
          Top = 36
          Width = 68
          Height = 21
          Anchors = [akTop, akRight]
          Increment = 1
          MaxValue = 9999
          DataField = 'ANO_REFERENCIA'
          DataSource = ds
          TabOrder = 1
          UnboundDataType = wwDefault
        end
      end
      object chkNaoContabiliza: TCheckBox
        Left = 11
        Top = 157
        Width = 233
        Height = 17
        Caption = 'Não integrar com Contabilidade'
        TabOrder = 11
      end
    end
  end
  inherited Dock972: TDock97
    Width = 863
    object dbStatus: TDBText [0]
      Left = 352
      Top = 5
      Width = 160
      Height = 33
      Alignment = taCenter
      DataField = 'STATUS'
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object lblRAD: TLabel [1]
      Left = 697
      Top = 1
      Width = 53
      Height = 19
      Alignment = taRightJustify
      Caption = 'lblRAD'
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = True
      Visible = False
    end
    object lblStatus: TLabel [2]
      Left = 662
      Top = 20
      Width = 88
      Height = 24
      Alignment = taRightJustify
      Caption = 'lblStatus'
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -21
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = True
      Visible = False
    end
    inherited Toolbar971: TToolbar97
      inherited sbtnProcurar: TToolbarButton97
        Left = 240
      end
      inherited sbtnApagar: TToolbarButton97
        Left = 180
      end
      object sbtnEstornar: TToolbarButton97
        Left = 120
        Top = 0
        Width = 60
        Height = 41
        AllowAllUp = True
        GroupIndex = 1
        Caption = 'Es&tornar'
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888C888888888888888CC888888888888CCCCC8888888888CCCCCCC88
          988888CCCCCCC88899888CCC88CC888889988CC888C8888889988CC888888988
          89988CC888889988999888CC888999999988888C889999999888888888899999
          8888888888889988888888888888898888888888888888888888}
        ImageIndex = 9
        Images = ImlPadrao
        Layout = blGlyphTop
        Opaque = False
        Spacing = 0
        OnClick = sbtnEstornarClick
      end
    end
  end
  inherited Dock971: TDock97
    Top = 644
    Width = 863
    inherited tb97Fundo: TToolbar97
      Left = 531
      DockPos = 531
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited ToolbarSep971: TToolbarSep97
        Left = 253
      end
      inherited bbtnConfirmar: TBitBtn
        Left = 172
        TabOrder = 1
      end
      inherited bbtnCancelar: TBitBtn
        Left = 256
        TabOrder = 2
      end
      object btnAplicaIntegracao: TBitBtn
        Left = 0
        Top = 0
        Width = 172
        Height = 33
        Caption = '&Integra Lançamentos'
        Default = True
        Enabled = False
        TabOrder = 0
        Visible = False
        OnClick = btnAplicaIntegracaoClick
        Glyph.Data = {
          7E010000424D7E01000000000000760000002800000016000000160000000100
          0400000000000801000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888008888888888888888888888008888888888888888888888008888
          888000000000000088008888888877777777777088008888888F888888888870
          88008888888F88888888887088008888888F89988888887088008888888FFFFF
          FFFFFF8088008888888888888888888888008888888888888888088888008888
          88888888888000888800888000000008880000088800888FFFFFFF0888880888
          8800888F44444F08888808888800888FFFFFFF08888708888800888F44444F08
          000008888800888FFFFFFF08000078888800888F444F7788888888888800888F
          FFFF788888888888880088888888888888888888880088888888888888888888
          8800}
      end
    end
  end
  object twDtEstorno: TToolWindow97 [4]
    Left = 560
    Top = 84
    ActivateParent = False
    Caption = 'Estorno'
    CloseButton = False
    ClientAreaHeight = 107
    ClientAreaWidth = 227
    Resizable = False
    TabOrder = 2
    Visible = False
    OnClose = twDtEstornoClose
    OnVisibleChanged = twDtEstornoVisibleChanged
    object Label17: TLabel
      Left = 65
      Top = 17
      Width = 103
      Height = 13
      Caption = 'Data para estorno'
    end
    object Panel61: TPanel
      Left = 0
      Top = 74
      Width = 227
      Height = 33
      Align = alBottom
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 1
      object BitBtn1: TBitBtn
        Left = 13
        Top = 4
        Width = 92
        Height = 25
        Caption = '&Ok'
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
      object BitBtn2: TBitBtn
        Left = 123
        Top = 4
        Width = 92
        Height = 25
        Caption = '&Cancela'
        Default = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ModalResult = 2
        ParentFont = False
        TabOrder = 1
        OnClick = BitBtn2Click
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888000008888888888F777778FF888888009191900
          88888887788888778F88887991919191088888788888888878F8879919191919
          108887F888F888F887F887917F919F719088878887FF87FF878F7919FFF9FFF9
          19087F88777F7778887F79919FFFFF9191087F8887777788887F791919FFF919
          19087F8888777FF8887F79919FFFFF9191087F88877777FF887F7919FFF9FFF9
          190878F877787778887887917F919F71908887F88788878887F8879919191919
          1088878F88888888878888799191919108888878FF88888F7888888779999977
          8888888778FFFF77888888888777778888888888877777888888}
        NumGlyphs = 2
      end
    end
    object dtpkDataEstorno: TCMDateTimePicker
      Left = 65
      Top = 33
      Width = 97
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
      TabOrder = 0
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 644
    Top = 5
    TargetsData = (
      1
      7
      (
        'TMemo'
        'Text'
        0)
      (
        'TRealEdit'
        'Text'
        0)
      (
        'TDBRealEdit'
        'Text'
        0)
      (
        'TDBMemo'
        'Text'
        0)
      (
        'TRichEdit'
        'Text'
        0)
      (
        ''
        'DisplayLabel'
        0)
      (
        ''
        'Items'
        0))
  end
  inherited ds: TwwDataSource
    OnDataChange = dsDataChange
    Left = 226
    Top = 77
  end
  inherited ImlPadrao: TImageList
    Left = 776
    Top = 7
    Bitmap = {
      494C01010A000E00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000004000000001002000000000000040
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF000000FF000000FF000000FF000000FF00000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000000000000000
      00000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF00000000000000000000000000
      00000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000FF000000FF00
      00000000000000000000FF000000FF0000000000000000000000000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000FF0000000000
      00000000000000000000FF000000000000000000000000000000000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000FF0000000000
      000000000000000000000000000000000000000000000000FF00000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000FF0000000000
      0000000000000000000000000000000000000000FF000000FF00000000000000
      00000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF000000FF00
      00000000000000000000000000000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      000000000000000000000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000840000008400000084000000840000008400000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400008400000084000000840000008400000084000000840000008400000084
      0000008400000000000000000000000000000000000000000000000000000000
      0000000000000000FF00000084000000FF00000084000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008400000084000000840000008400000084000000000000000000
      00000000000000000000000000000000000000000000000000008484840000FF
      0000008400000084000000000000000000000084000000840000008400000084
      0000008400000084000000000000000000000000000000000000848484000000
      FF000000FF00000084000000FF00000084000000FF00000084000000FF000000
      84000000000000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000848484008400
      0000840000008400000084848400FFFFFF008484840084000000840000008400
      00000000000000000000000000000000000000000000000000008484840000FF
      000000840000FFFFFF00FFFFFF00FFFFFF000000000000840000008400000084
      00000084000000840000000000000000000000000000848484000000FF000000
      FF00000084000000FF00000084000000FF00000084000000FF00000084000000
      FF00000084000000000000000000000000000000000084848400FFFFFF0000FF
      FF0084848400000000008484840000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000084848400840000008400
      00008400000084000000FFFFFF00FFFFFF00FFFFFF0084000000840000008400
      000084000000000000000000000000000000000000008484840000FF00000084
      000000840000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000008400000084
      00000084000000840000008400000000000000000000848484000000FF000000
      840084848400FFFFFF000000FF00000084000000FF00FFFFFF00848484000000
      84000000FF000000000000000000000000000000000084848400FFFFFF0000FF
      FF0000000000000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000084848400840000008400
      0000840000008400000084848400FFFFFF008484840084000000840000008400
      000084000000000000000000000000000000000000008484840000FF00000084
      000000840000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000084
      000000840000008400000084000000000000848484000000FF00000084000000
      FF00FFFFFF00FFFFFF00FFFFFF000000FF00FFFFFF00FFFFFF00FFFFFF000000
      FF00000084000000FF00000000000000000084848400FFFFFF0000FFFF0000FF
      FF0000000000000000000000000000FFFF0000FFFF0000FFFF000000000000FF
      FF0000FFFF0000FFFF00000000000000000084848400FF000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      000084000000840000000000000000000000000000008484840000FF00000084
      000000840000FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF000000
      000000840000008400000084000000000000848484000000FF000000FF000000
      84000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000FF000000
      84000000FF0000008400000000000000000084848400FFFFFF0000FFFF0000FF
      FF000000000000000000000000008484840000FFFF00000000000000000000FF
      FF0000FFFF0000FFFF00000000000000000084848400FF000000840000008400
      0000840000008400000084000000FFFFFF000000000084000000840000008400
      000084000000840000000000000000000000000000008484840000FF00000084
      000000840000FFFFFF00FFFFFF000000000000840000FFFFFF00FFFFFF00FFFF
      FF0000000000008400000084000000000000848484000000FF00000084000000
      FF00000084000000FF00FFFFFF00FFFFFF00FFFFFF000000FF00000084000000
      FF00000084000000FF00000000000000000084848400FFFFFF0000FFFF0000FF
      FF0000FFFF0000000000000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF00000000000000000084848400FF000000840000008400
      0000840000008400000084000000FFFFFF000000000084000000840000008400
      000084000000840000000000000000000000000000008484840000FF00000084
      000000840000FFFFFF00FFFFFF00008400000084000000840000FFFFFF00FFFF
      FF0000000000008400000084000000000000848484000000FF000000FF000000
      84000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000FF000000
      84000000FF0000008400000000000000000084848400FFFFFF0000FFFF0000FF
      FF0000FFFF0000FFFF00848484000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF00000000000000000084848400FF000000840000008400
      000084000000840000008400000000000000FFFFFF00FFFFFF00840000008400
      00008400000084000000000000000000000000000000000000008484840000FF
      000000840000008400000084000000840000008400000084000000840000FFFF
      FF00FFFFFF00008400000000000000000000848484000000FF00000084000000
      FF00FFFFFF00FFFFFF00FFFFFF000000FF00FFFFFF00FFFFFF00FFFFFF000000
      FF00000084000000FF00000000000000000084848400FFFFFF0000FFFF0000FF
      FF0000FFFF0000FFFF00000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF00000000000000000084848400FF000000840000008400
      0000FFFFFF00FFFFFF00840000008400000000000000FFFFFF00FFFFFF008400
      00008400000084000000000000000000000000000000000000008484840000FF
      0000008400000084000000840000008400000084000000840000008400000084
      00000084000000840000000000000000000000000000848484000000FF000000
      840084848400FFFFFF000000FF00000084000000FF00FFFFFF00848484000000
      84000000FF000000000000000000000000000000000084848400FFFFFF0000FF
      FF0000FFFF0000000000000000000000000000000000000000008484840000FF
      FF0000FFFF000000000000000000000000000000000084848400FF0000008400
      0000FFFFFF00FFFFFF00000000008400000000000000FFFFFF00FFFFFF008400
      0000840000000000000000000000000000000000000000000000000000008484
      840000FF000000FF000000840000008400000084000000840000008400000084
      00000084000000000000000000000000000000000000848484000000FF000000
      FF00000084000000FF00000084000000FF00000084000000FF00000084000000
      FF00000084000000000000000000000000000000000084848400FFFFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000084848400FF0000008400
      000084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000008400
      0000840000000000000000000000000000000000000000000000000000000000
      0000848484008484840000FF000000FF000000FF000000FF000000FF00008484
      8400848484000000000000000000000000000000000000000000848484000000
      FF000000FF00000084000000FF00000084000000FF00000084000000FF000000
      840000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000000000000000000000000000000000000000000000000084848400FF00
      0000FF00000084000000FFFFFF00FFFFFF00FFFFFF0084000000840000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400848484008484840084848400848484000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484000000FF000000FF000000FF000000FF000000FF00848484008484
      8400000000000000000000000000000000000000000000000000000000008484
      840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00848484008484
      8400000000000000000000000000000000000000000000000000000000008484
      840084848400FF000000FF000000FF000000FF000000FF000000848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484000000
      0000000000000000000000000000000000000000000000FFFF00000000000000
      0000000000000000000000FFFF0000FFFF008484840084848400000000000000
      0000000000000000000000FFFF00000000000000000000000000000000000000
      000000000000000000008484840084848400FFFFFF00FFFFFF00000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000000000000000000000000000000000FFFFFF0000000000000000000000
      000000FFFF0000FFFF0000000000000000000000000000000000000000000000
      00008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF008484840084848400FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000FF
      FF0000FFFF000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF000000000000000000FFFFFF0000000000FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF000000000000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF000000
      0000000000000000000000000000000000000000840000000000000000008484
      8400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFF
      FF0000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFFFF000000
      000000FFFF000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000084000000
      8400000084000000840000008400FF000000FF000000FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000840000008400000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFF
      FF0000000000000000000000000000000000000000000000000000FFFF008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF000000
      000000FFFF0000FFFF000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00000000000000000000000000000084000000FF000000
      FF000000FF000000FF000000FF0000008400FFFFFF00FFFFFF00FF000000FFFF
      FF00000000000000000000000000000000000000840000008400000084000000
      000084848400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFF
      FF00FFFFFF0000000000000000000000000000FFFF0000FFFF0000FFFF008484
      8400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFF
      FF000000000000FFFF0000FFFF0000FFFF00000000000000000084848400FFFF
      FF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00000000000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF0000008400FF000000FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000008400000084000000
      840000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FF00
      0000FFFFFF00FFFFFF000000000000000000000000000000000000FFFF0000FF
      FF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF000000
      0000FFFFFF008484840084848400000000000000FF000000FF0000000000FFFF
      FF000000FF00FFFFFF00FFFFFF000000FF0000008400FFFFFF00FFFFFF00FF00
      0000FFFFFF00FFFFFF0000000000000000000000000000000000000084000000
      0000FFFF000000000000FFFF0000000000000000000084840000FF000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000000000FF
      FF0084848400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000FF000000FF000000FF000000
      0000FFFFFF00FFFFFF000000FF000000FF0000008400FF000000FF000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000000000000000FFFF
      000000000000FFFF000000000000FFFF00000000000000000000FFFFFF00FFFF
      FF00FFFFFF0084848400848484000000000000000000000000000000000000FF
      FF0000FFFF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00848484008484840000000000000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFF
      FF00FFFFFF000000000000000000000000000000FF000000FF000000FF00FFFF
      FF00FFFFFF00000000000000FF000000FF0000008400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008484840084848400000000000000000000000000000000000000
      0000FFFF000000000000FFFF000000000000FFFF000000000000FFFFFF008484
      840084848400000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0084848400FFFFFF00FFFFFF00FFFFFF00848484008484
      840000FFFF0000FFFF0000000000000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000FF000000FF0000000000FFFF
      FF000000FF00FFFFFF00FFFFFF000000FF0000008400FFFFFF00FFFFFF008484
      840084848400000000000000000000000000000000000000000000000000FFFF
      000000000000FFFF000000000000FFFF00000000000000000000848484000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF00000000000000000000FFFF00848484008484840084848400000000000000
      000000FFFF0000FFFF0000000000000000000000000000000000000000000000
      00000000000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0084848400848484000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF00000084008484840084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFF000000000000FFFF000000000000FFFF000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      0000000000000000000000FFFF00000000000000000000000000000000000000
      0000000000000000000084848400FFFFFF00FFFFFF00FFFFFF00848484008484
      84000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFF000000000000FFFF00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000400000000100010000000000000200000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFF00000000FFFFFDFF00000000
      FFFFFCFF00000000FFFFF07F00000000FFFFE03700000000FFFFC07300000000
      E0078CF900000000F00F9DF900000000F81F9FB900000000FC3F9F3100000000
      FE7FCE0300000000FFFFEC0700000000FFFFFE0F00000000FFFFFF3F00000000
      FFFFFFBF00000000FFFFFFFF00000000FC1FFFFFFFFFFFFFF007F83FF83FF83F
      E003E00FE00FE00FC301C007C007C007C0818003800380038040800380038003
      8020000100010001811000010001008181080001000100818008000100010101
      C001000100010081C001800380038283E003800380038023F007C007C007C007
      FC1FE00FE00FE00FFFFFF83FF83FF83FFEFFFF1FFFFFFF9FBC3DFC0FFF9FFE1F
      CC33F00FFE1FF81FC003E00FF81FE00FC007E007E00FE00FC00FF007E00F6007
      C007C003C0073007C003C001800710030000C00000038001C003E0012001C500
      E001E0071000CA81E003F0030401D507C003F0012007CA9FCC33F803801FD53F
      BEFDFC0FC1FFEA7FFEFFFE3FFFFFF0FF00000000000000000000000000000000
      000000000000}
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    Left = 283
    Top = 68
  end
  inherited Cds: TCMClientDataSet
    Left = 222
    Top = 32
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleção de Medição'
    Colunas.Strings = (
      'CONTRATOCONTR.CODCONTRATOEMPR'
      'CONTRATOCONTR.NOMECONTRATO'
      
        'DECODE(MEDICAO.NODOCUMENTO,NULL,DOCUMENTO.NODOCUMENTO,MEDICAO.NO' +
        'DOCUMENTO) AS NODOCUMENTO'
      
        'DECODE(MEDICAO.COMPLDOCUMENTO,NULL,DOCUMENTO.COMPLDOCUMENTO,MEDI' +
        'CAO.COMPLDOCUMENTO) AS COMPLDOCUMENTO'
      'MEDICAO.DATAMEDICAO'
      
        'DECODE(DOCUMENTO.DATAVENCTO,NULL,PARCELAMEDICAO.DATAPREVISTAVENC' +
        ',DOCUMENTO.DATAVENCTO) AS DATAVENCTO'
      
        'DECODE(MEDICAO.DATALANCAMENTO,NULL,DOCUMENTO.DATAEMISSAO,MEDICAO' +
        '.DATALANCAMENTO) AS DATAEMISSAO'
      'PARCELAMEDICAO.VALORPREVISTO'
      
        'DECODE(MEDICAO.FLGESTORNADO,NULL, '#39'Ativa'#39',DECODE(MEDICAO.FLGESTO' +
        'RNADO,0,'#39'Ativa'#39','#39'Estornada'#39')) AS STATUS'
      
        'DECODE(RADINSTPROCESSO.FLGOK,NULL,'#39'Inexistente'#39','#39'E'#39','#39'Excluído'#39','#39 +
        'N'#39','#39'Pendente'#39','#39'R'#39','#39'Recusado'#39','#39'S'#39','#39'Aprovado'#39') AS STATUSRAD'
      'MEDICAO.HISTORICOCOMPL')
    TipodeDado.Strings = (
      'C'
      'C'
      'N'
      'C'
      'D'
      'D'
      'D'
      'N'
      'N'
      'C'
      'C')
    Descricao.Strings = (
      'Nr. Processo'
      'Contrato'
      'Nr. Documento'
      'Complemento'
      'Data da Medição'
      'Data de Vencimento'
      'Data de Lançamento'
      'Valor da Medição'
      'Status'
      'Status no RAD'
      'Histórico Complementar')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'CONTRATOCONTR'
      'MEDICAO'
      'PARCELAMEDICAO'
      'DOCUMENTO'
      'RADINSTPROCESSO')
    CamposChave.Strings = (
      'CONTRATOCONTR.TIPOCONTRATO'
      'PARCELAMEDICAO.CODDOCUMENTO'
      'CONTRATOCONTR.IDCONTRATO'
      'PARCELAMEDICAO.IDMEDICAO')
    Filtro.Strings = (
      'CONTRATOCONTR.IDCONTRATO = MEDICAO.IDCONTRATO'
      'MEDICAO.IDMEDICAO = PARCELAMEDICAO.IDMEDICAO'
      'DOCUMENTO.CODDOCUMENTO(+) = PARCELAMEDICAO.CODDOCUMENTO'
      'MEDICAO.NUMRAD = RADINSTPROCESSO.IDPROCESSO(+)')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '20'
      '60'
      '10'
      '3'
      '18'
      '18'
      '18'
      '18'
      '10'
      '10'
      '60')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    ApenasLetraENum.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    ComparaMaiuscula.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    UsaDistinct = True
    LookupSQL.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 559
    Top = 4
  end
  inherited CmeDetalhe: TCmEventosCadastro
    BeforeConfirma = CmeDetalheBeforeConfirma
    Left = 280
    Top = 4
  end
  inherited dsDet: TwwDataSource
    DataSet = cdsDet
    OnDataChange = dsDetDataChange
    Left = 90
    Top = 73
  end
  object dsContratos: TDataSource
    AutoEdit = False
    DataSet = cdsContratos
    Left = 271
    Top = 120
  end
  object cdsContratos: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 194
    Top = 105
    Data = {
      240A00009619E0BD0100000018000000250007000000030000008C040A494443
      4F4E545241544F08000400000000000C4E4F4D45434F4E545241544F01004900
      00000100055749445448020002003C000C434F44504F5254464F524D41080004
      00000000000D4944454E44434F4252414E434108000400000000000F434F4443
      454E54524F524553504F4E01004900000002000753554254595045020049000A
      0046697865644368617200055749445448020002000A00084944504553534F41
      08000400000000000E4944454E44434F52524553504F4E08000400000000000C
      4944454E44454E5452454741080004000000000009554E49444E45474F430800
      040000000000094944434F4E5441544F0800040000000000084944464F52434C
      490800040000000000094D4F45434F4449474F08000400000000000D49445245
      53504F4E534156454C08000400000000000C5449504F434F4E545241544F0100
      4900000002000753554254595045020049000A00466978656443686172000557
      494454480200020001001144455343524943414F434F4E545241544F04004B00
      0000020007535542545950450200490005005465787400055749445448020002
      00F4010E44415441415353494E415455524108000800000000000E434F444155
      58434F4E545241544F0100490000000100055749445448020002001400115641
      4C4F5242415345434F4E545241544F0800040000000000104441544142415345
      434F4E545241544F08000800000000000F4441544150524556454E4345525241
      08000800000000000D5052415A4F44454E554E43494108000400000000000F43
      4F44434F4E545241544F454D5052010049000000010005574944544802000200
      14000A464C47454D50454E484F01004900000002000753554254595045020049
      000A00466978656443686172000557494454480200020001000F444154414546
      4554454E434552524108000800000000000D4D4F5449564F454E434552524101
      00490000000100055749445448020002003C000E464C4746494D434F4E545241
      544F01004900000002000753554254595045020049000A004669786564436861
      720005574944544802000200010009434F44544950444F430800040000000000
      0D5452474454494E434C5553414F08000800000000000F54524755534552494E
      434C5553414F0100490000000100055749445448020002001E000952454E4F56
      4143414F04004B00000002000753554254595045020049000500546578740005
      574944544802000200F4010A4F42534552564143414F04004B00000002000753
      554254595045020049000500546578740005574944544802000200F4010C4944
      41444954414D454E544F08000400000000000A494454454C45464F4E45080004
      0000000000104944524553455256414F5243414D454E08000400000000000541
      5649534F08000400000000001149445449504F50524F434553534F5241440800
      0400000000000E464C47474552414E4F54414445420100490000000200075355
      4254595045020049000A00466978656443686172000557494454480200020001
      000100044C434944040001000908000000504004004140015455010000000000
      003E403B42414E434F20444F2042524153494C202D20504147414D454E544F20
      4445204449564552534F5320504F5220434F4E544120544552434549524F5303
      32323200000000000000400000000000004340000000000000F03F0000000050
      F430410000000000001840000000000091C440015029000000504147414D454E
      544F204445204449564552534F5320504F5220434F4E54412054455243454952
      4F530000CAF9F4B1CC42000000000070C7400000CAF9F4B1CC42000000000000
      3E4004532F4E3F014E0153000000000000F03F009CA2068CB2CC4205434D3531
      3000504004000100005455010000000000004040164144414D49532053455256
      49434F53204745524149530334323200000000000000400000000000E0664000
      0000000000F03F0000000098F730410000000000001840000000000089C34001
      507A000000505245535441433F4F204445205345525649434F53204445204C49
      4D50455A4120494E5445524E41204520434F4E5345525641433F4F20444F2045
      4449464943494F2052454645522C204558434C55494E444F2041532053414C41
      5320444F20323F2C20333F2C20343F2C353F206520363F20414E444152455300
      00B4BE5AACCC420000000080B4E6400000B4BE5AACCC420000F41DE5AFCC4200
      000000008051400C3030322F52454645522F3939014E00001C539ABBCC420554
      455354450145000000000000F03F00BCAE118CB2CC4205434D35313000505004
      0001410154550100000000008041402C424F5543494E48415320262043414D50
      4F5320532F43202041554449542E20494E444550454E44454E54455303313133
      0000000000000040000000000000F03F00000000174B37410000000000001840
      0000000095433741015052000000505245535441433F4F20444520534552562E
      2044452041554449544F524941204441532044454D4F4E53545241433F455320
      46494E414E43454952415320444F2045584552434943494F2044452032303030
      000014194FB2CC4200000000009AD040000014194FB2CC42000014194FB2CC42
      0C3032312F52454645522F3030014E0153000000000000F03F009884198CB2CC
      4207434D3130313634001000040101510154550100000000008044400C303338
      2F52454645522F3032000000007E7E3741033231310000000000000040000000
      007E7E3741000000007E7E3741000000000000F03F00000000E5453741000000
      000000184001501F0000005465737465206465206C616EE7616D656E746F2064
      6520636F6E747261746F0000E2373DB9CC4200000000000059400000664461B9
      CC420000329BC4BACC42033033380153000000000000F03F008CAEC64BB9CC42
      09434D3135333035333900104004010150015445010000000000804540054142
      4F4E4F00000000B879374103323132000000000000004000000000B879374100
      0000000000F03F00000000256637410000000000001840014115000000544553
      54452044452041424F4E4F204D454E53414C00005E59ACBBCC42000000000020
      AC4000005E59ACBBCC42000022C55ABFCC420000000000003E40043132333401
      5300000000000018400040E0FEADBBCC4205434D3531300000000000003E4000
      5050141141510154550100000000000046400574657374650332313200000000
      00000040000000000000F03F0000000000001840014100005E59ACBBCC420000
      00000000694000005E59ACBBCC4203313233014E000000000000184000F86714
      AEBBCC4205434D35313000505014010151015455010000000000804640055445
      535445033232350000000000000040000000000000F0BF000000000000184001
      50050000005445535445000032320EBCCC42000000000000F03F000032320EBC
      CC420000F69DBCBFCC42055445535445015300000000000008400058275C0FBC
      CC4205434D353130}
  end
  object cdsFormasPagamento: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 195
    Top = 209
  end
  object cdsItem: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 200
    Top = 344
  end
  object cdsObjeto: TCMClientDataSet
    Aggregates = <>
    FilterOptions = [foCaseInsensitive]
    Params = <>
    Left = 197
    Top = 298
  end
  object MsContaCor: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'PESSOA.RAZAOSOCIAL'
      'BANCO.NUMBANCO'
      'AGENCIABANCARIA.NUMAGENCIA'
      'CONTABANCARIA.CONTACORRENTE'
      'CONTABANCARIA.TIPOCONTA'
      'CONTABANCARIA.FLGCONTAPREF')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'C'
      'N')
    Descricao.Strings = (
      'Nome do Banco'
      'Num. Banco'
      'Num. Agência'
      'Conta Corrente'
      'Tipo'
      'Preferencial')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'BANCO'
      'AGENCIABANCARIA'
      'CONTABANCARIA')
    CamposChave.Strings = (
      'CONTABANCARIA.IDCBANCARIA'
      'CONTABANCARIA.CONTACORRENTE'
      'BANCO.NUMBANCO'
      'AGENCIABANCARIA.NUMAGENCIA'
      'CONTABANCARIA.TIPOCONTA')
    Filtro.Strings = (
      'PESSOA.IDPESSOA = BANCO.IDPESSOA'
      'AGENCIABANCARIA.IDBANCO = BANCO.IDPESSOA'
      'CONTABANCARIA.IDAGENCIA = AGENCIABANCARIA.IDPESSOA'
      'CONTABANCARIA.IDPESSOA =1')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '60'
      '10'
      '15'
      '15'
      '1'
      '10')
    OperComparador.Strings = (
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
    Left = 430
    Top = 8
  end
  object MSMedicao: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleção de  Medição'
    Colunas.Strings = (
      'MEDICAO.DATAMEDICAO'
      'CONTRATOCONTR.NOMECONTRATO'
      'MEDICAO.DATALANCAMENTO'
      'MEDICAO.HISTORICOCOMPL')
    TipodeDado.Strings = (
      'D'
      'C'
      'D'
      'C')
    Descricao.Strings = (
      'Data da Medição'
      'Contrato'
      'Data de Lançamento'
      'Histórico Complementar')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'CONTRATOCONTR'
      'MEDICAO'
      'PARCELAMEDICAO')
    CamposChave.Strings = (
      'CONTRATOCONTR.TIPOCONTRATO'
      'PARCELAMEDICAO.CODDOCUMENTO'
      'CONTRATOCONTR.IDCONTRATO')
    Filtro.Strings = (
      'CONTRATOCONTR.IDCONTRATO = MEDICAO.IDCONTRATO'
      'MEDICAO.IDMEDICAO = PARCELAMEDICAO.IDMEDICAO'
      'NVL(MEDICAO.FLGESTORNADO,0) = 0'
      'CONTRATOCONTR.FLGFIMCONTRATO <> '#39'E'#39)
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '20'
      '18'
      '18'
      '60')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1')
    ApenasLetraENum.Strings = (
      'N'
      'N'
      'N'
      'N')
    ComparaMaiuscula.Strings = (
      ''
      ''
      ''
      '')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = True
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    LookupSQL.Strings = (
      ''
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      '')
    Left = 348
    Top = 8
  end
  object cdsDet: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'EvitaDupl_idx'
        Fields = 'IDITEM; IDOBJETO ; PARCELANUM'
        Options = [ixUnique]
      end>
    IndexName = 'EvitaDupl_idx'
    Params = <>
    StoreDefs = True
    AfterScroll = cdsDetAfterScroll
    OnPostError = cdsDetPostError
    Left = 88
    Top = 23
  end
  object spTeste: TCMSqlParams
    SQL.Strings = (
      'SELECT '
      '    M.*, '
      #9'PM.DATAPREVISTAVENC,'
      '    I.NOME_ITEM, '
      '    O.NOMEOBJETO, '
      '    OI.VALORUNITARIOOBJETO, '
      '    C.NOMECONTRATO,'
      #9'C.IDFORCLI ,'
      #9'CTA.CONTACORRENTE,'
      '    CTA.NUMBANCO,'
      #9'CTA.NUMAGENCIA,'
      #9'CTA.TIPOCONTA,'
      #9'CTA.IDCBANCARIA,'
      #9'CTA.DESCTIPOCONTA,'
      #9'CTA.NOMEAGENCIA,'
      #9'CTA.NOMEBANCO,'
      #9'D.NODOCUMENTO,'
      #9'D.COMPLDOCUMENTO,'
      #9'D.OBS,'
      #9'D.CODFORMA'
      'FROM '
      '   MEDICAO M, '
      '   ITEMCONTRATUAL I, '
      '   OBJETOCONTRATUAL O, '
      '   OBJETOSXITEMCONTR OI, '
      '   PARCELAMEDICAO PM, '
      '   CONTRATOCONTR C,'
      '   DOCUMENTO D,'
      '  (SELECT '
      '      C.CONTACORRENTE, '
      #9'  B.NUMBANCO, '
      #9'  A.NUMAGENCIA, '
      #9'  C.TIPOCONTA, '
      #9'  C.IDCBANCARIA,'
      
        '      DECODE(C.TIPOCONTA,'#39'1'#39','#39'Conta Corrente'#39','#39'2'#39','#39'Cartão Salári' +
        'o'#39','#39'3'#39','#39'Conta Poupança'#39','#39#39') AS DESCTIPOCONTA,'
      
        '      DECODE(PA.RAZAOSOCIAL,NULL,PA.NOME,PA.RAZAOSOCIAL) AS NOME' +
        'AGENCIA,'
      
        '      DECODE(PB.RAZAOSOCIAL,NULL,PB.NOME,PB.RAZAOSOCIAL) AS NOME' +
        'BANCO,'
      #9'  CL.IDMEDICAO'
      '   FROM '
      '      PESSOA PA, '
      #9'  PESSOA PB, '
      #9'  CONTABANCARIA C, '
      #9'  AGENCIABANCARIA A, '
      #9'  BANCO B,'
      #9' (SELECT C1.IDFORCLI, MED.IDMEDICAO '
      #9'  FROM CONTRATOCONTR C1, MEDICAO MED '
      
        #9'  WHERE (MED.IDCONTRATO = C1.IDCONTRATO) AND (MED.IDMEDICAO = 2' +
        '00000004)) CL'
      '   WHERE '
      '      (C.IDPESSOA = CL.IDFORCLI)  AND'
      '      (C.FLGCONTAPREF = 1)       AND'
      '      (C.IDAGENCIA = A.IDPESSOA) AND'
      '      (A.IDBANCO = B.IDPESSOA) AND'
      '      (A.IDPESSOA = PA.IDPESSOA) AND'
      '      (B.IDPESSOA = PB.IDPESSOA)) CTA      '
      'WHERE '
      '   (M.IDPESSOA = 500) AND '
      '   (M.IDMEDICAO = PM.IDMEDICAO) AND '
      '   (M.IDITEM = I.IDITEM) AND '
      '   (M.IDOBJETO = O.IDOBJETO) AND '
      '   (M.IDITEM = OI.IDITEM) AND '
      '   (M.IDOBJETO = OI.IDOBJETO) AND '
      '   (M.IDCONTRATO = OI.IDCONTRATO) AND '
      '   (M.IDCONTRATO = C.IDCONTRATO) AND '
      '   (M.IDPESSOA = C.IDPESSOA) AND'
      '   (M.IDMEDICAO = CTA.IDMEDICAO(+)) AND'
      '   (PM.CODDOCUMENTO = D.CODDOCUMENTO) AND'
      '   (PM.CODDOCUMENTO = (SELECT PM1.CODDOCUMENTO '
      '                       FROM PARCELAMEDICAO PM1 '
      
        '                       WHERE (PM1.CODDOCUMENTO = PM.CODDOCUMENTO' +
        ') AND '
      '                             (PM1.IDMEDICAO = 200000004))) '
      'ORDER BY  I.NOME_ITEM, O.NOMEOBJETO')
    ClientDataSet = cdsDet
    Left = 346
    Top = 165
  end
  object cdsDadosConta: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 82
    Top = 488
  end
  object cdsRateioxCC: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 195
    Top = 255
  end
  object CMSqlParams1: TCMSqlParams
    SQL.Strings = (
      'select * from contratocontr')
    ClientDataSet = cdsContratos
    Left = 372
    Top = 92
  end
  object cdsParcelaMedicao: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 197
    Top = 405
  end
  object cdsCtrlParcelaMedicao: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 84
    Top = 541
  end
  object cdsANS: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 303
    Top = 491
  end
  object dsANS: TwwDataSource
    DataSet = cdsANS
    Left = 298
    Top = 542
  end
  object cdsTipoServico: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 400
    Top = 460
  end
  object cdsProcessos: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 303
    Top = 386
  end
  object dsTipoServico: TDataSource
    DataSet = cdsTipoServico
    Left = 398
    Top = 515
  end
  object dsProcessos: TDataSource
    DataSet = cdsProcessos
    Left = 304
    Top = 435
  end
  object cdsRateioAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 195
    Top = 159
  end
  object cdsPadraoRateio: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 193
    Top = 476
  end
  object msListaServico: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'LISTA_SERVICOS.CODIGO'
      'LISTA_SERVICOS.NOME'
      
        'SUBSTR(LISTA_SERVICOS.CODNATUREZAREINF || '#39' - '#39'  || NATUREZA_REN' +
        'DIMENTO_REINF.TITULO, 0, 200)')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Código'
      'Tipo'
      'Rendimento REINF')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'LISTA_SERVICOS'
      'NATUREZA_RENDIMENTO_REINF')
    CamposChave.Strings = (
      'LISTA_SERVICOS.IDSERVICO'
      'LISTA_SERVICOS.CODNATUREZAREINF')
    Filtro.Strings = (
      
        'LISTA_SERVICOS.CODNATUREZAREINF = NATUREZA_RENDIMENTO_REINF.CODN' +
        'ATUREZAREINF')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '8'
      '80'
      '200')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1')
    ApenasLetraENum.Strings = (
      'N'
      'N'
      'N')
    ComparaMaiuscula.Strings = (
      ''
      ''
      '')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    LookupSQL.Strings = (
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      '')
    Left = 491
    Top = 7
  end
  object cdsTributacao: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 412
    Top = 214
  end
  object dsTributacao: TDataSource
    DataSet = cdsTributacao
    Left = 411
    Top = 150
  end
  object cdsAlterador: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 489
    Top = 160
  end
  object ImageList1: TImageList
    Left = 806
    Top = 74
    Bitmap = {
      494C010111001300040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000005000000001002000000000000050
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808080008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      8000808080008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FF000000FFFFFF00FF000000FFFFFF00FF000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF00FF000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808080008080
      8000FFFFFF00FFFFFF00FFFFFF00FF000000FF000000FFFFFF00FFFFFF008080
      8000808080008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FF000000FF000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FF000000FFFFFF00FF000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FF000000FFFFFF00FF000000FFFFFF00FF000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808080008080
      8000FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF00FFFFFF00808080008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080808000808080008080800080808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000808080000000800000008000000080000000800080808000808080008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      80000000FF000000FF000000FF000000FF000000FF000000FF000000FF008080
      8000808080008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF00000080008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000080000000800000008000000080
      0000008000000080000000800000008000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000000000000000000000000000000000000000000080000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF008080800080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000080000000000000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF0000000000000000000000000000000000000080000000FF000000FF000000
      FF00FFFFFF000000FF000000FF000000FF000000FF00FFFFFF00FFFFFF000000
      FF000000FF000000FF0080808000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000080000000800000008000000080
      0000008000000080000000800000008000000000000000000000808080008080
      80000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF00000000000000000000000000000080000000FF000000FF000000
      FF00FFFFFF00FFFFFF000000FF000000FF00FFFFFF00FFFFFF00FFFFFF000000
      FF000000FF000000FF0080808000808080000000000000000000000000000000
      00000000000000000000000000000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000080000000000000008080008080
      80008080800000000000000000000000000000000000000000000000FF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000FF000000000000000000000000000000FF000000FF000000FF000000
      FF000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000FF000000
      FF000000FF000000FF0000008000808080000000000000000000000000000000
      0000FFFFFF000000FF000000FF000000FF00000000000000FF000000FF000000
      000000000000000000000000000000000000000000000000000000FF00000080
      000000FF000000FF00000080000000FF00000000000000000000008080000080
      80000000000000000000000000000000000000000000000000000000FF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000FF000000000000000000000000000000FF000000FF000000FF000000
      FF000000FF000000FF00FFFFFF00FFFFFF00FFFFFF000000FF000000FF000000
      FF000000FF000000FF0000008000808080000000000000000000000000000000
      0000FFFFFF000000FF000000FF000000FF000000FF0000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      000000FF000000FF000000FF000000FF000000FF000000000000008080000080
      80000080000000000000000000000000000000000000000000000000FF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000FF000000000000000000000000000000FF000000FF000000FF000000
      FF000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000FF000000FF000000
      FF000000FF000000FF0000008000808080000000000000000000000000000000
      0000FFFFFF000000FF000000FF000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008080000080
      80000000000000800000000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000000000000000000000000000FF000000FF000000FF000000
      FF00FFFFFF00FFFFFF00FFFFFF000000FF00FFFFFF00FFFFFF000000FF000000
      FF000000FF000000FF0000008000000000000000000000000000000000000000
      0000FFFFFF000000FF000000FF000000FF00000000000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000080
      8000008000000000000000800000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF0000000000000000000000000000000000000080000000FF000000FF00FFFF
      FF00FFFFFF00FFFFFF000000FF000000FF000000FF00FFFFFF00FFFFFF000000
      FF000000FF000000FF0080808000000000000000000000000000000000000000
      00000000000000000000000000000000FF00000000000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000080000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF0000000000000000000000000000000000000000000000FF000000FF000000
      FF00FFFFFF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FF00000080000000FF000000FF00000080
      000000FF00000000000000800000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      00000000000000000000000000000000000000000000000080000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000080000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000080000000FF000000FF000000FF000000FF0000008000000080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFF0000808000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FF000000000000000000
      00000000000000000000000000000000000000000000FF000000000000000000
      000000000000000000000000000000000000FF00000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF000000000000000000FFFFFF0000000000000000000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000FF0000000000
      000000000000000000000000000000000000FF000000FF000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000FF000000FF00
      000000000000000000000000000000000000FF000000FF000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFF0000808000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FF000000000000000000
      00000000000000000000000000000000000000000000FF000000FF000000FF00
      0000FF000000000000000000000000000000FF000000FF000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFF0000808000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FF000000000000000000
      00000000000000000000000000000000000000000000FF000000FF000000FF00
      0000FF000000FF0000000000000000000000FF000000FF000000FF000000FF00
      0000FF0000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFF0000808000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000FF0000000000
      00000000000000000000000000000000000000000000FF000000FF000000FF00
      0000FF000000FF000000FF00000000000000FF000000FF000000FF000000FF00
      0000FF000000FF00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFF00008080
      0000000000000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF000000FF00
      00000000000000000000000000000000000000000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      000080800000000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000000000000000000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      0000FF00000000000000000000000000000000000000FF000000FF000000FF00
      0000FF000000FFFFFF00FF00000000000000FF000000FF000000FF000000FF00
      0000FFFFFF00FF00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFF0000808000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      000000000000FF000000FF00000000000000000000000000000000000000FF00
      0000FF00000000000000000000000000000000000000FF000000FF000000FF00
      0000FFFFFF00FF0000000000000000000000FF000000FF000000FF000000FFFF
      FF00FF0000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFF0000FFFF00000000000000000000000000000000
      0000FFFF00008080000000000000000000000000000000FFFF000000000000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000FF000000FF00000000000000000000000000000000000000FF00
      0000FF00000000000000000000000000000000000000FF000000FF000000FFFF
      FF00FF000000000000000000000000000000FF000000FF000000FFFFFF00FF00
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFF0000FFFF0000FFFF000000000000000000008080
      000080800000FFFF000000000000000000000000000000FFFF000000000000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000000000FFFF
      FF0000000000FFFFFF0000000000000000000000000000000000000000000000
      00000000000000000000FF000000FF0000000000000000000000FF000000FF00
      00000000000000000000000000000000000000000000FF000000FFFFFF00FF00
      000000000000000000000000000000000000FF000000FFFFFF00FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF00000000000000000000000000000000000000FFFF0000FFFF000000
      0000000000000000000000FFFF0000FFFF0000FFFF000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF000000FF000000FF000000FF0000000000
      00000000000000000000000000000000000000000000FF000000FF0000000000
      000000000000000000000000000000000000FF000000FF000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000000000000000000000000000FFFF0000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000000000000000
      000000000000000000000000000000000000FF00000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F8FC
      F800F8FCF80000000000F8FCF80000000000F8FCF8000000000000000000F8FC
      F80000000000F8FCF80000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080800000FFFF00000000000000
      0000000000000000000000000000000000000000000000FFFF00008080000080
      80000080800000808000000000000000000000000000BF000000BF000000BF00
      0000BF000000BF000000BF000000BF000000BF000000BF000000BF000000BF00
      0000BF00000000000000000000000000000000000000F8FCF80000000000F8FC
      F80000000000F8FCF800F8FCF80000000000F8FCF80000000000F8FC00000000
      0000F8FCF800F8FCF80000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008080800000FFFF000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF008080
      80008080800000808000000000008080800000000000BF000000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000BF000000000000000000000000000000F8FCF80000000000F8FCF800F8FC
      F80000000000F8FCF80000000000F8FCF8000000000000000000F8FC00008080
      00000000000000000000F8FCF800F8FCF8000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000000000008080800000FF
      FF000000000000000000000000000000000000FFFF0000FFFF0000000000FFFF
      FF008080800000808000008080000000000000000000BF000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BF0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000F8FCF8000000000000000000F8FC00008080
      0000808000000000000000000000000000000000000000000000000000000000
      0000FFFFFF0000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000000000008080800000FF
      FF0000FFFF000000000000000000000000000000000000FFFF00000000000000
      00000000000000808000000000008080800000000000BF000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BF000000000000000000000000000000F8FCF800F8FCF800F8FCF800F8FC
      F800F8FCF800F8FCF80000000000F8FCF800F8FCF80000000000F8FC00008080
      0000808000000000000000000000F8FCF8000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000008080800080808000808080008080
      800000FFFF0000FFFF0000000000000000000000000000FFFF0000FFFF000080
      800000FFFF0000FFFF00000000000000000000000000BF000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F8FCF800F8FCF800F8FCF800F8FC
      F800F8FCF8000000000000000000808080008080800000000000F8FC00008080
      0000808000000000000000000000F8FCF8000000000000000000000000000000
      0000FFFFFF00000000000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000008080800000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF000000000000000000000000000000000000FF
      FF000000000000000000000000000000000000000000BF000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF0080808000000000000000000000000000F8FCF800F8FCF800F8FCF800F8FC
      F800F8FCF8008080000000000000808080008080800000000000F8FC00008080
      0000808000000000000000000000F8FCF8000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000000000000000000000000000000000008080800000FFFF0000FF
      FF0000FFFF000000000000000000808080008080800000000000000000000000
      00000000000000000000000000000000000000000000BF000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF0000000000000000000000000000000000F8FCF800F8FCF800000000000000
      000000000000F8FC000080800000808080008080800000000000F8FC00008080
      8000808000000000000000000000F8FCF8000000000000000000000000000000
      0000FFFFFF00000000000000000000000000000000000000000000000000FFFF
      FF000000000000000000000000000000000000000000000000008080800000FF
      FF0000FFFF0000FFFF0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BF000000BF000000BF00
      0000BF000000BF000000BF000000BF000000BF000000BF000000BF0000000000
      000000FFFF00808080000000000000000000F8FCF80000000000000000000000
      000000000000F8FC0000F8FC0000808000008080800000000000F8FC00000000
      0000808000000000000000000000F8FCF8000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000008080
      800000FFFF0000FFFF0000FFFF00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BF000000FFFFFF00BF00
      0000BF000000FFFFFF00BF000000BF000000FFFFFF00BF000000BF0000000000
      000000FFFF00000000000000000000000000F8FCF800F8FC0000F8FC0000F8FC
      0000F8FC0000F8FC0000F8FC0000F8FC00000000000000000000F8FC00008080
      0000808000000000000000000000F8FCF8000000000000000000000000000000
      0000FFFFFF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000080808000808080008080
      80008080800000FFFF0000FFFF0000FFFF000000000000000000000000000000
      00000000000000000000000000000000000000000000BF000000BF000000BF00
      0000BF000000BF000000BF000000BF000000BF000000BF000000BF000000BF00
      00000000000000FFFF008080800000000000F8FCF800F8FC0000F8FC0000F8FC
      0000F8FC0000F8FC0000F8FCF800F8FC00008080800000000000F8FC00008080
      0000808000000000000000000000F8FCF8000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      00000000000000000000000000000000000000000000000000008080800000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF008080800000000000F8FCF800F8FCF800F8FCF800F8FC
      F800F8FCF800F8FC0000F8FC0000000000008080800000000000F8FC00008080
      0000808000000000000000000000F8FCF8000000000000000000000000000000
      0000FFFFFF000000000000000000FFFFFF00FFFFFF0000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000008080
      800000FFFF0000FFFF0000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000BF00BF00F8FCF800F8FCF800F8FCF800F8FC
      F800F8FCF800F8FC000000000000808080008080800000000000F8FC00008080
      0000808000000000000000000000F8FCF8000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008080800000FFFF0000FFFF0000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BF00BF00BF00BF00F8FCF800F8FCF800F8FCF800F8FC
      F800F8FCF800000000000000000080808000808080008080800000000000F8FC
      0000808000000000000000000000F8FCF8000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008080800000FFFF0000FFFF0000FFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F8FCF800F8FCF800F8FCF800F8FC
      F800F8FCF800F8FCF80000000000808080008080800080808000808080000000
      0000F8FC00000000000000000000F8FCF8000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080808000808080008080800080808000000000008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F8FCF800F8FCF800F8FCF800F8FC
      F800F8FCF800F8FCF80000000000000000000000000000000000000000000000
      00000000000000000000F8FCF800F8FCF8000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00FFFFFF000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00FFFFFF000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00808080000000BF000000BF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000008080000080800000808000008080000080800000808000008080000080
      8000008080000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00808080000000BF000000FF000000BF000000
      BF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000FFFFFF000000
      00000000000000000000FFFFFF000000000000000000000000000000000000FF
      FF00000000000080800000808000008080000080800000808000008080000080
      8000008080000080800000000000000000000000000000000000000000000000
      00000000000000000000808080000000BF00FF00FF00FF00FF000000FF000000
      BF000000BF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000000000000000FFFF
      FF0000FFFF000000000000808000008080000080800000808000008080000080
      8000008080000080800000808000000000000000000000000000000000000000
      000000000000808080000000BF000000FF00FF00FF000000FF00FF00FF0000FF
      FF000000BF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      FF00000000000000000000000000FFFFFF0000000000BFBFBF00000000000000
      0000FFFFFF0000000000FFFFFF000000000000000000000000000000000000FF
      FF00FFFFFF0000FFFF0000000000008080000080800000808000008080000080
      8000008080000080800000808000008080000000000000000000000000000000
      0000808080000000000000BF0000000000000000FF00FF00FF0000FFFF000000
      FF000000BF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      FF000000FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000000000000000FFFF
      FF0000FFFF00FFFFFF0000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      80000000000000BF000000BF000000FF00000000000000FFFF000000FF000000
      BF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000FF000000
      FF0000000000000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF0000000000FFFFFF000000000000000000FFFFFF000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
      FF00000000000000000000000000000000000000000000000000808080000000
      0000000000000000000000FF000000FF000000FF0000808080000000BF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000FF000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF0000000000FFFFFF00FFFFFF00FFFFFF000000
      0000FFFFFF00FFFFFF000000000000000000000000000000000000000000FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
      FF000000000000000000000000000000000000000000808080000000000000BF
      BF0000BFBF00808080000000000000FF000000FF000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF0000000000BFBFBF00FFFFFF000000
      0000FFFFFF0000000000000000000000000000000000000000000000000000FF
      FF00FFFFFF0000FFFF0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000808080000000000000BFBF0000BF
      BF0000BFBF0000FFFF00000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00FFFFFF000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF0000000000FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF000000FF0000000000000000BFBF0000BFBF0000FF
      FF0000FFFF00FFFFFF0000FFFF00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000000000BFBF
      BF00FFFFFF0000000000FFFFFF00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF00000000BFBF0000BFBF0000FFFF0000FF
      FF00FFFFFF0000FFFF0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF0000000000
      00000000000000000000FF0000000000000000BFBF0000FFFF0000FFFF00FFFF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      0000FF000000FF000000000000000000000000FFFF0000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000500000000100010000000000800200000000000000000000
      000000000000000000000000FFFFFF0080010000000000008001000000000000
      8001000000000000800100000000000080010000000000008001000000000000
      8001000000000000800100000000000080010000000000008001000000000000
      8001000000000000800100000000000080010000000000008001000000000000
      80030000000000008007000000000000FFFFFC3FFFFFFFFFFFFFF00FFFFFFFFF
      FFFFE003FFFF00FFF83FC003FF7F007FE00F8001FE3F001FE00F0001FE3F000F
      C0070000FC7F0007C0070000E00F8007C0070000E007C003C0070000E007E001
      C0070001E00FF001E00F0001FC1FF801E00F8003FE1FFC01F83F8007FFFFFE01
      FFFFC00FFFFFFFFFFFFFF01FFFFFFFFFFFFFFF0FF000FFFFFFFFFF9FF000FF3F
      BF7FFFFFF000FFFF9F3FFF9FF000FFFF8F1FFF0FF000FF3F870FFF0FF000FF3F
      8307FF0F0000FF9F8103FF870000FFCF8001FFC30000FFE78103FCE10000F9E7
      8307F8610000F9E7870FF8010001FCCF8F1FFC030003FE1F9F3FFE070007FFFF
      BF7FFFFF803FFFFFFFFFFFFFC07FFFFFBF81FFFFE50BFFFF1F008007A903E007
      8F0080074A84E007C600BFD70080E007C300A4870002E0070100BFC70402E007
      0081A4830002E0078067BFCB3802E007C1FF80010002E007E0FF80050002E007
      807F80000002E007C03FFFF00002E00FE01FFFF80002E01FF07FFFF80002E03F
      F83FFFFC0002FFFFFC0FFFFF0000FFFFFFFFFC00FFDFFFFFFFFFFC00FFCFFC00
      FFFFFC00FFC7FC00C007FC000003FC00C003FC000001FC00C001FC000000EC00
      C000F8000001E400C000F0000003E000C000E00000070000C007C000000F0001
      C0078000001F0003C0070000007F0007E3FC00FF00FF000FFFFE01FF01FFE3FF
      FFDD03FF03FFE7FFFFE307FFFFFFEFFF00000000000000000000000000000000
      000000000000}
  end
  object dsPagtosSintetico: TwwDataSource
    AutoEdit = False
    DataSet = qryPagtosSintetico
    Left = 788
    Top = 494
  end
  object qryPagtosSintetico: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = ds
    SQL.Strings = (
      
        'SELECT VL_BASE_CONTRATO.VALORBASECONTRATO VL_TOTAL_CONTRATO, MED' +
        '.VALORMEDICAO VL_PAGO_CONTRATO, VL_BASE_CONTRATO.VALORBASECONTRA' +
        'TO - MED.VALORMEDICAO SALDO_A_PAGAR,'
      '       CON.IDCONTRATO'
      '  FROM CM.CONTRATOCONTR CON'
      
        '  JOIN (SELECT MI.IDCONTRATO, SUM(MI.VALORMEDICAO) VALORMEDICAO ' +
        'FROM CM.MEDICAO MI GROUP BY MI.IDCONTRATO) MED ON MED.IDCONTRATO' +
        ' = CON.IDCONTRATO'
      
        '  JOIN (SELECT IDCONTRATO, SUM(VALORBASECONTRATO) VALORBASECONTR' +
        'ATO FROM ('
      
        #9#9'SELECT CO.IDCONTRATO, DECODE(CO.FLGTIPOVALORBASE, '#39'F'#39', CO.VALO' +
        'RBASECONTRATO, CO.VALOR_ORCADO) VALORBASECONTRATO'
      #9#9'  --FROM CM.CONTRATOORIG CO  WO13378'
      '                  FROM CM.CONTRATOCONTR CO'
      #9#9' UNION ALL'
      #9#9'SELECT A.IDCONTRATO, NVL(A.VL_ADITAMENTO, 0) VL_ADITAMENTO'
      
        #9#9'  FROM CM.ADITAMENTO A) GROUP BY IDCONTRATO) VL_BASE_CONTRATO ' +
        'ON VL_BASE_CONTRATO.IDCONTRATO = CON.IDCONTRATO'
      'WHERE CON.IDCONTRATO = :IDCONTRATO')
    ValidateWithMask = True
    Left = 785
    Top = 434
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDCONTRATO'
        ParamType = ptUnknown
      end>
  end
  object qryLocalizaFDO: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT D.COD_FDO, SUM(I.VALOR_ITEM) AS VLRTOTAL_FDO'
      'FROM user_integracao_orcamentaria.fdo_item_orcamentario I'
      
        'JOIN user_integracao_orcamentaria.fdo_digital D ON D.ID_FDO = I.' +
        'ID_FDO'
      'WHERE D.COD_FDO = :pCOD_FDO'
      'GROUP BY D.COD_FDO')
    ValidateWithMask = True
    Left = 657
    Top = 440
    ParamData = <
      item
        DataType = ftString
        Name = 'pCOD_FDO'
        ParamType = ptUnknown
      end>
    object qryLocalizaFDOCOD_FDO: TStringField
      FieldName = 'COD_FDO'
      Size = 80
    end
    object qryLocalizaFDOVLRTOTAL_FDO: TFloatField
      FieldName = 'VLRTOTAL_FDO'
    end
  end
  object dsLocalizaFDO: TwwDataSource
    AutoEdit = False
    DataSet = qryLocalizaFDO
    Left = 660
    Top = 500
  end
  object cdsAux1: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 312
    Top = 296
  end
end
