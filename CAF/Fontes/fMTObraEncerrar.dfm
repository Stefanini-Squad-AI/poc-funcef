inherited frmMTObraEncerrar: TfrmMTObraEncerrar
  Left = 10
  Top = 101
  Caption = 'Encerramento de Obra'
  ClientHeight = 426
  ClientWidth = 772
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Top = 34
    Width = 772
    Height = 358
    inherited pnlMestre: TPanel
      Width = 770
      Height = 84
      object Label10: TLabel
        Left = 632
        Top = 8
        Width = 79
        Height = 13
        Caption = 'Encerrada em'
      end
      object pnlObra: TPanel
        Left = 0
        Top = 0
        Width = 625
        Height = 84
        BevelOuter = bvNone
        Enabled = False
        TabOrder = 0
        object Label1: TLabel
          Left = 16
          Top = 8
          Width = 107
          Height = 13
          Caption = 'Descrição da Obra'
        end
        object Label2: TLabel
          Left = 504
          Top = 8
          Width = 66
          Height = 13
          Caption = 'Iniciada em'
        end
        object dbeDescObra: TDBMemo
          Left = 16
          Top = 24
          Width = 468
          Height = 49
          DataField = 'DESCCAFOBRA'
          DataSource = ds
          MaxLength = 200
          TabOrder = 0
        end
        object dbeDtaInicioObra: TCMDateTimePicker
          Left = 504
          Top = 24
          Width = 113
          Height = 21
          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
          CalendarAttributes.Font.Color = clWindowText
          CalendarAttributes.Font.Height = -11
          CalendarAttributes.Font.Name = 'MS Sans Serif'
          CalendarAttributes.Font.Style = []
          ButtonStyle = cbsCustom
          DataField = 'DTAINICIOOBRA'
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
      end
      object dbeDtaEncerraObra: TCMDateTimePicker
        Left = 632
        Top = 24
        Width = 113
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        DataField = 'DTAENCERRAOBRA'
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
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 85
      Width = 770
      Height = 272
      Tabs.Strings = (
        'Bens Resultantes')
      inherited pgctrlDetalhe: TPageControl
        Width = 672
        Height = 213
        inherited tbsDet: TTabSheet
          Caption = 'Bens Resultantes'
          inherited dbgrdDet: TwwDBGrid [0]
            Width = 664
            Height = 185
            Selected.Strings = (
              'CLASSE'#9'20'#9'Grupo na Obra'
              'NOMEGRUPO'#9'62'#9'Descrição'#9'F'
              'VALORG'#9'17'#9'Soma'#9'F')
            TitleAlignment = taCenter
          end
          inherited pnlControlesDet: TPanel [1]
            Width = 664
            Height = 185
            object pgctlBem: TPageControl
              Left = 0
              Top = 3
              Width = 656
              Height = 173
              ActivePage = TabIdent
              TabOrder = 0
              object TabIdent: TTabSheet
                Caption = 'Identificação do Bem'
                object Label7: TLabel
                  Left = 328
                  Top = 8
                  Width = 38
                  Height = 13
                  Caption = 'Classe'
                end
                object Label8: TLabel
                  Left = 8
                  Top = 8
                  Width = 104
                  Height = 13
                  Caption = 'Descrição do Bem'
                end
                object Label29: TLabel
                  Left = 328
                  Top = 88
                  Width = 51
                  Height = 13
                  Caption = 'Situação'
                end
                object Label9: TLabel
                  Left = 328
                  Top = 48
                  Width = 96
                  Height = 13
                  Caption = 'Nº de Patrimônio'
                end
                object Label13: TLabel
                  Left = 512
                  Top = 48
                  Width = 76
                  Height = 13
                  Caption = 'Data Entrada'
                end
                object bbtnSelClasse: TBitBtn
                  Left = 616
                  Top = 24
                  Width = 21
                  Height = 21
                  TabOrder = 1
                  OnClick = bbtnSelClasseClick
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
                object edDescClasse: TwwDBEdit
                  Left = 328
                  Top = 24
                  Width = 289
                  Height = 21
                  DataField = 'DESCRICAO'
                  DataSource = dsClasse
                  TabOrder = 6
                  UnboundDataType = wwDefault
                  WantReturns = False
                  WordWrap = False
                end
                object edPlaca: TMaskEdit
                  Left = 328
                  Top = 64
                  Width = 137
                  Height = 21
                  TabOrder = 3
                end
                object bbtnGeraPlaca: TBitBtn
                  Left = 464
                  Top = 64
                  Width = 20
                  Height = 20
                  Cursor = crHandPoint
                  Hint = 
                    'Gera um número de Patrimônio baseado nos parâmetros iniciais do ' +
                    'sistema'
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 2
                  OnClick = bbtnGeraPlacaClick
                  Glyph.Data = {
                    36060000424D3606000000000000360400002800000020000000100000000100
                    0800000000000002000000000000000000000001000000010000000000000000
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
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00F7A400A4A4A4
                    00F7F7F7F7F7F7F7F700F7F7A4FFF7FFA4FFF7F7F7F7F7FFF7A407A400A40000
                    00F7F7F7F7A400A4F700F7FFA4F7A4A4F6F7F7F7F7F7A4F7FFA40000A4A400F7
                    F7F7F7F7F700A4000000A4A4F7F7A4FFF7F7F7F7F7A4F7A4A4A40707A40000F7
                    F7F7F7F7F7A40000A4A4F7F7FFA4A4F7FFF7F7F7F7F7A4A4F7F7A4000000A400
                    F7F7F7F7F7F700A4A400F7A4A4A4F7A4F7F7F7F7F7FFA4FFF7A4A400F7A400A4
                    F7F7F7F70000000700A4F7A4FFF7A4F7F7F7F7F7A4A4A4F7A4FF0000F7F7F7F7
                    F7F7F7F700A4A4070007A4A4F7F7FFFFFFF7F7F7A4FFFFFFA4FFF7F7F7000000
                    F7F7F7F70000000700A4F7FFF7A4A4A4FFF7F7FFA4A4A4FFA4F700A4F700A400
                    F7A400A4F7F700A40700A4F7FFA4FFA4FFFFA4F7FFF7A4FFFFA4A4000000A400
                    0000A400F7A40000A407F7A4A4A4F7A4A4A4FFA4F7F7A4A4FFFF0000A4A4A4A4
                    A40000A4F700A4000000A4A4F7F7FFFFFFA4A4FFF7A4F7A4A4A400A4A4000000
                    A4A400F7F7A400A4F700A4FFF7A4A4A4F7FFA4FFFFFFA4F7F7A4000700A4A4A4
                    00A4000000F7F7F7F700A4F7A4FFF7FFA4FFA4A4A4FFF7F7F7A4A407000700A4
                    00A4A4A400F7F7F7F7F7F7FFA4FFA4F7A4FFF7FFA4FFF7F7F7F7000700A407A4
                    00A4000000F7F7F7F7F7A4FFA4F7FFFFA4F7F7A4A4F7F7F7F7F700A407000000
                    A4A400F7F7F7F7F7F7F7A4F7F7A4A4A4F7F7A4F7F7F7F7F7F7F7}
                  NumGlyphs = 2
                  Spacing = 0
                end
                object cmbSituacao: TwwDBLookupCombo
                  Left = 328
                  Top = 104
                  Width = 311
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'DESCSITUACAO'#9'45'#9'Descrição')
                  DataField = 'IDSITUACAO'
                  DataSource = dsDet
                  LookupTable = cdsSituacao
                  LookupField = 'IDSITUACAO'
                  TabOrder = 5
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = False
                end
                object dbeDtaInclusao: TCMDateTimePicker
                  Left = 512
                  Top = 64
                  Width = 126
                  Height = 21
                  CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                  CalendarAttributes.Font.Color = clWindowText
                  CalendarAttributes.Font.Height = -11
                  CalendarAttributes.Font.Name = 'MS Sans Serif'
                  CalendarAttributes.Font.Style = []
                  ButtonStyle = cbsCustom
                  DataField = 'DTAINCLUSAO'
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
                  TabOrder = 4
                end
                object dbeDesBem: TDBMemo
                  Left = 8
                  Top = 24
                  Width = 313
                  Height = 101
                  DataField = 'DESBEM'
                  DataSource = dsDet
                  TabOrder = 0
                end
              end
              object TabConjunto: TTabSheet
                Caption = 'Conjunto do Bem'
                ImageIndex = 3
                object Label3: TLabel
                  Left = 8
                  Top = 8
                  Width = 51
                  Height = 13
                  Caption = 'Conjunto'
                end
                object Label6: TLabel
                  Left = 304
                  Top = 8
                  Width = 98
                  Height = 13
                  Caption = 'Rateio de Custos'
                end
                object Label5: TLabel
                  Left = 328
                  Top = 88
                  Width = 74
                  Height = 13
                  Caption = 'Responsável'
                end
                object Label4: TLabel
                  Left = 8
                  Top = 88
                  Width = 69
                  Height = 13
                  Caption = 'Localização'
                end
                object dbeDescConjunto: TDBMemo
                  Left = 8
                  Top = 24
                  Width = 257
                  Height = 57
                  DataField = 'DESCCONJUNTO'
                  DataSource = dsConjunto
                  MaxLength = 200
                  TabOrder = 1
                end
                object dbgRateio: TwwDBGrid
                  Left = 304
                  Top = 24
                  Width = 337
                  Height = 57
                  Selected.Strings = (
                    'CODCENTROCUSTO'#9'12'#9'Centro de Custo'
                    'DESCCCUSTO'#9'34'#9'Descrição'
                    'PARTICIPACAO'#9'6'#9'    (%)')
                  IniAttributes.Delimiter = ';;'
                  TitleColor = clBtnFace
                  FixedCols = 0
                  ShowHorzScrollBar = True
                  DataSource = dsRateioCCusto
                  ReadOnly = True
                  TabOrder = 2
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
                object dbeNomeResponsavel: TwwDBEdit
                  Left = 328
                  Top = 104
                  Width = 314
                  Height = 21
                  DataField = 'NOMERESP'
                  DataSource = dsConjunto
                  TabOrder = 4
                  UnboundDataType = wwDefault
                  WantReturns = False
                  WordWrap = False
                end
                object dbeDescLocalizacao: TwwDBEdit
                  Left = 8
                  Top = 104
                  Width = 314
                  Height = 21
                  DataField = 'DESCLOCAL'
                  DataSource = dsConjunto
                  TabOrder = 3
                  UnboundDataType = wwDefault
                  WantReturns = False
                  WordWrap = False
                end
                object bbtnGeraConjunto: TBitBtn
                  Left = 264
                  Top = 24
                  Width = 24
                  Height = 57
                  TabOrder = 0
                  OnClick = bbtnGeraConjuntoClick
                  Glyph.Data = {
                    76010000424D7601000000000000760000002800000020000000100000000100
                    0400000000000001000000000000000000001000000000000000000000000000
                    80000080000000808000800000008000800080800000C0C0C000808080000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
                    77777777777FFFFFFFFF7777770000000007777777888888888F777777877777
                    77077777778F7777778F7777778FFFFFF7077777778F7777778F7777778FCCCC
                    F70777FFFF8F7777778F7000008FFFFFF7077888888F7777778F7877778FCCCC
                    F70778F7778F7777778F78FFFF8FFFFFF70778F7778F7777FF8F78FCCC8FCCF0
                    000778F7778F7778888778FFFF8FFFF7F87778F7778F7778F87778FCCC8FFFF7
                    877778F7778FFFF8877778FFFF888888777778F777888888777778FCCCCF7077
                    777778F7777778F7777778FFFFFF7077777778F7777778F7777778FFFFFF7077
                    777778FFFFFFF8F7777778888888887777777888888888777777}
                  NumGlyphs = 2
                end
              end
              object TabContab: TTabSheet
                Caption = 'Dados Contábeis do Bem'
                object Label11: TLabel
                  Left = 8
                  Top = 8
                  Width = 35
                  Height = 13
                  Caption = 'Grupo'
                end
                object Label17: TLabel
                  Left = 504
                  Top = 48
                  Width = 108
                  Height = 13
                  Caption = 'Inicio Depreciação'
                end
                object Label18: TLabel
                  Left = 8
                  Top = 48
                  Width = 56
                  Height = 13
                  Caption = 'SubConta'
                end
                object Label19: TLabel
                  Left = 8
                  Top = 88
                  Width = 104
                  Height = 13
                  Caption = 'Atividade/ Projeto'
                end
                object Label44: TLabel
                  Left = 504
                  Top = 8
                  Width = 129
                  Height = 13
                  Caption = 'Valor Total da Entrada'
                end
                object bbtnSelGrupo: TBitBtn
                  Left = 472
                  Top = 24
                  Width = 21
                  Height = 21
                  TabOrder = 0
                  OnClick = bbtnSelGrupoClick
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
                object edDataInicioDep: TCMDateTimePicker
                  Left = 504
                  Top = 64
                  Width = 105
                  Height = 21
                  CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                  CalendarAttributes.Font.Color = clWindowText
                  CalendarAttributes.Font.Height = -11
                  CalendarAttributes.Font.Name = 'MS Sans Serif'
                  CalendarAttributes.Font.Style = []
                  ButtonStyle = cbsCustom
                  DataField = 'DATAINICIODEP'
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
                  TabOrder = 4
                end
                object bbtnSelAtivProjeto: TBitBtn
                  Left = 472
                  Top = 104
                  Width = 21
                  Height = 21
                  TabOrder = 2
                  OnClick = bbtnSelAtivProjetoClick
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
                object bbtnSelSubConta: TBitBtn
                  Left = 472
                  Top = 64
                  Width = 21
                  Height = 21
                  TabOrder = 1
                  OnClick = bbtnSelSubContaClick
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
                object edDescGrupo: TwwDBEdit
                  Left = 8
                  Top = 24
                  Width = 464
                  Height = 21
                  DataField = 'NOME'
                  DataSource = dsGrupo
                  TabOrder = 5
                  UnboundDataType = wwDefault
                  WantReturns = False
                  WordWrap = False
                end
                object edDescSubConta: TwwDBEdit
                  Left = 8
                  Top = 64
                  Width = 464
                  Height = 21
                  DataField = 'NOMESUBCONTA'
                  DataSource = dsSubConta
                  TabOrder = 6
                  UnboundDataType = wwDefault
                  WantReturns = False
                  WordWrap = False
                end
                object edAtivProjeto: TwwDBEdit
                  Left = 8
                  Top = 104
                  Width = 464
                  Height = 21
                  DataField = 'NOME'
                  DataSource = dsAtivProj
                  TabOrder = 7
                  UnboundDataType = wwDefault
                  WantReturns = False
                  WordWrap = False
                end
                object dbeValOfi: TDBRealEdit
                  Left = 504
                  Top = 24
                  Width = 129
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
                  DataField = 'VALORG'
                  DataSource = dsDet
                end
              end
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 762
        inherited tb97BotoesDetalhe: TToolbar97
          inherited sbtnInsDet: TToolbarButton97
            Left = 127
            Visible = False
          end
          inherited sbtnAltDet: TToolbarButton97
            Left = 0
            Width = 127
            Caption = 'Ratificar Dados'
          end
          inherited sbtnExcluiDet: TToolbarButton97
            Left = 152
            Visible = False
          end
        end
      end
      inherited Dock974: TDock97
        Left = 676
        Height = 213
      end
    end
  end
  inherited Dock972: TDock97
    Width = 772
    Height = 34
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Left = 172
        Width = 86
        Height = 28
        Enabled = False
        Layout = blGlyphLeft
        Spacing = 4
        Visible = False
      end
      inherited sbtnAlterar: TToolbarButton97
        Left = 258
        Width = 86
        Height = 28
        Enabled = False
        Layout = blGlyphLeft
        Spacing = 4
        Visible = False
      end
      inherited sbtnProcurar: TToolbarButton97
        Left = 0
        Width = 86
        Height = 28
        Layout = blGlyphLeft
        Spacing = 4
      end
      inherited sbtnApagar: TToolbarButton97
        Left = 344
        Width = 86
        Height = 28
        Enabled = False
        Layout = blGlyphLeft
        Spacing = 4
        Visible = False
      end
      object bbtnEstornar: TToolbarButton97
        Left = 86
        Top = 0
        Width = 86
        Height = 28
        AllowAllUp = True
        GroupIndex = 1
        Caption = '&Estornar'
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
        ImageIndex = 2
        Images = ImlPadrao
        Opaque = False
        OnClick = bbtnEstornarClick
      end
    end
  end
  inherited Dock971: TDock97
    Top = 392
    Width = 772
    Height = 34
    inherited tb97Fundo: TToolbar97
      Left = 590
      DockPos = 741
      inherited sep1: TToolbarSep97
        Left = 175
      end
      inherited sep3: TToolbarSep97
        Left = 86
      end
      inherited bbtnSair: TBitBtn
        Width = 86
        Height = 28
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 89
        Width = 86
        Height = 28
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 408
      DockPos = 470
      inherited ToolbarSep971: TToolbarSep97
        Left = 175
      end
      object ToolbarSep972: TToolbarSep97 [1]
        Left = 86
        Top = 0
        Blank = True
        SizeHorz = 3
      end
      inherited bbtnConfirmar: TBitBtn
        Width = 86
        Height = 28
        Caption = '&Encerrar'
      end
      inherited bbtnCancelar: TBitBtn
        Left = 89
        Width = 86
        Height = 28
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 482
    Top = 431
    TargetsData = (
      1
      2
      (
        'TDBMemo'
        'Text'
        0)
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 712
    Top = 0
  end
  inherited ImlPadrao: TImageList
    Left = 560
    Top = 431
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyEdit = CmeCadastroApplyEdit
    Left = 472
    Top = 0
  end
  inherited Cds: TCMClientDataSet
    Left = 680
    Top = 0
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Selecione a Obra'
    Colunas.Strings = (
      'CAFOBRA.DESCCAFOBRA'
      'CAFOBRA.DTAINICIOOBRA'
      'CAFOBRA.DTAENCERRAOBRA')
    TipodeDado.Strings = (
      'C'
      'D'
      'D')
    Descricao.Strings = (
      'Descrição'
      'Data de Inicio'
      'Data de Encerramento')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'CAFOBRA')
    CamposChave.Strings = (
      'CAFOBRA.IDCAFOBRA'
      'CAFOBRA.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '60'
      '18'
      '18')
    Left = 624
    Top = 0
  end
  inherited CmeDetalhe: TCmEventosCadastro
    BeforeConfirma = CmeDetalheBeforeConfirma
    Left = 544
    Top = 0
  end
  inherited dsDet: TwwDataSource
    DataSet = cdsDet
    Left = 656
    Top = 117
  end
  object cdsDet: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 656
    Top = 102
  end
  object sqlDet: TCMSqlParams
    SQL.Strings = (
      'SELECT B.IDBEM,B.IDPESSOA,B.IDCONJUNTO,B.IDTERCEIRO,B.IDGRUPO,'
      '       B.CODSUBCONTA,B.IDCLASSEBEM,B.IDMODULO,B.IDITENSRECDEV,'
      
        '       B.IDFORNSERV,B.IDSITUACAO,B.IDIMAGEM,B.REGISTRO,B.CONTROL' +
        'E,'
      
        '       B.PLACA,B.DESBEM,B.IDNOTA,B.COMPLNOTA,B.DTANOTA,B.NUMSERI' +
        'E,'
      
        '       B.DTAINCLUSAO,B.VALHISTORICO,B.VALORG,B.CMBEM,B.VALFIS,B.' +
        'VALGER,'
      
        '       B.DATAINICIODEP,B.VALDEPINI,B.TAXADEP,B.DEPLANC,B.CMDEP,B' +
        '.DEPFIS,'
      '       B.DEPGER,B.DATAULTDEP,B.DATARECALCDEP,B.FLGDEPREC,'
      '       B.PROPBAIXA,B.BAIXATOTAL,B.IDOPCIONAL,B.UNIDNEGOC,'
      
        '       B.PROCESSOAQUIS,B.EMPENHOAQUIS,B.PUBAUTOR,B.PUBEDITORA,B.' +
        'PUBANO,'
      '       B.PRIORIDADE,B.DATAINSTALACAO,B.DATATERMINOGAR,'
      '       B.FLGBEMINTCONTAB, B.DTACONTAB,'
      '       G.IDGRUPO AS IDGRUPOOBRA, G.CLASSE, G.NOME AS NOMEGRUPO'
      'FROM BEM B,'
      '     HISTORICOMOVIMENTACAO HM,'
      '     GRUPO G'
      'WHERE HM.IDCAFOBRA = :IDCAFOBRA'
      '  AND HM.IDPESSOA = :IDPESSOA'
      '  AND B.IDBEM = HM.IDBEM(+)'
      '  AND B.IDPESSOA = HM.IDPESSOA(+)'
      '  AND B.IDGRUPO = G.IDGRUPO(+)'
      ''
      ' ')
    ClientDataSet = cdsDet
    Left = 656
    Top = 88
  end
  object cdsConjunto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 152
    Top = 76
  end
  object dsConjunto: TwwDataSource
    AutoEdit = False
    DataSet = cdsConjunto
    Left = 152
    Top = 62
  end
  object MSConjunto: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Selecione o Conjunto'
    Colunas.Strings = (
      'CONJUNTO.DESCCONJUNTO'
      'LOCALIZACAO.NOME'
      'PESSOA.NOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Conjunto'
      'Localização'
      'Responsável')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'CONJUNTO'
      'LOCALIZACAO'
      'PESSOA')
    CamposChave.Strings = (
      'CONJUNTO.IDCONJUNTO')
    Filtro.Strings = (
      'CONJUNTO.IDLOCALIZACAO = LOCALIZACAO.IDLOCALIZACAO'
      'CONJUNTO.IDPESSOA=LOCALIZACAO.IDPESSOA'
      'CONJUNTO.IDRESPONSAVEL = PESSOA.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '200'
      '60'
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 152
    Top = 48
  end
  object cdsClasse: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 512
    Top = 117
  end
  object dsClasse: TwwDataSource
    AutoEdit = False
    DataSet = cdsClasse
    Left = 512
    Top = 102
  end
  object MSClasse: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Selecione a Classe do Bem'
    Colunas.Strings = (
      'CLASSEDEBEM.CODHIERARQ'
      'CLASSEDEBEM.DESCRICAO')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Código'
      'Descrição')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'CLASSEDEBEM')
    CamposChave.Strings = (
      'CLASSEDEBEM.IDCLASSEBEM')
    Filtro.Strings = (
      'CLASSEDEBEM.ANASINT = '#39'A'#39)
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '15'
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 512
    Top = 88
  end
  object cdsGrupo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 304
    Top = 76
  end
  object dsGrupo: TwwDataSource
    AutoEdit = False
    DataSet = cdsGrupo
    Left = 304
    Top = 62
  end
  object MSGrupo: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Selecione a Grupo Contábil'
    Colunas.Strings = (
      'GRUPO.CLASSE'
      'GRUPO.NOME')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Código'
      'Descrição')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'GRUPO'
      'PLANOGRUPO')
    CamposChave.Strings = (
      'GRUPO.IDGRUPO'
      'PLANOGRUPO.IDPESSOA')
    Filtro.Strings = (
      'GRUPO.TIPO = '#39'A'#39
      'GRUPO.IDGRUPO=PLANOGRUPO.IDGRUPO')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '15'
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 304
    Top = 48
  end
  object cdsSubConta: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 440
    Top = 76
  end
  object dsSubConta: TwwDataSource
    AutoEdit = False
    DataSet = cdsSubConta
    Left = 440
    Top = 62
  end
  object MSSubConta: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Selecione a SubConta'
    Colunas.Strings = (
      'SUBCONTA.NOMESUBCONTA')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Descrição')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'SUBCONTA')
    CamposChave.Strings = (
      'SUBCONTA.CODSUBCONTA'
      'SUBCONTA.IDPESSOA')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 440
    Top = 48
  end
  object cdsAtivProj: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 368
    Top = 76
  end
  object dsAtivProj: TwwDataSource
    AutoEdit = False
    DataSet = cdsAtivProj
    Left = 368
    Top = 62
  end
  object MSAtivProj: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Selecione a Atividade/Projeto'
    Colunas.Strings = (
      'UNIDNEGOCIO.NOME'
      'UNIDNEGOCIO.UNECODIGO')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Descrição'
      'Código')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'UNIDNEGOCIO')
    CamposChave.Strings = (
      'UNIDNEGOCIO.UNIDNEGOC'
      'UNIDNEGOCIO.IDPESSOA')
    Filtro.Strings = (
      'UNIDNEGOCIO.UNIDNEGOC > 0'
      'UNIDNEGOCIO.UNETIPO = '#39'A'#39)
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '25'
      '10')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 368
    Top = 48
  end
  object cdsRateioCCusto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 232
    Top = 62
  end
  object dsRateioCCusto: TwwDataSource
    AutoEdit = False
    DataSet = cdsRateioCCusto
    Left = 232
    Top = 48
  end
  object cdsSituacao: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 584
    Top = 88
  end
  object cdsLancObra: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 288
    Top = 142
  end
  object sqlLancObra: TCMSqlParams
    SQL.Strings = (
      'SELECT IDGRUPO, SUM(VALOFI) AS SOMAVALOFI'
      'FROM CAFOBRALANC'
      'WHERE IDCAFOBRA = :IDCAFOBRA'
      '  AND IDPESSOA = :IDPESSOA'
      'GROUP BY IDGRUPO')
    ClientDataSet = cdsLancObra
    Left = 288
    Top = 128
  end
end
