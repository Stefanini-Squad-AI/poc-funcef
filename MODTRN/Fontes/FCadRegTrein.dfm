inherited frmCadRegTrein: TfrmCadRegTrein
  Left = 35
  Top = 51
  HelpContext = 720012
  Caption = 'Registro Individual de Treinamento'
  ClientHeight = 468
  ClientWidth = 695
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 695
    Height = 382
    BorderWidth = 2
    inherited pnlMestre: TPanel
      Left = 4
      Top = 4
      Width = 687
      Height = 55
      object Label1: TLabel
        Left = 77
        Top = 9
        Width = 55
        Height = 13
        Caption = 'Matrícula'
        FocusControl = dbedMatricula
      end
      object Label10: TLabel
        Left = 243
        Top = 9
        Width = 33
        Height = 13
        Caption = 'Nome'
        FocusControl = dbedMatricula
      end
      object dbedMatricula: TDBEdit
        Left = 140
        Top = 6
        Width = 84
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
        Left = 280
        Top = 6
        Width = 360
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
        Left = 76
        Top = 30
        Width = 198
        Height = 21
        TabStop = False
        Color = clGray
        DataField = 'DESCRICAO'
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
        Left = 280
        Top = 30
        Width = 360
        Height = 21
        TabStop = False
        Color = clGray
        DataField = 'TITULO'
        DataSource = ds
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
      Left = 4
      Top = 59
      Width = 687
      Height = 319
      Tabs.Strings = (
        'Cursos'
        'Avaliações dos Cursos')
      detdbGrids.Strings = (
        'dbgrdDet'
        'dbgrdAval')
      inherited pgctrlDetalhe: TPageControl
        Width = 589
        Height = 260
        inherited tbsDet: TTabSheet
          Caption = 'Cursos'
          inherited dbgrdDet: TwwDBGrid
            Width = 581
            Height = 232
            Selected.Strings = (
              'DESCRICAO'#9'41'#9'Curso'
              'DATPLINI'#9'12'#9'Data Plan. Início'
              'DATPLFIM'#9'11'#9'Data Plan. Fim'
              'DATREINI'#9'12'#9'Data Real Início'
              'DATREFIM'#9'10'#9'Data Real Fim')
            Font.Style = []
            ParentFont = False
          end
          inherited pnlControlesDet: TPanel
            Width = 581
            Height = 232
            object Label2: TLabel
              Left = 8
              Top = 37
              Width = 158
              Height = 13
              Caption = 'Empresa/Entidade/Instrutor'
              FocusControl = dbedMatricula
            end
            object Label3: TLabel
              Left = 8
              Top = 70
              Width = 174
              Height = 13
              Caption = 'Instrutor da Empresa/Entidade'
              FocusControl = dbedMatricula
            end
            object Label4: TLabel
              Left = 8
              Top = -1
              Width = 33
              Height = 13
              Caption = 'Curso'
              FocusControl = dbedMatricula
            end
            object dblcEntid: TwwDBLookupCombo
              Left = 8
              Top = 50
              Width = 333
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'60'#9'NOME')
              DataField = 'IDENTIDINSTR'
              DataSource = dsDet
              LookupTable = qryEntid
              LookupField = 'IDPESSOA'
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
              AllowClearKey = True
              OnChange = dblcEntidChange
              OnEnter = dblcEntidEnter
            end
            object gbxDatas: TGroupBox
              Left = 7
              Top = 104
              Width = 115
              Height = 150
              Caption = 'Datas'
              TabOrder = 4
              object Label6: TLabel
                Left = 8
                Top = 11
                Width = 94
                Height = 13
                Caption = 'Início Planejado'
                FocusControl = dbedMatricula
              end
              object Label7: TLabel
                Left = 8
                Top = 44
                Width = 88
                Height = 13
                Caption = 'Final Planejado'
                FocusControl = dbedMatricula
              end
              object Label8: TLabel
                Left = 8
                Top = 77
                Width = 78
                Height = 13
                Caption = 'Início Efetivo'
                FocusControl = dbedMatricula
              end
              object Label9: TLabel
                Left = 8
                Top = 110
                Width = 72
                Height = 13
                Caption = 'Final Efetivo'
                FocusControl = dbedMatricula
              end
              object cmDatPlIni: TCMDateTimePicker
                Left = 8
                Top = 24
                Width = 100
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                ButtonStyle = cbsCustom
                DataField = 'DATPLINI'
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
              end
              object cmDatPlFim: TCMDateTimePicker
                Left = 8
                Top = 57
                Width = 100
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                ButtonStyle = cbsCustom
                DataField = 'DATPLFIM'
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
                TabOrder = 1
              end
              object cmDatReIni: TCMDateTimePicker
                Left = 8
                Top = 90
                Width = 100
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                ButtonStyle = cbsCustom
                DataField = 'DATREINI'
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
              end
              object cmDatReFim: TCMDateTimePicker
                Left = 8
                Top = 123
                Width = 100
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                ButtonStyle = cbsCustom
                DataField = 'DATREFIM'
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
                TabOrder = 3
              end
            end
            object gbxCarga: TGroupBox
              Left = 122
              Top = 104
              Width = 102
              Height = 150
              Caption = 'Carga Horária'
              TabOrder = 5
              object Label11: TLabel
                Left = 9
                Top = 17
                Width = 37
                Height = 13
                Caption = 'Teoria'
                FocusControl = dbedMatricula
              end
              object Label12: TLabel
                Left = 9
                Top = 62
                Width = 41
                Height = 13
                Caption = 'Prática'
                FocusControl = dbedMatricula
              end
              object Label13: TLabel
                Left = 9
                Top = 110
                Width = 30
                Height = 13
                Caption = 'Total'
                FocusControl = dbedMatricula
              end
              object dbedDurTeor: TDBRealEdit
                Left = 9
                Top = 30
                Width = 84
                Height = 21
                Alignment = taRightJustify
                Lines.Strings = (
                  '      0,00')
                TabOrder = 0
                WordWrap = False
                IntDigits = 10
                DecDigits = 2
                NumberFormat = fNumber
                Signal = False
                DataField = 'DUR_TEOR'
                DataSource = dsDet
              end
              object dbedDurPrat: TDBRealEdit
                Left = 9
                Top = 75
                Width = 84
                Height = 21
                Alignment = taRightJustify
                Lines.Strings = (
                  '      0,00')
                TabOrder = 1
                WordWrap = False
                IntDigits = 10
                DecDigits = 2
                NumberFormat = fNumber
                Signal = False
                DataField = 'DUR_PRAT'
                DataSource = dsDet
              end
              object dbedDurTot: TDBRealEdit
                Left = 9
                Top = 123
                Width = 84
                Height = 21
                Alignment = taRightJustify
                Lines.Strings = (
                  '      0,00')
                TabOrder = 2
                WordWrap = False
                IntDigits = 10
                DecDigits = 2
                NumberFormat = fNumber
                Signal = False
                DataField = 'DUR_TOT'
                DataSource = dsDet
              end
            end
            object gbxDespesas: TGroupBox
              Left = 224
              Top = 104
              Width = 117
              Height = 150
              Caption = 'Despesas'
              TabOrder = 6
              object Label14: TLabel
                Left = 9
                Top = 11
                Width = 33
                Height = 13
                Caption = 'Curso'
                FocusControl = dbedMatricula
              end
              object Label15: TLabel
                Left = 9
                Top = 44
                Width = 42
                Height = 13
                Caption = 'Viagem'
                FocusControl = dbedMatricula
              end
              object Label16: TLabel
                Left = 9
                Top = 77
                Width = 74
                Height = 13
                Caption = 'Hospedagem'
                FocusControl = dbedMatricula
              end
              object Label17: TLabel
                Left = 9
                Top = 110
                Width = 38
                Height = 13
                Caption = 'Outras'
                FocusControl = dbedMatricula
              end
              object dbedValor: TDBRealEdit
                Left = 9
                Top = 24
                Width = 100
                Height = 21
                Alignment = taRightJustify
                Lines.Strings = (
                  '      0,00')
                TabOrder = 0
                WordWrap = False
                IntDigits = 10
                DecDigits = 2
                NumberFormat = fNumber
                Signal = False
                DataField = 'VALOR'
                DataSource = dsDet
              end
              object dbedViagem: TDBRealEdit
                Left = 9
                Top = 56
                Width = 100
                Height = 21
                Alignment = taRightJustify
                Lines.Strings = (
                  '      0,00')
                TabOrder = 1
                WordWrap = False
                IntDigits = 10
                DecDigits = 2
                NumberFormat = fNumber
                Signal = False
                DataField = 'DESP_VIAG'
                DataSource = dsDet
              end
              object dbedHosped: TDBRealEdit
                Left = 9
                Top = 91
                Width = 100
                Height = 21
                Alignment = taRightJustify
                Lines.Strings = (
                  '      0,00')
                TabOrder = 2
                WordWrap = False
                IntDigits = 10
                DecDigits = 2
                NumberFormat = fNumber
                Signal = False
                DataField = 'DESP_ESTAD'
                DataSource = dsDet
              end
              object dbedOutras: TDBRealEdit
                Left = 9
                Top = 123
                Width = 100
                Height = 21
                Alignment = taRightJustify
                Lines.Strings = (
                  '      0,00')
                TabOrder = 3
                WordWrap = False
                IntDigits = 10
                DecDigits = 2
                NumberFormat = fNumber
                Signal = False
                DataField = 'DESP_OUTR'
                DataSource = dsDet
              end
            end
            object dbrgControle: TDBRadioGroup
              Left = 346
              Top = 3
              Width = 234
              Height = 35
              Caption = 'É Parte dos Controles Internos ?'
              Columns = 2
              DataField = 'FLGCONTROLE'
              DataSource = dsDet
              Items.Strings = (
                'Sim'
                'Não')
              TabOrder = 2
              Values.Strings = (
                '1'
                '0')
              OnChange = dbrgControleChange
            end
            object gbxResult: TGroupBox
              Left = 346
              Top = 79
              Width = 234
              Height = 174
              Caption = 'Resultado'
              TabOrder = 7
              object LblAprov: TLabel
                Left = 131
                Top = 97
                Width = 63
                Height = 16
                Alignment = taCenter
                Caption = 'LblAprov'
                FocusControl = dbedMatricula
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clRed
                Font.Height = -13
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object imgAprov: TImage
                Left = 24
                Top = 93
                Width = 37
                Height = 25
                Picture.Data = {
                  055449636F6E0000010001002020100000000000E80200001600000028000000
                  2000000040000000010004000000000080020000000000000000000000000000
                  0000000000000000000080000080000000808000800000008000800080800000
                  80808000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000
                  FFFFFF0000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000330000000000000000000000033303303303300
                  0000000000000003303330333003003300000000000000033003330330002333
                  0000000000000030000033003033333000000000000033333330000003330003
                  33000000080333333333333333300233330000000F033333333333333302333B
                  B03000004F8333333333333333333BB003BB00004FF3333333333333B33BB003
                  3BBB00004FF333333333B3BB3BB0033BBBB000004FF83B333B3B3B3BBBB03BBB
                  BB0300F04FFF33B3B3B3BBBBBBBBBBBB00330FF04FFF8B3B3333BBBBBBBBBB00
                  33330FF044FFF8BBB03033BBBBB330333330FFF444FFF8BB0BB3003B33000333
                  3330FF44444FF88B3BBB300000033333B33FFF44444FFF3BB0BBB3000333B33B
                  B38FF4444444FF003B0BB333333BBBBBB3FFF44444444FF00030BBBBBBBBBBBB
                  BBFF444444440000000303BBB3300000BFF44444440000000000000000000000
                  0FF4444400000000000000000000000000444444000000000000000000000000
                  0000444400000000000000000000000000000444000000000000000000000000
                  0000000400000000000000000000000000000000000000000000000000000000
                  00000000FFFFFFFFFFFFFFFFFFFF1FFFFF8003FFFC0000FFF800007FF800007F
                  E000003F0000001F0000001F0000000F00000007000000070000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000C000000FE01F003FFFFF80FFFFFFC0FFFFFFF0FFFFFFF8FFFFFFFE
                  FFFFFFFF}
              end
              object imgReprov: TImage
                Left = 24
                Top = 93
                Width = 37
                Height = 25
                Picture.Data = {
                  07544269746D617066010000424D660100000000000076000000280000001400
                  0000140000000100040000000000F00000000000000000000000100000001000
                  0000000000000000800000800000008080008000000080008000808000008080
                  8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
                  FF00888888888888888888880000888888888888888888980000889888888888
                  8888898800008899887777777777988800008899900000000009988800008889
                  90BFFFBFFF9988880000888899FCCCCCCF97888800008888999FBFFFB9978888
                  000088888999CCC9990788880000888880999FB99F0788880000888880FC9999
                  CF0788880000888880FF9999BF0788880000888880FC99990007888800008888
                  80B99F099F0788880000888880999F099998888800008888999FBF0F08998888
                  0000889999000000888998880000889998888888888889880000888888888888
                  888888980000888888888888888888880000}
              end
              object dbrgAvalCurs: TDBRadioGroup
                Left = 19
                Top = 125
                Width = 197
                Height = 39
                Caption = 'Avaliação do Curso ?'
                Columns = 2
                DataField = 'FLGAVALCURS'
                DataSource = dsDet
                Items.Strings = (
                  'Sim'
                  'Não')
                TabOrder = 3
                Values.Strings = (
                  '1'
                  '0')
                OnChange = dbrgAvalCursChange
              end
              object dbrgAvalTeor: TDBRadioGroup
                Left = 19
                Top = 12
                Width = 197
                Height = 39
                Caption = 'Avaliação Teórica ?'
                Columns = 2
                DataField = 'FLGAVALTEOR'
                DataSource = dsDet
                Items.Strings = (
                  'Sim'
                  'Não')
                TabOrder = 0
                Values.Strings = (
                  '1'
                  '0')
                OnChange = dbrgAvalTeorChange
              end
              object dbrgAvalPrat: TDBRadioGroup
                Left = 19
                Top = 52
                Width = 197
                Height = 39
                Caption = 'Avaliação Prática ?'
                Columns = 2
                DataField = 'FLGAVALPRAT'
                DataSource = dsDet
                Items.Strings = (
                  'Sim'
                  'Não')
                TabOrder = 1
                Values.Strings = (
                  '1'
                  '0')
                OnChange = dbrgAvalPratChange
              end
              object dbedAvCurs: TDBEdit
                Left = 70
                Top = 139
                Width = 46
                Height = 21
                DataField = 'AVALCURSO'
                DataSource = dsDet
                TabOrder = 2
              end
              object dbedAvTeor: TDBRealEdit
                Left = 70
                Top = 26
                Width = 46
                Height = 21
                Alignment = taRightJustify
                Lines.Strings = (
                  '0,00')
                TabOrder = 4
                WordWrap = False
                OnChange = dbedAvTeorChange
                IntDigits = 10
                DecDigits = 0
                NumberFormat = fNumber
                Signal = False
                DataField = 'AVALTEOR'
                DataSource = dsDet
              end
              object dbedAvPrat: TDBRealEdit
                Left = 70
                Top = 65
                Width = 46
                Height = 21
                Alignment = taRightJustify
                Lines.Strings = (
                  '0,00')
                TabOrder = 5
                WordWrap = False
                OnChange = dbedAvPratChange
                IntDigits = 10
                DecDigits = 0
                NumberFormat = fNumber
                Signal = False
                DataField = 'AVALPRAT'
                DataSource = dsDet
              end
            end
            object dblcInstrutor: TwwDBLookupCombo
              Left = 8
              Top = 83
              Width = 333
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'60'#9'NOME'#9'F')
              DataField = 'IDINSTRUTOR'
              DataSource = dsDet
              LookupTable = qryInstrutor
              LookupField = 'IDPESSOA'
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
              AllowClearKey = True
            end
            object gbxLocalCurso: TGroupBox
              Left = 346
              Top = 38
              Width = 234
              Height = 42
              Caption = 'Local do Curso e/ou Diretivas'
              TabOrder = 3
              object dbedLocalCurso: TDBEdit
                Left = 4
                Top = 13
                Width = 226
                Height = 21
                DataField = 'LOCALCURSO'
                DataSource = dsDet
                TabOrder = 0
              end
            end
            object CMProcuraCurso: TCMProcura
              Left = 8
              Top = 11
              Width = 333
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
              OnValidaDados = CMProcuraCursoValidaDados
              DataSource = dsDet
              DataField = 'IDCURSO'
              LookupChave = 'IDCURSO'
              LookupDescricao = 'DESCRICAO'
              MontaSelect = MontaSelectCurso
              LookupTabela = 'CM.CURSO'
              DataBaseName = 'BaseDados'
              ReadOnly = False
            end
          end
        end
        object tbshAval: TTabSheet
          Caption = 'Avaliações dos Cursos'
          ImageIndex = 1
          object dbgrdAval: TwwDBGrid
            Left = 0
            Top = 0
            Width = 581
            Height = 232
            Selected.Strings = (
              'DESCRICAO'#9'80'#9'Descrição'#9'F'
              'AVALCURSO'#9'10'#9'Avaliação')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsAval
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
          object pnlAval: TPanel
            Left = 0
            Top = 0
            Width = 581
            Height = 232
            Align = alClient
            TabOrder = 0
            object Label18: TLabel
              Left = 9
              Top = 15
              Width = 58
              Height = 13
              Caption = 'Descrição'
              FocusControl = DBEdit2
            end
            object Label19: TLabel
              Left = 9
              Top = 102
              Width = 75
              Height = 13
              Caption = 'Observações'
              FocusControl = DBEdit2
            end
            object DBEdit2: TDBEdit
              Left = 9
              Top = 30
              Width = 560
              Height = 21
              TabStop = False
              Color = clBtnFace
              DataField = 'DESCRICAO'
              DataSource = dsAval
              ReadOnly = True
              TabOrder = 0
            end
            object DBMemo1: TDBMemo
              Left = 9
              Top = 118
              Width = 560
              Height = 119
              DataField = 'OBSERVACAO'
              DataSource = dsAval
              ScrollBars = ssVertical
              TabOrder = 1
            end
            object dbrgAvalConceitual: TDBRadioGroup
              Left = 184
              Top = 57
              Width = 385
              Height = 40
              Caption = 'Avaliação Conceitual'
              Columns = 4
              DataField = 'AVALCURSO'
              DataSource = dsAval
              Items.Strings = (
                'Ruim'
                'Regular'
                'Bom'
                'Ótimo')
              TabOrder = 2
              Values.Strings = (
                '1'
                '2'
                '3'
                '4')
            end
            object gbxAvalEscal: TGroupBox
              Left = 9
              Top = 57
              Width = 169
              Height = 40
              Caption = 'Avaliação Escalonada'
              TabOrder = 3
              object dbredAvaliacao: TDBRealEdit
                Left = 56
                Top = 14
                Width = 57
                Height = 21
                Hint = 'Encare como % de atiingimento das expectativas'
                Alignment = taRightJustify
                Lines.Strings = (
                  '      0,00')
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
                WordWrap = False
                IntDigits = 3
                DecDigits = 0
                NumberFormat = fNumber
                Signal = False
                DataField = 'AVALCURSO'
                DataSource = dsAval
              end
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 679
        object pnlImprimeAval: TPanel
          Left = 283
          Top = 0
          Width = 110
          Height = 28
          TabOrder = 1
          Visible = False
          object sbtnImprimirAval: TSpeedButton
            Left = 2
            Top = 0
            Width = 33
            Height = 27
            Hint = 'Imprimir Avaliação'
            Glyph.Data = {
              DE010000424DDE01000000000000760000002800000024000000120000000100
              0400000000006801000000000000000000001000000010000000000000000000
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
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = sbtnImprimirAvalClick
          end
          object sbtnConfigAval: TSpeedButton
            Left = 38
            Top = 0
            Width = 33
            Height = 27
            Hint = 'Alterar Layout de Avaliações'
            Glyph.Data = {
              DE010000424DDE01000000000000760000002800000024000000120000000100
              0400000000006801000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888880008
              8888888888888F7778FF8888000088888800877008888888888F7787F778FF88
              0000888800880007700888888F778F7778F778FF000088008800877007700888
              778F7787F778F778000080880088877770077087FF778887F88778F700008700
              888887777770008777888887FF888777000080888888F77777777087F8888F77
              78FF88870000878888FF888777777087F88F77888778FF8700008788FF888888
              87777087FF778888888778F7000087FF88099888888770877788888888888777
              0000878880E08888808880878FF8888888FFF8F7000088770EEE088FF0877888
              778FF88FF777877800008880000EE0000000008888778F77788878F800008888
              880EEEEEEEEEE0888888777FF888878F00008888880EEEEEEEEEE08888888877
              8F888F7700008880000EE000000000888888888878FF7788000088880EEE0887
              7788888888888888877788880000888880E08888888888888888888888888888
              0000}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = sbtnConfigAvalClick
          end
          object sbtnDesfConfigAval: TSpeedButton
            Left = 74
            Top = 0
            Width = 33
            Height = 27
            Hint = 'Restaurar Alteração do Layout de Avaliações'
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              8888888888888888888888888888888888888888888888888888888888444488
              8888888887777888888888884444444488888887777777788888888444888844
              4888887778888777888888844888888448888877888888778888884488888888
              4488877888888887788888448888888844888778888888877888884488888888
              4488877888888887788888448888888844888778888888877888888448888484
              4888887788887877888888844888844448888877888877778888888888888444
              8888888888887778888888888888844448888888888877778888888888888888
              8888888888888888888888888888888888888888888888888888}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = sbtnDesfConfigAvalClick
          end
        end
      end
      inherited Dock974: TDock97
        Left = 593
        Height = 260
      end
    end
  end
  inherited Dock972: TDock97
    Width = 695
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Enabled = False
        Visible = False
      end
      inherited sbtnProcurar: TToolbarButton97
        Width = 120
        Caption = '&Procurar Empregado'
      end
      inherited sbtnApagar: TToolbarButton97
        Enabled = False
        Visible = False
      end
      object sbtnProcurarCand: TToolbarButton97
        Left = 300
        Top = 0
        Width = 120
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
        OnClick = sbtnProcurarClick
      end
    end
  end
  inherited Dock971: TDock97
    Top = 429
    Width = 695
    inherited tb97Fundo: TToolbar97
      Left = 525
      DockPos = 564
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 358
      DockPos = 397
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '  F.MATRICULA, P.NOME, C.TITULO, S.DESCRICAO, F.IDPESSOA'
      'FROM'
      '  PESSOA P, FUNCIONARIO F, SITFUNC S, CARGO C'
      'WHERE'
      '  (F.IDPESSOA  = :IDPESSOA)   AND'
      '  (F.IDCARGO   = C.IDCARGO)   AND'
      '  (F.IDSITFUNC = S.IDSITFUNC) AND'
      '  (F.IDPESSOA  = P.IDPESSOA)')
    Left = 300
    Top = 11
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  inherited dsDet: TwwDataSource
    DataSet = qryDet
    Left = 382
    Top = 13
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object MontaSelectFunc: TMontaSelect [8]
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'upper(PESSOA.NOME)'
      'FUNCIONARIO.MATRICULA'
      'PESSOA.NUMDOCUMENTO'
      'CARGO.TITULO'
      'EMPRESAPROP.NOMEEMPRESA')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Nome da Pessoa'
      'Matrícula'
      'CPF (ou equivalente)'
      'Cargo'
      'Empresa')
    Tabelas.Strings = (
      'FUNCIONARIO'
      'EMPRESAPROP'
      'PESSOA '
      'CARGO')
    CamposChave.Strings = (
      'FUNCIONARIO.IDPESSOA')
    Filtro.Strings = (
      'FUNCIONARIO.IDEMPRESA = EMPRESAPROP.IDPESSOA'
      'FUNCIONARIO.IDPESSOA = PESSOA.IDPESSOA'
      'FUNCIONARIO.IDCARGO = CARGO.IDCARGO')
    Larguras.Strings = (
      '60'
      '22'
      '22'
      '40'
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 474
    Top = 66
  end
  object qryDet: TwwQuery [9]
    CachedUpdates = True
    AfterInsert = qryDetAfterInsert
    BeforeEdit = qryDetBeforeEdit
    BeforePost = qryDetBeforePost
    AfterScroll = qryDetAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  H.*, C.DESCRICAO,'
      '  NVL(DATREINI, DATPLINI) AS DATAREF,'
      '  0 AS FINALIZOU'
      'FROM'
      '  HSTTRN H, CURSO C'
      'WHERE'
      '  (H.IDPESSOA = :IDPESSOA) AND'
      '  (H.IDCURSO  = C.IDCURSO)'
      'ORDER BY'
      '  DATAREF DESC')
    UpdateObject = updHstTrn
    ValidateWithMask = True
    Left = 415
    Top = 13
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object updHstTrn: TUpdateSQL [10]
    ModifySQL.Strings = (
      'update HSTTRN'
      'set'
      '  DATREINI = :DATREINI,'
      '  DATREFIM = :DATREFIM,'
      '  DATPLINI = :DATPLINI,'
      '  AVALCURSO = :AVALCURSO,'
      '  DATPLFIM = :DATPLFIM,'
      '  DUR_TEOR = :DUR_TEOR,'
      '  DUR_PRAT = :DUR_PRAT,'
      '  DUR_TOT = :DUR_TOT,'
      '  FLGCONTROLE = :FLGCONTROLE,'
      '  FLGAVALCURS = :FLGAVALCURS,'
      '  FLGAVALTEOR = :FLGAVALTEOR,'
      '  AVALTEOR = :AVALTEOR,'
      '  FLGAVALPRAT = :FLGAVALPRAT,'
      '  AVALPRAT = :AVALPRAT,'
      '  VALOR = :VALOR,'
      '  DESP_VIAG = :DESP_VIAG,'
      '  DESP_ESTAD = :DESP_ESTAD,'
      '  DESP_OUTR = :DESP_OUTR,'
      '  IDENTIDINSTR = :IDENTIDINSTR,'
      '  LOCALCURSO = :LOCALCURSO,'
      '  IDINSTRUTOR = :IDINSTRUTOR,'
      '  IDPROCESSO = :IDPROCESSO'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDCURSO = :OLD_IDCURSO and'
      '  NUMSEQ = :OLD_NUMSEQ')
    InsertSQL.Strings = (
      'insert into HSTTRN'
      '  (IDPESSOA, IDCURSO, NUMSEQ, DATREINI, DATREFIM, DATPLINI, '
      'AVALCURSO, '
      '   DATPLFIM, DUR_TEOR, DUR_PRAT, DUR_TOT, FLGCONTROLE, '
      'FLGAVALCURS, FLGAVALTEOR, '
      
        '   AVALTEOR, FLGAVALPRAT, AVALPRAT, VALOR, DESP_VIAG, DESP_ESTAD' +
        ', '
      'DESP_OUTR, '
      '   IDENTIDINSTR, LOCALCURSO, IDINSTRUTOR, IDPROCESSO)'
      'values'
      
        '  (:IDPESSOA, :IDCURSO, :NUMSEQ, :DATREINI, :DATREFIM, :DATPLINI' +
        ', '
      ':AVALCURSO, '
      '   :DATPLFIM, :DUR_TEOR, :DUR_PRAT, :DUR_TOT, :FLGCONTROLE, '
      ':FLGAVALCURS, '
      '   :FLGAVALTEOR, :AVALTEOR, :FLGAVALPRAT, :AVALPRAT, :VALOR, '
      ':DESP_VIAG, '
      '   :DESP_ESTAD, :DESP_OUTR, :IDENTIDINSTR, :LOCALCURSO, '
      ':IDINSTRUTOR, :IDPROCESSO)')
    DeleteSQL.Strings = (
      'delete from HSTTRN'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDCURSO = :OLD_IDCURSO and'
      '  NUMSEQ = :OLD_NUMSEQ')
    Left = 488
    Top = 9
  end
  object MontaSelectCand: TMontaSelect [11]
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
      'CPF (ou equivalente)'
      'Cargo')
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
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 569
    Top = 71
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 358
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 408
    Top = 108
  end
  object qryUltSeq: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select max(NUMSEQ) as ULTSEQ'
      'from hsttrn'
      'where  IDPESSOA = :IDPESSOA'
      'and  IDCURSO = :IDCURSO')
    ValidateWithMask = True
    Left = 224
    Top = 90
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDCURSO'
        ParamType = ptUnknown
      end>
  end
  object tblParam: TwwTable
    DatabaseName = 'BaseDados'
    TableName = 'CM.PARAMRH'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 496
    Top = 117
  end
  object qryCurso: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsDet
    SQL.Strings = (
      'SELECT'
      '  *'
      'FROM'
      '  CURSO'
      'WHERE'
      '  IDCURSO = :IDCURSO')
    ValidateWithMask = True
    Left = 312
    Top = 79
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCURSO'
        ParamType = ptUnknown
      end>
  end
  object qryEntid: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  P.IDPESSOA, UPPER(P.NOME) AS NOME'
      'FROM'
      '  PESSOA P, FUNCIONARIO F, INSTRUTORINTERNO IE'
      'WHERE'
      '  (F.IDPESSOA = P.IDPESSOA)  AND'
      '  (F.IDPESSOA = IE.IDPESSOA) AND'
      '  (P.TIPO     = '#39'F'#39')'
      'UNION'
      'SELECT'
      '  P.IDPESSOA, UPPER(P.NOME) AS NOME'
      'FROM'
      '  PESSOA P, TERCEIRO T'
      'WHERE'
      '  (T.IDPESSOA = P.IDPESSOA)'
      'ORDER BY'
      '  2'
      ' ')
    ValidateWithMask = True
    Left = 194
    Top = 122
  end
  object qryInstrutor: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  P.IDPESSOA, UPPER(P.NOME) AS NOME'
      'FROM'
      '  PESSOA P, TERCEIRO T'
      'WHERE'
      '  (T.IDPESSOA = P.IDPESSOA)  AND'
      '  (P.TIPO          = '#39'F'#39') '
      'ORDER BY'
      '  2')
    ValidateWithMask = True
    Left = 130
    Top = 122
  end
  object MontaSelectCurso: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona o Curso'
    Colunas.Strings = (
      'DESCRICAO'
      'IDCURSO'
      'ABREV')
    TipodeDado.Strings = (
      'C'
      'N'
      'C')
    Descricao.Strings = (
      'Título'
      'Código'
      'Nome Abreviado')
    Tabelas.Strings = (
      'CURSO')
    CamposChave.Strings = (
      'IDCURSO')
    Larguras.Strings = (
      '60'
      '15'
      '20')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 264
    Top = 9
  end
  object dsAval: TwwDataSource
    AutoEdit = False
    DataSet = qryAval
    Left = 550
    Top = 5
  end
  object qryAval: TwwQuery
    CachedUpdates = True
    AfterScroll = qryAvalAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  A.*, F.DESCRICAO, F.FLGAVALCURSO'
      'FROM'
      '  AVALCURSO A, FATORAVALCURSO F'
      'WHERE'
      '  (A.IDPESSOA = :IDPESSOA) AND'
      '  (A.IDCURSO  = :IDCURSO)   AND'
      '  (A.NUMSEQ = :NUMSEQ) AND'
      ' (A.IDFATORAVAL = F.IDFATORAVAL)'
      'ORDER BY'
      '  A.IDFATORAVAL')
    UpdateObject = updAval
    ValidateWithMask = True
    Left = 599
    Top = 5
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCURSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'NUMSEQ'
        ParamType = ptUnknown
      end>
  end
  object updAval: TUpdateSQL
    ModifySQL.Strings = (
      'update AVALCURSO'
      'set'
      '  AVALCURSO = :AVALCURSO,'
      '  OBSERVACAO = :OBSERVACAO'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDCURSO = :OLD_IDCURSO and'
      '  NUMSEQ = :OLD_NUMSEQ and'
      '  IDFATORAVAL = :OLD_IDFATORAVAL')
    InsertSQL.Strings = (
      'insert into AVALCURSO'
      
        '  (IDPESSOA, IDCURSO, NUMSEQ, IDFATORAVAL, AVALCURSO, OBSERVACAO' +
        ')'
      'values'
      '  (:IDPESSOA, :IDCURSO, :NUMSEQ, :IDFATORAVAL, :AVALCURSO, '
      ':OBSERVACAO)')
    DeleteSQL.Strings = (
      'delete from AVALCURSO'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDCURSO = :OLD_IDCURSO and'
      '  NUMSEQ = :OLD_NUMSEQ and'
      '  IDFATORAVAL = :OLD_IDFATORAVAL')
    Left = 648
    Top = 9
  end
  object qryFatorAval: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM FATORAVALCURSO'
      'ORDER BY IDFATORAVAL')
    ValidateWithMask = True
    Left = 604
    Top = 122
  end
end
