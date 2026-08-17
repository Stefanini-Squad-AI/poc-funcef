inherited frmRADConsultaDestacamento: TfrmRADConsultaDestacamento
  Left = 81
  Top = 154
  Caption = 'Consulta RAD do Destacamento'
  ClientHeight = 414
  ClientWidth = 839
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 839
    Height = 375
    object pnlMestre: TPanel
      Left = 1
      Top = 1
      Width = 837
      Height = 173
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object Panel2: TPanel
        Left = 0
        Top = 141
        Width = 837
        Height = 32
        Align = alBottom
        TabOrder = 0
        object Label4: TLabel
          Left = 281
          Top = 9
          Width = 93
          Height = 13
          Caption = 'Total do Acerto:'
        end
        object Label1: TLabel
          Left = 11
          Top = 9
          Width = 137
          Height = 13
          Caption = 'Total do Destacamento:'
        end
        object Label3: TLabel
          Left = 515
          Top = 9
          Width = 37
          Height = 13
          Caption = 'Saldo:'
        end
        object lblTipo: TLabel
          Left = 679
          Top = 5
          Width = 63
          Height = 20
          Caption = 'a Pagar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edtAcerto: TDBRealEdit
          Left = 378
          Top = 5
          Width = 110
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
            '250,00')
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
          DataField = 'VLRACERTO'
          DataSource = dsDestacamento
        end
        object edtSumDiarias: TRealEdit
          Left = 153
          Top = 5
          Width = 110
          Height = 21
          Alignment = taRightJustify
          Color = clInfoBk
          Lines.Strings = (
            '0,00')
          ReadOnly = True
          TabOrder = 1
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
        end
        object edtSaldo: TDBRealEdit
          Left = 558
          Top = 5
          Width = 110
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
            '   0,00')
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
        end
      end
      object GroupBox3: TGroupBox
        Left = 408
        Top = 45
        Width = 340
        Height = 92
        Caption = ' Natureza do Serviço / Justificativa '
        TabOrder = 1
      end
      object dbrgObjetivo: TDBRadioGroup
        Left = 6
        Top = 3
        Width = 120
        Height = 134
        Caption = 'Objetivo'
        Color = clBtnFace
        DataField = 'INDOBJETIVO'
        DataSource = dsDestacamento
        Items.Strings = (
          'Trabalho'
          'Treinamento')
        ParentColor = False
        ReadOnly = True
        TabOrder = 2
        Values.Strings = (
          '0'
          '1')
      end
      object gbxPeriodo: TGroupBox
        Left = 408
        Top = 2
        Width = 340
        Height = 41
        Caption = 'Período'
        TabOrder = 3
        object Label2: TLabel
          Left = 164
          Top = 20
          Width = 8
          Height = 13
          Caption = 'a'
        end
        object dbdtIni: TCMDateTimePicker
          Left = 7
          Top = 14
          Width = 149
          Height = 21
          TabStop = False
          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
          CalendarAttributes.Font.Color = clWindowText
          CalendarAttributes.Font.Height = -11
          CalendarAttributes.Font.Name = 'MS Sans Serif'
          CalendarAttributes.Font.Style = []
          Color = clInfoBk
          ButtonStyle = cbsCustom
          DataField = 'DATAINI'
          DataSource = dsDestacamento
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
          TabOrder = 0
        end
        object dbdtFim: TCMDateTimePicker
          Left = 181
          Top = 13
          Width = 149
          Height = 21
          TabStop = False
          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
          CalendarAttributes.Font.Color = clWindowText
          CalendarAttributes.Font.Height = -11
          CalendarAttributes.Font.Name = 'MS Sans Serif'
          CalendarAttributes.Font.Style = []
          Color = clInfoBk
          ButtonStyle = cbsCustom
          DataField = 'DATAFIM'
          DataSource = dsDestacamento
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
          TabOrder = 1
        end
      end
      object GroupBox1: TGroupBox
        Left = 133
        Top = 2
        Width = 269
        Height = 135
        Caption = ' Destacado '
        TabOrder = 4
        object dbedCargo: TDBEdit
          Left = 13
          Top = 61
          Width = 236
          Height = 21
          TabStop = False
          Color = clInfoBk
          DataField = 'NM_CARGO'
          DataSource = dsDestacamento
          ReadOnly = True
          TabOrder = 0
        end
        object dbedLotac: TDBEdit
          Left = 13
          Top = 100
          Width = 236
          Height = 21
          TabStop = False
          Color = clInfoBk
          DataField = 'NM_CENTRO_CUSTO'
          DataSource = dsDestacamento
          ReadOnly = True
          TabOrder = 1
        end
        object dbedDestacado: TwwDBEdit
          Left = 14
          Top = 22
          Width = 240
          Height = 21
          TabStop = False
          Color = clInfoBk
          DataField = 'NOME'
          DataSource = dsDestacamento
          ReadOnly = True
          TabOrder = 2
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
      end
      object dbedObserv: TDBMemo
        Left = 417
        Top = 62
        Width = 318
        Height = 66
        Color = clInfoBk
        DataField = 'OBSERVACAO'
        DataSource = dsDestacamento
        TabOrder = 5
      end
    end
    object pgctrlDetalhe: TPageControl
      Left = 1
      Top = 174
      Width = 837
      Height = 200
      ActivePage = TabSheet1
      Align = alClient
      TabOrder = 1
      object tsCalendario: TTabSheet
        Caption = ' Calendário de Diárias '
        object dbgrdCalendario: TwwDBGrid
          Left = 0
          Top = 0
          Width = 829
          Height = 172
          Hint = 'Duplo Click para vizualizar a observação do item'
          Selected.Strings = (
            'DATADESTACAMENTO'#9'10'#9'Data'#9'F'
            'QUEMPAGA'#9'20'#9'Resp. Diaria'#9'F'
            'VLRDIARIA'#9'10'#9'Vlr. Diária'#9'F'
            'PCDIARIA'#9'10'#9'%'#9'F'
            'VLRHOTEL'#9'10'#9'Vlr. Hotel'#9'F'
            'PCHOTEL'#9'10'#9'%'#9'F'
            'VLRDESLOCAMENTO'#9'10'#9'Vlr. Deslocamento'#9'F'
            'PCDESLOCAMENTO'#9'10'#9'%'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          Color = clInfoBk
          DataSource = dsCalendario
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgShowFooter]
          ParentFont = False
          ParentShowHint = False
          ReadOnly = True
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
          IndicatorColor = icBlack
          OnUpdateFooter = dbgrdCalendarioUpdateFooter
        end
      end
      object tsTrecho: TTabSheet
        Caption = ' Trecho '
        ImageIndex = 1
        object dbgrdTrecho: TwwDBGrid
          Left = 0
          Top = 0
          Width = 829
          Height = 172
          Hint = 'Duplo Click para vizualizar a observação do item'
          Selected.Strings = (
            'NUMSEQ'#9'3'#9'#'#9'F'
            'DATAINI'#9'10'#9'Data'#9'F'
            'NOME'#9'20'#9'Cidade'#9'F'
            'RESPTRANSPORTE'#9'9'#9'Resp.Transp.'#9'F'
            'TRANSPORTE'#9'12'#9'Tipo'#9'F'
            'VLRTRANSPORTE'#9'13'#9'Vlr. Transporte'#9'F'
            'VLREMBARQUE'#9'13'#9'Tx Embarque'#9'F'
            'VLRDESEMBARQUE'#9'13'#9'Tx Desembarque'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          Color = clInfoBk
          DataSource = dsTrecho
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgShowFooter]
          ParentFont = False
          ParentShowHint = False
          ReadOnly = True
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
          IndicatorColor = icBlack
          OnUpdateFooter = dbgrdTrechoUpdateFooter
        end
      end
      object tsAcerto: TTabSheet
        Caption = ' Acerto de Contas '
        ImageIndex = 2
        object GroupBox6: TGroupBox
          Left = 3
          Top = 0
          Width = 299
          Height = 67
          Caption = ' Valores '
          TabOrder = 0
          object Label14: TLabel
            Left = 10
            Top = 20
            Width = 70
            Height = 13
            Caption = 'Alimentação'
          end
          object Label15: TLabel
            Left = 157
            Top = 19
            Width = 97
            Height = 13
            Caption = 'Outras Despesas'
          end
          object dbedAliment: TDBRealEdit
            Left = 10
            Top = 35
            Width = 133
            Height = 21
            TabStop = False
            Alignment = taRightJustify
            Color = clInfoBk
            Lines.Strings = (
              '0,00')
            ReadOnly = True
            TabOrder = 0
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'VALALIMENT'
            DataSource = dsDestacamento
          end
          object dbedOutras: TDBRealEdit
            Left = 157
            Top = 34
            Width = 133
            Height = 21
            TabStop = False
            Alignment = taRightJustify
            Color = clInfoBk
            Lines.Strings = (
              '250,00')
            ReadOnly = True
            TabOrder = 1
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'VALOUTROS'
            DataSource = dsDestacamento
          end
        end
        object dbrgTipoAcerto: TDBRadioGroup
          Left = 3
          Top = 68
          Width = 299
          Height = 99
          Caption = 'Tipo de Acerto'
          Columns = 2
          DataField = 'INDACERTO'
          DataSource = dsDestacamento
          Items.Strings = (
            'A Devolver'
            'A Reembolsar'
            'Liquidado')
          ReadOnly = True
          TabOrder = 1
          Values.Strings = (
            '1'
            '0'
            '2')
        end
        object GroupBox5: TGroupBox
          Left = 307
          Top = 0
          Width = 518
          Height = 167
          Anchors = [akLeft, akTop, akRight, akBottom]
          Caption = ' Justificativa '
          TabOrder = 2
          object dbedJustificativa: TDBMemo
            Left = 9
            Top = 16
            Width = 497
            Height = 140
            Color = clInfoBk
            DataField = 'JUSTIFICATIVA'
            DataSource = dsDestacamento
            TabOrder = 0
          end
        end
      end
      object TabSheet1: TTabSheet
        Caption = 'Detalhes'
        ImageIndex = 3
        object gbxCAP: TGroupBox
          Left = 0
          Top = 0
          Width = 829
          Height = 172
          Align = alClient
          TabOrder = 0
          object Shape17: TShape
            Left = 547
            Top = 131
            Width = 95
            Height = 19
            Brush.Color = clBtnFace
          end
          object Shape14: TShape
            Left = 641
            Top = 113
            Width = 95
            Height = 19
          end
          object Shape16: TShape
            Left = 641
            Top = 78
            Width = 95
            Height = 18
            Brush.Color = clBtnFace
          end
          object Shape15: TShape
            Left = 641
            Top = 95
            Width = 95
            Height = 19
          end
          object Shape1: TShape
            Left = 8
            Top = 32
            Width = 136
            Height = 19
            Brush.Color = clBtnFace
          end
          object Shape2: TShape
            Left = 8
            Top = 50
            Width = 136
            Height = 19
            Brush.Color = clBtnFace
          end
          object Shape4: TShape
            Left = 143
            Top = 14
            Width = 84
            Height = 19
            Brush.Color = clBtnFace
          end
          object Shape5: TShape
            Left = 226
            Top = 14
            Width = 168
            Height = 19
            Brush.Color = clBtnFace
          end
          object Shape6: TShape
            Left = 393
            Top = 14
            Width = 84
            Height = 19
            Brush.Color = clBtnFace
          end
          object Label5: TLabel
            Left = 12
            Top = 35
            Width = 102
            Height = 13
            Caption = 'DESTACAMENTO'
          end
          object Label6: TLabel
            Left = 13
            Top = 53
            Width = 126
            Height = 13
            Caption = 'ACERTO DE CONTAS'
          end
          object Label8: TLabel
            Left = 147
            Top = 17
            Width = 27
            Height = 13
            Caption = 'RAD'
          end
          object Label9: TLabel
            Left = 231
            Top = 17
            Width = 50
            Height = 13
            Caption = 'STATUS'
          end
          object Label12: TLabel
            Left = 397
            Top = 17
            Width = 76
            Height = 13
            Caption = 'FINANCEIRO'
          end
          object Shape3: TShape
            Left = 143
            Top = 32
            Width = 84
            Height = 19
          end
          object Shape7: TShape
            Left = 226
            Top = 32
            Width = 168
            Height = 19
          end
          object Shape8: TShape
            Left = 393
            Top = 32
            Width = 84
            Height = 19
          end
          object Shape9: TShape
            Left = 143
            Top = 50
            Width = 84
            Height = 19
          end
          object Shape10: TShape
            Left = 226
            Top = 50
            Width = 168
            Height = 19
          end
          object Shape11: TShape
            Left = 393
            Top = 50
            Width = 84
            Height = 19
          end
          object lblStatusDestacamento: TLabel
            Left = 230
            Top = 35
            Width = 161
            Height = 13
            AutoSize = False
            Transparent = True
          end
          object lblStatusAcerto: TLabel
            Left = 230
            Top = 53
            Width = 161
            Height = 13
            AutoSize = False
            Transparent = True
          end
          object Shape12: TShape
            Left = 547
            Top = 95
            Width = 95
            Height = 19
            Brush.Color = clBtnFace
          end
          object Label25: TLabel
            Left = 551
            Top = 98
            Width = 51
            Height = 13
            Caption = 'DIÁRIAS'
          end
          object Shape13: TShape
            Left = 547
            Top = 113
            Width = 95
            Height = 19
            Brush.Color = clBtnFace
          end
          object Label26: TLabel
            Left = 551
            Top = 116
            Width = 60
            Height = 13
            Caption = 'TRECHOS'
          end
          object Label29: TLabel
            Left = 645
            Top = 81
            Width = 88
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'T O T A L'
          end
          object Label30: TLabel
            Left = 551
            Top = 134
            Width = 51
            Height = 13
            Caption = 'ACERTO'
          end
          object Shape18: TShape
            Left = 641
            Top = 131
            Width = 95
            Height = 19
          end
          object DBText1: TDBText
            Left = 146
            Top = 35
            Width = 78
            Height = 13
            Alignment = taCenter
            DataField = 'IDPROCESSO'
            DataSource = dsDestacamento
            Transparent = True
          end
          object DBText2: TDBText
            Left = 146
            Top = 53
            Width = 78
            Height = 14
            Alignment = taCenter
            DataField = 'IDPROCESSOACERTO'
            DataSource = dsDestacamento
            Transparent = True
          end
          object DBText3: TDBText
            Left = 395
            Top = 35
            Width = 79
            Height = 13
            Alignment = taCenter
            DataField = 'DOCDESTAC'
            DataSource = dsDestacamento
            Transparent = True
          end
          object DBText4: TDBText
            Left = 395
            Top = 53
            Width = 79
            Height = 14
            Alignment = taCenter
            DataField = 'DOCACERTO'
            DataSource = dsDestacamento
            Transparent = True
          end
          object Shape19: TShape
            Left = 641
            Top = 149
            Width = 95
            Height = 19
            Brush.Color = clOlive
          end
          object Shape20: TShape
            Left = 547
            Top = 149
            Width = 95
            Height = 19
            Brush.Color = clOlive
          end
          object lblTipoAcerto: TLabel
            Left = 550
            Top = 152
            Width = 79
            Height = 13
            Caption = 'A DEVOLVER'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
          end
          object Shape21: TShape
            Left = 476
            Top = 14
            Width = 260
            Height = 19
            Brush.Color = clBtnFace
          end
          object Shape22: TShape
            Left = 476
            Top = 32
            Width = 260
            Height = 19
          end
          object Shape23: TShape
            Left = 476
            Top = 50
            Width = 260
            Height = 19
          end
          object Label13: TLabel
            Left = 480
            Top = 17
            Width = 151
            Height = 13
            Caption = 'USUÁRIO RESPONSÁVEL'
          end
          object DBText5: TDBText
            Left = 480
            Top = 35
            Width = 250
            Height = 14
            DataField = 'USUARIODESTAC'
            DataSource = dsDestacamento
            Transparent = True
          end
          object DBText6: TDBText
            Left = 480
            Top = 53
            Width = 250
            Height = 14
            DataField = 'USUARIOACERTO'
            DataSource = dsDestacamento
            Transparent = True
          end
          object DBText7: TDBText
            Left = 644
            Top = 98
            Width = 90
            Height = 14
            Alignment = taRightJustify
            BiDiMode = bdLeftToRight
            DataField = 'VLRDIARIA'
            DataSource = dsTotCalendario
            ParentBiDiMode = False
            Transparent = True
          end
          object DBText8: TDBText
            Left = 643
            Top = 115
            Width = 90
            Height = 14
            Alignment = taRightJustify
            BiDiMode = bdLeftToRight
            DataField = 'TOTTRECHO'
            DataSource = dsTotTrecho
            ParentBiDiMode = False
            Transparent = True
          end
          object lblSaldo: TLabel
            Left = 644
            Top = 152
            Width = 89
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = '0,00'
            Transparent = True
          end
          object GroupBox2: TGroupBox
            Left = 16
            Top = 96
            Width = 305
            Height = 55
            Caption = 'Cobrança de Acerto de Contas'
            TabOrder = 0
            object Label16: TLabel
              Left = 23
              Top = 27
              Width = 134
              Height = 13
              Anchors = [akLeft, akBottom]
              Caption = 'Email encaminhado em:'
            end
            object CMDateTimePicker1: TCMDateTimePicker
              Left = 167
              Top = 23
              Width = 118
              Height = 21
              Hint = 'Mensagem cobrando o acerto de contas da viagem'
              Anchors = [akLeft, akBottom]
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              Color = clInfoBk
              ButtonStyle = cbsCustom
              DataField = 'DATAEMAILACERTO'
              DataSource = dsDestacamento
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
              Enabled = False
              ParentShowHint = False
              ShowHint = True
              ShowButton = False
              TabOrder = 0
            end
          end
          object edtTotalAcerto: TdxDBEdit
            Left = 643
            Top = 130
            Width = 91
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Style.BorderStyle = xbsNone
            TabOrder = 1
            TabStop = False
            Alignment = taRightJustify
            AutoSize = False
            DataField = 'VLRACERTO'
            DataSource = dsDestacamento
            ReadOnly = True
            Height = 21
            StoredValues = 65
          end
        end
      end
      object tbsDespViagem: TTabSheet
        Caption = 'Despesas da Viagem'
        ImageIndex = 4
        object dbgrdDesp: TwwDBGrid
          Left = 0
          Top = 0
          Width = 829
          Height = 172
          Selected.Strings = (
            'DATAREF'#9'15'#9'Data'#9'F'
            'DESCRICAO'#9'30'#9'Tipo de Despesa'#9'F'
            'VALOR'#9'10'#9'Valor'#9'F'
            'OBSCURTA'#9'40'#9'Observações / Explicações'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsDespesas
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit, dgShowFooter, dgFooter3DCells]
          TabOrder = 0
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = True
          UseTFields = False
          IndicatorColor = icBlack
          OnUpdateFooter = dbgrdDespUpdateFooter
          object wwIButton1: TwwIButton
            Left = 0
            Top = 0
            Width = 13
            Height = 22
            AllowAllUp = True
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 375
    Width = 839
    inherited tb97Fundo: TToolbar97
      Left = 584
      DockPos = 584
      inherited sep1: TToolbarSep97
        Left = 0
      end
      inherited bbtnSair: TBitBtn
        Left = 83
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 2
    Top = 374
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
        'TDBMemo'
        'Text'
        0))
  end
  object cdsDestacamento: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ReadOnly = True
    OnCalcFields = cdsDestacamentoCalcFields
    Left = 43
    Top = 326
    object cdsDestacamentoIDDESTACAMENTO: TFloatField
      FieldName = 'IDDESTACAMENTO'
    end
    object cdsDestacamentoIDPROCESSO: TFloatField
      FieldName = 'IDPROCESSO'
    end
    object cdsDestacamentoIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object cdsDestacamentoFLGFUNCIONARIO: TFloatField
      FieldName = 'FLGFUNCIONARIO'
    end
    object cdsDestacamentoDATAINI: TDateTimeField
      FieldName = 'DATAINI'
    end
    object cdsDestacamentoDATAFIM: TDateTimeField
      FieldName = 'DATAFIM'
    end
    object cdsDestacamentoOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      BlobType = ftMemo
      Size = 4000
    end
    object cdsDestacamentoVLRACERTO: TFloatField
      FieldName = 'VLRACERTO'
    end
    object cdsDestacamentoINDACERTO: TStringField
      FieldName = 'INDACERTO'
      FixedChar = True
      Size = 1
    end
    object cdsDestacamentoJUSTIFICATIVA: TMemoField
      FieldName = 'JUSTIFICATIVA'
      BlobType = ftMemo
      Size = 4000
    end
    object cdsDestacamentoTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
    end
    object cdsDestacamentoTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Size = 30
    end
    object cdsDestacamentoINDOBJETIVO: TFloatField
      FieldName = 'INDOBJETIVO'
    end
    object cdsDestacamentoFLGLANCAFOLHA: TFloatField
      FieldName = 'FLGLANCAFOLHA'
    end
    object cdsDestacamentoFLGGERAAP: TFloatField
      FieldName = 'FLGGERAAP'
    end
    object cdsDestacamentoVALALIMENT: TFloatField
      FieldName = 'VALALIMENT'
    end
    object cdsDestacamentoVALOUTROS: TFloatField
      FieldName = 'VALOUTROS'
    end
    object cdsDestacamentoDATAEMAILACERTO: TDateTimeField
      FieldName = 'DATAEMAILACERTO'
    end
    object cdsDestacamentoCODDOCACERTO: TFloatField
      FieldName = 'CODDOCACERTO'
    end
    object cdsDestacamentoCODDOCDESTAC: TFloatField
      FieldName = 'CODDOCDESTAC'
    end
    object cdsDestacamentoIDUSUARIOSISTEMA: TFloatField
      FieldName = 'IDUSUARIOSISTEMA'
    end
    object cdsDestacamentoIDPROCESSOACERTO: TFloatField
      FieldName = 'IDPROCESSOACERTO'
    end
    object cdsDestacamentoNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object cdsDestacamentoID_CARGO: TFloatField
      FieldName = 'ID_CARGO'
    end
    object cdsDestacamentoCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      FixedChar = True
      Size = 10
    end
    object cdsDestacamentoNM_CENTRO_CUSTO: TStringField
      FieldName = 'NM_CENTRO_CUSTO'
      FixedChar = True
      Size = 104
    end
    object cdsDestacamentoNM_CARGO: TStringField
      FieldName = 'NM_CARGO'
      FixedChar = True
      Size = 104
    end
    object cdsDestacamentoUSUARIODESTAC: TStringField
      FieldName = 'USUARIODESTAC'
      Size = 60
    end
    object cdsDestacamentoUSUARIOACERTO: TStringField
      FieldName = 'USUARIOACERTO'
      Size = 60
    end
    object cdsDestacamentoDOCDESTAC: TFloatField
      FieldName = 'DOCDESTAC'
    end
    object cdsDestacamentoDOCACERTO: TFloatField
      FieldName = 'DOCACERTO'
    end
  end
  object cdsCalendario: TCMClientDataSet
    Aggregates = <>
    IndexFieldNames = 'IDDESTACAMENTO'
    MasterFields = 'IDDESTACAMENTO'
    MasterSource = dsDestacamento
    PacketRecords = 0
    Params = <>
    ReadOnly = True
    Left = 160
    Top = 374
    object cdsCalendarioIDDESTACAMENTO: TFloatField
      FieldName = 'IDDESTACAMENTO'
    end
    object cdsCalendarioDATADESTACAMENTO: TDateTimeField
      FieldName = 'DATADESTACAMENTO'
    end
    object cdsCalendarioFLGDIARIA: TFloatField
      FieldName = 'FLGDIARIA'
    end
    object cdsCalendarioTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
    end
    object cdsCalendarioTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Size = 30
    end
    object cdsCalendarioVLRDIARIA: TFloatField
      FieldName = 'VLRDIARIA'
      DisplayFormat = '#,###,##0.00'
    end
    object cdsCalendarioVLRHOTEL: TFloatField
      FieldName = 'VLRHOTEL'
      DisplayFormat = '#,###,##0.00'
    end
    object cdsCalendarioVLRDESLOCAMENTO: TFloatField
      FieldName = 'VLRDESLOCAMENTO'
      DisplayFormat = '#,###,##0.00'
    end
    object cdsCalendarioPCDIARIA: TFloatField
      FieldName = 'PCDIARIA'
      DisplayFormat = '#,###,##0.0 %'
    end
    object cdsCalendarioPCHOTEL: TFloatField
      FieldName = 'PCHOTEL'
      DisplayFormat = '#,###,##0.0 %'
    end
    object cdsCalendarioPCDESLOCAMENTO: TFloatField
      FieldName = 'PCDESLOCAMENTO'
      DisplayFormat = '#,###,##0.0 %'
    end
    object cdsCalendarioQUEMPAGA: TStringField
      FieldName = 'QUEMPAGA'
      Size = 14
    end
  end
  object cdsTrecho: TCMClientDataSet
    Aggregates = <>
    IndexFieldNames = 'IDDESTACAMENTO'
    MasterFields = 'IDDESTACAMENTO'
    MasterSource = dsDestacamento
    PacketRecords = 0
    Params = <>
    ReadOnly = True
    Left = 255
    Top = 378
    object cdsTrechoIDDESTACAMENTO: TFloatField
      FieldName = 'IDDESTACAMENTO'
    end
    object cdsTrechoNUMSEQ: TFloatField
      FieldName = 'NUMSEQ'
    end
    object cdsTrechoIDCIDADES: TFloatField
      FieldName = 'IDCIDADES'
    end
    object cdsTrechoDATAINI: TDateTimeField
      FieldName = 'DATAINI'
    end
    object cdsTrechoINDTRANSPORTE: TFloatField
      FieldName = 'INDTRANSPORTE'
    end
    object cdsTrechoFLGTRANSPORTE: TFloatField
      FieldName = 'FLGTRANSPORTE'
    end
    object cdsTrechoVLRTRANSPORTE: TFloatField
      FieldName = 'VLRTRANSPORTE'
      DisplayFormat = '#,###,##0.00'
    end
    object cdsTrechoVLREMBARQUE: TFloatField
      FieldName = 'VLREMBARQUE'
      DisplayFormat = '#,###,##0.00'
    end
    object cdsTrechoVLRDESEMBARQUE: TFloatField
      FieldName = 'VLRDESEMBARQUE'
      DisplayFormat = '#,###,##0.00'
    end
    object cdsTrechoTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
    end
    object cdsTrechoTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Size = 30
    end
    object cdsTrechoTRANSPORTE: TStringField
      FieldName = 'TRANSPORTE'
      Size = 13
    end
    object cdsTrechoRESPTRANSPORTE: TStringField
      FieldName = 'RESPTRANSPORTE'
      Size = 9
    end
    object cdsTrechoNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
  end
  object qryDestacamento: TCMSqlParams
    SQL.Strings = (
      'select'
      '   dst.iddestacamento, dst.idprocesso, dst.idpessoa,'
      '   dst.flgfuncionario, dst.dataini, dst.datafim,'
      '   dst.observacao, dst.vlracerto, dst.indacerto,'
      '   dst.justificativa,'
      '   dst.trgdtinclusao, dst.trguserinclusao,'
      '   dst.indobjetivo, dst.flglancafolha, dst.flggeraap,'
      '   dst.valaliment, dst.valoutros, dst.dataemailacerto,'
      '   dst.coddocacerto, dst.coddocdestac,'
      '   dst.idusuariosistema, dst.idprocessoacerto,'
      '   psa.nome,'
      
        '   decode(fco.idfuncao,null,fco.idcargo,fco.idfuncao) as id_carg' +
        'o,'
      '   fco.codcentrocusto,'
      
        '   '#39'                                                            ' +
        '                                        '#39' as NM_CENTRO_CUSTO,'
      
        '   '#39'                                                            ' +
        '                                        '#39' as NM_CARGO,'
      '   P1.NOME as USUARIODESTAC, '
      '   P2.NOME as USUARIOACERTO, '
      '   D1.NODOCUMENTO as DOCDESTAC, '
      '   D2.NODOCUMENTO as DOCACERTO'
      ' from'
      '   destacamento dst,'
      '   pessoa psa,'
      
        '   funcionario fco, DOCUMENTO D1, DOCUMENTO D2, PESSOA P1, PESSO' +
        'A P2'
      ' where'
      '   dst.idpessoa = psa.idpessoa'
      '   and dst.idpessoa = fco.idpessoa'
      '   and DST.IDDESTACAMENTO = 1360'
      '   AND (D1.CODDOCUMENTO (+) = DST.CODDOCDESTAC) '
      '   AND (D2.CODDOCUMENTO (+) = DST.CODDOCACERTO) '
      '   AND (P1.IDPESSOA (+) = DST.IDUSUARIOSISTEMA) '
      '   AND (P2.IDPESSOA (+) = DST.IDUSUARIOACERTO) ')
    ClientDataSet = cdsDestacamento
    Left = 110
    Top = 326
  end
  object qryCalendario: TCMSqlParams
    SQL.Strings = (
      ' select '
      '  iddestacamento, datadestacamento, flgdiaria, trgdtinclusao,'
      '   trguserinclusao, vlrdiaria, vlrhotel, vlrdeslocamento, '
      '   pcdiaria, pchotel, pcdeslocamento,'
      
        '   DECODE(FLGDIARIA,1,'#39'Pela Empresa'#39',0,'#39'Pelo Destacado'#39') quempag' +
        'a'
      ' from '
      '   dstcalendario ')
    ClientDataSet = cdsCalendario
    Left = 132
    Top = 374
  end
  object qryTrecho: TCMSqlParams
    SQL.Strings = (
      ' select '
      '   trc.iddestacamento, trc.numseq, trc.idcidades, trc.dataini, '
      '   trc.indtransporte, trc.flgtransporte, trc.vlrtransporte, '
      '   trc.vlrembarque, trc.vlrdesembarque, trc.trgdtinclusao, '
      '   trc.trguserinclusao, '
      '   cid.nome,'
      
        '  DECODE(INDTRANSPORTE,1,'#39'Aéreo'#39',2,'#39'Rodoviário'#39',3,'#39'Carro Próprio' +
        #39',4,'#39'Carro Alugado'#39',5,'#39'Ferroviário'#39',6,'#39'Outros'#39',6) as transporte,'
      
        '  DECODE(FLGTRANSPORTE,0,'#39'Empresa'#39',1,'#39'Destacado'#39') as RespTranspo' +
        'rte'
      ' from '
      '   dsttrecho trc, '
      '   cidades cid '
      ' where '
      '   trc.idcidades = cid.idcidades '
      ' order by '
      '   trc.iddestacamento, '
      '   trc.numseq ')
    ClientDataSet = cdsTrecho
    Left = 226
    Top = 374
  end
  object dsDestacamento: TwwDataSource
    AutoEdit = False
    DataSet = cdsDestacamento
    Left = 95
    Top = 374
  end
  object dsCalendario: TwwDataSource
    AutoEdit = False
    DataSet = cdsCalendario
    Left = 188
    Top = 374
  end
  object dsTrecho: TwwDataSource
    AutoEdit = False
    DataSet = cdsTrecho
    Left = 283
    Top = 374
  end
  object cdsTotCalendario: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 773
    Top = 238
  end
  object cdsTotTrecho: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 773
    Top = 318
  end
  object dsTotTrecho: TwwDataSource
    DataSet = cdsTotTrecho
    Left = 773
    Top = 334
  end
  object dsTotCalendario: TwwDataSource
    DataSet = cdsTotCalendario
    Left = 773
    Top = 262
  end
  object CdsDespesas: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IDDESTACAMENTO'
        DataType = ftFloat
      end
      item
        Name = 'DATADESTACAMENTO'
        DataType = ftDateTime
      end
      item
        Name = 'FLGDIARIA'
        DataType = ftFloat
      end
      item
        Name = 'TRGDTINCLUSAO'
        DataType = ftDateTime
      end
      item
        Name = 'TRGUSERINCLUSAO'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'VLRDIARIA'
        DataType = ftFloat
      end
      item
        Name = 'VLRHOTEL'
        DataType = ftFloat
      end
      item
        Name = 'VLRDESLOCAMENTO'
        DataType = ftFloat
      end
      item
        Name = 'PCDIARIA'
        DataType = ftFloat
      end
      item
        Name = 'PCHOTEL'
        DataType = ftFloat
      end
      item
        Name = 'PCDESLOCAMENTO'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'DEFAULT_ORDER'
      end
      item
        Name = 'CHANGEINDEX'
      end>
    Params = <>
    StoreDefs = True
    Left = 517
    Top = 217
  end
  object dsDespesas: TwwDataSource
    AutoEdit = False
    DataSet = CdsDespesas
    Left = 595
    Top = 219
  end
end
