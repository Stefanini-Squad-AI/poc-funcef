inherited frmCadGestInvestImovelMestreMT: TfrmCadGestInvestImovelMestreMT
  Left = 313
  Top = 0
  Caption = 'Gestão de Investimento'
  ClientHeight = 690
  ClientWidth = 725
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 725
    Height = 604
    inherited pnlMestre: TPanel
      Width = 723
      Height = 388
      object lblVoto: TLabel
        Left = 8
        Top = 6
        Width = 27
        Height = 13
        Caption = 'Voto'
      end
      object Label1: TLabel
        Left = 181
        Top = 6
        Width = 86
        Height = 13
        Caption = 'Resolução/Ata'
      end
      object lblFornecedor: TLabel
        Left = 8
        Top = 263
        Width = 65
        Height = 13
        Caption = 'Fornecedor'
      end
      object lblTipo: TLabel
        Left = 360
        Top = 263
        Width = 26
        Height = 13
        Caption = 'Tipo'
      end
      object lblValor: TLabel
        Left = 594
        Top = 263
        Width = 88
        Height = 13
        Caption = 'Valor Aprovado'
      end
      object lblDescricao: TLabel
        Left = 8
        Top = 303
        Width = 58
        Height = 13
        Caption = 'Descrição'
      end
      object edtVoto: TDBEdit2
        Left = 8
        Top = 19
        Width = 147
        Height = 21
        DataField = 'VOTO'
        DataSource = ds
        TabOrder = 0
      end
      object edtResAta: TDBEdit2
        Left = 181
        Top = 19
        Width = 147
        Height = 21
        DataField = 'RESOLUCAO'
        DataSource = ds
        TabOrder = 1
      end
      object grpSelImovel: TGroupBox
        Left = 8
        Top = 42
        Width = 705
        Height = 216
        Caption = 'Selecionar Imóvel'
        TabOrder = 2
        object lblImovelMestre: TLabel
          Left = 8
          Top = 16
          Width = 80
          Height = 13
          Caption = 'Imóvel Mestre'
        end
        object btnBuscaImovelMestre: TBitBtn
          Left = 296
          Top = 32
          Width = 24
          Height = 22
          Hint = 'Busca um Imóvel Mestre'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnClick = btnBuscaImovelMestreClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
            777777777777F88F7777777777700F077777777777F8878F77777777700FFF07
            77777777F8877787F77777700FFFFFF077777778877777F8F7777778FFFFFCF0
            77777F78F77FF8787F771778FFCCCFFF07778FF87F88877F8F7711778FFFFFCF
            077788FF8F77FF8787F711178FFCCCFFF077888F8FF88877F87F71110000FFFC
            FF07788888887FF877877710E7E706CFFFF077887777888777F8770E7E7E70FF
            F887778F777778F7F8877707E7E7E0F88777778F777778F88777770E7E7E7087
            7777778F7777788777777707E7E7E07777777787F7777877777777707E7E0777
            777777787FFF8777777777770000777777777777888877777777}
          NumGlyphs = 2
        end
        object btnLimpaImovelMestre: TBitBtn
          Left = 320
          Top = 32
          Width = 24
          Height = 22
          Hint = 'Limpa a seleção de Imóvel Mestre'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          OnClick = btnLimpaImovelMestreClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            88888888888FF8888888888888008888888888888F77F8888888888800F08888
            8888888F7787F88888888800FFF0888888888F7788878F88888800FFFFFF0888
            88887788888F788888887FFFFFCF888888887F88FF7888FF88887FFCCCF88008
            888878F777888778F88887FFFF880110888887F88F8878878F8887FFC8809991
            0888878F7887F88878F8887FF88099991088887F88878F88878F887FF8880999
            03088878F88878F878788887F8888090B03088878F888787878788887888880B
            0B038888788888787878888888888880B0B38888888888878788888888888888
            0BBB88888888888878F888888888888880BB8888888888888788}
          NumGlyphs = 2
        end
        object btnIncluirImovelMestre: TBitBtn
          Left = 344
          Top = 32
          Width = 24
          Height = 22
          Hint = 'Adiciona o Imóvel Mestre selecionado.'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          OnClick = btnIncluirImovelMestreClick
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            1800000000000003000000000000000000000000000000000000FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FF000000000000000000000000000000FF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00000000000000840000
            8400008400008400008400000000000000FF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FF8484840084000084000084000084000084000084000084000084000084
            00000000FF00FFFF00FFFF00FFFF00FF84848400FF00008400008400FF00FFFF
            00FF008400008400008400008400008400008400000000FF00FFFF00FFFF00FF
            84848400FF00008400FFFFFFFFFFFFFFFFFFFF00FF0084000084000084000084
            00008400000000FF00FFFF00FF84848400FF00008400008400FFFFFFFFFFFFFF
            FFFFFFFFFFFF00FF008400008400008400008400008400000000FF00FF848484
            00FF00008400008400FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FF0084000084
            00008400008400000000FF00FF84848400FF00008400008400FFFFFFFFFFFFFF
            00FFFFFFFFFFFFFFFFFFFFFF00FF008400008400008400000000FF00FF848484
            00FF00008400008400FFFFFFFFFFFFFF00FF008400FFFFFFFFFFFFFFFFFFFF00
            FF008400008400000000FF00FF84848400FF00008400008400FFFFFFFFFFFF00
            8400008400008400FFFFFFFFFFFFFF00FF008400008400000000FF00FFFF00FF
            84848400FF00008400008400008400008400008400008400008400FFFFFFFFFF
            FF008400000000FF00FFFF00FFFF00FF84848400FF0000840000840000840000
            8400008400008400008400008400008400008400000000FF00FFFF00FFFF00FF
            FF00FF84848400FF0000FF000084000084000084000084000084000084000084
            00000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF84848484848400FF0000
            FF0000FF0000FF0000FF00848484848484FF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FF848484848484848484848484848484FF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        end
        object pnlImovelMestre: TPanel
          Left = 8
          Top = 62
          Width = 329
          Height = 20
          Caption = 'IMÓVEL MESTRE'
          Color = clGray
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 5
        end
        object pnlUnidade: TPanel
          Left = 368
          Top = 62
          Width = 329
          Height = 20
          Caption = 'UNIDADE'
          Color = clGray
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 6
        end
        object lstImovelMestre: TListView
          Left = 8
          Top = 84
          Width = 329
          Height = 129
          Columns = <
            item
              Width = 400
            end>
          ReadOnly = True
          ShowColumnHeaders = False
          TabOrder = 4
          ViewStyle = vsReport
          OnClick = lstImovelMestreClick
        end
        object edtImovelMestre: TEdit
          Left = 8
          Top = 33
          Width = 285
          Height = 21
          ReadOnly = True
          TabOrder = 0
        end
        object ScbxUnidade: TScrollBox
          Left = 369
          Top = 84
          Width = 329
          Height = 129
          BorderStyle = bsNone
          TabOrder = 7
          object lstUnidades: TListView
            Left = 1
            Top = 0
            Width = 550
            Height = 129
            Checkboxes = True
            Columns = <
              item
                Width = 400
              end>
            ReadOnly = True
            ShowColumnHeaders = False
            TabOrder = 0
            ViewStyle = vsReport
            OnChange = lstUnidadesChange
          end
        end
      end
      object btnBuscaFornecedor: TBitBtn
        Left = 296
        Top = 279
        Width = 24
        Height = 22
        Hint = 'Busca um Fornecedor'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        OnClick = btnBuscaFornecedorClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
          777777777777F88F7777777777700F077777777777F8878F77777777700FFF07
          77777777F8877787F77777700FFFFFF077777778877777F8F7777778FFFFFCF0
          77777F78F77FF8787F771778FFCCCFFF07778FF87F88877F8F7711778FFFFFCF
          077788FF8F77FF8787F711178FFCCCFFF077888F8FF88877F87F71110000FFFC
          FF07788888887FF877877710E7E706CFFFF077887777888777F8770E7E7E70FF
          F887778F777778F7F8877707E7E7E0F88777778F777778F88777770E7E7E7087
          7777778F7777788777777707E7E7E07777777787F7777877777777707E7E0777
          777777787FFF8777777777770000777777777777888877777777}
        NumGlyphs = 2
      end
      object btnLimpaFornecedor: TBitBtn
        Left = 320
        Top = 279
        Width = 24
        Height = 22
        Hint = 'Limpa a seleção de Fornecedor'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
        OnClick = btnLimpaFornecedorClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          88888888888FF8888888888888008888888888888F77F8888888888800F08888
          8888888F7787F88888888800FFF0888888888F7788878F88888800FFFFFF0888
          88887788888F788888887FFFFFCF888888887F88FF7888FF88887FFCCCF88008
          888878F777888778F88887FFFF880110888887F88F8878878F8887FFC8809991
          0888878F7887F88878F8887FF88099991088887F88878F88878F887FF8880999
          03088878F88878F878788887F8888090B03088878F888787878788887888880B
          0B038888788888787878888888888880B0B38888888888878788888888888888
          0BBB88888888888878F888888888888880BB8888888888888788}
        NumGlyphs = 2
      end
      object dbmmoDescricao: TDBMemo
        Left = 8
        Top = 319
        Width = 705
        Height = 63
        DataField = 'DESCRICAO'
        DataSource = ds
        TabOrder = 8
      end
      object dbcbbTIPO: TDBComboBox
        Left = 360
        Top = 282
        Width = 217
        Height = 21
        DataField = 'TIPO'
        DataSource = ds
        ItemHeight = 13
        Items.Strings = (
          'Empreendimento'
          'Unidade')
        TabOrder = 6
      end
      object edtValor: TDBRealEdit
        Left = 592
        Top = 280
        Width = 121
        Height = 21
        Alignment = taRightJustify
        Color = 12648447
        Lines.Strings = (
          '0,00')
        TabOrder = 7
        WordWrap = False
        OnChange = edtValorChange
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'VLRAPROVADO'
        DataSource = ds
      end
      object edtFornecedor: TEdit
        Left = 8
        Top = 280
        Width = 285
        Height = 21
        ReadOnly = True
        TabOrder = 3
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 389
      Width = 723
      Height = 180
      inherited pgctrlDetalhe: TPageControl
        Width = 625
        Height = 121
        inherited tbsDet: TTabSheet
          Caption = 'Detalhes'
          inherited dbgrdDet: TwwDBGrid
            Width = 617
            Height = 93
            Selected.Strings = (
              'DATAEMISSAO'#9'15'#9'Data'
              'NODOCUMENTO'#9'15'#9'Documento'
              'NUMAPGR'#9'10'#9'Número do AP'
              'VALOR'#9'15'#9'Valor'
              'SALDO'#9'20'#9'Saldo'
              'STATUS'#9'15'#9'Status')
          end
          inherited pnlControlesDet: TPanel
            Width = 617
            Height = 93
            object lblNroDoc: TLabel
              Left = 8
              Top = 5
              Width = 83
              Height = 13
              Caption = 'Nº Documento'
            end
            object lblNroAP: TLabel
              Left = 8
              Top = 45
              Width = 53
              Height = 13
              Caption = 'Nº da AP'
            end
            object lblStatus: TLabel
              Left = 8
              Top = 89
              Width = 37
              Height = 13
              Caption = 'Status'
            end
            object lblValorPago: TLabel
              Left = 296
              Top = 45
              Width = 63
              Height = 13
              Caption = 'Valor Pago'
            end
            object lblDataIni: TLabel
              Left = 352
              Top = 4
              Width = 65
              Height = 13
              Caption = 'Data Início'
            end
            object btnBuscaDoc: TBitBtn
              Left = 286
              Top = 19
              Width = 24
              Height = 22
              Hint = 'Busca um Documento'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              OnClick = btnBuscaDocClick
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                80000080000000808000800000008000800080800000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
                777777777777F88F7777777777700F077777777777F8878F77777777700FFF07
                77777777F8877787F77777700FFFFFF077777778877777F8F7777778FFFFFCF0
                77777F78F77FF8787F771778FFCCCFFF07778FF87F88877F8F7711778FFFFFCF
                077788FF8F77FF8787F711178FFCCCFFF077888F8FF88877F87F71110000FFFC
                FF07788888887FF877877710E7E706CFFFF077887777888777F8770E7E7E70FF
                F887778F777778F7F8877707E7E7E0F88777778F777778F88777770E7E7E7087
                7777778F7777788777777707E7E7E07777777787F7777877777777707E7E0777
                777777787FFF8777777777770000777777777777888877777777}
              NumGlyphs = 2
            end
            object btnLimpaDoc: TBitBtn
              Left = 310
              Top = 19
              Width = 24
              Height = 22
              Hint = 'Limpa a seleção de Documento'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 2
              OnClick = btnLimpaDocClick
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000000000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                88888888888FF8888888888888008888888888888F77F8888888888800F08888
                8888888F7787F88888888800FFF0888888888F7788878F88888800FFFFFF0888
                88887788888F788888887FFFFFCF888888887F88FF7888FF88887FFCCCF88008
                888878F777888778F88887FFFF880110888887F88F8878878F8887FFC8809991
                0888878F7887F88878F8887FF88099991088887F88878F88878F887FF8880999
                03088878F88878F878788887F8888090B03088878F888787878788887888880B
                0B038888788888787878888888888880B0B38888888888878788888888888888
                0BBB88888888888878F888888888888880BB8888888888888788}
              NumGlyphs = 2
            end
            object edtDataIni: TCMDateTimePicker
              Left = 349
              Top = 18
              Width = 105
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATAEMISSAO'
              DataSource = dsDet
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
              ReadOnly = True
              ShowButton = True
              TabOrder = 3
            end
            object edtValorPago: TDBRealEdit
              Left = 296
              Top = 59
              Width = 155
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              ReadOnly = True
              TabOrder = 5
              WordWrap = False
              OnKeyPress = edtValorPagoKeyPress
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'VALOR'
              DataSource = dsDet
            end
            object edtNroDoc: TwwDBEdit
              Left = 8
              Top = 20
              Width = 273
              Height = 21
              DataField = 'NODOCUMENTO'
              DataSource = dsDet
              ReadOnly = True
              TabOrder = 0
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object edtNroAP: TwwDBEdit
              Left = 8
              Top = 60
              Width = 273
              Height = 21
              DataField = 'NUMAPGR'
              DataSource = dsDet
              ReadOnly = True
              TabOrder = 4
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object edtStatus: TwwDBEdit
              Left = 8
              Top = 104
              Width = 121
              Height = 21
              DataField = 'STATUS'
              DataSource = dsDet
              ReadOnly = True
              TabOrder = 6
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 715
      end
      inherited Dock974: TDock97
        Left = 629
        Height = 121
      end
    end
    object pnlBottom: TPanel
      Left = 1
      Top = 569
      Width = 723
      Height = 34
      Align = alBottom
      TabOrder = 2
      object lblSaldo: TLabel
        Left = 604
        Top = 10
        Width = 112
        Height = 13
        Caption = 'Saldo:  0000000,00'
      end
    end
  end
  inherited Dock972: TDock97
    Width = 725
  end
  inherited Dock971: TDock97
    Top = 651
    Width = 725
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 256
    Top = 10
    TargetsData = (
      1
      6
      (
        'TDBMemo'
        'Text'
        0)
      (
        ''
        'Items'
        0)
      (
        'TDBRealEdit'
        'Text'
        0)
      (
        ''
        'DisplayLabel'
        0)
      (
        ''
        'Filter'
        0)
      (
        'TMemo'
        'Text'
        0))
  end
  inherited dsDet: TwwDataSource
    DataSet = qryDet
    Left = 155
    Top = 474
  end
  inherited ds: TwwDataSource
    Left = 390
    Top = 2
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update VOTOGESTAOIMOVEL'
      'set'
      '  IDVOTOGESTAOIMOVEL = :IDVOTOGESTAOIMOVEL,'
      '  IDPESSOA = :IDPESSOA,'
      '  VOTO = :VOTO,'
      '  RESOLUCAO = :RESOLUCAO,'
      '  TIPO = :TIPO,'
      '  VLRAPROVADO = :VLRAPROVADO,'
      '  DESCRICAO = :DESCRICAO'
      'where'
      '  IDVOTOGESTAOIMOVEL = :OLD_IDVOTOGESTAOIMOVEL')
    InsertSQL.Strings = (
      'insert into VOTOGESTAOIMOVEL'
      '  (IDVOTOGESTAOIMOVEL, IDPESSOA, VOTO, RESOLUCAO, TIPO, '
      'VLRAPROVADO, DESCRICAO)'
      'values'
      '  (:IDVOTOGESTAOIMOVEL, :IDPESSOA, :VOTO, :RESOLUCAO, :TIPO, '
      ':VLRAPROVADO, '
      '   :DESCRICAO)')
    DeleteSQL.Strings = (
      'delete from VOTOGESTAOIMOVEL'
      'where'
      '  IDVOTOGESTAOIMOVEL = :OLD_IDVOTOGESTAOIMOVEL')
    Left = 362
    Top = 2
  end
  inherited MontaSelect: TMontaSelect
    Caption = ''
    Colunas.Strings = (
      'VOTO'
      'DESCRICAO'
      'VLRAPROVADO')
    TipodeDado.Strings = (
      'C'
      'C'
      '')
    Descricao.Strings = (
      'Voto'
      'Descrição'
      'Valor Aprovado')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'VOTOGESTAOIMOVEL')
    CamposChave.Strings = (
      'IDVOTOGESTAOIMOVEL')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '20'
      '50'
      '20')
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
    Left = 459
    Top = 10
  end
  inherited ImlPadrao: TImageList
    Left = 297
    Top = 10
  end
  inherited CmeCadastro: TCmEventosCadastro
    Operacao = opProcurar
    OnFind = CmeCadastroFind
    DataSource = nil
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 508
    Top = 10
  end
  inherited qry: TwwQuery
    RequestLive = True
    SQL.Strings = (
      'select * from VOTOGESTAOIMOVEL where 1 = 2')
    Left = 341
    Top = 2
  end
  inherited CmeDetalhe: TCmEventosCadastro
    DataSource = nil
    Left = 548
    Top = 10
  end
  object MontaSelectImovelMestre: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'IM.IMONOME'
      'IM.IMONOMEENDERECO'
      'IM.IMOLOGRADOURO'
      'IM.IMOBAIRRO'
      'C.NOME '
      'C.UF')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Nome do Imóvel Mestre'
      'Nome do Endereço'
      'Logradouro'
      'Bairro'
      'Cidade'
      'UF')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'IMOVEL IM'
      'CIDADES C')
    CamposChave.Strings = (
      'IM.IMONOME'
      'IM.IDIMOVEL')
    Filtro.Strings = (
      '( IM.FLGTIPOIMOVEL = 0 ) '
      '( IM.IDCIDADES = C.IDCIDADES )')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '30'
      '30'
      '20'
      '20'
      '20'
      '20')
    OperComparador.Strings = (
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
      'N')
    ComparaMaiuscula.Strings = (
      ''
      ''
      ''
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
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 563
    Top = 66
  end
  object qryDet: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    RequestLive = True
    SQL.Strings = (
      'SELECT DATAEMISSAO,'
      '       NODOCUMENTO,'
      '       NUMAPGR,'
      '       SUM(VLRTOTDOC) as VALOR,'
      '       STATUS,'
      '       IDDOCUMENTOXVOTO,'
      '       SALDO - SUM(VLRTOTDOC) AS SALDO,'
      '       IDVOTOGESTAOIMOVEL,'
      '       CODDOCUMENTO,'
      '       NUMLANCTO'
      '  FROM (SELECT DOC.CODDOCUMENTO,'
      '               DV.IDVOTOGESTAOIMOVEL,'
      '               DV.IDDOCUMENTOXVOTO,'
      '               DOC.DATAEMISSAO,'
      '               DOC.NODOCUMENTO,'
      '               DOC.NUMAPGR,'
      '               DECODE(DOC.RECPAG,'
      '                      '#39'P'#39','
      '                      DECODE(LD.DEBCRE,'
      '                             '#39'D'#39','
      '                             SUM(LD.VALOR) * (-1),'
      '                             SUM(LD.VALOR)),'
      '                      0) + DECODE(DOC.RECPAG,'
      '                                  '#39'R'#39','
      '                                  DECODE(LD.DEBCRE,'
      '                                         '#39'C'#39','
      '                                         SUM(LD.VALOR) * (-1),'
      '                                         SUM(LD.VALOR)),'
      '                                  0) as VLRTOTDOC,'
      '               case DOC.STATUS'
      '                 when '#39'0'#39' then'
      '                  '#39'Aberto'#39
      '                when '#39'1'#39' then'
      '                 '#39'Cobrança emitida'#39
      '                 when '#39'2'#39' then'
      '                  '#39'Recebido/Pago'#39
      '               end STATUS,'
      '               VT.VLRAPROVADO AS SALDO,'
      '               DV.NUMLANCTO               '
      '          FROM DOCUMENTO        DOC,'
      '               LANCTODOCUM      LD,'
      '               DOCUMENTOXVOTO   DV,'
      '               VOTOGESTAOIMOVEL VT'
      '         WHERE DOC.CODDOCUMENTO = LD.CODDOCUMENTO'
      '           AND DOC.CODDOCUMENTO = DV.CODDOCUMENTO'
      '           AND VT.IDVOTOGESTAOIMOVEL = DV.IDVOTOGESTAOIMOVEL'
      '           AND LD.OPERACAO <> 5'
      '         GROUP BY DOC.CODDOCUMENTO,'
      '                  DOC.DATAEMISSAO,'
      '                  DOC.NODOCUMENTO,                  '
      '                  DOC.NUMAPGR,'
      '                  DOC.RECPAG,'
      '                  LD.DEBCRE,'
      '                  DOC.STATUS,'
      '                  DV.IDVOTOGESTAOIMOVEL,'
      '                  DV.IDDOCUMENTOXVOTO,'
      '                  DV.NUMLANCTO,'
      '                  VT.VLRAPROVADO)'
      ' where IDVOTOGESTAOIMOVEL = -1'
      ' GROUP BY DATAEMISSAO,'
      '          NODOCUMENTO,'
      '          NUMAPGR,'
      '          STATUS,'
      '          IDDOCUMENTOXVOTO,'
      '          NUMLANCTO,'
      '          SALDO,'
      '          IDVOTOGESTAOIMOVEL,'
      '          CODDOCUMENTO'
      ' ORDER BY 1')
    UpdateObject = updDet
    ValidateWithMask = True
    Left = 97
    Top = 470
    object qryDetDATAEMISSAO: TDateTimeField
      FieldName = 'DATAEMISSAO'
    end
    object qryDetNODOCUMENTO: TFloatField
      FieldName = 'NODOCUMENTO'
    end
    object qryDetNUMAPGR: TFloatField
      FieldName = 'NUMAPGR'
    end
    object qryDetVALOR: TFloatField
      FieldName = 'VALOR'
      DisplayFormat = '#,##0.00'
    end
    object qryDetIDDOCUMENTOXVOTO: TFloatField
      FieldName = 'IDDOCUMENTOXVOTO'
    end
    object qryDetSALDO: TFloatField
      FieldName = 'SALDO'
      DisplayFormat = '#,##0.00'
    end
    object qryDetIDVOTOGESTAOIMOVEL: TFloatField
      FieldName = 'IDVOTOGESTAOIMOVEL'
    end
    object qryDetCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object qryDetSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 16
    end
    object qryDetNUMLANCTO: TFloatField
      FieldName = 'NUMLANCTO'
    end
  end
  object qryAux: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM  DOCUMENTOXVOTO'
      'WHERE IDVOTOGESTAOIMOVEL =0 ')
    ValidateWithMask = True
    Left = 597
    Top = 66
  end
  object MontaSelectFornec: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'NUMDOCUMENTO'
      'NOME'
      'RAZAOSOCIAL')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'CPF ou CNPJ'
      'Nome'
      'Razão Social')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA')
    CamposChave.Strings = (
      'IDPESSOA'
      'RAZAOSOCIAL')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '50'
      '50'
      '50')
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
    Left = 187
    Top = 298
  end
  object MontaSelectDocVoto: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'DOC.NODOCUMENTO'
      'DOC.DATAEMISSAO'
      'DOC.NUMAPGR'
      'LD.VALOR'
      'DOC.STATUS')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Nº Documento'
      'Data Lançamento'
      'Nº Ap/Gr'
      'Valor'
      'Status')
    SensivelACaixa.Strings = (
      'S'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'DOCUMENTO DOC'
      'LANCTODOCUM LD')
    CamposChave.Strings = (
      'DOC.NODOCUMENTO'
      'DOC.DATAEMISSAO'
      'DOC.NUMAPGR'
      'LD.VALOR'
      'DOC.STATUS'
      'DOC.CODDOCUMENTO'
      'LD.NUMLANCTO')
    Filtro.Strings = (
      'DOC.CODDOCUMENTO = LD.CODDOCUMENTO')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '20'
      '20'
      '20'
      '20'
      '20')
    OperComparador.Strings = (
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
      'N')
    ComparaMaiuscula.Strings = (
      ''
      ''
      ''
      ''
      '')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    BeforeOpenCds = MontaSelectDocVotoBeforeOpenCds
    LookupSQL.Strings = (
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
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      ''
      '')
    Left = 257
    Top = 532
  end
  object updDet: TUpdateSQL
    ModifySQL.Strings = (
      'update documentoxvoto'
      'set'
      '  IDDOCUMENTOXVOTO = :IDDOCUMENTOXVOTO,'
      '  IDVOTOGESTAOIMOVEL = :IDVOTOGESTAOIMOVEL,'
      '  CODDOCUMENTO = :CODDOCUMENTO,'
      '  NUMLANCTO   = :NUMLANCTO   '
      'where'
      '  IDDOCUMENTOXVOTO = :OLD_IDDOCUMENTOXVOTO')
    InsertSQL.Strings = (
      'insert into documentoxvoto'
      
        '  (IDDOCUMENTOXVOTO, IDVOTOGESTAOIMOVEL, CODDOCUMENTO, NUMLANCTO' +
        ')'
      'values'
      
        '  (:IDDOCUMENTOXVOTO, :IDVOTOGESTAOIMOVEL, :CODDOCUMENTO, :NUMLA' +
        'NCTO)')
    DeleteSQL.Strings = (
      'delete from documentoxvoto'
      'where'
      '  IDDOCUMENTOXVOTO = :OLD_IDDOCUMENTOXVOTO ')
    Left = 124
    Top = 472
  end
  object qryImoveisXVoto: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM ImoveisXVoto WHERE 1=2')
    ValidateWithMask = True
    Left = 177
    Top = 184
  end
  object cdsImovel: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 361
    Top = 64
    object cdsImovelIDIMOVEL: TIntegerField
      FieldName = 'IDIMOVEL'
    end
    object cdsImovelFLGMARCADO: TBooleanField
      FieldName = 'FLGMARCADO'
    end
  end
  object cdsIMP: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 329
    Top = 62
    object cdsIMPIDIMOVEL: TIntegerField
      FieldName = 'IDIMOVEL'
    end
  end
  object qryAux2: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 636
    Top = 68
  end
end
