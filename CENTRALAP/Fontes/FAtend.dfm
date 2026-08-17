inherited frmAtend: TfrmAtend
  Left = 392
  Top = 154
  Width = 1254
  Height = 614
  HelpContext = 190002
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  BorderStyle = bsSizeable
  Caption = 'Registro de Atendimento'
  ParentFont = True
  PrintScale = poNone
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnKeyDown = FormKeyDown
  OnMouseMove = nil
  OnPaint = nil
  OnResize = nil
  PixelsPerInch = 96
  TextHeight = 13
  object TLabel [0]
    Left = 5
    Top = 36
    Width = 129
    Height = 13
    Caption = 'Situação na Fundação'
  end
  inherited pnlFundo: TPanel
    Width = 1238
    Height = 490
    object PgAtend: TPageControl
      Left = 1
      Top = 1
      Width = 1236
      Height = 488
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
      OnChange = PgAtendChange
      object TbShtAtend: TTabSheet
        Caption = 'Atendimento - F3'
        object PageDadosAssunto: TPageControl
          Left = 0
          Top = 111
          Width = 1228
          Height = 349
          ActivePage = tbsDadosParticip
          Align = alClient
          HotTrack = True
          MultiLine = True
          ParentShowHint = False
          ShowHint = False
          TabOrder = 1
          OnChange = PageDadosAssuntoChange
          object TbDadosAtend: TTabSheet
            Caption = 'Dados Atendimento - F5'
            object Bevel5: TBevel
              Left = 0
              Top = 75
              Width = 773
              Height = 150
            end
            object Label2: TLabel
              Left = 4
              Top = 76
              Width = 115
              Height = 13
              Caption = 'Nome do Solicitante'
            end
            object Label20: TLabel
              Left = 387
              Top = 113
              Width = 183
              Height = 13
              Caption = 'Endereço para Correspondência'
            end
            object Label21: TLabel
              Left = 4
              Top = 150
              Width = 44
              Height = 13
              Caption = 'Número'
            end
            object Label22: TLabel
              Left = 65
              Top = 150
              Width = 76
              Height = 13
              Caption = 'Complemento'
            end
            object Label23: TLabel
              Left = 158
              Top = 150
              Width = 34
              Height = 13
              Caption = 'Bairro'
            end
            object Label24: TLabel
              Left = 4
              Top = 113
              Width = 25
              Height = 13
              Caption = 'CEP'
            end
            object Label26: TLabel
              Left = 143
              Top = 113
              Width = 40
              Height = 13
              Caption = 'Cidade'
            end
            object Label4: TLabel
              Left = 93
              Top = 113
              Width = 17
              Height = 13
              Caption = 'UF'
            end
            object Label38: TLabel
              Left = 387
              Top = 150
              Width = 23
              Height = 13
              Caption = 'DDI'
            end
            object Label41: TLabel
              Left = 441
              Top = 150
              Width = 28
              Height = 13
              Caption = 'DDD'
            end
            object Label31: TLabel
              Left = 495
              Top = 150
              Width = 112
              Height = 13
              Caption = 'Numero do telefone'
            end
            object Label58: TLabel
              Left = 389
              Top = 76
              Width = 24
              Height = 13
              Caption = 'CPF'
            end
            object Label59: TLabel
              Left = 590
              Top = 76
              Width = 19
              Height = 13
              Caption = 'RG'
            end
            object Label60: TLabel
              Left = 388
              Top = 185
              Width = 36
              Height = 13
              Caption = 'E-Mail'
            end
            object Label67: TLabel
              Left = 625
              Top = 150
              Width = 81
              Height = 13
              Caption = 'Nome Contato'
            end
            object EdtBloqueio: TEdit
              Left = 678
              Top = 197
              Width = 82
              Height = 21
              Color = clScrollBar
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 16
              Text = 'BLOQUEADO'
              Visible = False
            end
            object edtLogradouro: TwwDBEdit
              Left = 389
              Top = 126
              Width = 371
              Height = 21
              CharCase = ecUpperCase
              DataField = 'LOGRADOURO'
              DataSource = ds
              TabOrder = 6
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object edtNumero: TwwDBEdit
              Left = 4
              Top = 164
              Width = 49
              Height = 21
              DataField = 'NUMEROSOLIC'
              DataSource = ds
              TabOrder = 7
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object edtComplem: TwwDBEdit
              Left = 65
              Top = 164
              Width = 81
              Height = 21
              CharCase = ecUpperCase
              DataField = 'COMPLEMSOLIC'
              DataSource = ds
              TabOrder = 8
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object edtbairro: TwwDBEdit
              Left = 158
              Top = 164
              Width = 220
              Height = 21
              CharCase = ecUpperCase
              DataField = 'BAIRROSOLIC'
              DataSource = ds
              TabOrder = 9
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object edtcep: TwwDBEdit
              Left = 4
              Top = 126
              Width = 84
              Height = 21
              DataField = 'CEPSOLIC'
              DataSource = ds
              TabOrder = 3
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
              OnKeyPress = edtcepKeyPress
            end
            object DBEdNomeSol: TwwDBEdit
              Left = 4
              Top = 90
              Width = 373
              Height = 21
              DataField = 'NOMESOLICITANTE'
              DataSource = ds
              TabOrder = 0
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
              OnChange = DBEdNomeSolChange
            end
            object dblkCidade: TwwDBLookupCombo
              Left = 142
              Top = 126
              Width = 238
              Height = 21
              CharCase = ecUpperCase
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'50'#9'Nome'#9'F'
                'UF'#9'3'#9'UF'#9'F')
              DataField = 'CIDADESOLIC'
              DataSource = ds
              LookupTable = qryCidades
              LookupField = 'NOME'
              TabOrder = 5
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              OnChange = dblkCidadeChange
            end
            object dblkEstado: TwwDBLookupCombo
              Left = 92
              Top = 126
              Width = 47
              Height = 21
              CharCase = ecUpperCase
              DropDownAlignment = taLeftJustify
              DataField = 'CODESTADOSOLIC'
              DataSource = ds
              LookupTable = qryUF
              LookupField = 'CODESTADO'
              TabOrder = 4
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
            object edtDDI: TwwDBEdit
              Left = 388
              Top = 164
              Width = 49
              Height = 21
              DataField = 'DDISOLIC'
              DataSource = ds
              MaxLength = 2
              TabOrder = 10
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
              OnKeyPress = edtDDIKeyPress
            end
            object edtDDD: TwwDBEdit
              Left = 442
              Top = 164
              Width = 49
              Height = 21
              DataField = 'DDDSOLIC'
              DataSource = ds
              MaxLength = 2
              TabOrder = 11
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
              OnKeyPress = edtDDDKeyPress
            end
            object edtNumeroTelefone: TwwDBEdit
              Left = 496
              Top = 164
              Width = 124
              Height = 21
              DataField = 'NUMEROTELSOLIC'
              DataSource = ds
              MaxLength = 8
              TabOrder = 12
              UnboundDataType = wwDefault
              UsePictureMask = False
              WantReturns = False
              WordWrap = False
              OnKeyPress = edtNumeroTelefoneKeyPress
            end
            object pnlDadosAtendimento: TPanel
              Left = 0
              Top = 0
              Width = 774
              Height = 74
              TabOrder = 14
              object Label3: TLabel
                Left = 4
                Top = 36
                Width = 127
                Height = 13
                Caption = 'Forma de Atendimento'
              end
              object Label28: TLabel
                Left = 273
                Top = 37
                Width = 69
                Height = 13
                Caption = 'Data  Início'
              end
              object Label1: TLabel
                Left = 386
                Top = 37
                Width = 55
                Height = 13
                Caption = 'Data  Fim'
              end
              object Label40: TLabel
                Left = 499
                Top = 38
                Width = 69
                Height = 13
                Caption = 'Hora  Início'
              end
              object Label6: TLabel
                Left = 581
                Top = 38
                Width = 55
                Height = 13
                Caption = 'Hora  Fim'
              end
              object Label9: TLabel
                Left = 4
                Top = 3
                Width = 132
                Height = 13
                Caption = 'Código do Atendimento'
              end
              object Label17: TLabel
                Left = 146
                Top = 3
                Width = 61
                Height = 13
                Caption = 'Sequência'
              end
              object Label5: TLabel
                Left = 236
                Top = 3
                Width = 63
                Height = 13
                Caption = 'Atendente '
              end
              object Label30: TLabel
                Left = 644
                Top = 3
                Width = 51
                Height = 13
                Caption = 'Situação'
              end
              object Label65: TLabel
                Left = 663
                Top = 38
                Width = 100
                Height = 13
                Caption = 'Hora de Chegada'
              end
              object dblkTipoAtendimento: TwwDBLookupCombo
                Left = 5
                Top = 50
                Width = 263
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'NOME'#9'20'#9'NOME'#9'F')
                DataField = 'IDTIPOATEND'
                DataSource = ds
                LookupTable = qryTipoAtend
                LookupField = 'IDTIPOATEND'
                TabOrder = 0
                AutoDropDown = True
                ShowButton = True
                OrderByDisplay = False
                AllowClearKey = True
                OnExit = dblkTipoAtendimentoExit
              end
              object dbdateInicio: TCMDateTimePicker
                Left = 273
                Top = 50
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
                TabOrder = 1
                UnboundDataType = wwDTEdtDate
              end
              object dbdateFim: TCMDateTimePicker
                Left = 386
                Top = 50
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
                TabOrder = 2
                UnboundDataType = wwDTEdtDate
              end
              object EdDlgHoraInicio: TcmMaskEditDlg
                Left = 499
                Top = 50
                Width = 78
                Height = 21
                ReadOnly = True
                TabOrder = 3
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
              object EdDlgHora: TcmMaskEditDlg
                Left = 581
                Top = 50
                Width = 78
                Height = 21
                ReadOnly = True
                TabOrder = 4
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
              object ednum: TwwDBEdit
                Left = 4
                Top = 17
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
                TabOrder = 5
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
              end
              object EdSeq: TwwDBEdit
                Left = 146
                Top = 17
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
                TabOrder = 6
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
              end
              object DbEdAtend: TEdit
                Left = 236
                Top = 17
                Width = 404
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
                TabOrder = 7
              end
              object wwDBEdit3: TwwDBEdit
                Left = 644
                Top = 17
                Width = 81
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
                TabOrder = 8
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
              end
              object CMDTPHoraChegada: TCMDateTimePicker
                Left = 665
                Top = 50
                Width = 46
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                ButtonStyle = cbsCustom
                DataField = 'DTHORACHEGADA'
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
                TabOrder = 9
                UnboundDataType = wwDTEdtDate
                DisplayFormat = 'hh:nn'
              end
            end
            object GroupBox4: TGroupBox
              Left = 4
              Top = 187
              Width = 382
              Height = 32
              Caption = 'Tipo de Telefone'
              TabOrder = 13
              object chkTipoTelefone: TCheckListBox
                Left = 8
                Top = 11
                Width = 370
                Height = 16
                BorderStyle = bsNone
                Color = clBtnFace
                Columns = 5
                Ctl3D = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -8
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ItemHeight = 22
                Items.Strings = (
                  'Comercial'
                  'Particular'
                  'Fax'
                  'Celular'
                  'Recado')
                ParentCtl3D = False
                ParentFont = False
                Style = lbOwnerDrawFixed
                TabOrder = 0
              end
            end
            object DBedRG: TwwDBEdit
              Left = 590
              Top = 90
              Width = 170
              Height = 21
              DataField = 'NUMDOCUMENTORG'
              DataSource = ds
              TabOrder = 2
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object DBedCPF: TwwDBEdit
              Left = 389
              Top = 90
              Width = 170
              Height = 21
              DataField = 'NUMDOCUMENTOCPF'
              DataSource = ds
              TabOrder = 1
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object EmailSolicit: TwwDBEdit
              Left = 388
              Top = 197
              Width = 284
              Height = 21
              DataField = 'EMAIL'
              DataSource = ds
              TabOrder = 15
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object edtNomeContato: TwwDBEdit
              Left = 626
              Top = 164
              Width = 134
              Height = 21
              DataField = 'CONTATOTEL'
              DataSource = ds
              MaxLength = 14
              TabOrder = 17
              UnboundDataType = wwDefault
              UsePictureMask = False
              WantReturns = False
              WordWrap = False
            end
          end
          object TbsAssuntos: TTabSheet
            Hint = 'Utilize <Ctrl><I>, <Ctrl><E>, <Ctrl><D> ou <Ctrl><R>'
            Caption = 'Assunto(s) - F6'
            ParentShowHint = False
            ShowHint = False
            OnEnter = TbsAssuntosEnter
            object PnlAssuntoAtend: TPanel
              Left = 0
              Top = 31
              Width = 1220
              Height = 290
              Align = alClient
              TabOrder = 2
              object Splitter5: TSplitter
                Left = 1
                Top = 1
                Width = 3
                Height = 288
                Cursor = crHSplit
              end
              object GrdAssunto: TwwDBGrid
                Left = 1
                Top = 1
                Width = 489
                Height = 162
                Selected.Strings = (
                  'NOME'#9'38'#9'Assunto'
                  'EXISTERAD'#9'4'#9'RAD'
                  'EXISTERUB'#9'4'#9'RUB'
                  'IDPROCESSO'#9'8'#9'Num. RAD'
                  'IDRUB'#9'9'#9'Num. RUBS'
                  'IDCONTRATOEMPTMO'#9'13'#9'Nº Contrato'#9'F'
                  'VLRSOLICITADO'#9'11'#9'Vlr. Solicitado'#9'F'
                  'NUMPARCELAS'#9'6'#9'Nº Parc.'#9'F')
                IniAttributes.Delimiter = ';;'
                TitleColor = clBtnFace
                FixedCols = 0
                ShowHorzScrollBar = True
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
                Left = 493
                Top = 1
                Width = 273
                Height = 162
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
                  AF0000007B5C727466315C616E73695C616E7369637067313235325C64656666
                  305C6465666C616E67313034367B5C666F6E7474626C7B5C66305C666E696C20
                  4D532053616E732053657269663B7D7D0D0A7B5C636F6C6F7274626C203B5C72
                  65643235355C677265656E3235355C626C75653235353B7D0D0A5C766965776B
                  696E64345C7563315C706172645C6366315C625C66305C667331342052655265
                  73706F7374614175785C7061720D0A7D0D0A00}
              end
            end
            object PnlAssunto: TPanel
              Left = 0
              Top = 31
              Width = 1220
              Height = 290
              Align = alClient
              BevelOuter = bvLowered
              ParentShowHint = False
              ShowHint = False
              TabOrder = 0
              object Bevel3: TBevel
                Left = 11
                Top = 94
                Width = 221
                Height = 31
                ParentShowHint = False
                Shape = bsFrame
                ShowHint = False
              end
              object assunto: TLabel
                Left = 9
                Top = 80
                Width = 54
                Height = 13
                Caption = ' Assunto '
              end
              object Label27: TLabel
                Left = 239
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
                ParentShowHint = False
                Shape = bsFrame
                ShowHint = False
              end
              object Bevel2: TBevel
                Left = 11
                Top = 131
                Width = 221
                Height = 26
                ParentShowHint = False
                Shape = bsFrame
                ShowHint = False
              end
              object Bevel4: TBevel
                Left = 11
                Top = 50
                Width = 221
                Height = 31
                ParentShowHint = False
                Shape = bsFrame
                ShowHint = False
              end
              object Label46: TLabel
                Left = 11
                Top = 36
                Width = 106
                Height = 13
                Caption = 'Grupo de Assunto '
              end
              object ReResposta: TwwDBRichEdit
                Left = 235
                Top = 25
                Width = 449
                Height = 132
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
                ParentShowHint = False
                PrintJobName = 'Delphi 5'
                ReadOnly = True
                ShowHint = False
                TabOrder = 3
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
                  AC0000007B5C727466315C616E73695C616E7369637067313235325C64656666
                  305C6465666C616E67313034367B5C666F6E7474626C7B5C66305C666E696C20
                  4D532053616E732053657269663B7D7D0D0A7B5C636F6C6F7274626C203B5C72
                  65643235355C677265656E3235355C626C75653235353B7D0D0A5C766965776B
                  696E64345C7563315C706172645C6366315C625C66305C667331342052655265
                  73706F7374615C7061720D0A7D0D0A00}
              end
              object DBCheckBox1: TDBCheckBox
                Left = 21
                Top = 135
                Width = 105
                Height = 17
                Caption = 'Gera Processo'
                DataField = 'EXISTERAD'
                DataSource = DsAssuntoxAtend
                ReadOnly = True
                TabOrder = 4
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
              object DBCheckBox2: TDBCheckBox
                Left = 132
                Top = 135
                Width = 93
                Height = 17
                Hint = 'Requisição Única de Benefícos e Serviços'
                Caption = 'Gera RUBS'
                DataField = 'EXISTERUB'
                DataSource = DsAssuntoxAtend
                ParentShowHint = False
                ReadOnly = True
                ShowHint = True
                TabOrder = 6
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
              object Dock974: TDock97
                Left = 1134
                Top = 1
                Width = 85
                Height = 288
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
                    ParentShowHint = False
                    ShowHint = False
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
                    ParentShowHint = False
                    ShowHint = False
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
                    Caption = 'Volta&r'
                    ParentShowHint = False
                    ShowHint = False
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
              object CkbFiltraPlano: TCheckBox
                Left = 38
                Top = 13
                Width = 165
                Height = 15
                Caption = 'Filtra Assuntos Por Plano'
                ParentShowHint = False
                ShowHint = False
                TabOrder = 0
                OnClick = CkbFiltraPlanoClick
              end
              object DBLKAssunto: TwwDBLookupCombo
                Left = 16
                Top = 99
                Width = 210
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'NOME'#9'60'#9'Assunto'#9'F'
                  'NOMEPLANOPREV'#9'50'#9'Plano'#9'F'
                  'DESCRUB'#9'60'#9'Modelo RUB'#9'F')
                LookupTable = QryAssunto
                LookupField = 'IDASSUNTO'
                Enabled = False
                ParentShowHint = False
                ShowHint = False
                TabOrder = 2
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = False
                OnChange = DBLKAssuntoChange
              end
              object DBLKGrupoAssunto: TwwDBLookupCombo
                Left = 16
                Top = 55
                Width = 210
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCGRUPOASSUNTO'#9'30'#9'Grupo Assunto'#9'F')
                LookupTable = QryGrupoAssunto
                LookupField = 'IDGRUPOASSUNTO'
                Enabled = False
                ParentShowHint = False
                ShowHint = False
                TabOrder = 1
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = False
                OnChange = DBLKGrupoAssuntoChange
                OnClick = DBLKGrupoAssuntoChange
              end
            end
            object Dock973: TDock97
              Left = 0
              Top = 0
              Width = 1220
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
              object btnEmprestimo: TToolbarButton97
                Left = 416
                Top = 1
                Width = 349
                Height = 27
                AllowAllUp = True
                GroupIndex = 1
                DropdownArrow = False
                Caption = ' Empréstimo'
                Enabled = False
                Glyph.Data = {
                  C6060000424DC60600000000000036000000280000001A000000150000000100
                  18000000000090060000C40E0000C40E00000000000000000000CBC7C7EADFDF
                  FFFBFBFFC9C9FFCECEFFCECEFFCECEFFCECEFFCDCDFFCDCDFFCDCDFFCDCDFFCD
                  CDFFCFCFFFFFFFE8DADAEDDFDFD7D6D6D2D1D1C4C4C4C3C3C3C5C5C5C5C5C5C5
                  C5C5C5C5C5C5C5C50000FEFCFC300909004646007D7D00797900797900797900
                  7C7C008E8E009393009191009191009191009B9B0036364B3838301F1FC6A9A9
                  C5B5B5DBD3D3C6C8C8C3C3C3C5C5C5C5C5C5C5C5C5C5C5C5000000232335FFFF
                  BFFFFFC9FFFFCBFFFFCEFFFFD4FFFFC1FFFFD8F6F62AD7D7ACE2E2BBDEDE1BEC
                  ECC58080207E7E0DFFFF00FFFF002E2E1F64649C9D9DF2DFDFCECECEC5C5C5C5
                  C5C5C5C5C5C5C5C50000C5FFFFA8FCFC85FFFF85EDED99E6E692E8E868E6E61A
                  A7A70069693D7C7C5D93934B8989329797003D3DA5D3D3A3A1A154636300FFFF
                  67FFFF0D94948BA2A2D5D5D5C2C2C2C5C5C5C5C5C5C5C5C5000061FFFFC5FFFF
                  E9FFFF9EB0B0638686529090438B8B0E878747DADAA3EEEE87E4E48DECEC80E9
                  E975FFFF355A5A4B878711787800787834B4B456FCFC009F9F483131D8DCDCC5
                  C5C5C5C5C5C5C5C50000CBFFFFF4E4E4B7ACACB49B9B1B8C8C738F8F9C888878
                  A6A65B9B9B878585848081918E8EA48F90668F90556E6F284A4B365F5F00A8A8
                  007B7B159F9F95C6C6005454AEA7A7C5C5C5C5C5C5C5C5C50000B29A9A8A8585
                  575757747575547D7D7F7A7A737070B09D9CF9ECECFFFFF6EFF5E4EFF6E4EFF6
                  E5F2FEEDFFFFFFB6C0B78A6D6E005F5F00AFAF00898942A6A61ABBBB3E2B2BC5
                  C5C5C5C5C5C5C5C500008F8A8AADAEAECBCBCBC8C8C8D5C8C8CDC9C9DADAD9FF
                  FFFFB7B0B3A31FA5A424A6A322A5A120A5AE24A8A61DA39E649AEEF7F37A7E7E
                  004545187575307171A69E9EA09F9FC0C0C0C0C0C0C0C0C00000D1D2D2D0D0D0
                  CCCCCCCBCBCBCDCDCDB7B9B9CFD1D429262900000000C60000F90000F60000F6
                  0000F60000E100005702FFC8D4FFFFFFFFD9DCFFE6E6FFE7E7FCFFFFFAFFFFED
                  F9F9EDF9F9EDF9F90000C5C5C5C5C5C5C3C3C3C4C4C4ABAFAFFFFFFF00000000
                  000000000000FF00007C00009300009300008F0000D400008B00002334491615
                  004F4F093E3E1F34347A1212741212711111701111720F0F0000C4C4C4C4C4C4
                  C5C5C5C5C5C5FFFEFE000000AFFFFF5FFFFFFFFFFF00000000AB000097000097
                  0000900000CA00007000FFFFFFBEFFFF76FFFFA5FFFF9DEBEB3DE9E944EAEA58
                  EEEE5DEFEF4DF5F50000C5C5C5C5C5C5C5C5C5C5C5C5F9FEFEAB75751E5A5AB5
                  6A6A00747900CD00009600008F00008F0000910000CD0000730059D0DB9AFFFF
                  BDFFFF58FFFF57FFFF9DFFFF9BFFFF68FFFF6FF9F986F9F90000C5C5C5C5C5C5
                  C5C5C5C5C5C5F5F3F3383B3B6EDCDC74BBBA3AE3E7003B0000990000A70000AD
                  00008E0000CC0000770000CAD58ABDBD7AD7D7A8FDFDB6FFFF98FFFFA0FFFF90
                  FEFE2EFAFAB6D0CE0000C5C5C5C5C5C5C5C5C5C5C5C5FFFCFC18898979BABA00
                  C3C3FFA7AC006D0000D20000FC0007CE0000DA0000D000007C00C84352190F0F
                  34727288FFFFDCFFFF8EFFFF8AFFFFDBFFFFC6FFFF4CFFFF0000C5C5C5C5C5C5
                  C5C5C5C5C5C5E1E0E065666646A6A680B2B216A1A6006F0000960088A089B980
                  A000881900A800006B0C30B1BBA4FFFFF3FFFFD9FFFFA4F4F4CEF5F5A1F5F5E8
                  F5F572F5F5BCF2F30000C5C5C5C5C5C5C5C5C5C5C5C5DDDCDC3B29296BC5C597
                  BEBC45D0D4005D00003300ED99DBC6FFFFA89DC75D796958C8B8D1FFFF8EFFFF
                  FFFFFF93B7B75FA4A4BAA8A864A8A871A8A83EA8A859ABAB0000C5C5C5C5C5C5
                  C5C5C5C5C5C5EFECEC59646454918C4C82ACABAEAF006C00009C003469271693
                  B5C1FFFFFFF9FFFFFFFFB1FFFF67E3E3988C8C656D6DA1AFAFAFB2B2A4B0B0B3
                  B1B1B7B0B0BEB1B10000C5C5C5C5C5C5C5C5C5C5C5C5C5C4C4E0DFDF584E570C
                  801E1F1A1B00EC00007100007A00001F0C124C7E5C757E517C78117C7F908A8A
                  847E7ED1C7C7DDD0D0CCCACADDCFCFD2CBCBD9CFCFD2CBCB0000C5C5C5C5C5C5
                  C5C5C5C5C5C5C3C3C3D1D0D086668100D00000000000FF0000FB0000FF0000FF
                  0000D90000FE00003B00BE9CAAC2B7B7D1D3D3CACBCBC3C5C5C4C4C4C3C5C5C3
                  C4C4C3C5C5C3C4C40000C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C2C3C3BEAFBF46
                  F546536053532553533E53533B53533E535348505244503E303CFFFFFFCDCFCF
                  C7C7C7C4C4C4C4C4C4C5C5C5C4C4C4C5C5C5C4C4C4C5C5C50000C5C5C5C5C5C5
                  C5C5C5C5C5C5C5C5C5C4C4C4CED3CEEBC1EBE9E7E9E9DBE9E9DCE9E9DCE9E9DB
                  E9E9DCE9E9DAE9EBE9EBBFC0BFC4C4C4C4C4C4C5C5C5C5C5C5C5C5C5C5C5C5C5
                  C5C5C5C5C5C5C5C50000}
                Opaque = False
                Spacing = 0
                OnClick = btnEmprestimoClick
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
                  Hint = 'Consulta Respostas <Alt><R>'
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
                  Hint = 'Dados Do Atendimento Anterior <Alt><D>'
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
            Caption = 'Geral - F7'
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
                660000007B5C727466315C616E73695C64656666307B5C666F6E7474626C7B5C
                66305C666E696C204D532053616E732053657269663B7D7D0D0A5C766965776B
                696E64345C7563315C706172645C6C616E67313034365C625C66305C66733134
                5C7061720D0A7D0D0A00}
            end
            object MenPerguntaATEND: TwwDBRichEdit
              Left = 4
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
                660000007B5C727466315C616E73695C64656666307B5C666F6E7474626C7B5C
                66305C666E696C204D532053616E732053657269663B7D7D0D0A5C766965776B
                696E64345C7563315C706172645C6C616E67313034365C625C66305C66733134
                5C7061720D0A7D0D0A00}
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
                660000007B5C727466315C616E73695C64656666307B5C666F6E7474626C7B5C
                66305C666E696C204D532053616E732053657269663B7D7D0D0A5C766965776B
                696E64345C7563315C706172645C6C616E67313034365C625C66305C66733134
                5C7061720D0A7D0D0A00}
            end
          end
          object tbsDadosParticip: TTabSheet
            Caption = 'Dados do Participante - F8'
            OnShow = tbsDadosParticipShow
            object TLabel
              Left = 48
              Top = 32
              Width = 5
              Height = 13
            end
            object pgCtrlDadosParticip: TPageControl
              Left = 0
              Top = 31
              Width = 1130
              Height = 290
              Hint = 'Utilize <Ctrl><I>, <Ctrl><A> ou <Ctrl><E>'
              ActivePage = tbsEnderecos
              Align = alClient
              HotTrack = True
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              OnChange = pgCtrlDadosParticipChange
              OnChanging = pgCtrlDadosParticipChanging
              OnEnter = pgCtrlDadosParticipEnter
              object tbsEnderecos: TTabSheet
                Caption = 'Endereços'
                OnShow = tbsEnderecosShow
                object dbEnderecos: TwwDBGrid
                  Left = 0
                  Top = 0
                  Width = 1122
                  Height = 262
                  Selected.Strings = (
                    'LOGRADOURO'#9'60'#9'Logradouro'#9'F'
                    'COMPLEMENTO'#9'20'#9'Complemento'#9'F'
                    'NUMERO'#9'8'#9'Número'#9'F'
                    'CEP'#9'8'#9'CEP'#9'F'
                    'BAIRRO'#9'20'#9'Bairro'#9'F'
                    'CIDADE'#9'50'#9'Cidade'#9'F'
                    'CODESTADO'#9'3'#9'UF'#9'F'
                    'NOME'#9'40'#9'Local'#9'F')
                  IniAttributes.Delimiter = ';;'
                  TitleColor = clBtnFace
                  FixedCols = 0
                  ShowHorzScrollBar = True
                  Align = alClient
                  DataSource = dsEnderecos
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
                object pnlEnderecos: TPanel
                  Left = 0
                  Top = 0
                  Width = 1122
                  Height = 262
                  Align = alClient
                  TabOrder = 1
                  object Label10: TLabel
                    Left = 3
                    Top = 4
                    Width = 59
                    Height = 13
                    Caption = 'Endereço '
                  end
                  object Label13: TLabel
                    Left = 417
                    Top = 4
                    Width = 44
                    Height = 13
                    Caption = 'Número'
                  end
                  object Label14: TLabel
                    Left = 525
                    Top = 4
                    Width = 76
                    Height = 13
                    Caption = 'Complemento'
                  end
                  object Label15: TLabel
                    Left = 7
                    Top = 47
                    Width = 34
                    Height = 13
                    Caption = 'Bairro'
                  end
                  object pnl: TPanel
                    Left = 1
                    Top = 1
                    Width = 1120
                    Height = 260
                    Align = alClient
                    AutoSize = True
                    TabOrder = 3
                    object pnlEndereco: TPanel
                      Left = 3
                      Top = 1
                      Width = 625
                      Height = 177
                      BevelOuter = bvNone
                      TabOrder = 0
                      object Label16: TLabel
                        Left = 8
                        Top = 3
                        Width = 59
                        Height = 13
                        Caption = 'Endereço '
                      end
                      object Label32: TLabel
                        Left = 8
                        Top = 41
                        Width = 34
                        Height = 13
                        Caption = 'Bairro'
                      end
                      object Label64: TLabel
                        Left = 8
                        Top = 80
                        Width = 32
                        Height = 13
                        Caption = 'Local'
                      end
                      object Label33: TLabel
                        Left = 218
                        Top = 41
                        Width = 25
                        Height = 13
                        Caption = 'CEP'
                      end
                      object Label34: TLabel
                        Left = 319
                        Top = 41
                        Width = 17
                        Height = 13
                        Caption = 'UF'
                      end
                      object Label35: TLabel
                        Left = 384
                        Top = 41
                        Width = 40
                        Height = 13
                        Caption = 'Cidade'
                      end
                      object Label18: TLabel
                        Left = 405
                        Top = 3
                        Width = 44
                        Height = 13
                        Caption = 'Número'
                      end
                      object Label19: TLabel
                        Left = 482
                        Top = 3
                        Width = 76
                        Height = 13
                        Caption = 'Complemento'
                      end
                      object EDLOGRADORO1: TwwDBEdit
                        Left = 7
                        Top = 17
                        Width = 388
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'LOGRADOURO'
                        DataSource = dsEnderecos
                        TabOrder = 0
                        UnboundDataType = wwDefault
                        WantReturns = False
                        WordWrap = False
                      end
                      object ednumero1: TwwDBEdit
                        Left = 404
                        Top = 17
                        Width = 67
                        Height = 21
                        DataField = 'NUMERO'
                        DataSource = dsEnderecos
                        TabOrder = 1
                        UnboundDataType = wwDefault
                        WantReturns = False
                        WordWrap = False
                      end
                      object edcomplemento1: TwwDBEdit
                        Left = 481
                        Top = 17
                        Width = 141
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'COMPLEMENTO'
                        DataSource = dsEnderecos
                        TabOrder = 2
                        UnboundDataType = wwDefault
                        WantReturns = False
                        WordWrap = False
                      end
                      object edbairro1: TwwDBEdit
                        Left = 9
                        Top = 55
                        Width = 197
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'BAIRRO'
                        DataSource = dsEnderecos
                        TabOrder = 3
                        UnboundDataType = wwDefault
                        WantReturns = False
                        WordWrap = False
                      end
                      object DbedLocal: TwwDBEdit
                        Left = 7
                        Top = 94
                        Width = 294
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'NOME'
                        DataSource = dsEnderecos
                        TabOrder = 4
                        UnboundDataType = wwDefault
                        WantReturns = False
                        WordWrap = False
                      end
                      object edcep1: TwwDBEdit
                        Left = 216
                        Top = 55
                        Width = 84
                        Height = 21
                        DataField = 'CEP'
                        DataSource = dsEnderecos
                        TabOrder = 5
                        UnboundDataType = wwDefault
                        WantReturns = False
                        WordWrap = False
                        OnKeyPress = edcep1KeyPress
                      end
                      object dblkestado1: TwwDBLookupCombo
                        Left = 317
                        Top = 55
                        Width = 47
                        Height = 21
                        Constraints.MinWidth = 2
                        CharCase = ecUpperCase
                        DropDownAlignment = taLeftJustify
                        Selected.Strings = (
                          'CODESTADO'#9'3'#9'CODESTADO'#9'F')
                        DataField = 'CODESTADO'
                        DataSource = dsEnderecos
                        LookupTable = qryUF
                        LookupField = 'CODESTADO'
                        TabOrder = 6
                        AutoDropDown = True
                        ShowButton = True
                        AllowClearKey = True
                        ShowMatchText = True
                      end
                      object dblkcidade1: TwwDBLookupCombo
                        Left = 382
                        Top = 55
                        Width = 238
                        Height = 21
                        CharCase = ecUpperCase
                        DropDownAlignment = taLeftJustify
                        Selected.Strings = (
                          'NOME'#9'50'#9'NOME'#9'F'
                          'UF'#9'3'#9'UF'#9'F')
                        DataField = 'IDCIDADES'
                        DataSource = dsEnderecos
                        LookupTable = qryCidades
                        LookupField = 'IDCIDADES'
                        TabOrder = 7
                        AutoDropDown = True
                        ShowButton = True
                        AllowClearKey = True
                        OnCloseUp = dblkCidade1CloseUp
                      end
                      object GroupBox1: TGroupBox
                        Left = 7
                        Top = 116
                        Width = 546
                        Height = 34
                        TabOrder = 8
                        object chkbxComercial: TCheckBox
                          Left = 8
                          Top = 13
                          Width = 97
                          Height = 17
                          Caption = 'Comercial'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -9
                          Font.Name = 'MS Sans Serif'
                          Font.Style = [fsBold]
                          ParentFont = False
                          TabOrder = 0
                        end
                        object chkbxEntrega: TCheckBox
                          Left = 208
                          Top = 13
                          Width = 97
                          Height = 17
                          Caption = 'Entrega'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -9
                          Font.Name = 'MS Sans Serif'
                          Font.Style = [fsBold]
                          ParentFont = False
                          TabOrder = 2
                        end
                        object chkbxCobranca: TCheckBox
                          Left = 312
                          Top = 13
                          Width = 97
                          Height = 17
                          Caption = 'Cobrança'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -9
                          Font.Name = 'MS Sans Serif'
                          Font.Style = [fsBold]
                          ParentFont = False
                          TabOrder = 3
                        end
                        object chkbxCorrespondencia: TCheckBox
                          Left = 419
                          Top = 13
                          Width = 120
                          Height = 17
                          Caption = 'Correspondência'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -9
                          Font.Name = 'MS Sans Serif'
                          Font.Style = [fsBold]
                          ParentFont = False
                          TabOrder = 4
                        end
                        object chkbxResidencial: TCheckBox
                          Left = 111
                          Top = 13
                          Width = 97
                          Height = 17
                          Caption = 'Residencial'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -9
                          Font.Name = 'MS Sans Serif'
                          Font.Style = [fsBold]
                          ParentFont = False
                          TabOrder = 1
                        end
                      end
                    end
                  end
                  object btnEndOk: TBitBtn
                    Left = 642
                    Top = 14
                    Width = 85
                    Height = 28
                    Caption = 'OK'
                    Enabled = False
                    TabOrder = 0
                    Visible = False
                    OnClick = btnEndOkClick
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
                  object btnEndCancelar: TBitBtn
                    Left = 642
                    Top = 42
                    Width = 85
                    Height = 27
                    Cancel = True
                    Caption = 'Cancelar'
                    Enabled = False
                    TabOrder = 1
                    Visible = False
                    OnClick = btnEndCancelarClick
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
                  object btnEndVoltar: TBitBtn
                    Left = 642
                    Top = 69
                    Width = 85
                    Height = 27
                    Cancel = True
                    Caption = '&Voltar'
                    Enabled = False
                    TabOrder = 2
                    Visible = False
                    OnClick = btnEndVoltarClick
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
              object tbsTelefones: TTabSheet
                Caption = 'Telefones'
                ImageIndex = 1
                OnShow = tbsTelefonesShow
                object pnlTelefones: TPanel
                  Left = 0
                  Top = 0
                  Width = 1122
                  Height = 262
                  Align = alClient
                  TabOrder = 0
                  object dbgTelefones: TwwDBGrid
                    Left = 1
                    Top = 1
                    Width = 1120
                    Height = 260
                    IniAttributes.Delimiter = ';;'
                    TitleColor = clBtnFace
                    FixedCols = 0
                    ShowHorzScrollBar = True
                    Align = alClient
                    DataSource = dsTelefone
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
                  object pnlCadTelefones: TPanel
                    Left = 1
                    Top = 1
                    Width = 1120
                    Height = 260
                    Align = alClient
                    TabOrder = 1
                    object Label36: TLabel
                      Left = 11
                      Top = 17
                      Width = 65
                      Height = 13
                      Caption = 'Logradouro'
                    end
                    object Label37: TLabel
                      Left = 302
                      Top = 14
                      Width = 23
                      Height = 13
                      Caption = 'DDI'
                    end
                    object Label42: TLabel
                      Left = 362
                      Top = 14
                      Width = 28
                      Height = 13
                      Caption = 'DDD'
                    end
                    object Label43: TLabel
                      Left = 425
                      Top = 14
                      Width = 112
                      Height = 13
                      Caption = 'Numero do telefone'
                    end
                    object GroupBox2: TGroupBox
                      Left = 11
                      Top = 71
                      Width = 594
                      Height = 38
                      Caption = 'Tipo'
                      TabOrder = 0
                      object chkTelComercial: TCheckBox
                        Left = 8
                        Top = 16
                        Width = 97
                        Height = 17
                        Caption = 'Comercial'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -9
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        ParentFont = False
                        TabOrder = 0
                      end
                      object chkTelFax: TCheckBox
                        Left = 232
                        Top = 16
                        Width = 81
                        Height = 17
                        Caption = 'Fax'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -9
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        ParentFont = False
                        TabOrder = 2
                      end
                      object chkTelCelular: TCheckBox
                        Left = 336
                        Top = 16
                        Width = 77
                        Height = 17
                        Caption = 'Celular'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -9
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        ParentFont = False
                        TabOrder = 3
                      end
                      object chkTelRecado: TCheckBox
                        Left = 432
                        Top = 16
                        Width = 105
                        Height = 17
                        Caption = 'Recado'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -9
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        ParentFont = False
                        TabOrder = 4
                      end
                      object chkTelParticular: TCheckBox
                        Left = 116
                        Top = 16
                        Width = 77
                        Height = 17
                        Caption = 'Particular'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -9
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        ParentFont = False
                        TabOrder = 1
                      end
                    end
                    object dblkLogradouro: TwwDBLookupCombo
                      Left = 11
                      Top = 31
                      Width = 266
                      Height = 21
                      DropDownAlignment = taLeftJustify
                      DataField = 'LOGRADOURO'
                      DataSource = dsTelefone
                      LookupTable = qryEnderecos
                      LookupField = 'LOGRADOURO'
                      TabOrder = 1
                      AutoDropDown = True
                      ShowButton = True
                      AllowClearKey = True
                    end
                    object edtTelDDI: TwwDBEdit
                      Left = 302
                      Top = 30
                      Width = 49
                      Height = 21
                      DataField = 'DDI'
                      DataSource = dsTelefone
                      MaxLength = 2
                      TabOrder = 2
                      UnboundDataType = wwDefault
                      WantReturns = False
                      WordWrap = False
                      OnKeyPress = edtTelDDIKeyPress
                    end
                    object edtTelDDD: TwwDBEdit
                      Left = 362
                      Top = 30
                      Width = 49
                      Height = 21
                      DataField = 'DDD'
                      DataSource = dsTelefone
                      MaxLength = 2
                      TabOrder = 3
                      UnboundDataType = wwDefault
                      WantReturns = False
                      WordWrap = False
                      OnKeyPress = edtTelDDDKeyPress
                    end
                    object edtTelNumeroTelefone: TwwDBEdit
                      Left = 425
                      Top = 30
                      Width = 121
                      Height = 21
                      DataField = 'NUMERO'
                      DataSource = dsTelefone
                      MaxLength = 8
                      TabOrder = 4
                      UnboundDataType = wwDefault
                      WantReturns = False
                      WordWrap = False
                      OnKeyPress = edtTelNumeroTelefoneKeyPress
                    end
                    object btnTelOk: TBitBtn
                      Left = 631
                      Top = 15
                      Width = 85
                      Height = 28
                      Caption = 'OK'
                      Enabled = False
                      TabOrder = 5
                      Visible = False
                      OnClick = btnTelOkClick
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
                    object btnTelCancelar: TBitBtn
                      Left = 631
                      Top = 43
                      Width = 85
                      Height = 27
                      Cancel = True
                      Caption = 'Cancelar'
                      Enabled = False
                      TabOrder = 6
                      Visible = False
                      OnClick = btnTelCancelarClick
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
                    object btnTelVoltar: TBitBtn
                      Left = 631
                      Top = 70
                      Width = 85
                      Height = 27
                      Cancel = True
                      Caption = '&Voltar'
                      Enabled = False
                      TabOrder = 7
                      Visible = False
                      OnClick = btnTelCancelarClick
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
              object tbsContatos: TTabSheet
                Caption = 'Contatos'
                ImageIndex = 4
                OnShow = tbsContatosShow
                object dbgContato: TwwDBGrid
                  Left = 0
                  Top = 0
                  Width = 1122
                  Height = 262
                  Selected.Strings = (
                    'NOME'#9'21'#9'Nome'#9'F'
                    'CARGO'#9'10'#9'Cargo'#9'No'
                    'SETOR'#9'10'#9'Setor'#9'No'
                    'EMAIL'#9'40'#9'E-mail'#9'F')
                  IniAttributes.Delimiter = ';;'
                  TitleColor = clBtnFace
                  FixedCols = 0
                  ShowHorzScrollBar = True
                  Align = alClient
                  DataSource = dsContato
                  Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
                  TabOrder = 1
                  TitleAlignment = taLeftJustify
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -9
                  TitleFont.Name = 'MS Sans Serif'
                  TitleFont.Style = [fsBold]
                  TitleLines = 1
                  TitleButtons = False
                  UseTFields = False
                  OnKeyDown = dbgContatoKeyDown
                  IndicatorColor = icBlack
                end
                object pnlContatos: TPanel
                  Left = 0
                  Top = 0
                  Width = 1122
                  Height = 262
                  Align = alClient
                  TabOrder = 0
                  object mnbm: TLabel
                    Left = 14
                    Top = 76
                    Width = 34
                    Height = 13
                    Caption = 'Cargo'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object lblPdeMail: TLabel
                    Left = 14
                    Top = 39
                    Width = 35
                    Height = 13
                    Caption = 'E-mail'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object lblPdNome: TLabel
                    Left = 14
                    Top = 2
                    Width = 33
                    Height = 13
                    Caption = 'Nome'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object lblPdSetor: TLabel
                    Left = 249
                    Top = 76
                    Width = 31
                    Height = 13
                    Caption = 'Setor'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object lblNasc: TLabel
                    Left = 249
                    Top = 39
                    Width = 67
                    Height = 13
                    Caption = 'Nascimento'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object lblObs: TLabel
                    Left = 14
                    Top = 114
                    Width = 69
                    Height = 13
                    Caption = 'Observação'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object btnContatoOk: TBitBtn
                    Left = 623
                    Top = 20
                    Width = 85
                    Height = 28
                    Caption = 'OK'
                    Enabled = False
                    TabOrder = 6
                    Visible = False
                    OnClick = btnContatoOkClick
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
                  object btnContatoCancel: TBitBtn
                    Left = 623
                    Top = 48
                    Width = 85
                    Height = 27
                    Cancel = True
                    Caption = 'Cancelar'
                    Enabled = False
                    TabOrder = 7
                    Visible = False
                    OnClick = btnContatoCancelClick
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
                  object btnContatoVoltar: TBitBtn
                    Left = 623
                    Top = 75
                    Width = 85
                    Height = 27
                    Cancel = True
                    Caption = '&Voltar'
                    Enabled = False
                    TabOrder = 9
                    Visible = False
                    OnClick = btnContatoVoltarClick
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
                  object dbedContatoEmail: TDBEdit
                    Left = 14
                    Top = 53
                    Width = 215
                    Height = 21
                    DataField = 'EMAIL'
                    DataSource = dsContato
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                    TabOrder = 1
                  end
                  object dbedCargo: TDBEdit
                    Left = 14
                    Top = 91
                    Width = 215
                    Height = 21
                    DataField = 'CARGO'
                    DataSource = dsContato
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                    TabOrder = 3
                  end
                  object dbedSetor: TDBEdit
                    Left = 249
                    Top = 91
                    Width = 121
                    Height = 21
                    DataField = 'SETOR'
                    DataSource = dsContato
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                    TabOrder = 4
                  end
                  object GroupBox6: TGroupBox
                    Left = 420
                    Top = 5
                    Width = 190
                    Height = 157
                    Caption = 'Telefones'
                    TabOrder = 8
                    object dbgContatoRamal: TwwDBGrid
                      Left = 8
                      Top = 41
                      Width = 173
                      Height = 106
                      Selected.Strings = (
                        'NUMERO'#9'10'#9'Telefone'
                        'RAMAL'#9'5'#9'Ramal')
                      IniAttributes.Delimiter = ';;'
                      TitleColor = clBtnFace
                      FixedCols = 0
                      ShowHorzScrollBar = True
                      DataSource = dsRamal
                      Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
                      ParentShowHint = False
                      ShowHint = False
                      TabOrder = 1
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
                    object dbnInsereRamal: TDBNavigator
                      Left = 9
                      Top = 16
                      Width = 120
                      Height = 20
                      DataSource = dsRamal
                      VisibleButtons = [nbPrior, nbNext, nbInsert, nbDelete]
                      Ctl3D = True
                      Hints.Strings = (
                        ' '
                        'Anterior'
                        'Próximo'
                        ' '
                        'Vincular'
                        'Desvincular'
                        'Editar')
                      ParentCtl3D = False
                      ParentShowHint = False
                      ConfirmDelete = False
                      ShowHint = True
                      TabOrder = 0
                      BeforeAction = dbnInsereRamalBeforeAction
                    end
                  end
                  object dbMemoObs: TDBMemo
                    Left = 14
                    Top = 128
                    Width = 356
                    Height = 38
                    DataField = 'OBS'
                    DataSource = dsContato
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                    TabOrder = 5
                  end
                  object dbedContatoNome: TDBEdit
                    Left = 14
                    Top = 16
                    Width = 356
                    Height = 21
                    DataField = 'NOME'
                    DataSource = dsContato
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                    TabOrder = 0
                  end
                  object dbedDataNascimento: TCMDateTimePicker
                    Left = 249
                    Top = 54
                    Width = 121
                    Height = 21
                    CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                    CalendarAttributes.Font.Color = clWindowText
                    CalendarAttributes.Font.Height = -11
                    CalendarAttributes.Font.Name = 'MS Sans Serif'
                    CalendarAttributes.Font.Style = []
                    ButtonStyle = cbsCustom
                    DataField = 'NASCIMENTO'
                    DataSource = dsContato
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
              end
              object tbsContaCorrente: TTabSheet
                Caption = 'Contas Correntes'
                ImageIndex = 2
                OnShow = tbsContaCorrenteShow
                object DBGCONTASCORRENTE: TwwDBGrid
                  Left = 0
                  Top = 0
                  Width = 1122
                  Height = 262
                  Selected.Strings = (
                    'NUMBANCO'#9'7'#9'N. Banco'
                    'NUMAGENCIA'#9'15'#9'N. Agencia'
                    'NOMEBANCO'#9'29'#9'Banco'
                    'NOMEAGENCIA'#9'28'#9'Agencia'
                    'CONTACORRENTE'#9'15'#9'Conta Corrente'
                    'FLGCONTAPREF'#9'13'#9'Ref. Pagamento'
                    'FLGCONTACONJUNTA'#9'12'#9'Conta Conjunta'
                    'TIPOCONTA'#9'11'#9'Tipo de Conta'
                    'CONTAPREF'#9'15'#9'Conta  Preferencial')
                  IniAttributes.Delimiter = ';;'
                  TitleColor = clBtnFace
                  FixedCols = 0
                  ShowHorzScrollBar = True
                  Align = alClient
                  DataSource = dsContaCorrente
                  ReadOnly = True
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
                object pnlContasCorrentes: TPanel
                  Left = 0
                  Top = 0
                  Width = 1122
                  Height = 262
                  Align = alClient
                  TabOrder = 0
                  object Label44: TLabel
                    Left = 256
                    Top = 72
                    Width = 46
                    Height = 13
                    Caption = 'Label44'
                  end
                  object Panel3: TPanel
                    Left = 1
                    Top = 1
                    Width = 1120
                    Height = 260
                    Align = alClient
                    BevelOuter = bvLowered
                    TabOrder = 0
                    object Label45: TLabel
                      Left = 128
                      Top = 10
                      Width = 37
                      Height = 13
                      Caption = 'Banco'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label47: TLabel
                      Left = 129
                      Top = 58
                      Width = 47
                      Height = 13
                      Caption = 'Agência'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label48: TLabel
                      Left = 129
                      Top = 102
                      Width = 88
                      Height = 13
                      Caption = 'Conta Bancária'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label63: TLabel
                      Left = 39
                      Top = 58
                      Width = 69
                      Height = 13
                      Caption = 'Nº. Agência'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label66: TLabel
                      Left = 38
                      Top = 10
                      Width = 55
                      Height = 13
                      Caption = 'Nº Banco'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object dbedContaBancaria: TDBEdit
                      Left = 127
                      Top = 116
                      Width = 121
                      Height = 21
                      DataField = 'CONTACORRENTE'
                      DataSource = dsContaCorrente
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 2
                    end
                    object rgrpTipoConta: TDBRadioGroup
                      Left = 456
                      Top = 3
                      Width = 142
                      Height = 75
                      Caption = 'Tipo'
                      DataField = 'TIPOCONTA'
                      DataSource = dsContaCorrente
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      Items.Strings = (
                        'Conta Corrente'
                        'Conta Salário'
                        'Poupança'
                        'Ordem de Pag.')
                      ParentFont = False
                      TabOrder = 3
                      TabStop = True
                      Values.Strings = (
                        '1'
                        '2'
                        '3')
                      OnChange = rgrpTipoContaChange
                    end
                    object dbgrpContaPref: TDBRadioGroup
                      Left = 456
                      Top = 81
                      Width = 142
                      Height = 30
                      Caption = 'Conta Preferencial'
                      Columns = 2
                      DataField = 'FLGCONTAPREF'
                      DataSource = dsContaCorrente
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      Items.Strings = (
                        'Não'
                        'Sim')
                      ParentFont = False
                      TabOrder = 4
                      TabStop = True
                      Values.Strings = (
                        '0'
                        '1')
                    end
                    object dbgrpContaConj: TDBRadioGroup
                      Left = 456
                      Top = 115
                      Width = 144
                      Height = 30
                      Caption = 'Conta Conjunta'
                      Columns = 2
                      DataField = 'FLGCONTACONJUNTA'
                      DataSource = dsContaCorrente
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      Items.Strings = (
                        'Não'
                        'Sim')
                      ParentFont = False
                      TabOrder = 5
                      TabStop = True
                      Values.Strings = (
                        'N'
                        'S')
                    end
                    object btnCCOk: TBitBtn
                      Left = 626
                      Top = 15
                      Width = 85
                      Height = 28
                      Caption = 'OK'
                      Enabled = False
                      TabOrder = 6
                      Visible = False
                      OnClick = btnCCOkClick
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
                    object btnCCCancelar: TBitBtn
                      Left = 626
                      Top = 43
                      Width = 85
                      Height = 27
                      Cancel = True
                      Caption = 'Cancelar'
                      Enabled = False
                      TabOrder = 7
                      Visible = False
                      OnClick = btnCCCancelarClick
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
                    object btnCCVoltar: TBitBtn
                      Left = 626
                      Top = 70
                      Width = 85
                      Height = 27
                      Cancel = True
                      Caption = '&Voltar'
                      Enabled = False
                      TabOrder = 8
                      Visible = False
                      OnClick = btnCCVoltarClick
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
                    object edDigBanco: TwwDBEdit
                      Left = 36
                      Top = 23
                      Width = 79
                      Height = 21
                      DataField = 'NUMBANCO'
                      DataSource = dsContaCorrente
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 0
                      UnboundDataType = wwDefault
                      WantReturns = False
                      WordWrap = False
                      OnExit = edDigBancoExit
                    end
                    object edDigAgencia: TwwDBEdit
                      Left = 36
                      Top = 73
                      Width = 79
                      Height = 21
                      DataField = 'NUMAGENCIA'
                      DataSource = dsContaCorrente
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 1
                      UnboundDataType = wwDefault
                      WantReturns = False
                      WordWrap = False
                      OnExit = edDigAgenciaExit
                    end
                  end
                  object dblkpcmbBanco: TwwDBLookupCombo
                    Left = 128
                    Top = 23
                    Width = 294
                    Height = 21
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    DropDownAlignment = taLeftJustify
                    Selected.Strings = (
                      'BANCO'#9'60'#9'Banco'
                      'NUMBANCO'#9'10'#9'Nº')
                    DataField = 'IDBANCO'
                    DataSource = dsContaCorrente
                    LookupTable = qryBanco
                    LookupField = 'IDPESSOA'
                    Options = [loTitles]
                    ParentFont = False
                    TabOrder = 1
                    AutoDropDown = True
                    ShowButton = True
                    AllowClearKey = False
                    OnChange = dblkpcmbBancoChange
                    OnExit = dblkpcmbBancoExit
                  end
                  object dblkpcmbAgencia: TwwDBLookupCombo
                    Left = 128
                    Top = 73
                    Width = 294
                    Height = 21
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    DropDownAlignment = taLeftJustify
                    Selected.Strings = (
                      'AGENCIA'#9'60'#9'Agência'#9'F'
                      'NUMAGENCIA'#9'15'#9'Nº Agência'#9'F')
                    DataField = 'IDAGENCIA'
                    DataSource = dsContaCorrente
                    LookupTable = qryAgencia
                    LookupField = 'IDPESSOA'
                    Options = [loTitles]
                    ParentFont = False
                    TabOrder = 2
                    AutoDropDown = True
                    ShowButton = True
                    AllowClearKey = True
                    OnChange = dblkpcmbAgenciaChange
                  end
                end
              end
              object tbsDocumentos: TTabSheet
                Caption = 'Documentos'
                ImageIndex = 3
                OnShow = tbsDocumentosShow
                object DBGDocumentos: TwwDBGrid
                  Left = 0
                  Top = 0
                  Width = 1122
                  Height = 262
                  Selected.Strings = (
                    'NOMEDOCUMENTO'#9'20'#9'Documento'#9'F'
                    'NUMDOCUMENTO'#9'18'#9'Num. Documento')
                  IniAttributes.Delimiter = ';;'
                  TitleColor = clBtnFace
                  FixedCols = 0
                  ShowHorzScrollBar = True
                  Align = alClient
                  DataSource = DsDocumentos
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
                object PnlDocumentos: TPanel
                  Left = 0
                  Top = 0
                  Width = 1122
                  Height = 262
                  Align = alClient
                  BevelOuter = bvNone
                  BorderStyle = bsSingle
                  TabOrder = 1
                  object Label61: TLabel
                    Left = 29
                    Top = 18
                    Width = 65
                    Height = 13
                    Caption = 'Documento'
                    Transparent = True
                  end
                  object Label62: TLabel
                    Left = 28
                    Top = 73
                    Width = 98
                    Height = 13
                    Caption = 'Núm. Documento'
                    Transparent = True
                  end
                  object btnDocOk: TBitBtn
                    Left = 630
                    Top = 15
                    Width = 85
                    Height = 28
                    Caption = 'OK'
                    Enabled = False
                    TabOrder = 2
                    Visible = False
                    OnClick = btnDocOkClick
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
                  object btnDocCancelar: TBitBtn
                    Left = 630
                    Top = 43
                    Width = 85
                    Height = 27
                    Cancel = True
                    Caption = 'Cancelar'
                    Enabled = False
                    TabOrder = 3
                    Visible = False
                    OnClick = btnDocCancelarClick
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
                  object btnDocVoltar: TBitBtn
                    Left = 630
                    Top = 70
                    Width = 85
                    Height = 27
                    Cancel = True
                    Caption = '&Voltar'
                    Enabled = False
                    TabOrder = 4
                    Visible = False
                    OnClick = btnDocVoltarClick
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
                  object DBedRG2: TwwDBEdit
                    Left = 26
                    Top = 88
                    Width = 258
                    Height = 21
                    DataField = 'NUMDOCUMENTO'
                    DataSource = DsDocumentos
                    TabOrder = 1
                    UnboundDataType = wwDefault
                    WantReturns = False
                    WordWrap = False
                    OnChange = DBedRG2Change
                  end
                  object DBLKTipoDocPessoa: TwwDBLookupCombo
                    Left = 27
                    Top = 33
                    Width = 258
                    Height = 21
                    DropDownAlignment = taLeftJustify
                    Selected.Strings = (
                      'NOMEDOCUMENTO'#9'20'#9'NOMEDOCUMENTO'#9'F')
                    LookupTable = qryTipoDocPessoa
                    LookupField = 'IDDOCUMENTO'
                    TabOrder = 0
                    AutoDropDown = False
                    ShowButton = True
                    AllowClearKey = False
                  end
                end
              end
            end
            object Dock9710: TDock97
              Left = 0
              Top = 0
              Width = 1220
              Height = 31
              AllowDrag = False
              BoundLines = [blTop, blBottom, blLeft, blRight]
              object Toolbar977: TToolbar97
                Left = 0
                Top = 0
                Caption = 'tb97BotoesDetalhe'
                DockPos = 0
                TabOrder = 0
                object sbtnInsereDetalhe: TToolbarButton97
                  Left = 0
                  Top = 0
                  Width = 25
                  Height = 25
                  Hint = 'Inserir'
                  AllowAllUp = True
                  GroupIndex = 2
                  Enabled = False
                  ImageIndex = 0
                  Images = ImlPadrao
                  ParentShowHint = False
                  ShowHint = True
                  OnClick = sbtnInsereDetalheClick
                end
                object sbtnAlteraDetalhe: TToolbarButton97
                  Left = 25
                  Top = 0
                  Width = 25
                  Height = 25
                  Hint = 'Alterar'
                  AllowAllUp = True
                  GroupIndex = 2
                  Enabled = False
                  ImageIndex = 1
                  Images = ImlPadrao
                  ParentShowHint = False
                  ShowHint = True
                  OnClick = sbtnAlteraDetalheClick
                end
                object sbtnExcluiDetalhe: TToolbarButton97
                  Left = 50
                  Top = 0
                  Width = 25
                  Height = 25
                  Hint = 'Excluir'
                  AllowAllUp = True
                  Enabled = False
                  ImageIndex = 2
                  Images = ImlPadrao
                  ParentShowHint = False
                  ShowHint = True
                  OnClick = sbtnExcluiDetalheClick
                end
              end
            end
            object Dock975: TDock97
              Left = 1130
              Top = 31
              Width = 90
              Height = 290
              AllowDrag = False
              BoundLines = [blLeft]
              Position = dpRight
              object Toolbar972: TToolbar97
                Left = 0
                Top = 20
                Caption = 'tb97Detalhe'
                DockPos = 20
                TabOrder = 0
                object btnOk: TBitBtn
                  Left = 0
                  Top = 0
                  Width = 85
                  Height = 27
                  Caption = 'OK'
                  Enabled = False
                  TabOrder = 0
                  OnClick = btnOkClick
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
                object btnCancelar: TBitBtn
                  Left = 0
                  Top = 27
                  Width = 85
                  Height = 27
                  Cancel = True
                  Caption = 'Cancelar'
                  Enabled = False
                  TabOrder = 1
                  OnClick = btnCancelarClick
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
                object btnVoltar: TBitBtn
                  Left = 0
                  Top = 54
                  Width = 85
                  Height = 27
                  Cancel = True
                  Caption = '&Voltar'
                  Enabled = False
                  TabOrder = 2
                  OnClick = btnVoltarClick
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
          object tbShtSimulaBenef: TTabSheet
            Caption = 'Datas Benefícios - F9'
            ImageIndex = 4
            object Label49: TLabel
              Left = 32
              Top = 8
              Width = 90
              Height = 13
              Caption = 'Data de Evento'
            end
            object Label50: TLabel
              Left = 32
              Top = 56
              Width = 22
              Height = 13
              Caption = 'DIB'
            end
            object Label51: TLabel
              Left = 32
              Top = 104
              Width = 104
              Height = 13
              Caption = 'Data de Demissão'
            end
            object Label52: TLabel
              Left = 200
              Top = 8
              Width = 128
              Height = 13
              Caption = 'Data de Requerimento'
            end
            object Label53: TLabel
              Left = 199
              Top = 114
              Width = 292
              Height = 13
              Caption = 'Obs: Se não for informado a Data Correspondente ,'
              Color = cl3DLight
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object Label54: TLabel
              Left = 200
              Top = 130
              Width = 202
              Height = 13
              Caption = 'o sistema assumirá a data corrente.'
              Color = cl3DLight
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object Label55: TLabel
              Left = 200
              Top = 58
              Width = 139
              Height = 13
              Caption = 'Número de Beneficiários'
            end
            object dbDataDib: TCMDateTimePicker
              Left = 32
              Top = 72
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
            object dbdatademissao: TCMDateTimePicker
              Left = 32
              Top = 120
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
              TabOrder = 4
            end
            object dbdatarequerimento: TCMDateTimePicker
              Left = 200
              Top = 24
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
            object dbDataEvento: TCMDateTimePicker
              Left = 32
              Top = 24
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
            object bbnumerobeneficiario: TMaskEdit
              Left = 202
              Top = 73
              Width = 17
              Height = 21
              EditMask = '99;1;_'
              MaxLength = 2
              TabOrder = 3
              Text = '  '
            end
          end
          object TbShtDocsXBenef: TTabSheet
            Caption = 'Docs X Benef - F11'
            ImageIndex = 5
            OnEnter = TbShtDocsXBenefEnter
            OnShow = TbShtDocsXBenefShow
            object Label56: TLabel
              Left = 10
              Top = 7
              Width = 121
              Height = 13
              Caption = 'Benefício ou Serviço'
            end
            object Label57: TLabel
              Left = 432
              Top = 7
              Width = 128
              Height = 13
              Caption = 'Situação do Benefício'
            end
            object DBGriddocsXbenef: TwwDBGrid
              Left = 8
              Top = 48
              Width = 681
              Height = 107
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              DataSource = DSdocsXbenef
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
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
            object dblkBeneficio: TwwDBLookupCombo
              Left = 8
              Top = 22
              Width = 365
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'60'#9'NOME'#9'F')
              LookupTable = QryBeneficio
              LookupField = 'IDSERVICOS'
              TabOrder = 1
              AutoDropDown = False
              ShowButton = True
              AllowClearKey = False
              OnChange = dblkBeneficioChange
            end
            object dblkSitBenef: TwwDBLookupCombo
              Left = 430
              Top = 22
              Width = 259
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'60'#9'DESCRICAO'#9'F')
              LookupTable = qrySitBenef
              LookupField = 'IDSITBENEF'
              Enabled = False
              TabOrder = 2
              AutoDropDown = False
              ShowButton = True
              AllowClearKey = False
              OnChange = dblkSitBenefChange
            end
            object BtnImprime: TBitBtn
              Left = 697
              Top = 156
              Width = 73
              Height = 33
              Caption = '&Imprimir'
              Enabled = False
              TabOrder = 3
              OnClick = BtnImprimeClick
              Glyph.Data = {
                AA040000424DAA04000000000000360000002800000013000000130000000100
                18000000000074040000C40E0000C40E000000000000000000000000FF0000FF
                0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
                FF0000FF0000FF0000FF0000FF0000FF0000FF0000000000FF0000FF0000FF00
                00FF0000FF0000FF0000FF0000FF0000000000000000000000FF0000FF0000FF
                0000FF0000FF0000FF0000FF0000FF0000000000FF0000FF0000FF0000FF0000
                FF0000FF000000000000C0C0C08080808080800000000000000000FF0000FF00
                00FF0000FF0000FF0000FF0000000000FF0000FF0000FF0000FF000000000000
                C0C0C0C0C0C00000000000000000008080808080800000000000000000FF0000
                FF0000FF0000FF0000000000FF0000FF000000000000C0C0C0C0C0C000000000
                0000C0C0C08080808080800000000000008080808080800000000000000000FF
                0000FF0000000000FF000000C0C0C0C0C0C0000000000000C0C0C0C0C0C0C0C0
                C08080808080808080808080800000000000008080808080800000000000FF00
                00000000FF808080000000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0808080
                8080808080808080808080808080800000000000000000000000FF0000000000
                FF000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0FFFFFF80808080808080
                80808080808080808080808080808080800000000000FF0000000000FF808080
                C0C0C0C0C0C0C0C0C0C0C0C0FFFFFFFFFFFFC0C0C0C0C0C0C0C0C08080808080
                808080808080808080808080800000000000FF0000000000FF808080C0C0C0C0
                C0C0FFFFFFFFFFFFC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0808080
                8080808080808080800000000000FF0000000000FF808080FFFFFFFFFFFFC0C0
                C0C0C0C0C0C0C00000FF0000FFC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C080
                80808080800000000000FF0000000000FF808080C0C0C0C0C0C0C0C0C000FF00
                00FF00C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0
                C00000000000FF0000000000FF0000FF808080808080FFFFFFC0C0C0C0C0C0C0
                C0C0C0C0C0C0C0C0C0C0C0FFFFFFFFFFFF000000C0C0C08080808080800000FF
                0000FF0000000000FF0000FF0000FF0000FF808080808080FFFFFFC0C0C08080
                80FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000FF0000FF0000FF0000FF00
                00000000FF0000FF0000FF0000FF0000FF0000FF808080808080808080FFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000FF0000FF0000FF0000000000
                FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF808080808080FFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000FF0000000000FF0000FF
                0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF808080FFFFFFFFFF
                FFFFFFFF8080808080800000FF0000FF0000FF0000000000FF0000FF0000FF00
                00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF808080808080808080
                0000FF0000FF0000FF0000FF0000FF0000000000FF0000FF0000FF0000FF0000
                FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
                00FF0000FF0000FF0000FF000000}
              Spacing = 2
            end
            object DBMemo1: TDBMemo
              Left = 8
              Top = 160
              Width = 681
              Height = 60
              DataField = 'OBSERVACAO'
              DataSource = DSdocsXbenef
              ReadOnly = True
              TabOrder = 4
            end
          end
          object TbsOutrasInfor: TTabSheet
            Caption = 'Outras Informações - F12'
            ImageIndex = 8
            object PageOutrasInfor: TPageControl
              Left = 0
              Top = 0
              Width = 1220
              Height = 321
              ActivePage = TbsDadosAlim
              Align = alClient
              TabOrder = 0
              object TbShtProcJud: TTabSheet
                Caption = 'Dados Processos Judiciais'
                object DBGridProcJud: TwwDBGrid
                  Left = 0
                  Top = 0
                  Width = 1212
                  Height = 293
                  Selected.Strings = (
                    'NUMEROPROCESSO'#9'20'#9'Número do Processo'
                    'AUTORACAO'#9'50'#9'Autoração'
                    'NOMEVARA'#9'25'#9'Nome da Vara'#9'F')
                  IniAttributes.Delimiter = ';;'
                  TitleColor = clBtnFace
                  FixedCols = 0
                  ShowHorzScrollBar = True
                  Align = alClient
                  DataSource = DSProcJud
                  Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
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
                  object wwIButton2: TwwIButton
                    Left = 0
                    Top = 0
                    Width = 13
                    Height = 22
                    AllowAllUp = True
                  end
                end
              end
              object TTabSheet
                Caption = 'Documentos do Responsável'
                ImageIndex = 1
                object wwDBGrid1: TwwDBGrid
                  Left = 0
                  Top = 0
                  Width = 1212
                  Height = 293
                  Selected.Strings = (
                    'DATAEMISSAO'#9'18'#9'Data de Emissão'#9'F'
                    'DATAVALIDADE'#9'18'#9'Data de Validade'
                    'NOMEDOCUMENTO'#9'30'#9'Documento')
                  IniAttributes.Delimiter = ';;'
                  TitleColor = clBtnFace
                  FixedCols = 0
                  ShowHorzScrollBar = True
                  Align = alClient
                  DataSource = DSDocRespon
                  Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
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
                  object wwIButton3: TwwIButton
                    Left = 0
                    Top = 0
                    Width = 13
                    Height = 22
                    AllowAllUp = True
                  end
                end
              end
              object TbsDadosAlim: TTabSheet
                Caption = 'Dados Alimentada - Pensão Alimentícia'
                ImageIndex = 2
                object DBGridAlim: TwwDBGrid
                  Left = 0
                  Top = 0
                  Width = 1212
                  Height = 293
                  Selected.Strings = (
                    'NOME'#9'60'#9'Nome'
                    'NUMDOCUMENTO'#9'18'#9'CPF'
                    'CONTACORRENTE'#9'15'#9'Conta Corrente'
                    'AGENCIA'#9'60'#9'Agência'
                    'BANCO'#9'60'#9'Banco'
                    'NOMETIPOCONTA'#9'14'#9'Conta'
                    'CONTAPREFERENCIAL'#9'3'#9'Conta Preferencial'
                    'CONTACONJUNTA'#9'3'#9'Conta Conjunta'
                    'LOGRADOURO'#9'60'#9'Logradouro'
                    'COMPLEMENTO'#9'20'#9'Complemento'
                    'CODESTADO'#9'3'#9'Estado'
                    'NUMERO'#9'8'#9'Número'
                    'BAIRRO'#9'20'#9'Bairro'
                    'CIDADE'#9'20'#9'Cidade'#9'F'
                    'CEP'#9'8'#9'CEP')
                  IniAttributes.Delimiter = ';;'
                  TitleColor = clBtnFace
                  FixedCols = 0
                  ShowHorzScrollBar = True
                  Align = alClient
                  DataSource = DsAlimetada
                  Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
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
        end
        object Panel1: TPanel
          Left = 0
          Top = 0
          Width = 1228
          Height = 111
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object Label11: TLabel
            Left = 5
            Top = 71
            Width = 131
            Height = 13
            Caption = 'Matr. na Patrocinadora'
          end
          object Label12: TLabel
            Left = 480
            Top = 37
            Width = 111
            Height = 13
            Caption = 'Inscrição no  Plano'
          end
          object Label7: TLabel
            Left = 5
            Top = -1
            Width = 192
            Height = 13
            Caption = 'Nome do Elegível ou Participante'
          end
          object Label8: TLabel
            Left = 448
            Top = -1
            Width = 24
            Height = 13
            Caption = 'CPF'
          end
          object Label39: TLabel
            Left = 149
            Top = 71
            Width = 80
            Height = 13
            Caption = 'Patrocinadora'
          end
          object TLabel
            Left = 227
            Top = 37
            Width = 33
            Height = 13
            Caption = 'Plano'
          end
          object TLabel
            Left = 5
            Top = 36
            Width = 129
            Height = 13
            Caption = 'Situação na Fundação'
          end
          object tbbEmprestimo: TToolbarButton97
            Left = 874
            Top = 72
            Width = 127
            Height = 30
            AllowAllUp = True
            GroupIndex = 1
            DropdownAlways = True
            DropdownMenu = PpMenuEmptimo
            Caption = '&Empréstimo'
            Flat = False
            Glyph.Data = {
              C6060000424DC60600000000000036000000280000001A000000150000000100
              18000000000090060000C40E0000C40E00000000000000000000CBC7C7EADFDF
              FFFBFBFFC9C9FFCECEFFCECEFFCECEFFCECEFFCDCDFFCDCDFFCDCDFFCDCDFFCD
              CDFFCFCFFFFFFFE8DADAEDDFDFD7D6D6D2D1D1C4C4C4C3C3C3C5C5C5C5C5C5C5
              C5C5C5C5C5C5C5C50000FEFCFC300909004646007D7D00797900797900797900
              7C7C008E8E009393009191009191009191009B9B0036364B3838301F1FC6A9A9
              C5B5B5DBD3D3C6C8C8C3C3C3C5C5C5C5C5C5C5C5C5C5C5C5000000232335FFFF
              BFFFFFC9FFFFCBFFFFCEFFFFD4FFFFC1FFFFD8F6F62AD7D7ACE2E2BBDEDE1BEC
              ECC58080207E7E0DFFFF00FFFF002E2E1F64649C9D9DF2DFDFCECECEC5C5C5C5
              C5C5C5C5C5C5C5C50000C5FFFFA8FCFC85FFFF85EDED99E6E692E8E868E6E61A
              A7A70069693D7C7C5D93934B8989329797003D3DA5D3D3A3A1A154636300FFFF
              67FFFF0D94948BA2A2D5D5D5C2C2C2C5C5C5C5C5C5C5C5C5000061FFFFC5FFFF
              E9FFFF9EB0B0638686529090438B8B0E878747DADAA3EEEE87E4E48DECEC80E9
              E975FFFF355A5A4B878711787800787834B4B456FCFC009F9F483131D8DCDCC5
              C5C5C5C5C5C5C5C50000CBFFFFF4E4E4B7ACACB49B9B1B8C8C738F8F9C888878
              A6A65B9B9B878585848081918E8EA48F90668F90556E6F284A4B365F5F00A8A8
              007B7B159F9F95C6C6005454AEA7A7C5C5C5C5C5C5C5C5C50000B29A9A8A8585
              575757747575547D7D7F7A7A737070B09D9CF9ECECFFFFF6EFF5E4EFF6E4EFF6
              E5F2FEEDFFFFFFB6C0B78A6D6E005F5F00AFAF00898942A6A61ABBBB3E2B2BC5
              C5C5C5C5C5C5C5C500008F8A8AADAEAECBCBCBC8C8C8D5C8C8CDC9C9DADAD9FF
              FFFFB7B0B3A31FA5A424A6A322A5A120A5AE24A8A61DA39E649AEEF7F37A7E7E
              004545187575307171A69E9EA09F9FC0C0C0C0C0C0C0C0C00000D1D2D2D0D0D0
              CCCCCCCBCBCBCDCDCDB7B9B9CFD1D429262900000000C60000F90000F60000F6
              0000F60000E100005702FFC8D4FFFFFFFFD9DCFFE6E6FFE7E7FCFFFFFAFFFFED
              F9F9EDF9F9EDF9F90000C5C5C5C5C5C5C3C3C3C4C4C4ABAFAFFFFFFF00000000
              000000000000FF00007C00009300009300008F0000D400008B00002334491615
              004F4F093E3E1F34347A1212741212711111701111720F0F0000C4C4C4C4C4C4
              C5C5C5C5C5C5FFFEFE000000AFFFFF5FFFFFFFFFFF00000000AB000097000097
              0000900000CA00007000FFFFFFBEFFFF76FFFFA5FFFF9DEBEB3DE9E944EAEA58
              EEEE5DEFEF4DF5F50000C5C5C5C5C5C5C5C5C5C5C5C5F9FEFEAB75751E5A5AB5
              6A6A00747900CD00009600008F00008F0000910000CD0000730059D0DB9AFFFF
              BDFFFF58FFFF57FFFF9DFFFF9BFFFF68FFFF6FF9F986F9F90000C5C5C5C5C5C5
              C5C5C5C5C5C5F5F3F3383B3B6EDCDC74BBBA3AE3E7003B0000990000A70000AD
              00008E0000CC0000770000CAD58ABDBD7AD7D7A8FDFDB6FFFF98FFFFA0FFFF90
              FEFE2EFAFAB6D0CE0000C5C5C5C5C5C5C5C5C5C5C5C5FFFCFC18898979BABA00
              C3C3FFA7AC006D0000D20000FC0007CE0000DA0000D000007C00C84352190F0F
              34727288FFFFDCFFFF8EFFFF8AFFFFDBFFFFC6FFFF4CFFFF0000C5C5C5C5C5C5
              C5C5C5C5C5C5E1E0E065666646A6A680B2B216A1A6006F0000960088A089B980
              A000881900A800006B0C30B1BBA4FFFFF3FFFFD9FFFFA4F4F4CEF5F5A1F5F5E8
              F5F572F5F5BCF2F30000C5C5C5C5C5C5C5C5C5C5C5C5DDDCDC3B29296BC5C597
              BEBC45D0D4005D00003300ED99DBC6FFFFA89DC75D796958C8B8D1FFFF8EFFFF
              FFFFFF93B7B75FA4A4BAA8A864A8A871A8A83EA8A859ABAB0000C5C5C5C5C5C5
              C5C5C5C5C5C5EFECEC59646454918C4C82ACABAEAF006C00009C003469271693
              B5C1FFFFFFF9FFFFFFFFB1FFFF67E3E3988C8C656D6DA1AFAFAFB2B2A4B0B0B3
              B1B1B7B0B0BEB1B10000C5C5C5C5C5C5C5C5C5C5C5C5C5C4C4E0DFDF584E570C
              801E1F1A1B00EC00007100007A00001F0C124C7E5C757E517C78117C7F908A8A
              847E7ED1C7C7DDD0D0CCCACADDCFCFD2CBCBD9CFCFD2CBCB0000C5C5C5C5C5C5
              C5C5C5C5C5C5C3C3C3D1D0D086668100D00000000000FF0000FB0000FF0000FF
              0000D90000FE00003B00BE9CAAC2B7B7D1D3D3CACBCBC3C5C5C4C4C4C3C5C5C3
              C4C4C3C5C5C3C4C40000C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C2C3C3BEAFBF46
              F546536053532553533E53533B53533E535348505244503E303CFFFFFFCDCFCF
              C7C7C7C4C4C4C4C4C4C5C5C5C4C4C4C5C5C5C4C4C4C5C5C50000C5C5C5C5C5C5
              C5C5C5C5C5C5C5C5C5C4C4C4CED3CEEBC1EBE9E7E9E9DBE9E9DCE9E9DCE9E9DB
              E9E9DCE9E9DAE9EBE9EBBFC0BFC4C4C4C4C4C4C5C5C5C5C5C5C5C5C5C5C5C5C5
              C5C5C5C5C5C5C5C50000}
            Opaque = False
            Spacing = 0
            Visible = False
          end
          object ToolbarButton971: TToolbarButton97
            Left = 872
            Top = 40
            Width = 127
            Height = 29
            AllowAllUp = True
            GroupIndex = 1
            DropdownAlways = True
            DropdownMenu = PpMenuPessoa
            Caption = '&Pessoa'
            Flat = False
            Glyph.Data = {
              D6010000424DD601000000000000760000002800000020000000160000000100
              04000000000060010000C40E0000C40E00001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888077077088
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
            Opaque = False
            Spacing = 0
          end
          object TLabel
            Left = 480
            Top = 72
            Width = 105
            Height = 13
            Caption = 'Situação no Plano'
          end
          object Label68: TLabel
            Left = 606
            Top = -1
            Width = 121
            Height = 13
            Caption = 'Tipo do Responsável'
          end
          object Label69: TLabel
            Left = 608
            Top = 36
            Width = 128
            Height = 13
            Caption = 'Nome do Responsável'
          end
          object EdMat: TEdit
            Left = 5
            Top = 86
            Width = 140
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
          object EdCpf: TEdit
            Left = 446
            Top = 13
            Width = 156
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
          object EdInsc: TEdit
            Left = 480
            Top = 50
            Width = 122
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
            TabOrder = 2
          end
          object EdPlano: TEdit
            Left = 227
            Top = 50
            Width = 249
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
            TabOrder = 3
          end
          object EdNome: TEdit
            Left = 5
            Top = 13
            Width = 437
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
            TabOrder = 4
          end
          object edPatro: TEdit
            Left = 148
            Top = 86
            Width = 324
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
            TabOrder = 5
          end
          object BtnConsultaAtendimento: TBitBtn
            Left = 872
            Top = 8
            Width = 127
            Height = 30
            Caption = '&Cons Atend'
            TabOrder = 6
            OnClick = BtnConsultaAtendimentoClick
            Glyph.Data = {
              B6010000424DB60100000000000076000000280000001D000000140000000100
              04000000000040010000C40E0000C40E00001000000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00780000000000
              0077777777777777700070B7B7B7B7B7B3077777777777777000707B7B7B7B7B
              7330777777777777700070B7B7B7B7B7B333077777777777700070FFFFFFFFFF
              F3330777700077777000707B7B0B0B0B7B3307770999077770007707B7B0B0B7
              B733007709990777700080007B0B0B0B7B700087099907777000033307B7B7B7
              B70333077000777770000FB30B000000703333070999077770000BF307033330
              B03BF30709990777700070BF3007BFB300BFB0070999907770007700FBFBFBFB
              FBF8007770999907700077770000000000077777770999907000777777777777
              7777700000709999000077777777777777777099907709990000777777777777
              7777709999009999000077777777777777777009999999907000777777777777
              7777770099999907700077777777777777777777000000777000}
          end
          object GpAnteiror: TGroupBox
            Left = 700
            Top = 70
            Width = 145
            Height = 39
            Caption = ' Atendimento Anterior '
            TabOrder = 7
            object EdCod: TEdit
              Left = 6
              Top = 14
              Width = 88
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
            object EdSeque: TEdit
              Left = 98
              Top = 14
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
            Top = 50
            Width = 218
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
            TabOrder = 8
          end
          object DBEdit1: TDBEdit
            Left = 312
            Top = 128
            Width = 84
            Height = 21
            DataField = 'EXISTERAD'
            DataSource = DsAssuntoxAtend
            TabOrder = 9
          end
          object EdTipoRespon: TEdit
            Left = 608
            Top = 13
            Width = 165
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
            TabOrder = 10
          end
          object EdNomeRespon: TEdit
            Left = 608
            Top = 50
            Width = 165
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
            TabOrder = 11
          end
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 1238
    inherited Toolbar971: TToolbar97
      ParentFont = False
      inherited sbtnInserir: TToolbarButton97
        Width = 131
        GroupIndex = 0
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
        Left = 262
        Visible = False
      end
      inherited sbtnProcurar: TToolbarButton97
        Left = 131
        Width = 131
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
        Left = 453
        Width = 45
        Glyph.Data = {00000000}
        GlyphMask.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          55555555FFFFFFFF5555555000000005555555577777777FF555550999999900
          55555575555555775F55509999999901055557F55555557F75F5001111111101
          105577FFFFFFFF7FF75F00000000000011057777777777775F755070FFFFFF0F
          01105777F555557F7FF75500FFFFFF0F00105577F555FF7F77575550FF70000F
          0F0055575FF777757F775555000FFFFF0F005555777555FF7F77555550FF7000
          0F055555575FF777757F555555000FFFFF05555555777555FF7F55555550FF70
          0005555555575FF7777555555555000555555555555577755555555555555555
          5555555555555555555555555555555555555555555555555555}
        Images = nil
        Visible = False
      end
      object tbbConsultaParticip: TToolbarButton97
        Left = 322
        Top = 0
        Width = 131
        Height = 41
        AllowAllUp = True
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
        OnClick = tbbConsultaParticipClick
      end
      object btnAgendamento: TToolbarButton97
        Left = 528
        Top = 0
        Width = 60
        Height = 41
        AllowAllUp = True
        Caption = 'A&gendar'
        Glyph.Data = {
          AA030000424DAA03000000000000360000002800000011000000110000000100
          1800000000007403000000000000000000000000000000000000D8E9ECD8E9EC
          8080808080808080808080808080808080808080808080808080808080808080
          80D8E9ECD8E9ECD8E9ECD8E9EC00D8E9ECD8E9EC000000FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080D8E9ECD8E9ECD8E9ECD8E9
          EC00D8E9ECD8E9EC000000FFFFFFFFFFFFFF0000FFFFFFFFFFFFFF0000FFFFFF
          FFFFFFFFFFFF808080808080808080D8E9ECD8E9EC00D8E9ECD8E9EC000000FF
          FFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFF0000FFFFFFFFFFFF808080FFFFFF
          808080D8E9ECD8E9EC00D8E9ECD8E9EC000000FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FFFFFF80808080808080808000D8E9
          ECD8E9EC00000000000000000000000000000000000000000000000000000000
          0000808080FFFFFF808080FFFFFF80808000D8E9ECD8E9ECD8E9ECD8E9EC0000
          00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FF
          FFFF80808000D8E9ECD8E9ECD8E9ECD8E9EC0000000000000000000000000000
          00000000000000000000000000000000808080FFFFFF80808000D8E9ECD8E9EC
          D8E9ECD8E9ECD8E9ECD8E9EC000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF80808000D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
          0000000000000000000000000000000000000000000000000000000000008080
          8000D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
          D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC0080808080808080808080
          8080808080808080808080808080808080808080808080D8E9ECD8E9EC0000FF
          D8E9ECD8E9ECD8E9EC00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF808080D8E9EC0000FF0000FF0000FFD8E9ECD8E9EC000000
          00FFFFFFFFFFFFFF0000FFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFF808080D8
          E9ECD8E9EC0000FFD8E9ECD8E9ECD8E9EC00000000FFFFFFFFFFFFFFFFFFFF00
          00FFFFFFFFFFFFFF0000FFFFFFFFFFFF808080D8E9EC0000FF0000FFD8E9ECD8
          E9ECD8E9EC00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF808080D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC00000000000000
          000000000000000000000000000000000000000000000000808080D8E9ECD8E9
          ECD8E9ECD8E9ECD8E9ECD8E9EC00}
        ImageIndex = 9
        Images = ImlPadrao
        Layout = blGlyphTop
        Opaque = False
        Spacing = 0
        OnClick = btnAgendamentoClick
      end
      object ToolbarSep972: TToolbarSep97
        Left = 498
        Top = 0
        Blank = True
        SizeHorz = 30
      end
    end
  end
  inherited Dock971: TDock97
    Top = 537
    Width = 1238
    inherited tb97Fundo: TToolbar97
      Left = 552
      DockPos = 552
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 383
      DockPos = 383
      inherited ToolbarSep971: TToolbarSep97
        Left = 0
        Visible = False
      end
      inherited bbtnConfirmar: TBitBtn
        Left = 3
      end
      inherited bbtnCancelar: TBitBtn
        Tag = 9
      end
    end
    object EDIDPLANOPREV: TEdit
      Left = 152
      Top = 8
      Width = 121
      Height = 21
      TabOrder = 2
      Text = 'EDIDPLANOPREV'
      Visible = False
    end
  end
  object dblcTelefone: TCMDBLookupCombo [4]
    Left = 623
    Top = 369
    Width = 77
    Height = 21
    DropDownAlignment = taLeftJustify
    Selected.Strings = (
      'NUMERO'#9'10'#9'Número'#9'No')
    DataField = 'NUMERO'
    DataSource = dsRamal
    LookupTable = qryTelefones
    LookupField = 'NUMERO'
    Options = [loTitles]
    Style = csDropDownList
    TabOrder = 3
    AutoDropDown = True
    ShowButton = True
    UseTFields = False
    AllowClearKey = False
    ShowMatchText = True
  end
  object EdSitPlano: TEdit [5]
    Left = 485
    Top = 158
    Width = 218
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
    TabOrder = 4
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 818
    Top = 269
    TargetsData = (
      1
      3
      (
        ''
        'Text'
        0)
      (
        ''
        'DisplayLabel'
        0)
      (
        ''
        'Filter'
        0))
  end
  inherited ds: TwwDataSource
    Left = 950
    Top = 309
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update ATEND'
      'set'
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
      '  PERGUNTA = :PERGUNTA,'
      '  IDESTADO = :IDESTADO,'
      '  DDISOLIC = :DDISOLIC,'
      '  DDDSOLIC = :DDDSOLIC,'
      '  TIPOSOLIC = :TIPOSOLIC,'
      '  NUMEROTELSOLIC = :NUMEROTELSOLIC,'
      '  IDTELEFONE = :IDTELEFONE,'
      '  CODESTADOSOLIC = :CODESTADOSOLIC,'
      '  IDBENEFICIARIO = :IDBENEFICIARIO,'
      '  NUMDOCUMENTOCPF = :NUMDOCUMENTOCPF,'
      '  NUMDOCUMENTORG = :NUMDOCUMENTORG,'
      '  EMAIL = :EMAIL,'
      '  DTHORACHEGADA = :DTHORACHEGADA,'
      '  IDUSUARIO = :IDUSUARIO,'
      '  CONTATOTEL = :CONTATOTEL'
      'where'
      '  IDATEND = :OLD_IDATEND')
    InsertSQL.Strings = (
      'insert into ATEND'
      '  (IDATEND, IDTIPOATEND, CODATEND, DATA, NOMESOLICITANTE, '
      'TELSOLICITANTE, '
      '   CODATENDENTE, RESPOSTA, STATUS, OBSERVACAO, IDTITULAR, '
      'IDPESSJUR, DATAINICIO, '
      
        '   LOGRADOURO, NUMEROSOLIC, COMPLEMSOLIC, BAIRROSOLIC, CEPSOLIC,' +
        ' '
      'CIDADESOLIC, '
      
        '   COMPLCODATEND, IDLOCALATENDXCPU, PERGUNTA, IDESTADO, DDISOLIC' +
        ', '
      'DDDSOLIC, '
      '   TIPOSOLIC, NUMEROTELSOLIC, IDTELEFONE, CODESTADOSOLIC, '
      'IDBENEFICIARIO, '
      '   NUMDOCUMENTOCPF, NUMDOCUMENTORG, EMAIL, DTHORACHEGADA, '
      'IDUSUARIO, CONTATOTEL)'
      'values'
      '  (:IDATEND, :IDTIPOATEND, :CODATEND, :DATA, :NOMESOLICITANTE, '
      ':TELSOLICITANTE, '
      '   :CODATENDENTE, :RESPOSTA, :STATUS, :OBSERVACAO, :IDTITULAR, '
      ':IDPESSJUR, '
      '   :DATAINICIO, :LOGRADOURO, :NUMEROSOLIC, :COMPLEMSOLIC, '
      ':BAIRROSOLIC, '
      '   :CEPSOLIC, :CIDADESOLIC, :COMPLCODATEND, :IDLOCALATENDXCPU, '
      ':PERGUNTA, '
      
        '   :IDESTADO, :DDISOLIC, :DDDSOLIC, :TIPOSOLIC, :NUMEROTELSOLIC,' +
        ' '
      ':IDTELEFONE, '
      '   :CODESTADOSOLIC, :IDBENEFICIARIO, :NUMDOCUMENTOCPF, '
      ':NUMDOCUMENTORG, '
      '   :EMAIL, :DTHORACHEGADA, :IDUSUARIO, :CONTATOTEL)')
    DeleteSQL.Strings = (
      'delete from ATEND'
      'where'
      '  IDATEND = :OLD_IDATEND')
    Left = 230
    Top = 474
  end
  inherited MontaSelect: TMontaSelect
    Caption = ''
    Colunas.Strings = (
      'DECODE(DEP.MATRICULA,NULL,ELEGPATRO.MATRICULA, DEP.MATRICULA)'
      'ELEGPATRO.MATRICULA'
      'ATEND.NOMESOLICITANTE'
      'ATEND.CODATEND'
      'ATEND.COMPLCODATEND'
      'ATEND.STATUS'
      'PESSOA.NOME'
      'PLANPREV.NOME'
      'PARTPREVPLAN.INSCRICAONUMERO'
      'PESSOA.NUMDOCUMENTO'
      'PJ.NOME'
      'TRUNC(ATEND.DATA)'
      'ATEND.IDATEND'
      'BF.NOME'
      'SITPLANOPREV.DESCRICAO'
      'TIPORECEBEDOR.DESCRICAO'
      'PES.NOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'N'
      'N'
      'C'
      'C'
      'C'
      'N'
      'C'
      'C'
      'D'
      'N'
      'C'
      'C'
      'C'
      '')
    Descricao.Strings = (
      'Matrícula Solicitante'
      'Matrícula Titular'
      'Nome Solicitante'
      'Código Atendimento'
      'Complemento'
      'Status'
      'Nome Titular'
      'Plano'
      'Inscrição'
      'CPF'
      'Patrocinadora'
      'Data Atendimento'
      'Número Atendimento'
      'Nome Beneficiário'
      'Situação no Plano'
      ''
      '')
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
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PLANPREV'
      'PESSOA PJ'
      'SITPART'
      'PARTPREVPLAN'
      'ELEGPATRO'
      'PESSOA'
      'ATEND'
      'PESSOA BF'
      'DEPENTIT DEP'
      'SITPLANOPREV'
      'TIPORECEBEDOR'
      'BFCIARIOTITPLAN'
      'PESSOA PES')
    CamposChave.Strings = (
      'PESSOA.NOME'
      'PESSOA.NUMDOCUMENTO'
      'ELEGPATRO.MATRICULA'
      'PARTPREVPLAN.INSCRICAONUMERO'
      'PLANPREV.NOME'
      'ATEND.IDATEND'
      'PJ.IDPESSOA'
      'ATEND.IDTITULAR'
      'SITPART.DESCRICAO'
      'PJ.NOME'
      'BF.NOME'
      'PLANPREV.IDPLANOPREV'
      'SITPLANOPREV.DESCRICAO'
      'TIPORECEBEDOR.DESCRICAO'
      'PES.NOME'
      'ATEND.IDBENEFICIARIO')
    Filtro.Strings = (
      'ATEND.IDTITULAR = ELEGPATRO.IDPESSOA'
      'PJ.IDPESSOA = ELEGPATRO.IDPESSJUR'
      'PARTPREVPLAN.IDPESSOA(+) = ELEGPATRO.IDPESSOA'
      'PARTPREVPLAN.IDPESSJUR(+) = ELEGPATRO.IDPESSJUR'
      'PARTPREVPLAN.IDPLANOPREV = PLANPREV.IDPLANOPREV(+)'
      'PARTPREVPLAN.IDSITPART = SITPART.IDSITPART(+)'
      'PARTPREVPLAN.FLGDESATIVADO(+) = 0'
      'ATEND.IDBENEFICIARIO = BF.IDPESSOA(+)'
      'ELEGPATRO.IDPESSOA = PESSOA.IDPESSOA'
      'DEP.IDPESSOA = ATEND.IDBENEFICIARIO'
      'DEP.IDTITULAR = ELEGPATRO.IDPESSOA'
      'SITPLANOPREV.IDSITPLANOPREV  = PARTPREVPLAN.IDSITPLANOPREV'
      'ATEND.IDBENEFICIARIO=BFCIARIOTITPLAN.IDPESSOA'
      
        'BFCIARIOTITPLAN.CODTIPORECEBEDOR=TIPORECEBEDOR.CODTIPORECEBEDOR ' +
        '(+)'
      'BFCIARIOTITPLAN.IDRESPONNAOREC = PES.IDPESSOA(+)'
      '( ( BFCIARIOTITPLAN.IDPLANOPREV = PARTPREVPLAN.IDPLANOPREV ) )'
      
        '   ( ( BFCIARIOTITPLAN.IDBENEFICIO = (SELECT BFCIARIOTITPLAN.IDB' +
        'ENEFICIO FROM  ELEGPATRO,      PESSOA,      BFCIARIOTITPLAN WHER' +
        'E ( ELEGPATRO.MATRICULA  = DEP.MATRICULA ) AND ( ELEGPATRO.IDPES' +
        'SOA = PESSOA.IDPESSOA ) AND (BFCIARIOTITPLAN.IDPESSOA = PESSOA.I' +
        'DPESSOA) AND (ROWNUM = 1)))   )')
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
      ''
      'DD/MM/YYYY:HH:MM:SS'
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '13'
      '13'
      '35'
      '10'
      '10'
      '12'
      '35'
      '35'
      '13'
      '18'
      '30'
      '10'
      '10'
      '35'
      '50'
      '60'
      '10')
    OperComparador.Strings = (
      '1'
      '1'
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
      '-1'
      '-1'
      '1'
      '1'
      '-1')
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
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 904
    Top = 304
  end
  inherited ImlPadrao: TImageList
    Left = 929
    Top = 6
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
      0000000000000000000000000000F5FFF8005A61FE00E5F7EA00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FCFFFF00473955000000C400F4FFF800DDEFF200DDEF
      F200000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF001B2D2D0000969100877D6900B2BBBD00ACB4B600AAB1
      B300ECFFFF00DAECEF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF001B5D5D0000999900000000007C7C7C006A7070006D6C6C003E45
      450038353400D5E4E600DDEFF200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E5F8FB00EBFEFF00EBFEFF00FFFF
      FF00175959000091910020080800FFD3D300FFFFFF00FFAFAF00FFFFFF00FFBB
      BB00C7CFCF002F2C2B00D5E4E600DAECEF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006B6868000F0D0C00311E1E000542
      42000DBCBC0024040400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C7CFCF0038353400ECFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004A4A4A00FFFFFF002874780000AC
      B00094747400C7CFCF00FFA7A700FFFFFF00FFFFFF00FFFFFF00BFDFBF00A7D3
      A700FFFFFF00FFBBBB003E454500B0B9BA000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005C5C6400706C180048705400EBD7
      B3003C3C4000FFFFFF00FFFFFF00FFFFFF00FFFFFF00C7E3C70000780000FFFF
      FF00FFFFFF00FFFFFF006E6D6D00B1BBBC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000054545C00CBCB7B00CCC88400C3C3
      6F0040485000FFB3B300FFFFFF00FFFFFF00FFFFFF0058AC5800FFFFFF00FFFF
      FF00FFFFFF00FFAFAF006A717100B1BBBC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004C4C4C00FFFFFF00B0B06000FFFF
      FF002A2A2A00FFFFFF00FFFFFF00FFFFFF00FFFFFF0060B06000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF006E6D6D00ACB6B7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000054545C00C3C37300C0C08000B5B5
      6500EAEAF600545C5C00FFB7B700FFFFFF00FFFFFF0058AC5800FFFFFF00FFFF
      FF00FFFFFF00FFC5C5002D323200E4F2F5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000054545C00CBCB7B00C4C48400BDBD
      7100E0E0C00078787C00BBCBCB00FFB7B700FFFFFF00AFDFB700FFFFFF00FFA7
      A700FFFFFF00363D3D00D9DBDB00DBEEF1000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000054545400D0E8F80090A85000C8E0
      F80088A04400FFFFFF00788C8C0053636300FFFFFF00FFB7BB00FFFFFF00BFC7
      C700434A4A00DCE0E000DCF0F400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000546C6C00CB000000CB000000C700
      0000BB000000AF000000D3242400E2B6B6002A525200386060003252520080A8
      A800AA595900A4B6B700DDEFF200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004E5E5E00DF383800739B9B006BA3
      A300FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      00006A000000AAC3C400DDEFF200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009C9C9C004E5E5E005C5C5C005C5C
      5C004C6C6C004C6C6C004C6C6C004C6C6C004C6C6C004C6C6C004C6C6C004C6C
      6C00505F5F00C6CFD000DBEDF000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      00000000000000000000000000000000FFFFFE3F00000000FFFFFC0F00000000
      FFFFF80300000000FFFFF00100000000FFFF000000000000FFFF000000000000
      E007000000000000F00F000000000000F81F000000000000FC3F000000000000
      FE7F000000000000FFFF000000000000FFFF000100000000FFFF000100000000
      FFFF000100000000FFFF000100000000FC1FFFFFFFFFFFFFF007F83FF83FF83F
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
    BeforeConfirma = CmeCadastroBeforeConfirma
    AfterConfirma = CmeCadastroAfterConfirma
    Left = 214
    Top = 322
  end
  inherited qry: TwwQuery
    BeforeOpen = qryBeforeOpen
    AfterOpen = qryAfterOpen
    SQL.Strings = (
      
        'SELECT A.IDATEND,          A.IDTIPOATEND,    A.CODATEND,   A.DAT' +
        'A,           A.NOMESOLICITANTE,'
      
        '       A.TELSOLICITANTE,   A.CODATENDENTE,   A.RESPOSTA,   A.STA' +
        'TUS,         A.OBSERVACAO,'
      
        '       A.IDTITULAR,        A.IDPESSJUR,      A.DATAINICIO, A.LOG' +
        'RADOURO,     A.NUMEROSOLIC,'
      
        '       A.COMPLEMSOLIC,     A.BAIRROSOLIC,    A.CEPSOLIC,   A.CID' +
        'ADESOLIC,    A.COMPLCODATEND,'
      
        '       A.IDLOCALATENDXCPU, A.PERGUNTA,       A.IDESTADO,   A.DDI' +
        'SOLIC,       A.DDDSOLIC,'
      
        '       A.TIPOSOLIC,        A.NUMEROTELSOLIC, A.IDTELEFONE, (SELE' +
        'CT DISTINCT CODESTADO FROM ENDPESS WHERE IDPESSOA = A.IDBENEFICI' +
        'ARIO) AS CODESTADOSOLIC, A.IDBENEFICIARIO,'
      
        '       A.NUMDOCUMENTOCPF,  A.NUMDOCUMENTORG, A.EMAIL,      A.DTH' +
        'ORACHEGADA,  A.IDUSUARIO, A.CONTATOTEL'
      'FROM ATEND A'
      'WHERE (IDATEND = :IDATEND)'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 201
    Top = 421
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDATEND'
        ParamType = ptUnknown
      end>
    object qryIDATEND: TFloatField
      FieldName = 'IDATEND'
      Origin = 'BASEDADOS.ATEND.IDATEND'
    end
    object qryIDTIPOATEND: TFloatField
      FieldName = 'IDTIPOATEND'
      Origin = 'BASEDADOS.ATEND.IDTIPOATEND'
    end
    object qryCODATEND: TFloatField
      FieldName = 'CODATEND'
      Origin = 'BASEDADOS.ATEND.CODATEND'
    end
    object qryDATA: TDateTimeField
      FieldName = 'DATA'
      Origin = 'BASEDADOS.ATEND.DATA'
    end
    object qryNOMESOLICITANTE: TStringField
      FieldName = 'NOMESOLICITANTE'
      Origin = 'BASEDADOS.ATEND.NOMESOLICITANTE'
      Size = 60
    end
    object qryTELSOLICITANTE: TStringField
      FieldName = 'TELSOLICITANTE'
      Origin = 'BASEDADOS.ATEND.TELSOLICITANTE'
      Size = 14
    end
    object qryCODATENDENTE: TStringField
      FieldName = 'CODATENDENTE'
      Origin = 'BASEDADOS.ATEND.CODATENDENTE'
    end
    object qryRESPOSTA: TStringField
      FieldName = 'RESPOSTA'
      Origin = 'BASEDADOS.ATEND.RESPOSTA'
      Size = 250
    end
    object qrySTATUS: TStringField
      FieldName = 'STATUS'
      Origin = 'BASEDADOS.ATEND.STATUS'
    end
    object qryOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Origin = 'BASEDADOS.ATEND.OBSERVACAO'
      Size = 250
    end
    object qryIDTITULAR: TFloatField
      FieldName = 'IDTITULAR'
      Origin = 'BASEDADOS.ATEND.IDTITULAR'
    end
    object qryIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
      Origin = 'BASEDADOS.ATEND.IDPESSJUR'
    end
    object qryDATAINICIO: TDateTimeField
      FieldName = 'DATAINICIO'
      Origin = 'BASEDADOS.ATEND.DATAINICIO'
    end
    object qryLOGRADOURO: TStringField
      FieldName = 'LOGRADOURO'
      Origin = 'BASEDADOS.ATEND.LOGRADOURO'
      Size = 60
    end
    object qryNUMEROSOLIC: TStringField
      FieldName = 'NUMEROSOLIC'
      Origin = 'BASEDADOS.ATEND.NUMEROSOLIC'
      Size = 10
    end
    object qryCOMPLEMSOLIC: TStringField
      FieldName = 'COMPLEMSOLIC'
      Origin = 'BASEDADOS.ATEND.COMPLEMSOLIC'
    end
    object qryBAIRROSOLIC: TStringField
      FieldName = 'BAIRROSOLIC'
      Origin = 'BASEDADOS.ATEND.BAIRROSOLIC'
      Size = 30
    end
    object qryCEPSOLIC: TStringField
      FieldName = 'CEPSOLIC'
      Origin = 'BASEDADOS.ATEND.CEPSOLIC'
      Size = 8
    end
    object qryCIDADESOLIC: TStringField
      FieldName = 'CIDADESOLIC'
      Origin = 'BASEDADOS.ATEND.CIDADESOLIC'
      Size = 30
    end
    object qryCOMPLCODATEND: TFloatField
      FieldName = 'COMPLCODATEND'
      Origin = 'BASEDADOS.ATEND.COMPLCODATEND'
    end
    object qryIDLOCALATENDXCPU: TFloatField
      FieldName = 'IDLOCALATENDXCPU'
      Origin = 'BASEDADOS.ATEND.IDLOCALATENDXCPU'
    end
    object qryPERGUNTA: TStringField
      FieldName = 'PERGUNTA'
      Origin = 'BASEDADOS.ATEND.PERGUNTA'
      Size = 250
    end
    object qryIDESTADO: TFloatField
      FieldName = 'IDESTADO'
      Origin = 'BASEDADOS.ATEND.IDESTADO'
    end
    object qryDDISOLIC: TStringField
      FieldName = 'DDISOLIC'
      Origin = 'BASEDADOS.ATEND.DDISOLIC'
      FixedChar = True
      Size = 4
    end
    object qryDDDSOLIC: TStringField
      FieldName = 'DDDSOLIC'
      Origin = 'BASEDADOS.ATEND.DDDSOLIC'
      FixedChar = True
      Size = 5
    end
    object qryTIPOSOLIC: TStringField
      FieldName = 'TIPOSOLIC'
      Origin = 'BASEDADOS.ATEND.TIPOSOLIC'
      FixedChar = True
      Size = 5
    end
    object qryNUMEROTELSOLIC: TStringField
      FieldName = 'NUMEROTELSOLIC'
      Origin = 'BASEDADOS.ATEND.NUMEROTELSOLIC'
      FixedChar = True
    end
    object qryIDTELEFONE: TFloatField
      FieldName = 'IDTELEFONE'
      Origin = 'BASEDADOS.ATEND.IDTELEFONE'
    end
    object qryCODESTADOSOLIC: TStringField
      FieldName = 'CODESTADOSOLIC'
      Origin = 'BASEDADOS.ATEND.CODESTADOSOLIC'
      FixedChar = True
      Size = 3
    end
    object qryIDBENEFICIARIO: TFloatField
      FieldName = 'IDBENEFICIARIO'
      Origin = 'BASEDADOS.ATEND.IDBENEFICIARIO'
    end
    object qryNUMDOCUMENTOCPF: TStringField
      FieldName = 'NUMDOCUMENTOCPF'
      Origin = 'BASEDADOS.ATEND.NUMDOCUMENTOCPF'
      FixedChar = True
      Size = 18
    end
    object qryNUMDOCUMENTORG: TStringField
      FieldName = 'NUMDOCUMENTORG'
      Origin = 'BASEDADOS.ATEND.NUMDOCUMENTORG'
      FixedChar = True
      Size = 18
    end
    object qryEMAIL: TStringField
      FieldName = 'EMAIL'
      Origin = 'BASEDADOS.ATEND.EMAIL'
      Size = 100
    end
    object qryDTHORACHEGADA: TDateTimeField
      FieldName = 'DTHORACHEGADA'
      Origin = 'BASEDADOS.ATEND.DTHORACHEGADA'
    end
    object qryIDUSUARIO: TFloatField
      FieldName = 'IDUSUARIO'
      Origin = 'BASEDADOS.ATEND.IDUSUARIO'
    end
    object qryCONTATOTEL: TStringField
      FieldName = 'CONTATOTEL'
      Origin = 'BASEDADOS.ATEND.CONTATOTEL'
      Size = 30
    end
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 888
    Top = 8
  end
  object dspartprev: TwwDataSource
    Left = 1221
    Top = 213
  end
  object dsreserva: TwwDataSource
    Left = 1023
    Top = 117
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
    OperComparador.Strings = (
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 1176
    Top = 256
  end
  object QryAssuntoxAtend: TwwQuery
    CachedUpdates = True
    AfterScroll = QryAssuntoxAtendAfterScroll
    DatabaseName = 'BaseDados'
    Filtered = True
    SQL.Strings = (
      
        'SELECT A.IDASSUNTOXATEND, A.IDASSUNTO, A.IDATEND, A.IDASSUNTOXRE' +
        'SP, A.IDPROCESSO,'
      '       DECODE(A.IDPROCESSO,NULL,0.00,1.00) AS EXISTERAD,'
      '       DECODE(A.IDRUBS,NULL,0.00,1.00) AS EXISTERUB,'
      
        '       R.DESCRESPATEN, ASS.NOME, ASS.IDTIPOPROCESSO, ASS.IDCONFI' +
        'GRUBS AS IDMODELORUB,'
      '       ASS.IDGRUPOASSUNTO AS IDGRUPOASSUNTO, RU.IDRUBS AS IDRUB,'
      '       A.IDCONTRATOEMPTMO,'
      '       A.VLRSOLICITADO,'
      '       A.NUMPARCELAS,'
      '       ASS.FLGCHAMAEMPRESTIM '
      
        'FROM ASSUNTOXATEND A, RESPATEND R, ASSUNTOXRESP AR, ASSUNTO ASS,' +
        ' RUBS RU'
      'WHERE (IDATEND           = :IDATEND)'
      '  AND (A.IDASSUNTOXRESP  = AR.IDASSUNTOXRESP(+))'
      '  AND (AR.IDRESPATEND    = R.IDRESPATEND(+))'
      '  AND (A.IDASSUNTO       = ASS.IDASSUNTO)'
      '  AND (A.IDASSUNTOXATEND = RU.IDASSUNTOXATEND(+))'
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = UpdAssuntoxAtend
    ControlType.Strings = (
      'DESCRESPATEN;RichEdit;ReRespostaGrid'
      'EXISTERAD;CheckBox;1;0'
      'EXISTERUB;CheckBox;1;0')
    ValidateWithMask = True
    Left = 706
    Top = 244
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDATEND'
        ParamType = ptUnknown
        Value = 1
      end>
    object QryAssuntoxAtendIDASSUNTOXATEND: TFloatField
      FieldName = 'IDASSUNTOXATEND'
    end
    object QryAssuntoxAtendIDASSUNTO: TFloatField
      FieldName = 'IDASSUNTO'
    end
    object QryAssuntoxAtendIDATEND: TFloatField
      FieldName = 'IDATEND'
    end
    object QryAssuntoxAtendIDASSUNTOXRESP: TFloatField
      FieldName = 'IDASSUNTOXRESP'
    end
    object QryAssuntoxAtendIDPROCESSO: TFloatField
      FieldName = 'IDPROCESSO'
    end
    object QryAssuntoxAtendEXISTERAD: TFloatField
      FieldName = 'EXISTERAD'
    end
    object QryAssuntoxAtendEXISTERUB: TFloatField
      FieldName = 'EXISTERUB'
    end
    object QryAssuntoxAtendDESCRESPATEN: TMemoField
      FieldName = 'DESCRESPATEN'
      BlobType = ftMemo
      Size = 2000
    end
    object QryAssuntoxAtendNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object QryAssuntoxAtendIDTIPOPROCESSO: TFloatField
      FieldName = 'IDTIPOPROCESSO'
    end
    object QryAssuntoxAtendIDMODELORUB: TFloatField
      FieldName = 'IDMODELORUB'
    end
    object QryAssuntoxAtendIDGRUPOASSUNTO: TFloatField
      FieldName = 'IDGRUPOASSUNTO'
    end
    object QryAssuntoxAtendIDRUB: TFloatField
      FieldName = 'IDRUB'
    end
    object QryAssuntoxAtendIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object QryAssuntoxAtendVLRSOLICITADO: TFloatField
      FieldName = 'VLRSOLICITADO'
    end
    object QryAssuntoxAtendNUMPARCELAS: TFloatField
      FieldName = 'NUMPARCELAS'
    end
    object QryAssuntoxAtendFLGCHAMAEMPRESTIM: TFloatField
      FieldName = 'FLGCHAMAEMPRESTIM'
    end
  end
  object DsAssuntoxAtend: TwwDataSource
    DataSet = QryAssuntoxAtend
    Left = 578
    Top = 365
  end
  object UpdAssuntoxAtend: TUpdateSQL
    ModifySQL.Strings = (
      'update ASSUNTOXATEND'
      'set'
      '  IDASSUNTOXATEND = :IDASSUNTOXATEND,'
      '  IDASSUNTO = :IDASSUNTO,'
      '  IDATEND = :IDATEND,'
      '  IDASSUNTOXRESP = :IDASSUNTOXRESP,'
      '  IDPROCESSO = :IDPROCESSO,'
      '  EXISTERAD = :EXISTERAD,'
      '  EXISTERUB = :EXISTERUB,'
      '  DESCRESPATEN = :DESCRESPATEN,'
      '  NOME = :NOME,'
      '  IDTIPOPROCESSO = :IDTIPOPROCESSO,'
      '  IDMODELORUB = :IDMODELORUB,'
      '  IDGRUPOASSUNTO = :IDGRUPOASSUNTO,'
      '  IDRUB = :IDRUB,'
      '  FLGCHAMAEMPRESTIM = :FLGCHAMAEMPRESTIM,'
      '  IDCONTRATOEMPTMO = :IDCONTRATOEMPTMO,'
      '  VLRSOLICITADO = :VLRSOLICITADO,'
      '  NUMPARCELAS = :NUMPARCELAS'
      'where'
      '  IDASSUNTOXATEND = :OLD_IDASSUNTOXATEND and'
      '  IDASSUNTO = :OLD_IDASSUNTO and'
      '  IDATEND = :OLD_IDATEND'
      ' ')
    InsertSQL.Strings = (
      'insert into ASSUNTOXATEND'
      '  (IDASSUNTOXATEND, IDASSUNTO, IDATEND, IDASSUNTOXRESP, '
      'IDPROCESSO, EXISTERAD, '
      '   EXISTERUB, DESCRESPATEN, NOME, IDTIPOPROCESSO, IDMODELORUB, '
      'IDGRUPOASSUNTO, '
      
        '   IDRUB, IDCONTRATOEMPTMO, VLRSOLICITADO, NUMPARCELAS, FLGCHAMA' +
        'EMPRESTIM)'
      'values'
      '  (:IDASSUNTOXATEND, :IDASSUNTO, :IDATEND, :IDASSUNTOXRESP,'
      ':IDPROCESSO,'
      
        '   :EXISTERAD, :EXISTERUB, :DESCRESPATEN, :NOME, :IDTIPOPROCESSO' +
        ','
      ':IDMODELORUB,'
      
        '   :IDGRUPOASSUNTO, :IDRUB, :IDCONTRATOEMPTMO, :VLRSOLICITADO, :' +
        'NUMPARCELAS, :FLGCHAMAEMPRESTIM)')
    DeleteSQL.Strings = (
      'delete from ASSUNTOXATEND'
      'where'
      '  IDASSUNTOXATEND = :OLD_IDASSUNTOXATEND and'
      '  IDASSUNTO = :OLD_IDASSUNTO and'
      '  IDATEND = :OLD_IDATEND')
    Left = 244
    Top = 323
  end
  object QryAssuntoxAtendAnt: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '  A.IDASSUNTOXATEND, A.IDASSUNTO, A.IDATEND, A.IDASSUNTOXRESP, A' +
        '.IDPROCESSO, A.IDRUBS AS IDRUB,'
      
        '  DECODE(A.IDPROCESSO,NULL,0.00,1.00) AS EXISTERAD, DECODE(A.IDR' +
        'UBS,NULL,0.00,1.00) AS EXISTERUB,'
      
        '  R.DESCRESPATEN, ASS.NOME,  ASS.IDTIPOPROCESSO, ASS.IDCONFIGRUB' +
        'S AS IDMODELORUB'
      'FROM'
      '  ASSUNTOXATEND A, RESPATEND R, ASSUNTOXRESP AR, ASSUNTO ASS'
      'WHERE'
      '  (IDATEND = :IDATEND) AND'
      '  (A.IDASSUNTOXRESP = AR.IDASSUNTOXRESP(+)) AND'
      '  (AR.IDRESPATEND = R.IDRESPATEND(+)) AND'
      '  (A.IDASSUNTO = ASS.IDASSUNTO)'
      ''
      ' ')
    ValidateWithMask = True
    Left = 576
    Top = 364
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
    Left = 575
    Top = 325
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
    Left = 1112
    Top = 216
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
    Left = 49
    Top = 500
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
    Left = 241
    Top = 526
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
      'SELECT CODESTADO ,IDESTADO,IDPAIS FROM ESTADO'
      'where'
      'CODESTADO = :CODESTADO')
    ValidateWithMask = True
    Left = 69
    Top = 516
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
    object QryEstadoIDPAIS: TFloatField
      FieldName = 'IDPAIS'
      Origin = 'BASEDADOS.ESTADO.IDPAIS'
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
    Left = 1026
    Top = 420
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
  object qryTipoAtend: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDTIPOATEND, NOME, FLGEMITERUBS'
      'FROM TIPOATEND'
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 410
    Top = 244
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
  object dsTipoAtend: TwwDataSource
    DataSet = qryTipoAtend
    Left = 469
    Top = 373
  end
  object qryCidades: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '  C.IDCIDADES, '
      '  E.CODESTADO, '
      '  C.NOME, '
      '  C.IDESTADO,'
      '  C.IDPAIS,'
      '  E.CODESTADO AS UF'
      'FROM CIDADES C, ESTADO E'
      'WHERE C.IDESTADO = E.IDESTADO'
      'ORDER BY C.NOME')
    ValidateWithMask = True
    Left = 368
    Top = 269
    object qryCidadesNOME: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 50
      FieldName = 'NOME'
      Origin = 'BASEDADOS.CIDADES.NOME'
      Size = 50
    end
    object qryCidadesUF: TStringField
      DisplayWidth = 3
      FieldName = 'UF'
      Origin = 'BASEDADOS.CIDADES.UF'
      FixedChar = True
      Size = 3
    end
    object qryCidadesIDCIDADES: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCIDADES'
      Origin = 'BASEDADOS.CIDADES.IDCIDADES'
      Visible = False
    end
    object qryCidadesCODESTADO: TStringField
      DisplayWidth = 3
      FieldName = 'CODESTADO'
      Origin = 'BASEDADOS.CIDADES.CODESTADO'
      Visible = False
      FixedChar = True
      Size = 3
    end
    object qryCidadesIDESTADO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDESTADO'
      Origin = 'BASEDADOS.CIDADES.IDESTADO'
      Visible = False
    end
    object qryCidadesIDPAIS: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPAIS'
      Origin = 'BASEDADOS.CIDADES.IDPAIS'
      Visible = False
    end
  end
  object qryUF: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODESTADO, NOMEESTADO, IDESTADO'
      'FROM ESTADO'
      'ORDER BY NOMEESTADO')
    ValidateWithMask = True
    Left = 716
    Top = 204
    object qryUFCODESTADO: TStringField
      FieldName = 'CODESTADO'
      Origin = 'BASEDADOS.ESTADO.CODESTADO'
      FixedChar = True
      Size = 3
    end
    object qryUFNOMEESTADO: TStringField
      FieldName = 'NOMEESTADO'
      Origin = 'BASEDADOS.ESTADO.NOMEESTADO'
      Size = 30
    end
    object qryUFIDESTADO: TFloatField
      FieldName = 'IDESTADO'
      Origin = 'BASEDADOS.ESTADO.IDESTADO'
    end
  end
  object dsEnderecos: TwwDataSource
    DataSet = qryEnderecos
    Left = 388
    Top = 309
  end
  object qryEnderecos: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '        EP.IDPESSOA, '
      '        EP.IDENDERECO, '
      '        EP.IDCIDADES,'
      '        EP.LOGRADOURO,'
      '        EP.IDPAIS,'
      '        EP.NOME, '
      '        DECODE(C.UF,NULL ,EP.CODESTADO,C.UF) AS CODESTADO,'
      '        NUMERO,'
      '        EP.COMPLEMENTO,'
      '        EP.BAIRRO,'
      '        C.NOME AS CIDADE,'
      '        EP.CEP'
      'FROM ENDPESS EP, CIDADES C'
      'WHERE'
      '  EP.IDCIDADES = C.IDCIDADES (+)'
      '  AND  IDPESSOA = :IdPessoa'
      ' ')
    UpdateObject = updEnderecos
    ValidateWithMask = True
    Left = 362
    Top = 300
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IdPessoa'
        ParamType = ptUnknown
        Value = 1215012
      end>
    object qryEnderecosLOGRADOURO: TStringField
      DisplayLabel = 'Logradouro'
      DisplayWidth = 60
      FieldName = 'LOGRADOURO'
      Origin = 'BASEDADOS.ENDPESS.LOGRADOURO'
      Size = 60
    end
    object qryEnderecosCOMPLEMENTO: TStringField
      DisplayLabel = 'Complemento'
      DisplayWidth = 20
      FieldName = 'COMPLEMENTO'
      Origin = 'BASEDADOS.ENDPESS.COMPLEMENTO'
    end
    object qryEnderecosNUMERO: TStringField
      DisplayLabel = 'Número'
      DisplayWidth = 8
      FieldName = 'NUMERO'
      Origin = 'BASEDADOS.ENDPESS.NUMERO'
      Size = 8
    end
    object qryEnderecosCEP: TStringField
      DisplayWidth = 8
      FieldName = 'CEP'
      Origin = 'BASEDADOS.ENDPESS.CEP'
      Size = 8
    end
    object qryEnderecosBAIRRO: TStringField
      DisplayLabel = 'Bairro'
      DisplayWidth = 20
      FieldName = 'BAIRRO'
      Origin = 'BASEDADOS.ENDPESS.BAIRRO'
    end
    object qryEnderecosCIDADE: TStringField
      DisplayLabel = 'Cidade'
      DisplayWidth = 50
      FieldName = 'CIDADE'
      Origin = 'BASEDADOS.CIDADES.NOME'
      Size = 50
    end
    object qryEnderecosCODESTADO: TStringField
      DisplayLabel = 'UF'
      DisplayWidth = 3
      FieldName = 'CODESTADO'
      Origin = 'BASEDADOS.CIDADES.UF'
      FixedChar = True
      Size = 3
    end
    object qryEnderecosNOME: TStringField
      DisplayLabel = 'Local'
      DisplayWidth = 40
      FieldName = 'NOME'
      Origin = 'BASEDADOS.ENDPESS.NOME'
      Size = 40
    end
    object qryEnderecosIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.ENDPESS.IDPESSOA'
      Visible = False
    end
    object qryEnderecosIDENDERECO: TFloatField
      FieldName = 'IDENDERECO'
      Origin = 'BASEDADOS.ENDPESS.IDENDERECO'
      Visible = False
    end
    object qryEnderecosIDCIDADES: TFloatField
      FieldName = 'IDCIDADES'
      Origin = 'BASEDADOS.ENDPESS.IDCIDADES'
      Visible = False
    end
    object qryEnderecosIDPAIS: TFloatField
      FieldName = 'IDPAIS'
      Origin = 'BASEDADOS.ENDPESS.IDPAIS'
      Visible = False
    end
  end
  object qryTelefones: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  B.LOGRADOURO,'
      '  B.IDENDERECO,'
      '  A.IDTELEFONE,'
      '  A.DDI,A.DDD,'
      '  A.NUMERO,'
      '  A.TIPO'
      'FROM'
      '  TELENDPESS A,'
      '  ENDPESS B'
      'WHERE B.IDPESSOA =  :IDPESSOA'
      '  AND B.IDENDERECO = A.IDENDERECO'
      ' '
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = updTelefones
    ValidateWithMask = True
    Left = 1124
    Top = 68
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object qryTelefonesLOGRADOURO: TStringField
      DisplayLabel = 'Logradouro'
      DisplayWidth = 51
      FieldName = 'LOGRADOURO'
      Origin = 'BASEDADOS.ENDPESS.LOGRADOURO'
      Size = 60
    end
    object qryTelefonesDDI: TStringField
      DisplayWidth = 6
      FieldName = 'DDI'
      Origin = 'BASEDADOS.TELENDPESS.DDI'
      FixedChar = True
      Size = 4
    end
    object qryTelefonesDDD: TStringField
      DisplayWidth = 6
      FieldName = 'DDD'
      Origin = 'BASEDADOS.TELENDPESS.DDD'
      FixedChar = True
      Size = 5
    end
    object qryTelefonesNUMERO: TStringField
      DisplayLabel = 'Telefone'
      DisplayWidth = 16
      FieldName = 'NUMERO'
      Origin = 'BASEDADOS.TELENDPESS.NUMERO'
    end
    object qryTelefonesTIPO: TStringField
      DisplayWidth = 11
      FieldName = 'TIPO'
      Origin = 'BASEDADOS.TELENDPESS.TIPO'
      FixedChar = True
      Size = 5
    end
    object qryTelefonesIDTELEFONE: TFloatField
      FieldName = 'IDTELEFONE'
      Origin = 'BASEDADOS.TELENDPESS.IDTELEFONE'
      Visible = False
    end
    object qryTelefonesIDENDERECO: TFloatField
      FieldName = 'IDENDERECO'
      Origin = 'BASEDADOS.ENDPESS.IDENDERECO'
      Visible = False
    end
  end
  object dsTelefone: TwwDataSource
    DataSet = qryTelefones
    Left = 1073
    Top = 69
  end
  object updTelefones: TUpdateSQL
    ModifySQL.Strings = (
      'update TELENDPESS'
      'set'
      '  IDTELEFONE = :IDTELEFONE,'
      '  IDENDERECO = :IDENDERECO,'
      '  DDI = :DDI,'
      '  DDD = :DDD,'
      '  TIPO = :TIPO,'
      '  NUMERO = :NUMERO,'
      '  TRGDTINCLUSAO = :TRGDTINCLUSAO,'
      '  TRGUSERINCLUSAO = :TRGUSERINCLUSAO,'
      '  COLUNA = :COLUNA'
      'where'
      '  IDTELEFONE = :OLD_IDTELEFONE')
    InsertSQL.Strings = (
      'insert into TELENDPESS'
      
        '  (IDTELEFONE, IDENDERECO, DDI, DDD, TIPO, NUMERO, TRGDTINCLUSAO' +
        ', TRGUSERINCLUSAO, '
      '   COLUNA)'
      'values'
      
        '  (:IDTELEFONE, :IDENDERECO, :DDI, :DDD, :TIPO, :NUMERO, :TRGDTI' +
        'NCLUSAO, '
      '   :TRGUSERINCLUSAO, :COLUNA)')
    DeleteSQL.Strings = (
      'delete from TELENDPESS'
      'where'
      '  IDTELEFONE = :OLD_IDTELEFONE')
    Left = 1161
    Top = 116
  end
  object updEnderecos: TUpdateSQL
    Tag = 1
    ModifySQL.Strings = (
      'update ENDPESS'
      'set'
      '  IDPESSOA = :IDPESSOA,'
      '  IDCIDADES = :IDCIDADES,'
      '  LOGRADOURO = :LOGRADOURO,'
      '  IDPAIS = :IDPAIS,'
      '  NOME = :NOME,'
      '  NUMERO = :NUMERO,'
      '  COMPLEMENTO = :COMPLEMENTO,'
      '  BAIRRO = :BAIRRO,'
      '  CEP = :CEP'
      'where'
      '  IDENDERECO = :OLD_IDENDERECO')
    InsertSQL.Strings = (
      'insert into ENDPESS'
      
        '  (IDPESSOA, IDCIDADES, LOGRADOURO, IDPAIS, NOME, NUMERO, COMPLE' +
        'MENTO, '
      '   BAIRRO, CEP)'
      'values'
      
        '  (:IDPESSOA, :IDCIDADES, :LOGRADOURO, :IDPAIS, :NOME, :NUMERO, ' +
        ':COMPLEMENTO, '
      '   :BAIRRO, :CEP)')
    DeleteSQL.Strings = (
      'delete from ENDPESS'
      'where'
      '  IDENDERECO = :OLD_IDENDERECO')
    Left = 637
    Top = 281
  end
  object qryParam: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM PARAMCENTRALAP')
    ValidateWithMask = True
    Left = 206
    Top = 364
    object qryParamIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.PARAMCENTRALAP.IDPESSOA'
    end
    object qryParamIDCARTAPADRAO: TFloatField
      FieldName = 'IDCARTAPADRAO'
      Origin = 'BASEDADOS.PARAMCENTRALAP.IDCARTAPADRAO'
    end
    object qryParamIDETIQPADRAO: TFloatField
      FieldName = 'IDETIQPADRAO'
      Origin = 'BASEDADOS.PARAMCENTRALAP.IDETIQPADRAO'
    end
    object qryParamIDTIPOATENDPADRAO: TFloatField
      FieldName = 'IDTIPOATENDPADRAO'
      Origin = 'BASEDADOS.PARAMCENTRALAP.IDTIPOATENDPADRAO'
    end
    object qryParamIDDOCRG: TFloatField
      FieldName = 'IDDOCRG'
      Origin = 'BASEDADOS.PARAMCENTRALAP.IDDOCRG'
    end
    object qryParamFLGCTRLPROTOCOLO: TFloatField
      FieldName = 'FLGCTRLPROTOCOLO'
      Origin = 'BASEDADOS.PARAMCENTRALAP.FLGCTRLPROTOCOLO'
    end
    object qryParamIDFIARIOENDINC: TFloatField
      FieldName = 'IDFIARIOENDINC'
      Origin = 'BASEDADOS.PARAMCENTRALAP.IDFIARIOENDINC'
    end
    object qryParamIDFIARIOTELEXC: TFloatField
      FieldName = 'IDFIARIOTELEXC'
      Origin = 'BASEDADOS.PARAMCENTRALAP.IDFIARIOTELEXC'
    end
    object qryParamIDFIARIOTELALT: TFloatField
      FieldName = 'IDFIARIOTELALT'
      Origin = 'BASEDADOS.PARAMCENTRALAP.IDFIARIOTELALT'
    end
    object qryParamIDFIARIOTELINC: TFloatField
      FieldName = 'IDFIARIOTELINC'
      Origin = 'BASEDADOS.PARAMCENTRALAP.IDFIARIOTELINC'
    end
    object qryParamIDFIARIOCCEXC: TFloatField
      FieldName = 'IDFIARIOCCEXC'
      Origin = 'BASEDADOS.PARAMCENTRALAP.IDFIARIOCCEXC'
    end
    object qryParamIDFIARIOCCALT: TFloatField
      FieldName = 'IDFIARIOCCALT'
      Origin = 'BASEDADOS.PARAMCENTRALAP.IDFIARIOCCALT'
    end
    object qryParamIDFIARIOCCINC: TFloatField
      FieldName = 'IDFIARIOCCINC'
      Origin = 'BASEDADOS.PARAMCENTRALAP.IDFIARIOCCINC'
    end
    object qryParamIDFIARIOENDEXC: TFloatField
      FieldName = 'IDFIARIOENDEXC'
      Origin = 'BASEDADOS.PARAMCENTRALAP.IDFIARIOENDEXC'
    end
    object qryParamIDFIARIOENDALT: TFloatField
      FieldName = 'IDFIARIOENDALT'
      Origin = 'BASEDADOS.PARAMCENTRALAP.IDFIARIOENDALT'
    end
    object qryParamIDPROTOCOLORUB: TFloatField
      FieldName = 'IDPROTOCOLORUB'
      Origin = 'BASEDADOS.PARAMCENTRALAP.IDPROTOCOLORUB'
    end
    object qryParamFLGMUDALOCALATEND: TFloatField
      FieldName = 'FLGMUDALOCALATEND'
      Origin = 'BASEDADOS.PARAMCENTRALAP.FLGMUDALOCALATEND'
    end
    object qryParamFLGCONFIRMADATA: TFloatField
      FieldName = 'FLGCONFIRMADATA'
      Origin = 'BASEDADOS.PARAMCENTRALAP.FLGMUDALOCALATEND'
    end
  end
  object updContaCorrente: TUpdateSQL
    ModifySQL.Strings = (
      'update contabancaria'
      'set'
      '  CONTACORRENTE = :CONTACORRENTE,'
      '  IDAGENCIA = :IDAGENCIA,'
      '  FLGCONTAPREF = :FLGCONTAPREF,'
      '  TIPOCONTA = :TIPOCONTA,'
      '  FLGCONTACONJUNTA = :FLGCONTACONJUNTA'
      'where'
      '  IDCBANCARIA = :OLD_IDCBANCARIA')
    InsertSQL.Strings = (
      'insert into contabancaria'
      '  (CONTACORRENTE, IDAGENCIA, FLGCONTAPREF, TIPOCONTA,    '
      'FLGCONTACONJUNTA)'
      'values'
      '  (:CONTACORRENTE, :IDAGENCIA, :FLGCONTAPREF, :TIPOCONTA,    '
      ':FLGCONTACONJUNTA)')
    DeleteSQL.Strings = (
      'delete from contabancaria'
      'where'
      '  IDCBANCARIA = :OLD_IDCBANCARIA')
    Left = 306
    Top = 426
  end
  object dsContaCorrente: TwwDataSource
    DataSet = qryContaCorrente
    Left = 313
    Top = 421
  end
  object qryContaCorrente: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select c.contacorrente,'
      '          c.idagencia, c.flgcontaconjunta,'
      '          pa.nome as nomeagencia,'
      '          pb.nome as nomebanco, a.numagencia, a.idbanco,'
      '          b.numbanco, '
      '          c.flgcontapref,'
      
        '          decode(c.tipoconta,'#39'1'#39','#39'Corrente'#39','#39'2'#39','#39'Salário'#39','#39'3'#39','#39'P' +
        'oupança'#39', '#39'4'#39', '#39'Ordem de Pag.'#39') as tipoConta,'
      '          c.tipoconta,'
      '          c.IDCBANCARIA '
      
        'from contabancaria c, pessoa pa, pessoa pb, agenciabancaria a, b' +
        'anco b'
      'where c.idpessoa  = :idPessoa'
      'and   c.idagencia = pa.idpessoa'
      'and   c.idagencia = a.idpessoa'
      'and   a.idbanco   = pb.idpessoa'
      'and   a.idbanco   = b.idpessoa'
      ' '
      ' '
      ' ')
    UpdateObject = updContaCorrente
    ValidateWithMask = True
    Left = 56
    Top = 460
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IdPessoa'
        ParamType = ptInput
        Value = 1215012
      end>
    object qryContaCorrenteCONTACORRENTE: TStringField
      FieldName = 'CONTACORRENTE'
      Size = 15
    end
    object qryContaCorrenteIDAGENCIA: TFloatField
      FieldName = 'IDAGENCIA'
    end
    object qryContaCorrenteFLGCONTACONJUNTA: TStringField
      FieldName = 'FLGCONTACONJUNTA'
      FixedChar = True
      Size = 1
    end
    object qryContaCorrenteNOMEAGENCIA: TStringField
      FieldName = 'NOMEAGENCIA'
      Size = 60
    end
    object qryContaCorrenteNOMEBANCO: TStringField
      FieldName = 'NOMEBANCO'
      Size = 60
    end
    object qryContaCorrenteNUMAGENCIA: TStringField
      FieldName = 'NUMAGENCIA'
      FixedChar = True
      Size = 15
    end
    object qryContaCorrenteIDBANCO: TFloatField
      FieldName = 'IDBANCO'
    end
    object qryContaCorrenteNUMBANCO: TStringField
      FieldName = 'NUMBANCO'
      Size = 10
    end
    object qryContaCorrenteFLGCONTAPREF: TFloatField
      FieldName = 'FLGCONTAPREF'
    end
    object qryContaCorrenteTIPOCONTA: TStringField
      FieldName = 'TIPOCONTA'
      Size = 8
    end
    object qryContaCorrenteTIPOCONTA_1: TStringField
      FieldName = 'TIPOCONTA_1'
      FixedChar = True
      Size = 1
    end
    object qryContaCorrenteIDCBANCARIA: TFloatField
      FieldName = 'IDCBANCARIA'
    end
  end
  object qryPessoa: TwwQuery
    Tag = 5
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  '
      '                PES.IDENDCORRESP,'
      '                PES.IDENDCOMERCIAL,'
      '                PES.IDENDENTREGA,'
      '                PES.IDENDRESIDENCIAL,'
      '                PES.IDENDCOBRANCA'
      'FROM      PESSOA PES'
      'WHERE   (PES.IDPESSOA = :IDPESSOA)'
      '')
    ValidateWithMask = True
    Left = 75
    Top = 461
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object qryPessoaIDENDCORRESP: TFloatField
      FieldName = 'IDENDCORRESP'
      Origin = 'BASEDADOS.PESSOA.IDENDCORRESP'
    end
    object qryPessoaIDENDCOMERCIAL: TFloatField
      FieldName = 'IDENDCOMERCIAL'
      Origin = 'BASEDADOS.PESSOA.IDENDCOMERCIAL'
    end
    object qryPessoaIDENDENTREGA: TFloatField
      FieldName = 'IDENDENTREGA'
      Origin = 'BASEDADOS.PESSOA.IDENDENTREGA'
    end
    object qryPessoaIDENDRESIDENCIAL: TFloatField
      FieldName = 'IDENDRESIDENCIAL'
      Origin = 'BASEDADOS.PESSOA.IDENDRESIDENCIAL'
    end
    object qryPessoaIDENDCOBRANCA: TFloatField
      FieldName = 'IDENDCOBRANCA'
      Origin = 'BASEDADOS.PESSOA.IDENDCOBRANCA'
    end
  end
  object QRYINSENDERECO: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'insert into ENDPESS'
      
        '  (IDPESSOA, IDENDERECO, IDCIDADES, LOGRADOURO, IDPAIS, CODESTAD' +
        'O, '
      'NUMERO, COMPLEMENTO, BAIRRO, CIDADE, CEP, NOME)'
      'values'
      '  (:IDPESSOA, :IDENDERECO, :IDCIDADES, :LOGRADOURO, :IDPAIS,'
      
        ':CODESTADO, :NUMERO, :COMPLEMENTO, :BAIRRO, :CIDADE, :CEP, :NOME' +
        ')'
      ''
      ' ')
    ValidateWithMask = True
    Left = 386
    Top = 364
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDENDERECO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDCIDADES'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'LOGRADOURO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPAIS'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CODESTADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NUMERO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'COMPLEMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'BAIRRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CIDADE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CEP'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NOME'
        ParamType = ptInput
      end>
  end
  object qryaltendereco: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'update ENDPESS'
      'set'
      '  IDPESSOA = :IDPESSOA,'
      '  IDCIDADES = :IDCIDADES,'
      '  LOGRADOURO = :LOGRADOURO,'
      '  IDPAIS = :IDPAIS,'
      '  CODESTADO = :CODESTADO,'
      '  NUMERO = :NUMERO,'
      '  COMPLEMENTO = :COMPLEMENTO,'
      '  BAIRRO = :BAIRRO,'
      '  CIDADE = :CIDADE,'
      '  CEP = :CEP,'
      '  NOME  = :NOME'
      'where'
      '  IDENDERECO = :IDENDERECO'
      ' ')
    ValidateWithMask = True
    Left = 382
    Top = 364
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDCIDADES'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'LOGRADOURO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPAIS'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CODESTADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NUMERO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'COMPLEMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'BAIRRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CIDADE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CEP'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NOME'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'IDENDERECO'
        ParamType = ptUnknown
      end>
  end
  object QRYESTADO1: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODESTADO ,IDESTADO,IDPAIS FROM ESTADO'
      'where'
      'CODESTADO = :CODESTADO1'
      '')
    ValidateWithMask = True
    Left = 301
    Top = 485
    ParamData = <
      item
        DataType = ftString
        Name = 'CODESTADO1'
        ParamType = ptUnknown
      end>
  end
  object PopupMenu1: TPopupMenu
    Left = 360
    Top = 488
  end
  object qrycomercial: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE PESSOA'
      'SET IDENDCOMERCIAL = :IDENDCOMERCIAL '
      'WHERE IDPESSOA = :IDPESSOA')
    ValidateWithMask = True
    Left = 346
    Top = 548
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDENDCOMERCIAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryresidencial: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE PESSOA'
      'SET IDENDRESIDENCIAL = :IDENDRESIDENCIAL '
      'WHERE IDPESSOA = :IDPESSOA'
      '')
    ValidateWithMask = True
    Left = 1189
    Top = 388
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDENDRESIDENCIAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryentrega: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE PESSOA'
      'SET IDENDENTREGA = :IDENDENTREGA '
      'WHERE IDPESSOA = :IDPESSOA')
    ValidateWithMask = True
    Left = 1025
    Top = 68
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDENDENTREGA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qrycobranca: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE PESSOA'
      'SET IDENDCOBRANCA = :IDENDCOBRANCA '
      'WHERE IDPESSOA = :IDPESSOA'
      '')
    ValidateWithMask = True
    Left = 861
    Top = 316
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDENDCOBRANCA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qrycorresp: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE PESSOA'
      'SET IDENDCORRESP = :IDENDCORRESP'
      'WHERE IDPESSOA = :IDPESSOA'
      ''
      '')
    ValidateWithMask = True
    Left = 52
    Top = 456
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDENDCORRESP'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryInsereTelefone: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'insert into TELENDPESS'
      '(IDTELEFONE, IDENDERECO, DDI, DDD, TIPO, NUMERO)'
      'values'
      '(:IDTELEFONE, :IDENDERECO, :DDI, :DDD, :TIPO, :NUMERO)'
      ' ')
    Left = 1164
    Top = 69
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDTELEFONE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDENDERECO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DDI'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DDD'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TIPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NUMERO'
        ParamType = ptUnknown
      end>
  end
  object qryAlteraTelefone: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'update TELENDPESS'
      'set '
      '  IDENDERECO =:IDENDERECO,'
      '  DDI        =:DDI,       '
      '  DDD        =:DDD,       '
      '  TIPO       =:TIPO ,     '
      '  NUMERO     =:NUMERO    '
      'where'
      '  IDTELEFONE = :IDTELEFONE'
      ''
      ' '
      ' ')
    Left = 1118
    Top = 117
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDENDERECO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DDI'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DDD'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TIPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NUMERO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDTELEFONE'
        ParamType = ptUnknown
      end>
  end
  object qryBanco: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT BANCO.IDPESSOA, PESSOA.NOME AS BANCO, BANCO.NUMBANCO,'
      '       NVL(BANCO.FLGVALIDACC,'#39'N'#39') AS FLGVALIDACC'
      'FROM PESSOA, BANCO '
      'WHERE BANCO.IDPESSOA = PESSOA.IDPESSOA '
      ' ')
    ValidateWithMask = True
    Left = 160
    Top = 403
    object qryBancoIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.BANCO.IDPESSOA'
    end
    object qryBancoBANCO: TStringField
      FieldName = 'BANCO'
      Origin = 'BASEDADOS.PESSOA.NOME'
      Size = 60
    end
    object qryBancoNUMBANCO: TStringField
      FieldName = 'NUMBANCO'
      Origin = 'BASEDADOS.BANCO.NUMBANCO'
      Size = 10
    end
    object qryBancoFLGVALIDACC: TStringField
      FieldName = 'FLGVALIDACC'
      Size = 1
    end
  end
  object qryAgencia: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  AGENCIABANCARIA.IDPESSOA,'
      '               AGENCIA.NOME AS AGENCIA, '
      '               AGENCIABANCARIA.NUMAGENCIA,'
      '               AGENCIABANCARIA.IDBANCO'
      'FROM AGENCIABANCARIA, PESSOA AGENCIA'
      'WHERE AGENCIABANCARIA.IDPESSOA  = AGENCIA.IDPESSOA AND'
      '               AGENCIABANCARIA.IDBANCO=:pIdBanco'
      '')
    ValidateWithMask = True
    Left = 128
    Top = 410
    ParamData = <
      item
        DataType = ftFloat
        Name = 'pIdBanco'
        ParamType = ptUnknown
      end>
    object qryAgenciaAGENCIA: TStringField
      DisplayLabel = 'Agência'
      DisplayWidth = 60
      FieldName = 'AGENCIA'
      Origin = 'BASEDADOS.PESSOA.NOME'
      Size = 60
    end
    object qryAgenciaNUMAGENCIA: TStringField
      DisplayLabel = 'Nº Agência'
      DisplayWidth = 15
      FieldName = 'NUMAGENCIA'
      Origin = 'BASEDADOS.AGENCIABANCARIA.NUMAGENCIA'
      FixedChar = True
      Size = 15
    end
    object qryAgenciaIDPESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.AGENCIABANCARIA.IDPESSOA'
      Visible = False
    end
    object qryAgenciaIDBANCO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDBANCO'
      Origin = 'BASEDADOS.AGENCIABANCARIA.IDBANCO'
      Visible = False
    end
  end
  object qryInsContaCorrente: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO CONTABANCARIA'
      
        '       (IDCBANCARIA,CONTACORRENTE,IDAGENCIA,FLGCONTAPREF,IDPESSO' +
        'A,TIPOCONTA,'
      '         FLGCONTACONJUNTA)'
      '          VALUES'
      
        '       (:IDCBANCARIA,:CONTACORRENTE,:IDAGENCIA,:FLGCONTAPREF,:ID' +
        'PESSOA,:TIPOCONTA,'
      '         :FLGCONTACONJUNTA)'
      ''
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 385
    Top = 363
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDCBANCARIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CONTACORRENTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDAGENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'FLGCONTAPREF'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TIPOCONTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'FLGCONTACONJUNTA'
        ParamType = ptUnknown
      end>
  end
  object QRYALTCONTACORRENTEOLD: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE  CONTABANCARIA'
      'SET'
      '    CONTACORRENTE = :CONTACORRENTE,'
      '    IDAGENCIA =     :IDAGENCIA,'
      '    FLGCONTAPREF =  :FLGCONTAPREF,'
      '    IDPESSOA = :IDPESSOA,'
      '    TIPOCONTA = :TIPOCONTA,'
      '    FLGCONTACONJUNTA =  :FLGCONTACONJUNTA'
      ' WHERE'
      '    IDCBANCARIA =   :IDCBANCARIA')
    ValidateWithMask = True
    Left = 81
    Top = 459
    ParamData = <
      item
        DataType = ftString
        Name = 'CONTACORRENTE'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'IDAGENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'FLGCONTAPREF'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TIPOCONTA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FLGCONTACONJUNTA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'IDCBANCARIA'
        ParamType = ptInput
      end>
  end
  object qrycontapreferencial: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '       CB.IDCBANCARIA,'
      '       CB.CONTACORRENTE,'
      '       CB.IDAGENCIA,'
      '       CB.FLGCONTAPREF,'
      '       CB.IDPESSOA,'
      '       CB.TIPOCONTA,'
      '       CB.FLGCONTACONJUNTA,'
      '       AB.IDBANCO,'
      '       A.NOME AS NOMEAGENCIA,'
      '       B.NOME AS NOMEBANCO,'
      '       DECODE(CB.TIPOCONTA, '#39'1'#39', '#39'Conta Corrente'#39','
      '                            '#39'2'#39', '#39'Conta Salário'#39','
      '                            '#39'3'#39', '#39'Poupança'#39') AS DESCTIPO'
      'FROM'
      '    PESSOA A,'
      '    PESSOA B,'
      '    CONTABANCARIA CB,'
      '    AGENCIABANCARIA AB'
      'WHERE'
      '    (A.IDPESSOA = CB.IDAGENCIA)  AND'
      '    (B.IDPESSOA = AB.IDBANCO)    AND'
      '    (CB.IDAGENCIA = AB.IDPESSOA(+)) AND'
      '    (CB.IDPESSOA  = :IDPESSOA)'
      ''
      '')
    ValidateWithMask = True
    Left = 1153
    Top = 332
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object qrycontapreferencialIDCBANCARIA: TFloatField
      FieldName = 'IDCBANCARIA'
    end
    object qrycontapreferencialCONTACORRENTE: TStringField
      FieldName = 'CONTACORRENTE'
      Size = 15
    end
    object qrycontapreferencialIDAGENCIA: TFloatField
      FieldName = 'IDAGENCIA'
    end
    object qrycontapreferencialFLGCONTAPREF: TFloatField
      FieldName = 'FLGCONTAPREF'
    end
    object qrycontapreferencialIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qrycontapreferencialTIPOCONTA: TStringField
      FieldName = 'TIPOCONTA'
      FixedChar = True
      Size = 1
    end
    object qrycontapreferencialFLGCONTACONJUNTA: TStringField
      FieldName = 'FLGCONTACONJUNTA'
      FixedChar = True
      Size = 1
    end
    object qrycontapreferencialIDBANCO: TFloatField
      FieldName = 'IDBANCO'
    end
    object qrycontapreferencialNOMEAGENCIA: TStringField
      FieldName = 'NOMEAGENCIA'
      Size = 60
    end
    object qrycontapreferencialNOMEBANCO: TStringField
      FieldName = 'NOMEBANCO'
      Size = 60
    end
    object qrycontapreferencialDESCTIPO: TStringField
      FieldName = 'DESCTIPO'
      Size = 14
    end
  end
  object QRYAGENCIA1: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT    AGENCIABANCARIA.IDPESSOA,'
      '                  AGENCIABANCARIA.NUMAGENCIA,'
      '                  PESSOA.NOME'
      '                 FROM AGENCIABANCARIA,PESSOA'
      'WHERE '
      '              AGENCIABANCARIA. IDPESSOA= :IDPESSOA  AND'
      '                AGENCIABANCARIA. IDPESSOA = PESSOA.IDPESSOA'
      '')
    ValidateWithMask = True
    Left = 194
    Top = 468
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object QRYAGENCIA1IDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.AGENCIABANCARIA.IDPESSOA'
    end
    object QRYAGENCIA1NUMAGENCIA: TStringField
      FieldName = 'NUMAGENCIA'
      Origin = 'BASEDADOS.AGENCIABANCARIA.NUMAGENCIA'
      FixedChar = True
      Size = 15
    end
    object QRYAGENCIA1NOME: TStringField
      FieldName = 'NOME'
      Origin = 'BASEDADOS.PESSOA.NOME'
      Size = 60
    end
  end
  object qryGrupo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select * from PARAMCENTRALAP'
      ' ')
    ValidateWithMask = True
    Left = 289
    Top = 316
    object qryGrupoIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.PARAMCENTRALAP.IDPESSOA'
    end
    object qryGrupoIDCARTAPADRAO: TFloatField
      FieldName = 'IDCARTAPADRAO'
      Origin = 'BASEDADOS.PARAMCENTRALAP.IDCARTAPADRAO'
    end
    object qryGrupoIDETIQPADRAO: TFloatField
      FieldName = 'IDETIQPADRAO'
      Origin = 'BASEDADOS.PARAMCENTRALAP.IDETIQPADRAO'
    end
    object qryGrupoIDTIPOATENDPADRAO: TFloatField
      FieldName = 'IDTIPOATENDPADRAO'
      Origin = 'BASEDADOS.PARAMCENTRALAP.IDTIPOATENDPADRAO'
    end
    object qryGrupoIDDOCRG: TFloatField
      FieldName = 'IDDOCRG'
      Origin = 'BASEDADOS.PARAMCENTRALAP.IDDOCRG'
    end
    object qryGrupoFLGCTRLPROTOCOLO: TFloatField
      FieldName = 'FLGCTRLPROTOCOLO'
      Origin = 'BASEDADOS.PARAMCENTRALAP.IDDOCRG'
    end
    object qryGrupoIDFIARIOENDINC: TFloatField
      FieldName = 'IDFIARIOENDINC'
      Origin = 'BASEDADOS.PARAMCENTRALAP.IDDOCRG'
    end
    object qryGrupoIDFIARIOENDALT: TFloatField
      FieldName = 'IDFIARIOENDALT'
      Origin = 'BASEDADOS.PARAMCENTRALAP.IDDOCRG'
    end
    object qryGrupoIDFIARIOENDEXC: TFloatField
      FieldName = 'IDFIARIOENDEXC'
      Origin = 'BASEDADOS.PARAMCENTRALAP.IDDOCRG'
    end
    object qryGrupoIDFIARIOCCINC: TFloatField
      FieldName = 'IDFIARIOCCINC'
      Origin = 'BASEDADOS.PARAMCENTRALAP.IDDOCRG'
    end
    object qryGrupoIDFIARIOCCALT: TFloatField
      FieldName = 'IDFIARIOCCALT'
      Origin = 'BASEDADOS.PARAMCENTRALAP.IDDOCRG'
    end
    object qryGrupoIDFIARIOCCEXC: TFloatField
      FieldName = 'IDFIARIOCCEXC'
      Origin = 'BASEDADOS.PARAMCENTRALAP.IDDOCRG'
    end
    object qryGrupoIDFIARIOTELINC: TFloatField
      FieldName = 'IDFIARIOTELINC'
      Origin = 'BASEDADOS.PARAMCENTRALAP.IDDOCRG'
    end
    object qryGrupoIDFIARIOTELALT: TFloatField
      FieldName = 'IDFIARIOTELALT'
      Origin = 'BASEDADOS.PARAMCENTRALAP.IDDOCRG'
    end
    object qryGrupoIDFIARIOTELEXC: TFloatField
      FieldName = 'IDFIARIOTELEXC'
      Origin = 'BASEDADOS.PARAMCENTRALAP.IDDOCRG'
    end
    object qryGrupoIDPROTOCOLORUB: TFloatField
      FieldName = 'IDPROTOCOLORUB'
      Origin = 'BASEDADOS.PARAMCENTRALAP.IDDOCRG'
    end
  end
  object qryexcendereco: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'delete from ENDPESS'
      'where'
      '  IDENDERECO = :IDENDERECO')
    ValidateWithMask = True
    Left = 386
    Top = 364
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDENDERECO'
        ParamType = ptUnknown
      end>
  end
  object qryexctelefone: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'delete from  TELENDPESS'
      'where'
      '  IDTELEFONE = :IDTELEFONE'
      '')
    ValidateWithMask = True
    Left = 497
    Top = 354
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDTELEFONE'
        ParamType = ptUnknown
      end>
  end
  object qryExcContaCorrente: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM  CONTABANCARIA'
      'WHERE IDCBANCARIA = :IDCBANCARIA')
    ValidateWithMask = True
    Left = 88
    Top = 456
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDCBANCARIA'
        ParamType = ptUnknown
      end>
  end
  object QRYPENDECIA: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDATEND FROM'
      ' ATEND WHERE'
      ' STATUS='#39'Pendente'#39' AND  IDTITULAR= :IDTITULAR')
    ValidateWithMask = True
    Left = 424
    Top = 479
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end>
    object QRYPENDECIAIDATEND: TFloatField
      FieldName = 'IDATEND'
      Origin = 'BASEDADOS.ATEND.IDATEND'
    end
  end
  object DSdocsXbenef: TwwDataSource
    DataSet = QrydocsXbenef
    Left = 328
    Top = 377
  end
  object QrydocsXbenef: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      ' SELECT'
      ' TP.NOMEDOCUMENTO,'
      ' TB.IDBENEFICIO,'
      ' TB.IDSITBENEF,'
      ' TP.OBSERVACAO'
      'FROM'
      '  DOCUMENTOS TP,'
      '  TIPODOCXBENEF TB'
      'WHERE'
      '(TB.IDPESSOA    = :IDPESSOA) AND'
      '(TB.IDPLANOPREV = :IDPLANOPREV) AND'
      '(TB.IDDOCUMENTO = TP.IDDOCUMENTO) AND'
      '(TB.IDBENEFICIO = :IDBENEFICIO) AND'
      '(TB.IDSITBENEF = :IDSITBENEF)'
      'ORDER  BY  TP.NOMEDOCUMENTO'
      '')
    ValidateWithMask = True
    Left = 325
    Top = 371
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDBENEFICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDSITBENEF'
        ParamType = ptUnknown
      end>
    object QrydocsXbenefNOMEDOCUMENTO: TStringField
      DisplayLabel = 'Nome do Documento'
      DisplayWidth = 100
      FieldName = 'NOMEDOCUMENTO'
      Origin = 'BASEDADOS.DOCUMENTOS.NOMEDOCUMENTO'
      Size = 100
    end
    object QrydocsXbenefIDBENEFICIO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDBENEFICIO'
      Origin = 'BASEDADOS.TIPODOCXBENEF.IDBENEFICIO'
      Visible = False
    end
    object QrydocsXbenefIDSITBENEF: TFloatField
      DisplayWidth = 10
      FieldName = 'IDSITBENEF'
      Origin = 'BASEDADOS.TIPODOCXBENEF.IDSITBENEF'
      Visible = False
    end
    object QrydocsXbenefOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      Origin = 'BASEDADOS.DOCUMENTOS.OBSERVACAO'
      Visible = False
      BlobType = ftMemo
      Size = 2000
    end
  end
  object QryGrupoAssunto: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = DSAssunto
    SQL.Strings = (
      'SELECT '
      '   GRUPOASSUNTO.DESCGRUPOASSUNTO,'
      '   GRUPOASSUNTO.IDGRUPOASSUNTO'
      'FROM'
      '   GRUPOASSUNTO'
      'ORDER BY  GRUPOASSUNTO.DESCGRUPOASSUNTO')
    ValidateWithMask = True
    Left = 1069
    Top = 114
    object QryGrupoAssuntoDESCGRUPOASSUNTO: TStringField
      DisplayLabel = 'Grupo Assunto'
      DisplayWidth = 30
      FieldName = 'DESCGRUPOASSUNTO'
      Origin = 'BASEDADOS.GRUPOASSUNTO.DESCGRUPOASSUNTO'
      Size = 60
    end
    object QryGrupoAssuntoIDGRUPOASSUNTO: TFloatField
      FieldName = 'IDGRUPOASSUNTO'
      Origin = 'BASEDADOS.GRUPOASSUNTO.IDGRUPOASSUNTO'
      Visible = False
    end
  end
  object QryAssunto: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT  A.NOME,  P.NOME AS NOMEPLANOPREV, A.IDASSUNTO, A.IDTIPOP' +
        'ROCESSO, A.IDCONFIGRUBS,'
      
        '        A.IDGRUPOASSUNTO, A.flgChamaemprestim , C.DESCRUB , A.ID' +
        'PLANOPREV'
      'FROM  ASSUNTO A , PLANPREV P, CONFIGRUBS C'
      'WHERE ( A.IDPLANOPREV  = P.IDPLANOPREV(+))  AND'
      '      ( A.IDCONFIGRUBS = C.IDCONFIGRUBS(+))'
      'ORDER BY A.NOME'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 1003
    Top = 259
    object QryAssuntoNOME: TStringField
      DisplayLabel = 'Assunto'
      DisplayWidth = 60
      FieldName = 'NOME'
      Size = 60
    end
    object QryAssuntoNOMEPLANOPREV: TStringField
      DisplayLabel = 'Plano'
      DisplayWidth = 50
      FieldName = 'NOMEPLANOPREV'
      Size = 50
    end
    object QryAssuntoDESCRUB: TStringField
      DisplayLabel = 'Modelo RUB'
      DisplayWidth = 60
      FieldName = 'DESCRUB'
      Size = 60
    end
    object QryAssuntoIDASSUNTO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDASSUNTO'
      Visible = False
    end
    object QryAssuntoIDTIPOPROCESSO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOPROCESSO'
      Visible = False
    end
    object QryAssuntoIDCONFIGRUBS: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCONFIGRUBS'
      Visible = False
    end
    object QryAssuntoIDGRUPOASSUNTO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDGRUPOASSUNTO'
      Visible = False
    end
    object QryAssuntoFLGCHAMAEMPRESTIM: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGCHAMAEMPRESTIM'
      Visible = False
    end
    object QryAssuntoIDPLANOPREV: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPLANOPREV'
      Visible = False
    end
  end
  object DSAssunto: TwwDataSource
    DataSet = QryAssunto
    Left = 517
    Top = 226
  end
  object QryBeneficio: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   be.idBeneficio as IDSERVICOS,'
      '   be.NOME'
      'FROM'
      '    beneficio be'
      'UNION'
      'SELECT'
      '  se.IDSERVICOS , '
      '   se.NOME'
      'FROM'
      '  SERVICO se'
      ''
      'ORDER BY NOME'
      '')
    ValidateWithMask = True
    Left = 805
    Top = 323
    object QryBeneficioIDSERVICOS: TFloatField
      FieldName = 'IDSERVICOS'
    end
    object QryBeneficioNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
  end
  object qrySitBenef: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '  TB.IDSITBENEF, '
      '  DESCRICAO '
      'FROM'
      '  SITUACAOXBENEF TB,'
      '  SITBENEF TP'
      'WHERE'
      '  (TB.IDPESSJUR   = :idpessoa)     AND'
      '  (TB.IDPLANOPREV = :idplanoprev)  AND'
      '  (TB.IDBENEFICIO = :idbeneficio)  AND'
      '  (TB.IDSITBENEF  = TP.IDSITBENEF)'
      'ORDER BY DESCRICAO'
      ' ')
    ValidateWithMask = True
    Left = 822
    Top = 362
    ParamData = <
      item
        DataType = ftFloat
        Name = 'idpessoa'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'idplanoprev'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'idbeneficio'
        ParamType = ptInput
      end>
    object qrySitBenefIDSITBENEF: TFloatField
      FieldName = 'IDSITBENEF'
      Origin = 'BASEDADOS.SITUACAOXBENEF.IDSITBENEF'
    end
    object qrySitBenefDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'BASEDADOS.SITBENEF.DESCRICAO'
      Size = 60
    end
  end
  object QryRespostaPadrao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDASSUNTOXRESP,'
      '  DESCRESPATEN '
      'FROM ASSUNTOXRESP A, RESPATEND R'
      'WHERE'
      '   A.IDASSUNTO = :IDASSUNTO AND'
      '   A.IDRESPATEND = R.IDRESPATEND ')
    ValidateWithMask = True
    Left = 445
    Top = 434
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDASSUNTO'
        ParamType = ptInput
      end>
    object QryRespostaPadraoDESCRESPATEN: TMemoField
      FieldName = 'DESCRESPATEN'
      Origin = 'BASEDADOS.RESPATEND.DESCRESPATEN'
      BlobType = ftMemo
      Size = 2000
    end
    object QryRespostaPadraoIDASSUNTOXRESP: TFloatField
      FieldName = 'IDASSUNTOXRESP'
      Origin = 'BASEDADOS.ASSUNTOXRESP.IDASSUNTOXRESP'
    end
  end
  object qrydocpessoa: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select '
      '  numdocumento '
      'from docpessoa '
      'where'
      '    (idpessoa  = :idpessoa) and'
      '    (iddocumento = :iddocumento)'
      '')
    ValidateWithMask = True
    Left = 517
    Top = 419
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idpessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'iddocumento'
        ParamType = ptUnknown
      end>
  end
  object CMValidaCPF: TCMValidaDoc
    TipoDocumento = tdCPF
    Mensagem.ExibeMensagem = True
    Mensagem.Texto = 'Número de CPF Inválido'
    Left = 1077
    Top = 315
  end
  object qryPessoaFisica: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select '
      '  FLGBLOQUEIO'
      'from PessoaFisica'
      'where IdPessoa = :IdPessoa'
      '')
    ValidateWithMask = True
    Left = 16
    Top = 445
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IdPessoa'
        ParamType = ptInput
      end>
    object qryPessoaFisicaFLGBLOQUEIO: TFloatField
      FieldName = 'FLGBLOQUEIO'
      Origin = 'BASEDADOS.PESSOAFISICA.FLGBLOQUEIO'
    end
  end
  object BDEPdocsXbenef: TppBDEPipeline
    DataSource = DSdocsXbenef
    CloseDataSource = True
    UserName = 'BDEPdocsXbenef'
    Left = 637
    Top = 219
    object BDEPdocsXbenefppField1: TppField
      FieldAlias = 'NOMEDOCUMENTO'
      FieldName = 'NOMEDOCUMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object BDEPdocsXbenefppField2: TppField
      FieldAlias = 'IDBENEFICIO'
      FieldName = 'IDBENEFICIO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object BDEPdocsXbenefppField3: TppField
      FieldAlias = 'IDSITBENEF'
      FieldName = 'IDSITBENEF'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object BDEPdocsXbenefppField4: TppField
      FieldAlias = 'OBSERVACAO'
      FieldName = 'OBSERVACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
  end
  object ppRdocsXbenef: TppReport
    AutoStop = False
    DataPipeline = BDEPdocsXbenef
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 0
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 573
    Top = 272
    Version = '7.04'
    mmColumnWidth = 0
    DataPipelineName = 'BDEPdocsXbenef'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 61119
      mmPrintPosition = 0
      object ppDBTextBeneficio: TppDBText
        UserName = 'DBTextBeneficio'
        AutoSize = True
        DataField = 'NOME'
        DataPipeline = ppBDEBeneficio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDEBeneficio'
        mmHeight = 3969
        mmLeft = 42333
        mmTop = 37835
        mmWidth = 57944
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Benefício/Serviço:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 10319
        mmTop = 37571
        mmWidth = 30956
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Situação:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 10319
        mmTop = 42863
        mmWidth = 15875
        BandType = 0
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        AutoSize = True
        DataField = 'DESCRICAO'
        DataPipeline = ppBDEPsitBenef
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDEPsitBenef'
        mmHeight = 3969
        mmLeft = 27517
        mmTop = 43127
        mmWidth = 20902
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'Relação de Documentos/Observação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 10319
        mmTop = 56356
        mmWidth = 61913
        BandType = 0
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        AutoSize = True
        DataField = 'PLANO'
        DataPipeline = ppBDEPfunPatroPlan
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDEPfunPatroPlan'
        mmHeight = 3969
        mmLeft = 22225
        mmTop = 32544
        mmWidth = 11906
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Plano:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 10319
        mmTop = 32279
        mmWidth = 10848
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'Patrocinadora:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 10319
        mmTop = 26988
        mmWidth = 25135
        BandType = 0
      end
      object ppDBTextPatro: TppDBText
        UserName = 'DBTextPatro'
        AutoSize = True
        DataField = 'PATROCINADORA'
        DataPipeline = ppBDEPfunPatroPlan
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDEPfunPatroPlan'
        mmHeight = 3969
        mmLeft = 36513
        mmTop = 26988
        mmWidth = 30692
        BandType = 0
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        AutoSize = True
        DataField = 'RAZAOSOCIAL'
        DataPipeline = ppBDEPipeline1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDEPipeline1'
        mmHeight = 4233
        mmLeft = 35190
        mmTop = 11906
        mmWidth = 99748
        BandType = 0
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        AutoSize = True
        DataField = 'NOME'
        DataPipeline = ppBDEPipeline1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDEPipeline1'
        mmHeight = 5821
        mmLeft = 35190
        mmTop = 5821
        mmWidth = 16669
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 3440
        mmLeft = 0
        mmTop = 23283
        mmWidth = 197300
        BandType = 0
      end
      object ppDBImage1: TppDBImage
        UserName = 'DBImage1'
        MaintainAspectRatio = True
        Stretch = True
        Transparent = True
        DataField = 'IMAGEM'
        DataPipeline = ppBDEPipeline1
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppBDEPipeline1'
        mmHeight = 17727
        mmLeft = 10054
        mmTop = 2117
        mmWidth = 21167
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 3440
        mmLeft = 0
        mmTop = 50006
        mmWidth = 197300
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 20902
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        AutoSize = True
        DataField = 'NOMEDOCUMENTO'
        DataPipeline = BDEPdocsXbenef
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'BDEPdocsXbenef'
        mmHeight = 3969
        mmLeft = 10319
        mmTop = 794
        mmWidth = 33602
        BandType = 4
      end
      object ppDBMemo1: TppDBMemo
        UserName = 'DBMemo1'
        CharWrap = True
        DataField = 'OBSERVACAO'
        DataPipeline = BDEPdocsXbenef
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'BDEPdocsXbenef'
        mmHeight = 14817
        mmLeft = 16404
        mmTop = 5292
        mmWidth = 170921
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 11906
      mmPrintPosition = 0
      object Calc2: TppSystemVariable
        UserName = 'Calc2'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 529
        mmTop = 794
        mmWidth = 197380
        BandType = 8
      end
      object LblSistema: TppLabel
        UserName = 'LblSistema'
        AutoSize = False
        Caption = 'Central de Atendimento ao Público'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 0
        mmTop = 529
        mmWidth = 197909
        BandType = 8
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Weight = 0.75
        mmHeight = 794
        mmLeft = 0
        mmTop = 529
        mmWidth = 197380
        BandType = 8
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4498
        mmLeft = 170127
        mmTop = 794
        mmWidth = 26723
        BandType = 8
      end
    end
  end
  object DSBeneficio: TwwDataSource
    DataSet = QryBeneficio
    Left = 421
    Top = 539
  end
  object ppBDEBeneficio: TppBDEPipeline
    DataSource = DSBeneficio
    UserName = 'BDEBeneficio'
    Left = 661
    Top = 323
    object ppBDEBeneficioppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDSERVICOS'
      FieldName = 'IDSERVICOS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 0
    end
    object ppBDEBeneficioppField2: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
  end
  object DSsitBenef: TwwDataSource
    DataSet = qrySitBenef
    Left = 901
    Top = 355
  end
  object ppBDEPsitBenef: TppBDEPipeline
    DataSource = DSsitBenef
    UserName = 'BDEPsitBenef'
    Left = 749
    Top = 371
    object ppBDEPsitBenefppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDSITBENEF'
      FieldName = 'IDSITBENEF'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 0
    end
    object ppBDEPsitBenefppField2: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
  end
  object qryFunPatroPlan: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '   P.NOME AS FUNDACAO,'
      '   PJ.NOME AS PATROCINADORA,'
      '   PLANPREV.NOME AS PLANO,'
      '   I.IMAGEM AS LOGO'
      'FROM'
      '   PESSOA PJ,'
      '   PLANPREV,'
      '   PARTPREVPLAN,'
      '   ELEGPATRO,'
      '   SITPART,'
      '   PESSOA P,'
      '   PATRO,'
      '   IMAGENS I'
      'WHERE '
      '   ( ELEGPATRO.IDPESSOA = :IDTITULAR) AND'
      '   ( ELEGPATRO.IDPESSJUR = PJ.IDPESSOA ) AND'
      '   ( PARTPREVPLAN.IDPESSOA = ELEGPATRO.IDPESSOA ) AND'
      '   ( PARTPREVPLAN.IDPESSJUR = ELEGPATRO.IDPESSJUR ) AND'
      '   ( PARTPREVPLAN.IDSITPART= SITPART.IDSITPART ) AND'
      '   ( PARTPREVPLAN.IDPLANOPREV = PLANPREV.IDPLANOPREV ) AND'
      '   ( PARTPREVPLAN.IDSITPART = SITPART.IDSITPART ) AND'
      '   ( PJ.IDPESSOA = PATRO.IDPESSOA ) AND'
      '   ( PATRO.IDFUNDACAO = P.IDPESSOA) AND'
      '   ( P.IDIMAGEM = I.IDIMAGEM)')
    ValidateWithMask = True
    Left = 229
    Top = 267
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDTITULAR'
        ParamType = ptInput
      end>
  end
  object DSfunPatroPlan: TwwDataSource
    DataSet = qryFunPatroPlan
    Left = 677
    Top = 331
  end
  object ppBDEPfunPatroPlan: TppBDEPipeline
    DataSource = DSfunPatroPlan
    CloseDataSource = True
    UserName = 'BDEPfunPatroPlan'
    Left = 749
    Top = 331
  end
  object qryFun: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.NOME , P.RAZAOSOCIAL, E.LOGRADOURO,'
      '       E.NUMERO, E.COMPLEMENTO, E.BAIRRO,'
      '       C.NOME AS CIDADE, C.CODESTADO, E.CEP, I.IMAGEM'
      'FROM PESSOA P,  FUNDACAO F,  ENDPESS E, IMAGENS I, CIDADES C'
      'WHERE '
      '     ( P.IDPESSOA =  F.IDPESSOA) AND'
      '     ( P.IDPESSOA =  E.IDPESSOA) AND'
      '     (E.IDCIDADES   = C.IDCIDADES)  AND'
      '     ( P.IDIMAGEM = I.IDIMAGEM)'
      ' ')
    ValidateWithMask = True
    Left = 749
    Top = 299
    object qryFunNOME: TStringField
      FieldName = 'NOME'
      Origin = 'BASEDADOS.PESSOA.NOME'
      Size = 60
    end
    object qryFunRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Origin = 'BASEDADOS.PESSOA.RAZAOSOCIAL'
      Size = 60
    end
    object qryFunLOGRADOURO: TStringField
      FieldName = 'LOGRADOURO'
      Origin = 'BASEDADOS.ENDPESS.LOGRADOURO'
      Size = 60
    end
    object qryFunNUMERO: TStringField
      FieldName = 'NUMERO'
      Origin = 'BASEDADOS.ENDPESS.NUMERO'
      Size = 8
    end
    object qryFunCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Origin = 'BASEDADOS.ENDPESS.COMPLEMENTO'
    end
    object qryFunBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Origin = 'BASEDADOS.ENDPESS.BAIRRO'
    end
    object qryFunCIDADE: TStringField
      FieldName = 'CIDADE'
      Origin = 'BASEDADOS.CIDADES.NOME'
      Size = 50
    end
    object qryFunCODESTADO: TStringField
      FieldName = 'CODESTADO'
      Origin = 'BASEDADOS.CIDADES.CODESTADO'
      FixedChar = True
      Size = 3
    end
    object qryFunCEP: TStringField
      FieldName = 'CEP'
      Origin = 'BASEDADOS.ENDPESS.CEP'
      Size = 8
    end
    object qryFunIMAGEM: TBlobField
      FieldName = 'IMAGEM'
      Origin = 'BASEDADOS.IMAGENS.IMAGEM'
      BlobType = ftBlob
      Size = 1
    end
  end
  object DSfun: TwwDataSource
    DataSet = qryFun
    Left = 749
    Top = 227
  end
  object ppBDEPipeline1: TppBDEPipeline
    DataSource = DSfun
    UserName = 'BDEPipelineFun'
    Left = 709
    Top = 298
    object ppBDEPipeline1ppField1: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 60
      DisplayWidth = 60
      Position = 0
    end
    object ppBDEPipeline1ppField2: TppField
      FieldAlias = 'RAZAOSOCIAL'
      FieldName = 'RAZAOSOCIAL'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object ppBDEPipeline1ppField3: TppField
      FieldAlias = 'LOGRADOURO'
      FieldName = 'LOGRADOURO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 2
    end
    object ppBDEPipeline1ppField4: TppField
      FieldAlias = 'NUMERO'
      FieldName = 'NUMERO'
      FieldLength = 8
      DisplayWidth = 8
      Position = 3
    end
    object ppBDEPipeline1ppField5: TppField
      FieldAlias = 'COMPLEMENTO'
      FieldName = 'COMPLEMENTO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 4
    end
    object ppBDEPipeline1ppField6: TppField
      FieldAlias = 'BAIRRO'
      FieldName = 'BAIRRO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 5
    end
    object ppBDEPipeline1ppField7: TppField
      FieldAlias = 'CIDADE'
      FieldName = 'CIDADE'
      FieldLength = 50
      DisplayWidth = 50
      Position = 6
    end
    object ppBDEPipeline1ppField8: TppField
      FieldAlias = 'CODESTADO'
      FieldName = 'CODESTADO'
      FieldLength = 3
      DisplayWidth = 3
      Position = 7
    end
    object ppBDEPipeline1ppField9: TppField
      FieldAlias = 'CEP'
      FieldName = 'CEP'
      FieldLength = 8
      DisplayWidth = 8
      Position = 8
    end
    object ppBDEPipeline1ppField10: TppField
      FieldAlias = 'IMAGEM'
      FieldName = 'IMAGEM'
      FieldLength = 1
      DataType = dtBLOB
      DisplayWidth = 10
      Position = 9
      Searchable = False
      Sortable = False
    end
  end
  object MSParticipDepen_velho: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'VWPARTICIPDEPEN.MATRICULA'
      'VWPARTICIPDEPEN.NOME'
      'VWPARTICIPDEPEN.NUMDOCUMENTO'
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
      'Matrícula'
      'Nome'
      'CPF'
      'Inscrição'
      'Plano'
      'Patrocinadora')
    SensivelACaixa.Strings = (
      'S'
      'S'
      'S'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'PESSOA PJ'
      'ELEGPATRO'
      'PLANPREV'
      'PARTPREVPLAN'
      'SITPART'
      'VWPARTICIPDEPEN')
    CamposChave.Strings = (
      'PESSOA.NOME'
      'PESSOA.NUMDOCUMENTO'
      'ELEGPATRO.MATRICULA'
      'PARTPREVPLAN.INSCRICAONUMERO'
      'PLANPREV.NOME'
      'PJ.NOME'
      'PJ.IDPESSOA'
      'VWPARTICIPDEPEN.IDTITULAR'
      'SITPART.DESCRICAO'
      'VWPARTICIPDEPEN.IDPESSOA'
      'PLANPREV.IDPLANOPREV'
      'PARTPREVPLAN.SEQPROPOSTA'
      'PESSOA.EMAIL')
    Filtro.Strings = (
      'VWPARTICIPDEPEN.IDTITULAR  = ELEGPATRO.IDPESSOA'
      'ELEGPATRO.IDPESSJUR          =  PJ.IDPESSOA(+)'
      'PARTPREVPLAN.IDPESSOA(+)     = ELEGPATRO.IDPESSOA'
      'PARTPREVPLAN.IDPESSJUR (+)   = ELEGPATRO.IDPESSJUR'
      'PARTPREVPLAN.IDPLANOPREV     = PLANPREV.IDPLANOPREV(+)'
      'PARTPREVPLAN.IDSITPART = SITPART.IDSITPART(+)'
      'VWPARTICIPDEPEN.IDTITULAR  = PESSOA.IDPESSOA'
      
        '(PARTPREVPLAN.FLGDESATIVADO = 1 AND PARTPREVPLAN.IDPESSOA NOT IN' +
        ' (SELECT PPP1.IDPESSOA FROM PARTPREVPLAN PPP1 WHERE PPP1.IDPESSO' +
        'A = PARTPREVPLAN.IDPESSOA AND PPP1.FLGDESATIVADO = 0)) OR PARTPR' +
        'EVPLAN.FLGDESATIVADO = 0')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '13'
      '60'
      '18'
      '10'
      '10'
      '50')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 1064
    Top = 216
  end
  object qryDocumentos: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select '
      '  dp.idPessoa,'
      '  dp.numdocumento,'
      '  tp.iddocumento,'
      '  tp.nomedocumento'
      'from docpessoa dp, tipodocpessoa tp'
      'where'
      '    (dp.idpessoa  = :idpessoa) and'
      '    (tp.iddocumento = dp.iddocumento)'
      '    '
      'ORDER BY tp.nomedocumento'
      '   '
      '')
    UpdateObject = UpdDocumentos
    ValidateWithMask = True
    Left = 490
    Top = 220
    ParamData = <
      item
        DataType = ftFloat
        Name = 'idpessoa'
        ParamType = ptInput
      end>
    object qryDocumentosIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryDocumentosNUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
      FixedChar = True
      Size = 18
    end
    object qryDocumentosNOMEDOCUMENTO: TStringField
      FieldName = 'NOMEDOCUMENTO'
      Size = 30
    end
    object qryDocumentosIDDOCUMENTO: TFloatField
      FieldName = 'IDDOCUMENTO'
    end
  end
  object DsDocumentos: TwwDataSource
    DataSet = qryDocumentos
    Left = 490
    Top = 220
  end
  object UpdDocumentos: TUpdateSQL
    ModifySQL.Strings = (
      'update docpessoa'
      'set'
      '  IDPESSOA = :IDPESSOA,'
      '  NUMDOCUMENTO = :NUMDOCUMENTO,'
      '  IDDOCUMENTO = :IDDOCUMENTO'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDDOCUMENTO = :OLD_IDDOCUMENTO')
    InsertSQL.Strings = (
      'insert into docpessoa'
      '  (IDPESSOA, NUMDOCUMENTO, IDDOCUMENTO)'
      'values'
      '  (:IDPESSOA, :NUMDOCUMENTO, :IDDOCUMENTO)')
    DeleteSQL.Strings = (
      'delete from docpessoa'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDDOCUMENTO = :OLD_IDDOCUMENTO')
    Left = 322
    Top = 268
  end
  object qryTipoDocPessoa: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDDOCUMENTO,'
      '  NOMEDOCUMENTO'
      'FROM TIPODOCPESSOA'
      'ORDER BY  NOMEDOCUMENTO')
    ValidateWithMask = True
    Left = 266
    Top = 276
    object qryTipoDocPessoaIDDOCUMENTO: TFloatField
      FieldName = 'IDDOCUMENTO'
      Origin = 'BASEDADOS.TIPODOCPESSOA.IDDOCUMENTO'
    end
    object qryTipoDocPessoaNOMEDOCUMENTO: TStringField
      FieldName = 'NOMEDOCUMENTO'
      Origin = 'BASEDADOS.TIPODOCPESSOA.NOMEDOCUMENTO'
      Size = 30
    end
  end
  object QRYALTCONTACORRENTE: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE  CONTABANCARIA'
      'SET'
      '    CONTACORRENTE = :CONTACORRENTE,'
      '    IDAGENCIA =     :IDAGENCIA,'
      '    FLGCONTAPREF =  :FLGCONTAPREF,'
      '    IDPESSOA = :IDPESSOA,'
      '    TIPOCONTA = :TIPOCONTA,'
      '    FLGCONTACONJUNTA =  :FLGCONTACONJUNTA'
      ' WHERE'
      '    IDCBANCARIA =   :IDCBANCARIA')
    ValidateWithMask = True
    Left = 93
    Top = 451
    ParamData = <
      item
        DataType = ftString
        Name = 'CONTACORRENTE'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'IDAGENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'FLGCONTAPREF'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TIPOCONTA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FLGCONTACONJUNTA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'IDCBANCARIA'
        ParamType = ptInput
      end>
  end
  object MsParticipDepen: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Participante/Dependente'
    Colunas.Strings = (
      'VWPARTICIPDEPEN.MATRICULA'
      'VWPARTICIPDEPEN.MATRICULADEP'
      'VWPARTICIPDEPEN.NOME'
      'VWPARTICIPDEPEN.PLANO'
      
        'DECODE (VWPARTICIPDEPEN.FLGDESATIVADO, NULL, '#39' '#39',  1, '#39'NÃO'#39', 0, ' +
        #39'SIM'#39')'
      'VWPARTICIPDEPEN.INSCRICAONUMERO'
      'VWPARTICIPDEPEN.PATRO'
      'VWPARTICIPDEPEN.NUMDOCUMENTO'
      'VWPARTICIPDEPEN.DESCRICAO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'C'
      'N'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Matr. Titular'
      'Matr. Depen.'
      'Nome'
      'Plano'
      'Ativo no Plano'
      'Inscrição'
      'Patrocinadora'
      'CPF'
      'Situação do Participante')
    SensivelACaixa.Strings = (
      'S'
      'S'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'VWPARTICIPDEPEN')
    CamposChave.Strings = (
      'VWPARTICIPDEPEN.NOME'
      'VWPARTICIPDEPEN.NUMDOCUMENTO'
      'VWPARTICIPDEPEN.MATRICULA'
      'VWPARTICIPDEPEN.INSCRICAONUMERO'
      'VWPARTICIPDEPEN.PLANO'
      'VWPARTICIPDEPEN.PATRO'
      'VWPARTICIPDEPEN.IDPESSJUR'
      'VWPARTICIPDEPEN.IDTITULAR'
      'VWPARTICIPDEPEN.DESCRICAO'
      'VWPARTICIPDEPEN.IDPESSOA'
      'VWPARTICIPDEPEN.IDPLANOPREV'
      'VWPARTICIPDEPEN.SEQPROPOSTA'
      'VWPARTICIPDEPEN.EMAIL'
      'VWPARTICIPDEPEN.SITFUND'
      'VWPARTICIPDEPEN.IDSITPART'
      'VWPARTICIPDEPEN.MATRICULADEP')
    Mascaras.Strings = (
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
      '15'
      '15'
      '35'
      '35'
      '6'
      '10'
      '30'
      '18'
      '10')
    OperComparador.Strings = (
      '1'
      '1'
      '-1'
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
    LookupSQL.Strings = (
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
      '')
    Left = 1008
    Top = 216
  end
  object qryTitular: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      
        '   DECODE(DEP.IDTITULAR, DEP.IDPESSOA, PEP.NOME, PDP.NOME) AS NO' +
        'ME, '
      
        '   DECODE(DEP.IDTITULAR, DEP.IDPESSOA, PEP.NUMDOCUMENTO, PDP.NUM' +
        'DOCUMENTO) AS NUMDOCUMENTO, '
      '   PPP.INSCRICAONUMERO,'
      '   NVL(PLP2.NOME, PLP.NOME) AS PLANO,'
      '   NVL(PLP2.Idrgelegbenef, PLP.Idrgelegbenef) AS IDRGELEGBENEF,'
      '   NVL(PLP2.IDPLANOPREV, PLP.IDPLANOPREV) AS IDPLANOPREV,'
      '   PPA.NOME AS PATRO,'
      '   ELP.IDPESSJUR,'
      '   PPP.SEQPROPOSTA,'
      '   SIP.DESCRICAO,'
      '   SPP.DESCRICAO AS SITUACAONOPLANO,'
      '   SIP.FLGINTERNO   '
      'FROM ELEGPATRO ELP '
      '    JOIN PESSOA PEP ON ELP.IDPESSOA = PEP.IDPESSOA '
      '    JOIN PESSOA PPA ON ELP.IDPESSJUR = PPA.IDPESSOA '
      '    JOIN PARTPREVPLAN PPP ON ELP.IDPESSJUR = PPP.IDPESSJUR '
      '                         AND ELP.IDPESSOA = PPP.IDPESSOA '
      '    JOIN PLANPREV PLP ON PPP.IDPLANOPREV = PLP.IDPLANOPREV '
      '    JOIN SITPART SIP ON PPP.IDSITPART = SIP.IDSITPART '
      
        '    JOIN SITPLANOPREV SPP ON PPP.IDSITPLANOPREV = SPP.IDSITPLANO' +
        'PREV '
      '    JOIN DEPENTIT DEP ON DEP.IDTITULAR = ELP.IDPESSOA '
      '    JOIN PESSOA PDP ON DEP.IDPESSOA = PDP.IDPESSOA '
      '    LEFT JOIN (SELECT DISTINCT BNF.IDPESSOA, '
      '                               BNF.IDTITULAR, '
      '                               BNF.IDPLANOPREV, '
      '                               BNF.IDPLANOORIGEM, '
      '                               BNF.IDPLANPREVCONTAB '
      '                 FROM BENEFBFCIARIO BNF '
      
        '                WHERE (BNF.DATAFINAL IS NULL OR BNF.DATAFINAL > ' +
        'SYSDATE) '
      '                  AND BNF.FONTEPAGADORA = 1 '
      '                  AND BNF.IDSITBENEFICIO IN '
      '                      (SELECT MIN(SB1.IDSITBENEFICIO) '
      '                         FROM BENEFBFCIARIO SB1 '
      '                        WHERE BNF.IDPESSOA = SB1.IDPESSOA '
      '                          AND BNF.IDTITULAR = SB1.IDTITULAR '
      
        '                          AND SB1.IDSITBENEFICIO IN (1, 2, 7))) ' +
        'BFC ON BFC.IDPESSOA = '
      
        '                                                                ' +
        '       DEP.IDPESSOA '
      
        '                                                                ' +
        '   AND BFC.IDTITULAR = '
      
        '                                                                ' +
        '       DEP.IDTITULAR '
      
        '                                                                ' +
        '   AND bfc.Idplanoprev = ppp.idplanoprev '
      
        '    LEFT JOIN PLANPREV PLP2 ON PLP2.IDPLANOPREV = BFC.IDPLANOPRE' +
        'V '
      '  WHERE dep.idtitular = dep.idpessoa '
      '  AND  (PPP.IDSITPLANOPREV = 25 OR '
      '     PPP.IDPLANOPREV = '
      '     (SELECT MAX(PPP2.IDPLANOPREV) '
      '          FROM PARTPREVPLAN PPP2 '
      '         WHERE PPP2.FLGDESATIVADO = 0 '
      '           AND PPP2.Idsitplanoprev <> 25 '
      '           AND PPP2.IDPESSOA = PPP.IDPESSOA '
      '           AND NOT EXISTS (SELECT 1 '
      '                  FROM PARTPREVPLAN PPP3 '
      '                 WHERE PPP3.IDPESSOA = PPP2.IDPESSOA '
      
        '                   AND PPP3.IDSITPLANOPREV = 25)))AND DEP.MATRIC' +
        'ULA = :MATRICULA')
    ValidateWithMask = True
    Left = 1005
    Top = 307
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'MATRICULA'
        ParamType = ptUnknown
      end>
    object qryTitularNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qryTitularNUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
      FixedChar = True
      Size = 18
    end
    object qryTitularINSCRICAONUMERO: TFloatField
      FieldName = 'INSCRICAONUMERO'
    end
    object qryTitularPLANO: TStringField
      FieldName = 'PLANO'
      Size = 50
    end
    object qryTitularIDRGELEGBENEF: TFloatField
      FieldName = 'IDRGELEGBENEF'
    end
    object qryTitularIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object qryTitularPATRO: TStringField
      FieldName = 'PATRO'
      Size = 60
    end
    object qryTitularIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
    end
    object qryTitularSEQPROPOSTA: TFloatField
      FieldName = 'SEQPROPOSTA'
    end
    object qryTitularDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object qryTitularSITUACAONOPLANO: TStringField
      FieldName = 'SITUACAONOPLANO'
      Size = 50
    end
  end
  object qrySitPart: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  FLGINTERNO'
      'FROM SITPART'
      'WHERE IDSITPART = :IDSITPART')
    ValidateWithMask = True
    Left = 1009
    Top = 364
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDSITPART'
        ParamType = ptInput
      end>
  end
  object PpMenuEmptimo: TPopupMenu
    Left = 936
    Top = 256
    object InscricaoContrato: TMenuItem
      Caption = '&Inscrição/Contratação'
      OnClick = InscricaoContratoClick
    end
    object Contratacao: TMenuItem
      Caption = 'Con&tratação'
      OnClick = ContratacaoClick
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object ConsultaContrato1: TMenuItem
      Tag = 1
      Caption = '&Consulta Contrato'
      OnClick = ConsultaContrato1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object qutacaoAntecipada: TMenuItem
      Tag = 2
      Caption = '&Quitação Antecipada'
      OnClick = qutacaoAntecipadaClick
    end
    object CancelamentodeQuitacao: TMenuItem
      Tag = 3
      Caption = 'Cance&lamento de Quitação'
      OnClick = CancelamentodeQuitacaoClick
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object Amortizacao: TMenuItem
      Tag = 4
      Caption = '&Amortização'
      OnClick = AmortizacaoClick
    end
    object CancelamentodeAmortizacao: TMenuItem
      Tag = 5
      Caption = 'Ca&ncelamento de Amortização'
      OnClick = CancelamentodeAmortizacaoClick
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object TratIndivParcelas1: TMenuItem
      Tag = 6
      Caption = '&Trat. Indiv Parcelas'
      OnClick = TratIndivParcelas1Click
    end
    object N5: TMenuItem
      Caption = '-'
    end
    object mnuAssinaturaContrato: TMenuItem
      Tag = 7
      Caption = 'Assinatura de Contrato Padrão'
      OnClick = mnuAssinaturaContratoClick
    end
    object N6: TMenuItem
      Caption = '-'
    end
    object mnuHistoricoSuspensao: TMenuItem
      Tag = 8
      Caption = 'Lançamento e Histórico de Suspensão por Contrato'
      OnClick = mnuHistoricoSuspensaoClick
    end
  end
  object qryExecTelContato: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM TELCONTATO WHERE IDTELEFONE = :idtelefone')
    ValidateWithMask = True
    Left = 1160
    Top = 216
    ParamData = <
      item
        DataType = ftFloat
        Name = 'idtelefone'
        ParamType = ptInput
      end>
  end
  object qryExecTelEndPess: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM TELENDPESS WHERE IDENDERECO = :idendereco')
    ValidateWithMask = True
    Left = 920
    Top = 208
    ParamData = <
      item
        DataType = ftFloat
        Name = 'idendereco'
        ParamType = ptInput
      end>
  end
  object PpMenuPessoa: TPopupMenu
    Left = 1072
    Top = 264
    object DadosPessoais1: TMenuItem
      Caption = '&Outro Participante'
      OnClick = DadosPessoais1Click
    end
    object ContraCheque1: TMenuItem
      Caption = '&Contra-Cheque'
      OnClick = ContraCheque1Click
    end
  end
  object qryClassifica: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 245
    Top = 427
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 373
    Top = 435
  end
  object qryVerifImpressao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '   C.IDCARTACOBRANCA'
      'FROM'
      '   CONFIGRUBS C,'
      '   RUBS R,'
      '   ASSUNTO A,'
      '   ASSUNTOXATEND AXA,'
      '   CARTACOBRANCA CC,'
      '   HISTMOVRUBS HL'
      'WHERE HL.FLGSTATUS IN (1, 3) AND'
      '   R.IDRUBS = HL.IDRUBS AND'
      '   R.IDASSUNTOXATEND = AXA.IDASSUNTOXATEND(+) AND'
      '   A.IDASSUNTO = AXA.IDASSUNTO  AND'
      '   A.IDCONFIGRUBS =  C.IDCONFIGRUBS AND'
      '   C.IDCONFIGRUBS = A.IDCONFIGRUBS AND'
      '   CC.IDCARTACOBRANCA = C.IDCARTACOBRANCA AND'
      '   R.IDRUBS = :idrubs')
    ValidateWithMask = True
    Left = 265
    Top = 375
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idrubs'
        ParamType = ptUnknown
      end>
  end
  object RptModelo: TppReport
    AutoStop = False
    DataPipeline = PpDados
    OnPrintingComplete = GravaEmissaoCarta
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 0
    Template.DatabaseSettings.DataPipeline = PpDados
    Template.FileName = 'C:\Teste.Txt'
    Template.Format = ftASCII
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    ModalPreview = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 447
    Top = 284
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'PpDados'
    object ppDetailBand2: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 19050
      mmPrintPosition = 0
      object ppDBText6: TppDBText
        UserName = 'DBText1'
        DataPipeline = PpDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpDados'
        mmHeight = 3969
        mmLeft = 8731
        mmTop = 5292
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText2'
        DataPipeline = PpDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpDados'
        mmHeight = 3969
        mmLeft = 51858
        mmTop = 5027
        mmWidth = 17198
        BandType = 4
      end
    end
  end
  object ppdetalhe_documentos: TppBDEPipeline
    DataSource = DtmRubs.dsDetDocs
    UserName = 'detalhe_documentos'
    Left = 429
    Top = 391
  end
  object ppDetalhe_Dependente_IRRF: TppBDEPipeline
    DataSource = DtmRubs.dsDetDependIRRF
    UserName = 'Detalhe_Dependente_IRRF'
    Left = 444
    Top = 337
  end
  object PpDados: TppBDEPipeline
    DataSource = DtmRubs.DsDados
    UserName = 'PpDados'
    Left = 444
    Top = 316
  end
  object ppDetalhe_Telefones: TppBDEPipeline
    DataSource = DtmRubs.dsDetTelefones
    UserName = 'Detalhe_Telefones'
    Left = 825
    Top = 215
  end
  object qryPlanoPrevBeneficiario: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '   PEP.NOME AS NOME_TITULAR, '
      '   PEP.NUMDOCUMENTO AS CPF_TITULAR,'
      '   ELP.MATRICULA AS MATRICULA_TITULAR,'
      '   DEP.IDTITULAR,'
      '   PEP.EMAIL AS EMAIL_TITULAR,'
      
        '   DECODE(DEP.IDTITULAR, DEP.IDPESSOA, PEP.NOME, PDP.NOME) AS NO' +
        'ME, '
      
        '   DECODE(DEP.IDTITULAR, DEP.IDPESSOA, PEP.NUMDOCUMENTO, PDP.NUM' +
        'DOCUMENTO) AS NUMDOCUMENTO, '
      '   PPP.INSCRICAONUMERO,'
      '   NVL(PLP2.NOME, PLP.NOME) AS PLANO,'
      '   NVL(PLP2.Idrgelegbenef, PLP.Idrgelegbenef) AS IDRGELEGBENEF,'
      '   NVL(PLP2.IDPLANOPREV, PLP.IDPLANOPREV) AS IDPLANOPREV,'
      '   PPA.NOME AS PATRO,'
      '   ELP.IDPESSJUR,'
      '   PPP.SEQPROPOSTA,'
      '   SIP.DESCRICAO, '
      '   SPP.DESCRICAO AS SITUACAONOPLANO,'
      '   SIP.FLGINTERNO'
      'FROM ELEGPATRO ELP '
      '   JOIN PESSOA PEP ON ELP.IDPESSOA = PEP.IDPESSOA '
      '   JOIN PESSOA PPA ON ELP.IDPESSJUR = PPA.IDPESSOA '
      '   JOIN PARTPREVPLAN PPP ON ELP.IDPESSJUR = PPP.IDPESSJUR '
      '                        AND ELP.IDPESSOA = PPP.IDPESSOA '
      '   JOIN PLANPREV PLP ON PPP.IDPLANOPREV = PLP.IDPLANOPREV '
      '   JOIN SITPART SIP ON PPP.IDSITPART = SIP.IDSITPART '
      
        '   JOIN SITPLANOPREV SPP ON PPP.IDSITPLANOPREV = SPP.IDSITPLANOP' +
        'REV '
      '   JOIN DEPENTIT DEP ON DEP.IDTITULAR = ELP.IDPESSOA '
      '   JOIN PESSOA PDP ON DEP.IDPESSOA = PDP.IDPESSOA '
      '   JOIN (SELECT DISTINCT BNF.IDPESSOA, '
      '                         BNF.IDTITULAR, '
      '                         BNF.IDPLANOPREV, '
      '                         BNF.IDPLANOORIGEM, '
      '                         BNF.IDPLANPREVCONTAB '
      '           FROM BENEFBFCIARIO BNF '
      
        '          WHERE (BNF.DATAFINAL IS NULL OR BNF.DATAFINAL > SYSDAT' +
        'E) '
      '            AND BNF.FONTEPAGADORA = 1 '
      '            AND BNF.IDSITBENEFICIO IN '
      '                     (SELECT MIN(SB1.IDSITBENEFICIO) '
      '                        FROM BENEFBFCIARIO SB1 '
      '                       WHERE BNF.IDPESSOA = SB1.IDPESSOA '
      '                         AND BNF.IDTITULAR = SB1.IDTITULAR '
      
        '                         AND SB1.IDSITBENEFICIO IN (1, 2, 7))) B' +
        'FC ON BFC.IDPESSOA = '
      
        '                                                                ' +
        '      DEP.IDPESSOA '
      
        '                                                                ' +
        '  AND BFC.IDTITULAR = '
      
        '                                                                ' +
        '      DEP.IDTITULAR '
      '   JOIN PLANPREV PLP2 ON PLP2.IDPLANOPREV = BFC.IDPLANOPREV '
      ' WHERE ((BFC.IDPLANPREVCONTAB = 28 OR '
      '       (BFC.IDPLANPREVCONTAB <> 28) AND NOT EXISTS '
      '       (SELECT 1 '
      '          FROM BENEFBFCIARIO BF '
      '         WHERE (BF.DATAFINAL IS NULL OR BF.DATAFINAL > SYSDATE) '
      '           AND BF.IDPESSOA = BFC.IDPESSOA '
      '           AND BF.IDTITULAR = BFC.IDTITULAR '
      '           AND BF.FONTEPAGADORA = 1 '
      '           AND BF.IDTPPAGTOBENEFIC = 1 '
      '           AND BF.IDPLANPREVCONTAB = 28 '
      '           AND BF.IDSITBENEFICIO IN '
      '               (SELECT MIN(SB1.IDSITBENEFICIO) '
      '                  FROM BENEFBFCIARIO SB1 '
      '                 WHERE BF.IDPESSOA = SB1.IDPESSOA '
      '                   AND BF.IDTITULAR = SB1.IDTITULAR '
      '                   AND SB1.IDSITBENEFICIO IN (1, 2, 7))))) '
      '  AND bfc.idpessoa <> bfc.idtitular '
      '  AND ppp.idplanoprev = (SELECT MAX(PPP2.IDPLANOPREV) '
      '                           FROM PARTPREVPLAN PPP2 '
      
        '                          WHERE PPP2.IDPESSOA = PPP.IDPESSOA)AND' +
        ' DEP.MATRICULA = :MATRICULA')
    ValidateWithMask = True
    Left = 966
    Top = 358
    ParamData = <
      item
        DataType = ftString
        Name = 'MATRICULA'
        ParamType = ptUnknown
      end>
    object qryPlanoPrevBeneficiarioNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qryPlanoPrevBeneficiarioNUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
      Size = 18
    end
    object qryPlanoPrevBeneficiarioINSCRICAONUMERO: TFloatField
      FieldName = 'INSCRICAONUMERO'
    end
    object qryPlanoPrevBeneficiarioPLANO: TStringField
      FieldName = 'PLANO'
      Size = 50
    end
    object qryPlanoPrevBeneficiarioIDRGELEGBENEF: TFloatField
      FieldName = 'IDRGELEGBENEF'
    end
    object qryPlanoPrevBeneficiarioIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object qryPlanoPrevBeneficiarioPATRO: TStringField
      FieldName = 'PATRO'
      Size = 60
    end
    object qryPlanoPrevBeneficiarioIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
    end
    object qryPlanoPrevBeneficiarioSEQPROPOSTA: TFloatField
      FieldName = 'SEQPROPOSTA'
    end
    object qryPlanoPrevBeneficiarioDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object qryPlanoPrevBeneficiarioSITUACAONOPLANO: TStringField
      FieldName = 'SITUACAONOPLANO'
      Size = 50
    end
    object qryPlanoPrevBeneficiarioFLGINTERNO: TStringField
      FieldName = 'FLGINTERNO'
      FixedChar = True
      Size = 2
    end
    object qryPlanoPrevBeneficiarioNOME_TITULAR: TStringField
      FieldName = 'NOME_TITULAR'
      Size = 60
    end
    object qryPlanoPrevBeneficiarioCPF_TITULAR: TStringField
      FieldName = 'CPF_TITULAR'
      FixedChar = True
      Size = 18
    end
    object qryPlanoPrevBeneficiarioMATRICULA_TITULAR: TStringField
      FieldName = 'MATRICULA_TITULAR'
      Size = 13
    end
    object qryPlanoPrevBeneficiarioIDTITULAR: TFloatField
      FieldName = 'IDTITULAR'
    end
    object qryPlanoPrevBeneficiarioEMAIL_TITULAR: TStringField
      FieldName = 'EMAIL_TITULAR'
      Size = 100
    end
  end
  object qryEmpresaProp: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select * from empresaprop')
    Left = 481
    Top = 495
  end
  object ppDetalhe_Beneficiario: TppBDEPipeline
    DataSource = DtmRubs.dtsDetBeneficiarios
    UserName = 'Detalhe_Beneficiario'
    Left = 516
    Top = 318
  end
  object ppDetalhe_Dependente: TppBDEPipeline
    DataSource = DtmRubs.dtsDetDependentes
    UserName = 'Detalhe_Dependente'
    Left = 492
    Top = 276
  end
  object qryContato: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    Filtered = True
    SQL.Strings = (
      
        'SELECT ENDPESS.IDPESSOA,  CONTATOPESS.IDCONTATO, CONTATOPESS.IDE' +
        'NDERECO, CONTATOPESS.NOME,'
      
        '       CONTATOPESS.EMAIL, CONTATOPESS.CARGO,     CONTATOPESS.SET' +
        'OR,      CONTATOPESS.NASCIMENTO,'
      '       CONTATOPESS.OBS'
      'FROM CONTATOPESS, ENDPESS'
      'WHERE ( ENDPESS.IDPESSOA       = :PIDPESSOA )'
      '  AND ( CONTATOPESS.IDENDERECO = ENDPESS.IDENDERECO )'
      ' '
      ' ')
    UpdateObject = updContato
    ValidateWithMask = True
    Left = 38
    Top = 264
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
    object qryContatoIDCONTATO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCONTATO'
      Origin = 'BASEDADOS.CONTATOPESS.IDCONTATO'
    end
    object qryContatoIDPESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.ENDPESS.IDPESSOA'
    end
    object qryContatoIDENDERECO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDENDERECO'
      Origin = 'BASEDADOS.CONTATOPESS.IDENDERECO'
    end
    object qryContatoNOME: TStringField
      DisplayWidth = 50
      FieldName = 'NOME'
      Origin = 'BASEDADOS.CONTATOPESS.NOME'
      Size = 50
    end
    object qryContatoEMAIL: TStringField
      DisplayWidth = 40
      FieldName = 'EMAIL'
      Origin = 'BASEDADOS.CONTATOPESS.EMAIL'
      Size = 40
    end
    object qryContatoCARGO: TStringField
      DisplayWidth = 30
      FieldName = 'CARGO'
      Origin = 'BASEDADOS.CONTATOPESS.CARGO'
      Size = 30
    end
    object qryContatoSETOR: TStringField
      DisplayWidth = 30
      FieldName = 'SETOR'
      Origin = 'BASEDADOS.CONTATOPESS.SETOR'
      Size = 30
    end
    object qryContatoNASCIMENTO: TDateTimeField
      DisplayWidth = 18
      FieldName = 'NASCIMENTO'
      Origin = 'BASEDADOS.CONTATOPESS.NASCIMENTO'
    end
    object qryContatoOBS: TMemoField
      DisplayWidth = 10
      FieldName = 'OBS'
      Origin = 'BASEDADOS.CONTATOPESS.OBS'
      BlobType = ftMemo
      Size = 500
    end
    object qryContatoTelefones: TStringField
      FieldKind = fkLookup
      FieldName = 'Telefones'
      LookupDataSet = qryRamal
      LookupKeyFields = 'IDCONTATO'
      LookupResultField = 'NUMERO'
      KeyFields = 'IDCONTATO'
      Lookup = True
    end
  end
  object dsContato: TwwDataSource
    AutoEdit = False
    DataSet = qryContato
    Left = 137
    Top = 233
  end
  object qryRamal: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    Filtered = True
    SQL.Strings = (
      
        'SELECT TELCONTATO.IDTELCONTATO, TELCONTATO.IDCONTATO, TELCONTATO' +
        '.IDTELEFONE,'
      
        '       TELCONTATO.RAMAL,        TELENDPESS.NUMERO,    CONTATOPES' +
        'S.NOME'
      'FROM CONTATOPESS, TELCONTATO, TELENDPESS'
      'WHERE ( CONTATOPESS.IDCONTATO  = :PIDCONTATO )'
      '  AND ( TELCONTATO.IDCONTATO   = CONTATOPESS.IDCONTATO )'
      '  AND ( TELCONTATO.IDTELEFONE  = TELENDPESS.IDTELEFONE )'
      ''
      ''
      ' '
      ' ')
    UpdateObject = updRamal
    ControlType.Strings = (
      'NUMERO;CustomEdit;dblcTelefone'
      'NOME;CustomEdit;dblcContato')
    ValidateWithMask = True
    Left = 98
    Top = 265
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTATO'
        ParamType = ptUnknown
      end>
    object qryRamalIDCONTATO: TFloatField
      FieldName = 'IDCONTATO'
      Origin = 'TELCONTATO.IDCONTATO'
    end
    object qryRamalIDTELEFONE: TFloatField
      FieldName = 'IDTELEFONE'
      Origin = 'TELCONTATO.IDTELEFONE'
    end
    object qryRamalRAMAL: TStringField
      FieldName = 'RAMAL'
      Origin = 'TELCONTATO.RAMAL'
    end
    object qryRamalNUMERO: TStringField
      DisplayWidth = 20
      FieldName = 'NUMERO'
      Origin = 'TELENDPESS.NUMERO'
    end
    object qryRamalNOME: TStringField
      FieldName = 'NOME'
      Origin = 'CONTATOPESS.NOME'
      Size = 50
    end
    object qryRamalIDTELCONTATO: TFloatField
      FieldName = 'IDTELCONTATO'
      Origin = 'TELCONTATO.IDTELCONTATO'
    end
  end
  object dsRamal: TwwDataSource
    DataSet = qryRamal
    Left = 109
    Top = 265
  end
  object updContato: TUpdateSQL
    ModifySQL.Strings = (
      'update CONTATOPESS'
      'set'
      '  IDENDERECO = :IDENDERECO,'
      '  IDCONTATO = :IDCONTATO,'
      '  NOME = :NOME,'
      '  EMAIL = :EMAIL,'
      '  CARGO = :CARGO,'
      '  SETOR = :SETOR,'
      '  NASCIMENTO = :NASCIMENTO,'
      '  OBS = :OBS,'
      '  TRGDTINCLUSAO = :TRGDTINCLUSAO,'
      '  TRGUSERINCLUSAO = :TRGUSERINCLUSAO,'
      '  IDTIPOCONTATOPESS = :IDTIPOCONTATOPESS'
      'where'
      '  IDCONTATO = :OLD_IDCONTATO')
    InsertSQL.Strings = (
      'insert into CONTATOPESS'
      
        '  (IDENDERECO, IDCONTATO, NOME, EMAIL, CARGO, SETOR, NASCIMENTO,' +
        ' '
      'OBS, TRGDTINCLUSAO, '
      '   TRGUSERINCLUSAO, IDTIPOCONTATOPESS)'
      'values'
      '  (:IDENDERECO, :IDCONTATO, :NOME, :EMAIL, :CARGO, :SETOR, '
      ':NASCIMENTO, '
      '   :OBS, :TRGDTINCLUSAO, :TRGUSERINCLUSAO, :IDTIPOCONTATOPESS)')
    DeleteSQL.Strings = (
      'delete from CONTATOPESS'
      'where'
      '  IDCONTATO = :OLD_IDCONTATO')
    Left = 211
    Top = 280
  end
  object updRamal: TUpdateSQL
    ModifySQL.Strings = (
      'update TELCONTATO'
      'set'
      '  IDTELCONTATO = :IDTELCONTATO,'
      '  IDCONTATO = :IDCONTATO,'
      '  IDTELEFONE = :IDTELEFONE,'
      '  RAMAL = :RAMAL'
      'where'
      '  IDTELCONTATO = :OLD_IDTELCONTATO')
    InsertSQL.Strings = (
      'insert into TELCONTATO'
      '  (IDTELCONTATO, IDCONTATO, IDTELEFONE, RAMAL)'
      'values'
      '  (:IDTELCONTATO, :IDCONTATO, :IDTELEFONE, :RAMAL)')
    DeleteSQL.Strings = (
      'delete from TELCONTATO'
      'where'
      '  IDTELCONTATO = :OLD_IDTELCONTATO')
    Left = 120
    Top = 265
  end
  object qryInsereContato: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    Filtered = True
    SQL.Strings = (
      'INSERT INTO CONTATOPESS'
      '  (IDCONTATO,IDENDERECO,NOME,EMAIL,NASCIMENTO,CARGO,SETOR,OBS)'
      'VALUES'
      
        '  (:IDCONTATO,:IDENDERECO,:NOME,:EMAIL,:NASCIMENTO,:CARGO,:SETOR' +
        ',:OBS)'
      ' ')
    ValidateWithMask = True
    Left = 30
    Top = 312
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDCONTATO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDENDERECO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NOME'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'EMAIL'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'NASCIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CARGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'SETOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'OBS'
        ParamType = ptUnknown
      end>
  end
  object qryInsereRamal: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    Filtered = True
    SQL.Strings = (
      'INSERT INTO TELCONTATO'
      '  (IDTELCONTATO,IDCONTATO,IDTELEFONE,RAMAL)'
      'VALUES'
      '  (:IDTELCONTATO,:IDCONTATO,:IDTELEFONE,:RAMAL)')
    ValidateWithMask = True
    Left = 94
    Top = 296
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDTELCONTATO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDCONTATO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDTELEFONE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'RAMAL'
        ParamType = ptUnknown
      end>
  end
  object qryAlteraContato: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    Filtered = True
    SQL.Strings = (
      'UPDATE CONTATOPESS'
      'SET IDENDERECO = :IDENDERECO,'
      '    NOME       = :NOME,'
      '    EMAIL      = :EMAIL,'
      '    NASCIMENTO = :NASCIMENTO,'
      '    CARGO      = :CARGO,'
      '    SETOR      = :SETOR,'
      '    OBS        = :OBS'
      'WHERE IDCONTATO = :IDCONTATO'
      ' ')
    ValidateWithMask = True
    Left = 86
    Top = 336
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDENDERECO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NOME'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'EMAIL'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'NASCIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CARGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'SETOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'OBS'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDCONTATO'
        ParamType = ptUnknown
      end>
  end
  object qryAlteraRamal: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    Filtered = True
    SQL.Strings = (
      'UPDATE TELCONTATO'
      'SET IDTELEFONE = :IDTELEFONE,'
      '    RAMAL      = :RAMAL'
      'WHERE IDTELCONTATO = :IDTELCONTATO'
      ' ')
    ValidateWithMask = True
    Left = 126
    Top = 312
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDTELEFONE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'RAMAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDTELCONTATO'
        ParamType = ptUnknown
      end>
  end
  object qryExcluiContato: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    Filtered = True
    SQL.Strings = (
      'DELETE FROM CONTATOPESS'
      'WHERE IDCONTATO = :IDCONTATO')
    ValidateWithMask = True
    Left = 78
    Top = 360
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDCONTATO'
        ParamType = ptUnknown
      end>
  end
  object qryExcluiRamal: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    Filtered = True
    SQL.Strings = (
      'DELETE FROM TELCONTATO'
      'WHERE IDTELCONTATO = :IDTELCONTATO')
    ValidateWithMask = True
    Left = 134
    Top = 336
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDTELCONTATO'
        ParamType = ptUnknown
      end>
  end
  object wwQuery1: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 176
    Top = 303
  end
  object MS_Atendimento: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'DECODE(DEP.MATRICULA,NULL,ELEGPATRO.MATRICULA, DEP.MATRICULA)'
      'ELEGPATRO.MATRICULA'
      'ATEND.NOMESOLICITANTE'
      'ATEND.CODATEND'
      'ATEND.COMPLCODATEND'
      'ATEND.STATUS'
      'PESSOA.NOME'
      'PLANPREV.NOME'
      'PARTPREVPLAN.INSCRICAONUMERO'
      'PESSOA.NUMDOCUMENTO'
      'PJ.NOME'
      'TRUNC(ATEND.DATA)'
      'ATEND.IDATEND'
      'BF.NOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'N'
      'N'
      'C'
      'C'
      'C'
      'N'
      'C'
      'C'
      'D'
      'N'
      'C')
    Descricao.Strings = (
      'Matrícula'
      'Matrícula Titular'
      'Solicitante'
      'Código Atendimento'
      'Complemento'
      'Status'
      'Nome'
      'Plano'
      'Inscrição'
      'CPF'
      'Patrocinadora'
      'Data'
      'Número Atendimento'
      'Beneficiário')
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
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PLANPREV'
      'PESSOA PJ'
      'SITPART'
      'PARTPREVPLAN'
      'ELEGPATRO'
      'PESSOA'
      'ATEND'
      'PESSOA BF'
      'DEPENTIT DEP')
    CamposChave.Strings = (
      'PESSOA.NOME'
      'PESSOA.NUMDOCUMENTO'
      'ELEGPATRO.MATRICULA'
      'PARTPREVPLAN.INSCRICAONUMERO'
      'PLANPREV.NOME'
      'ATEND.IDATEND'
      'PJ.IDPESSOA'
      'ATEND.IDTITULAR'
      'SITPART.DESCRICAO'
      'PJ.NOME'
      'BF.NOME'
      'PLANPREV.IDPLANOPREV')
    Filtro.Strings = (
      'ATEND.IDTITULAR = ELEGPATRO.IDPESSOA'
      'PJ.IDPESSOA = ELEGPATRO.IDPESSJUR'
      'PARTPREVPLAN.IDPESSOA(+) = ELEGPATRO.IDPESSOA'
      'PARTPREVPLAN.IDPESSJUR(+) = ELEGPATRO.IDPESSJUR'
      'PARTPREVPLAN.IDPLANOPREV = PLANPREV.IDPLANOPREV(+)'
      'PARTPREVPLAN.IDSITPART = SITPART.IDSITPART(+)'
      'PARTPREVPLAN.FLGDESATIVADO(+) = 0'
      'ATEND.IDBENEFICIARIO = BF.IDPESSOA(+)'
      'ELEGPATRO.IDPESSOA = PESSOA.IDPESSOA'
      'DEP.IDPESSOA = ATEND.IDBENEFICIARIO'
      'DEP.IDTITULAR = ELEGPATRO.IDPESSOA')
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
      ''
      'DD/MM/YYYY:HH:MM:SS'
      ''
      '')
    Larguras.Strings = (
      '13'
      '13'
      '35'
      '10'
      '10'
      '12'
      '35'
      '35'
      '13'
      '18'
      '30'
      '10'
      '10'
      '35')
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
    Left = 1080
    Top = 360
  end
  object QryProcJud: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  NUMEROPROCESSO,  AUTORACAO, NOMEVARA'
      'FROM     PROCJUD'
      'WHERE IDPESSOA = :IDPESSOA')
    UpdateMode = upWhereChanged
    Left = 825
    Top = 504
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptInput
      end>
  end
  object DSProcJud: TDataSource
    DataSet = QryProcJud
    Left = 873
    Top = 527
  end
  object QryRespon: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '  PES.NOME,'
      '  TRC.DESCRICAO,'
      '  BFC.IDRESPONNAOREC '
      ''
      'FROM'
      '  PESSOA          PES,'
      '  BFCIARIOTITPLAN BFC,'
      '  TIPORECEBEDOR   TRC'
      ''
      'WHERE BFC.IDTITULAR    = :IDTITULAR'
      '  AND BFC.IDPESSOA   = :IDPESSOA'
      '  AND BFC.CODTIPORECEBEDOR = TRC.CODTIPORECEBEDOR'
      '  AND BFC.IDRESPONNAOREC   = PES.IDPESSOA'
      ' ')
    Left = 689
    Top = 527
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object DSRespon: TDataSource
    DataSet = qryTitular
    Left = 737
    Top = 543
  end
  object QryDocRespon: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '   TDP.NOMEDOCUMENTO,'
      '   DP.DATAEMISSAO, DP.DATAVALIDADE'
      '  '
      '  FROM'
      '   TIPODOCPESSOA TDP,'
      '   DOCPESSOA  DP'
      '  '
      '  WHERE DP.IDDOCUMENTO    = TDP.IDDOCUMENTO'
      '    AND DP.IDPESSOA       = :IDRESPON')
    Left = 941
    Top = 470
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDRESPON'
        ParamType = ptInput
      end>
  end
  object DSDocRespon: TDataSource
    DataSet = QryDocRespon
    Left = 997
    Top = 494
  end
  object QryAlimentada: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select distinct'
      '       pe.NOME,'
      '       pe.NUMDOCUMENTO,'
      '       cc.CONTACORRENTE,'
      '       pe_age.nome as agencia,'
      '       pe_bco.NOME AS BANCO,'
      '       DECODE(cc.TIPOCONTA, '#39'1'#39', '#39'Conta Corrente'#39','
      '                            '#39'2'#39', '#39'Conta Salário'#39','
      '                            '#39'3'#39', '#39'Poupança'#39','
      '                            '#39'4'#39', '#39'OP/Recibo'#39','
      '                            '#39'Conta Corrente'#39') AS NOMETIPOCONTA,'
      '       DECODE(NVL(cc.flgcontaPref,0), '#39'1'#39','#39'Sim'#39','
      
        '                                      '#39'0'#39','#39'Não'#39') AS CONTAPREFERE' +
        'NCIAL,'
      ''
      '       DECODE (NVL(cc.flgcontaconjunta,'#39'N'#39'), '#39'N'#39','#39'Não'#39','
      
        '                                           '#39'S'#39','#39'Sim'#39') AS CONTACO' +
        'NJUNTA,'
      '       ende.logradouro,'
      '       ende.complemento,'
      '       ende.CODESTADO,'
      '       ende.NUMERO,'
      '       ende.BAIRRO,'
      '       ende.CIDADE,'
      '       ende.CEP       '
      'from Pessoa pe,'
      '     Endpess ende,'
      '     Contabancaria cc,'
      '     pessoa pe_age,'
      '     pessoa pe_bco,'
      '     AGENCIABANCARIA age,'
      '     banco bco'
      'WHERE pe.IDPESSOA IN (SELECT Distinct h.IDPESSOA'
      '                      FROM HISTRUBSAL H'
      '                      WHERE h.IDTITULAR = :IDTITULAR'
      '                        AND '
      '                        H.idtitular <> H.idpessoa'
      '                        and h.flgpensaoalim = 2)'
      '  and pe.idpessoa  = ende.idpessoa(+)'
      '  and pe.idpessoa  = cc.idpessoa(+)'
      '  and cc.idagencia = age.idpessoa'
      '  AND age.IDPESSOA = pe_age.IDPESSOA'
      '  AND age.IDBANCO  = bco.IDPESSOA'
      '  AND bco.idpessoa = pe_bco.IDPESSOA')
    Left = 733
    Top = 463
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end>
  end
  object DsAlimetada: TDataSource
    DataSet = QryAlimentada
    Left = 637
    Top = 479
  end
  object qryForceCommit: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'begin'
      '  commit;'
      'end;')
    ValidateWithMask = True
    Left = 1194
    Top = 492
  end
end
