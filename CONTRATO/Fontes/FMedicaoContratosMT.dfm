inherited frmMedicaoContratosMT: TfrmMedicaoContratosMT
  Left = 239
  Top = 147
  HelpContext = 120002
  Caption = 'Medição de Contratos'
  ClientHeight = 448
  ClientWidth = 757
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
    Width = 757
    Height = 362
    inherited tbcDetalhe: TTabControlDetalhe [0]
      Top = 163
      Width = 755
      Height = 198
      Tabs.Strings = (
        'Itens'
        'Observação do Contrato'
        'Ficha de Compensação')
      detdbGrids.Strings = (
        'dbgrdDet'
        ''
        '')
      inherited pgctrlDetalhe: TPageControl
        Width = 657
        Height = 139
        inherited tbsDet: TTabSheet
          Caption = 'Itens'
          inherited dbgrdDet: TwwDBGrid [0]
            Width = 649
            Height = 111
            Selected.Strings = (
              'NOME_ITEM'#9'20'#9'Item'#9'F'
              'NOMEOBJETO'#9'22'#9'Objeto'#9'F'
              'QTDEMEDICAO'#9'10'#9'Quantidade'#9'F'
              'VALORUNITARIOOBJETO'#9'12'#9'Valor Unitário'#9'F'
              'VALORMEDICAO'#9'14'#9'Valor da Medição'#9'F')
            UseTFields = False
          end
          inherited pnlControlesDet: TPanel [1]
            Width = 649
            Height = 111
            object Label7: TLabel
              Left = 8
              Top = -1
              Width = 25
              Height = 13
              Caption = 'Item'
            end
            object Label12: TLabel
              Left = 8
              Top = 36
              Width = 69
              Height = 13
              Caption = 'Observação'
            end
            object Label8: TLabel
              Left = 320
              Top = -1
              Width = 94
              Height = 13
              Caption = 'Serviço/Produto'
            end
            object Label2: TLabel
              Left = 8
              Top = 73
              Width = 66
              Height = 13
              Caption = 'Quantidade'
            end
            object Label3: TLabel
              Left = 152
              Top = 73
              Width = 78
              Height = 13
              Caption = 'Valor Unitário'
            end
            object Label1: TLabel
              Left = 319
              Top = 73
              Width = 63
              Height = 13
              Caption = 'Valor Total'
            end
            object dblcItem: TwwDBLookupCombo
              Left = 8
              Top = 13
              Width = 281
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME_ITEM'#9'30'#9'Item')
              DataField = 'IDITEM'
              DataSource = dsDet
              LookupTable = cdsItem
              LookupField = 'IDITEM'
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
              OnChange = dblcItemChange
            end
            object dbeObservacao: TwwDBEdit
              Left = 8
              Top = 50
              Width = 497
              Height = 21
              DataField = 'OBSERVACAO'
              DataSource = dsDet
              TabOrder = 2
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dblcObjeto: TwwDBLookupCombo
              Left = 320
              Top = 13
              Width = 289
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOMEOBJETO'#9'30'#9'Objeto')
              DataField = 'IDOBJETO'
              DataSource = dsDet
              LookupTable = cdsObjeto
              LookupField = 'IDOBJETO'
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
              OnChange = dblcObjetoChange
            end
            object reValor: TRealEdit
              Left = 448
              Top = 8
              Width = 57
              Height = 21
              TabStop = False
              Alignment = taRightJustify
              Color = clScrollBar
              Enabled = False
              Lines.Strings = (
                '      0,00')
              TabOrder = 7
              Visible = False
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
            end
            object dbeQuantidade: TDBRealEdit
              Left = 8
              Top = 86
              Width = 129
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              TabOrder = 3
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
              Left = 152
              Top = 86
              Width = 137
              Height = 21
              TabStop = False
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              TabOrder = 4
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
              Left = 320
              Top = 86
              Width = 137
              Height = 21
              TabStop = False
              Alignment = taRightJustify
              Color = clMenu
              Enabled = False
              Lines.Strings = (
                '0,00')
              ReadOnly = True
              TabOrder = 5
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'VALORMEDICAO'
              DataSource = dsDet
            end
            object btnRateioDif: TButton
              Left = 480
              Top = 84
              Width = 129
              Height = 25
              Caption = 'Rateio Diferenciado'
              TabOrder = 6
              OnClick = btnRateioDifClick
            end
            inline molOrcamento1: TmolOrcamento
              Left = 513
              Top = 36
              TabOrder = 8
              inherited Label17: TLabel
                Left = 1
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
            Width = 649
            Height = 111
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
              TabOrder = 1
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 747
      end
      inherited Dock974: TDock97
        Left = 661
        Height = 139
      end
    end
    inherited pnlMestre: TPanel [1]
      Width = 755
      Height = 162
      object lblContrato: TLabel
        Left = 16
        Top = 2
        Width = 49
        Height = 13
        Caption = 'Contrato'
      end
      object Label9: TLabel
        Left = 272
        Top = 2
        Width = 98
        Height = 13
        Caption = 'Num. Documento'
      end
      object Label10: TLabel
        Left = 358
        Top = 23
        Width = 7
        Height = 13
        Caption = '/'
      end
      object Label4: TLabel
        Left = 420
        Top = 1
        Width = 80
        Height = 13
        Caption = 'Data Medição'
      end
      object lblFormaPG: TLabel
        Left = 16
        Top = 43
        Width = 120
        Height = 13
        Caption = 'Forma de Pagamento'
        Enabled = False
      end
      object Label11: TLabel
        Left = 344
        Top = 43
        Width = 69
        Height = 13
        Caption = 'Observação'
      end
      object Label6: TLabel
        Left = 640
        Top = 2
        Width = 98
        Height = 13
        Caption = 'Data Vencimento'
      end
      object Label5: TLabel
        Left = 344
        Top = 123
        Width = 134
        Height = 13
        Caption = 'Histórico Complementar'
      end
      object lblDataLanc: TLabel
        Left = 529
        Top = 1
        Width = 101
        Height = 13
        Caption = 'Data Lançamento'
      end
      object dblcContrato: TwwDBLookupCombo
        Left = 16
        Top = 18
        Width = 249
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
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnChange = dblcContratoChange
        OnCloseUp = dblcContratoCloseUp
      end
      object edDataMEdicao: TCMDateTimePicker
        Left = 420
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
        TabOrder = 3
      end
      object edDataVenc: TCMDateTimePicker
        Left = 640
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
        TabOrder = 5
        OnCloseUp = edDataVencExit
        OnExit = edDataVencExit
      end
      object dblcFormaPG: TwwDBLookupCombo
        Left = 16
        Top = 59
        Width = 316
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'30'#9'Descrição')
        DataField = 'CODFORMA'
        DataSource = ds
        LookupTable = cdsFormasPagamento
        LookupField = 'CODFORMA'
        Enabled = False
        TabOrder = 6
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object GpConta: TGroupBox
        Left = 17
        Top = 83
        Width = 316
        Height = 58
        Caption = 'Conta Bancária '
        TabOrder = 7
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
          Left = 283
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
        Left = 368
        Top = 18
        Width = 41
        Height = 21
        DataField = 'COMPLDOCUMENTO'
        DataSource = ds
        TabOrder = 2
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbeNumDocumento: TDBRealEdit
        Left = 272
        Top = 18
        Width = 81
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
        DataField = 'NODOCUMENTO'
        DataSource = ds
      end
      object dbmemoObs: TDBMemo
        Left = 344
        Top = 58
        Width = 391
        Height = 62
        DataField = 'OBS'
        DataSource = ds
        ScrollBars = ssVertical
        TabOrder = 8
      end
      object dbedtHistComp: TwwDBEdit
        Left = 344
        Top = 137
        Width = 391
        Height = 21
        DataField = 'HISTORICOCOMPL'
        DataSource = ds
        TabOrder = 9
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object edDataLancto: TCMDateTimePicker
        Left = 529
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
        TabOrder = 4
      end
      object chkNaoContabiliza: TCheckBox
        Left = 17
        Top = 142
        Width = 233
        Height = 17
        Caption = 'Não integrar com Contabilidade'
        TabOrder = 10
      end
    end
  end
  inherited Dock972: TDock97
    Width = 757
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
    Top = 409
    Width = 757
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
      end
      inherited bbtnCancelar: TBitBtn
        Left = 256
      end
      object btnAplicaIntegracao: TBitBtn
        Left = 0
        Top = 0
        Width = 172
        Height = 33
        Caption = '&Integra Lançamentos'
        Default = True
        Enabled = False
        TabOrder = 2
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
    Left = 368
    Top = 136
    ActivateParent = False
    Caption = 'Estorno'
    CloseButton = False
    ClientAreaHeight = 107
    ClientAreaWidth = 227
    Resizable = False
    TabOrder = 3
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
      TabOrder = 0
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
      TabOrder = 1
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 74
    Top = 407
    TargetsData = (
      1
      5
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
        0))
  end
  inherited ds: TwwDataSource
    OnDataChange = dsDataChange
    Left = 296
    Top = 0
  end
  inherited ImlPadrao: TImageList
    Left = 16
    Top = 407
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
    Left = 64
    Top = 64
  end
  inherited Cds: TCMClientDataSet
    Left = 344
    Top = 16
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
    Left = 368
    Top = 72
  end
  inherited CmeDetalhe: TCmEventosCadastro
    BeforeConfirma = CmeDetalheBeforeConfirma
    Left = 664
    Top = 312
  end
  inherited dsDet: TwwDataSource
    DataSet = cdsDet
    OnDataChange = dsDetDataChange
    Left = 686
    Top = 359
  end
  object dsContratos: TDataSource
    AutoEdit = False
    DataSet = cdsContratos
    Left = 200
    Top = 56
  end
  object cdsContratos: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 136
    Top = 56
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
    Left = 200
    Top = 104
  end
  object cdsItem: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 616
    Top = 208
  end
  object cdsObjeto: TCMClientDataSet
    Aggregates = <>
    FilterOptions = [foCaseInsensitive]
    Params = <>
    Left = 680
    Top = 208
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
    Left = 592
    Top = 8
  end
  object MSMedicao: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleção de  Medição'
    Colunas.Strings = (
      'CONTRATOCONTR.NOMECONTRATO'
      'MEDICAO.DATAMEDICAO'
      'MEDICAO.DATALANCAMENTO'
      'MEDICAO.HISTORICOCOMPL')
    TipodeDado.Strings = (
      'C'
      'D'
      'D'
      'C')
    Descricao.Strings = (
      'Contrato'
      'Data da Medição'
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
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = True
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 696
    Top = 112
  end
  object cdsDet: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'EvitaDupl_idx'
        Fields = 'IDITEM; IDOBJETO'
        Options = [ixUnique]
      end>
    IndexName = 'EvitaDupl_idx'
    Params = <>
    StoreDefs = True
    AfterScroll = cdsDetAfterScroll
    OnPostError = cdsDetPostError
    Left = 648
    Top = 360
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
    Left = 628
    Top = 164
  end
  object cdsDadosConta: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 480
    Top = 120
  end
  object cdsRateioxCC: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 368
    Top = 128
  end
  object CMSqlParams1: TCMSqlParams
    SQL.Strings = (
      'select * from contratocontr')
    ClientDataSet = cdsContratos
    Left = 284
    Top = 97
  end
  object cdsParcelaMedicao: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 520
    Top = 216
  end
end
