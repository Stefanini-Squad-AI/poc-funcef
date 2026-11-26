inherited frmAbertFechaLote: TfrmAbertFechaLote
  Left = 4
  Top = 136
  HelpContext = 180020
  Caption = 'Abertura e Fechamento de Lote'
  ClientHeight = 354
  ClientWidth = 790
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 790
    Height = 315
    object pgctrlLote: TPageControl
      Left = 1
      Top = 1
      Width = 788
      Height = 313
      ActivePage = tbsEliminacao
      Align = alClient
      TabOrder = 0
      OnChange = pgctrlLoteChange
      object tbsAbertLote: TTabSheet
        Caption = 'Abertura de Lote'
        object lblDescLote: TLabel
          Left = 17
          Top = 140
          Width = 105
          Height = 13
          Caption = 'Descrição do Lote'
        end
        object lblAguarde: TLabel
          Left = 307
          Top = 237
          Width = 145
          Height = 13
          Caption = 'Aguarde Processando ....'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Visible = False
        end
        object rgpConcbenef: TRadioGroup
          Left = 338
          Top = 81
          Width = 321
          Height = 81
          Caption = 'Pagamento do mês da Concessão'
          Items.Strings = (
            'Preparar &Benefício até mês anterior à Concessão'
            '&Preparar Benefício até mês da Concessão')
          TabOrder = 2
          TabStop = True
        end
        object RdgTpFolha: TRadioGroup
          Left = 321
          Top = 9
          Width = 201
          Height = 192
          Hint = 'Opções de Geração dos Tipos de Folha de Benefício'
          Caption = ' Tipo de Cálculo '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ItemIndex = 0
          Items.Strings = (
            'Normal'
            'Abono'
            'Antecipação do Abono'
            'Reprocessamento'
            'Pagamento Pendente'
            'Folha Extra')
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 5
          OnClick = RdgTpFolhaClick
        end
        object btnAbrirLote: TBitBtn
          Left = 614
          Top = 43
          Width = 94
          Height = 25
          Anchors = []
          Caption = '&Abrir Lote'
          TabOrder = 3
          OnClick = btnAbrirLoteClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
            5555555555555555555555555555555555555555555555555555555555555555
            555555555555555555555555555555555555555FFFFFFFFFF555550000000000
            55555577777777775F55500B8B8B8B8B05555775F555555575F550F0B8B8B8B8
            B05557F75F555555575F50BF0B8B8B8B8B0557F575FFFFFFFF7F50FBF0000000
            000557F557777777777550BFBFBFBFB0555557F555555557F55550FBFBFBFBF0
            555557F555555FF7555550BFBFBF00055555575F555577755555550BFBF05555
            55555575FFF75555555555700007555555555557777555555555555555555555
            5555555555555555555555555555555555555555555555555555}
          Margin = 2
          NumGlyphs = 2
        end
        object edtDescrLote: TEdit
          Left = 16
          Top = 156
          Width = 277
          Height = 21
          TabOrder = 1
        end
        object gbPagamento: TGroupBox
          Left = 16
          Top = 9
          Width = 278
          Height = 106
          Caption = ' Competência '
          TabOrder = 0
          object lblAno: TLabel
            Left = 172
            Top = 18
            Width = 23
            Height = 13
            Caption = 'Ano'
          end
          object lblMes: TLabel
            Left = 14
            Top = 19
            Width = 24
            Height = 13
            Caption = 'Mês'
          end
          object lblDataPagamento: TLabel
            Left = 13
            Top = 73
            Width = 113
            Height = 13
            Caption = 'Data de Pagamento'
          end
          object seAno: TSpinEdit
            Left = 170
            Top = 32
            Width = 89
            Height = 22
            MaxValue = 0
            MinValue = 0
            TabOrder = 1
            Value = 2001
            OnChange = seAnoChange
          end
          object cboxMes: TComboBox
            Left = 12
            Top = 33
            Width = 145
            Height = 21
            ItemHeight = 13
            TabOrder = 0
            OnChange = cboxMesChange
            Items.Strings = (
              'Janeiro'
              'Fevereiro'
              'Março'
              'Abril'
              'Maio'
              'Junho'
              'Julho'
              'Agosto'
              'Setembro'
              'Outubro'
              'Novembro'
              'Dezembro')
          end
          object edtDataAbert: TCMDateTimePicker
            Left = 137
            Top = 70
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
        end
        object Animate1: TAnimate
          Left = 14
          Top = 220
          Width = 278
          Height = 45
          Active = False
          AutoSize = False
          CommonAVI = aviCopyFile
          StopFrame = 26
          Visible = False
        end
      end
      object tbsFechaLote: TTabSheet
        Caption = 'Fechamento de Lote'
        object Label2: TLabel
          Left = 17
          Top = 9
          Width = 119
          Height = 13
          Caption = 'Data de Fechamento'
        end
        object btnFechaLote: TBitBtn
          Left = 467
          Top = 17
          Width = 121
          Height = 25
          Caption = '&Fechar Lotes'
          TabOrder = 2
          OnClick = btnFechaLoteClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
            5555555555555555555555555555555555555555555555555555555555555555
            55555555FFFFFFFFFF5555500000000005555557777777777F55550BFBFBFBFB
            0555557F555555557F55550FBFBFBFBF0555557F555555557F55550BFBFBFBFB
            0555557F555555557F55550FBFBFBFBF0555557F555555557F55550BFBFBFBFB
            0555557F555555557F55550FBFBFBFBF0555557FFFFFFFFF7555550000000000
            555555777777777755555550FBFB0555555555575FFF75555555555700007555
            5555555577775555555555555555555555555555555555555555555555555555
            5555555555555555555555555555555555555555555555555555}
          Margin = 2
          NumGlyphs = 2
        end
        object wwDBGrid1: TwwDBGrid
          Left = 0
          Top = 80
          Width = 780
          Height = 205
          Selected.Strings = (
            'FECHALOTE'#9'10'#9'Fecha Lote'#9'F'
            'IDLOTE'#9'8'#9'Lote Nº'#9'F'
            'DESCRICAO'#9'55'#9'Descrição'#9'F'
            'MESREFERENCIA'#9'11'#9'Mês de ~Pagamento'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
          Align = alBottom
          DataSource = dsLoteAbert
          TabOrder = 1
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 2
          TitleButtons = False
          IndicatorColor = icBlack
        end
        object edtDataFecha: TCMDateTimePicker
          Left = 16
          Top = 25
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
          TabOrder = 0
        end
      end
      object tbsReabreLote: TTabSheet
        Caption = 'Reabertura de Lote'
        ImageIndex = 2
        object bbtnReabreLote: TBitBtn
          Left = 467
          Top = 17
          Width = 121
          Height = 25
          Caption = '&Reabre Lotes'
          TabOrder = 0
          OnClick = bbtnReabreLoteClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
            5555555555555555555555555555555555555555555555555555555555555555
            55555555FFFFFFFFFF5555500000000005555557777777777F55550BFBFBFBFB
            0555557F555555557F55550FBFBFBFBF0555557F555555557F55550BFBFBFBFB
            0555557F555555557F55550FBFBFBFBF0555557F555555557F55550BFBFBFBFB
            0555557F555555557F55550FBFBFBFBF0555557FFFFFFFFF7555550000000000
            555555777777777755555550FBFB0555555555575FFF75555555555700007555
            5555555577775555555555555555555555555555555555555555555555555555
            5555555555555555555555555555555555555555555555555555}
          Margin = 2
          NumGlyphs = 2
        end
        object dbgReabre: TwwDBGrid
          Left = 0
          Top = 72
          Width = 772
          Height = 205
          Selected.Strings = (
            'REABRELOTE'#9'10'#9'Reabre Lote'#9'F'
            'IDLOTE'#9'8'#9'Lote Nº'
            'DESCRICAO'#9'55'#9'Descrição'
            'MESREFERENCIA'#9'11'#9'Mês de ~Pagamento')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
          Align = alBottom
          DataSource = dsLotePrevia
          TabOrder = 1
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 2
          TitleButtons = False
          IndicatorColor = icBlack
        end
      end
      object tbsEliminacao: TTabSheet
        Caption = 'Eliminação de Lotes'
        ImageIndex = 3
        object dbgElimina: TwwDBGrid
          Left = 0
          Top = 0
          Width = 780
          Height = 249
          Selected.Strings = (
            'IDLOTE'#9'9'#9'Lote'
            'MESREFERENCIA'#9'8'#9'Mês'
            'DESCRICAO'#9'33'#9'Descrição'
            'DATAPAGAMENTO'#9'12'#9'Data Pagto'
            'DESCRTIPOFOLHA'#9'11'#9'Tipo Folha'
            'QTREGS'#9'10'#9'Qtde Regs'
            'VLRTOTAL'#9'10'#9'Valor Total'
            'FLGPREPARADO'#9'7'#9'Preparo'
            'FLGIDATMP'#9'6'#9'Prévia'
            'FLGVOLTATMP'#9'10'#9'Efetivação')
          MemoAttributes = []
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
          Align = alClient
          DataSource = dsEliminaLote
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyOptions = []
          Options = [dgAlwaysShowEditor, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgWordWrap, dgTrailingEllipsis, dgShowCellHint]
          ParentFont = False
          TabOrder = 0
          TitleAlignment = taCenter
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          IndicatorColor = icBlack
        end
        object Panel1: TPanel
          Left = 0
          Top = 249
          Width = 780
          Height = 36
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 1
          object btnElimina: TBitBtn
            Left = 637
            Top = 5
            Width = 121
            Height = 25
            Anchors = [akRight, akBottom]
            Caption = '&Elimina Lote'
            TabOrder = 0
            OnClick = btnEliminaClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
              5555555555555555555555555555555555555555555555555555555555555555
              55555555FFFFFFFFFF5555500000000005555557777777777F55550BFBFBFBFB
              0555557F555555557F55550FBFBFBFBF0555557F555555557F55550BFBFBFBFB
              0555557F555555557F55550FBFBFBFBF0555557F555555557F55550BFBFBFBFB
              0555557F555555557F55550FBFBFBFBF0555557FFFFFFFFF7555550000000000
              555555777777777755555550FBFB0555555555575FFF75555555555700007555
              5555555577775555555555555555555555555555555555555555555555555555
              5555555555555555555555555555555555555555555555555555}
            Margin = 2
            NumGlyphs = 2
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 315
    Width = 790
    inherited tb97Fundo: TToolbar97
      Left = 390
      DockPos = 390
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 662
    Top = 320
    TargetsData = (
      1
      2
      (
        ''
        'Text'
        0)
      (
        ''
        'DisplayLabel'
        0))
  end
  object qryAbreLote: TwwQuery
    DatabaseName = 'basedados'
    ValidateWithMask = True
    Left = 11
    Top = 320
  end
  object qryFechaLote: TwwQuery
    CachedUpdates = True
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT C.IDLOTE, C.DESCRICAO, C.MESREFERENCIA, 0 AS FECHALOTE'
      'FROM CTRLINTERFACE C'
      'WHERE C.FLGPREPARADO = 1'
      'AND   C.TIPO = '#39'B'#39
      'AND C.FLGCONCESSAO =1'
      'AND C.FLGIDATMP = 0'
      'ORDER BY C.MESREFERENCIA, C.DESCRICAO')
    ControlType.Strings = (
      'FECHALOTE;CheckBox;1;0')
    ValidateWithMask = True
    Left = 52
    Top = 319
  end
  object dsLoteAbert: TwwDataSource
    DataSet = qryFechaLote
    Left = 82
    Top = 320
  end
  object updFechaLote: TUpdateSQL
    ModifySQL.Strings = (
      'update CTRLINTERFACE'
      'set'
      '  IDLOTE = :IDLOTE,'
      '  DESCRICAO = :DESCRICAO,'
      '  MESREFERENCIA = :MESREFERENCIA,'
      '  FECHALOTE = :FECHALOTE'
      'where'
      '  IDLOTE = :OLD_IDLOTE')
    InsertSQL.Strings = (
      'insert into CTRLINTERFACE'
      '  (IDLOTE, DESCRICAO, MESREFERENCIA, FECHALOTE)'
      'values'
      '  (:IDLOTE, :DESCRICAO, :MESREFERENCIA, :FECHALOTE)')
    DeleteSQL.Strings = (
      'delete from CTRLINTERFACE'
      'where'
      '  IDLOTE = :OLD_IDLOTE')
    Left = 310
    Top = 321
  end
  object qryaux: TwwQuery
    DatabaseName = 'Basedados'
    ValidateWithMask = True
    Left = 268
    Top = 321
  end
  object qryReabreLote: TwwQuery
    CachedUpdates = True
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT C.IDLOTE, C.DESCRICAO, C.MESREFERENCIA, 0 AS REABRELOTE'
      'FROM CTRLINTERFACE C'
      'WHERE C.FLGPREPARADO = 1'
      'AND C.TIPO = '#39'B'#39
      'AND C.FLGCONCESSAO =1'
      'AND C.FLGIDATMP = 1'
      'AND (C.FLGVOLTATMP = 0 OR C.FLGVOLTATMP IS NULL)'
      'ORDER BY C.MESREFERENCIA DESC, C.DESCRICAO')
    UpdateObject = updReabreLote
    ControlType.Strings = (
      'REABRELOTE;CheckBox;1;0')
    ValidateWithMask = True
    Left = 124
    Top = 320
  end
  object dsLotePrevia: TwwDataSource
    DataSet = qryReabreLote
    Left = 154
    Top = 321
  end
  object updReabreLote: TUpdateSQL
    ModifySQL.Strings = (
      'update CTRLINTERFACE'
      'set'
      '  IDLOTE = :IDLOTE,'
      '  DESCRICAO = :DESCRICAO,'
      '  MESREFERENCIA = :MESREFERENCIA,'
      '  REABRELOTE = :REABRELOTE'
      'where'
      '  IDLOTE = :OLD_IDLOTE')
    InsertSQL.Strings = (
      'insert into CTRLINTERFACE'
      '  (IDLOTE, DESCRICAO, MESREFERENCIA, REABRELOTE)'
      'values'
      '  (:IDLOTE, :DESCRICAO, :MESREFERENCIA, :REABRELOTE)')
    DeleteSQL.Strings = (
      'delete from CTRLINTERFACE'
      'where'
      '  IDLOTE = :OLD_IDLOTE')
    Left = 347
    Top = 321
  end
  object qryEliminaLote: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT C.IDLOTE, C.MESREFERENCIA, C.DESCRICAO,'
      '       C.FLGIDATMP, DECODE(C.FLGIDATMP,1,'#39'Sim'#39','#39'Não'#39') AS JAPROC,'
      
        '       C.FLGVOLTATMP, DECODE(C.FLGVOLTATMP,1,'#39'Sim'#39','#39'Não'#39') AS EFE' +
        'TIVADO,'
      '       C.DATAPAGAMENTO, C.FLGPREPARADO,'
      '       DECODE(IDREFERENCIA, NULL,'
      
        '         DECODE(C.FLGTIPOFOLHA,1,'#39'Pagto Pendente'#39',2,'#39'Extra'#39',3,'#39'A' +
        'bono'#39','
      '                4,'#39'Adiant. Abono'#39',5,'#39'Exclusões Efetivação'#39','
      '                DECODE(C.FLGCONCESSAO,1,'#39'Concessão'#39','#39'Normal'#39')),'
      '         '#39'Convênio'#39') DESCRTIPOFOLHA,'
      '       C.NUMREG AS QTREGS,'
      '       ROUND(C.VLRTOTAL,2) AS VLRTOTAL'
      'FROM CTRLINTERFACE C'
      'WHERE C.TIPO = '#39'B'#39
      'AND C.IDPESSOA = :IDFUNDACAO'
      'ORDER BY C.MESREFERENCIA DESC, C.DESCRICAO'
      ''
      ' '
      ' '
      ' ')
    ControlType.Strings = (
      'FLGPREPARADO;CheckBox;1;0'
      'FLGIDATMP;CheckBox;1;0'
      'FLGVOLTATMP;CheckBox;1;0')
    ValidateWithMask = True
    Left = 197
    Top = 320
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDFUNDACAO'
        ParamType = ptUnknown
      end>
    object qryEliminaLoteIDLOTE: TFloatField
      DisplayLabel = 'Lote'
      DisplayWidth = 9
      FieldName = 'IDLOTE'
    end
    object qryEliminaLoteMESREFERENCIA: TStringField
      DisplayLabel = 'Mês'
      DisplayWidth = 8
      FieldName = 'MESREFERENCIA'
      FixedChar = True
      Size = 7
    end
    object qryEliminaLoteDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 33
      FieldName = 'DESCRICAO'
      Size = 200
    end
    object qryEliminaLoteDATAPAGAMENTO: TDateTimeField
      DisplayLabel = 'Data Pagto'
      DisplayWidth = 12
      FieldName = 'DATAPAGAMENTO'
    end
    object qryEliminaLoteDESCRTIPOFOLHA: TStringField
      DisplayLabel = 'Tipo Folha'
      DisplayWidth = 11
      FieldName = 'DESCRTIPOFOLHA'
    end
    object qryEliminaLoteQTREGS: TFloatField
      DisplayLabel = 'Qtde Regs'
      DisplayWidth = 10
      FieldName = 'QTREGS'
    end
    object qryEliminaLoteVLRTOTAL: TFloatField
      DisplayLabel = 'Valor Total'
      DisplayWidth = 10
      FieldName = 'VLRTOTAL'
    end
    object qryEliminaLoteFLGPREPARADO: TFloatField
      DisplayLabel = 'Preparo'
      DisplayWidth = 7
      FieldName = 'FLGPREPARADO'
    end
    object qryEliminaLoteFLGIDATMP: TFloatField
      DisplayLabel = 'Prévia'
      DisplayWidth = 6
      FieldName = 'FLGIDATMP'
    end
    object qryEliminaLoteFLGVOLTATMP: TFloatField
      DisplayLabel = 'Efetivação'
      DisplayWidth = 10
      FieldName = 'FLGVOLTATMP'
    end
    object qryEliminaLoteJAPROC: TStringField
      FieldName = 'JAPROC'
      Visible = False
      Size = 3
    end
    object qryEliminaLoteEFETIVADO: TStringField
      FieldName = 'EFETIVADO'
      Visible = False
      Size = 3
    end
  end
  object dsEliminaLote: TwwDataSource
    DataSet = qryEliminaLote
    Left = 227
    Top = 321
  end
end
