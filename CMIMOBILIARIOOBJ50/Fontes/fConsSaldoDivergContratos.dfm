inherited frmConsSaldoDivergContratos: TfrmConsSaldoDivergContratos
  Left = 93
  Top = 150
  Caption = 'Divergência dos Saldos Operacional e Contábil'
  ClientHeight = 437
  ClientWidth = 726
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 726
    Height = 404
    object Panel1: TPanel
      Left = 0
      Top = 0
      Width = 726
      Height = 181
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      inline molImovelMestre: TmolImovelMestre
        Left = 8
        Top = 6
        Width = 721
        inherited edtImovel: TEdit
          Width = 643
        end
        inherited btnBuscaImovel: TBitBtn
          Left = 657
          OnClick = molImovelMestrebtnBuscaImovelClick
        end
        inherited btnLimpaImovel: TBitBtn
          Left = 681
          OnClick = molImovelMestrebtnLimpaImovelClick
        end
      end
      inline molImovel: TmolImovel
        Left = 8
        Top = 48
        Width = 721
        TabOrder = 1
        inherited edtImovel: TEdit
          Width = 643
        end
        inherited btnBuscaImovel: TBitBtn
          Left = 657
          OnClick = molImovelbtnBuscaImovelClick
        end
        inherited btnLimpaImovel: TBitBtn
          Left = 681
          OnClick = molImovelbtnLimpaImovelClick
        end
      end
      inline molContratoNumero: TmolContratoNumero
        Left = 12
        Top = 88
        Width = 487
        TabOrder = 2
        inherited edtConNome: TEdit
          Width = 270
        end
        inherited btnBuscaContrato: TBitBtn
          Left = 430
          OnClick = molContratoNumerobtnBuscaContratoClick
        end
        inherited btnLimpaContrato: TBitBtn
          Left = 454
          OnClick = molContratoNumerobtnLimpaContratoClick
        end
      end
      object pnlCompetencia: TPanel
        Left = 495
        Top = 88
        Width = 225
        Height = 46
        BevelOuter = bvNone
        TabOrder = 3
        object lblDataIni: TLabel
          Left = 10
          Top = 3
          Width = 66
          Height = 13
          Caption = 'Data Inicial'
        end
        object lblDataFim: TLabel
          Left = 118
          Top = 3
          Width = 59
          Height = 13
          Caption = 'Data Final'
        end
        object edtDataIni: TCMDateTimePicker
          Left = 10
          Top = 17
          Width = 99
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
          UnboundDataType = wwDTEdtDate
        end
        object edtDataFim: TCMDateTimePicker
          Left = 118
          Top = 17
          Width = 99
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
          UnboundDataType = wwDTEdtDate
        end
      end
      object chkDiverg: TCheckBox
        Left = 291
        Top = 150
        Width = 240
        Height = 17
        Caption = 'Somente Registros com Divergência?'
        Checked = True
        State = cbChecked
        TabOrder = 5
        OnClick = chkDivergClick
      end
      object pnlSegmento: TPanel
        Left = 12
        Top = 133
        Width = 273
        Height = 41
        BevelOuter = bvNone
        TabOrder = 4
        object Label3: TLabel
          Left = 6
          Top = 2
          Width = 153
          Height = 13
          Caption = 'Tipo de Imóvel (Segmento)'
        end
        object dbLkpSegmento: TwwDBLookupCombo
          Left = 5
          Top = 15
          Width = 260
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCTIPOIMOVEL'#9'60'#9'DESCTIPOIMOVEL'#9'F')
          LookupTable = cdsTipoImovel
          LookupField = 'CODTIPIMOVEL'
          TabOrder = 0
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = False
          OnCloseUp = dbLkpSegmentoCloseUp
        end
      end
      object btnBusca: TBitBtn
        Left = 557
        Top = 141
        Width = 129
        Height = 25
        Caption = '&Buscar'
        ModalResult = 4
        TabOrder = 6
        OnClick = btnBuscaClick
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333444444
          33333333333F8888883F33330000324334222222443333388F3833333388F333
          000032244222222222433338F8833FFFFF338F3300003222222AAAAA22243338
          F333F88888F338F30000322222A33333A2224338F33F8333338F338F00003222
          223333333A224338F33833333338F38F00003222222333333A444338FFFF8F33
          3338888300003AAAAAAA33333333333888888833333333330000333333333333
          333333333333333333FFFFFF000033333333333344444433FFFF333333888888
          00003A444333333A22222438888F333338F3333800003A2243333333A2222438
          F38F333333833338000033A224333334422224338338FFFFF8833338000033A2
          22444442222224338F3388888333FF380000333A2222222222AA243338FF3333
          33FF88F800003333AA222222AA33A3333388FFFFFF8833830000333333AAAAAA
          3333333333338888883333330000333333333333333333333333333333333333
          0000}
        NumGlyphs = 2
      end
    end
    object Panel2: TPanel
      Left = 0
      Top = 181
      Width = 726
      Height = 223
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object pgPrincipal: TPageControl
        Left = 0
        Top = 0
        Width = 726
        Height = 223
        ActivePage = tbContratos
        Align = alClient
        TabOrder = 0
        OnChange = pgPrincipalChange
        object tbContratos: TTabSheet
          Caption = 'Contratos'
          object dbGrdContratos: TwwDBGrid
            Left = 0
            Top = 0
            Width = 718
            Height = 195
            Selected.Strings = (
              'IMOCODIGO'#9'15'#9'Núm. Imóvel'
              'NUMERO_CONTRATO'#9'10'#9'Núm. Contrato'
              'NOME_CONTRATO'#9'60'#9'Nome Contrato'
              'DOCUMENTO'#9'18'#9'CPF/CNPJ Comprador'
              'NOME_COMPRADOR'#9'60'#9'Nome Comprador'
              'NOME_RESPONSAVEL'#9'60'#9'Nome Responsável')
            MemoAttributes = [mSizeable, mWordWrap, mGridShow]
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsContratoImovel
            KeyOptions = []
            ReadOnly = True
            TabOrder = 0
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            OnCalcCellColors = dbGrdContratosCalcCellColors
            IndicatorColor = icBlack
          end
        end
        object tbSaldos: TTabSheet
          Caption = 'Saldos'
          ImageIndex = 1
          object dbGrdSaldos: TwwDBGrid
            Left = 0
            Top = 0
            Width = 718
            Height = 195
            Selected.Strings = (
              'SALDOANTOPE'#9'11'#9'Saldo Anterior Operacional '
              'SALDOANTCONT'#9'11'#9'Saldo Anterior Contábil'
              'SALDOOPE'#9'11'#9'Saldo Atual Operacional '
              'SALDOCONT'#9'11'#9'Saldo Atual Contábil'#9'F')
            MemoAttributes = [mSizeable, mWordWrap, mGridShow]
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsSaldos
            KeyOptions = []
            ReadOnly = True
            TabOrder = 0
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 2
            TitleButtons = False
            OnCalcCellColors = dbGrdSaldosCalcCellColors
            IndicatorColor = icBlack
            OnDrawTitleCell = dbGrdSaldosDrawTitleCell
          end
        end
        object tbDocumentos: TTabSheet
          Caption = 'Documentos'
          ImageIndex = 2
          object dbGrdDocumentos: TwwDBGrid
            Left = 0
            Top = 0
            Width = 718
            Height = 195
            Selected.Strings = (
              'DATALANC'#9'11'#9'Dt. Vencto'
              'DATABAIXA'#9'11'#9'Dt. Baixa'
              'CODDOCUMENTO'#9'10'#9'Documento'
              'DESCRICAO'#9'50'#9'Descrição Documento'
              'RECPAG'#9'1'#9'Tipo'
              'VALORLANC'#9'11'#9'Vlr. Lançamento'
              'VALORBAIXA'#9'11'#9'Vlr. Baixa')
            MemoAttributes = [mSizeable, mWordWrap, mGridShow]
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsDocumento
            KeyOptions = []
            ReadOnly = True
            TabOrder = 0
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            OnCalcCellColors = dbGrdDocumentosCalcCellColors
            IndicatorColor = icBlack
          end
        end
        object tbAlteradores: TTabSheet
          Caption = 'Alteradores'
          ImageIndex = 3
          object dbGrdAlteradores: TwwDBGrid
            Left = 0
            Top = 0
            Width = 718
            Height = 195
            Selected.Strings = (
              'DATALANCTO'#9'11'#9'Data Lancto'
              'CODALTERADOR'#9'4'#9'Cód. Alterador'
              'DESCRICAO'#9'40'#9'Tipo Alterador'
              'DEBCRE'#9'8'#9'Deb/Cre'
              'VALOR'#9'16'#9'Valor'#9'F')
            MemoAttributes = [mSizeable, mWordWrap, mGridShow]
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsAlterador
            KeyOptions = []
            ReadOnly = True
            TabOrder = 0
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            OnCalcCellColors = dbGrdAlteradoresCalcCellColors
            IndicatorColor = icBlack
          end
        end
        object tbDivergencias: TTabSheet
          Caption = 'Divergências'
          ImageIndex = 4
          object dbGrdDivergencia: TwwDBGrid
            Left = 0
            Top = 0
            Width = 718
            Height = 195
            Selected.Strings = (
              'DATALANC'#9'10'#9'Dt. Vencto.'
              'DATABAIXA'#9'10'#9'Dt. Baixa'
              'CODDOCUMENTO'#9'10'#9'Documento'
              'RECPAG'#9'1'#9'Tipo'
              'VLR_LANC_OPER'#9'12'#9'Vlr. Lançamento'
              'VLR_LANC_CONT'#9'12'#9'Vlr. Lançamento'
              'VLR_ALT_OPER'#9'12'#9'Vlr. Alterador'
              'VLR_ALT_CONT'#9'12'#9'Vlr. Alterador'
              'VLR_BAIXA_OPER'#9'12'#9'Vlr. Baixado'
              'VLR_BAIXA_CONT'#9'12'#9'Vlr. Baixado')
            MemoAttributes = [mSizeable, mWordWrap, mGridShow]
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsDivergencia
            KeyOptions = []
            ReadOnly = True
            TabOrder = 0
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 2
            TitleButtons = False
            OnCalcCellColors = dbGrdDivergenciaCalcCellColors
            IndicatorColor = icBlack
            OnDrawTitleCell = dbGrdDivergenciaDrawTitleCell
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 404
    Width = 726
    inherited tb97Fundo: TToolbar97
      Left = 382
      DockPos = 382
      inherited sep1: TToolbarSep97
        Left = 164
      end
      inherited ToolbarSep971: TToolbarSep97
        Left = 81
      end
      inherited ToolbarSep972: TToolbarSep97
        Left = 247
      end
      inherited bbtnSair: TBitBtn
        Left = 83
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 166
      end
      object bbtnExportar: TBitBtn
        Left = 0
        Top = 0
        Width = 81
        Height = 27
        Caption = '&Exportar'
        TabOrder = 2
        OnClick = bbtnExportarClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333303
          333333333333337FF3333333333333903333333333333377FF33333333333399
          03333FFFFFFFFF777FF3000000999999903377777777777777FF0FFFF0999999
          99037F3337777777777F0FFFF099999999907F3FF777777777770F00F0999999
          99037F773777777777730FFFF099999990337F3FF777777777330F00FFFFF099
          03337F773333377773330FFFFFFFF09033337F3FF3FFF77733330F00F0000003
          33337F773777777333330FFFF0FF033333337F3FF7F3733333330F08F0F03333
          33337F7737F7333333330FFFF003333333337FFFF77333333333000000333333
          3333777777333333333333333333333333333333333333333333}
        NumGlyphs = 2
      end
    end
  end
  object cdsContratosImovel: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterScroll = cdsContratosImovelAfterScroll
    Left = 28
    Top = 253
  end
  object dsContratoImovel: TwwDataSource
    DataSet = cdsContratosImovel
    Left = 28
    Top = 301
  end
  object cdsSaldos: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterOpen = cdsSaldosAfterOpen
    Left = 92
    Top = 253
  end
  object dsSaldos: TwwDataSource
    DataSet = cdsSaldos
    Left = 92
    Top = 301
  end
  object dsDocumento: TwwDataSource
    DataSet = cdsDocumento
    Left = 148
    Top = 301
  end
  object cdsDocumento: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterOpen = cdsDocumentoAfterOpen
    Left = 148
    Top = 253
  end
  object cdsAlterador: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterOpen = cdsAlteradorAfterOpen
    Left = 220
    Top = 253
  end
  object dsAlterador: TwwDataSource
    DataSet = cdsAlterador
    Left = 220
    Top = 301
  end
  object cdsDivergencia: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterOpen = cdsDivergenciaAfterOpen
    Left = 292
    Top = 253
  end
  object dsDivergencia: TwwDataSource
    DataSet = cdsDivergencia
    Left = 292
    Top = 301
  end
  object cdsTipoImovel: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 204
    Top = 149
    Data = {
      3D0100009619E0BD0100000018000000020009000000030000006B000C434F44
      544950494D4F56454C01004900000001000557494454480200020005000E4445
      53435449504F494D4F56454C0100490000000100055749445448020002003C00
      0100044C434944040001000908000000000552454E44410A506172612052656E
      646100000553484F50500F53686F7070696E672043656E746572000005484F54
      454C05486F74656C00000450524F5010506172612055736F2050726F7072696F
      000005504154524F164C6F6361646F206120506174726F63696E61646F726100
      0005454E5452451850617271756573206520456E74726574656E696D656E746F
      000004544552520754657272656E6F000005434F4E53540D456D20436F6E7374
      727563616F00000455534F50144C6F6361646F20612055736F205072F3707269
      6F}
  end
  object CMSqlParams: TCMSqlParams
    SQL.Strings = (
      'select cast(null as date) as DataLanc,'
      'cast(null as date) as DataBaixa,'
      'cast(null as varchar2(100)) as CodDocumento,'
      #39' '#39' as RECPAG,'
      '0.00 as Vlr_Lanc_Oper,'
      '0.00 as Vlr_Lanc_Cont,'
      '0.00 as Vlr_Alt_Oper,'
      '0.00 as Vlr_Alt_Cont,'
      '0.00 as Vlr_Baixa_Oper,'
      '0.00 as Vlr_Baixa_Cont'
      'from dual')
    Left = 68
    Top = 357
  end
  object QExport3Dialog: TQExport3Dialog
    ShowPrintAfter = False
    AllowedExports = [aeXLS, aePDF, aeCSV]
    RTFOptions.CaptionStyle.Font.Charset = DEFAULT_CHARSET
    RTFOptions.CaptionStyle.Font.Color = clBlack
    RTFOptions.CaptionStyle.Font.Height = -13
    RTFOptions.CaptionStyle.Font.Name = 'Arial'
    RTFOptions.CaptionStyle.Font.Style = [fsBold]
    RTFOptions.CaptionStyle.Alignment = talCenter
    RTFOptions.DataStyle.Font.Charset = DEFAULT_CHARSET
    RTFOptions.DataStyle.Font.Color = clBlack
    RTFOptions.DataStyle.Font.Height = -13
    RTFOptions.DataStyle.Font.Name = 'Arial'
    RTFOptions.DataStyle.Font.Style = []
    RTFOptions.FooterStyle.Font.Charset = DEFAULT_CHARSET
    RTFOptions.FooterStyle.Font.Color = clBlack
    RTFOptions.FooterStyle.Font.Height = -13
    RTFOptions.FooterStyle.Font.Name = 'Arial'
    RTFOptions.FooterStyle.Font.Style = []
    RTFOptions.HeaderStyle.Font.Charset = DEFAULT_CHARSET
    RTFOptions.HeaderStyle.Font.Color = clBlack
    RTFOptions.HeaderStyle.Font.Height = -13
    RTFOptions.HeaderStyle.Font.Name = 'Arial'
    RTFOptions.HeaderStyle.Font.Style = []
    RTFOptions.StripStyles = <>
    HTMLPageOptions.TextFont.Charset = DEFAULT_CHARSET
    HTMLPageOptions.TextFont.Color = clWhite
    HTMLPageOptions.TextFont.Height = -11
    HTMLPageOptions.TextFont.Name = 'Arial'
    HTMLPageOptions.TextFont.Style = []
    CSVOptions.Comma = ';'
    PDFOptions.PageOptions.Orientation = poLandscape
    PDFOptions.PageOptions.MarginLeft = 0.78
    PDFOptions.PageOptions.MarginRight = 0.78
    PDFOptions.PageOptions.MarginTop = 1.17
    PDFOptions.PageOptions.MarginBottom = 0.57
    XLSOptions.PageFooter = 'Page &P of &N'
    XLSOptions.SheetTitle = 'Sheet 1'
    XLSOptions.CaptionFormat.Font.Style = [xfsBold]
    XLSOptions.HyperlinkFormat.Font.Color = clrBlue
    XLSOptions.HyperlinkFormat.Font.Underline = fulSingle
    XLSOptions.NoteFormat.Alignment.Horizontal = halLeft
    XLSOptions.NoteFormat.Alignment.Vertical = valTop
    XLSOptions.NoteFormat.Font.Size = 8
    XLSOptions.NoteFormat.Font.Style = [xfsBold]
    XLSOptions.NoteFormat.Font.Name = 'Tahoma'
    XLSOptions.FieldFormats = <>
    XLSOptions.StripStyles = <>
    XLSOptions.Hyperlinks = <>
    XLSOptions.Notes = <>
    XLSOptions.Charts = <>
    XLSOptions.Pictures = <>
    XLSOptions.Images = <>
    XLSOptions.Cells = <>
    XLSOptions.MergedCells = <>
    Left = 372
    Top = 253
  end
end
