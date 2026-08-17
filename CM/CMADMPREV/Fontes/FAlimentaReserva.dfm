inherited frmAlimentaReserva: TfrmAlimentaReserva
  Left = 668
  Top = 0
  Caption = ' Alimentação de Reservas do Participante'
  ClientHeight = 686
  ClientWidth = 746
  FormStyle = fsNormal
  Visible = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 746
    Height = 647
    object pnlParticipante: TPanel
      Left = 1
      Top = 1
      Width = 744
      Height = 82
      Align = alTop
      BevelOuter = bvNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 744
        Height = 82
        Align = alClient
        BevelInner = bvLowered
        TabOrder = 0
        object lblParticip: TLabel
          Left = 11
          Top = 2
          Width = 69
          Height = 13
          Caption = 'Participante'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblPatro: TLabel
          Left = 11
          Top = 41
          Width = 80
          Height = 13
          Caption = 'Patrocinadora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 323
          Top = 3
          Width = 118
          Height = 13
          Caption = 'Plano Previdenciário'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblMatricula: TLabel
          Left = 323
          Top = 41
          Width = 55
          Height = 13
          Caption = 'Matrícula'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object wwdbcbPatrocinadora: TwwDBLookupCombo
          Left = 12
          Top = 56
          Width = 301
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'60'#9'Nome'#9'F'
            'DS_FLGATIVO'#9'10'#9'Posição'#9'F')
          LookupTable = qryPatro
          LookupField = 'CHAVE'
          TabOrder = 5
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = False
          OnChange = wwdbcbPatrocinadoraChange
        end
        object edNome: TEdit
          Left = 11
          Top = 17
          Width = 304
          Height = 21
          ReadOnly = True
          TabOrder = 0
        end
        object edPatro: TEdit
          Left = 11
          Top = 56
          Width = 304
          Height = 21
          ReadOnly = True
          TabOrder = 1
        end
        object edPlano: TEdit
          Left = 323
          Top = 18
          Width = 238
          Height = 21
          ReadOnly = True
          TabOrder = 2
        end
        object bbtnProcurar: TBitBtn
          Left = 579
          Top = 26
          Width = 88
          Height = 37
          Hint = 'Procurar participante'
          Caption = '&Procurar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          OnClick = bbtnProcurarClick
          Glyph.Data = {
            4E010000424D4E01000000000000760000002800000012000000120000000100
            040000000000D800000000000000000000001000000010000000000000000000
            BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
            DDDDDD000000DDDDDDDDDDDDDDDDDD000000D000000000000DD00D000000D0FF
            FFFFFFFF0D000D000000D0FFFFFFF0000800DD000000D0FFFFFF0877808DDD00
            0000D0FFFFF0877E880DDD000000D0FFFFF07777870DDD000000D0FFFFF07E77
            870DDD000000D0FFFFF08EE7880DDD000000D0FFFFFF087780DDDD000000D0FF
            FFFFF0000DDDDD000000D0FFFFFFFFFF0DDDDD000000D0FFFFFFF0000DDDDD00
            0000D0FFFFFFF070DDDDDD000000D0FFFFFFF00DDDDDDD000000DD00000000DD
            DDDDDD000000DDDDDDDDDDDDDDDDDD000000}
        end
        object edMatricula: TEdit
          Left = 323
          Top = 56
          Width = 238
          Height = 21
          ReadOnly = True
          TabOrder = 4
        end
      end
    end
    object pnlArvore: TPanel
      Left = 1
      Top = 83
      Width = 744
      Height = 563
      Align = alClient
      BevelOuter = bvLowered
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object lblDescricao: TLabel
        Left = 450
        Top = 155
        Width = 225
        Height = 13
        Caption = 'Esta Reserva não Pertence a este Participante.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Bevel1: TBevel
        Left = 1
        Top = 485
        Width = 733
        Height = 122
      end
      object pnlValores: TPanel
        Left = 378
        Top = 124
        Width = 356
        Height = 61
        BevelOuter = bvLowered
        Enabled = False
        TabOrder = 1
        object lblValores: TLabel
          Left = 1
          Top = 1
          Width = 292
          Height = 18
          Caption = 'Saldo Atual da Reserva (Conta Ativa) '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindow
          Font.Height = -16
          Font.Name = 'Bookman Old Style'
          Font.Style = [fsItalic]
          ParentFont = False
        end
        object Label12: TLabel
          Left = 5
          Top = 23
          Width = 86
          Height = 13
          Caption = 'Valor em Cotas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label14: TLabel
          Left = 239
          Top = 23
          Width = 80
          Height = 13
          Caption = 'Valor em Real'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblValMoeda: TLabel
          Left = 5
          Top = 38
          Width = 54
          Height = 13
          Caption = '0,000000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblOperacao: TLabel
          Left = 120
          Top = 38
          Width = 90
          Height = 13
          Caption = '( * 0,000000 ) ='
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblValReal: TLabel
          Left = 239
          Top = 38
          Width = 26
          Height = 13
          Caption = '0,00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object pnlValoresIndexados: TPanel
        Left = 378
        Top = 124
        Width = 356
        Height = 61
        BevelOuter = bvLowered
        Enabled = False
        TabOrder = 3
        object Label8: TLabel
          Left = 1
          Top = 1
          Width = 292
          Height = 18
          Caption = 'Saldo Atual da Reserva (Conta Ativa) '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindow
          Font.Height = -16
          Font.Name = 'Bookman Old Style'
          Font.Style = [fsItalic]
          ParentFont = False
        end
        object lblTitUltDataAtualiza: TLabel
          Left = 98
          Top = 26
          Width = 83
          Height = 13
          Caption = 'Atualizada Até'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblUltDataAtualiza: TLabel
          Left = 98
          Top = 38
          Width = 69
          Height = 13
          Caption = '00/00/0000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblValMoedaInd: TLabel
          Left = 5
          Top = 38
          Width = 26
          Height = 13
          Caption = '0,00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label9: TLabel
          Left = 5
          Top = 26
          Width = 80
          Height = 13
          Caption = 'Valor em Real'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblValMoedaIndHoje: TLabel
          Left = 203
          Top = 38
          Width = 26
          Height = 13
          Caption = '0,00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label16: TLabel
          Left = 203
          Top = 26
          Width = 123
          Height = 13
          Caption = 'Valor Atualizado Hoje'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object pnlConsultaEmOutraData: TPanel
        Left = 378
        Top = 190
        Width = 356
        Height = 159
        BevelOuter = bvLowered
        TabOrder = 5
        object Label10: TLabel
          Left = 105
          Top = 29
          Width = 111
          Height = 13
          Caption = 'Consultar Saldo Em'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label11: TLabel
          Left = 1
          Top = 1
          Width = 248
          Height = 18
          Caption = 'Consulta ao Histórico de Saldos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindow
          Font.Height = -16
          Font.Name = 'Bookman Old Style'
          Font.Style = [fsItalic]
          ParentFont = False
        end
        object Label13: TLabel
          Left = 5
          Top = 77
          Width = 80
          Height = 13
          Caption = 'Valor em Real'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblConsReal: TLabel
          Left = 5
          Top = 92
          Width = 26
          Height = 13
          Caption = '0,00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label17: TLabel
          Left = 98
          Top = 77
          Width = 87
          Height = 13
          Caption = 'Valor do Índice'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label19: TLabel
          Left = 203
          Top = 77
          Width = 87
          Height = 13
          Caption = 'Valor Em Cotas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblConsIndice: TLabel
          Left = 98
          Top = 92
          Width = 54
          Height = 13
          Caption = '0,000000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblConsCotas: TLabel
          Left = 203
          Top = 92
          Width = 54
          Height = 13
          Caption = '0,000000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblConsDataIndice: TLabel
          Left = 98
          Top = 108
          Width = 77
          Height = 13
          Caption = '(00/00/0000)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblMensagem: TLabel
          Left = 14
          Top = 132
          Width = 298
          Height = 13
          Alignment = taCenter
          Caption = 'Histórico de Movimentação Não Encontrado na Data Indicada.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object dtConsultaHist: TCMDateTimePicker
          Left = 111
          Top = 45
          Width = 100
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
          OnChange = dtConsultaHistChange
        end
      end
      object pnlOperacao: TPanel
        Left = 378
        Top = 190
        Width = 356
        Height = 292
        BevelOuter = bvLowered
        TabOrder = 0
        object lblTitDtCotacao: TLabel
          Left = 3
          Top = 62
          Width = 99
          Height = 13
          Caption = 'Utilizar Índice em'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblCotacao: TLabel
          Left = 1
          Top = 1
          Width = 328
          Height = 18
          Caption = 'Informações para Entrada/Saída Manual'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindow
          Font.Height = -16
          Font.Name = 'Bookman Old Style'
          Font.Style = [fsItalic]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 287
          Top = 26
          Width = 52
          Height = 13
          Caption = 'Mês Ref.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label7: TLabel
          Left = 3
          Top = 24
          Width = 56
          Height = 13
          Caption = 'Operação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel
          Left = 107
          Top = 24
          Width = 30
          Height = 13
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblTitIndiceOperacao: TLabel
          Left = 107
          Top = 62
          Width = 87
          Height = 13
          Caption = 'Valor do Índice'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblDtAlimenta: TLabel
          Left = 219
          Top = 62
          Width = 101
          Height = 13
          Caption = 'Data Alimentação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblContrib: TLabel
          Left = 3
          Top = 102
          Width = 76
          Height = 13
          Caption = 'Contribuição:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblObservacao: TLabel
          Left = 3
          Top = 142
          Width = 73
          Height = 13
          Caption = 'Observação:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dtCotacao: TCMDateTimePicker
          Left = 3
          Top = 75
          Width = 100
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
          OnChange = dtCotacaoChange
        end
        object reValorOperacao: TEditNum
          Left = 107
          Top = 39
          Width = 103
          Height = 21
          TabOrder = 1
          OnEnter = reValorOperacaoEnter
          OnExit = reValorOperacaoExit
          IntDigits = 12
          Signal = False
          DecDigits = 2
          Numeric = True
          Alignment = taRightJustify
        end
        object bbtnCancelar: TBitBtn
          Left = 276
          Top = 247
          Width = 76
          Height = 27
          Cancel = True
          Caption = '&Cancelar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          OnClick = bbtnCancelarClick
          Glyph.Data = {
            BE060000424DBE06000000000000360400002800000024000000120000000100
            0800000000008802000000000000000000000001000000010000000000000000
            80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
            A600000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00030303030303
            0303030303030303030303030303030303030303030303030303030303030303
            0303F8F80303030303030303030303030303030303FF03030303030303030303
            0303030303F90101F80303030303F9F80303030303030303F8F8FF0303030303
            03FF03030303030303F9010101F8030303F90101F8030303030303F8FF03F8FF
            030303FFF8F8FF030303030303F901010101F803F901010101F80303030303F8
            FF0303F8FF03FFF80303F8FF030303030303F901010101F80101010101F80303
            030303F8FF030303F8FFF803030303F8FF030303030303F90101010101010101
            F803030303030303F8FF030303F803030303FFF80303030303030303F9010101
            010101F8030303030303030303F8FF030303030303FFF8030303030303030303
            030101010101F80303030303030303030303F8FF0303030303F8030303030303
            0303030303F901010101F8030303030303030303030303F8FF030303F8030303
            0303030303030303F90101010101F8030303030303030303030303F803030303
            F8FF030303030303030303F9010101F8010101F803030303030303030303F803
            03030303F8FF0303030303030303F9010101F803F9010101F803030303030303
            03F8030303F8FF0303F8FF03030303030303F90101F8030303F9010101F80303
            03030303F8FF0303F803F8FF0303F8FF03030303030303F9010303030303F901
            0101030303030303F8FFFFF8030303F8FF0303F8FF0303030303030303030303
            030303F901F903030303030303F8F80303030303F8FFFFFFF803030303030303
            03030303030303030303030303030303030303030303030303F8F8F803030303
            0303030303030303030303030303030303030303030303030303030303030303
            0303}
          NumGlyphs = 2
          Spacing = 0
        end
        object bbtnOk: TBitBtn
          Left = 276
          Top = 218
          Width = 76
          Height = 27
          Caption = '&OK'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
          OnClick = bbtnOkClick
          Glyph.Data = {
            BE060000424DBE06000000000000360400002800000024000000120000000100
            0800000000008802000000000000000000000001000000010000000000000000
            80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
            A600000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00030303030303
            0303030303030303030303030303030303030303030303030303030303030303
            03030303030303030303030303030303030303030303FF030303030303030303
            03030303030303040403030303030303030303030303030303F8F8FF03030303
            03030303030303030303040202040303030303030303030303030303F80303F8
            FF030303030303030303030303040202020204030303030303030303030303F8
            03030303F8FF0303030303030303030304020202020202040303030303030303
            0303F8030303030303F8FF030303030303030304020202FA0202020204030303
            0303030303F8FF0303F8FF030303F8FF03030303030303020202FA03FA020202
            040303030303030303F8FF03F803F8FF0303F8FF03030303030303FA02FA0303
            03FA0202020403030303030303F8FFF8030303F8FF0303F8FF03030303030303
            FA0303030303FA0202020403030303030303F80303030303F8FF0303F8FF0303
            0303030303030303030303FA0202020403030303030303030303030303F8FF03
            03F8FF03030303030303030303030303FA020202040303030303030303030303
            0303F8FF0303F8FF03030303030303030303030303FA02020204030303030303
            03030303030303F8FF0303F8FF03030303030303030303030303FA0202020403
            030303030303030303030303F8FF0303F8FF03030303030303030303030303FA
            0202040303030303030303030303030303F8FF03F8FF03030303030303030303
            03030303FA0202030303030303030303030303030303F8FFF803030303030303
            030303030303030303FA0303030303030303030303030303030303F803030303
            0303030303030303030303030303030303030303030303030303030303030303
            0303}
          NumGlyphs = 2
          Spacing = 0
        end
        object cmbOperacao: TComboBox
          Left = 3
          Top = 39
          Width = 100
          Height = 19
          Style = csOwnerDrawFixed
          ItemHeight = 13
          TabOrder = 4
          OnChange = cmbOperacaoChange
          Items.Strings = (
            'Adicionar'
            'Retirar')
        end
        object cmbTipo: TComboBox
          Left = 212
          Top = 39
          Width = 73
          Height = 19
          Style = csOwnerDrawFixed
          ItemHeight = 13
          TabOrder = 5
          OnChange = cmbTipoChange
          Items.Strings = (
            'Reais'
            'Cotas')
        end
        object edAnoMesRef: TMaskEdit
          Left = 287
          Top = 39
          Width = 65
          Height = 21
          EditMask = '!9999/99;1;_'
          MaxLength = 7
          TabOrder = 6
          Text = '    /  '
          OnExit = edAnoMesRefExit
        end
        object Panel3: TPanel
          Left = 3
          Top = 222
          Width = 266
          Height = 67
          BevelOuter = bvLowered
          TabOrder = 7
          object lblSaldoCotas: TLabel
            Left = 7
            Top = 4
            Width = 121
            Height = 13
            Caption = 'Saldo Atual (cotas) : '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblDescOperacao: TLabel
            Left = 7
            Top = 19
            Width = 149
            Height = 13
            Caption = 'Valor a Adicionar (cotas) :'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblNovoSaldo: TLabel
            Left = 7
            Top = 34
            Width = 119
            Height = 13
            Caption = 'Novo Saldo (Cotas) :'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblNovoSaldoReal: TLabel
            Left = 8
            Top = 49
            Width = 109
            Height = 13
            Caption = 'Novo Saldo (Real):'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
        object edIndiceOperacao: TEditNum
          Left = 107
          Top = 75
          Width = 103
          Height = 21
          Color = clMenu
          ReadOnly = True
          TabOrder = 8
          OnEnter = reValorOperacaoEnter
          OnExit = reValorOperacaoExit
          IntDigits = 12
          Signal = False
          DecDigits = 8
          Numeric = True
          Alignment = taRightJustify
        end
        object dDtAlimentacao: TCMDateTimePicker
          Left = 218
          Top = 75
          Width = 100
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
          TabOrder = 9
          UnboundDataType = wwDTEdtDate
          OnChange = dtCotacaoChange
        end
        object cmbContrib: TComboBox
          Left = 4
          Top = 120
          Width = 347
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 10
        end
        object mmoObs: TMemo
          Left = 4
          Top = 159
          Width = 346
          Height = 57
          Lines.Strings = (
            'mmoObs')
          MaxLength = 500
          TabOrder = 11
        end
      end
      object cmtvTipoReserva: TCMTreeView
        Left = 7
        Top = 7
        Width = 361
        Height = 474
        PodeNavegar = True
        DataSource = ds
        CampoChave = qryReservaXPlanoCODHIERARQUIA
        CampoDescricao = qryReservaXPlanoNOME
        CampoTipo = qryReservaXPlanoANALITICOSINTETI
        OnChange = cmtvTipoReservaChange
      end
      object pnlComum: TPanel
        Left = 378
        Top = 1
        Width = 356
        Height = 118
        BevelOuter = bvLowered
        Enabled = False
        TabOrder = 2
        object Label1: TLabel
          Left = 3
          Top = 20
          Width = 40
          Height = 13
          Caption = 'Código'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label5: TLabel
          Left = 89
          Top = 20
          Width = 48
          Height = 13
          Caption = 'Reserva'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblMoeSigla: TLabel
          Left = 5
          Top = 79
          Width = 205
          Height = 13
          Caption = 'Índice de Valorização da Reserva : '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 1
          Top = 1
          Width = 225
          Height = 18
          Caption = 'Tipo de Reserva Selecionado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindow
          Font.Height = -16
          Font.Name = 'Bookman Old Style'
          Font.Style = [fsItalic]
          ParentFont = False
        end
        object lblValorIndice: TLabel
          Left = 5
          Top = 99
          Width = 128
          Height = 13
          Caption = 'Valor Atual do Índice :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblModoAtualiza: TLabel
          Left = 5
          Top = 58
          Width = 132
          Height = 13
          Caption = 'Modo de Atualização : '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedModoAtualiza: TDBText
          Left = 135
          Top = 58
          Width = 208
          Height = 17
          DataField = 'MODOATUALIZACAO'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object meCodHierarquia: TMaskEdit
          Left = 3
          Top = 33
          Width = 85
          Height = 21
          Color = clMenu
          TabOrder = 0
        end
        object dbedReserva: TDBEdit
          Left = 89
          Top = 32
          Width = 251
          Height = 21
          Color = clMenu
          DataField = 'NOME'
          DataSource = ds
          TabOrder = 1
        end
        object dbedMoeda: TwwDBEdit
          Left = 343
          Top = 4
          Width = 121
          Height = 21
          DataField = 'MOESIGLA'
          DataSource = ds
          TabOrder = 2
          UnboundDataType = wwDefault
          Visible = False
          WantReturns = False
          WordWrap = False
        end
      end
      object GroupBox2: TGroupBox
        Left = 7
        Top = 488
        Width = 362
        Height = 114
        Caption = 'Importar Arquivo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 6
        object LblImporta: TLabel
          Left = 14
          Top = 25
          Width = 108
          Height = 13
          Caption = 'Selecionar Arquivo'
        end
        object btnImporta: TToolbarButton97
          Left = 330
          Top = 39
          Width = 24
          Height = 25
          AllowAllUp = True
          GroupIndex = 1
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            33333333333333333333333333333333333333333333333333FF333333333333
            3000333333FFFFF3F77733333000003000B033333777773777F733330BFBFB00
            E00033337FFF3377F7773333000FBFB0E000333377733337F7773330FBFBFBF0
            E00033F7FFFF3337F7773000000FBFB0E000377777733337F7770BFBFBFBFBF0
            E00073FFFFFFFF37F777300000000FB0E000377777777337F7773333330BFB00
            000033333373FF77777733333330003333333333333777333333333333333333
            3333333333333333333333333333333333333333333333333333333333333333
            3333333333333333333333333333333333333333333333333333}
          ImageIndex = 3
          Layout = blGlyphTop
          NumGlyphs = 2
          Opaque = False
          Spacing = 0
          OnClick = btnImportaClick
        end
        object Label22: TLabel
          Left = 14
          Top = 62
          Width = 58
          Height = 13
          Caption = 'Descrição'
        end
        object BBtnImporta: TSpeedButton
          Left = 299
          Top = 69
          Width = 55
          Height = 38
          Caption = 'Importar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = BBtnImportaClick
        end
        object SpeedButton1: TSpeedButton
          Left = 304
          Top = 10
          Width = 50
          Height = 25
          Caption = 'Modelo'
          OnClick = SpeedButton1Click
        end
        object edtImporta: TEdit
          Left = 13
          Top = 41
          Width = 313
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 4
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
        object EdtDescricaoImportacao: TEdit
          Left = 13
          Top = 77
          Width = 281
          Height = 21
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 200
          ParentFont = False
          TabOrder = 1
        end
      end
      object GBExcluirImportacao: TGroupBox
        Left = 378
        Top = 488
        Width = 351
        Height = 114
        Caption = 'Excluir Importação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 7
        object btnExcluirArquivo: TSpeedButton
          Left = 234
          Top = 23
          Width = 46
          Height = 20
          Caption = 'Excluir'
          OnClick = btnExcluirArquivoClick
        end
        object btnPesquisarExcluirArq: TSpeedButton
          Left = 313
          Top = 51
          Width = 23
          Height = 22
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000130B0000130B00001000000000000000000000000000
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
          OnClick = btnPesquisarExcluirArqClick
        end
        object DBNavigator1: TDBNavigator
          Left = 73
          Top = 23
          Width = 160
          Height = 20
          DataSource = DscExcluirArquivo
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
          TabOrder = 3
          OnClick = DBNavigator1Click
        end
        object EdtUsuario: TEdit
          Left = 12
          Top = 78
          Width = 194
          Height = 21
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
        object EdtData: TEdit
          Left = 216
          Top = 78
          Width = 121
          Height = 21
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
        end
        object MemoDescricao: TMemo
          Left = 12
          Top = 51
          Width = 298
          Height = 22
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnChange = MemoDescricaoChange
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 647
    Width = 746
    inherited tb97Fundo: TToolbar97
      Left = 520
      DockPos = 520
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 971
    TargetsData = (
      1
      4
      (
        'TMemo'
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
        ''
        'Title'
        0))
  end
  object ds: TwwDataSource
    AutoEdit = False
    DataSet = qryReservaXPlano
    Left = 25
    Top = 354
  end
  object qryReservaXPlano: TwwQuery
    AfterScroll = qryReservaXPlanoAfterScroll
    DatabaseName = 'BaseDados'
    Constrained = True
    SQL.Strings = (
      'SELECT R.CODHIERARQUIA, R.ANALITICOSINTETI,   R.NOME,'
      '       R.FLGCONTROLE,   R.IDTIPORESERVA,      R.INDICEREAJUSTE,'
      
        '       R.IDPLANOPREV,   R.FLGCOLETIVA,        R.FLGMODATUALIZACA' +
        'O,'
      '       R.INDICECORRECAO,'
      
        '       DECODE(R.FLGMODATUALIZACAO, 1, R.INDICECORRECAO, R.INDICE' +
        'REAJUSTE) AS MOECODIGO,'
      
        '       DECODE(R.FLGMODATUALIZACAO, 1, MINDICE.MOESIGLA, MCOTAS.M' +
        'OESIGLA)  AS MOESIGLA,'
      
        '       DECODE(R.FLGMODATUALIZACAO, 1, '#39'Reserva em Valor Monetári' +
        'o (Índice)'#39','
      
        '                                      '#39'Reserva em Cotas'#39') AS MOD' +
        'OATUALIZACAO,'
      '                                      R.FLGDEFICIT'
      'FROM   RESERVAXPLANO R, MOEDA MCOTAS, MOEDA MINDICE'
      'WHERE  R.INDICEREAJUSTE = MCOTAS.MOECODIGO(+)'
      'AND    R.INDICECORRECAO = MINDICE.MOECODIGO(+)'
      'AND    R.FLGCOLETIVA = 0'
      '            '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 96
    Top = 354
    object qryReservaXPlanoIDTIPORESERVA: TFloatField
      FieldName = 'IDTIPORESERVA'
      Origin = 'RESERVAXPLANO.IDTIPORESERVA'
    end
    object qryReservaXPlanoINDICEREAJUSTE: TFloatField
      FieldName = 'INDICEREAJUSTE'
      Origin = 'RESERVAXPLANO.INDICEREAJUSTE'
    end
    object qryReservaXPlanoNOME: TStringField
      FieldName = 'NOME'
      Origin = 'RESERVAXPLANO.NOME'
      Size = 50
    end
    object qryReservaXPlanoANALITICOSINTETI: TStringField
      FieldName = 'ANALITICOSINTETI'
      Origin = 'RESERVAXPLANO.ANALITICOSINTETI'
      Size = 1
    end
    object qryReservaXPlanoCODHIERARQUIA: TStringField
      FieldName = 'CODHIERARQUIA'
      Origin = 'RESERVAXPLANO.CODHIERARQUIA'
      Size = 8
    end
    object qryReservaXPlanoMOESIGLA: TStringField
      FieldName = 'MOESIGLA'
      Size = 10
    end
    object qryReservaXPlanoFLGCONTROLE: TFloatField
      FieldName = 'FLGCONTROLE'
    end
    object qryReservaXPlanoFLGCOLETIVA: TFloatField
      FieldName = 'FLGCOLETIVA'
    end
    object qryReservaXPlanoIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object qryReservaXPlanoMODOATUALIZACAO: TStringField
      FieldName = 'MODOATUALIZACAO'
      Size = 35
    end
    object qryReservaXPlanoFLGMODATUALIZACAO: TFloatField
      FieldName = 'FLGMODATUALIZACAO'
    end
    object qryReservaXPlanoINDICECORRECAO: TFloatField
      FieldName = 'INDICECORRECAO'
    end
    object qryReservaXPlanoMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
    end
    object qryReservaXPlanoFLGDEFICIT: TFloatField
      FieldName = 'FLGDEFICIT'
    end
  end
  object qryReservaPart: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM RESERVAPART'
      'WHERE IDPLANOPREV = :iIdPlanoPrev AND'
      '               IDPESSOA = :iIdPessoa AND'
      '               IDPESSJUR = :iIdPessJur AND'
      '               IDTIPORESERVA = :iIdTipoReserva')
    ValidateWithMask = True
    Left = 248
    Top = 354
    ParamData = <
      item
        DataType = ftInteger
        Name = 'iIdPlanoPrev'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'iIdPessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'iIdPessJur'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'iIdTipoReserva'
        ParamType = ptUnknown
      end>
  end
  object qryCotacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT COTDATA,COTVALOR'
      'FROM   COTACAOMOEDA'
      'WHERE  MOECODIGO = :iIdMoeda AND'
      '               COTDATA IN'
      '              (SELECT MAX(COTDATA) FROM COTACAOMOEDA'
      '               WHERE MOECODIGO = :iIdMoeda)')
    ValidateWithMask = True
    Left = 176
    Top = 354
    ParamData = <
      item
        DataType = ftInteger
        Name = 'iIdMoeda'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'iIdMoeda'
        ParamType = ptUnknown
      end>
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 315
    Top = 354
  end
  object MontaSelectPart: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Participante'
    Colunas.Strings = (
      'ELEGPATRO.MATRICULA'
      'PARTPREVPLAN.INSCRICAONUMERO'
      'PESSOA.NOME'
      'PLANPREV.NOME')
    TipodeDado.Strings = (
      'C'
      'N'
      'C'
      'C')
    Descricao.Strings = (
      'Matrícula'
      'Nº de Inscrição'
      'Participante'
      'Plano Previdenciário')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'ELEGPATRO'
      'PARTPREVPLAN'
      'PLANPREV')
    CamposChave.Strings = (
      'PARTPREVPLAN.IDPLANOPREV'
      'ELEGPATRO.IDPESSOA'
      'PARTPREVPLAN.SEQPROPOSTA'
      'ELEGPATRO.MATRICULA'
      'PESSOA.NOME'
      'PLANPREV.NOME')
    Filtro.Strings = (
      'PESSOA.IDPESSOA = ELEGPATRO.IDPESSOA'
      'ELEGPATRO.IDPESSOA = PARTPREVPLAN.IDPESSOA'
      'ELEGPATRO.IDPESSJUR = PARTPREVPLAN.IDPESSJUR'
      'PARTPREVPLAN.IDPLANOPREV = PLANPREV.IDPLANOPREV')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '13'
      '10'
      '60'
      '50')
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
    BeforeOpenCds = MontaSelectPartBeforeOpenCds
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
    Left = 32
    Top = 408
  end
  object MontaSelectPatro: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'P.NOME'
      'PL.NOME')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Patrocinadora'
      'Plano')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'PLANPREVPATRO  PP'
      'PESSOA P'
      'PLANPREV PL')
    CamposChave.Strings = (
      'P.NOME'
      'P.IDPESSOA'
      'PL.NOME'
      'PL.IDPLANOPREV')
    Filtro.Strings = (
      'PP.IDPESSJUR      = P.IDPESSOA '
      'PP.IDPLANOPREV = PL.IDPLANOPREV'
      'PL.IDPLANOPREV := pIdPlanoPrev')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '40'
      '40')
    OperComparador.Strings = (
      '-1'
      '-1')
    ApenasLetraENum.Strings = (
      'N'
      'N')
    ComparaMaiuscula.Strings = (
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
      '')
    LookupCampoChave.Strings = (
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      '')
    Left = 121
    Top = 408
  end
  object qryPatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT -1 AS CHAVE, 0 AS IDPESSJUR, '#39'TODAS'#39' AS NOME, -1 AS FLGAT' +
        'IVO, '#39'TODAS'#39' AS DS_FLGATIVO FROM DUAL'
      'UNION'
      'select DISTINCT'
      '       (IDPESSJUR + FLGATIVO) AS CHAVE,'
      '       RP.IDPESSJUR, P.NOME, NVL(RP.FLGATIVO, 0) AS FLGATIVO,'
      
        '       DECODE(RP.FLGATIVO, 1, '#39'ATIVO'#39', '#39'DESATIVADO'#39') AS DS_FLGAT' +
        'IVO'
      '  from RESERVAPART RP,'
      '       PESSOA P'
      ' where RP.IDPESSJUR = P.IDPESSOA AND'
      '       RP.IDPESSOA = :IDPESSOA AND'
      '       RP.IDPLANOPREV =:IDPLANOPREV AND'
      '       FLGATIVO is not null'
      ' ')
    ValidateWithMask = True
    Left = 217
    Top = 408
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end>
    object qryPatroNOME: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 60
      FieldName = 'NOME'
      Size = 60
    end
    object qryPatroDS_FLGATIVO: TStringField
      DisplayLabel = 'Posição'
      DisplayWidth = 10
      FieldName = 'DS_FLGATIVO'
      Size = 10
    end
    object qryPatroCHAVE: TFloatField
      DisplayWidth = 10
      FieldName = 'CHAVE'
      Visible = False
    end
    object qryPatroIDPESSJUR: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSJUR'
      Visible = False
    end
    object qryPatroFLGATIVO: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGATIVO'
      Visible = False
    end
  end
  object QryExcluirArquivo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'select ih.id, ih.idusuario, ih.data, ih.descricao, us.nomeusuari' +
        'o '
      
        'from cm.importacaohistmovreserva ih join cm.usuariosistema us on' +
        ' ih.idusuario = us.idusuario'
      
        'where ih.data >= to_date(to_char(sysdate - 10, '#39'DD/MM/YYYY'#39'), '#39'D' +
        'D/MM/YYYY'#39')'
      ''
      ''
      ''
      'order by ih.data, ih.descricao'
      '')
    ValidateWithMask = True
    Left = 298
    Top = 516
    object QryExcluirArquivoid: TFloatField
      FieldName = 'id'
    end
    object QryExcluirArquivoidusuario: TFloatField
      FieldName = 'idusuario'
    end
    object QryExcluirArquivonomeusuario: TStringField
      FieldName = 'nomeusuario'
    end
    object QryExcluirArquivodescricao: TMemoField
      FieldName = 'descricao'
      BlobType = ftMemo
    end
    object QryExcluirArquivodata: TDateTimeField
      FieldName = 'data'
    end
  end
  object DscExcluirArquivo: TwwDataSource
    DataSet = QryExcluirArquivo
    Left = 330
    Top = 516
  end
  object OpenDialog1: TOpenDialog
    Left = 265
    Top = 516
  end
  object QryImportacaoArquivo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    ValidateWithMask = True
    Left = 232
    Top = 516
  end
  object QryImpAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 203
    Top = 516
  end
end
