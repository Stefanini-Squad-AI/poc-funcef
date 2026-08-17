inherited frmCadRegOcorr: TfrmCadRegOcorr
  Left = 304
  Top = 0
  HelpContext = 750006
  Caption = 'Registro de Ocorrências, Testes e Exames'
  ClientHeight = 661
  ClientWidth = 848
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 848
    Height = 575
    BorderWidth = 2
    inherited pnlMestre: TPanel
      Left = 2
      Top = 2
      Width = 844
      Height = 55
      object Label1: TLabel
        Left = 10
        Top = 9
        Width = 55
        Height = 13
        Caption = 'Matrícula'
        FocusControl = dbedMatricula
      end
      object Label10: TLabel
        Left = 181
        Top = 9
        Width = 33
        Height = 13
        Caption = 'Nome'
        FocusControl = dbedMatricula
      end
      object dbedMatricula: TDBEdit
        Left = 73
        Top = 6
        Width = 104
        Height = 21
        TabStop = False
        Color = clGray
        DataField = 'MATRICULA'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object dbedNome: TDBEdit
        Left = 218
        Top = 6
        Width = 400
        Height = 21
        TabStop = False
        Color = clGray
        DataField = 'NOME'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object dbedSit: TDBEdit
        Left = 9
        Top = 30
        Width = 198
        Height = 21
        TabStop = False
        Color = clGray
        DataField = 'SITUACAO'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
      object dbedCargo: TDBEdit
        Left = 218
        Top = 30
        Width = 400
        Height = 21
        TabStop = False
        Color = clGray
        DataField = 'TITULO'
        DataSource = dsCargo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Left = 2
      Top = 57
      Width = 844
      Height = 516
      Tabs.Strings = (
        'Ocorrências'
        'Observações'
        'CAT')
      detdbGrids.Strings = (
        'dbgrdDet'
        ''
        'dbgrdCATDet')
      inherited pgctrlDetalhe: TPageControl
        Width = 746
        Height = 457
        OnChange = pgctrlDetalheChange
        inherited tbsDet: TTabSheet
          Caption = 'tbsDet'
          inherited dbgrdDet: TwwDBGrid [0]
            Width = 738
            Height = 429
            Selected.Strings = (
              'DESCRTIPOOCMED'#9'40'#9'Tipo de Ocorrência'
              'DATAREAL'#9'12'#9'Data Real'
              'DT_VALIDADE_ASO'#9'12'#9'Data Val. ASO'
              'LICENCA'#9'10'#9'Quant. Dias'
              'CODCID'#9'10'#9'Cód. CID'
              'DESCCID'#9'40'#9'CID')
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            UseTFields = False
          end
          inherited pnlControlesDet: TPanel [1]
            Top = 50
            Width = 749
            Height = 379
            Align = alNone
            object pngDados: TPageControl
              Left = 0
              Top = 0
              Width = 749
              Height = 379
              ActivePage = tbsDados
              Align = alClient
              TabOrder = 0
              object tbsDados: TTabSheet
                Caption = 'Dados'
                object Label2: TLabel
                  Left = 5
                  Top = 5
                  Width = 110
                  Height = 13
                  Caption = 'Tipo de Ocorrência'
                end
                object Label5: TLabel
                  Left = 581
                  Top = 101
                  Width = 57
                  Height = 13
                  Caption = 'Avaliação'
                end
                object lblLicenca: TLabel
                  Left = 580
                  Top = 141
                  Width = 46
                  Height = 13
                  Caption = 'Licença'
                end
                object Label9: TLabel
                  Left = 5
                  Top = 290
                  Width = 75
                  Height = 13
                  Caption = 'Observações'
                  FocusControl = dbmObser
                end
                object tb97Situacao: TToolbarButton97
                  Left = 645
                  Top = 114
                  Width = 84
                  Height = 24
                  GroupIndex = 1
                  Glyph.Data = {
                    76010000424D7601000000000000760000002800000020000000100000000100
                    04000000000000010000120B0000120B00001000000000000000000000000000
                    800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333CCCCC33
                    33333FFFF77777FFFFFFCCCCCC808CCCCCC3777777F7F777777F008888070888
                    8003777777777777777F0F0770F7F0770F0373F33337F333337370FFFFF7FFFF
                    F07337F33337F33337F370FFFB99FBFFF07337F33377F33337F330FFBF99BFBF
                    F033373F337733333733370BFBF7FBFB0733337F333FF3337F33370FBF98BFBF
                    0733337F3377FF337F333B0BFB990BFB03333373FF777FFF73333FB000B99000
                    B33333377737777733333BFBFBFB99FBF33333333FF377F333333FBF99BF99BF
                    B333333377F377F3333333FB99FB99FB3333333377FF77333333333FB9999FB3
                    333333333777733333333333FBFBFB3333333333333333333333}
                  HighlightWhenDown = False
                  ImageIndex = 9
                  Images = ImlPadrao
                  NoBorder = True
                  Opaque = False
                  Spacing = 0
                end
                object Label20: TLabel
                  Left = 244
                  Top = 4
                  Width = 79
                  Height = 13
                  Caption = 'Motivo Oficial'
                end
                object Label21: TLabel
                  Left = 5
                  Top = 51
                  Width = 166
                  Height = 13
                  Caption = 'Tipo de Acidente de Trânsito'
                end
                object Label22: TLabel
                  Left = 244
                  Top = 51
                  Width = 57
                  Height = 13
                  Caption = 'Data ASO'
                end
                object Label23: TLabel
                  Left = 355
                  Top = 51
                  Width = 73
                  Height = 13
                  Caption = 'Tipo de ASO'
                end
                object Label6: TLabel
                  Left = 639
                  Top = 162
                  Width = 24
                  Height = 13
                  Caption = 'dias'
                end
                object lblValidadeASO: TLabel
                  Left = 611
                  Top = 51
                  Width = 110
                  Height = 13
                  Caption = 'Data Validade ASO'
                end
                object lblMesesValidadeASO: TLabel
                  Left = 562
                  Top = 51
                  Width = 37
                  Height = 13
                  Caption = 'Meses'
                end
                object dbRgpMotAfastAnt: TDBRadioGroup
                  Left = 5
                  Top = 226
                  Width = 208
                  Height = 57
                  Caption = 'Mesmo Motivo do Afast. Anterior?'
                  DataField = 'FLGAFASTANTERIOR'
                  DataSource = dsDet
                  Items.Strings = (
                    'Sim'
                    'Não')
                  TabOrder = 12
                  TabStop = True
                  Values.Strings = (
                    'S'
                    'N')
                end
                object tbntbDatas: TNotebook
                  Left = 480
                  Top = 3
                  Width = 251
                  Height = 40
                  PageIndex = 1
                  TabOrder = 2
                  object TPage
                    Left = 0
                    Top = 0
                    Caption = 'Data1'
                    object Label3: TLabel
                      Left = 5
                      Top = 1
                      Width = 130
                      Height = 13
                      Caption = 'Data e Hora Planejada'
                    end
                    object Label4: TLabel
                      Left = 149
                      Top = 1
                      Width = 58
                      Height = 13
                      Caption = 'Data Real'
                    end
                    object dbedDatPlan: TCMDateTimePicker
                      Left = 5
                      Top = 16
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
                      DisplayFormat = 'dd/MM/yyyy'
                    end
                    object mskedHora: TMaskEdit
                      Left = 107
                      Top = 16
                      Width = 41
                      Height = 21
                      EditMask = '!90:00;1;_'
                      MaxLength = 5
                      TabOrder = 1
                      Text = '  :  '
                    end
                    object dbedDatReal: TCMDateTimePicker
                      Left = 149
                      Top = 16
                      Width = 100
                      Height = 21
                      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                      CalendarAttributes.Font.Color = clWindowText
                      CalendarAttributes.Font.Height = -11
                      CalendarAttributes.Font.Name = 'MS Sans Serif'
                      CalendarAttributes.Font.Style = []
                      ButtonStyle = cbsCustom
                      DataField = 'DATAREAL'
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
                      ShowButton = True
                      TabOrder = 2
                      DisplayFormat = 'dd/MM/yyyy'
                    end
                  end
                  object TPage
                    Left = 0
                    Top = 0
                    Caption = 'Data2'
                    object Label11: TLabel
                      Left = 4
                      Top = 1
                      Width = 65
                      Height = 13
                      Caption = 'Data Início'
                    end
                    object Label12: TLabel
                      Left = 132
                      Top = 1
                      Width = 77
                      Height = 13
                      Caption = 'Data Retorno'
                    end
                    object dbedDatInicio: TCMDateTimePicker
                      Left = 4
                      Top = 15
                      Width = 123
                      Height = 21
                      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                      CalendarAttributes.Font.Color = clWindowText
                      CalendarAttributes.Font.Height = -11
                      CalendarAttributes.Font.Name = 'MS Sans Serif'
                      CalendarAttributes.Font.Style = []
                      ButtonStyle = cbsCustom
                      DataField = 'DATAREAL'
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
                      ShowButton = True
                      TabOrder = 0
                      DisplayFormat = 'dd/MM/yyyy'
                      OnChange = dbedDatInicioChange
                    end
                    object dtedDataRetorno: TCMDateTimePicker
                      Left = 131
                      Top = 15
                      Width = 117
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
                      DisplayFormat = 'dd/MM/yyyy'
                    end
                  end
                end
                object dblckTipoEntr: TwwDBLookupCombo
                  Left = 5
                  Top = 19
                  Width = 235
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'DESCRTIPOOCMED'#9'40'#9'DESCRTIPOOCMED')
                  DataField = 'CODTIPOOCMED'
                  DataSource = dsDet
                  LookupTable = CdsTabOcorr
                  LookupField = 'CODTIPOOCMED'
                  Style = csDropDownList
                  TabOrder = 0
                  AutoDropDown = True
                  ShowButton = True
                  SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
                  AllowClearKey = True
                  OnChange = dblckTipoEntrChange
                end
                object gbxExaminador: TGroupBox
                  Left = 5
                  Top = 151
                  Width = 571
                  Height = 63
                  Caption = 'Examinador (Médico/Entidade)'
                  TabOrder = 11
                  object Label26: TLabel
                    Left = 5
                    Top = 17
                    Width = 142
                    Height = 13
                    Caption = 'Nº Inscrição (CRM/CRO)'
                  end
                  object dbedAvaliador: TDBEdit
                    Left = 152
                    Top = 31
                    Width = 353
                    Height = 21
                    TabStop = False
                    Color = clSilver
                    DataField = 'EXAMINADOR'
                    DataSource = dsDet
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                    ReadOnly = True
                    TabOrder = 1
                  end
                  object bbtnProcMedico: TBitBtn
                    Left = 506
                    Top = 28
                    Width = 25
                    Height = 24
                    ParentShowHint = False
                    ShowHint = True
                    TabOrder = 2
                    OnClick = bbtnProcMedicoClick
                    Glyph.Data = {
                      76010000424D7601000000000000760000002800000020000000100000000100
                      0400000000000001000000000000000000001000000000000000000000000000
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
                  object edtNroInscrCRMExaminador: TEdit
                    Left = 5
                    Top = 31
                    Width = 144
                    Height = 21
                    TabStop = False
                    Color = clSilver
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                    ReadOnly = True
                    TabOrder = 0
                  end
                  object btnLimpaExamOcorr: TBitBtn
                    Left = 535
                    Top = 30
                    Width = 25
                    Height = 22
                    TabOrder = 3
                    OnClick = btnLimpaExamOcorrClick
                    Glyph.Data = {
                      76010000424D7601000000000000760000002800000020000000100000000100
                      04000000000000010000120B0000120B00001000000000000000000000000000
                      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
                      555557777F777555F55500000000555055557777777755F75555005500055055
                      555577F5777F57555555005550055555555577FF577F5FF55555500550050055
                      5555577FF77577FF555555005050110555555577F757777FF555555505099910
                      555555FF75777777FF555005550999910555577F5F77777775F5500505509990
                      3055577F75F77777575F55005055090B030555775755777575755555555550B0
                      B03055555F555757575755550555550B0B335555755555757555555555555550
                      BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
                      50BB555555555555575F555555555555550B5555555555555575}
                    NumGlyphs = 2
                  end
                end
                object dbedAvaliacao: TDBRealEdit
                  Left = 581
                  Top = 116
                  Width = 59
                  Height = 21
                  Alignment = taRightJustify
                  Lines.Strings = (
                    '0')
                  TabOrder = 9
                  WordWrap = False
                  OnExit = dbedAvaliacaoExit
                  IntDigits = 10
                  DecDigits = 0
                  NumberFormat = fNumber
                  Signal = False
                  DataField = 'AVALIACAO'
                  DataSource = dsDet
                end
                object dbedLicenca: TDBRealEdit
                  Left = 580
                  Top = 156
                  Width = 59
                  Height = 21
                  Alignment = taRightJustify
                  Lines.Strings = (
                    '0')
                  TabOrder = 10
                  WordWrap = False
                  OnChange = dbedDatInicioChange
                  IntDigits = 10
                  DecDigits = 0
                  NumberFormat = fNumber
                  Signal = False
                  DataField = 'LICENCA'
                  DataSource = dsDet
                end
                object dbmObser: TDBMemo
                  Left = 5
                  Top = 304
                  Width = 571
                  Height = 51
                  DataField = 'OBSERVACAO'
                  DataSource = dsDet
                  ScrollBars = ssVertical
                  TabOrder = 14
                end
                object dblckMotivoOficial: TwwDBLookupCombo
                  Left = 244
                  Top = 18
                  Width = 235
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'DESCRICAO'#9'40'#9'DESCRICAO')
                  DataField = 'idmotivo'
                  DataSource = dsDet
                  LookupTable = CdsMotivo
                  LookupField = 'idmotivo'
                  Style = csDropDownList
                  DropDownWidth = 400
                  TabOrder = 1
                  AutoDropDown = True
                  ShowButton = True
                  SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
                  AllowClearKey = True
                  OnChange = dblckMotivoOficialChange
                end
                object dtDataAso: TCMDateTimePicker
                  Left = 244
                  Top = 65
                  Width = 108
                  Height = 21
                  CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                  CalendarAttributes.Font.Color = clWindowText
                  CalendarAttributes.Font.Height = -11
                  CalendarAttributes.Font.Name = 'MS Sans Serif'
                  CalendarAttributes.Font.Style = []
                  Color = clSilver
                  ButtonStyle = cbsCustom
                  DataField = 'DTASO'
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
                  Enabled = False
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  ShowButton = True
                  TabOrder = 4
                  DisplayFormat = 'dd/MM/yyyy'
                end
                object grpCID: TGroupBox
                  Left = 5
                  Top = 97
                  Width = 571
                  Height = 47
                  Caption = 'CID'
                  TabOrder = 8
                  object dbedCODCID: TDBEdit
                    Left = 5
                    Top = 17
                    Width = 92
                    Height = 21
                    TabStop = False
                    Color = clSilver
                    DataField = 'CODCID'
                    DataSource = dsDet
                    ReadOnly = True
                    TabOrder = 0
                    OnExit = dbedCODCIDExit
                  end
                  object edCID: TEdit
                    Left = 104
                    Top = 17
                    Width = 400
                    Height = 21
                    TabStop = False
                    Color = clSilver
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                    ReadOnly = True
                    TabOrder = 1
                  end
                  object bbtnBuscaCID: TBitBtn
                    Left = 508
                    Top = 14
                    Width = 25
                    Height = 24
                    ParentShowHint = False
                    ShowHint = True
                    TabOrder = 2
                    OnClick = bbtnBuscaCIDClick
                    Glyph.Data = {
                      76010000424D7601000000000000760000002800000020000000100000000100
                      0400000000000001000000000000000000001000000000000000000000000000
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
                  object btnLimpaCidOcorr: TBitBtn
                    Left = 537
                    Top = 16
                    Width = 25
                    Height = 22
                    TabOrder = 3
                    OnClick = btnLimpaCidOcorrClick
                    Glyph.Data = {
                      76010000424D7601000000000000760000002800000020000000100000000100
                      04000000000000010000120B0000120B00001000000000000000000000000000
                      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
                      555557777F777555F55500000000555055557777777755F75555005500055055
                      555577F5777F57555555005550055555555577FF577F5FF55555500550050055
                      5555577FF77577FF555555005050110555555577F757777FF555555505099910
                      555555FF75777777FF555005550999910555577F5F77777775F5500505509990
                      3055577F75F77777575F55005055090B030555775755777575755555555550B0
                      B03055555F555757575755550555550B0B335555755555757555555555555550
                      BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
                      50BB555555555555575F555555555555550B5555555555555575}
                    NumGlyphs = 2
                  end
                end
                object cbbTipoASO: TwwDBComboBox
                  Left = 357
                  Top = 65
                  Width = 200
                  Height = 21
                  ShowButton = True
                  Style = csDropDownList
                  MapList = True
                  AllowClearKey = True
                  Color = clSilver
                  DataField = 'TIPOASO'
                  DataSource = dsDet
                  DropDownCount = 8
                  DropDownWidth = 400
                  Enabled = False
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ItemHeight = 0
                  Items.Strings = (
                    'Exame médico admissional'#9'0'
                    'Exame médico periódico, conforme planejamento do PCMSO'#9'1'
                    'Exame médico de retorno ao trabalho'#9'2'
                    'Exame médico de mudança de função'#9'3'
                    
                      'Exame médico de monitoração pontual, não enquadrado nos demais c' +
                      'asos'#9'4'
                    'Exame médico demissional'#9'9')
                  ParentFont = False
                  Sorted = False
                  TabOrder = 5
                  UnboundDataType = wwDefault
                end
                object cbbTpAcidTransito: TwwDBComboBox
                  Left = 5
                  Top = 65
                  Width = 235
                  Height = 21
                  ShowButton = True
                  Style = csDropDownList
                  MapList = True
                  AllowClearKey = True
                  Color = clSilver
                  DataField = 'TIPOACIDTRANSITO'
                  DataSource = dsDet
                  DropDownCount = 8
                  ItemHeight = 0
                  Items.Strings = (
                    'Atropelamento'#9'1'
                    'Colisão'#9'2'
                    'Outros'#9'3')
                  Sorted = False
                  TabOrder = 3
                  UnboundDataType = wwDefault
                end
                object GroupBox1: TGroupBox
                  Left = 216
                  Top = 226
                  Width = 360
                  Height = 57
                  Caption = 'Retificação do Afastamento'
                  TabOrder = 13
                  object Label14: TLabel
                    Left = 8
                    Top = 15
                    Width = 127
                    Height = 13
                    Caption = 'Origem da Retificação'
                  end
                  object Label15: TLabel
                    Left = 166
                    Top = 15
                    Width = 118
                    Height = 13
                    Caption = 'Número do Processo'
                  end
                  object dbCmbOrigRetificacao: TwwDBComboBox
                    Left = 8
                    Top = 28
                    Width = 152
                    Height = 21
                    ShowButton = True
                    Style = csDropDownList
                    MapList = True
                    AllowClearKey = True
                    AutoSize = False
                    DataField = 'ORIGEMRET'
                    DataSource = dsDet
                    DropDownCount = 8
                    ItemHeight = 50
                    Items.Strings = (
                      'Por iniciativa do empregador'#9'1'
                      'Revisão Administrativa'#9'2'
                      'Determinação Judicial'#9'3')
                    Sorted = False
                    TabOrder = 0
                    UnboundDataType = wwDefault
                    OnExit = dbCmbOrigRetificacaoExit
                  end
                  object dbLkpProcessos: TwwDBLookupCombo
                    Left = 166
                    Top = 28
                    Width = 185
                    Height = 21
                    DropDownAlignment = taLeftJustify
                    Selected.Strings = (
                      'NUMERO'#9'30'#9'NUMERO')
                    DataField = 'IDPROCESSO'
                    DataSource = dsDet
                    LookupTable = cdsProcessos
                    LookupField = 'IDPROCESSO'
                    Style = csDropDownList
                    Color = clSilver
                    Enabled = False
                    TabOrder = 1
                    AutoDropDown = False
                    ShowButton = True
                    AllowClearKey = True
                  end
                end
                object dbDtValidadeASO: TCMDateTimePicker
                  Left = 611
                  Top = 65
                  Width = 111
                  Height = 21
                  CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                  CalendarAttributes.Font.Color = clWindowText
                  CalendarAttributes.Font.Height = -11
                  CalendarAttributes.Font.Name = 'MS Sans Serif'
                  CalendarAttributes.Font.Style = []
                  Color = clSilver
                  ButtonStyle = cbsCustom
                  DataField = 'DT_VALIDADE_ASO'
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
                  Enabled = False
                  ShowButton = True
                  TabOrder = 7
                  DisplayFormat = 'dd/MM/yyyy'
                  OnChange = dbDtValidadeASOChange
                  OnExit = dbDtValidadeASOExit
                end
                object edtMesesValidadeASO: TRealEdit
                  Left = 562
                  Top = 65
                  Width = 44
                  Height = 21
                  Alignment = taRightJustify
                  Color = clSilver
                  Enabled = False
                  Lines.Strings = (
                    '0')
                  TabOrder = 6
                  WordWrap = False
                  OnExit = edtMesesValidadeASOExit
                  IntDigits = 10
                  DecDigits = 0
                  NumberFormat = iNumber
                  Signal = False
                end
              end
              object tbsExames: TTabSheet
                Caption = 'Exames'
                ImageIndex = 1
                object dbgrdMonitora: TwwDBGrid
                  Left = 0
                  Top = 31
                  Width = 651
                  Height = 320
                  Selected.Strings = (
                    'DTEXAME'#9'12'#9'Data Exame'
                    'DESC_PROC_REDUZIDA'#9'40'#9'Procedimento Realizado'
                    'DESC_ORDEMEXAME'#9'20'#9'Ordem do Exame'
                    'DESC_INDICARESULTADO'#9'20'#9'Indicação do Resultado')
                  IniAttributes.Delimiter = ';;'
                  TitleColor = clBtnFace
                  FixedCols = 0
                  ShowHorzScrollBar = True
                  Align = alClient
                  DataSource = dsMonitora
                  Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
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
                  IndicatorColor = icBlack
                end
                object pnlMonitora: TPanel
                  Left = 8
                  Top = 47
                  Width = 651
                  Height = 303
                  TabOrder = 1
                  object Label71: TLabel
                    Left = 14
                    Top = 13
                    Width = 69
                    Height = 13
                    Caption = 'Data Exame'
                  end
                  object Label77: TLabel
                    Left = 14
                    Top = 64
                    Width = 96
                    Height = 13
                    Caption = 'Ordem do Exame'
                  end
                  object Label78: TLabel
                    Left = 219
                    Top = 65
                    Width = 136
                    Height = 13
                    Caption = 'Indicação do Resultado'
                  end
                  object lblProcRealizado: TLabel
                    Left = 136
                    Top = 13
                    Width = 138
                    Height = 13
                    Caption = 'Procedimento Realizado'
                  end
                  object dbdtDTEXAME: TCMDateTimePicker
                    Left = 14
                    Top = 27
                    Width = 115
                    Height = 21
                    CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                    CalendarAttributes.Font.Color = clWindowText
                    CalendarAttributes.Font.Height = -11
                    CalendarAttributes.Font.Name = 'MS Sans Serif'
                    CalendarAttributes.Font.Style = []
                    ButtonStyle = cbsCustom
                    DataField = 'DTEXAME'
                    DataSource = dsMonitora
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
                    DisplayFormat = 'dd/MM/yyyy'
                  end
                  object cbbOrdemEx: TwwDBComboBox
                    Left = 14
                    Top = 79
                    Width = 195
                    Height = 21
                    ShowButton = True
                    Style = csDropDownList
                    MapList = True
                    AllowClearKey = True
                    DataField = 'ORDEMEXAME'
                    DataSource = dsMonitora
                    DropDownCount = 8
                    ItemHeight = 0
                    Items.Strings = (
                      'Inicial'#9'1'
                      'Sequencial'#9'2')
                    Sorted = False
                    TabOrder = 2
                    UnboundDataType = wwDefault
                  end
                  object cbbIndicaResult: TwwDBComboBox
                    Left = 219
                    Top = 79
                    Width = 180
                    Height = 21
                    ShowButton = True
                    Style = csDropDownList
                    MapList = True
                    AllowClearKey = True
                    DataField = 'INDICARESULTADO'
                    DataSource = dsMonitora
                    DropDownCount = 8
                    ItemHeight = 0
                    Items.Strings = (
                      'Normal'#9'1'
                      'Alterado'#9'2'
                      'Estável'#9'3'
                      'Agravamento'#9'4')
                    Sorted = False
                    TabOrder = 3
                    UnboundDataType = wwDefault
                  end
                  object dbLkpProcRealizado: TwwDBLookupCombo
                    Left = 136
                    Top = 27
                    Width = 263
                    Height = 21
                    DropDownAlignment = taLeftJustify
                    Selected.Strings = (
                      'DESC_REDUZIDA'#9'40'#9'DESCRICAO')
                    DataField = 'ID_PROC_REALIZADO'
                    DataSource = dsMonitora
                    LookupTable = cdsProcRealizado
                    LookupField = 'ID_PROC_REALIZADO'
                    Style = csDropDownList
                    DropDownWidth = 400
                    TabOrder = 1
                    AutoDropDown = True
                    ShowButton = True
                    SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
                    AllowClearKey = True
                  end
                end
                object DockMonitora: TDock97
                  Left = 0
                  Top = 0
                  Width = 741
                  Height = 31
                  AllowDrag = False
                  BoundLines = [blTop, blBottom, blLeft, blRight]
                  object ToolbarMonitora: TToolbar97
                    Left = 0
                    Top = 0
                    Caption = 'tb97BotoesDetalhe'
                    DockPos = 0
                    TabOrder = 0
                    object toolbtnInserirMonitora: TToolbarButton97
                      Left = 0
                      Top = 0
                      Width = 25
                      Height = 25
                      Hint = 'Inserir'
                      AllowAllUp = True
                      GroupIndex = 2
                      ImageIndex = 0
                      Images = ImlPadrao
                      ParentShowHint = False
                      ShowHint = True
                      OnClick = toolbtnInserirMonitoraClick
                    end
                    object toolbtnAlterarMonitora: TToolbarButton97
                      Left = 25
                      Top = 0
                      Width = 25
                      Height = 25
                      Hint = 'Alterar'
                      AllowAllUp = True
                      GroupIndex = 2
                      ImageIndex = 1
                      Images = ImlPadrao
                      ParentShowHint = False
                      ShowHint = True
                      OnClick = toolbtnAlterarMonitoraClick
                    end
                    object toolbtnExcluirMonitora: TToolbarButton97
                      Left = 50
                      Top = 0
                      Width = 25
                      Height = 25
                      Hint = 'Excluir'
                      AllowAllUp = True
                      ImageIndex = 2
                      Images = ImlPadrao
                      ParentShowHint = False
                      ShowHint = True
                      OnClick = toolbtnExcluirMonitoraClick
                    end
                  end
                end
                object DockDetMonitora: TDock97
                  Left = 651
                  Top = 31
                  Width = 90
                  Height = 320
                  AllowDrag = False
                  BoundLines = [blLeft]
                  Position = dpRight
                  object Toolbar972: TToolbar97
                    Left = 0
                    Top = 0
                    Caption = 'tb97Detalhe'
                    DockPos = 0
                    TabOrder = 0
                    object btnDockMonitoraOK: TBitBtn
                      Left = 0
                      Top = 0
                      Width = 85
                      Height = 27
                      Caption = 'OK'
                      TabOrder = 0
                      OnClick = btnDockMonitoraOKClick
                      Glyph.Data = {
                        76010000424D7601000000000000760000002800000020000000100000000100
                        0400000000000001000000000000000000001000000000000000000000000000
                        8000008000000080800080000000800080008080000080808000C0C0C0000000
                        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                        8888888888FFFFF8888888888000008888888888F777778FF888888002222200
                        88888887788888778F88887222222222088888788888888878F887A228822222
                        208887F88FFF888887F887A2FFF8222220888788777FF888878F7A22FFFF8222
                        22087F887777FF88887F7A22FFFFF82222087F8877777FF8887F7A22FF8FFF82
                        22087F8877F777FF887F7A22FF82FFF822087F8877F8777F887F7A22FF222FF8
                        220878F87788877FF87887A2222222FF208887F88888887787F887A222222222
                        2088878F888888888788887AA222222208888878FF88888F788888877AAAAA77
                        8888888778FFFF77888888888777778888888888877777888888}
                      NumGlyphs = 2
                    end
                    object btnDockMonitoraCanc: TBitBtn
                      Left = 0
                      Top = 27
                      Width = 85
                      Height = 27
                      Cancel = True
                      Caption = 'Cancelar'
                      TabOrder = 1
                      OnClick = btnDockMonitoraCancClick
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
                      Spacing = -1
                    end
                    object btnDockMonitoraVoltar: TBitBtn
                      Left = 0
                      Top = 54
                      Width = 85
                      Height = 27
                      Cancel = True
                      Caption = '&Voltar'
                      TabOrder = 2
                      OnClick = btnDockMonitoraVoltarClick
                      Glyph.Data = {
                        76010000424D7601000000000000760000002800000020000000100000000100
                        0400000000000001000000000000000000001000000010000000000000000000
                        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                        33333FFFFFFFFFFFFFFF000000000000000077777777777777770FFFFFFFFFFF
                        FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
                        FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
                        FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
                        FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
                        FFF07FFFFFFFFFFFFFF70CCCCCCCCCCCCCC07777777777777777088CCCCCCCCC
                        C8807FF7777777777FF700000000000000007777777777777777333333333333
                        3333333333333333333333333333333333333333333333333333}
                      NumGlyphs = 2
                    end
                  end
                end
              end
            end
          end
        end
        object tbshObserv: TTabSheet
          Caption = 'tbshObserv'
          object dbmemFortes: TDBMemo
            Left = 0
            Top = 0
            Width = 738
            Height = 429
            Align = alClient
            DataField = 'OBSERVACAO'
            DataSource = dsDet
            ScrollBars = ssVertical
            TabOrder = 0
          end
        end
        object tbsCAT: TTabSheet
          Caption = 'tbsCAT'
          ImageIndex = 2
          object dbgrdCATDet: TwwDBGrid
            Left = 0
            Top = 0
            Width = 738
            Height = 429
            Selected.Strings = (
              'tiporegistr'#9'20'#9'Tipo Registrador'
              'NUMEROINSCR'#9'20'#9'CPF / CNPJ'
              'NUMEROCAT'#9'20'#9'Nº CAT'
              'tipoacid'#9'20'#9'Tipo de Acid.'
              'desctipocat'#9'20'#9'Tipo de CAT'
              'DTACIDENTE'#9'20'#9'Dt. Acid.'
              'catemitpor'#9'20'#9'Emitida por'
              'DescSitGerTrab'#9'20'#9'Situação Geradora do Acidente de Trabalho')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsCatPess
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
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
            IndicatorColor = icBlack
          end
          object pnlCATDet: TPanel
            Left = 0
            Top = 30
            Width = 744
            Height = 399
            Caption = 'pnlCATDet'
            TabOrder = 1
            object pgcCAT: TPageControl
              Left = 1
              Top = 1
              Width = 742
              Height = 397
              ActivePage = tbsCATGeral
              Align = alClient
              TabOrder = 0
              object tbsCATGeral: TTabSheet
                Caption = 'Geral'
                object grpDadosCAT: TGroupBox
                  Left = 10
                  Top = 5
                  Width = 625
                  Height = 356
                  Caption = 'Dados CAT'
                  TabOrder = 0
                  object Label34: TLabel
                    Left = 8
                    Top = 16
                    Width = 43
                    Height = 13
                    Caption = 'Nº CAT'
                  end
                  object Label35: TLabel
                    Left = 426
                    Top = 16
                    Width = 98
                    Height = 13
                    Caption = 'Tipo de Acidente'
                  end
                  object Label36: TLabel
                    Left = 202
                    Top = 16
                    Width = 72
                    Height = 13
                    Caption = 'Tipo de CAT'
                  end
                  object Label37: TLabel
                    Left = 202
                    Top = 54
                    Width = 142
                    Height = 13
                    Caption = 'Data e Hora do Acidente'
                  end
                  object Label38: TLabel
                    Left = 8
                    Top = 54
                    Width = 121
                    Height = 13
                    Caption = 'A CAT foi emitida por'
                  end
                  object Label39: TLabel
                    Left = 357
                    Top = 54
                    Width = 104
                    Height = 13
                    Caption = 'Horas Trab. Antes'
                  end
                  object Label41: TLabel
                    Left = 8
                    Top = 261
                    Width = 356
                    Height = 13
                    Caption = 'Situação Geradora do Acidente de Trabalho - Tabela 15 ou 16'
                  end
                  object Label16: TLabel
                    Left = 426
                    Top = 91
                    Width = 80
                    Height = 13
                    Caption = 'Data do Óbito'
                  end
                  object Label66: TLabel
                    Left = 8
                    Top = 175
                    Width = 228
                    Height = 13
                    Caption = 'Lateralidade da Parte do Corpo Atingida'
                  end
                  object Label64: TLabel
                    Left = 8
                    Top = 137
                    Width = 205
                    Height = 13
                    Caption = 'Parte do Corpo Atingida - Tabela 13'
                  end
                  object Label67: TLabel
                    Left = 8
                    Top = 218
                    Width = 311
                    Height = 13
                    Caption = 'Agente Causador do Acidente de Trabalho - Tabela 14'
                  end
                  object Label50: TLabel
                    Left = 8
                    Top = 312
                    Width = 104
                    Height = 13
                    Caption = 'Nº CAT de Origem'
                  end
                  object lblDtUltDiaTrab: TLabel
                    Left = 495
                    Top = 54
                    Width = 125
                    Height = 13
                    Caption = 'Último dia Trabalhado'
                  end
                  object dbedtNUMEROCAT: TDBEdit
                    Left = 8
                    Top = 30
                    Width = 190
                    Height = 21
                    DataField = 'NUMEROCAT'
                    DataSource = dsCatPess
                    MaxLength = 20
                    TabOrder = 0
                  end
                  object edtDtAcidente: TCMDateTimePicker
                    Left = 202
                    Top = 68
                    Width = 95
                    Height = 21
                    CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                    CalendarAttributes.Font.Color = clWindowText
                    CalendarAttributes.Font.Height = -11
                    CalendarAttributes.Font.Name = 'MS Sans Serif'
                    CalendarAttributes.Font.Style = []
                    ButtonStyle = cbsCustom
                    DataField = 'DTACIDENTE'
                    DataSource = dsCatPess
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
                  end
                  object dbchkFLGCOMUNICACAOPOLICIAL: TDBCheckBox
                    Left = 8
                    Top = 105
                    Width = 269
                    Height = 17
                    Caption = 'Houve comunicação à autoridade policial?'
                    DataField = 'FLGCOMUNICACAOPOLICIAL'
                    DataSource = dsCatPess
                    TabOrder = 8
                    ValueChecked = 'S'
                    ValueUnchecked = 'N'
                    OnClick = dbchkFLGCOMUNICACAOPOLICIALClick
                  end
                  object dbchkFLGOBITO: TDBCheckBox
                    Left = 300
                    Top = 105
                    Width = 97
                    Height = 17
                    Caption = 'Houve Óbito?'
                    DataField = 'FLGOBITO'
                    DataSource = dsCatPess
                    TabOrder = 9
                    ValueChecked = 'S'
                    ValueUnchecked = 'N'
                    OnClick = dbchkFLGOBITOClick
                  end
                  object btnPesqSitGeradora: TBitBtn
                    Left = 426
                    Top = 273
                    Width = 25
                    Height = 25
                    TabOrder = 22
                    OnClick = btnPesqSitGeradoraClick
                    Glyph.Data = {
                      76010000424D7601000000000000760000002800000020000000100000000100
                      0400000000000001000000000000000000001000000000000000000000000000
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
                  object btnLimpaSitGeradora: TBitBtn
                    Left = 453
                    Top = 273
                    Width = 25
                    Height = 25
                    TabOrder = 23
                    OnClick = btnLimpaSitGeradoraClick
                    Glyph.Data = {
                      76010000424D7601000000000000760000002800000020000000100000000100
                      04000000000000010000120B0000120B00001000000000000000000000000000
                      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
                      555557777F777555F55500000000555055557777777755F75555005500055055
                      555577F5777F57555555005550055555555577FF577F5FF55555500550050055
                      5555577FF77577FF555555005050110555555577F757777FF555555505099910
                      555555FF75777777FF555005550999910555577F5F77777775F5500505509990
                      3055577F75F77777575F55005055090B030555775755777575755555555550B0
                      B03055555F555757575755550555550B0B335555755555757555555555555550
                      BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
                      50BB555555555555575F555555555555550B5555555555555575}
                    NumGlyphs = 2
                  end
                  object medtHORAACIDENTE: TMaskEdit
                    Left = 303
                    Top = 68
                    Width = 41
                    Height = 21
                    EditMask = '!90:00;0;_'
                    MaxLength = 5
                    TabOrder = 5
                  end
                  object medtHORASTRABANTESACID: TMaskEdit
                    Left = 357
                    Top = 68
                    Width = 41
                    Height = 21
                    EditMask = '!90:00;0;_'
                    MaxLength = 5
                    TabOrder = 6
                  end
                  object edtSitGerAcidTrab: TEdit
                    Left = 103
                    Top = 275
                    Width = 321
                    Height = 21
                    TabStop = False
                    Color = clSilver
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                    ReadOnly = True
                    TabOrder = 21
                  end
                  object cbbTipoAcidenteCat: TwwDBComboBox
                    Left = 426
                    Top = 30
                    Width = 190
                    Height = 21
                    ShowButton = True
                    Style = csDropDownList
                    MapList = True
                    AllowClearKey = True
                    DataField = 'TIPOACIDENTE'
                    DataSource = dsCatPess
                    DropDownCount = 8
                    DropDownWidth = 190
                    ItemHeight = 0
                    Items.Strings = (
                      'Típico'#9'1'
                      'Doença'#9'2'
                      'Trajeto'#9'3')
                    Sorted = False
                    TabOrder = 2
                    UnboundDataType = wwDefault
                    OnChange = cbbTipoAcidenteCatChange
                    OnEnter = cbbTipoAcidenteCatEnter
                  end
                  object cbbTipoCat: TwwDBComboBox
                    Left = 202
                    Top = 30
                    Width = 221
                    Height = 21
                    ShowButton = True
                    Style = csDropDownList
                    MapList = True
                    AllowClearKey = True
                    DataField = 'TIPOCAT'
                    DataSource = dsCatPess
                    DropDownCount = 8
                    DropDownWidth = 210
                    ItemHeight = 0
                    Items.Strings = (
                      'Inicial'#9'1'
                      'Reabertura'#9'2'
                      'Comunicação de Óbito'#9'3')
                    Sorted = False
                    TabOrder = 1
                    UnboundDataType = wwDefault
                    OnChange = cbbTipoCatChange
                    OnEnter = cbbTipoCatEnter
                  end
                  object cbbCATEmitidaPor: TwwDBComboBox
                    Left = 8
                    Top = 68
                    Width = 190
                    Height = 21
                    ShowButton = True
                    Style = csDropDownList
                    MapList = True
                    AllowClearKey = True
                    DataField = 'CATEMITIDAPOR'
                    DataSource = dsCatPess
                    DropDownCount = 8
                    DropDownWidth = 300
                    ItemHeight = 0
                    Items.Strings = (
                      'Iniciativa do empregador'#9'1'
                      'Ordem judicial'#9'2'
                      'Determinação de órgão fiscalizador'#9'3')
                    Sorted = False
                    TabOrder = 3
                    UnboundDataType = wwDefault
                    OnEnter = cbbCATEmitidaPorEnter
                  end
                  object edtCodSitGerAcidTrab: TEdit
                    Left = 8
                    Top = 275
                    Width = 91
                    Height = 21
                    TabStop = False
                    Color = clSilver
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                    ReadOnly = True
                    TabOrder = 20
                  end
                  object dtpDataObito: TCMDateTimePicker
                    Left = 426
                    Top = 104
                    Width = 95
                    Height = 21
                    CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                    CalendarAttributes.Font.Color = clWindowText
                    CalendarAttributes.Font.Height = -11
                    CalendarAttributes.Font.Name = 'MS Sans Serif'
                    CalendarAttributes.Font.Style = []
                    ButtonStyle = cbsCustom
                    DataField = 'DATAOBITO'
                    DataSource = dsCatPess
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
                    TabOrder = 10
                    DisplayFormat = 'dd/MM/yyyy'
                  end
                  object cbbLATERALCORPOATINGIDA: TwwDBComboBox
                    Left = 8
                    Top = 189
                    Width = 249
                    Height = 21
                    ShowButton = True
                    Style = csDropDownList
                    MapList = True
                    AllowClearKey = True
                    DataField = 'LATERAL_PARTE_CORPO_ATINGIDA'
                    DataSource = dsCatPess
                    DropDownCount = 8
                    ItemHeight = 0
                    Items.Strings = (
                      'Não aplicável'#9'0'
                      'Esquerda'#9'1'
                      'Direita'#9'2'
                      'Ambas'#9'3')
                    Sorted = False
                    TabOrder = 15
                    UnboundDataType = wwDefault
                    OnEnter = cbbLATERALCORPOATINGIDAEnter
                  end
                  object edtCodParteAtingida: TDBEdit
                    Left = 8
                    Top = 151
                    Width = 91
                    Height = 21
                    TabStop = False
                    Color = clSilver
                    DataField = 'COD_PARTE_CORPO_ATINGIDA'
                    DataSource = dsCatPess
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                    ReadOnly = True
                    TabOrder = 11
                  end
                  object edtDescParteAtingida: TEdit
                    Left = 103
                    Top = 151
                    Width = 321
                    Height = 21
                    TabStop = False
                    Color = clSilver
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                    ReadOnly = True
                    TabOrder = 12
                  end
                  object btnPesqParteAtingida: TBitBtn
                    Left = 426
                    Top = 149
                    Width = 25
                    Height = 25
                    ParentShowHint = False
                    ShowHint = True
                    TabOrder = 13
                    OnClick = btnPesqParteAtingidaClick
                    Glyph.Data = {
                      76010000424D7601000000000000760000002800000020000000100000000100
                      0400000000000001000000000000000000001000000000000000000000000000
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
                  object edtCodCausaAcid: TEdit
                    Left = 8
                    Top = 232
                    Width = 91
                    Height = 21
                    TabStop = False
                    Color = clSilver
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                    ReadOnly = True
                    TabOrder = 16
                  end
                  object edtDescCausaAcid: TEdit
                    Left = 103
                    Top = 232
                    Width = 321
                    Height = 21
                    TabStop = False
                    Color = clSilver
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                    ReadOnly = True
                    TabOrder = 17
                  end
                  object btnPesqAgenteCausador: TBitBtn
                    Left = 426
                    Top = 230
                    Width = 25
                    Height = 25
                    TabOrder = 18
                    OnClick = btnPesqAgenteCausadorClick
                    Glyph.Data = {
                      76010000424D7601000000000000760000002800000020000000100000000100
                      0400000000000001000000000000000000001000000000000000000000000000
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
                  object btnLimpaAgenteCausador: TBitBtn
                    Left = 453
                    Top = 230
                    Width = 25
                    Height = 25
                    TabOrder = 19
                    OnClick = btnLimpaAgenteCausadorClick
                    Glyph.Data = {
                      76010000424D7601000000000000760000002800000020000000100000000100
                      04000000000000010000120B0000120B00001000000000000000000000000000
                      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
                      555557777F777555F55500000000555055557777777755F75555005500055055
                      555577F5777F57555555005550055555555577FF577F5FF55555500550050055
                      5555577FF77577FF555555005050110555555577F757777FF555555505099910
                      555555FF75777777FF555005550999910555577F5F77777775F5500505509990
                      3055577F75F77777575F55005055090B030555775755777575755555555550B0
                      B03055555F555757575755550555550B0B335555755555757555555555555550
                      BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
                      50BB555555555555575F555555555555550B5555555555555575}
                    NumGlyphs = 2
                  end
                  object btnParteCorpo: TBitBtn
                    Left = 453
                    Top = 149
                    Width = 25
                    Height = 25
                    TabOrder = 14
                    OnClick = btnParteCorpoClick
                    Glyph.Data = {
                      76010000424D7601000000000000760000002800000020000000100000000100
                      04000000000000010000120B0000120B00001000000000000000000000000000
                      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
                      555557777F777555F55500000000555055557777777755F75555005500055055
                      555577F5777F57555555005550055555555577FF577F5FF55555500550050055
                      5555577FF77577FF555555005050110555555577F757777FF555555505099910
                      555555FF75777777FF555005550999910555577F5F77777775F5500505509990
                      3055577F75F77777575F55005055090B030555775755777575755555555550B0
                      B03055555F555757575755550555550B0B335555755555757555555555555550
                      BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
                      50BB555555555555575F555555555555550B5555555555555575}
                    NumGlyphs = 2
                  end
                  object wdblkpcmbIDCATPESSORIGEM: TwwDBLookupCombo
                    Left = 8
                    Top = 326
                    Width = 200
                    Height = 21
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    DropDownAlignment = taLeftJustify
                    Selected.Strings = (
                      'LISTA_COMBO'#9'80'#9'LISTA_COMBO')
                    DataField = 'IDCATPESSORIGEM'
                    DataSource = dsCatPess
                    LookupTable = CdsCatOrigem
                    LookupField = 'IDCATPESS'
                    Style = csDropDownList
                    Color = clSilver
                    DropDownWidth = 200
                    Enabled = False
                    ParentFont = False
                    TabOrder = 24
                    AutoDropDown = False
                    ShowButton = True
                    AllowClearKey = False
                  end
                  object dbDtUltDiaTrab: TCMDateTimePicker
                    Left = 495
                    Top = 68
                    Width = 121
                    Height = 21
                    CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                    CalendarAttributes.Font.Color = clWindowText
                    CalendarAttributes.Font.Height = -11
                    CalendarAttributes.Font.Name = 'MS Sans Serif'
                    CalendarAttributes.Font.Style = []
                    ButtonStyle = cbsCustom
                    DataField = 'DT_ULTIMO_DIA_TRAB'
                    DataSource = dsCatPess
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
                    TabOrder = 7
                    DisplayFormat = 'dd/MM/yyyy'
                  end
                end
              end
              object tbsLocal: TTabSheet
                Caption = 'Local'
                ImageIndex = 3
                object grpDadosLocalAcid: TGroupBox
                  Left = 10
                  Top = 5
                  Width = 625
                  Height = 180
                  Caption = 'Dados do Local do Acidente'
                  TabOrder = 0
                  object Label42: TLabel
                    Left = 8
                    Top = 22
                    Width = 40
                    Height = 13
                    Caption = 'Cidade'
                  end
                  object Label43: TLabel
                    Left = 221
                    Top = 22
                    Width = 17
                    Height = 13
                    Caption = 'UF'
                  end
                  object Label44: TLabel
                    Left = 278
                    Top = 22
                    Width = 118
                    Height = 13
                    Caption = 'Código do Município'
                  end
                  object Label45: TLabel
                    Left = 8
                    Top = 64
                    Width = 79
                    Height = 13
                    Caption = 'Tipo de Local'
                  end
                  object Label47: TLabel
                    Left = 8
                    Top = 105
                    Width = 144
                    Height = 13
                    Caption = 'Descrição do Logradouro'
                  end
                  object Label48: TLabel
                    Left = 221
                    Top = 105
                    Width = 44
                    Height = 13
                    Caption = 'Número'
                  end
                  object Label51: TLabel
                    Left = 278
                    Top = 105
                    Width = 32
                    Height = 13
                    Caption = 'CNPJ'
                  end
                  object lblCEP: TLabel
                    Left = 221
                    Top = 64
                    Width = 25
                    Height = 13
                    Caption = 'CEP'
                  end
                  object wdblkpcmbIDCIDADES: TwwDBLookupCombo
                    Left = 8
                    Top = 37
                    Width = 210
                    Height = 21
                    DropDownAlignment = taLeftJustify
                    Selected.Strings = (
                      'NOME'#9'40'#9'NOME')
                    DataField = 'IDCIDADES'
                    DataSource = dsCatPess
                    LookupTable = CdsCidades
                    LookupField = 'idcidades'
                    Style = csDropDownList
                    TabOrder = 0
                    AutoDropDown = False
                    ShowButton = True
                    AllowClearKey = True
                    OnChange = wdblkpcmbIDCIDADESChange
                  end
                  object dbedtDESCLOGRADOURO: TDBEdit
                    Left = 8
                    Top = 120
                    Width = 210
                    Height = 21
                    DataField = 'DESCLOGRADOURO'
                    DataSource = dsCatPess
                    TabOrder = 5
                  end
                  object dbedtNUMEROLOGRADOURO: TDBEdit
                    Left = 221
                    Top = 120
                    Width = 49
                    Height = 21
                    DataField = 'NUMEROLOGRADOURO'
                    DataSource = dsCatPess
                    MaxLength = 10
                    TabOrder = 6
                  end
                  object dbedtCNPJ: TDBEdit
                    Left = 278
                    Top = 120
                    Width = 134
                    Height = 21
                    DataField = 'CNPJ'
                    DataSource = dsCatPess
                    MaxLength = 14
                    TabOrder = 7
                  end
                  object edtUF: TEdit
                    Left = 221
                    Top = 37
                    Width = 51
                    Height = 21
                    TabStop = False
                    Color = clSilver
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                    ReadOnly = True
                    TabOrder = 1
                  end
                  object edtCodMunicipio: TEdit
                    Left = 278
                    Top = 37
                    Width = 134
                    Height = 21
                    TabStop = False
                    Color = clSilver
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                    ReadOnly = True
                    TabOrder = 2
                  end
                  object cbbTipoLocal: TwwDBComboBox
                    Left = 8
                    Top = 78
                    Width = 210
                    Height = 21
                    ShowButton = True
                    Style = csDropDownList
                    MapList = True
                    AllowClearKey = True
                    DataField = 'TIPOLOCAL'
                    DataSource = dsCatPess
                    DropDownCount = 8
                    DropDownWidth = 400
                    ItemHeight = 0
                    Items.Strings = (
                      'Estabelecimento do empregador no Brasil'#9'1'
                      'Estabelecimento do empregador no exterior'#9'2'
                      'Estabelecimento de terceiros onde o empregador presta serviços'#9'3'
                      'Via pública'#9'4'
                      'Área rural'#9'5'
                      'Embarcação'#9'6'
                      'Outros'#9'9')
                    Sorted = False
                    TabOrder = 3
                    UnboundDataType = wwDefault
                    OnChange = cbbTipoLocalChange
                    OnEnter = cbbTipoLocalEnter
                  end
                  object dbedtCEP: TDBEdit
                    Left = 221
                    Top = 78
                    Width = 190
                    Height = 21
                    Color = clSilver
                    DataField = 'CEP'
                    DataSource = dsCatPess
                    Enabled = False
                    MaxLength = 8
                    ReadOnly = True
                    TabOrder = 4
                  end
                end
              end
              object tbsCATAtestado: TTabSheet
                Caption = 'Atestado'
                ImageIndex = 1
                object Label52: TLabel
                  Left = 8
                  Top = 10
                  Width = 162
                  Height = 13
                  Caption = 'Data e Hora do Atendimento'
                end
                object Label54: TLabel
                  Left = 176
                  Top = 10
                  Width = 93
                  Height = 13
                  Caption = 'Dur. Tratamento'
                end
                object Label55: TLabel
                  Left = 277
                  Top = 28
                  Width = 26
                  Height = 13
                  Caption = 'Dias'
                end
                object Label57: TLabel
                  Left = 8
                  Top = 50
                  Width = 108
                  Height = 13
                  Caption = 'Natureza da Lesão'
                end
                object edtDTATENDIMENTO: TCMDateTimePicker
                  Left = 8
                  Top = 23
                  Width = 115
                  Height = 21
                  CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                  CalendarAttributes.Font.Color = clWindowText
                  CalendarAttributes.Font.Height = -11
                  CalendarAttributes.Font.Name = 'MS Sans Serif'
                  CalendarAttributes.Font.Style = []
                  ButtonStyle = cbsCustom
                  DataField = 'DTATENDIMENTO'
                  DataSource = dsCatPess
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
                  DisplayFormat = 'dd/MM/yyyy'
                  OnChange = edtDTATENDIMENTOChange
                end
                object dbchkFLGAFASTAMENTO: TDBCheckBox
                  Left = 315
                  Top = 7
                  Width = 105
                  Height = 17
                  Caption = 'Afastamento'
                  DataField = 'FLGAFASTAMENTO'
                  DataSource = dsCatPess
                  TabOrder = 3
                  ValueChecked = 'S'
                  ValueUnchecked = 'N'
                  OnClick = dbchkFLGAFASTAMENTOClick
                end
                object dbchkFLGINTERNACAO: TDBCheckBox
                  Left = 315
                  Top = 32
                  Width = 105
                  Height = 17
                  Caption = 'Internação'
                  DataField = 'FLGINTERNACAO'
                  DataSource = dsCatPess
                  TabOrder = 4
                  ValueChecked = 'S'
                  ValueUnchecked = 'N'
                  OnClick = dbchkFLGINTERNACAOClick
                end
                object grbCID: TGroupBox
                  Left = 8
                  Top = 96
                  Width = 415
                  Height = 45
                  Caption = 'CID'
                  TabOrder = 9
                  object dbedtCATCODCID: TDBEdit
                    Left = 9
                    Top = 15
                    Width = 77
                    Height = 21
                    TabStop = False
                    Color = clSilver
                    DataField = 'CODCID'
                    DataSource = dsCatPess
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                    ReadOnly = True
                    TabOrder = 0
                  end
                  object edtDescCID: TEdit
                    Left = 87
                    Top = 15
                    Width = 258
                    Height = 21
                    TabStop = False
                    Color = clSilver
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                    ReadOnly = True
                    TabOrder = 1
                  end
                  object btnBuscaCidAtestado: TBitBtn
                    Left = 347
                    Top = 13
                    Width = 25
                    Height = 25
                    ParentShowHint = False
                    ShowHint = True
                    TabOrder = 2
                    OnClick = btnBuscaCidAtestadoClick
                    Glyph.Data = {
                      76010000424D7601000000000000760000002800000020000000100000000100
                      0400000000000001000000000000000000001000000000000000000000000000
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
                  object btnLimpaCIDAtest: TBitBtn
                    Left = 374
                    Top = 13
                    Width = 25
                    Height = 25
                    TabOrder = 3
                    OnClick = btnLimpaCIDAtestClick
                    Glyph.Data = {
                      76010000424D7601000000000000760000002800000020000000100000000100
                      04000000000000010000120B0000120B00001000000000000000000000000000
                      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
                      555557777F777555F55500000000555055557777777755F75555005500055055
                      555577F5777F57555555005550055555555577FF577F5FF55555500550050055
                      5555577FF77577FF555555005050110555555577F757777FF555555505099910
                      555555FF75777777FF555005550999910555577F5F77777775F5500505509990
                      3055577F75F77777575F55005055090B030555775755777575755555555550B0
                      B03055555F555757575755550555550B0B335555755555757555555555555550
                      BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
                      50BB555555555555575F555555555555550B5555555555555575}
                    NumGlyphs = 2
                  end
                end
                object grbExaminador: TGroupBox
                  Left = 8
                  Top = 148
                  Width = 415
                  Height = 81
                  Caption = 'Examinador (Médico/Entidade)'
                  TabOrder = 10
                  object Label60: TLabel
                    Left = 8
                    Top = 38
                    Width = 94
                    Height = 13
                    Caption = 'Órgão de Classe'
                  end
                  object Label61: TLabel
                    Left = 195
                    Top = 38
                    Width = 142
                    Height = 13
                    Caption = 'Nº Inscrição (CRM/CRO)'
                  end
                  object Label62: TLabel
                    Left = 347
                    Top = 38
                    Width = 17
                    Height = 13
                    Caption = 'UF'
                  end
                  object btnBuscaExaminadorAtestado: TBitBtn
                    Left = 347
                    Top = 13
                    Width = 25
                    Height = 25
                    ParentShowHint = False
                    ShowHint = True
                    TabOrder = 1
                    OnClick = btnBuscaExaminadorAtestadoClick
                    Glyph.Data = {
                      76010000424D7601000000000000760000002800000020000000100000000100
                      0400000000000001000000000000000000001000000000000000000000000000
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
                  object edtExaminadorAtestado: TEdit
                    Left = 9
                    Top = 15
                    Width = 335
                    Height = 21
                    TabStop = False
                    Color = clSilver
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                    ReadOnly = True
                    TabOrder = 0
                  end
                  object edtdbOrgaoClasse: TwwDBComboBox
                    Left = 9
                    Top = 51
                    Width = 184
                    Height = 21
                    ShowButton = True
                    Style = csDropDownList
                    MapList = True
                    AllowClearKey = True
                    DataField = 'ORGAOCLASSE'
                    DataSource = dsCatPess
                    DropDownCount = 8
                    DropDownWidth = 300
                    ItemHeight = 0
                    Items.Strings = (
                      'Conselho Regional de Medicina - CRM'#9'1'
                      'Conselho Regional de Odontologia - CRO'#9'2'
                      'Registro do Ministério da Saúde - RMS'#9'3')
                    Sorted = False
                    TabOrder = 3
                    UnboundDataType = wwDefault
                    OnChange = edtdbOrgaoClasseChange
                    OnEnter = edtdbOrgaoClasseEnter
                  end
                  object edtInscrExamAtestado: TEdit
                    Left = 196
                    Top = 51
                    Width = 148
                    Height = 21
                    TabStop = False
                    Color = clSilver
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                    ReadOnly = True
                    TabOrder = 4
                  end
                  object edtUFExamAtestado: TEdit
                    Left = 347
                    Top = 51
                    Width = 37
                    Height = 21
                    TabStop = False
                    Color = clSilver
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                    ReadOnly = True
                    TabOrder = 5
                  end
                  object btnLimpaExamAtest: TBitBtn
                    Left = 374
                    Top = 13
                    Width = 25
                    Height = 25
                    TabOrder = 2
                    OnClick = btnLimpaExamAtestClick
                    Glyph.Data = {
                      76010000424D7601000000000000760000002800000020000000100000000100
                      04000000000000010000120B0000120B00001000000000000000000000000000
                      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
                      555557777F777555F55500000000555055557777777755F75555005500055055
                      555577F5777F57555555005550055555555577FF577F5FF55555500550050055
                      5555577FF77577FF555555005050110555555577F757777FF555555505099910
                      555555FF75777777FF555005550999910555577F5F77777775F5500505509990
                      3055577F75F77777575F55005055090B030555775755777575755555555550B0
                      B03055555F555757575755550555550B0B335555755555757555555555555550
                      BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
                      50BB555555555555575F555555555555550B5555555555555575}
                    NumGlyphs = 2
                  end
                end
                object btnPesqNatLesao: TBitBtn
                  Left = 355
                  Top = 61
                  Width = 25
                  Height = 25
                  TabOrder = 7
                  OnClick = btnPesqNatLesaoClick
                  Glyph.Data = {
                    76010000424D7601000000000000760000002800000020000000100000000100
                    0400000000000001000000000000000000001000000000000000000000000000
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
                object btnLimpaNatLesao: TBitBtn
                  Left = 382
                  Top = 61
                  Width = 25
                  Height = 25
                  TabOrder = 8
                  OnClick = btnLimpaNatLesaoClick
                  Glyph.Data = {
                    76010000424D7601000000000000760000002800000020000000100000000100
                    04000000000000010000120B0000120B00001000000000000000000000000000
                    800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
                    555557777F777555F55500000000555055557777777755F75555005500055055
                    555577F5777F57555555005550055555555577FF577F5FF55555500550050055
                    5555577FF77577FF555555005050110555555577F757777FF555555505099910
                    555555FF75777777FF555005550999910555577F5F77777775F5500505509990
                    3055577F75F77777575F55005055090B030555775755777575755555555550B0
                    B03055555F555757575755550555550B0B335555755555757555555555555550
                    BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
                    50BB555555555555575F555555555555550B5555555555555575}
                  NumGlyphs = 2
                end
                object medtHORAATENDIMENTO: TMaskEdit
                  Left = 126
                  Top = 23
                  Width = 42
                  Height = 21
                  EditMask = '!90:00;0;_'
                  MaxLength = 5
                  TabOrder = 1
                  OnChange = medtHORAATENDIMENTOChange
                end
                object dbedtDURACAOTRATAMENTO: TDBRealEdit
                  Left = 177
                  Top = 23
                  Width = 97
                  Height = 21
                  Alignment = taRightJustify
                  Lines.Strings = (
                    '0')
                  TabOrder = 2
                  WordWrap = False
                  OnChange = dbedtDURACAOTRATAMENTOChange
                  IntDigits = 10
                  DecDigits = 0
                  NumberFormat = iNumber
                  Signal = False
                  DataField = 'DURACAOTRATAMENTO'
                  DataSource = dsCatPess
                end
                object dbedtDESCNATLESAO: TEdit
                  Left = 95
                  Top = 63
                  Width = 258
                  Height = 21
                  TabStop = False
                  Color = clSilver
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 6
                end
                object edtCodNatLesao: TEdit
                  Left = 8
                  Top = 63
                  Width = 86
                  Height = 21
                  TabStop = False
                  Color = clSilver
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 5
                end
              end
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 836
      end
      inherited Dock974: TDock97
        Left = 750
        Height = 457
      end
    end
  end
  inherited Dock972: TDock97
    Width = 848
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Enabled = False
        Visible = False
      end
      inherited sbtnProcurar: TToolbarButton97
        Width = 134
        Caption = '&Procurar Empregado'
      end
      inherited sbtnApagar: TToolbarButton97
        Enabled = False
        Visible = False
      end
      object sbtnFicha: TToolbarButton97
        Left = 468
        Top = 0
        Width = 60
        Height = 41
        Hint = 'Imprimir a Ficha PCMSO'
        Caption = '&Ficha'
        Enabled = False
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500000000055
          555557777777775F55550FFFFFFFFF0555557F5555555F7FFF5F0FEEEEEE0000
          05007F555555777775770FFFFFF0BFBFB00E7F5F5557FFF557770F0EEEE000FB
          FB0E7F75FF57775555770FF00F0FBFBFBF0E7F57757FFFF555770FE0B00000FB
          FB0E7F575777775555770FFF0FBFBFBFBF0E7F5575FFFFFFF5770FEEE0000000
          FB0E7F555777777755770FFFFF0B00BFB0007F55557577FFF7770FEEEEE0B000
          05557F555557577775550FFFFFFF0B0555557FF5F5F57575F55500F0F0F0F0B0
          555577F7F7F7F7F75F5550707070700B055557F7F7F7F7757FF5507070707050
          9055575757575757775505050505055505557575757575557555}
        Layout = blGlyphTop
        NumGlyphs = 2
        Opaque = False
        ParentShowHint = False
        ShowHint = True
        Spacing = 0
        OnClick = sbtnFichaClick
      end
      object ToolbarSep972: TToolbarSep97
        Left = 448
        Top = 0
        Blank = True
        SizeHorz = 20
        SizeVert = 9
      end
      object sbtnProcurarCand: TToolbarButton97
        Left = 314
        Top = 0
        Width = 134
        Height = 41
        AllowAllUp = True
        GroupIndex = 1
        Caption = 'Procurar &Candidato'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333CCCCC33
          33333FFFF77777FFFFFFCCCCCC808CCCCCC3777777F7F777777F008888070888
          8003777777777777777F0F0770F7F0770F0373F33337F333337370FFFFF7FFFF
          F07337F33337F33337F370FFFB99FBFFF07337F33377F33337F330FFBF99BFBF
          F033373F337733333733370BFBF7FBFB0733337F333FF3337F33370FBF98BFBF
          0733337F3377FF337F333B0BFB990BFB03333373FF777FFF73333FB000B99000
          B33333377737777733333BFBFBFB99FBF33333333FF377F333333FBF99BF99BF
          B333333377F377F3333333FB99FB99FB3333333377FF77333333333FB9999FB3
          333333333777733333333333FBFBFB3333333333333333333333}
        ImageIndex = 3
        Images = ImlPadrao
        Layout = blGlyphTop
        Opaque = False
        Spacing = 0
        OnClick = sbtnProcurarCandClick
      end
      object sbtnCAT: TToolbarButton97
        Left = 528
        Top = 0
        Width = 60
        Height = 41
        Hint = 'Imprimir o CAT - Comunicação De Acidente Do Trabalho'
        Caption = '&CAT'
        Enabled = False
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888880008
          8888888888888F7778FF8888000088888800877008888888888F7787F778FF88
          0000888800880007700888888F778F7778F778FF000088008800877007700888
          778F7787F778F778000080880088877770077087FF778887F88778F700008700
          888887777770008777888887FF888777000080888888F77777777087F8888F77
          78FF88870000878888FF888777777087F88F77888778FF8700008788FF888888
          87777087FF778888888778F7000087FF88899888888770877788888888888777
          000087888AA88888808880878FF8888888FFF8F700008877F888888FF0877888
          778FF88FF77787780000888877F87FFFFF08888888778F77788878F800008888
          88777FFFFFF088888888777FF888878F00008888888877FFFFFF008888888877
          8F888F77000088888888887FFF7788888888888878FF77880000888888888887
          7788888888888888877788880000888888888888888888888888888888888888
          0000}
        Layout = blGlyphTop
        NumGlyphs = 2
        Opaque = False
        ParentShowHint = False
        ShowHint = True
        Spacing = 0
        OnClick = sbtnCATClick
      end
    end
  end
  inherited Dock971: TDock97
    Top = 622
    Width = 848
    inherited tb97Fundo: TToolbar97
      Left = 474
      DockPos = 474
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 750006
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 305
      DockPos = 305
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 804
    Top = 42
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 437
    Top = 19
  end
  inherited ImlPadrao: TImageList
    Left = 808
    Top = 29
    Bitmap = {
      494C01010B000E00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
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
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF00000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000
      000000FFFF0000FFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF000000000000FFFF0000FFFF0000FFFF0000FFFF00000000000000
      00000000000000FFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF00000000000000000000FFFF0000FFFF00000000000000000000FF
      FF0000FFFF0000FFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF000000000000FFFF00000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF00000000000000000000000000FFFFFF00BDBDBD00BDBD
      BD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BDBDBD00FFFFFF00FFFFFF00FFFF
      FF00BDBDBD00BDBDBD00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000000000000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF00000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF000000FF00FFFFFF00FFFFFF00FFFFFF00BDBDBD00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF007B7B7B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFF0000FFFF
      0000FFFF0000FFFF0000000000000000000000000000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000000000000000000000000000FFFFFF00FFFFFF000000
      FF000000FF000000FF00FFFFFF00FFFFFF00BDBDBD0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFF0000FFFF
      000000000000FFFF0000BDBDBD0000000000000000000000000000000000FFFF
      0000FFFF0000FFFF0000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF000000FF00FFFFFF00FFFFFF00FFFFFF0000000000BDBDBD00BDBDBD00BDBD
      BD00BDBDBD000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFF0000FFFF
      0000FFFF000000000000BDBDBD000000000000000000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000BDBDBD00BDBDBD00BDBD
      BD00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFF0000FFFF
      0000FFFF0000FFFF0000000000000000000000000000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF000000000000000000007B7B7B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF00000000000000000000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF00000000000000FF000000FF000000
      FF00000000000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF00000000000000000000FFFF0000FFFF
      0000FFFF0000FFFF000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF00000000000000000000FFFF0000FFFF
      0000FFFF0000FFFF000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF0000000000000000000000
      00000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      00000000000000000000000000000000FFFFC003FFFF0000FFFFC003FFFF0000
      FFFFC003CFF30000FFFFC00387E10000FFFFC00300000000FFFFC00300000000
      E007C00300000000F00FC00300010000F81FC00300030000FC3FC00300070000
      FE7FC003000F0000FFFFC003FE8B0000FFFFC003FFDF0000FFFFC003FF770000
      FFFFC003FFDF0000FFFFC003FFFF0000FC1FFFFFFFFFFFFFF007F83FF83FF83F
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
    ApplyEdit = CmeCadastroApplyEdit
    Left = 551
    Top = 30
  end
  inherited Cds: TCMClientDataSet
    Left = 437
    Top = 7
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Empregado'
    Colunas.Strings = (
      'UPPER(PESSOA.NOME)'
      'FUNCIONARIO.MATRICULA'
      'PESSOA.NUMDOCUMENTO'
      'CARGO.TITULO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Nome da Pessoa'
      'Matrícula'
      'CPF (ou equivalente)'
      'Cargo')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'FUNCIONARIO'
      'PESSOA '
      'CARGO')
    CamposChave.Strings = (
      'FUNCIONARIO.IDPESSOA')
    Filtro.Strings = (
      'FUNCIONARIO.IDPESSOA = PESSOA.IDPESSOA'
      'FUNCIONARIO.IDCARGO = CARGO.IDCARGO')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '60'
      '22'
      '22'
      '40')
    Left = 244
    Top = 71
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Operacao = opIdle
    Left = 551
    Top = 17
  end
  inherited dsDet: TwwDataSource
    DataSet = CdsDet
    OnStateChange = dsDetStateChange
    Left = 479
    Top = 19
  end
  object CdsCID: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 738
    Top = 53
  end
  object CdsParamRH: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 737
    Top = 41
  end
  object CdsDet: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterScroll = CdsDetAfterScroll
    Left = 477
    Top = 7
  end
  object MontaSelectCand: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'PESSOA.NOME'
      'PESSOA.NUMDOCUMENTO'
      'CARGO.TITULO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Nome da Pessoa'
      'Matrícula'
      'Cargo')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'CANDIDAT'
      'PESSOA '
      'CARGO')
    CamposChave.Strings = (
      'CANDIDAT.IDPESSOA')
    Filtro.Strings = (
      'CANDIDAT.IDPESSOA = PESSOA.IDPESSOA'
      'CANDIDAT.IDCARGO = CARGO.IDCARGO')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '60'
      '22'
      '40')
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
    Left = 244
    Top = 60
  end
  object MontaSelectCID: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona CID'
    Colunas.Strings = (
      'CODCID'
      'SUBSTR(DESCRCID,1,100) AS DESCRICAO'
      'DESCRCID')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Código'
      'Descrição Abreviada'
      'Descrição Completa')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'CID')
    CamposChave.Strings = (
      'CODCID'
      'DESCRCID')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '100'
      '1000')
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
    Left = 247
    Top = 48
  end
  object CdsTabOcorr: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 737
    Top = 28
  end
  object CdsCargo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 812
    Top = 395
  end
  object dsCargo: TwwDataSource
    DataSet = CdsCargo
    Left = 812
    Top = 381
  end
  object MontaSelectNaturezaLesao: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Natureza da Lesão'
    Colunas.Strings = (
      'naturezalesao.codigo'
      'substr(naturezalesao.descricao,0,255) as descricao')
    TipodeDado.Strings = (
      'N'
      'C')
    Descricao.Strings = (
      'Código eSocial'
      'Desc. Natureza Lesão')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'naturezalesao')
    CamposChave.Strings = (
      'naturezalesao.idnatlesao'
      'naturezalesao.codigo'
      'naturezalesao.descricao')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '15'
      '255')
    OperComparador.Strings = (
      '-1'
      '-1')
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
    Left = 245
    Top = 36
  end
  object MontaSelectAgenteCausador: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Agente Causador do Acidente de Trabalho'
    Colunas.Strings = (
      'AGENTECAUSADORACIDTRAB.CODIGO'
      'SUBSTR(AGENTECAUSADORACIDTRAB.DESCRICAO,0,255) AS DESCRICAO')
    TipodeDado.Strings = (
      'N'
      'C')
    Descricao.Strings = (
      'Código eSocial'
      'Desc. do Agente Causador do Acid. de Trab.')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'AGENTECAUSADORACIDTRAB')
    CamposChave.Strings = (
      'AGENTECAUSADORACIDTRAB.CODIGO'
      'AGENTECAUSADORACIDTRAB.DESCRICAO')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '15'
      '255')
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
    Left = 247
    Top = 24
  end
  object MontaSelectParteAtingida: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Parte do Corpo Atingida'
    Colunas.Strings = (
      'PARTECORPOATINGIDA.CODIGO'
      'SUBSTR(PARTECORPOATINGIDA.DESCRICAO,0,255) AS DESCRICAO')
    TipodeDado.Strings = (
      'N'
      'C')
    Descricao.Strings = (
      'Código eSocial'
      'Desc. da Parte Corpo Atingida')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'PARTECORPOATINGIDA')
    CamposChave.Strings = (
      'PARTECORPOATINGIDA.CODIGO'
      'PARTECORPOATINGIDA.DESCRICAO')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '15'
      '255')
    OperComparador.Strings = (
      '-1'
      '-1')
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
    Left = 247
    Top = 11
  end
  object CdsMotivo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 736
    Top = 16
  end
  object CdsMonitora: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 804
    Top = 267
  end
  object dsMonitora: TwwDataSource
    AutoEdit = False
    DataSet = CdsMonitora
    Left = 804
    Top = 253
  end
  object CdsResponsavel: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 651
    Top = 67
  end
  object CdsCatPess: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterInsert = CdsCatPessAfterInsert
    Left = 807
    Top = 331
  end
  object dsCatPess: TwwDataSource
    AutoEdit = False
    DataSet = CdsCatPess
    Left = 806
    Top = 319
  end
  object CdsCidades: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 737
    Top = 4
  end
  object CdsCatOrigem: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 651
    Top = 55
  end
  object MontaSelectSitGerAcidTrab: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Situação Geradora do Acidente de Trabalho'
    Colunas.Strings = (
      'situacaogeradoraacidtrab.CODIGO'
      'SubStr(situacaogeradoraacidtrab.DESCRICAO,0,255) AS DESCRICAO')
    TipodeDado.Strings = (
      'N'
      'C')
    Descricao.Strings = (
      'Código eSocial'
      'Desc. da Sit. Geradora do Acid. de Trabalho')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'situacaogeradoraacidtrab')
    CamposChave.Strings = (
      'situacaogeradoraacidtrab.CODIGO'
      'situacaogeradoraacidtrab.DESCRICAO'
      'situacaogeradoraacidtrab.IDSITGERADORAACIDTRAB')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '15'
      '255')
    OperComparador.Strings = (
      '-1'
      '-1')
    ApenasLetraENum.Strings = (
      'N'
      'N')
    ComparaMaiuscula.Strings = (
      'S'
      'S')
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
    Left = 247
    Top = 65535
  end
  object CdsCNPJFuncef: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 651
    Top = 43
  end
  object CmDetalheMonitora: TCmEventosCadastro
    Operacao = opIdle
    RepetirInsert = True
    DataSource = dsMonitora
    OpenDsAutomatico = False
    Left = 551
    Top = 4
  end
  object CdsPesquisaRegistro: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 652
    Top = 30
  end
  object cdsProcessos: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 651
    Top = 18
  end
  object cdsProcRealizado: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 651
    Top = 6
  end
end
