inherited frmAtend: TfrmAtend
  Left = 5
  Top = 86
  BorderIcons = [biHelp]
  BorderStyle = bsDialog
  Caption = 'Registro de Atendimento'
  ClientHeight = 459
  ClientWidth = 753
  ParentFont = True
  PrintScale = poNone
  OnCloseQuery = nil
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object tbbConsultaParticip: TToolbarButton97 [0]
    Left = 322
    Top = 0
    Width = 131
    Height = 41
    AllowAllUp = True
    GroupIndex = 1
    Caption = '&Consulta Part. <F4>'
    Enabled = False
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500000000000
      055557777777777775F508888888888880557F5FFFFFFFFFF75F080000000000
      88057577777777775F755080FFFFFF05088057F7FFFFFF7575F70000000000F0
      F08077777777775757F70FFFFFFFFF0F008075F5FF5FF57577F750F00F00FFF0
      F08057F775775557F7F750FFFFFFFFF0F08057FF5555555757F7000FFFFFFFFF
      0000777FF5FFFFF577770900F00000F000907F775777775777F7090FFFFFFFFF
      00907F7F555555557757000FFFFFFFFF0F00777F5FFF5FF57F77550F000F00FF
      0F05557F777577557F7F550FFFFFFFFF0005557F555FFFFF7775550FFF000000
      05555575FF777777755555500055555555555557775555555555}
    ImageIndex = 2
    NumGlyphs = 2
    Opaque = False
    Spacing = 0
  end
  inherited pnlFundo: TPanel
    Width = 753
    Height = 373
    object PgAtend: TPageControl
      Left = 1
      Top = 1
      Width = 751
      Height = 371
      ActivePage = TbShtAtend
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      HotTrack = True
      MultiLine = True
      ParentFont = False
      TabOrder = 0
      object TbShtAtend: TTabSheet
        Caption = 'Atendimento - F2'
        object Panel1: TPanel
          Left = 0
          Top = 0
          Width = 743
          Height = 118
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object Label11: TLabel
            Left = 5
            Top = 73
            Width = 156
            Height = 13
            Caption = 'Matrícula na Patrocinadora'
          end
          object Label12: TLabel
            Left = 166
            Top = 37
            Width = 198
            Height = 13
            Caption = 'Inscrição em  Plano Previdenciário'
          end
          object Label7: TLabel
            Left = 5
            Top = 0
            Width = 192
            Height = 13
            Caption = 'Nome do Elegível ou Participante'
          end
          object Label8: TLabel
            Left = 412
            Top = 0
            Width = 24
            Height = 13
            Caption = 'CPF'
          end
          object Label39: TLabel
            Left = 166
            Top = 73
            Width = 80
            Height = 13
            Caption = 'Patrocinadora'
          end
          object TLabel
            Left = 378
            Top = 37
            Width = 33
            Height = 13
            Caption = 'Plano'
          end
          object TLabel
            Left = 5
            Top = 37
            Width = 129
            Height = 13
            Caption = 'Situação na Fundação'
          end
          object edmat: TEdit
            Left = 5
            Top = 89
            Width = 156
            Height = 21
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
          object edcpf: TEdit
            Left = 412
            Top = 16
            Width = 156
            Height = 21
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
          end
          object edinsc: TEdit
            Left = 167
            Top = 51
            Width = 206
            Height = 21
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 2
          end
          object edPlano: TEdit
            Left = 378
            Top = 51
            Width = 191
            Height = 21
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 3
          end
          object ednome: TEdit
            Left = 5
            Top = 16
            Width = 402
            Height = 21
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 4
          end
          object edPatro: TEdit
            Left = 166
            Top = 89
            Width = 404
            Height = 21
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 5
          end
          object BtnConsultaAtendimento: TBitBtn
            Left = 657
            Top = 7
            Width = 79
            Height = 59
            Caption = 'Cons Atend'
            TabOrder = 6
            OnClick = BtnConsultaAtendimentoClick
            Glyph.Data = {
              76020000424D7602000000000000760000002800000020000000200000000100
              0400000000000002000000000000000000001000000010000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
              7777777777777777777777800000000000077777777777777777770B7B7B7B7B
              7B3077777777777777777707B7B7B7B7B7330777777777777777770B7B7B7B7B
              7B333077777777777777770FFFFFFFFFFF3330777777777777777707B7B0B0B0
              B7B3307000007777777777707B7B0B0B7B733009999907777777780007B0B0B0
              B7B700089999077777777033307B7B7B7B70333099990777777770FB30B00000
              0703333099990777777770BF307033330B03BF30999907777777770BF3007BFB
              300BFB0000007777777777700FBFBFBFBFBF8009999907777777777770000000
              0000779999990777777777777777777777777799999990777777777777777777
              7777770999999907777777777777777777777770999999907777777777777777
              7000007709999999077777777777777709999907709999999077777777777777
              0999999077099999907777777777777709999999009999999077777777777777
              7099999999999999907777777777777770999999999999990777777777777777
              7709999999999990777777777777777777700999999990077777777777777777
              7777700000000777777777777777777777777777777777777777777777777777
              7777777777777777777777777777777777777777777777777777777777777777
              7777777777777777777777777777777777777777777777777777}
            Layout = blGlyphTop
          end
          object bb_procparticipante: TBitBtn
            Left = 573
            Top = 7
            Width = 79
            Height = 60
            Caption = 'Pessoa'
            TabOrder = 7
            OnClick = bb_procparticipanteClick
            Glyph.Data = {
              56020000424D56020000000000007600000028000000200000001E0000000100
              040000000000E001000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888800800888
              8880080088888008008888800000008888800000888880303088888077077088
              88806060888003B0B30088807707708888806060888011111110888077077088
              8880606088801111111088807707708888806060888801111108888077077088
              8880606088880111110888807707708888006060088801111108888077077088
              80B06660B080B01110B08880770770888030FFF0308030111030888077077088
              80B0FFF0B080B01110B08800777770088030FFF030803011103080B0777770B0
              80FFFFFFF080F1FFF1F000000030000000FFFFFFF080F1FFF1F007707FFF7077
              0800000008880000000807707FCF70770888888888888888888807707FCF7077
              0888000888870700070707707FCF707708803B308888703B307807707FCF7077
              0880B3B0888870B3B07807707FCF707708803B308888803B308807777F6F7777
              0881111111888800088807777FCF777708881118888888777888800000000000
              8888888888888888888888888888888888888888888888888888888880008888
              88888888888888888888888803B308888888888888888888888888880B3B0888
              88888888888888888888888803B3088888888888888888888888888880008888
              8888888888888888888888888888888888888888888888888888}
            Layout = blGlyphTop
          end
          object GpAnteiror: TGroupBox
            Left = 574
            Top = 69
            Width = 163
            Height = 44
            Caption = ' Atendimento Anterior '
            TabOrder = 8
            object edcod: TEdit
              Left = 11
              Top = 15
              Width = 94
              Height = 21
              TabStop = False
              Color = clGray
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
            end
            object edseque: TEdit
              Left = 111
              Top = 15
              Width = 41
              Height = 21
              TabStop = False
              Color = clGray
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
            end
          end
          object EdtSitCad: TEdit
            Left = 5
            Top = 52
            Width = 156
            Height = 21
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 9
          end
          object DBEdit1: TDBEdit
            Left = 312
            Top = 128
            Width = 84
            Height = 21
            DataField = 'EXISTERAD'
            DataSource = DsAssuntoxAtend
            TabOrder = 10
          end
        end
        object PageDadosAssunto: TPageControl
          Left = 0
          Top = 118
          Width = 743
          Height = 225
          ActivePage = TbDadosAtend
          Align = alClient
          HotTrack = True
          TabOrder = 1
          object TbDadosAtend: TTabSheet
            Caption = 'Dados Atendimento - Alt + F7'
            object Label1: TLabel
              Left = 388
              Top = 110
              Width = 55
              Height = 13
              Caption = 'Data  Fim'
            end
            object Label3: TLabel
              Left = 4
              Top = 110
              Width = 127
              Height = 13
              Caption = 'Forma de Atendimento'
            end
            object Label5: TLabel
              Left = 236
              Top = -2
              Width = 63
              Height = 13
              Caption = 'Atendente '
            end
            object Label6: TLabel
              Left = 619
              Top = 110
              Width = 55
              Height = 13
              Caption = 'Hora  Fim'
            end
            object Label2: TLabel
              Left = 4
              Top = 35
              Width = 115
              Height = 13
              Caption = 'Nome do Solicitante'
            end
            object Label10: TLabel
              Left = 628
              Top = 72
              Width = 51
              Height = 13
              Caption = 'Telefone'
            end
            object Label9: TLabel
              Left = 4
              Top = 0
              Width = 132
              Height = 13
              Caption = 'Código do Atendimento'
            end
            object Label17: TLabel
              Left = 147
              Top = -1
              Width = 61
              Height = 13
              Caption = 'Sequência'
            end
            object Label28: TLabel
              Left = 273
              Top = 110
              Width = 69
              Height = 13
              Caption = 'Data  Início'
            end
            object Label40: TLabel
              Left = 503
              Top = 110
              Width = 69
              Height = 13
              Caption = 'Hora  Início'
            end
            object Label20: TLabel
              Left = 336
              Top = 35
              Width = 183
              Height = 13
              Caption = 'Endereço para Correspondência'
            end
            object Label21: TLabel
              Left = 4
              Top = 72
              Width = 44
              Height = 13
              Caption = 'Número'
            end
            object Label22: TLabel
              Left = 56
              Top = 72
              Width = 76
              Height = 13
              Caption = 'Complemento'
            end
            object Label23: TLabel
              Left = 138
              Top = 72
              Width = 34
              Height = 13
              Caption = 'Bairro'
            end
            object Label24: TLabel
              Left = 542
              Top = 72
              Width = 25
              Height = 13
              Caption = 'CEP'
            end
            object Label26: TLabel
              Left = 336
              Top = 72
              Width = 40
              Height = 13
              Caption = 'Cidade'
            end
            object Label30: TLabel
              Left = 645
              Top = -1
              Width = 51
              Height = 13
              Caption = 'Situação'
            end
            object Label4: TLabel
              Left = 494
              Top = 72
              Width = 17
              Height = 13
              Caption = 'UF'
            end
            object eddlghora: TcmMaskEditDlg
              Left = 619
              Top = 126
              Width = 109
              Height = 21
              ReadOnly = True
              TabOrder = 13
              BtnGlyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                3333333333FFFFF3333333333700000733333333F777773FF3333333007F0F70
                0333333773373377FF3333300FFF7FFF003333773F3333377FF33300F0FFFFF0
                F00337737333F37377F33707FFFF0FFFF70737F33337F33337FF300FFFFF0FFF
                FF00773F3337F333377F30707FFF0FFF70707F733337F333737F300FFFF09FFF
                FF0077F33377F33337733707FF0F9FFFF70737FF3737F33F37F33300F0FF9FF0
                F003377F7337F373773333300FFF9FFF00333377FF37F3377FF33300007F9F70
                000337777FF7FF77773333703070007030733373777777737333333333330333
                333333333337FF33333333333330003333333333337773333333}
              BtnNumGlyphs = 2
              BtnWidth = 17
            end
            object eddlghorainicio: TcmMaskEditDlg
              Left = 503
              Top = 126
              Width = 109
              Height = 21
              ReadOnly = True
              TabOrder = 12
              BtnGlyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                3333333333FFFFF3333333333700000733333333F777773FF3333333007F0F70
                0333333773373377FF3333300FFF7FFF003333773F3333377FF33300F0FFFFF0
                F00337737333F37377F33707FFFF0FFFF70737F33337F33337FF300FFFFF0FFF
                FF00773F3337F333377F30707FFF0FFF70707F733337F333737F300FFFF09FFF
                FF0077F33377F33337733707FF0F9FFFF70737FF3737F33F37F33300F0FF9FF0
                F003377F7337F373773333300FFF9FFF00333377FF37F3377FF33300007F9F70
                000337777FF7FF77773333703070007030733373777777737333333333330333
                333333333337FF33333333333330003333333333337773333333}
              BtnNumGlyphs = 2
              BtnWidth = 17
            end
            object edtLogradouro: TwwDBEdit
              Left = 336
              Top = 50
              Width = 393
              Height = 21
              DataField = 'LOGRADOURO'
              DataSource = ds
              TabOrder = 4
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object edtNumero: TwwDBEdit
              Left = 4
              Top = 87
              Width = 49
              Height = 21
              DataField = 'NUMEROSOLIC'
              DataSource = ds
              TabOrder = 5
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object edtComplem: TwwDBEdit
              Left = 55
              Top = 87
              Width = 81
              Height = 21
              DataField = 'COMPLEMSOLIC'
              DataSource = ds
              TabOrder = 6
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object edtbairro: TwwDBEdit
              Left = 138
              Top = 87
              Width = 197
              Height = 21
              DataField = 'BAIRROSOLIC'
              DataSource = ds
              TabOrder = 7
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object edtcep: TwwDBEdit
              Left = 542
              Top = 87
              Width = 84
              Height = 21
              DataField = 'CEPSOLIC'
              DataSource = ds
              TabOrder = 8
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dbednomesol: TwwDBEdit
              Left = 4
              Top = 50
              Width = 331
              Height = 21
              DataField = 'NOMESOLICITANTE'
              DataSource = ds
              TabOrder = 3
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dbedtel: TwwDBEdit
              Left = 628
              Top = 87
              Width = 100
              Height = 21
              DataField = 'TELSOLICITANTE'
              DataSource = ds
              TabOrder = 9
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dbdateInicio: TCMDateTimePicker
              Left = 273
              Top = 126
              Width = 109
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATAINICIO'
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
              TabOrder = 10
              UnboundDataType = wwDTEdtDate
            end
            object dbdateFim: TCMDateTimePicker
              Left = 388
              Top = 126
              Width = 109
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATA'
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
              TabOrder = 11
              UnboundDataType = wwDTEdtDate
            end
            object edseq: TwwDBEdit
              Left = 146
              Top = 15
              Width = 86
              Height = 21
              TabStop = False
              Color = clGray
              DataField = 'COMPLCODATEND'
              DataSource = ds
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object ednum: TwwDBEdit
              Left = 4
              Top = 15
              Width = 138
              Height = 21
              TabStop = False
              Color = clGray
              DataField = 'CODATEND'
              DataSource = ds
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dbedatend: TEdit
              Left = 236
              Top = 14
              Width = 404
              Height = 21
              Color = clGray
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 2
            end
            object wwDBEdit3: TwwDBEdit
              Left = 644
              Top = 15
              Width = 86
              Height = 21
              TabStop = False
              Color = clGray
              DataField = 'STATUS'
              DataSource = ds
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 14
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object edtuf: TwwDBEdit
              Left = 504
              Top = 88
              Width = 33
              Height = 21
              DataField = 'CODESTADOSOLIC'
              DataSource = ds
              TabOrder = 15
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
              OnExit = edtufExit
            end
            object dblkCidade: TwwDBLookupCombo
              Left = 339
              Top = 87
              Width = 157
              Height = 21
              DropDownAlignment = taLeftJustify
              DataField = 'CIDADESOLIC'
              DataSource = ds
              LookupTable = qryCidades
              LookupField = 'NOME'
              TabOrder = 16
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
            object dblkTipoAtendimento: TwwDBLookupCombo
              Left = 5
              Top = 126
              Width = 263
              Height = 21
              DropDownAlignment = taLeftJustify
              LookupTable = qryTipoAtend
              LookupField = 'NOME'
              TabOrder = 17
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
            object EDIDPLANOPREV: TEdit
              Left = 112
              Top = 160
              Width = 121
              Height = 21
              TabOrder = 18
              Text = 'EDIDPLANOPREV'
              Visible = False
            end
          end
          object TbsAssuntos: TTabSheet
            Caption = 'Assunto(s) - Alt + F8'
            object PnlAssunto: TPanel
              Left = 0
              Top = 31
              Width = 735
              Height = 166
              Align = alClient
              BevelOuter = bvLowered
              TabOrder = 0
              object Bevel3: TBevel
                Left = 11
                Top = 40
                Width = 221
                Height = 49
                Shape = bsFrame
              end
              object assunto: TLabel
                Left = 20
                Top = 35
                Width = 54
                Height = 13
                Caption = ' Assunto '
              end
              object Label27: TLabel
                Left = 241
                Top = 9
                Width = 98
                Height = 13
                Caption = 'Resposta Padrão'
              end
              object Bevel1: TBevel
                Left = 11
                Top = 7
                Width = 221
                Height = 26
                Shape = bsFrame
              end
              object Bevel2: TBevel
                Left = 11
                Top = 94
                Width = 221
                Height = 26
                Shape = bsFrame
              end
              object ReResposta: TwwDBRichEdit
                Left = 240
                Top = 25
                Width = 401
                Height = 95
                ScrollBars = ssVertical
                AutoURLDetect = False
                Color = clGray
                DataField = 'DESCRESPATEN'
                DataSource = DsAssuntoxAtend
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                HideScrollBars = False
                ParentFont = False
                PrintJobName = 'Delphi 5'
                ReadOnly = True
                TabOrder = 2
                PopupOptions = []
                EditorOptions = [reoShowPageSetup, reoShowFormatBar, reoShowToolBar, reoShowStatusBar, reoShowHints, reoCloseOnEscape]
                EditorCaption = 'Resposta Padrâo'
                EditorPosition.Left = 0
                EditorPosition.Top = 0
                EditorPosition.Width = 0
                EditorPosition.Height = 0
                MeasurementUnits = muInches
                PrintMargins.Top = 1
                PrintMargins.Bottom = 1
                PrintMargins.Left = 1
                PrintMargins.Right = 1
                RichEditVersion = 2
                Data = {
                  B40000007B5C727466315C616E73695C616E7369637067313235325C64656666
                  305C6465666C616E67313033337B5C666F6E7474626C7B5C66305C6673776973
                  73204D532053616E732053657269663B7D7D0D0A7B5C636F6C6F7274626C203B
                  5C7265643235355C677265656E3235355C626C75653235353B7D0D0A5C766965
                  776B696E64345C7563315C706172645C6366315C625C66305C66733134205265
                  526573706F7374615C7061720D0A5C7061720D0A7D0D0A00}
              end
              object DBCheckBox1: TDBCheckBox
                Left = 21
                Top = 99
                Width = 105
                Height = 17
                Caption = 'Gera Processo'
                DataField = 'EXISTERAD'
                DataSource = DsAssuntoxAtend
                ReadOnly = True
                TabOrder = 0
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
              object DBCheckBox2: TDBCheckBox
                Left = 132
                Top = 99
                Width = 93
                Height = 17
                Hint = 'Requisição Única de Benefícos e Serviços'
                Caption = 'Gera RUBS'
                DataField = 'EXISTERUB'
                DataSource = DsAssuntoxAtend
                ParentShowHint = False
                ReadOnly = True
                ShowHint = True
                TabOrder = 1
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
              object Dock974: TDock97
                Left = 649
                Top = 1
                Width = 85
                Height = 164
                AllowDrag = False
                BoundLines = [blLeft]
                Position = dpRight
                object tb97Detalhe: TToolbar97
                  Left = 0
                  Top = 0
                  Caption = 'tb97Detalhe'
                  DockPos = 0
                  TabOrder = 0
                  object bbtnOkDet: TBitBtn
                    Left = 0
                    Top = 0
                    Width = 80
                    Height = 27
                    Caption = '&OK'
                    TabOrder = 0
                    OnClick = bbtnOkDetClick
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
                  end
                  object bbtnCancelarDet: TBitBtn
                    Tag = 9
                    Left = 0
                    Top = 27
                    Width = 80
                    Height = 27
                    Cancel = True
                    Caption = '&Cancelar'
                    TabOrder = 1
                    OnClick = bbtnCancelarDetClick
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
                  end
                  object bbtnVoltarDet: TBitBtn
                    Tag = 9
                    Left = 0
                    Top = 54
                    Width = 80
                    Height = 27
                    Cancel = True
                    Caption = '&Voltar'
                    TabOrder = 2
                    OnClick = bbtnVoltarDetClick
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
              object ProcuraAssunto: TCMProcura
                Left = 20
                Top = 54
                Width = 205
                Height = 27
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                MostraMensagens = True
                Mensagens.EmBranco = 'Assunto não pode estar em branco'
                Mensagens.NaoExiste = 'Assunto não existe'
                PermiteChaveInvalida = False
                PermiteChaveEmBranco = False
                OnApertouBotao = ProcuraAssuntoApertouBotao
                OnValidaDados = ProcuraAssuntoValidaDados
                DataSource = DsAssuntoxAtend
                DataField = 'IDASSUNTO'
                LookupChave = 'IDASSUNTO'
                LookupDescricao = 'NOME'
                MontaSelect = MsAssunto
                LookupTabela = 'CM.ASSUNTO'
                DataBaseName = 'BaseDados'
                ReadOnly = False
              end
              object CkbFiltraPlano: TCheckBox
                Left = 38
                Top = 13
                Width = 165
                Height = 15
                Caption = 'Filtra Assuntos Por Plano'
                TabOrder = 5
                OnClick = CkbFiltraPlanoClick
              end
            end
            object PnlAssuntoAtend: TPanel
              Left = 0
              Top = 31
              Width = 735
              Height = 166
              Align = alClient
              TabOrder = 2
              object Splitter5: TSplitter
                Left = 494
                Top = 1
                Width = 3
                Height = 164
                Cursor = crHSplit
              end
              object GrdAssunto: TwwDBGrid
                Left = 1
                Top = 1
                Width = 493
                Height = 164
                Selected.Strings = (
                  'NOME'#9'38'#9'Assunto'
                  'EXISTERAD'#9'4'#9'RAD'
                  'EXISTERUB'#9'4'#9'RUB'
                  'IDPROCESSO'#9'8'#9'Num. RAD'
                  'IDRUB'#9'9'#9'Num. RUBS')
                IniAttributes.Delimiter = ';;'
                TitleColor = clBtnFace
                FixedCols = 0
                ShowHorzScrollBar = True
                Align = alLeft
                DataSource = DsAssuntoxAtend
                Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
                TabOrder = 0
                TitleAlignment = taLeftJustify
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -9
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = [fsBold]
                TitleLines = 1
                TitleButtons = False
                UseTFields = False
                IndicatorColor = icBlack
              end
              object ReRespostaAux: TwwDBRichEdit
                Left = 497
                Top = 1
                Width = 237
                Height = 164
                ScrollBars = ssVertical
                Align = alClient
                AutoURLDetect = False
                Color = clGray
                DataField = 'DESCRESPATEN'
                DataSource = DsAssuntoxAtend
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                HideScrollBars = False
                ParentFont = False
                PrintJobName = 'Delphi 5'
                ReadOnly = True
                TabOrder = 1
                PopupOptions = []
                EditorOptions = [reoShowHints, reoCloseOnEscape]
                EditorCaption = 'Resposta Padrâo'
                EditorPosition.Left = 0
                EditorPosition.Top = 0
                EditorPosition.Width = 0
                EditorPosition.Height = 0
                MeasurementUnits = muInches
                PrintMargins.Top = 1
                PrintMargins.Bottom = 1
                PrintMargins.Left = 1
                PrintMargins.Right = 1
                RichEditVersion = 2
                Data = {
                  B40000007B5C727466315C616E73695C616E7369637067313235325C64656666
                  305C6465666C616E67313033337B5C666F6E7474626C7B5C66305C6673776973
                  73204D532053616E732053657269663B7D7D0D0A7B5C636F6C6F7274626C203B
                  5C7265643235355C677265656E3235355C626C75653235353B7D0D0A5C766965
                  776B696E64345C7563315C706172645C6366315C625C66305C66733134205265
                  526573706F7374615C7061720D0A5C7061720D0A7D0D0A00}
              end
            end
            object Dock973: TDock97
              Left = 0
              Top = 0
              Width = 735
              Height = 31
              AllowDrag = False
              BoundLines = [blTop, blBottom, blLeft, blRight]
              object LblAssunto: TLabel
                Left = 109
                Top = 6
                Width = 241
                Height = 16
                Caption = 'Assuntos Do Atendimento Corrente'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object tb97BotoesDetalhe: TToolbar97
                Left = 0
                Top = 0
                DockPos = 0
                TabOrder = 0
                object sbtnInsDet: TSpeedButton
                  Left = 0
                  Top = 0
                  Width = 25
                  Height = 25
                  Hint = 'Inserir novo registro|'
                  AllowAllUp = True
                  Glyph.Data = {
                    76010000424D7601000000000000760000002800000020000000100000000100
                    0400000000000001000000000000000000001000000010000000000000000000
                    800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
                    333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
                    0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
                    07333337F33333337F333330FFFFFFFF07333337F33333337F333330FFFFFFFF
                    07333FF7F33333337FFFBBB0FFFFFFFF0BB37777F3333333777F3BB0FFFFFFFF
                    0BBB3777F3333FFF77773330FFFF000003333337F333777773333330FFFF0FF0
                    33333337F3337F37F3333330FFFF0F0B33333337F3337F77FF333330FFFF003B
                    B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
                    3BB33773333773333773B333333B3333333B7333333733333337}
                  Layout = blGlyphTop
                  NumGlyphs = 2
                  ParentShowHint = False
                  ShowHint = True
                  Spacing = 0
                  OnClick = sbtnInsDetClick
                end
                object sbtnExcluiDet: TSpeedButton
                  Left = 25
                  Top = 0
                  Width = 25
                  Height = 25
                  Hint = 'Remover o registro selecionado|'
                  AllowAllUp = True
                  Glyph.Data = {
                    76010000424D7601000000000000760000002800000020000000100000000100
                    0400000000000001000000000000000000001000000010000000000000000000
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
                  Layout = blGlyphTop
                  NumGlyphs = 2
                  ParentShowHint = False
                  ShowHint = True
                  Spacing = 0
                  OnClick = sbtnExcluiDetClick
                end
                object BtnGetResposta: TBitBtn
                  Left = 50
                  Top = 0
                  Width = 25
                  Height = 25
                  Hint = 'Consulta Respostas'
                  Enabled = False
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 0
                  OnClick = BtnGetRespostaClick
                  Glyph.Data = {
                    F6000000424DF600000000000000760000002800000010000000100000000100
                    0400000000008000000000000000000000001000000010000000000000000000
                    8000008000000080800080000000800080008080000080808000C0C0C0000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                    88888000000000008888878888888880888887FFFFFFFF80008887F666666F80
                    110887FFFFFFFF01911087F666666F09191087FFFFFFFF80911087F66FFFFF80
                    990887FFFF00FF09910887F6F0110099108887FF09999991088887FF09999910
                    8888877770999008888888888800088888888888888888888888}
                end
                object BtnAtendAnt: TBitBtn
                  Left = 75
                  Top = 0
                  Width = 25
                  Height = 25
                  Hint = 'Dados Do Atendimento Anterior'
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 1
                  OnClick = BtnAtendAntClick
                  Glyph.Data = {
                    76010000424D7601000000000000760000002800000020000000100000000100
                    0400000000000001000000000000000000001000000010000000000000000000
                    8000008000000080800080000000800080008080000080808000C0C0C0000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                    8888888888FFFFF8888888888000008888888888F777778FF888888005555500
                    88888887788888778F8888755555555508888878888888F878F887D555555F55
                    508887F888F8878F87F887D58F55FFF55088878887F87778F78F7D558F5FFFFF
                    55087F8887F77777887F7D558F555F8555087F8887F887F8887F7D558F555F85
                    55087F88F7FFF7F8887F7D5FFFFF5F8555087F87777787F8887F7D55FFF55F85
                    550878F877788788887887D55F555555508887F88788888887F887D555555555
                    5088878F888888888788887DD555555508888878FF88888F788888877DDDDD77
                    8888888778FFFF77888888888777778888888888877777888888}
                  NumGlyphs = 2
                end
              end
            end
          end
          object TbsGeral: TTabSheet
            Caption = 'Geral - Alt + F9'
            object Observacao: TLabel
              Left = 365
              Top = -1
              Width = 54
              Height = 13
              Caption = 'Resposta'
            end
            object Label25: TLabel
              Left = 5
              Top = 0
              Width = 52
              Height = 13
              Caption = 'Pergunta'
            end
            object Label29: TLabel
              Left = 5
              Top = 75
              Width = 75
              Height = 13
              Caption = 'Observações'
            end
            object MemResposta: TwwDBRichEdit
              Left = 364
              Top = 15
              Width = 362
              Height = 136
              AutoURLDetect = False
              DataField = 'RESPOSTA'
              DataSource = ds
              MaxLength = 250
              PrintJobName = 'Delphi 5'
              TabOrder = 1
              EditorCaption = 'Edit Rich Text'
              EditorPosition.Left = 0
              EditorPosition.Top = 0
              EditorPosition.Width = 0
              EditorPosition.Height = 0
              MeasurementUnits = muInches
              PrintMargins.Top = 1
              PrintMargins.Bottom = 1
              PrintMargins.Left = 1
              PrintMargins.Right = 1
              RichEditVersion = 2
              Data = {
                810000007B5C727466315C616E73695C616E7369637067313235325C64656666
                305C6465666C616E67313034367B5C666F6E7474626C7B5C66305C666E696C20
                4D532053616E732053657269663B7D7D0D0A5C766965776B696E64345C756331
                5C706172645C625C66305C66733134204D656D526573706F7374615C7061720D
                0A7D0D0A00}
            end
            object MenPergunta: TwwDBRichEdit
              Left = 5
              Top = 16
              Width = 351
              Height = 56
              AutoURLDetect = False
              DataField = 'PERGUNTA'
              DataSource = ds
              MaxLength = 250
              PrintJobName = 'Delphi 5'
              TabOrder = 0
              EditorCaption = 'Edit Rich Text'
              EditorPosition.Left = 0
              EditorPosition.Top = 0
              EditorPosition.Width = 0
              EditorPosition.Height = 0
              MeasurementUnits = muInches
              PrintMargins.Top = 1
              PrintMargins.Bottom = 1
              PrintMargins.Left = 1
              PrintMargins.Right = 1
              RichEditVersion = 2
              Data = {
                810000007B5C727466315C616E73695C616E7369637067313235325C64656666
                305C6465666C616E67313034367B5C666F6E7474626C7B5C66305C666E696C20
                4D532053616E732053657269663B7D7D0D0A5C766965776B696E64345C756331
                5C706172645C625C66305C66733134204D656E50657267756E74615C7061720D
                0A7D0D0A00}
            end
            object MemObs: TwwDBRichEdit
              Left = 2
              Top = 90
              Width = 352
              Height = 60
              AutoURLDetect = False
              DataField = 'OBSERVACAO'
              DataSource = ds
              MaxLength = 250
              PrintJobName = 'Delphi 5'
              TabOrder = 2
              EditorCaption = 'Edit Rich Text'
              EditorPosition.Left = 0
              EditorPosition.Top = 0
              EditorPosition.Width = 0
              EditorPosition.Height = 0
              MeasurementUnits = muInches
              PrintMargins.Top = 1
              PrintMargins.Bottom = 1
              PrintMargins.Left = 1
              PrintMargins.Right = 1
              RichEditVersion = 2
              Data = {
                7C0000007B5C727466315C616E73695C616E7369637067313235325C64656666
                305C6465666C616E67313034367B5C666F6E7474626C7B5C66305C666E696C20
                4D532053616E732053657269663B7D7D0D0A5C766965776B696E64345C756331
                5C706172645C625C66305C66733134204D656D4F62735C7061720D0A7D0D0A00}
            end
          end
          object tbsTelefone: TTabSheet
            Caption = 'Telefone - Alt + F13'
            object TLabel
              Left = 48
              Top = 32
              Width = 5
              Height = 13
            end
            object Label38: TLabel
              Left = 48
              Top = 24
              Width = 23
              Height = 13
              Caption = 'DDI'
            end
            object Label41: TLabel
              Left = 48
              Top = 56
              Width = 28
              Height = 13
              Caption = 'DDD'
            end
            object Label42: TLabel
              Left = 48
              Top = 88
              Width = 98
              Height = 13
              Caption = 'Tipo de Telefone'
            end
            object Label31: TLabel
              Left = 48
              Top = 128
              Width = 44
              Height = 13
              Caption = 'Numero'
            end
            object edtDDI: TwwDBEdit
              Left = 168
              Top = 16
              Width = 49
              Height = 21
              DataField = 'DDISOLIC'
              DataSource = ds
              TabOrder = 0
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object edtDDD: TwwDBEdit
              Left = 168
              Top = 56
              Width = 49
              Height = 21
              DataField = 'DDDSOLIC'
              DataSource = ds
              TabOrder = 1
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object edtTipoTelefone: TwwDBEdit
              Left = 168
              Top = 88
              Width = 49
              Height = 21
              DataField = 'TIPOSOLIC'
              DataSource = ds
              TabOrder = 2
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object edtNumeroTelefone: TwwDBEdit
              Left = 168
              Top = 128
              Width = 121
              Height = 21
              DataField = 'NUMEROTELSOLIC'
              DataSource = ds
              TabOrder = 3
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
          end
          object TabSheet2: TTabSheet
            Caption = 'Datas Benefícios - Alt+F15'
            ImageIndex = 4
            object Label49: TLabel
              Left = 24
              Top = 16
              Width = 100
              Height = 13
              Caption = 'Data De Evento :'
            end
            object Label50: TLabel
              Left = 80
              Top = 64
              Width = 30
              Height = 13
              Caption = 'DIB :'
            end
            object Label51: TLabel
              Left = 16
              Top = 112
              Width = 112
              Height = 13
              Caption = 'Data de Demissão :'
            end
            object Label52: TLabel
              Left = 304
              Top = 16
              Width = 132
              Height = 13
              Caption = 'Data de Requerimento:'
            end
            object Label53: TLabel
              Left = 352
              Top = 112
              Width = 292
              Height = 13
              Caption = 'Obs: Se não for informado a Data Correspondente ,'
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object Label54: TLabel
              Left = 376
              Top = 128
              Width = 177
              Height = 13
              Caption = 'o sistema assumirar a corrente.'
              Color = clCaptionText
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object Label55: TLabel
              Left = 296
              Top = 72
              Width = 137
              Height = 13
              Caption = 'Numero de Beneficiário:'
            end
            object dbDataDib: TCMDateTimePicker
              Left = 136
              Top = 56
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
            object dbdatademissao: TCMDateTimePicker
              Left = 136
              Top = 104
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
              TabOrder = 1
            end
            object dbdatarequerimento: TCMDateTimePicker
              Left = 448
              Top = 8
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
            object dbDataEvento: TCMDateTimePicker
              Left = 136
              Top = 8
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
              TabOrder = 3
            end
            object bbnumerobeneficiario: TMaskEdit
              Left = 448
              Top = 64
              Width = 17
              Height = 21
              EditMask = '99;1;_'
              MaxLength = 2
              TabOrder = 4
              Text = '  '
            end
          end
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 753
    object TbbconsultaParticip1: TToolbarButton97 [0]
      Left = 282
      Top = 0
      Width = 159
      Height = 49
      AllowAllUp = True
      GroupIndex = 1
      Caption = '&Consulta Participante'
      Enabled = False
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500000000000
        055557777777777775F508888888888880557F5FFFFFFFFFF75F080000000000
        88057577777777775F755080FFFFFF05088057F7FFFFFF7575F70000000000F0
        F08077777777775757F70FFFFFFFFF0F008075F5FF5FF57577F750F00F00FFF0
        F08057F775775557F7F750FFFFFFFFF0F08057FF5555555757F7000FFFFFFFFF
        0000777FF5FFFFF577770900F00000F000907F775777775777F7090FFFFFFFFF
        00907F7F555555557757000FFFFFFFFF0F00777F5FFF5FF57F77550F000F00FF
        0F05557F777577557F7F550FFFFFFFFF0005557F555FFFFF7775550FFF000000
        05555575FF777777755555500055555555555557775555555555}
      ImageIndex = 2
      NumGlyphs = 2
      Opaque = False
      Spacing = 0
      OnClick = ToolbarButton971Click
    end
    object ConsPart1: TConsPart [1]
      Left = 248
      Top = 12
      Width = 33
      Height = 33
      Glyph.Data = {
        96010000424D9601000000000000760000002800000018000000180000000100
        0400000000002001000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00188888880FFF
        F0FFF0FF073888888880FFFFFF0FFFF073808888880FFFFFFFF0FF07380F8888
        80FFFF000000807380FF88880FF00000000007380FFF8880FF00000000000380
        FF0F880FF00077FFF8877030FFF080FFF00E8FF888888700FFFF0FFF00EEF888
        87477870F0FF80FF0EFF8888887477870F0F880F0EF88888888747870FF08880
        0EF88888888748870FFF88880E888F8888787F870FFF88880E888FF8888F8F87
        0FFF88880E788EFEFFF8F870FFFF888887E788FFEF8F87E0FFF08888807E7888
        FF887E0FFF0888888807E777777EE0FFF0888888888007E7E7E00FFF08888888
        88888000000FFFF088888888888888880FFFFF08888888888888888880FFF088
        8888888888888888880F08888888888888888888888088888888}
      Visible = False
    end
    inherited Toolbar971: TToolbar97
      Left = 24
      DockPos = 24
      inherited sbtnInserir: TToolbarButton97
        Width = 92
        Caption = '&Atender'
        Glyph.Data = {
          76020000424D7602000000000000760000002800000020000000200000000100
          0400000000000002000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7777777777777777777777800000000000077777777777777777770B7B7B7B7B
          7B3077777777777777777707B7B7B7B7B7330777777777777777770B7B7B7B7B
          7B333077777777777777770FFFFFFFFFFF3330777777777777777707B7B0B0B0
          B7B3307777777777777777707B7B0B0B7B733077777777777777780007B0B0B0
          B7B700087777777777777033307B7B7B7B70333077777777777770FB30B00000
          0703333077777777777770BF307033330B03BF30000077777777770BF3007BFB
          300BFB0191907777777777700FBFBFBFBFBF8019191077777777777770000000
          0000799191907777777777777777777777777919191077777777777777777777
          7777799191907777777777777777777900000019191000000077777777777779
          9191919191919191907777777777777919191919191919191077777777777779
          9191919191919191907777777777777919191919191919191077777777777779
          9191919191919191907777777777777999999919191099999077777777777777
          7777799191907777777777777777777777777919191077777777777777777777
          7777799191907777777777777777777777777919191077777777777777777777
          7777799191907777777777777777777777777999999977777777777777777777
          7777777777777777777777777777777777777777777777777777}
        Layout = blGlyphLeft
        Spacing = 3
      end
      inherited sbtnAlterar: TToolbarButton97
        Left = 257
        Visible = False
      end
      inherited sbtnProcurar: TToolbarButton97
        Left = 92
        Width = 165
        Caption = '&Atendimentos Pendentes'
        Glyph.Data = {
          76020000424D7602000000000000760000002800000020000000200000000100
          0400000000000002000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7777777777777777777777777777777777777777777777777777777777777777
          777777777777777777777777800000000000077777777777777777770B7B7B7B
          7B7B3077777777777777777707B7B7B7B7B7330777777777777777770B7B7B7B
          7B7B333077777777777777770FFFFFFFFFFF3330777777777777777707B7B0B0
          B0B7B3307000007777777777707B7B0B0B7B733009999907777777780007B0B0
          B0B7B700089999077777777033307B7B7B7B70333099990777777770FB30B000
          000703333099990777777770BF307033330B03BF30999907777777770BF3007B
          FB300BFB0000007777777777700FBFBFBFBFBF80099999077777777777700000
          0000007799999907777777777777777777777777999999907777777777777777
          7777777709999999077777777777777777777777709999999077777777777777
          7770000077099999990777777777777777099999077099999990777777777777
          7709999990770999999077777777777777099999990099999990777777777777
          7770999999999999999077777777777777709999999999999907777777777777
          7777099999999999907777777777777777777009999999900777777777777777
          7777777000000007777777777777777777777777777777777777777777777777
          7777777777777777777777777777777777777777777777777777}
        Layout = blGlyphLeft
        Spacing = 3
      end
      inherited sbtnApagar: TToolbarButton97
        Left = 317
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 420
    Width = 753
    inherited tb97Fundo: TToolbar97
      Left = 552
      DockPos = 552
      inherited bbtnSair: TBitBtn
        Visible = False
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 383
      DockPos = 383
      inherited bbtnCancelar: TBitBtn
        Tag = 9
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 474
    Top = 189
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 360
    Top = 53
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update ATEND'
      'set'
      '  IDATEND = :IDATEND,'
      '  IDTIPOATEND = :IDTIPOATEND,'
      '  CODATEND = :CODATEND,'
      '  DATA = :DATA,'
      '  NOMESOLICITANTE = :NOMESOLICITANTE,'
      '  TELSOLICITANTE = :TELSOLICITANTE,'
      '  CODATENDENTE = :CODATENDENTE,'
      '  RESPOSTA = :RESPOSTA,'
      '  STATUS = :STATUS,'
      '  OBSERVACAO = :OBSERVACAO,'
      '  IDTITULAR = :IDTITULAR,'
      '  IDPESSJUR = :IDPESSJUR,'
      '  DATAINICIO = :DATAINICIO,'
      '  LOGRADOURO = :LOGRADOURO,'
      '  NUMEROSOLIC = :NUMEROSOLIC,'
      '  COMPLEMSOLIC = :COMPLEMSOLIC,'
      '  BAIRROSOLIC = :BAIRROSOLIC,'
      '  CEPSOLIC = :CEPSOLIC,'
      '  CIDADESOLIC = :CIDADESOLIC,'
      '  COMPLCODATEND = :COMPLCODATEND,'
      '  IDLOCALATENDXCPU = :IDLOCALATENDXCPU,'
      '  PERGUNTA = :PERGUNTA'
      'where'
      '  IDATEND = :OLD_IDATEND')
    InsertSQL.Strings = (
      'insert into ATEND'
      
        '  (IDATEND, IDTIPOATEND, CODATEND, DATA, NOMESOLICITANTE, TELSOL' +
        'ICITANTE, '
      
        '   CODATENDENTE, RESPOSTA, STATUS, OBSERVACAO, IDTITULAR, IDPESS' +
        'JUR, DATAINICIO, '
      
        '   LOGRADOURO, NUMEROSOLIC, COMPLEMSOLIC, BAIRROSOLIC, CEPSOLIC,' +
        ' CIDADESOLIC, '
      '   COMPLCODATEND, IDLOCALATENDXCPU, PERGUNTA)'
      'values'
      
        '  (:IDATEND, :IDTIPOATEND, :CODATEND, :DATA, :NOMESOLICITANTE, :' +
        'TELSOLICITANTE, '
      
        '   :CODATENDENTE, :RESPOSTA, :STATUS, :OBSERVACAO, :IDTITULAR, :' +
        'IDPESSJUR, '
      
        '   :DATAINICIO, :LOGRADOURO, :NUMEROSOLIC, :COMPLEMSOLIC, :BAIRR' +
        'OSOLIC, '
      
        '   :CEPSOLIC, :CIDADESOLIC, :COMPLCODATEND, :IDLOCALATENDXCPU, :' +
        'PERGUNTA)')
    DeleteSQL.Strings = (
      'delete from ATEND'
      'where'
      '  IDATEND = :OLD_IDATEND')
    Left = 329
    Top = 45
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'ATEND.NOMESOLICITANTE'
      'TO_DATE(TO_CHAR(ATEND.DATA,'#39'DD/MM/YYYY'#39'),'#39'DD/MM/YYYY'#39')'
      'ELEGPATRO.MATRICULA'
      'PESSOA.NOME'
      'PLANPREV.NOME'
      'PARTPREVPLAN.INSCRICAONUMERO'
      'PESSOA.NUMDOCUMENTO'
      'PJ.NOME'
      'ATEND.CODATEND'
      'ATEND.COMPLCODATEND'
      'ATEND.IDATEND')
    TipodeDado.Strings = (
      'C'
      'D'
      'C'
      'C'
      'C'
      'N'
      'C'
      'C'
      'N'
      'N'
      'N')
    Descricao.Strings = (
      'Solicitante'
      'Data'
      'Matrícula'
      'Participante'
      'Plano'
      'Inscrição'
      'CPF'
      'Patrocinadora'
      'Código de Atendimento'
      'Complemento'
      'Id')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'S'
      'N'
      'N'
      'N'
      'S'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'ATEND'
      'PESSOA'
      'ELEGPATRO'
      'PARTPREVPLAN'
      'PLANPREV'
      'PESSOA PJ'
      'SITPART')
    CamposChave.Strings = (
      'PESSOA.NOME'
      'PESSOA.NUMDOCUMENTO'
      'ELEGPATRO.MATRICULA'
      'PARTPREVPLAN.INSCRICAONUMERO'
      'PLANPREV.NOME'
      'PJ.NOME'
      'ATEND.IDATEND'
      'PJ.IDPESSOA'
      'ATEND.IDTITULAR'
      'SITPART.DESCRICAO')
    Filtro.Strings = (
      'PARTPREVPLAN.IDPESSOA(+) = ELEGPATRO.IDPESSOA'
      'PARTPREVPLAN.IDPESSJUR(+) = ELEGPATRO.IDPESSJUR'
      'PARTPREVPLAN.IDPLANOPREV = PLANPREV.IDPLANOPREV'
      'ELEGPATRO.IDPESSOA = PESSOA.IDPESSOA'
      'ELEGPATRO.IDPESSJUR = PJ.IDPESSOA'
      'PESSOA.IDPESSOA = ATEND.IDTITULAR'
      'PARTPREVPLAN.IDSITPART = SITPART.IDSITPART(+)'
      'ATEND.STATUS = '#39'Pendente'#39)
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
      '60'
      '10'
      '13'
      '60'
      '50'
      '10'
      '18'
      '60'
      '10'
      '10'
      '10')
    Left = 504
    Top = 29
  end
  inherited ImlPadrao: TImageList
    Left = 377
    Top = 86
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 230
    Top = 82
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      
        ' A.IDATEND, A.IDTIPOATEND, A.CODATEND, A.DATA, A.NOMESOLICITANTE' +
        ','
      
        ' A.TELSOLICITANTE, A.CODATENDENTE, A.RESPOSTA, A.STATUS, A.OBSER' +
        'VACAO, A.IDTITULAR,'
      
        ' A.IDPESSJUR, A.DATAINICIO, A.LOGRADOURO, A.NUMEROSOLIC, A.COMPL' +
        'EMSOLIC, A.BAIRROSOLIC,'
      
        ' A.CEPSOLIC, A.CIDADESOLIC, A.COMPLCODATEND, A.IDLOCALATENDXCPU,' +
        ' A.PERGUNTA, A.IDESTADO,'
      
        ' A.DDISOLIC,A.DDDSOLIC,A.TIPOSOLIC,A.NUMEROTELSOLIC ,A.IDTELEFON' +
        'E,A.CODESTADOSOLIC, A.IDBENEFICIARIO FROM'
      '  ATEND A'
      'WHERE'
      '  (IDATEND = :IDATEND)'
      ' ')
    Left = 289
    Top = 53
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDATEND'
        ParamType = ptInputOutput
        Value = '1'
      end>
    object qryIDATEND: TFloatField
      FieldName = 'IDATEND'
      Origin = 'ATEND.IDATEND'
    end
    object qryIDTIPOATEND: TFloatField
      FieldName = 'IDTIPOATEND'
      Origin = 'ATEND.IDTIPOATEND'
    end
    object qryCODATEND: TFloatField
      FieldName = 'CODATEND'
      Origin = 'ATEND.CODATEND'
    end
    object qryDATA: TDateTimeField
      FieldName = 'DATA'
      Origin = 'ATEND.DATA'
    end
    object qryNOMESOLICITANTE: TStringField
      FieldName = 'NOMESOLICITANTE'
      Origin = 'ATEND.NOMESOLICITANTE'
      Size = 60
    end
    object qryTELSOLICITANTE: TStringField
      FieldName = 'TELSOLICITANTE'
      Origin = 'ATEND.TELSOLICITANTE'
      Size = 14
    end
    object qryCODATENDENTE: TStringField
      FieldName = 'CODATENDENTE'
      Origin = 'ATEND.CODATENDENTE'
    end
    object qryRESPOSTA: TStringField
      FieldName = 'RESPOSTA'
      Origin = 'ATEND.RESPOSTA'
      Size = 250
    end
    object qrySTATUS: TStringField
      FieldName = 'STATUS'
      Origin = 'ATEND.STATUS'
    end
    object qryOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Origin = 'ATEND.OBSERVACAO'
      Size = 250
    end
    object qryIDTITULAR: TFloatField
      FieldName = 'IDTITULAR'
      Origin = 'ATEND.IDTITULAR'
    end
    object qryIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
      Origin = 'ATEND.IDPESSJUR'
    end
    object qryDATAINICIO: TDateTimeField
      FieldName = 'DATAINICIO'
      Origin = 'ATEND.DATAINICIO'
    end
    object qryLOGRADOURO: TStringField
      FieldName = 'LOGRADOURO'
      Origin = 'ATEND.LOGRADOURO'
      Size = 60
    end
    object qryNUMEROSOLIC: TStringField
      FieldName = 'NUMEROSOLIC'
      Origin = 'ATEND.NUMEROSOLIC'
      Size = 10
    end
    object qryCOMPLEMSOLIC: TStringField
      FieldName = 'COMPLEMSOLIC'
      Origin = 'ATEND.COMPLEMSOLIC'
    end
    object qryBAIRROSOLIC: TStringField
      FieldName = 'BAIRROSOLIC'
      Origin = 'ATEND.BAIRROSOLIC'
      Size = 30
    end
    object qryCEPSOLIC: TStringField
      FieldName = 'CEPSOLIC'
      Origin = 'ATEND.CEPSOLIC'
      Size = 8
    end
    object qryCIDADESOLIC: TStringField
      FieldName = 'CIDADESOLIC'
      Origin = 'ATEND.CIDADESOLIC'
      Size = 30
    end
    object qryCOMPLCODATEND: TFloatField
      FieldName = 'COMPLCODATEND'
      Origin = 'ATEND.COMPLCODATEND'
    end
    object qryIDLOCALATENDXCPU: TFloatField
      FieldName = 'IDLOCALATENDXCPU'
      Origin = 'ATEND.IDLOCALATENDXCPU'
    end
    object qryPERGUNTA: TStringField
      FieldName = 'PERGUNTA'
      Origin = 'ATEND.PERGUNTA'
      Size = 250
    end
    object qryIDESTADO: TFloatField
      FieldName = 'IDESTADO'
    end
    object qryDDISOLIC: TStringField
      FieldName = 'DDISOLIC'
      EditMask = '9999;1;_'
      Size = 4
    end
    object qryDDDSOLIC: TStringField
      FieldName = 'DDDSOLIC'
      EditMask = '99999;1;_'
      Size = 5
    end
    object qryTIPOSOLIC: TStringField
      FieldName = 'TIPOSOLIC'
      Size = 5
    end
    object qryNUMEROTELSOLIC: TStringField
      FieldName = 'NUMEROTELSOLIC'
      EditMask = '99999999999999999999;1;_'
    end
    object qryIDTELEFONE: TFloatField
      FieldName = 'IDTELEFONE'
    end
    object qryCODESTADOSOLIC: TStringField
      FieldName = 'CODESTADOSOLIC'
      Size = 3
    end
    object qryIDBENEFICIARIO: TFloatField
      FieldName = 'IDBENEFICIARIO'
    end
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 550
    Top = 93
  end
  object dspartprev: TwwDataSource
    Left = 477
    Top = 77
  end
  object dsreserva: TwwDataSource
    Left = 621
    Top = 53
  end
  object MSParticipante: TMontaSelect
    Tag = 7
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'PESSOA.NOME'
      'PESSOA.NUMDOCUMENTO'
      'ELEGPATRO.MATRICULA'
      'PARTPREVPLAN.INSCRICAONUMERO'
      'PLANPREV.NOME'
      'PJ.NOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'N'
      'C'
      'C')
    Descricao.Strings = (
      'Nome do Participante'
      'CPF'
      'Matricula'
      'Inscrição'
      'Plano'
      'Patrocinadora')
    SensivelACaixa.Strings = (
      'S'
      'S'
      'S'
      'S'
      'S'
      'S')
    Tabelas.Strings = (
      'PESSOA'
      'PESSOA PJ'
      'ELEGPATRO'
      'PLANPREV'
      'PARTPREVPLAN'
      'SITPART')
    CamposChave.Strings = (
      'PESSOA.NOME'
      'PESSOA.NUMDOCUMENTO'
      'ELEGPATRO.MATRICULA'
      'PARTPREVPLAN.INSCRICAONUMERO'
      'PLANPREV.NOME'
      'PJ.NOME'
      'PJ.IDPESSOA'
      'PESSOA.IDPESSOA'
      'SITPART.DESCRICAO'
      'PESSOA.IDPESSOA'
      'PLANPREV.IDPLANOPREV'
      'PARTPREVPLAN.SEQPROPOSTA ')
    Filtro.Strings = (
      'PARTPREVPLAN.IDSITPART        = SITPART.IDSITPART'
      'PARTPREVPLAN.IDPESSOA         = ELEGPATRO.IDPESSOA'
      'PARTPREVPLAN.IDPESSJUR       = ELEGPATRO.IDPESSJUR'
      'PARTPREVPLAN.IDPLANOPREV  = PLANPREV.IDPLANOPREV'
      'ELEGPATRO.IDPESSOA                = PESSOA.IDPESSOA'
      'ELEGPATRO.IDPESSJUR              = PJ.IDPESSOA'
      'PARTPREVPLAN.IDSITPART        = SITPART.IDSITPART'
      'PARTPREVPLAN.FLGDESATIVADO = 0')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '30'
      '60'
      '18'
      '13'
      '10'
      '50')
    DataBaseName = 'basedados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 479
    Top = 29
  end
  object MsResposta: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'SUBSTR(RESPATEND.DESCRESPATEN,1,255)')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Resposta')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'RESPATEND'
      'ASSUNTOXRESP')
    CamposChave.Strings = (
      'ASSUNTOXRESP.IDASSUNTOXRESP'
      'RESPATEND.DESCRESPATEN'
      'RESPATEND.IDRESPATEND')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '255')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 412
    Top = 29
  end
  object QryAssuntoxAtend: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    Filtered = True
    SQL.Strings = (
      'SELECT'
      
        '  A.IDASSUNTOXATEND, A.IDASSUNTO, A.IDATEND, A.IDASSUNTOXRESP, A' +
        '.IDPROCESSO, '
      
        '  DECODE(A.IDPROCESSO,NULL,0.00,1.00) AS EXISTERAD, decode(a.idr' +
        'ubs,null,0.00,1.00) AS EXISTERUB,'
      
        '  R.DESCRESPATEN, ASS.NOME, ASS.IDTIPOPROCESSO, ASS.IDCONFIGRUBS' +
        ' AS IDMODELORUB,idrubs as idrub'
      'FROM'
      '  ASSUNTOXATEND A, RESPATEND R, ASSUNTOXRESP AR, ASSUNTO ASS'
      'WHERE'
      '  (IDATEND = :IDATEND) AND'
      '  (A.IDASSUNTOXRESP = AR.IDASSUNTOXRESP(+)) AND'
      '  (AR.IDRESPATEND = R.IDRESPATEND(+)) AND'
      '  (A.IDASSUNTO = ASS.IDASSUNTO)'
      ''
      ' ')
    UpdateObject = UpdAssuntoxAtend
    ControlType.Strings = (
      'DESCRESPATEN;RichEdit;ReRespostaGrid')
    ValidateWithMask = True
    Left = 627
    Top = 5
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDATEND'
        ParamType = ptUnknown
        Value = 1
      end>
    object QryAssuntoxAtendIDASSUNTOXATEND: TFloatField
      DisplayWidth = 10
      FieldName = 'IDASSUNTOXATEND'
      Origin = 'ASSUNTOXATEND.IDASSUNTOXATEND'
    end
    object QryAssuntoxAtendIDASSUNTO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDASSUNTO'
      Origin = 'ASSUNTOXATEND.IDASSUNTO'
    end
    object QryAssuntoxAtendIDATEND: TFloatField
      DisplayWidth = 10
      FieldName = 'IDATEND'
      Origin = 'ASSUNTOXATEND.IDATEND'
    end
    object QryAssuntoxAtendIDASSUNTOXRESP: TFloatField
      DisplayWidth = 10
      FieldName = 'IDASSUNTOXRESP'
      Origin = 'ASSUNTOXATEND.IDASSUNTOXRESP'
    end
    object QryAssuntoxAtendIDPROCESSO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPROCESSO'
      Origin = 'ASSUNTOXATEND.IDPROCESSO'
    end
    object QryAssuntoxAtendEXISTERAD: TFloatField
      DisplayWidth = 10
      FieldName = 'EXISTERAD'
    end
    object QryAssuntoxAtendEXISTERUB: TFloatField
      DisplayWidth = 10
      FieldName = 'EXISTERUB'
    end
    object QryAssuntoxAtendNOME: TStringField
      DisplayWidth = 60
      FieldName = 'NOME'
      Size = 60
    end
    object QryAssuntoxAtendIDTIPOPROCESSO: TFloatField
      FieldName = 'IDTIPOPROCESSO'
    end
    object QryAssuntoxAtendIDMODELORUB: TFloatField
      FieldName = 'IDMODELORUB'
    end
    object QryAssuntoxAtendDESCRESPATEN: TMemoField
      FieldName = 'DESCRESPATEN'
      BlobType = ftMemo
      Size = 2000
    end
    object QryAssuntoxAtendIDRUB: TFloatField
      FieldName = 'IDRUB'
    end
  end
  object DsAssuntoxAtend: TwwDataSource
    DataSet = QryAssuntoxAtend
    Left = 656
    Top = 5
  end
  object UpdAssuntoxAtend: TUpdateSQL
    ModifySQL.Strings = (
      'update ASSUNTOXATEND'
      'set'
      '  IDASSUNTOXATEND = :IDASSUNTOXATEND,'
      '  IDASSUNTO = :IDASSUNTO,'
      '  IDATEND = :IDATEND,'
      '  IDASSUNTOXRESP = :IDASSUNTOXRESP,'
      '  IDPROCESSO = :IDPROCESSO'
      'where'
      '  IDASSUNTOXATEND = :OLD_IDASSUNTOXATEND')
    InsertSQL.Strings = (
      'insert into ASSUNTOXATEND'
      
        '  (IDASSUNTOXATEND, IDASSUNTO, IDATEND, IDASSUNTOXRESP, IDPROCES' +
        'SO)'
      'values'
      
        '  (:IDASSUNTOXATEND, :IDASSUNTO, :IDATEND, :IDASSUNTOXRESP, :IDP' +
        'ROCESSO)')
    DeleteSQL.Strings = (
      'delete from ASSUNTOXATEND'
      'where'
      '  IDASSUNTOXATEND = :OLD_IDASSUNTOXATEND')
    Left = 687
    Top = 5
  end
  object QryAssuntoxAtendAnt: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      
        '  A.IDASSUNTOXATEND, A.IDASSUNTO, A.IDATEND, A.IDASSUNTOXRESP, A' +
        '.IDPROCESSO, A.IDRUBS AS IDRUB,'
      
        '  DECODE(A.IDPROCESSO,NULL,0,1) AS EXISTERAD, DECODE(A.IDRUBS,NU' +
        'LL,0,1) AS EXISTERUB,'
      
        '  R.DESCRESPATEN, ASS.NOME,  ASS.IDTIPOPROCESSO, ASS.IDCONFIGRUB' +
        'S AS IDMODELORUB'
      'FROM'
      '  ASSUNTOXATEND A, RESPATEND R, ASSUNTOXRESP AR, ASSUNTO ASS'
      'WHERE'
      '  (IDATEND = :IDATEND) AND'
      '  (A.IDASSUNTOXRESP = AR.IDASSUNTOXRESP(+)) AND'
      '  (AR.IDRESPATEND = R.IDRESPATEND(+)) AND'
      '  (A.IDASSUNTO = ASS.IDASSUNTO)'
      '')
    ValidateWithMask = True
    Left = 568
    Top = 5
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDATEND'
        ParamType = ptUnknown
      end>
    object QryAssuntoxAtendAntIDASSUNTOXATEND: TFloatField
      FieldName = 'IDASSUNTOXATEND'
    end
    object QryAssuntoxAtendAntIDASSUNTO: TFloatField
      FieldName = 'IDASSUNTO'
    end
    object QryAssuntoxAtendAntIDATEND: TFloatField
      FieldName = 'IDATEND'
    end
    object QryAssuntoxAtendAntIDASSUNTOXRESP: TFloatField
      FieldName = 'IDASSUNTOXRESP'
    end
    object QryAssuntoxAtendAntIDPROCESSO: TFloatField
      FieldName = 'IDPROCESSO'
    end
    object QryAssuntoxAtendAntEXISTERAD: TFloatField
      FieldName = 'EXISTERAD'
    end
    object QryAssuntoxAtendAntEXISTERUB: TFloatField
      FieldName = 'EXISTERUB'
    end
    object QryAssuntoxAtendAntNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object QryAssuntoxAtendAntIDTIPOPROCESSO: TFloatField
      FieldName = 'IDTIPOPROCESSO'
    end
    object QryAssuntoxAtendAntIDMODELORUB: TFloatField
      FieldName = 'IDMODELORUB'
    end
    object QryAssuntoxAtendAntDESCRESPATEN: TMemoField
      FieldName = 'DESCRESPATEN'
      BlobType = ftMemo
      Size = 2000
    end
    object QryAssuntoxAtendAntIDRUB: TFloatField
      FieldName = 'IDRUB'
    end
  end
  object DsAssuntoxAtendAnt: TwwDataSource
    DataSet = QryAssuntoxAtendAnt
    Left = 598
    Top = 5
  end
  object MsBeneficiario: TMontaSelect
    Tag = 9
    Template.IdConsulta = 0
    Caption = 'Seleciona Beneficiario'
    Colunas.Strings = (
      'PB.NOME'
      'PESSOA.NOME'
      'PB.NUMDOCUMENTO'
      'ELEGPATRO.MATRICULA'
      'PARTPREVPLAN.INSCRICAONUMERO'
      'PLANPREV.NOME'
      'PJ.NOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'N'
      'C'
      'C')
    Descricao.Strings = (
      'Nome do Beneficiário'
      'Nome do Participante'
      'CPF'
      'Matricula'
      'Inscrição'
      'Plano'
      'Patrocinadora')
    SensivelACaixa.Strings = (
      'S'
      'S'
      'S'
      'S'
      'S'
      'S'
      'S')
    Tabelas.Strings = (
      'PESSOA'
      'PESSOA PJ'
      'ELEGPATRO'
      'PLANPREV'
      'PARTPREVPLAN'
      'SITPART'
      'BFCIARIOTITPLAN'
      'PESSOA PB')
    CamposChave.Strings = (
      'PESSOA.NOME'
      'PESSOA.NUMDOCUMENTO'
      'ELEGPATRO.MATRICULA'
      'PARTPREVPLAN.INSCRICAONUMERO'
      'PLANPREV.NOME'
      'PJ.NOME'
      'PJ.IDPESSOA'
      'PESSOA.IDPESSOA'
      'SITPART.DESCRICAO'
      'PB.IDPESSOA'
      'PLANPREV.IDPLANOPREV'
      'PARTPREVPLAN.SEQPROPOSTA ')
    Filtro.Strings = (
      'BFCIARIOTITPLAN.IDTITULAR   = ELEGPATRO.IDPESSOA'
      'BFCIARIOTITPLAN.IDPESSJUR  = ELEGPATRO.IDPESSJUR'
      'BFCIARIOTITPLAN.IDTITULAR   = PARTPREVPLAN.IDPESSOA'
      'BFCIARIOTITPLAN.IDPESSJUR   = PARTPREVPLAN.IDPESSJUR'
      'BFCIARIOTITPLAN.IDPLANOPREV = PARTPREVPLAN.IDPLANOPREV'
      'BFCIARIOTITPLAN.IDPLANOPREV = PLANPREV.IDPLANOPREV'
      'BFCIARIOTITPLAN.IDTITULAR   = PESSOA.IDPESSOA '
      'BFCIARIOTITPLAN.IDPESSJUR   = PJ.IDPESSOA'
      'PARTPREVPLAN.IDSITPART         = SITPART.IDSITPART'
      'PARTPREVPLAN.FLGDESATIVADO = '#39'0'#39
      'BFCIARIOTITPLAN.IDRESPONSAVEL = PB.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '30'
      '30'
      '60'
      '18'
      '13'
      '10'
      '50')
    DataBaseName = 'BASEDADOS'
    RepeteConsulta = True
    UsaDistinct = True
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 471
    Top = 5
  end
  object MsFormaAtend: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Forma de Atendimento'
    Colunas.Strings = (
      'TIPOATEND.NOME')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Tipo de Atendimento')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'TIPOATEND')
    CamposChave.Strings = (
      'TIPOATEND.IDTIPOATEND')
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
    Left = 452
    Top = 133
  end
  object MsAssunto: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Assunto do Atendimento'
    Colunas.Strings = (
      'GRUPOASSUNTO.DESCGRUPOASSUNTO'
      'ASSUNTO.NOME'
      'PLANPREV.NOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Grupo do Assunto'
      'Assunto'
      'Plano Prev.')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'ASSUNTO'
      'GRUPOASSUNTO'
      'PLANPREV')
    CamposChave.Strings = (
      'ASSUNTO.IDASSUNTO'
      'ASSUNTO.IDTIPOPROCESSO'
      'ASSUNTO.IDCONFIGRUBS'
      'ASSUNTO.IDASSUNTO')
    Filtro.Strings = (
      'ASSUNTO.IDGRUPOASSUNTO = GRUPOASSUNTO.IDGRUPOASSUNTO(+)'
      'ASSUNTO.IDPLANOPREV = PLANPREV.IDPLANOPREV(+)'
      'ASSUNTO.IDGRUPOASSUNTO = GRUPOASSUNTO.IDGRUPOASSUNTO(+)')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '30'
      '60'
      '50')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 717
    Top = 12
  end
  object QryBuscaResposta: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  R.DESCRESPATEN'
      'FROM'
      '  RESPATEND R'
      'WHERE'
      '  R.IDRESPATEND = :IDRESPATEND')
    ValidateWithMask = True
    Left = 538
    Top = 5
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDRESPATEND'
        ParamType = ptUnknown
      end>
    object QryBuscaRespostaDESCRESPATEN: TMemoField
      FieldName = 'DESCRESPATEN'
      Origin = 'RESPATEND.DESCRESPATEN'
      BlobType = ftMemo
      Size = 2000
    end
  end
  object PpmRubsPendentes: TPopupMenu
    Left = 161
    Top = 38
    object PpmEmite: TMenuItem
      Tag = 1
      Caption = '&Emite'
    end
    object PpmGera2via: TMenuItem
      Tag = 2
      Caption = '&Gera Segunda Via'
    end
    object PpmEmite2Via: TMenuItem
      Tag = 3
      Caption = '&Emite Segunda Via'
    end
    object TMenuItem
      Caption = '-'
    end
    object PpmCancela: TMenuItem
      Tag = 4
      Caption = '&Cancela'
    end
  end
  object QryEstado: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODESTADO ,IDESTADO FROM ESTADO'
      'where'
      'CODESTADO = :CODESTADO')
    ValidateWithMask = True
    Left = 149
    Top = 46
    ParamData = <
      item
        DataType = ftString
        Name = 'CODESTADO'
        ParamType = ptUnknown
      end>
    object QryEstadoCODESTADO: TStringField
      DisplayLabel = 'UF'
      DisplayWidth = 3
      FieldName = 'CODESTADO'
      Origin = 'ESTADO.CODESTADO'
      Size = 3
    end
    object QryEstadoIDESTADO: TFloatField
      FieldName = 'IDESTADO'
    end
  end
  object qryultrub: TwwQuery
    AutoRefresh = True
    DatabaseName = 'BaseDados'
    Filtered = True
    SQL.Strings = (
      
        'select   idrubs as ultrub, FLGSTATUS  from rubs WHERE FLGSTATUS ' +
        '= '#39'0'#39
      ' ')
    ValidateWithMask = True
    Left = 61
    Top = 102
    object qryultrubULTRUB: TFloatField
      FieldName = 'ULTRUB'
      Origin = 'BASEDADOS.RUBS.IDRUBS'
    end
    object qryultrubFLGSTATUS: TStringField
      FieldName = 'FLGSTATUS'
      Origin = 'BASEDADOS.RUBS.FLGSTATUS'
      FixedChar = True
      Size = 1
    end
  end
  object dsversao: TwwDataSource
    Left = 305
    Top = 168
  end
  object dspagamento: TwwDataSource
    DataSet = qrypagamento
    Left = 689
    Top = 272
  end
  object qrypagamento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select prov.descricao,hist.mes,hist.valorprovento,'
      
        '       decode(prov.flgdesconto,0,'#39'Provento'#39',1,'#39'Desconto'#39') as pro' +
        'vdesc,numbanco as Banco,'
      '       numagencia as Agencia, contacorrente conta'
      'FROM'
      '      HISTRUBSAL  HIST,'
      '     PROVDESC  PROV'
      'WHERE'
      '         HIST.IDRESPONSAVEL = :IDPESSOA AND'
      '        HIST.IDHSTFOLHABENEF = :IDHSTFOLHABENEF  AND'
      '        PROV.IDPROVENTO   = HIST.IDRUBRICA'
      ' ')
    ValidateWithMask = True
    Left = 697
    Top = 312
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDHSTFOLHABENEF'
        ParamType = ptUnknown
      end>
    object qrypagamentoDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 40
      FieldName = 'DESCRICAO'
      Size = 130
    end
    object qrypagamentoMES: TStringField
      DisplayLabel = 'Mes Referencia'
      DisplayWidth = 7
      FieldName = 'MES'
      FixedChar = True
      Size = 7
    end
    object qrypagamentoVALORPROVENTO: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 10
      FieldName = 'VALORPROVENTO'
    end
    object qrypagamentoPROVDESC: TStringField
      DisplayLabel = 'Prov/Desco'
      DisplayWidth = 8
      FieldName = 'PROVDESC'
      Size = 8
    end
    object qrypagamentoBANCO: TStringField
      DisplayLabel = 'Banco'
      DisplayWidth = 4
      FieldName = 'BANCO'
      FixedChar = True
      Size = 4
    end
    object qrypagamentoAGENCIA: TStringField
      DisplayLabel = 'Agencia'
      DisplayWidth = 5
      FieldName = 'AGENCIA'
      FixedChar = True
      Size = 5
    end
    object qrypagamentoCONTA: TStringField
      DisplayLabel = 'Conta'
      DisplayWidth = 15
      FieldName = 'CONTA'
      Size = 15
    end
  end
  object QRYALTRUBS: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE RUBS'
      'SET FLGSTATUS =  :FLGSTATUS'
      'WHERE'
      'IDRUBS = :IDRUBS      ')
    ValidateWithMask = True
    Left = 162
    Top = 171
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'FLGSTATUS'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDRUBS'
        ParamType = ptUnknown
      end>
  end
  object qryCidades: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDCIDADES, CODESTADO, NOME, IDESTADO'
      'FROM CIDADES'
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 553
    Top = 43
  end
  object qryTipoAtend: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDTIPOATEND, NOME, FLGEMITERUBS'
      'FROM TIPOATEND'
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 634
    Top = 45
    object qryTipoAtendIDTIPOATEND: TFloatField
      FieldName = 'IDTIPOATEND'
      Origin = 'BASEDADOS.TIPOATEND.IDTIPOATEND'
    end
    object qryTipoAtendNOME: TStringField
      FieldName = 'NOME'
      Origin = 'BASEDADOS.TIPOATEND.NOME'
      Size = 60
    end
    object qryTipoAtendFLGEMITERUBS: TStringField
      FieldName = 'FLGEMITERUBS'
      Origin = 'BASEDADOS.TIPOATEND.FLGEMITERUBS'
      FixedChar = True
      Size = 1
    end
  end
end
