inherited frmRelContrato: TfrmRelContrato
  Left = 313
  Top = 91
  HelpContext = 150050
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Contratos e Parcelas'
  ClientHeight = 630
  ClientWidth = 1011
  FormStyle = fsNormal
  Position = poDesktopCenter
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 1011
    Height = 597
    TabOrder = 1
    object Label29: TLabel
      Left = 16
      Top = 10
      Width = 114
      Height = 13
      Caption = 'Número do Contrato'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Image1: TImage
      Left = 0
      Top = 0
      Width = 17
      Height = 17
    end
    object btnRefresh: TToolbarButton97
      Left = 722
      Top = 14
      Width = 33
      Height = 32
      Hint = 'Atualiza dados do Histórico'
      AllowAllUp = True
      GroupIndex = 2
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        888888888888FFFFFF88888800008888844444488888888F88F7777778F88888
        000024884222222448888877FF788888877F888800002244222222222488887F
        7788FFFFF887F8880000222222AAAAA22248887F888F77777F887F8800002222
        2A88888A2224887F88F7888887F887F80000222228888888A224887F8878F888
        887FF7F80000222222888888A444887FFFF78F88887777880000AAAAAAA88888
        8888887777777888888888880000888888888888888888888888888888FFFFFF
        00008888888888844444488FFFF888888777777F0000A444888888A222224877
        77F888887F88887F0000A2248888888A2222487F878F888887F8887F00008A22
        48888844222248878878FFFF7788887F00008A222444442222224887F8877777
        888FF87F000088A2222222222AA248887FF888888FF77F780000888AA222222A
        A88A8888877FFFFFF7788788000088888AAAAAA8888888888887777778888888
        0000}
      NumGlyphs = 2
      Opaque = False
      OnClick = btnRefreshClick
    end
    object pgcDados: TPageControl
      Left = 8
      Top = 60
      Width = 925
      Height = 535
      ActivePage = tbsCondicoes
      TabOrder = 0
      OnChange = pgcDadosChange
      object tbsCondicoes: TTabSheet
        Caption = 'Contrato'
        object Label27: TLabel
          Left = 18
          Top = 50
          Width = 122
          Height = 13
          Caption = 'Plano Previdenciário '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label8: TLabel
          Left = 270
          Top = 10
          Width = 117
          Height = 13
          Caption = 'Insc. em Empréstimo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 18
          Top = 89
          Width = 80
          Height = 13
          Caption = 'Patrocinadora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label34: TLabel
          Left = 142
          Top = 10
          Width = 107
          Height = 13
          Caption = 'Matrícula Empresa'
        end
        object Label41: TLabel
          Left = 432
          Top = 50
          Width = 181
          Height = 13
          Caption = 'Situação do Participante Titular'
        end
        object Label18: TLabel
          Left = 16
          Top = 10
          Width = 114
          Height = 13
          Caption = 'Insc. Previdenciária'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblTitulo: TfcLabel
          Left = 16
          Top = 395
          Width = 317
          Height = 24
          Caption = 'Contrato Pendente de Quitação'
          Color = clBtnFace
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          TextOptions.Alignment = taLeftJustify
          TextOptions.Style = fclsRaised
          TextOptions.VAlignment = vaTop
        end
        object lblInternet: TfcLabel
          Left = 16
          Top = 363
          Width = 82
          Height = 27
          Caption = 'Internet'
          Color = clBtnFace
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -24
          Font.Name = 'Arial'
          Font.Style = [fsUnderline]
          ParentColor = False
          ParentFont = False
          TextOptions.Alignment = taLeftJustify
          TextOptions.ExtrudeEffects.Depth = 0
          TextOptions.HighlightColor = clHighlightText
          TextOptions.Style = fclsRaised
          TextOptions.VAlignment = vaTop
          Visible = False
        end
        object Label78: TLabel
          Left = 400
          Top = 90
          Width = 158
          Height = 13
          Caption = 'Situação Funcional (Titular)'
        end
        object Label80: TLabel
          Left = 624
          Top = 90
          Width = 132
          Height = 13
          Caption = 'Situação no Plano (Tit)'
        end
        object Label81: TLabel
          Left = 224
          Top = 50
          Width = 190
          Height = 13
          Caption = 'Entidade Contábil / Plano Origem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label86: TLabel
          Left = 248
          Top = 90
          Width = 40
          Height = 13
          Caption = 'Cedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label94: TLabel
          Left = 398
          Top = 9
          Width = 153
          Height = 13
          Caption = 'Data Falecimento Mutuário'
        end
        object lblNUP: TLabel
          Left = 559
          Top = 10
          Width = 113
          Height = 13
          Caption = 'NUP / Funcef Suite'
        end
        object fcLblPerda: TfcLabel
          Left = 341
          Top = 367
          Width = 135
          Height = 24
          Caption = 'Perda Efetiva'
          Font.Charset = ANSI_CHARSET
          Font.Color = clMaroon
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TextOptions.Alignment = taLeftJustify
          TextOptions.Style = fclsRaised
          TextOptions.VAlignment = vaTop
          Visible = False
        end
        object lblAcordoJudicial: TfcLabel
          Left = 16
          Top = 422
          Width = 157
          Height = 24
          Caption = 'Acordo Judicial'
          Color = clBtnFace
          Font.Charset = ANSI_CHARSET
          Font.Color = clOlive
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          TextOptions.Alignment = taLeftJustify
          TextOptions.ShadeColor = clBtnText
          TextOptions.Style = fclsRaised
          TextOptions.VAlignment = vaTop
          Visible = False
        end
        object Label106: TLabel
          Left = 778
          Top = 47
          Width = 99
          Height = 13
          Caption = 'Tipo Amortização'
          FocusControl = EdtDbTipoAmotizacao
        end
        object lblAcordoQueroPagar: TfcLabel
          Left = 16
          Top = 451
          Width = 207
          Height = 24
          Caption = 'Acordo Quero Pagar'
          Color = clBtnFace
          Font.Charset = ANSI_CHARSET
          Font.Color = clGreen
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          TextOptions.Alignment = taLeftJustify
          TextOptions.ShadeColor = clBtnText
          TextOptions.Style = fclsRaised
          TextOptions.VAlignment = vaTop
          Visible = False
        end
        object lblPolRenegociacao: TfcLabel
          Left = 15
          Top = 481
          Width = 254
          Height = 24
          Caption = 'Política de Renegociação'
          Color = clBtnFace
          Font.Charset = ANSI_CHARSET
          Font.Color = clTeal
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          TextOptions.Alignment = taLeftJustify
          TextOptions.ShadeColor = clBtnText
          TextOptions.Style = fclsRaised
          TextOptions.VAlignment = vaTop
          Visible = False
        end
        object DBedtCodInsc: TDBEdit
          Left = 270
          Top = 24
          Width = 121
          Height = 21
          TabStop = False
          Color = clBtnFace
          DataField = 'INSCRICAO'
          DataSource = dts
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
        end
        object DBedtPlanoPrev: TDBEdit
          Left = 16
          Top = 64
          Width = 201
          Height = 21
          TabStop = False
          Color = clBtnFace
          DataField = 'PLANOPREV'
          DataSource = dts
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
        end
        object DBedtPatro: TDBEdit
          Left = 16
          Top = 104
          Width = 233
          Height = 21
          TabStop = False
          Color = clBtnFace
          DataField = 'PATRO'
          DataSource = dts
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 16
        end
        object DBedtInscricao: TDBEdit
          Left = 16
          Top = 24
          Width = 121
          Height = 21
          TabStop = False
          Color = clBtnFace
          DataField = 'INSCRICAONUMERO'
          DataSource = dts
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
        object DBedtMtrEmpresa: TDBEdit
          Left = 142
          Top = 24
          Width = 115
          Height = 21
          TabStop = False
          Color = clBtnFace
          DataField = 'MATRICULA'
          DataSource = dts
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
        object DBedtSitPart: TDBEdit
          Left = 456
          Top = 64
          Width = 317
          Height = 21
          TabStop = False
          Color = clBtnFace
          DataField = 'SITUACAO'
          DataSource = dts
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 5
        end
        object rgExcepcional: TRadioGroup
          Left = 577
          Top = 383
          Width = 185
          Height = 105
          Caption = 'Excepcional'
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 8
          Visible = False
        end
        object chkValorSolictado: TCheckBox
          Left = 585
          Top = 407
          Width = 112
          Height = 17
          Caption = 'Valor Solicitado'
          Enabled = False
          TabOrder = 17
          Visible = False
        end
        object chkElegibilidade: TCheckBox
          Left = 585
          Top = 426
          Width = 97
          Height = 17
          Caption = 'Elegibilidade'
          Enabled = False
          TabOrder = 18
          Visible = False
        end
        object chkInadimplencia: TCheckBox
          Left = 585
          Top = 445
          Width = 97
          Height = 17
          Caption = 'Inadimplência'
          Enabled = False
          TabOrder = 19
          Visible = False
        end
        object chkOutros: TCheckBox
          Left = 585
          Top = 464
          Width = 97
          Height = 17
          Caption = 'Outros'
          Enabled = False
          TabOrder = 20
          Visible = False
        end
        object pgcSecundario: TPageControl
          Left = 12
          Top = 132
          Width = 748
          Height = 228
          ActivePage = pgcValores
          TabOrder = 11
          object TabSheet5: TTabSheet
            Caption = 'Dados do Contrato'
            object Label43: TLabel
              Left = 216
              Top = 46
              Width = 90
              Height = 13
              Caption = 'Data do Crédito'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label12: TLabel
              Left = 8
              Top = 46
              Width = 91
              Height = 13
              Caption = 'Data Assinatura'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label1: TLabel
              Left = 112
              Top = 46
              Width = 95
              Height = 13
              Caption = 'Data Solicitação'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label3: TLabel
              Left = 320
              Top = 46
              Width = 91
              Height = 13
              Caption = 'Data 1º Parcela'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label5: TLabel
              Left = 560
              Top = 46
              Width = 90
              Height = 13
              Caption = 'Data Canc/Quit'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label47: TLabel
              Left = 432
              Top = 46
              Width = 67
              Height = 13
              Caption = 'Quitado por'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label13: TLabel
              Left = 8
              Top = 6
              Width = 96
              Height = 13
              Caption = 'Tipo de Contrato'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label51: TLabel
              Left = 336
              Top = 6
              Width = 57
              Height = 13
              Caption = 'Indexador'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label14: TLabel
              Left = 416
              Top = 6
              Width = 180
              Height = 13
              Caption = 'Responsável pelo Recebimento'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBedtDataAssinatura: TCMDateTimePicker
              Left = 8
              Top = 60
              Width = 97
              Height = 21
              TabStop = False
              AutoSize = False
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              Color = clBtnFace
              ButtonStyle = cbsCustom
              DataField = 'DATAASSINATURA'
              DataSource = dts
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
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              ShowButton = True
              TabOrder = 3
            end
            object DBedtDataCredito: TCMDateTimePicker
              Left = 216
              Top = 60
              Width = 97
              Height = 21
              TabStop = False
              AutoSize = False
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              Color = clBtnFace
              ButtonStyle = cbsCustom
              DataField = 'DATACREDITO'
              DataSource = dts
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
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              ShowButton = True
              TabOrder = 5
            end
            object DBedtDataInsc: TCMDateTimePicker
              Left = 112
              Top = 60
              Width = 97
              Height = 21
              TabStop = False
              AutoSize = False
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              Color = clBtnFace
              ButtonStyle = cbsCustom
              DataField = 'DATAINSC'
              DataSource = dts
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
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              ShowButton = True
              TabOrder = 4
            end
            object DBedtDataPrimParcela: TCMDateTimePicker
              Left = 320
              Top = 60
              Width = 97
              Height = 21
              TabStop = False
              AutoSize = False
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              Color = clBtnFace
              ButtonStyle = cbsCustom
              DataField = 'DATAPRIMPARC'
              DataSource = dts
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
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              ShowButton = True
              TabOrder = 6
            end
            object DBedtDtCancelamento: TCMDateTimePicker
              Left = 560
              Top = 60
              Width = 97
              Height = 21
              TabStop = False
              AutoSize = False
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              Color = clBtnFace
              ButtonStyle = cbsCustom
              DataField = 'DATACANC'
              DataSource = dts
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
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              ShowButton = True
              TabOrder = 7
            end
            object DBedtTipoContrato: TDBEdit
              Left = 8
              Top = 20
              Width = 329
              Height = 21
              TabStop = False
              Color = clBtnFace
              DataField = 'TceDescricao'
              DataSource = dts
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
            end
            object DBEdit4: TDBEdit
              Left = 336
              Top = 20
              Width = 73
              Height = 21
              TabStop = False
              Color = clBtnFace
              DataField = 'MOESIGLA'
              DataSource = dts
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
            end
            object DBedtTipoEmptmo: TDBEdit
              Left = 416
              Top = 20
              Width = 313
              Height = 21
              TabStop = False
              Color = clBtnFace
              DataField = 'NOMERESPONSAVEL'
              DataSource = dts
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 2
            end
            object btnContratoQuitacao: TBitBtn
              Left = 432
              Top = 60
              Width = 113
              Height = 23
              TabOrder = 8
              OnClick = btnContratoQuitacaoClick
            end
          end
          object pgcValores: TTabSheet
            Caption = 'Valores'
            ImageIndex = 1
            object Label17: TLabel
              Left = 8
              Top = 6
              Width = 90
              Height = 13
              Caption = 'Valor Solicitado'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label21: TLabel
              Left = 413
              Top = 6
              Width = 63
              Height = 13
              Caption = 'Taxa Juros'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label44: TLabel
              Left = 570
              Top = 12
              Width = 102
              Height = 13
              Alignment = taRightJustify
              Caption = 'Nº de Parcelas:   '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label71: TLabel
              Left = 597
              Top = 90
              Width = 59
              Height = 13
              Alignment = taRightJustify
              Caption = 'Carencia :'
              FocusControl = dbEdtNumParcDesc
            end
            object Label42: TLabel
              Left = 156
              Top = 46
              Width = 85
              Height = 13
              Caption = 'Saldo Devedor'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label39: TLabel
              Left = 156
              Top = 6
              Width = 109
              Height = 13
              Caption = 'Valor Parcela Base'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label38: TLabel
              Left = 545
              Top = 38
              Width = 127
              Height = 13
              Alignment = taRightJustify
              Caption = 'Parcelas Restantes:   '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBText2: TDBText
              Left = 482
              Top = 23
              Width = 53
              Height = 15
              DataField = 'TCELEGENDACALC'
              DataSource = dts
            end
            object Label88: TLabel
              Left = 279
              Top = 6
              Width = 114
              Height = 13
              Caption = 'Salário Considerado'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label89: TLabel
              Left = 279
              Top = 46
              Width = 119
              Height = 13
              Caption = 'Margem Considerada'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label95: TLabel
              Left = 8
              Top = 46
              Width = 132
              Height = 13
              Caption = 'Valor Máximo Permitido'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label103: TLabel
              Left = 463
              Top = 65
              Width = 209
              Height = 13
              Alignment = taRightJustify
              Caption = 'Contratos Quitados na Concessão:   '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label104: TLabel
              Left = 8
              Top = 89
              Width = 109
              Height = 13
              Caption = 'Contratos Quitados'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBedtValSolic: TDBEdit
              Left = 8
              Top = 20
              Width = 105
              Height = 21
              TabStop = False
              Color = clBtnFace
              DataField = 'VLRCONTRATO'
              DataSource = dts
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
            end
            object DBedtJuros: TDBEdit
              Left = 413
              Top = 20
              Width = 65
              Height = 21
              TabStop = False
              Color = clBtnFace
              DataField = 'TXJUROS'
              DataSource = dts
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
            end
            object DBedtParcelas: TDBEdit
              Left = 666
              Top = 8
              Width = 65
              Height = 21
              TabStop = False
              AutoSize = False
              Color = 15790320
              DataField = 'NUMPARCELAS'
              DataSource = dts
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 2
            end
            object dbEdtNumParcDesc: TDBEdit
              Left = 666
              Top = 84
              Width = 65
              Height = 21
              Color = clBtnFace
              DataField = 'NUMPARCDESCONTO'
              DataSource = dts
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 3
            end
            object edtSaldoDevedor: TRealEdit
              Left = 156
              Top = 60
              Width = 105
              Height = 21
              Alignment = taRightJustify
              Color = clBtnFace
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Lines.Strings = (
                '      0,00')
              ParentFont = False
              ReadOnly = True
              TabOrder = 4
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
            end
            object DBedtValorParcela: TDBEdit
              Left = 156
              Top = 20
              Width = 105
              Height = 21
              TabStop = False
              Color = clBtnFace
              DataField = 'VLRPARCELA'
              DataSource = dts
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 5
            end
            object edtParcRestante: TRealEdit
              Left = 666
              Top = 34
              Width = 65
              Height = 21
              Alignment = taRightJustify
              Color = 15790320
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Lines.Strings = (
                '0')
              ParentFont = False
              ReadOnly = True
              TabOrder = 6
              WordWrap = False
              IntDigits = 10
              DecDigits = 0
              NumberFormat = iNumber
              Signal = False
            end
            object DBEdit36: TDBEdit
              Left = 279
              Top = 20
              Width = 113
              Height = 21
              TabStop = False
              Color = clBtnFace
              DataField = 'VLRSALBASE'
              DataSource = dts
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 7
            end
            object DBEdit37: TDBEdit
              Left = 279
              Top = 60
              Width = 113
              Height = 21
              TabStop = False
              Color = clBtnFace
              DataField = 'VLRMARGEM'
              DataSource = dts
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 8
            end
            object DBedtValorMaxPermitido: TDBEdit
              Left = 8
              Top = 60
              Width = 105
              Height = 21
              TabStop = False
              Color = clBtnFace
              DataField = 'VLRMAXPERMIT'
              DataSource = dts
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 9
            end
            object DBEdit41: TDBEdit
              Left = 666
              Top = 58
              Width = 65
              Height = 21
              TabStop = False
              Color = clBtnFace
              DataField = 'QTDECONTQUITADO'
              DataSource = dts
              DragCursor = crDefault
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 10
            end
            object gridContratosQuitados: TwwDBGrid
              Left = 8
              Top = 104
              Width = 721
              Height = 95
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              DataSource = dsContratosQuitados
              TabOrder = 11
              TitleAlignment = taLeftJustify
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -9
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = [fsBold]
              TitleLines = 1
              TitleButtons = False
              OnDblClick = gridContratosQuitadosDblClick
              IndicatorColor = icBlack
            end
          end
          object TabSheet6: TTabSheet
            Caption = 'Outras Informações'
            ImageIndex = 2
            object Label82: TLabel
              Left = 558
              Top = 9
              Width = 71
              Height = 13
              Alignment = taRightJustify
              Caption = 'IDPessoa:   '
            end
            object Label83: TLabel
              Left = 566
              Top = 37
              Width = 63
              Height = 13
              Alignment = taRightJustify
              Caption = 'IDBenef:   '
            end
            object Label6: TLabel
              Left = 517
              Top = 63
              Width = 99
              Height = 13
              Alignment = taRightJustify
              Caption = 'Auto-Empréstimo:'
            end
            object Label101: TLabel
              Left = 538
              Top = 83
              Width = 79
              Height = 13
              Alignment = taRightJustify
              Caption = 'Quant. Meses'
            end
            object Label102: TLabel
              Left = 538
              Top = 94
              Width = 62
              Height = 13
              Alignment = taRightJustify
              Caption = 'Suspensos'
            end
            object GroupBox1: TGroupBox
              Left = 8
              Top = 8
              Width = 465
              Height = 65
              Caption = ' Suspensão '
              TabOrder = 0
              object Label48: TLabel
                Left = 16
                Top = 18
                Width = 110
                Height = 13
                Caption = 'Tipo de Suspensão'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label49: TLabel
                Left = 240
                Top = 18
                Width = 34
                Height = 13
                Caption = 'Início'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label50: TLabel
                Left = 352
                Top = 18
                Width = 28
                Height = 13
                Caption = 'Final'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object DBEdit3: TDBEdit
                Left = 16
                Top = 32
                Width = 209
                Height = 21
                TabStop = False
                Color = clBtnFace
                DataField = 'TSEDESCRICAO'
                DataSource = dts
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 0
              end
              object CMDateTimePicker3: TCMDateTimePicker
                Left = 240
                Top = 32
                Width = 97
                Height = 21
                TabStop = False
                AutoSize = False
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                Color = clBtnFace
                ButtonStyle = cbsCustom
                DataField = 'DATAINICIOSUSP'
                DataSource = dts
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
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                ShowButton = True
                TabOrder = 1
              end
              object CMDateTimePicker4: TCMDateTimePicker
                Left = 352
                Top = 32
                Width = 97
                Height = 21
                TabStop = False
                AutoSize = False
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                Color = clBtnFace
                ButtonStyle = cbsCustom
                DataField = 'DATAFIMSUSP'
                DataSource = dts
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
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                ShowButton = True
                TabOrder = 2
              end
            end
            object DBEdit29: TDBEdit
              Left = 622
              Top = 5
              Width = 109
              Height = 21
              TabStop = False
              Color = clBtnFace
              DataField = 'IDPESSOA'
              DataSource = dts
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
            end
            object DBEdit30: TDBEdit
              Left = 622
              Top = 33
              Width = 109
              Height = 21
              TabStop = False
              Color = clBtnFace
              DataField = 'IDBENEF'
              DataSource = dts
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 2
            end
            object DBEdit39: TDBEdit
              Left = 622
              Top = 60
              Width = 109
              Height = 21
              TabStop = False
              Color = clBtnFace
              DataField = 'CODAUTOEMP'
              DataSource = dts
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 3
            end
            object GroupBox8: TGroupBox
              Left = 8
              Top = 83
              Width = 465
              Height = 65
              Caption = 'Valor Máximo Prestação'
              TabOrder = 4
              object Label97: TLabel
                Left = 16
                Top = 18
                Width = 30
                Height = 13
                Caption = 'Valor'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label98: TLabel
                Left = 240
                Top = 18
                Width = 34
                Height = 13
                Caption = 'Início'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label99: TLabel
                Left = 352
                Top = 18
                Width = 28
                Height = 13
                Caption = 'Final'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object dbedtValor: TDBEdit
                Left = 16
                Top = 32
                Width = 209
                Height = 21
                TabStop = False
                Color = clBtnFace
                DataField = 'VALORMAX'
                DataSource = dts
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 0
              end
              object cmdtInicio: TCMDateTimePicker
                Left = 240
                Top = 32
                Width = 97
                Height = 21
                TabStop = False
                AutoSize = False
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                Color = clBtnFace
                ButtonStyle = cbsCustom
                DataField = 'DATAINICIO'
                DataSource = dts
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
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                ShowButton = True
                TabOrder = 1
              end
              object cmdtFinal: TCMDateTimePicker
                Left = 352
                Top = 32
                Width = 97
                Height = 21
                TabStop = False
                AutoSize = False
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                Color = clBtnFace
                ButtonStyle = cbsCustom
                DataField = 'DATAFIM'
                DataSource = dts
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
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                ShowButton = True
                TabOrder = 2
              end
            end
            object DBEdit40: TDBEdit
              Left = 622
              Top = 86
              Width = 109
              Height = 21
              TabStop = False
              Color = clBtnFace
              DataField = 'QTDEMESSUSP'
              DataSource = dts
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 5
            end
          end
          object TabSheet7: TTabSheet
            Caption = 'Histórico de Migrações'
            ImageIndex = 3
            object wwDBGrid4: TwwDBGrid
              Left = 0
              Top = 0
              Width = 409
              Height = 200
              Selected.Strings = (
                'DATAMIGRA'#9'12'#9'Migração'
                'OBSERVACAO'#9'40'#9'Observação'
                'NOME_PATANT'#9'26'#9'Patrocinador Anterior'
                'NOME_PATATU'#9'26'#9'Patrocinador Atual'
                'NOME_PLANO_ANT'#9'26'#9'Plano Contábil Anterior'
                'NOME_PLANO_ATU'#9'26'#9'Plano Contábil Atual')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              Align = alLeft
              DataSource = dsHistMigracoes
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
            object wwDBGrid5: TwwDBGrid
              Left = 409
              Top = 0
              Width = 331
              Height = 200
              Selected.Strings = (
                'ITEDESCRICAO'#9'30'#9'Item'
                'VALOR'#9'11'#9'Valor')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              Align = alClient
              DataSource = dsItensMigracoes
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
          end
        end
        object DBEdit22: TDBEdit
          Left = 424
          Top = 104
          Width = 185
          Height = 21
          TabStop = False
          Color = clBtnFace
          DataField = 'SITUACAO_FUNC'
          DataSource = dts
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 10
        end
        object DBEdit24: TDBEdit
          Left = 648
          Top = 104
          Width = 97
          Height = 21
          TabStop = False
          Color = clBtnFace
          DataField = 'SITUACAO_PLANO'
          DataSource = dts
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 7
        end
        object DBEdit25: TDBEdit
          Left = 624
          Top = 104
          Width = 25
          Height = 21
          TabStop = False
          Color = clBtnFace
          DataField = 'SITUACAO_INT_PLANO'
          DataSource = dts
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 6
        end
        object DBEdit26: TDBEdit
          Left = 432
          Top = 64
          Width = 25
          Height = 21
          TabStop = False
          Color = clBtnFace
          DataField = 'SITUACAO_INT'
          DataSource = dts
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
        end
        object DBEdit27: TDBEdit
          Left = 400
          Top = 104
          Width = 25
          Height = 21
          TabStop = False
          Color = clBtnFace
          DataField = 'SITUACAO_INT_FUNC'
          DataSource = dts
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 9
        end
        object DBEdit28: TDBEdit
          Left = 224
          Top = 64
          Width = 201
          Height = 21
          TabStop = False
          Color = clBtnFace
          DataField = 'PLANOORIGEM'
          DataSource = dts
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 12
        end
        object DBEdit33: TDBEdit
          Left = 248
          Top = 104
          Width = 137
          Height = 21
          TabStop = False
          Color = clBtnFace
          DataField = 'CEDIDO'
          DataSource = dts
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 13
        end
        object pnlTitular: TPanel
          Left = 685
          Top = 0
          Width = 197
          Height = 45
          BevelOuter = bvNone
          TabOrder = 14
          object Label2: TLabel
            Left = 29
            Top = 10
            Width = 37
            Height = 13
            Caption = 'Titular'
          end
          object DBedtBeneficiario: TDBEdit
            Left = 30
            Top = 24
            Width = 163
            Height = 21
            TabStop = False
            Color = clBtnFace
            DataField = 'TITULAR'
            DataSource = dts
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
        end
        object DBedtDtFalecimento: TCMDateTimePicker
          Left = 398
          Top = 23
          Width = 97
          Height = 21
          TabStop = False
          AutoSize = False
          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
          CalendarAttributes.Font.Color = clWindowText
          CalendarAttributes.Font.Height = -11
          CalendarAttributes.Font.Name = 'MS Sans Serif'
          CalendarAttributes.Font.Style = []
          Color = clBtnFace
          ButtonStyle = cbsCustom
          DataField = 'DATAMORTE'
          DataSource = dts
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
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          ShowButton = True
          TabOrder = 15
        end
        object btnNUP: TBitBtn
          Left = 681
          Top = 21
          Width = 30
          Height = 25
          Default = True
          ModalResult = 1
          TabOrder = 21
          OnClick = btnNUPClick
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
        object dbedtNUP: TMaskEdit
          Left = 558
          Top = 23
          Width = 121
          Height = 21
          Color = clBtnFace
          Enabled = False
          EditMask = '99999.999999/9999;0;_'
          MaxLength = 17
          TabOrder = 22
        end
        object EdtDbTipoAmotizacao: TDBEdit
          Left = 778
          Top = 63
          Width = 115
          Height = 21
          DataField = 'SISTEMA_AMORTIZACAO'
          DataSource = dts
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 23
        end
      end
      object tbsIntegracao: TTabSheet
        Caption = 'Integração'
        ImageIndex = 1
        object grpCredito: TGroupBox
          Left = 16
          Top = 176
          Width = 313
          Height = 129
          Caption = ' Crédito '
          TabOrder = 0
          object lbFormPag: TLabel
            Left = 16
            Top = 43
            Width = 120
            Height = 13
            Caption = 'Forma de Pagamento'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label31: TLabel
            Left = 16
            Top = 83
            Width = 154
            Height = 13
            Caption = 'Conta-Caixa x Forma Pagto'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBedtFormaPag: TDBEdit
            Left = 16
            Top = 17
            Width = 281
            Height = 21
            TabStop = False
            Color = clBtnFace
            DataField = 'DESCFLGFORMAPAG'
            DataSource = dts
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
          object DBedtFormaPagamento: TDBEdit
            Left = 16
            Top = 57
            Width = 281
            Height = 21
            Color = clBtnFace
            DataField = 'DESCCODFORMAPAG'
            DataSource = dts
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
          object DBedtCCaixaxFPagto: TDBEdit
            Left = 16
            Top = 97
            Width = 281
            Height = 21
            Color = clBtnFace
            DataField = 'DESCPORTFORMAPAG'
            DataSource = dts
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
          end
        end
        object grpDebito: TGroupBox
          Left = 352
          Top = 176
          Width = 305
          Height = 129
          Caption = ' Débito '
          TabOrder = 1
          object Label30: TLabel
            Left = 16
            Top = 106
            Width = 195
            Height = 13
            Caption = 'Conta-Caixa x Forma Recebimento'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBedtFormaRec: TDBEdit
            Left = 16
            Top = 16
            Width = 273
            Height = 21
            TabStop = False
            Color = clBtnFace
            DataField = 'DESCFLGFORMAREC'
            DataSource = dts
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
          object DBedtFormaRecebimento: TDBEdit
            Left = 16
            Top = 96
            Width = 273
            Height = 21
            Color = clBtnFace
            DataField = 'DESCPORTFORMAREC'
            DataSource = dts
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
        end
        object GroupBox3: TGroupBox
          Left = 16
          Top = 8
          Width = 641
          Height = 89
          Caption = ' Conta Bancária para Crédito da Concessão '
          TabOrder = 2
          object Label7: TLabel
            Left = 16
            Top = 13
            Width = 37
            Height = 13
            Caption = 'Banco'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label9: TLabel
            Left = 304
            Top = 13
            Width = 47
            Height = 13
            Caption = 'Agência'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label10: TLabel
            Left = 504
            Top = 13
            Width = 86
            Height = 13
            Caption = 'Conta Corrente'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label93: TLabel
            Left = 16
            Top = 51
            Width = 64
            Height = 13
            Caption = 'Favorecido'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBedtBanco: TDBEdit
            Left = 16
            Top = 27
            Width = 273
            Height = 21
            TabStop = False
            Color = clBtnFace
            DataField = 'BANCO'
            DataSource = dts
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
          object DBedtAgencia: TDBEdit
            Left = 304
            Top = 27
            Width = 185
            Height = 21
            TabStop = False
            Color = clBtnFace
            DataField = 'NUMAGENCIA'
            DataSource = dts
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
          end
          object DBedtContaCorrente: TDBEdit
            Left = 504
            Top = 27
            Width = 121
            Height = 21
            TabStop = False
            Color = clBtnFace
            DataField = 'CONTACORRENTE'
            DataSource = dts
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 2
          end
          object dbEdtFavorecido: TDBEdit
            Left = 16
            Top = 65
            Width = 537
            Height = 21
            TabStop = False
            Color = clBtnFace
            DataField = 'FORNCREDITO'
            DataSource = dts
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 3
          end
        end
        object GroupBox4: TGroupBox
          Left = 16
          Top = 104
          Width = 641
          Height = 65
          Caption = ' Conta Bancária para Débito de Prestações e Devoluções '
          TabOrder = 3
          object Label64: TLabel
            Left = 16
            Top = 18
            Width = 37
            Height = 13
            Caption = 'Banco'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label65: TLabel
            Left = 304
            Top = 18
            Width = 47
            Height = 13
            Caption = 'Agência'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label66: TLabel
            Left = 504
            Top = 18
            Width = 86
            Height = 13
            Caption = 'Conta Corrente'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBEdit15: TDBEdit
            Left = 16
            Top = 32
            Width = 273
            Height = 21
            TabStop = False
            Color = clBtnFace
            DataField = 'BANCODEB'
            DataSource = dts
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
          object DBEdit16: TDBEdit
            Left = 304
            Top = 32
            Width = 185
            Height = 21
            TabStop = False
            Color = clBtnFace
            DataField = 'NUMAGENCIADEB'
            DataSource = dts
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
          end
          object DBEdit17: TDBEdit
            Left = 504
            Top = 32
            Width = 121
            Height = 21
            TabStop = False
            Color = clBtnFace
            DataField = 'CONTACORRENTEDEB'
            DataSource = dts
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 2
          end
        end
        object grpDebAutomatico: TGroupBox
          Left = 16
          Top = 313
          Width = 641
          Height = 128
          Caption = 'Histórico de Débito Automático'
          TabOrder = 4
          object grdDebAutomatico: TwwDBGrid
            Left = 2
            Top = 15
            Width = 637
            Height = 111
            Selected.Strings = (
              'CONVENIO'#9'25'#9'Convênio Bancário'
              'AGENCIA'#9'15'#9'Agência'
              'NU_CONTACORRENTE'#9'15'#9'Conta Corrente'
              'NOME'#9'15'#9'Nome Solicitante'
              'STATUS'#9'27'#9'Status'
              'DT_ARQUIVO_ELETRONICO_REM'#9'17'#9'Dt Arquivo Eletrônico .REM'
              'NO_ARQUIVO_ELETRONICO_REM'#9'30'#9'Nome Arquivo Eletrônico .REM')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsDebAutomatico
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgWordWrap]
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
        end
      end
      object tbsParcelas: TTabSheet
        Caption = 'Histórico'
        ImageIndex = 2
        object DBgrdHistMov: TwwDBGrid
          Left = 0
          Top = 0
          Width = 917
          Height = 339
          Selected.Strings = (
            'EVENTO'#9'9'#9'Evento'#9'F'
            'ITEDESCRICAO'#9'16'#9'Item'#9'F'
            'CONCAT_PARCELAS'#9'15'#9'Parcelas'#9'F'
            'HMESEQCOBRANCA'#9'3'#9'Seq'#9'F'
            'ANOMESCOMP'#9'7'#9'Comp.'#9'F'
            'ANOMESCOBR'#9'7'#9'Cobr.'#9'F'
            'HMEDATAPREVISTA'#9'9'#9'Data Prev'#9'F'
            'HMEDATAVENCTO'#9'9'#9'Data Venc'#9'F'
            'HMEVLRPREVISTO'#9'10'#9'Vlr.Prev.'#9'F'
            'TIPO_OPERACAO'#9'2'#9' '#9'F'
            'HMEDATAEFETIVA'#9'9'#9'Data Efet'#9'F'
            'HMEVLREFETIVO'#9'9'#9'Vlr.Efetivo'#9'F'
            'HMESALDODEV'#9'9'#9'Saldo Dev'#9'F'
            'ENVIADO'#9'3'#9'Envio'#9'F'
            'HMEDATAENVIO'#9'9'#9'Data Envio'#9'F'
            'HMEDATARECEB'#9'9'#9'Data Receb'#9'F'
            'HMETXJUROS'#9'3'#9'Taxa'#9'F'
            'TSEDESCRICAO'#9'35'#9'Tipo Suspensão'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          OnCellChanged = DBgrdHistMovCellChanged
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dtsHistMov
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          KeyOptions = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          TitleAlignment = taCenter
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Arial'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          UseTFields = False
          OnCalcCellColors = DBgrdHistMovCalcCellColors
          IndicatorColor = icBlack
          OnTopRowChanged = DBgrdHistMovTopRowChanged
        end
        object plnFiltro: TPanel
          Left = 0
          Top = 339
          Width = 917
          Height = 168
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 1
          object Label36: TLabel
            Left = 504
            Top = 94
            Width = 8
            Height = 13
            Caption = 'a'
          end
          object Bevel1: TBevel
            Left = 0
            Top = 86
            Width = 737
            Height = 2
            Shape = bsBottomLine
          end
          object Label73: TLabel
            Left = 368
            Top = 118
            Width = 8
            Height = 13
            Caption = 'a'
          end
          object rdgOrdena: TRadioGroup
            Left = 0
            Top = 135
            Width = 737
            Height = 33
            Caption = ' Ordenar: '
            Columns = 5
            ItemIndex = 2
            Items.Strings = (
              'por Cobrança'
              'por Competência'
              'por Parcela'
              'por Data Saldo Dev.'
              'por Data Prevista')
            TabOrder = 19
            OnClick = rdgOrdenaClick
          end
          object rdgFiltroEmAberto: TRadioGroup
            Left = -1
            Top = 29
            Width = 842
            Height = 31
            Columns = 5
            ItemIndex = 0
            Items.Strings = (
              'Exibir em aberto'
              'Não exibir em aberto'
              'Exibir apenas em aberto')
            TabOrder = 3
            OnClick = rdgEstornoClick
          end
          object chkFiltroEvento: TCheckBox
            Left = 8
            Top = 65
            Width = 121
            Height = 17
            Caption = 'Filtrar por Evento:   '
            TabOrder = 5
            OnClick = chkFaixaDatasClick
          end
          object chkFiltroItem: TCheckBox
            Left = 416
            Top = 65
            Width = 113
            Height = 17
            Caption = 'Filtrar por Item:   '
            TabOrder = 7
            OnClick = chkFaixaDatasClick
          end
          object rdgEstorno: TRadioGroup
            Left = -1
            Top = 10
            Width = 842
            Height = 31
            Columns = 5
            ItemIndex = 1
            Items.Strings = (
              'Exibir estornados'
              'Não exibir estornados'
              'Exibir apenas estornados')
            TabOrder = 2
            OnClick = rdgEstornoClick
          end
          object chkFiltroCobranca: TCheckBox
            Left = 8
            Top = 92
            Width = 273
            Height = 17
            Caption = 'Filtrar movimentação por mês de Cobrança: '
            TabOrder = 9
            OnClick = chkFaixaDatasClick
          end
          object cboMesCobIni: TComboBox
            Left = 280
            Top = 90
            Width = 145
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 10
            OnEnter = cboMesCobIniEnter
            OnExit = cboMesCobIniExit
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
          object DBspnAnoCobIni: TwwDBSpinEdit
            Left = 424
            Top = 90
            Width = 65
            Height = 21
            Increment = 1
            TabOrder = 11
            UnboundDataType = wwDefault
            OnExit = DBspnAnoCobIniExit
          end
          object cboMesCobFim: TComboBox
            Left = 528
            Top = 90
            Width = 145
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 12
            OnEnter = cboMesCobFimEnter
            OnExit = cboMesCobFimExit
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
          object DBspnAnoCobFim: TwwDBSpinEdit
            Left = 672
            Top = 90
            Width = 65
            Height = 21
            Increment = 1
            TabOrder = 13
            UnboundDataType = wwDefault
            OnExit = DBspnAnoCobFimExit
          end
          object DBcboItem: TwwDBLookupCombo
            Left = 528
            Top = 63
            Width = 209
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'ITEDESCRICAO'#9'40'#9'Descrição'#9'F')
            LookupTable = dtmLookEmptmo.qryLookItemEmprestimo
            LookupField = 'IDITEMEMPTMO'
            Style = csDropDownList
            Color = clWhite
            TabOrder = 8
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = False
            OnCloseUp = DBcboItemCloseUp
          end
          object rdgExibe: TRadioGroup
            Left = -1
            Top = -8
            Width = 842
            Height = 30
            Columns = 5
            ItemIndex = 1
            Items.Strings = (
              'Exibir todos os itens'
              'Exibir itens de envio')
            TabOrder = 0
            OnClick = rdgExibeClick
          end
          object cboEvento: TComboBox
            Left = 136
            Top = 63
            Width = 209
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 6
            OnChange = cboEventoChange
            Items.Strings = (
              'Concessão / Renovação'
              'Prestação'
              'Amortização / Refinanciamento'
              'Quitação'
              'Encargos'
              'Atualização Diária'
              'CARGA'
              'Ajustes (a Pagar / Receber)'
              'Ajustes de Saldo')
          end
          object fcShapeBtn2: TfcShapeBtn
            Left = 744
            Top = 147
            Width = 20
            Height = 20
            Hint = 'Aumenta / Diminui painel do Histórico'
            Color = clBtnFace
            DitherColor = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              8888888888FFFFF8888888888000008888888888F777778FF888888006666600
              88888887788888778F88887666666666088888788888F88878F887E6666F6666
              608887F888878F8887F887E666FFF66660888788887778F8878F7E666FFFFF66
              66087F888777778F887F7E66FFFFFFF666087F8877777778887F7E6666666666
              66087F888FFFFFFF887F7E66FFFFFFF666087F8877777778887F7E666FFFFF66
              660878F887777788887887E666FFF666608887F88877788887F887E6666F6666
              6088878F888788888788887EE666666608888878FF88888F788888877EEEEE77
              8888888778FFFF77888888888777778888888888877777888888}
            NumGlyphs = 2
            ParentClipping = True
            ParentFont = False
            RoundRectBias = 25
            ShadeStyle = fbsFlat
            TabOrder = 20
            TextOptions.Alignment = taCenter
            TextOptions.VAlignment = vaVCenter
            OnClick = fcShapeBtn1Click
          end
          object Panel4: TPanel
            Left = 517
            Top = 39
            Width = 383
            Height = 21
            BevelOuter = bvLowered
            TabOrder = 4
            object chkAtuDia: TCheckBox
              Left = 40
              Top = 4
              Width = 161
              Height = 15
              Caption = 'Exibir Atualização Diária'
              Checked = True
              State = cbChecked
              TabOrder = 0
              OnClick = chkFaixaDatasClick
            end
          end
          object Panel3: TPanel
            Left = 517
            Top = 21
            Width = 383
            Height = 20
            BevelOuter = bvLowered
            Enabled = False
            TabOrder = 21
          end
          object Panel1: TPanel
            Left = 384
            Top = -1
            Width = 383
            Height = 23
            BevelOuter = bvLowered
            Enabled = False
            TabOrder = 1
            object Label56: TLabel
              Left = 31
              Top = 4
              Width = 139
              Height = 13
              Caption = 'Valor Total em aberto:   '
            end
            object Label55: TLabel
              Left = 234
              Top = 4
              Width = 15
              Height = 13
              Caption = ' / '
            end
            object Label57: TLabel
              Left = 286
              Top = 4
              Width = 46
              Height = 13
              Caption = 'Item(ns)'
            end
            object DBEdit9: TDBEdit
              Left = 160
              Top = 1
              Width = 75
              Height = 21
              Color = 12648447
              DataField = 'VALOR_TOTAL_ABERTO'
              DataSource = dtsTotalizaAberto
              TabOrder = 0
            end
            object DBEdit8: TDBEdit
              Left = 248
              Top = 1
              Width = 33
              Height = 21
              Color = 12648447
              DataField = 'QUANT_ABERTO'
              DataSource = dtsTotalizaAberto
              TabOrder = 1
            end
          end
          object chkFaixaDatas: TCheckBox
            Left = 8
            Top = 116
            Width = 249
            Height = 17
            Caption = 'Filtrar movimentação por Data Prevista: '
            TabOrder = 14
            OnClick = chkFaixaDatasClick
          end
          object edtDataIni: TCMDateTimePicker
            Left = 256
            Top = 115
            Width = 105
            Height = 21
            TabStop = False
            AutoSize = False
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
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ShowButton = True
            TabOrder = 15
            OnCloseUp = edtDataIniExit
            OnExit = edtDataIniExit
          end
          object edtDataFim: TCMDateTimePicker
            Left = 384
            Top = 115
            Width = 105
            Height = 21
            TabStop = False
            AutoSize = False
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
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ShowButton = True
            TabOrder = 16
            OnCloseUp = edtDataIniExit
            OnExit = edtDataIniExit
          end
          object chkParcela: TCheckBox
            Left = 518
            Top = 117
            Width = 161
            Height = 17
            Caption = 'Filtrar por nº da Parcela:  '
            TabOrder = 17
            OnClick = chkFaixaDatasClick
          end
          object spnParcela: TwwDBSpinEdit
            Left = 680
            Top = 114
            Width = 57
            Height = 21
            Increment = 1
            TabOrder = 18
            UnboundDataType = wwDefault
            OnExit = DBspnAnoCobFimExit
          end
        end
      end
      object tbsDetalheParcela: TTabSheet
        Caption = 'Detalhes'
        ImageIndex = 3
        object pgcDetalhe: TPageControl
          Left = 0
          Top = 0
          Width = 917
          Height = 507
          ActivePage = tbsLogTotalPrevHist
          Align = alClient
          TabHeight = 20
          TabOrder = 0
          OnChange = pgcDetalheChange
          object TabSheet1: TTabSheet
            Caption = 'Geral'
            object Label15: TLabel
              Left = 128
              Top = 194
              Width = 78
              Height = 13
              Caption = 'Data Prevista'
            end
            object Label24: TLabel
              Left = 16
              Top = 10
              Width = 111
              Height = 13
              Caption = 'Item de Empréstimo'
              FocusControl = DBedtItem
            end
            object Label37: TLabel
              Left = 352
              Top = 194
              Width = 72
              Height = 13
              Caption = 'Data Efetiva'
            end
            object Label45: TLabel
              Left = 240
              Top = 194
              Width = 76
              Height = 13
              Caption = 'Data Vencto.'
            end
            object Label20: TLabel
              Left = 16
              Top = 194
              Width = 28
              Height = 13
              Caption = 'Data'
            end
            object Label59: TLabel
              Left = 240
              Top = 50
              Width = 40
              Height = 13
              Caption = 'Origem'
              FocusControl = DBEdit11
            end
            object Label60: TLabel
              Left = 16
              Top = 114
              Width = 137
              Height = 13
              Caption = 'Usuário / Data Inclusão'
            end
            object Label61: TLabel
              Left = 368
              Top = 114
              Width = 40
              Height = 13
              Caption = 'Versão'
            end
            object Bevel3: TBevel
              Left = 16
              Top = 180
              Width = 433
              Height = 2
              Shape = bsTopLine
            end
            object Bevel4: TBevel
              Left = 16
              Top = 100
              Width = 433
              Height = 2
              Shape = bsTopLine
            end
            object Label62: TLabel
              Left = 16
              Top = 50
              Width = 41
              Height = 13
              Caption = 'Evento'
              FocusControl = DBedtEvento
            end
            object label100: TLabel
              Left = 16
              Top = 234
              Width = 74
              Height = 13
              Caption = 'Competência'
              FocusControl = DBedtCompetencia
            end
            object Label28: TLabel
              Left = 112
              Top = 234
              Width = 55
              Height = 13
              Caption = 'Cobrança'
              FocusControl = DBedtCobranca
            end
            object Label11: TLabel
              Left = 224
              Top = 234
              Width = 80
              Height = 13
              Caption = 'Valor Previsto'
              FocusControl = DBedtValorPrevisto
            end
            object Label26: TLabel
              Left = 344
              Top = 234
              Width = 74
              Height = 13
              Caption = 'Valor Efetivo'
              FocusControl = DBedtValorEfetivo
            end
            object DBedtEvento: TDBEdit
              Left = 16
              Top = 64
              Width = 209
              Height = 21
              TabStop = False
              Color = clBtnFace
              DataField = 'EVENTO'
              DataSource = dtsHistMov
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 2
            end
            object DBedtItem: TDBEdit
              Left = 72
              Top = 24
              Width = 377
              Height = 21
              TabStop = False
              Color = clBtnFace
              DataField = 'ITEDESCRICAO'
              DataSource = dtsHistMov
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
            end
            object DBedtDataPrevisao: TCMDateTimePicker
              Left = 128
              Top = 208
              Width = 97
              Height = 21
              TabStop = False
              AutoSize = False
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              Color = clBtnFace
              ButtonStyle = cbsCustom
              DataField = 'HMEDATAPREVISTA'
              DataSource = dtsHistMov
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
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ShowButton = True
              TabOrder = 9
            end
            object DBedtDataEfetiva: TCMDateTimePicker
              Left = 352
              Top = 208
              Width = 97
              Height = 21
              TabStop = False
              AutoSize = False
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              Color = clBtnFace
              ButtonStyle = cbsCustom
              DataField = 'HMEDATAEFETIVAORIG'
              DataSource = dtsHistMov
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
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ShowButton = True
              TabOrder = 11
            end
            object CMDateTimePicker1: TCMDateTimePicker
              Left = 240
              Top = 208
              Width = 97
              Height = 21
              TabStop = False
              AutoSize = False
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              Color = clBtnFace
              ButtonStyle = cbsCustom
              DataField = 'HMEDATAVENCTO'
              DataSource = dtsHistMov
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
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ShowButton = True
              TabOrder = 10
            end
            object DBEdit1: TDBEdit
              Left = 16
              Top = 24
              Width = 57
              Height = 21
              TabStop = False
              Color = clBtnFace
              DataField = 'IDITEMEMPTMO'
              DataSource = dtsHistMov
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object CMDateTimePicker6: TCMDateTimePicker
              Left = 16
              Top = 208
              Width = 97
              Height = 21
              TabStop = False
              AutoSize = False
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              Color = clBtnFace
              ButtonStyle = cbsCustom
              DataField = 'HMEDATA'
              DataSource = dtsHistMov
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
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ShowButton = True
              TabOrder = 8
            end
            object DBEdit11: TDBEdit
              Left = 240
              Top = 64
              Width = 209
              Height = 21
              TabStop = False
              Color = clBtnFace
              DataField = 'ORIGEM'
              DataSource = dtsHistMov
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 3
            end
            object CMDateTimePicker7: TCMDateTimePicker
              Left = 208
              Top = 128
              Width = 145
              Height = 21
              TabStop = False
              AutoSize = False
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              Color = clBtnFace
              ButtonStyle = cbsCustom
              DataField = 'TRGDTINCLUSAO'
              DataSource = dtsHistMov
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
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ShowButton = True
              TabOrder = 5
            end
            object DBEdit12: TDBEdit
              Left = 16
              Top = 128
              Width = 193
              Height = 21
              TabStop = False
              Color = clBtnFace
              DataField = 'NOMEUSUARIO'
              DataSource = dtsHistMov
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 4
            end
            object DBEdit13: TDBEdit
              Left = 368
              Top = 128
              Width = 81
              Height = 21
              TabStop = False
              Color = clBtnFace
              DataField = 'VERSAO'
              DataSource = dtsHistMov
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 6
            end
            object DBedtCompetencia: TDBEdit
              Left = 16
              Top = 248
              Width = 81
              Height = 21
              TabStop = False
              Color = clBtnFace
              DataField = 'ANOMESCOMP'
              DataSource = dtsHistMov
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 12
            end
            object DBedtCobranca: TDBEdit
              Left = 112
              Top = 248
              Width = 81
              Height = 21
              TabStop = False
              Color = clBtnFace
              DataField = 'ANOMESCOBR'
              DataSource = dtsHistMov
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 13
            end
            object DBedtValorPrevisto: TDBEdit
              Left = 224
              Top = 248
              Width = 105
              Height = 21
              TabStop = False
              Color = clBtnFace
              DataField = 'HMEVLRPREVISTO'
              DataSource = dtsHistMov
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 14
            end
            object DBedtValorEfetivo: TDBEdit
              Left = 344
              Top = 248
              Width = 105
              Height = 21
              TabStop = False
              Color = clBtnFace
              DataField = 'HMEVLREFETIVOORIG'
              DataSource = dtsHistMov
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 15
            end
            object GroupBox2: TGroupBox
              Left = 472
              Top = 157
              Width = 265
              Height = 112
              TabOrder = 21
              object Label19: TLabel
                Left = 79
                Top = 20
                Width = 69
                Height = 13
                Caption = 'Tx. Juros:   '
                FocusControl = DBedtTxJuros
              end
              object Label16: TLabel
                Left = 47
                Top = 52
                Width = 101
                Height = 13
                Caption = 'Saldo Devedor:   '
                FocusControl = DBedtSaldoDev
              end
              object Label25: TLabel
                Left = 16
                Top = 84
                Width = 132
                Height = 13
                Caption = 'Data de Atualização:   '
              end
              object DBText1: TDBText
                Left = 205
                Top = 20
                Width = 53
                Height = 15
                DataField = 'TCELEGENDACALC'
                DataSource = dts
              end
              object DBedtTxJuros: TDBEdit
                Left = 144
                Top = 16
                Width = 57
                Height = 21
                TabStop = False
                Color = clBtnFace
                DataField = 'HMETXJUROS'
                DataSource = dtsHistMov
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 0
              end
              object DBedtSaldoDev: TDBEdit
                Left = 144
                Top = 48
                Width = 105
                Height = 21
                TabStop = False
                Color = clBtnFace
                DataField = 'HMESALDODEV'
                DataSource = dtsHistMov
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
              end
              object DBedtDataUltAtualiza: TCMDateTimePicker
                Left = 144
                Top = 80
                Width = 105
                Height = 21
                TabStop = False
                AutoSize = False
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                Color = clBtnFace
                ButtonStyle = cbsCustom
                DataField = 'HMEDATAATUALIZA'
                DataSource = dtsHistMov
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
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ShowButton = True
                TabOrder = 2
              end
            end
            object DBCheckBox8: TDBCheckBox
              Left = 24
              Top = 152
              Width = 113
              Height = 17
              TabStop = False
              Caption = 'Entrada Manual'
              DataField = 'FLGENTRADAMANUAL'
              DataSource = dtsHistMov
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 7
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBCheckBox9: TDBCheckBox
              Left = 656
              Top = 112
              Width = 81
              Height = 17
              TabStop = False
              Caption = 'Centraliza'
              DataField = 'HMECENTRALIZA'
              DataSource = dtsHistMov
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGreen
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 19
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBCheckBox10: TDBCheckBox
              Left = 656
              Top = 128
              Width = 81
              Height = 17
              TabStop = False
              Caption = 'Destacado'
              DataField = 'HMEDESTACADO'
              DataSource = dtsHistMov
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGreen
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 20
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBCheckBox13: TDBCheckBox
              Left = 472
              Top = 96
              Width = 81
              Height = 17
              TabStop = False
              Caption = 'Enviado'
              DataField = 'FLGENVIO'
              DataSource = dtsHistMov
              TabOrder = 16
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBCheckBox14: TDBCheckBox
              Left = 472
              Top = 128
              Width = 81
              Height = 17
              TabStop = False
              Caption = 'Suspenso'
              DataField = 'FLGSUSPENSAO'
              DataSource = dtsHistMov
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 18
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBCheckBox15: TDBCheckBox
              Left = 472
              Top = 112
              Width = 81
              Height = 17
              TabStop = False
              Caption = 'Baixado'
              DataField = 'FLGBAIXADO'
              DataSource = dtsHistMov
              TabOrder = 17
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBCheckBox16: TDBCheckBox
              Left = 564
              Top = 96
              Width = 81
              Height = 17
              TabStop = False
              Caption = 'Estornado'
              DataField = 'FLGESTORNADO'
              DataSource = dtsHistMov
              TabOrder = 22
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBCheckBox17: TDBCheckBox
              Left = 564
              Top = 112
              Width = 81
              Height = 17
              TabStop = False
              Caption = 'Abonado'
              DataField = 'FLGABONADO'
              DataSource = dtsHistMov
              TabOrder = 23
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBCheckBox18: TDBCheckBox
              Left = 564
              Top = 128
              Width = 81
              Height = 17
              TabStop = False
              Caption = 'Quitado'
              DataField = 'FLGQUITADO'
              DataSource = dtsHistMov
              TabOrder = 24
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object GroupBox7: TGroupBox
              Left = 472
              Top = 8
              Width = 265
              Height = 73
              TabOrder = 25
              object Label22: TLabel
                Left = 72
                Top = 42
                Width = 127
                Height = 13
                Caption = 'Parcelas Restantes:   '
                FocusControl = DBedtEvento
              end
              object Label23: TLabel
                Left = 139
                Top = 18
                Width = 60
                Height = 13
                Caption = 'Parcela:   '
                FocusControl = DBedtParcela
              end
              object DBedtParcela: TDBEdit
                Left = 192
                Top = 16
                Width = 57
                Height = 21
                TabStop = False
                Color = clBtnFace
                DataField = 'HMEPARCELA'
                DataSource = dtsHistMov
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
              end
              object DBEdit14: TDBEdit
                Left = 192
                Top = 40
                Width = 57
                Height = 21
                TabStop = False
                Color = clBtnFace
                DataField = 'HMENUMPARCELAS'
                DataSource = dtsHistMov
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
              end
            end
          end
          object TabSheet3: TTabSheet
            Caption = 'Status'
            ImageIndex = 2
            object Label63: TLabel
              Left = 264
              Top = 106
              Width = 73
              Height = 13
              Caption = 'Data Receb.'
            end
            object Label46: TLabel
              Left = 488
              Top = 127
              Width = 101
              Height = 13
              Caption = 'Data Quit./Abono'
            end
            object Bevel2: TBevel
              Left = 16
              Top = 96
              Width = 345
              Height = 3
              Shape = bsTopLine
            end
            object Bevel5: TBevel
              Left = 16
              Top = 152
              Width = 345
              Height = 3
              Shape = bsTopLine
            end
            object Bevel7: TBevel
              Left = 380
              Top = 8
              Width = 2
              Height = 273
              Shape = bsLeftLine
            end
            object Label67: TLabel
              Left = 120
              Top = 160
              Width = 116
              Height = 13
              Caption = 'Tipo de Divergência'
            end
            object Label68: TLabel
              Left = 24
              Top = 234
              Width = 96
              Height = 13
              Caption = 'Data Tratamento'
            end
            object Label69: TLabel
              Left = 144
              Top = 234
              Width = 146
              Height = 13
              Caption = 'Tipo de Tratamento Dado'
            end
            object Bevel6: TBevel
              Left = 400
              Top = 56
              Width = 345
              Height = 3
              Shape = bsTopLine
            end
            object Bevel8: TBevel
              Left = 400
              Top = 184
              Width = 345
              Height = 3
              Shape = bsTopLine
            end
            object Bevel9: TBevel
              Left = 16
              Top = 200
              Width = 345
              Height = 3
              Shape = bsTopLine
            end
            object Label70: TLabel
              Left = 525
              Top = 252
              Width = 37
              Height = 13
              Alignment = taRightJustify
              Caption = 'Chave'
            end
            object Label72: TLabel
              Left = 152
              Top = 106
              Width = 72
              Height = 13
              Caption = 'Data Efetiva'
            end
            object Label76: TLabel
              Left = 600
              Top = 128
              Width = 141
              Height = 13
              Caption = 'Usuário Quit/Abono/Est.'
            end
            object Label79: TLabel
              Left = 120
              Top = 68
              Width = 123
              Height = 13
              Caption = 'Data do último Envio:'
              FocusControl = DBedtCodDocumento
            end
            object Bevel10: TBevel
              Left = 16
              Top = 48
              Width = 345
              Height = 3
              Shape = bsTopLine
            end
            object Label87: TLabel
              Left = 120
              Top = 20
              Width = 66
              Height = 13
              Caption = 'Tipo Susp.:'
              FocusControl = DBedtCodDocumento
            end
            object Label75: TLabel
              Left = 400
              Top = 10
              Width = 62
              Height = 13
              Caption = 'Valor Base'
              FocusControl = DBEdit38
            end
            object Label90: TLabel
              Left = 592
              Top = 88
              Width = 11
              Height = 13
              Caption = '/ '
            end
            object Label91: TLabel
              Left = 488
              Top = 72
              Width = 92
              Height = 13
              Caption = 'Data p/ Estorno'
            end
            object Label92: TLabel
              Left = 608
              Top = 72
              Width = 93
              Height = 13
              Caption = 'Data do Estorno'
            end
            object CMDateTimePicker8: TCMDateTimePicker
              Left = 264
              Top = 120
              Width = 97
              Height = 21
              TabStop = False
              AutoSize = False
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              Color = clBtnFace
              ButtonStyle = cbsCustom
              DataField = 'HMEDATARECEB'
              DataSource = dtsHistMov
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
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ShowButton = True
              TabOrder = 5
            end
            object DBchkEnvio: TDBCheckBox
              Left = 24
              Top = 66
              Width = 89
              Height = 17
              TabStop = False
              Caption = 'Enviado'
              DataField = 'FLGENVIO'
              DataSource = dtsHistMov
              TabOrder = 0
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBchkBaixado: TDBCheckBox
              Left = 24
              Top = 104
              Width = 73
              Height = 17
              TabStop = False
              Caption = 'Baixado'
              DataField = 'FLGBAIXADO'
              DataSource = dtsHistMov
              TabOrder = 2
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBCheckBox3: TDBCheckBox
              Left = 24
              Top = 128
              Width = 97
              Height = 17
              TabStop = False
              Caption = 'Baixa Manual'
              DataField = 'FLGBAIXAMANUAL'
              DataSource = dtsHistMov
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 3
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBCheckBox4: TDBCheckBox
              Left = 24
              Top = 176
              Width = 89
              Height = 17
              TabStop = False
              Caption = 'Divergente:'
              DataField = 'FLGDIVERGPEND'
              DataSource = dtsHistMov
              TabOrder = 6
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBcboTipoDiverg: TwwDBComboBox
              Left = 120
              Top = 174
              Width = 241
              Height = 21
              ShowButton = False
              Style = csDropDown
              MapList = True
              AllowClearKey = False
              DataField = 'FLGTIPODIVERG'
              DataSource = dtsHistMov
              DropDownCount = 8
              ItemHeight = 0
              Items.Strings = (
                'Valores ainda não recebidos'#9'1'
                'Recebimentos Inesperados'#9'2'
                'Valores recebidos a menor'#9'3'
                'Valores recebidos a maior'#9'4'
                'Divergência de datas'#9'5'
                'Valores não recebidos'#9'6')
              Sorted = False
              TabOrder = 7
              UnboundDataType = wwDefault
            end
            object DBCheckBox6: TDBCheckBox
              Left = 24
              Top = 210
              Width = 161
              Height = 17
              TabStop = False
              Caption = 'Divergência Tratada'
              DataField = 'FLGDIVERGTRAT'
              DataSource = dtsHistMov
              TabOrder = 8
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBchkEstornado: TDBCheckBox
              Left = 400
              Top = 88
              Width = 89
              Height = 17
              TabStop = False
              Caption = 'Estornado'
              DataField = 'FLGESTORNADO'
              DataSource = dtsHistMov
              TabOrder = 12
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object CMDateTimePicker5: TCMDateTimePicker
              Left = 488
              Top = 86
              Width = 97
              Height = 21
              TabStop = False
              AutoSize = False
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              Color = clBtnFace
              ButtonStyle = cbsCustom
              DataField = 'HMEDATAESTORNO'
              DataSource = dtsHistMov
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
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ShowButton = True
              TabOrder = 13
            end
            object DBCheckBox1: TDBCheckBox
              Left = 400
              Top = 128
              Width = 89
              Height = 17
              TabStop = False
              Caption = 'Abonado'
              DataField = 'FLGABONADO'
              DataSource = dtsHistMov
              TabOrder = 14
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBCheckBox2: TDBCheckBox
              Left = 400
              Top = 152
              Width = 89
              Height = 17
              TabStop = False
              Caption = 'Quitado'
              DataField = 'FLGQUITADO'
              DataSource = dtsHistMov
              TabOrder = 15
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBCheckBox5: TDBCheckBox
              Left = 24
              Top = 18
              Width = 81
              Height = 17
              TabStop = False
              Caption = 'Suspenso'
              DataField = 'FLGSUSPENSAO'
              DataSource = dtsHistMov
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 1
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBCheckBox7: TDBCheckBox
              Left = 624
              Top = 32
              Width = 113
              Height = 17
              TabStop = False
              Caption = 'Entrada Manual'
              DataField = 'FLGENTRADAMANUAL'
              DataSource = dtsHistMov
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 11
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object CMDateTimePicker9: TCMDateTimePicker
              Left = 24
              Top = 248
              Width = 97
              Height = 21
              TabStop = False
              AutoSize = False
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              Color = clBtnFace
              ButtonStyle = cbsCustom
              DataField = 'HMEDATADIVERGTRAT'
              DataSource = dtsHistMov
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
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ShowButton = True
              TabOrder = 9
            end
            object wwDBComboBox1: TwwDBComboBox
              Left = 144
              Top = 248
              Width = 217
              Height = 21
              ShowButton = False
              Style = csDropDown
              MapList = True
              AllowClearKey = False
              DataField = 'FLGTIPODIVERGTRAT'
              DataSource = dtsHistMov
              DropDownCount = 8
              ItemHeight = 0
              Items.Strings = (
                'Cálculo de Encargos'#9'0'
                'Ignorar (datas)'#9'1'
                'Apenas atualização vencimento'#9'2')
              Sorted = False
              TabOrder = 10
              UnboundDataType = wwDefault
            end
            object DBCheckBox11: TDBCheckBox
              Left = 664
              Top = 200
              Width = 81
              Height = 17
              TabStop = False
              Caption = 'Centraliza'
              DataField = 'HMECENTRALIZA'
              DataSource = dtsHistMov
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGreen
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 16
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBCheckBox12: TDBCheckBox
              Left = 664
              Top = 216
              Width = 81
              Height = 17
              TabStop = False
              Caption = 'Destacado'
              DataField = 'HMEDESTACADO'
              DataSource = dtsHistMov
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGreen
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 17
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBEdit18: TDBEdit
              Left = 568
              Top = 248
              Width = 177
              Height = 21
              TabStop = False
              Color = clBtnFace
              DataField = 'IDHISTMOVEMPTMO'
              DataSource = dtsHistMov
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 18
            end
            object CMDateTimePicker10: TCMDateTimePicker
              Left = 152
              Top = 120
              Width = 97
              Height = 21
              TabStop = False
              AutoSize = False
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              Color = clBtnFace
              ButtonStyle = cbsCustom
              DataField = 'HMEDATAEFETIVAORIG'
              DataSource = dtsHistMov
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
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ShowButton = True
              TabOrder = 4
            end
            object DBEdit20: TDBEdit
              Left = 600
              Top = 142
              Width = 145
              Height = 21
              TabStop = False
              Color = clBtnFace
              DataField = 'USU_ESTORNO'
              DataSource = dtsHistMov
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 19
            end
            object DBEdit23: TDBEdit
              Left = 248
              Top = 64
              Width = 113
              Height = 21
              Color = clBtnFace
              DataField = 'HMEDATAENVIO'
              DataSource = dtsHistMov
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 20
            end
            object rdgRecPag: TDBRadioGroup
              Left = 400
              Top = 196
              Width = 193
              Height = 37
              Columns = 2
              DataField = 'HMERECPAG'
              DataSource = dtsHistMov
              Items.Strings = (
                'a Pagar'
                'a Receber')
              ReadOnly = True
              TabOrder = 21
              Values.Strings = (
                'P'
                'R')
            end
            object DBEdit34: TDBEdit
              Left = 192
              Top = 16
              Width = 169
              Height = 21
              Color = clBtnFace
              DataField = 'TSEDESCRICAO'
              DataSource = dtsHistMov
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 22
            end
            object DBEdit38: TDBEdit
              Left = 400
              Top = 24
              Width = 105
              Height = 21
              TabStop = False
              Color = clBtnFace
              DataField = 'HMEVLRBASE'
              DataSource = dtsHistMov
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 23
            end
            object CMDateTimePicker11: TCMDateTimePicker
              Left = 608
              Top = 86
              Width = 97
              Height = 21
              TabStop = False
              AutoSize = False
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              Color = clBtnFace
              ButtonStyle = cbsCustom
              DataField = 'HMEDATAESTORNOALT'
              DataSource = dtsHistMov
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
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ShowButton = True
              TabOrder = 24
            end
            object CMDateTimePicker2: TCMDateTimePicker
              Left = 488
              Top = 142
              Width = 97
              Height = 21
              TabStop = False
              AutoSize = False
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              Color = clBtnFace
              ButtonStyle = cbsCustom
              DataField = 'HMEDATAQUITABONO'
              DataSource = dtsHistMov
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
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ShowButton = True
              TabOrder = 25
            end
          end
          object TabSheet2: TTabSheet
            Caption = 'Integração'
            ImageIndex = 1
            object GroupBox6: TGroupBox
              Left = 424
              Top = 8
              Width = 321
              Height = 209
              Caption = ' Contabilidade '
              TabOrder = 1
              object Label32: TLabel
                Left = 16
                Top = 18
                Width = 136
                Height = 13
                Caption = 'Planilha de Apropriação'
                FocusControl = DBedtPlanilha
              end
              object Label33: TLabel
                Left = 16
                Top = 154
                Width = 111
                Height = 13
                Caption = 'Planilha de Estorno'
                FocusControl = DBedtPlanilhaEstorno
              end
              object Label84: TLabel
                Left = 16
                Top = 106
                Width = 146
                Height = 13
                Caption = 'Conta Contábil de Crédito'
                FocusControl = DBedtPlanilhaEstorno
              end
              object Label85: TLabel
                Left = 16
                Top = 66
                Width = 143
                Height = 13
                Caption = 'Conta Contábil de Débito'
                FocusControl = DBedtPlanilhaEstorno
              end
              object DBedtPlanilha: TDBEdit
                Left = 16
                Top = 32
                Width = 169
                Height = 21
                TabStop = False
                Color = clBtnFace
                DataField = 'PLNCODIGO'
                DataSource = dtsHistMov
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
              end
              object DBedtPlanil: TDBEdit
                Left = 184
                Top = 32
                Width = 121
                Height = 21
                TabStop = False
                Color = clBtnFace
                DataField = 'PLNPLANIL'
                DataSource = dtsHistMov
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
              end
              object DBedtPlanilhaEstorno: TDBEdit
                Left = 16
                Top = 168
                Width = 169
                Height = 21
                TabStop = False
                Color = clBtnFace
                DataField = 'PLNCODIGOESTORNO'
                DataSource = dtsHistMov
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 4
              end
              object DBedtPlanilEstorno: TDBEdit
                Left = 184
                Top = 168
                Width = 121
                Height = 21
                TabStop = False
                Color = clBtnFace
                DataField = 'PLANIL_ESTORNO'
                DataSource = dtsHistMov
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 5
              end
              object DBEdit31: TDBEdit
                Left = 16
                Top = 80
                Width = 169
                Height = 21
                TabStop = False
                Color = clBtnFace
                DataField = 'CCDEBFINAN'
                DataSource = dtsHistMov
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 2
              end
              object DBEdit32: TDBEdit
                Left = 16
                Top = 120
                Width = 169
                Height = 21
                TabStop = False
                Color = clBtnFace
                DataField = 'CCCREDFINAN'
                DataSource = dtsHistMov
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 3
              end
            end
            object GroupBox5: TGroupBox
              Left = 8
              Top = 8
              Width = 401
              Height = 209
              Caption = ' Envio '
              TabOrder = 0
              object Label35: TLabel
                Left = 16
                Top = 162
                Width = 122
                Height = 13
                Caption = 'Documento CaP/CaR'
                FocusControl = DBedtCodDocumento
              end
              object Label40: TLabel
                Left = 16
                Top = 18
                Width = 98
                Height = 13
                Caption = 'Destino do Envio'
                FocusControl = DBedtDestinoEnvio
              end
              object Label52: TLabel
                Left = 16
                Top = 66
                Width = 148
                Height = 13
                Caption = 'Rubrica p/ Folha (interna)'
                FocusControl = DBedtDestinoEnvio
              end
              object Label74: TLabel
                Left = 240
                Top = 66
                Width = 119
                Height = 13
                Caption = 'Data do último Envio'
                FocusControl = DBedtCodDocumento
              end
              object Label77: TLabel
                Left = 16
                Top = 114
                Width = 80
                Height = 13
                Caption = 'Chave (Folha)'
                FocusControl = DBedtDestinoEnvio
              end
              object DBText3: TDBText
                Left = 168
                Top = 131
                Width = 50
                Height = 13
                AutoSize = True
                DataField = 'SITENVIO'
                DataSource = dtsHistMov
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlue
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object DBText4: TDBText
                Left = 240
                Top = 179
                Width = 50
                Height = 13
                AutoSize = True
                DataField = 'STATUS_DOC'
                DataSource = dtsHistMov
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlue
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object DBedtCodDocumento: TDBEdit
                Left = 16
                Top = 176
                Width = 89
                Height = 21
                TabStop = False
                Color = clBtnFace
                DataField = 'CODDOCUMENTO'
                DataSource = dtsHistMov
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 5
              end
              object DBedtDestinoEnvio: TDBEdit
                Left = 16
                Top = 32
                Width = 129
                Height = 21
                Color = clBtnFace
                DataField = 'FORMACOBRANCA'
                DataSource = dtsHistMov
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
              end
              object DBedtTipoFolha: TDBEdit
                Left = 144
                Top = 32
                Width = 241
                Height = 21
                Color = clBtnFace
                DataField = 'TIPOFOLHA'
                DataSource = dtsHistMov
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
              end
              object DBEdit5: TDBEdit
                Left = 16
                Top = 80
                Width = 145
                Height = 21
                Color = clBtnFace
                DataField = 'IDRUBRICA'
                DataSource = dtsHistMov
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 2
              end
              object DBEdit19: TDBEdit
                Left = 240
                Top = 80
                Width = 145
                Height = 21
                Color = clBtnFace
                DataField = 'HMEDATAENVIO'
                DataSource = dtsHistMov
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 4
              end
              object DBEdit21: TDBEdit
                Left = 16
                Top = 128
                Width = 145
                Height = 21
                Color = clBtnFace
                DataField = 'IDTMPDESC'
                DataSource = dtsHistMov
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 3
              end
              object DBEdit35: TDBEdit
                Left = 104
                Top = 176
                Width = 129
                Height = 21
                TabStop = False
                Color = clBtnFace
                DataField = 'NODOCUMENTO'
                DataSource = dtsHistMov
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 6
              end
            end
            object Historico: TGroupBox
              Left = 8
              Top = 234
              Width = 705
              Height = 120
              Caption = 'Histórico de Envio'
              TabOrder = 2
              object DBGrdHistEnvio: TwwDBGrid
                Left = 8
                Top = 15
                Width = 689
                Height = 97
                IniAttributes.Delimiter = ';;'
                TitleColor = clBtnFace
                FixedCols = 0
                ShowHorzScrollBar = True
                DataSource = DSHistEnvioEmptmo
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
            end
          end
          object tbsObservacao: TTabSheet
            Caption = 'Observação'
            ImageIndex = 3
            object DBRichEdit1: TDBRichEdit
              Left = 0
              Top = 0
              Width = 909
              Height = 467
              Align = alClient
              DataField = 'HMEOBSERVACAO'
              DataSource = dsHistObservacao
              ReadOnly = True
              TabOrder = 0
            end
          end
          object tbsLogTotalPrevHist: TTabSheet
            Caption = 'Log'
            ImageIndex = 4
            object DBgrdLogHist: TwwDBGrid
              Left = 0
              Top = 0
              Width = 909
              Height = 422
              Selected.Strings = (
                'DATA'#9'18'#9'Data / Hora'
                'DESC_ORIGEM'#9'19'#9'Origem'
                'VERSAO'#9'8'#9'Versão'
                'NOMEUSUARIO'#9'10'#9'Login'
                'NOME'#9'20'#9'Usuario'
                'DESCOPERACAO'#9'27'#9'Descrição'
                'IDUSUARIO'#9'9'#9'ID Usuário'
                'IDHISTMOVEMPTMO'#9'13'#9'ID HistMov'
                'IDMODULO'#9'9'#9'ID Módulo'
                'IDCONTRATOEMPTMO'#9'13'#9'Contrato'
                'IDLOGTOTALPREV'#9'10'#9'ID Log')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              Align = alClient
              DataSource = dsLogTotalPrevHist
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
            object DBMemo2: TDBMemo
              Left = 0
              Top = 422
              Width = 909
              Height = 55
              Align = alBottom
              DataField = 'DESCOPERACAO'
              DataSource = dsLogTotalPrevHist
              TabOrder = 1
            end
          end
        end
        object btnAlteraObs: TBitBtn
          Left = 616
          Top = 0
          Width = 150
          Height = 22
          Caption = 'Alterar Observações'
          TabOrder = 1
          OnClick = btnAlteraObsClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777770007
            77777777777F8887F77777777788FF08777777777F887778F777777788FFFFF0
            7777777788777FF8F7777778FFFF88F077777778F77F88F87F777778FF00F0FF
            077777787F8878F78F77777700FFF0FF0777777F8877787F87F77700FFFFFF0F
            F077778877777F8F787F778FFFFFCF0FFF07778F77FF8787F787778FFCCCFFF0
            FFF07787F88877F8F7F87778FFFFFCF0F8877778F77FF87878877778FFCCCFFF
            077777787F88877F87F777778FFFFFCFF07777778F77FF87787F77778FFCCCFF
            FF07777787F888777F87777778FFFFFF88777777787F777F88777777778FFF88
            777777777787FF88777777777778887777777777777888777777}
          NumGlyphs = 2
        end
      end
      object tbsItensAberto: TTabSheet
        Caption = 'Itens em Aberto'
        ImageIndex = 5
        object wwDBGrid1: TwwDBGrid
          Left = 0
          Top = 0
          Width = 917
          Height = 483
          Selected.Strings = (
            'EVENTO'#9'14'#9'Evento'#9'F'
            'ITEDESCRICAO'#9'25'#9'Item'#9'F'
            'HMEPARCELA'#9'3'#9'Par'#9'F'
            'HMESEQCOBRANCA'#9'3'#9'Seq'#9'F'
            'ANOMESCOMP'#9'7'#9'Comp.'#9'F'
            'ANOMESCOBR'#9'7'#9'Cobr.'#9'F'
            'HMEDATAPREVISTA'#9'10'#9'Data Prev.'#9'F'
            'HMEDATAVENCTO'#9'10'#9'Data Venc.'#9'F'
            'HMEDATAEFETIVA'#9'10'#9'Data Efet.'#9'F'
            'HMEVLRPREVISTO'#9'11'#9'Vlr.Previsto'#9'F'
            'HMEVLREFETIVO'#9'11'#9'Vlr.Efetivo'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          OnCellChanged = DBgrdHistMovCellChanged
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dtsItensAberto
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          KeyOptions = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          TitleAlignment = taCenter
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Arial'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          UseTFields = False
          OnCalcCellColors = DBgrdHistMovCalcCellColors
          IndicatorColor = icBlack
          OnTopRowChanged = DBgrdHistMovTopRowChanged
        end
        object Panel2: TPanel
          Left = 0
          Top = 483
          Width = 917
          Height = 24
          Align = alBottom
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 1
          object Label53: TLabel
            Left = 304
            Top = 5
            Width = 105
            Height = 13
            Caption = 'Itens em aberto:   '
          end
          object Label54: TLabel
            Left = 520
            Top = 5
            Width = 79
            Height = 13
            Caption = 'Valor Total:   '
          end
          object DBEdit6: TDBEdit
            Left = 592
            Top = 2
            Width = 81
            Height = 21
            Color = 12648447
            DataField = 'VALOR_TOTAL_ABERTO'
            DataSource = dtsTotalizaAberto
            TabOrder = 0
          end
          object DBEdit7: TDBEdit
            Left = 400
            Top = 2
            Width = 49
            Height = 21
            Color = 12648447
            DataField = 'QUANT_ABERTO'
            DataSource = dtsTotalizaAberto
            TabOrder = 1
          end
        end
      end
      object tsCobranca: TTabSheet
        Caption = 'Cobranças'
        ImageIndex = 8
        object pnGrupo: TPanel
          Left = 0
          Top = 0
          Width = 917
          Height = 507
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object pnGeral: TPanel
            Left = 0
            Top = 0
            Width = 917
            Height = 188
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
            object Label96: TLabel
              Left = 483
              Top = 0
              Width = 69
              Height = 13
              Caption = 'Observação'
            end
            object wwDBGrid6: TwwDBGrid
              Left = 4
              Top = 2
              Width = 460
              Height = 182
              Selected.Strings = (
                'DESCEVENTOCOB'#9'46'#9'Evento'
                'DATAEVENTOCOB'#9'14'#9'Data do Evento')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              OnCellChanged = wwDBGrid6CellChanged
              FixedCols = 0
              ShowHorzScrollBar = True
              DataSource = dseventos
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
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
            object dbmmoOBSCOB: TDBMemo
              Left = 495
              Top = 15
              Width = 408
              Height = 169
              DataField = 'OBSCOB'
              DataSource = dseventos
              TabOrder = 1
            end
          end
          object pneventos: TPanel
            Left = 0
            Top = 188
            Width = 917
            Height = 45
            Align = alTop
            TabOrder = 1
            object lblNUP2: TLabel
              Left = 6
              Top = 3
              Width = 27
              Height = 13
              Caption = 'NUP'
            end
            object Label105: TLabel
              Left = 190
              Top = 3
              Width = 75
              Height = 13
              Caption = 'Número CRM'
            end
            object lblCE: TLabel
              Left = 375
              Top = 3
              Width = 17
              Height = 13
              Caption = 'CE'
            end
            object lblAr: TLabel
              Left = 559
              Top = 3
              Width = 79
              Height = 13
              Caption = 'Código do AR'
            end
            object lblSitAR: TLabel
              Left = 743
              Top = 3
              Width = 90
              Height = 13
              Caption = 'Situação do AR'
            end
            object dbedtNUP1: TDBEdit
              Left = 4
              Top = 18
              Width = 160
              Height = 21
              DataField = 'NUP'
              DataSource = dseventos
              TabOrder = 0
            end
            object dbedtNUMCRM: TDBEdit
              Left = 190
              Top = 18
              Width = 160
              Height = 21
              DataField = 'NUMCRM'
              DataSource = dseventos
              TabOrder = 1
            end
            object dbedtCE: TDBEdit
              Left = 375
              Top = 18
              Width = 160
              Height = 21
              DataField = 'CE'
              DataSource = dseventos
              TabOrder = 2
            end
            object dbedtAR: TDBEdit
              Left = 559
              Top = 18
              Width = 160
              Height = 21
              DataField = 'AR'
              DataSource = dseventos
              TabOrder = 3
            end
            object dbedtSITAR: TDBEdit
              Left = 737
              Top = 18
              Width = 160
              Height = 21
              DataField = 'SITAR'
              DataSource = dseventos
              TabOrder = 4
            end
          end
          object pnacordo: TPanel
            Left = 0
            Top = 233
            Width = 917
            Height = 88
            Align = alTop
            TabOrder = 2
            object lbl1: TLabel
              Left = 5
              Top = 2
              Width = 169
              Height = 13
              Caption = 'Data da assinatura do acordo'
            end
            object lbl2: TLabel
              Left = 193
              Top = 2
              Width = 186
              Height = 13
              Caption = 'Data da homologação do acordo'
            end
            object Label108: TLabel
              Left = 398
              Top = 2
              Width = 120
              Height = 13
              Caption = 'Forma de Pagamento'
            end
            object lbl3: TLabel
              Left = 591
              Top = 2
              Width = 13
              Height = 13
              Caption = 'CI'
            end
            object Label107: TLabel
              Left = 7
              Top = 38
              Width = 104
              Height = 13
              Caption = 'Formulário GEJUR'
            end
            object dbedtAssinaturaAcordo: TDBEdit
              Left = 4
              Top = 16
              Width = 160
              Height = 21
              DataField = 'DATAASSINATURAACORDO'
              DataSource = dseventos
              TabOrder = 0
            end
            object dbedtHomolAcordo: TDBEdit
              Left = 192
              Top = 16
              Width = 160
              Height = 21
              DataField = 'DATAHOMOLACORDO'
              DataSource = dseventos
              TabOrder = 1
            end
            object dbedtFormaPagto: TDBEdit
              Left = 398
              Top = 15
              Width = 160
              Height = 21
              DataField = 'FORMAPAGTO'
              DataSource = dseventos
              TabOrder = 2
            end
            object dbedtCI: TDBEdit
              Left = 591
              Top = 15
              Width = 160
              Height = 21
              DataField = 'CI'
              DataSource = dseventos
              TabOrder = 3
            end
            object dbmmoFormGejur: TDBMemo
              Left = 5
              Top = 52
              Width = 645
              Height = 34
              DataField = 'GEJUR'
              DataSource = dseventos
              TabOrder = 4
            end
          end
          object pnGrid: TPanel
            Left = 0
            Top = 321
            Width = 917
            Height = 154
            Align = alTop
            TabOrder = 3
            object pnlCobranca: TPanel
              Left = 659
              Top = 4
              Width = 249
              Height = 134
              BevelInner = bvLowered
              TabOrder = 0
              object lblProcJud: TLabel
                Left = 7
                Top = 50
                Width = 147
                Height = 13
                Caption = 'Número Processo Judicial'
              end
              object lblDtAjuiza: TLabel
                Left = 7
                Top = 9
                Width = 100
                Height = 13
                Caption = 'Data Ajuizamento'
              end
              object lblLocOrgJuris: TLabel
                Left = 7
                Top = 96
                Width = 146
                Height = 13
                Caption = 'Local/Órgão Jurisdicional'
              end
              object dbedtLocOrgJuris: TDBEdit
                Left = 7
                Top = 110
                Width = 232
                Height = 21
                DataField = 'JURISDICAO'
                DataSource = dseventos
                TabOrder = 0
              end
              object dbedtPROCJUD: TDBEdit
                Left = 8
                Top = 67
                Width = 232
                Height = 21
                DataField = 'PROCJUD'
                DataSource = dseventos
                TabOrder = 1
              end
              object dbedtDtAjuiza: TDBEdit
                Left = 8
                Top = 23
                Width = 109
                Height = 21
                DataField = 'DTAJUIZAMENTO'
                DataSource = dseventos
                TabOrder = 2
              end
            end
            object wwDBGrid7: TwwDBGrid
              Left = 12
              Top = 2
              Width = 645
              Height = 150
              Selected.Strings = (
                'PARCELAS'#9'12'#9'Nº Prestação'
                'ITEM'#9'20'#9'Item'
                'HMEDATAPREVISTA'#9'17'#9'Data Prev. Prest'
                'HMEVLRPREVISTO'#9'17'#9'Valor Prestação'
                'HMEVLREFETIVO'#9'14'#9'Valor Efetivo'
                'HMEDATAEFETIVA'#9'13'#9'Data Efetiva'
                'HMEDATAVENCTO'#9'12'#9'Vencimento')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              DataSource = dsPrestacao
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              TitleAlignment = taLeftJustify
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -9
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = [fsBold]
              TitleLines = 1
              TitleButtons = False
              OnCalcCellColors = wwDBGrid7CalcCellColors
              IndicatorColor = icBlack
              OnTopRowChanged = wwDBGrid7TopRowChanged
            end
          end
        end
      end
      object tbsSaldo: TTabSheet
        Caption = 'Valor para Quitação'
        ImageIndex = 4
        object lblSaldoAtualizado: TLabel
          Left = 433
          Top = 291
          Width = 179
          Height = 13
          Alignment = taRightJustify
          Caption = 'Valor projetado para Quitação: '
        end
        object Label58: TLabel
          Left = 12
          Top = 13
          Width = 107
          Height = 13
          Caption = 'Valor em Aberto:   '
        end
        object btnAtualizaSaldo: TBitBtn
          Left = 440
          Top = 9
          Width = 201
          Height = 25
          Caption = 'Calcular valor para Quitação em:'
          TabOrder = 0
          OnClick = btnAtualizaSaldoClick
        end
        object wwDBGrid2: TwwDBGrid
          Left = 8
          Top = 40
          Width = 745
          Height = 241
          Selected.Strings = (
            'EVENTO'#9'16'#9'Evento'#9'F'
            'ITEDESCRICAO'#9'35'#9'Item'#9'F'
            'HMEPARCELA'#9'7'#9'Parcela'#9'F'
            'HMESEQCOBRANCA'#9'5'#9'Seq'#9'F'
            'HMEDATAPREVISTA'#9'13'#9'Data Prevista'#9'F'
            'HMEVLRPREVISTO'#9'15'#9'ValorPrevisto'#9'F'
            'HMESALDODEV'#9'15'#9'Saldo Devedor'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          OnCellChanged = DBgrdHistMovCellChanged
          FixedCols = 0
          ShowHorzScrollBar = True
          DataSource = dtsHistMovVirtual
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          KeyOptions = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
          TitleAlignment = taCenter
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Arial'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          UseTFields = False
          OnCalcCellColors = DBgrdHistMovCalcCellColors
          IndicatorColor = icBlack
          OnTopRowChanged = DBgrdHistMovTopRowChanged
        end
        object edtSaldoAtual: TRealEdit
          Left = 616
          Top = 288
          Width = 121
          Height = 21
          Alignment = taRightJustify
          Color = 12648447
          Enabled = False
          Lines.Strings = (
            '      0,00')
          ReadOnly = True
          TabOrder = 2
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
        end
        object edtDataQuitacao: TCMDateTimePicker
          Left = 656
          Top = 11
          Width = 97
          Height = 21
          TabStop = False
          AutoSize = False
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
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ShowButton = True
          TabOrder = 3
        end
        object DBEdit10: TDBEdit
          Left = 112
          Top = 10
          Width = 89
          Height = 21
          Color = 12648447
          DataField = 'VALOR_TOTAL_ABERTO'
          DataSource = dtsTotalizaAberto
          TabOrder = 4
        end
        object rdgMetodo: TRadioGroup
          Left = 248
          Top = 3
          Width = 185
          Height = 31
          Color = clBtnShadow
          Columns = 2
          ItemIndex = 1
          Items.Strings = (
            'Método 1'
            'Método 2')
          ParentColor = False
          TabOrder = 5
          Visible = False
        end
      end
      object tbsBenefSeguro: TTabSheet
        Caption = 'Beneficiário(s) do Seguro'
        ImageIndex = 6
        object wwDBGrid3: TwwDBGrid
          Left = 0
          Top = 0
          Width = 917
          Height = 442
          Selected.Strings = (
            'NOME'#9'38'#9'Nome'
            'PERCINDENIZACAO'#9'5'#9'%'
            'BANCO'#9'20'#9'Conta Corrente'
            'VLRSALDOREC'#9'13'#9'Vlr Fundação'
            'VLRREPASSE'#9'13'#9'Vlr. Benef.'
            'DATAREPASSE'#9'11'#9'Data Depósito'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsBenefSeguro
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
        object DBmemObsBenef: TDBMemo
          Left = 0
          Top = 442
          Width = 917
          Height = 55
          Align = alBottom
          DataField = 'OBS'
          DataSource = dsBenefSeguro
          TabOrder = 1
        end
      end
      object tbsLogTotalprev: TTabSheet
        Caption = 'Log'
        ImageIndex = 7
        object DBgrdLogContrato: TwwDBGrid
          Left = 0
          Top = 0
          Width = 917
          Height = 442
          Selected.Strings = (
            'DATA'#9'18'#9'Data / Hora'
            'DESC_ORIGEM'#9'19'#9'Origem'
            'VERSAO'#9'8'#9'Versão'
            'NOMEUSUARIO'#9'10'#9'Login'
            'NOME'#9'20'#9'Usuario'
            'DESCOPERACAO'#9'27'#9'Descrição'
            'IDUSUARIO'#9'9'#9'ID Usuário'
            'IDHISTMOVEMPTMO'#9'13'#9'ID HistMov'
            'IDMODULO'#9'9'#9'ID Módulo'
            'IDCONTRATOEMPTMO'#9'13'#9'Contrato'
            'IDLOGTOTALPREV'#9'10'#9'ID Log')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsLogTotalPrev
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
        object DBMemo1: TDBMemo
          Left = 0
          Top = 442
          Width = 917
          Height = 55
          Align = alBottom
          DataField = 'DESCOPERACAO'
          DataSource = dsLogTotalPrev
          TabOrder = 1
        end
      end
    end
    object fcShapeBtn3: TfcShapeBtn
      Left = 755
      Top = 1
      Width = 34
      Height = 24
      Caption = ' ?'
      Color = clBtnFace
      DitherColor = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      NumGlyphs = 2
      ParentClipping = True
      ParentFont = False
      RoundRectBias = 25
      ShadeStyle = fbsFlat
      TabOrder = 6
      TextOptions.Alignment = taCenter
      TextOptions.VAlignment = vaVCenter
      OnClick = fcShapeBtn3Click
    end
    object DBedtNumContrato: TDBEdit
      Left = 16
      Top = 24
      Width = 112
      Height = 21
      TabStop = False
      Color = clBtnFace
      DataField = 'IDContratoEmptmo'
      DataSource = dts
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object btnBuscaContrato: TBitBtn
      Left = 131
      Top = 21
      Width = 36
      Height = 24
      Hint = 'Busca o Contrato'
      Default = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = btnBuscaContratoClick
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
    object DBedtParticipante: TDBEdit
      Left = 170
      Top = 15
      Width = 548
      Height = 32
      TabStop = False
      Color = clBtnFace
      DataField = 'BENEFICIARIO'
      DataSource = dts
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
    object fcShapeBtn1: TfcShapeBtn
      Left = 857
      Top = 60
      Width = 20
      Height = 20
      Hint = 'Aumenta / Diminui painel do Histórico'
      Color = clBtnFace
      DitherColor = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888FFFFF8888888888000008888888888F777778FF888888006666600
        88888887788888778F88887666666666088888788888F88878F887E6666F6666
        608887F888878F8887F887E666FFF66660888788887778F8878F7E666FFFFF66
        66087F888777778F887F7E66FFFFFFF666087F8877777778887F7E6666666666
        66087F888FFFFFFF887F7E66FFFFFFF666087F8877777778887F7E666FFFFF66
        660878F887777788887887E666FFF666608887F88877788887F887E6666F6666
        6088878F888788888788887EE666666608888878FF88888F788888877EEEEE77
        8888888778FFFF77888888888777778888888888877777888888}
      NumGlyphs = 2
      ParentClipping = True
      ParentFont = False
      RoundRectBias = 25
      ShadeStyle = fbsFlat
      TabOrder = 4
      TextOptions.Alignment = taCenter
      TextOptions.VAlignment = vaVCenter
      OnClick = fcShapeBtn1Click
    end
    object pnlHistBaca: TPanel
      Left = 457
      Top = -1
      Width = 265
      Height = 63
      TabOrder = 5
      Visible = False
      object btnAltera: TfcShapeBtn
        Left = 96
        Top = 34
        Width = 73
        Height = 23
        Caption = 'Alterar'
        Color = clBtnFace
        DitherColor = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        NumGlyphs = 2
        ParentClipping = True
        ParentFont = False
        RoundRectBias = 25
        ShadeStyle = fbsFlat
        TabOrder = 0
        TextOptions.Alignment = taCenter
        TextOptions.VAlignment = vaVCenter
        OnClick = btnAlteraClick
      end
      object btnNovo: TfcShapeBtn
        Left = 8
        Top = 34
        Width = 73
        Height = 23
        Caption = 'Novo'
        Color = clBtnFace
        DitherColor = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clOlive
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        NumGlyphs = 2
        ParentClipping = True
        ParentFont = False
        RoundRectBias = 25
        ShadeStyle = fbsFlat
        TabOrder = 1
        TextOptions.Alignment = taCenter
        TextOptions.VAlignment = vaVCenter
        OnClick = btnNovoClick
      end
      object btnExcluir: TfcShapeBtn
        Left = 184
        Top = 34
        Width = 73
        Height = 23
        Caption = 'Excluir'
        Color = clBtnFace
        DitherColor = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        NumGlyphs = 2
        ParentClipping = True
        ParentFont = False
        RoundRectBias = 25
        ShadeStyle = fbsFlat
        TabOrder = 2
        TextOptions.Alignment = taCenter
        TextOptions.VAlignment = vaVCenter
        OnClick = btnExcluirClick
      end
      object cboFlgSituacao: TComboBox
        Left = 8
        Top = 10
        Width = 185
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 3
        Items.Strings = (
          'Ativo'
          'Cancelado'
          'Encerrado'
          'Pendente de Quitação'
          'Quitado'
          'Pendente de Liberação')
      end
      object BitBtn1: TBitBtn
        Left = 192
        Top = 8
        Width = 64
        Height = 23
        Caption = 'Altera'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        OnClick = BitBtn1Click
      end
    end
    object btnAlteraHistContrato: TfcShapeBtn
      Left = 827
      Top = 60
      Width = 30
      Height = 20
      Hint = 'Ajustar Histórico / Situação Contratual'
      Color = clBtnFace
      DitherColor = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Enabled = False
      Glyph.Data = {
        36010000424D3601000000000000760000002800000011000000100000000100
        040000000000C0000000C40E0000C40E00001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777700000007777777777777777700000007777777777777777700000007777
        777777777887700000007778887777770088700000007700088777707B088000
        000070B7B0888807B7B0800000003F7B7B0000037370800000003F0FB7B7B7B7
        B7B7300000003F007BFFFFFFFFFF300000003FB7BF33333333337000000073FF
        F377777777777000000077333777777777777000000077777777777777777000
        0000777777777777777770000000777777777777777770000000}
      NumGlyphs = 0
      ParentClipping = True
      ParentFont = False
      RoundRectBias = 25
      ShadeStyle = fbsFlat
      TabOrder = 7
      TextOptions.Alignment = taCenter
      TextOptions.VAlignment = vaVCenter
      OnClick = btnAlteraHistContratoClick
    end
  end
  inherited Dock971: TDock97
    Top = 597
    Width = 1011
    inherited tb97Fundo: TToolbar97
      Left = 378
      DockPos = 608
      inherited sep1: TToolbarSep97
        Left = 544
      end
      inherited ToolbarSep971: TToolbarSep97
        Left = 438
        SizeHorz = 25
      end
      inherited ToolbarSep972: TToolbarSep97
        Left = 627
      end
      object ToolbarSep973: TToolbarSep97 [3]
        Left = 276
        Top = 0
        Blank = True
        SizeHorz = 25
      end
      object ToolbarSep974: TToolbarSep97 [4]
        Left = 0
        Top = 0
        Blank = True
        SizeHorz = 2
        Visible = False
      end
      inherited bbtnSair: TBitBtn
        Left = 463
        TabOrder = 2
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 546
        TabOrder = 3
        OnClick = bbtnAjudaClick
      end
      object btnImprimir: TBitBtn
        Left = 301
        Top = 0
        Width = 137
        Height = 27
        Caption = 'Im&primir Contrato'
        TabOrder = 1
        OnClick = btnImprimirClick
        Glyph.Data = {
          AA040000424DAA04000000000000360000002800000013000000130000000100
          18000000000074040000000000000000000000000000000000000000FF0000FF
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
      end
      object btnAjustaSaldo: TBitBtn
        Left = 139
        Top = 0
        Width = 137
        Height = 27
        Caption = 'Ajustar Saldo'
        Enabled = False
        TabOrder = 0
        OnClick = btnAjustaSaldoClick
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          888888888888FFFFFF88888800008888844444488888888F88F7777778F88888
          000024884222222448888877FF788888877F888800002244222222222488887F
          7788FFFFF887F8880000222222AAAAA22248887F888F77777F887F8800002222
          2A88888A2224887F88F7888887F887F80000222228888888A224887F8878F888
          887FF7F80000222222888888A444887FFFF78F88887777880000AAAAAAA88888
          8888887777777888888888880000888888888888888888888888888888FFFFFF
          00008888888888844444488FFFF888888777777F0000A444888888A222224877
          77F888887F88887F0000A2248888888A2222487F878F888887F8887F00008A22
          48888844222248878878FFFF7788887F00008A222444442222224887F8877777
          888FF87F000088A2222222222AA248887FF888888FF77F780000888AA222222A
          A88A8888877FFFFFF7788788000088888AAAAAA8888888888887777778888888
          0000}
        NumGlyphs = 2
      end
      object btnAjustaSituacao: TBitBtn
        Left = 2
        Top = 0
        Width = 137
        Height = 27
        Caption = 'Ajustar Situação'
        Enabled = False
        TabOrder = 4
        OnClick = btnAjustaSituacaoClick
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          888888888888FFFFFF88888800008888844444488888888F88F7777778F88888
          000024884222222448888877FF788888877F888800002244222222222488887F
          7788FFFFF887F8880000222222AAAAA22248887F888F77777F887F8800002222
          2A88888A2224887F88F7888887F887F80000222228888888A224887F8878F888
          887FF7F80000222222888888A444887FFFF78F88887777880000AAAAAAA88888
          8888887777777888888888880000888888888888888888888888888888FFFFFF
          00008888888888844444488FFFF888888777777F0000A444888888A222224877
          77F888887F88887F0000A2248888888A2222487F878F888887F8887F00008A22
          48888844222248878878FFFF7788887F00008A222444442222224887F8877777
          888FF87F000088A2222222222AA248887FF888888FF77F780000888AA222222A
          A88A8888877FFFFFF7788788000088888AAAAAA8888888888887777778888888
          0000}
        NumGlyphs = 2
      end
    end
  end
  object twMensagem: TToolWindow97 [2]
    Left = 1018
    Top = 96
    ActivateParent = False
    Caption = 'Mensagem'
    ClientAreaHeight = 147
    ClientAreaWidth = 369
    Resizable = False
    TabOrder = 2
    Visible = False
    OnVisibleChanged = twMensagemVisibleChanged
    object pnlBotoes: TPanel
      Left = 0
      Top = 112
      Width = 369
      Height = 35
      Align = alBottom
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 0
      object btnFechar: TBitBtn
        Left = 149
        Top = 4
        Width = 92
        Height = 25
        Caption = '&Fechar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = btnFecharClick
        Kind = bkOK
      end
      object btnProximo: TBitBtn
        Left = 270
        Top = 4
        Width = 83
        Height = 25
        Caption = 'Próxima'
        Default = True
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ModalResult = 1
        ParentFont = False
        TabOrder = 1
        OnClick = btnProximoClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          33333FF3333333333333447333333333333377FFF33333333333744473333333
          333337773FF3333333333444447333333333373F773FF3333333334444447333
          33333373F3773FF3333333744444447333333337F333773FF333333444444444
          733333373F3333773FF333334444444444733FFF7FFFFFFF77FF999999999999
          999977777777777733773333CCCCCCCCCC3333337333333F7733333CCCCCCCCC
          33333337F3333F773333333CCCCCCC3333333337333F7733333333CCCCCC3333
          333333733F77333333333CCCCC333333333337FF7733333333333CCC33333333
          33333777333333333333CC333333333333337733333333333333}
        Layout = blGlyphRight
        NumGlyphs = 2
      end
      object btnAnterior: TBitBtn
        Left = 22
        Top = 4
        Width = 83
        Height = 25
        Caption = '&Anterior'
        Default = True
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ModalResult = 1
        ParentFont = False
        TabOrder = 2
        OnClick = btnAnteriorClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          333333333333333333FF3333333333333744333333333333F773333333333337
          44473333333333F777F3333333333744444333333333F7733733333333374444
          4433333333F77333733333333744444447333333F7733337F333333744444444
          433333F77333333733333744444444443333377FFFFFFF7FFFFF999999999999
          9999733777777777777333CCCCCCCCCC33333773FF333373F3333333CCCCCCCC
          C333333773FF3337F333333333CCCCCCC33333333773FF373F3333333333CCCC
          CC333333333773FF73F33333333333CCCCC3333333333773F7F3333333333333
          CCC333333333333777FF33333333333333CC3333333333333773}
        NumGlyphs = 2
      end
    end
    object reditMSG: TRichEdit
      Left = 0
      Top = 0
      Width = 369
      Height = 112
      Align = alClient
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 855
    TargetsData = (
      1
      5
      (
        'TDBMemo'
        'Text'
        0)
      (
        'TRealEdit'
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
        'TRichEdit'
        'Text'
        0))
  end
  object dts: TwwDataSource
    AutoEdit = False
    DataSet = qry
    Left = 813
    Top = 147
  end
  object qry: TwwQuery
    CachedUpdates = True
    BeforeOpen = qryBeforeOpen
    AfterOpen = qryAfterOpen
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   INS.IDINSCRICAOEMPTMO AS INSCRICAO,'
      '  -- SOL 204839'
      '  --INS.FLGINTERNET,'
      
        '  DECODE(INS.FLGINTERNET, NULL, CON.FLGINTERNET, INS.FLGINTERNET' +
        ') AS FLGINTERNET,'
      '   NVL(CON.FLGEXCEPCIONAL,0) AS FLGEXCEPCIONAL, -- SOL114613'
      ''
      '   PPP.INSCRICAONUMERO,'
      ''
      '   DECODE(CON.FLGSITUACAO,'#39'A'#39', '#39'Contrato Ativo'#39','
      '                          '#39'C'#39', '#39'Contrato Cancelado'#39','
      '                          '#39'E'#39', '#39'Contrato Encerrado'#39','
      '                          '#39'Q'#39', '#39'Contrato Quitado'#39','
      '                          '#39'R'#39', '#39'Contrato Refinanciado'#39','
      '                          '#39'S'#39', '#39'Contrato Suspenso'#39','
      '                          '#39'P'#39', '#39'Contrato Pendente de Liberação'#39','
      
        '                          '#39'K'#39', '#39'Contrato Pendente de Quitação'#39') ' +
        'AS DESCSITCONTRATO,'
      ''
      '   DECODE(CON.FLGFORMAPAG,'#39'C'#39', '#39'Contas a Pagar'#39','
      
        '                          '#39'F'#39', '#39'Folha de Pagamento'#39') AS DESCFLGF' +
        'ORMAPAG,'
      ''
      '   DECODE(CON.FLGFORMAREC,'#39'C'#39', '#39'Contas a Receber'#39','
      
        '                          '#39'F'#39', '#39'Folha de Pagamento'#39') AS DESCFLGF' +
        'ORMAREC,'
      ''
      '   FRP.DESCRICAO AS DESCCODFORMAPAG,'
      '   PFP.DESCRICAO AS DESCPORTFORMAPAG,'
      '   PFR.DESCRICAO AS DESCPORTFORMAREC,'
      ''
      '   SIT.FLGINTERNO,'
      '   PLV.NOME      AS PLANOPREV,'
      '   PPC.NOME      AS PLANOORIGEM,'
      '   JUR.NOME      AS PATRO,'
      
        '   DECODE(DEP.IDTITULAR, NULL, '#39#39#39#39', DEP.IDPESSOA, ELP.MATRICULA' +
        ', DEP.MATRICULA) AS MATRICULA,'
      '   TIT.NOME      AS TITULAR,'
      '   BEN.NOME      AS BENEFICIARIO,'
      ''
      '   CED.NOME AS CEDIDO,'
      ''
      '   TCE.TCEDESCRICAO, TCE.IDTIPOEMPTMO,'
      
        '   TCE.TCELEGENDAEXIBE, TCE.TCELEGENDACALC, TCE.SISTEMA_AMORTIZA' +
        'CAO,'
      ''
      '   TEP.DESCTIPOEMPTMO,'
      '   INS.DATAINSC,'
      '   BAN.NOME AS BANCO,'
      '   CTB.CONTACORRENTE, AGB.NUMAGENCIA,'
      ''
      '   DECODE(CON.IDCBANCARIA, NULL, '#39#39','
      
        '          DECODE(CON.IDFORNCRED, NULL, BEN.NOME, FRN.NOME )) AS ' +
        'FORNCREDITO,'
      ''
      
        '   CON.IDCONTRATOEMPTMO , CON.IDCONTRQUITACAO, CON.IDPESSOA     ' +
        '  , CON.IDVERBA     ,'
      
        '   CON.IDTIPOCONTREMPTMO, CON.IDPLANOPREV    , CON.IDPATRO      ' +
        '  , CON.NUMPARCELAS ,'
      
        '   CON.IDINSCRICAOEMPTMO, CON.IDBENEF        , CON.IDCBANCARIA  ' +
        '  , CON.IDCBANCARIADEB,'
      
        '   CON.CODFORMAPAG      , CON.PORTFORMAPAG   , CON.PORTFORMAREC ' +
        '  , CON.DATACANC    ,'
      
        '   CON.DATACREDITO      , CON.DATASITUACAO   , CON.DATAASSINATUR' +
        'A , CON.DATAPRIMPARC,'
      
        '   CON.VLRCONTRATO      , CON.VLRPARCELA     , CON.TXJUROS      ' +
        '  , CON.FLGSITUACAO ,'
      
        '   CON.FLGFORMAREC      , CON.FLGFORMAPAG    , CON.VLRSALBASE   ' +
        '  , CON.VLRMARGEM   , CON.VLRMAXPERMIT,'
      '   CON.NUMPROTOCOLO AS NUP, ----MONICA SOL172525'
      ''
      
        '   CON.MOECODIGO        , CON.IDTIPOSUSPEMPTMO, CON.DATAINICIOSU' +
        'SP, CON.DATAFIMSUSP,'
      
        '   CON.ANOSUSPENSAO     , CON.MESSUSPENSAO    , CON.IDPLANOORIGE' +
        'M , CON.CODAUTOEMP,'
      '   MOE.MOESIGLA         ,'
      '   TSE.TSEDESCRICAO     ,'
      '   RES.NOME AS NOMERESPONSAVEL,'
      '   MUT.DATAMORTE, ---------------CAMPO DATA DE FALECIMENTO'
      ''
      '   BDB.NOME AS BANCODEB,'
      
        '   CTD.CONTACORRENTE AS CONTACORRENTEDEB, AGD.NUMAGENCIA AS NUMA' +
        'GENCIADEB,'
      
        '   /*DECODE(CON.NUMPARCDESCONTO, NULL, 0, CON.NUMPARCDESCONTO) A' +
        'S NUMPARCDESCONTO, */'
      '   CON.CARENCIA  AS NUMPARCDESCONTO,'
      ''
      '   SIT.IDSITPART,'
      ''
      '   SIT.FLGINTERNO AS SITUACAO_INT,'
      '   SPP.FLGINTERNO AS SITUACAO_INT_PLANO,'
      '   SFU.TIPOSIT    AS SITUACAO_INT_FUNC,'
      ''
      '   SIT.DESCRICAO AS SITUACAO,'
      '   SPP.DESCRICAO AS SITUACAO_PLANO,'
      '   SFU.DESCRICAO AS SITUACAO_FUNC,'
      ''
      '   CON.FLGUSAMARGEMALT,'
      '   CON.FLGPERDAEFETIVA,'
      ''
      '   -- Paulo Nobre - TAS000000006779 - Inicio'
      ''
      '   --   TO_CHAR(VLR.VALORMAX, '#39'999999990D99'#39') AS VALORMAX,'
      ''
      
        '   CAST(TO_CHAR(VLR.VALORMAX, '#39'999999990D99'#39') AS VARCHAR2(17)) A' +
        'S VALORMAX,'
      ''
      '   -- Paulo Nobre - TAS000000006779 - Fim'
      ''
      '   VLR.DATAINICIO AS DATAINICIO,'
      '   VLR.DATAFIM AS DATAFIM,'
      ''
      '   CON.VLRMAXPERMIT'
      ' , NVL(CON.TSEMESES,0) AS QtdeMesSusp'
      ' ,(SELECT COUNT(1) from contratoemptmo '
      
        '   where  IDCONTRQUITACAO = CON.IDCONTRATOEMPTMO ) AS QtdeContQu' +
        'itado'
      ', NVL(CON.FLGACORDOJUDICIAL,0) AS FLGACORDOJUDICIAL'
      'FROM'
      '    PESSOA             JUR,'
      '    PESSOA             TIT,'
      '    PESSOA             BEN,'
      '    PESSOA             BAN,'
      '    PESSOA             BDB,'
      '    PESSOA             CED,'
      '    PESSOA             FRN,'
      '    INSCRICAOEMPTMO    INS,'
      '    CONTRATOEMPTMO     CON,'
      '    PARTPREVPLAN       PPP,'
      '    ELEGPATRO          ELP,'
      '    MOEDA              MOE,'
      '    AGENCIABANCARIA    AGB,'
      '    CONTABANCARIA      CTB,'
      '    AGENCIABANCARIA    AGD,'
      '    CONTABANCARIA      CTD,'
      '    TIPOCONTREMPTMO    TCE,'
      '    TIPOEMPTMO         TEP,'
      '    SITPART            SIT,'
      '    SITPLANOPREV       SPP,'
      '    SITFUNC            SFU,'
      '    PLANPREV           PLV,'
      '    PLANPREVCONTABIL   PPC,'
      '    FORMARECPAG        FRP,'
      '    PORTADORFORMA      PFP,'
      '    PORTADORFORMA      PFR,'
      '    TIPOSUSPEMPTMO     TSE,'
      '    PESSOA             RES,'
      '    PESSOAFISICA       PEF,'
      '    PESSOAFISICA       MUT,'
      '    VALORMAXPRESTEP    VLR,'
      '    DEPENTIT           DEP'
      ''
      'WHERE'
      '   CON.IDCONTRATOEMPTMO       = :PIDCONTRATOEMPTMO -- SOL114613'
      '   AND CON.IDPESSOA           = PPP.IDPESSOA'
      '   AND CON.IDPLANOPREV        = PLV.IDPLANOPREV'
      '   AND CON.IDPLANOORIGEM      = PPC.IDPLANOPREV'
      '   AND CON.IDPATRO            = JUR.IDPESSOA'
      '   AND CON.IDPESSOA           = ELP.IDPESSOA'
      '   AND CON.IDPATRO            = ELP.IDPESSJUR'
      '   AND CON.IDPESSOA           = TIT.IDPESSOA'
      '   AND CON.IDBENEF            = BEN.IDPESSOA'
      '   AND CON.IDBENEF            = MUT.IDPESSOA'
      '   AND CON.IDTIPOCONTREMPTMO  = TCE.IDTIPOCONTREMPTMO'
      '   AND TCE.IDTIPOEMPTMO       = TEP.IDTIPOEMPTMO'
      '   AND CON.IDINSCRICAOEMPTMO  = INS.IDINSCRICAOEMPTMO(+)'
      
        '   AND CON.IDCONTRATOEMPTMO  = VLR.IDCONTRATOEMPTMO(+)  -- SOL16' +
        '3624'
      ''
      '   AND DEP.IDPESSOA           = BEN.IDPESSOA(+)'
      '   AND DEP.IDTITULAR          = CON.IDPESSOA'
      ''
      '   AND CON.IDFORNCRED         = FRN.IDPESSOA(+)'
      '   AND CON.IDCBANCARIA        = CTB.IDCBANCARIA(+)'
      '   AND AGB.IDBANCO            = BAN.IDPESSOA(+)'
      '   AND CTB.IDAGENCIA          = AGB.IDPESSOA(+)'
      '   AND AGB.IDBANCO            = BAN.IDPESSOA(+)'
      ''
      '   AND CON.IDCBANCARIADEB     = CTD.IDCBANCARIA(+)'
      '   AND AGD.IDBANCO            = BDB.IDPESSOA(+)'
      '   AND CTD.IDAGENCIA          = AGD.IDPESSOA(+)'
      '   AND AGD.IDBANCO            = BDB.IDPESSOA(+)'
      ''
      '   AND CON.CODFORMAPAG        = FRP.CODFORMA(+)'
      '   AND CON.PORTFORMAPAG       = PFP.CODPORTFORMA(+)'
      '   AND CON.PORTFORMAREC       = PFR.CODPORTFORMA(+)'
      '   AND CON.MOECODIGO          = MOE.MOECODIGO(+)'
      '   AND CON.IDTIPOSUSPEMPTMO   = TSE.IDTIPOSUSPEMPTMO(+)'
      '   AND CON.IDRESPONSAVEL      = RES.IDPESSOA(+)'
      ''
      '   AND PPP.IDSITPART          = SIT.IDSITPART'
      '   AND PPP.IDSITPLANOPREV     = SPP.IDSITPLANOPREV'
      '   AND ELP.IDSITFUNC          = SFU.IDSITFUNC'
      '   AND PEF.IDPESSOA           = PPP.IDPESSOA'
      ''
      ''
      ' AND  (ppp.idplanoprev = (SELECT MAX(ppp2.idplanoprev)'
      '                                 FROM partprevplan ppp2'
      '                         WHERE ppp2.flgdesativado = 0'
      '                         AND   ppp2.idpessoa = ppp.idpessoa)'
      '                OR'
      '               (PPP.FLGDESATIVADO = 1 '
      '                AND NOT EXISTS (SELECT 1 FROM partprevplan ppp1'
      
        '                                WHERE ppp1.idpessoa = ppp.idpess' +
        'oa'
      '                                AND ppp1.flgdesativado = 0)'
      '                AND (ppp.idsitplanoprev = 25'
      '                     OR'
      
        '                    (ppp.idplanoprev = (SELECT MAX(ppp1.idplanop' +
        'rev) '
      '                                        FROM partprevplan ppp1'
      
        '                                        WHERE ppp1.idpessoa = pp' +
        'p.idpessoa'
      
        '                                        AND   nvl(ppp1.datacance' +
        'lamento,TRIM(SYSDATE)) = '
      
        '                                                          (SELEC' +
        'T nvl(MAX(ppp2.datacancelamento),TRIM(SYSDATE))'
      
        '                                                                ' +
        '       FROM partprevplan ppp2'
      
        '                                                                ' +
        '       WHERE ppp2.idpessoa = ppp1.idpessoa)'
      
        '                                        AND   NOT EXISTS (SELECT' +
        ' 1 FROM partprevplan ppp2'
      
        '                                                          WHERE ' +
        'ppp2.idpessoa = ppp1.idpessoa'
      
        '                                                          AND   ' +
        'ppp2.idsitplanoprev = 25))))))'
      'AND ELP.IDPESSJURCEDIDO    = CED.IDPESSOA(+) '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = upd
    PictureMasks.Strings = (
      'VALORMAX'#9'#,00.0'#9'T'#9'T')
    ValidateWithMask = True
    Left = 161
    Top = 340
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end>
    object qryINSCRICAO: TFloatField
      DisplayWidth = 10
      FieldName = 'INSCRICAO'
    end
    object qryFLGINTERNET: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGINTERNET'
    end
    object qryINSCRICAONUMERO: TFloatField
      DisplayWidth = 10
      FieldName = 'INSCRICAONUMERO'
    end
    object qryDESCSITCONTRATO: TStringField
      DisplayWidth = 30
      FieldName = 'DESCSITCONTRATO'
      Size = 30
    end
    object qryDESCFLGFORMAPAG: TStringField
      DisplayWidth = 18
      FieldName = 'DESCFLGFORMAPAG'
      Size = 18
    end
    object qryDESCFLGFORMAREC: TStringField
      DisplayWidth = 18
      FieldName = 'DESCFLGFORMAREC'
      Size = 18
    end
    object qryDESCCODFORMAPAG: TStringField
      DisplayWidth = 30
      FieldName = 'DESCCODFORMAPAG'
      Size = 30
    end
    object qryDESCPORTFORMAPAG: TStringField
      DisplayWidth = 50
      FieldName = 'DESCPORTFORMAPAG'
      Size = 50
    end
    object qryDESCPORTFORMAREC: TStringField
      DisplayWidth = 50
      FieldName = 'DESCPORTFORMAREC'
      Size = 50
    end
    object qryIDSITPART: TFloatField
      DisplayWidth = 10
      FieldName = 'IDSITPART'
    end
    object qrySITUACAO: TStringField
      DisplayWidth = 50
      FieldName = 'SITUACAO'
      Size = 50
    end
    object qryFLGINTERNO: TStringField
      DisplayWidth = 2
      FieldName = 'FLGINTERNO'
      FixedChar = True
      Size = 2
    end
    object qryPLANOPREV: TStringField
      DisplayWidth = 50
      FieldName = 'PLANOPREV'
      Size = 50
    end
    object qryPATRO: TStringField
      DisplayWidth = 60
      FieldName = 'PATRO'
      Size = 60
    end
    object qryMATRICULA: TStringField
      DisplayWidth = 15
      FieldName = 'MATRICULA'
      Size = 15
    end
    object qryTITULAR: TStringField
      DisplayWidth = 60
      FieldName = 'TITULAR'
      Size = 60
    end
    object qryBENEFICIARIO: TStringField
      DisplayWidth = 60
      FieldName = 'BENEFICIARIO'
      Size = 60
    end
    object qryTCEDESCRICAO: TStringField
      DisplayWidth = 60
      FieldName = 'TCEDESCRICAO'
      Size = 60
    end
    object qryIDTIPOEMPTMO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOEMPTMO'
    end
    object qryDESCTIPOEMPTMO: TStringField
      DisplayWidth = 60
      FieldName = 'DESCTIPOEMPTMO'
      Size = 60
    end
    object qryDATAINSC: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DATAINSC'
    end
    object qryBANCO: TStringField
      DisplayWidth = 60
      FieldName = 'BANCO'
      Size = 60
    end
    object qryCONTACORRENTE: TStringField
      DisplayWidth = 15
      FieldName = 'CONTACORRENTE'
      Size = 15
    end
    object qryNUMAGENCIA: TStringField
      DisplayWidth = 15
      FieldName = 'NUMAGENCIA'
      FixedChar = True
      Size = 15
    end
    object qryIDCONTRATOEMPTMO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryIDCONTRQUITACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCONTRQUITACAO'
    end
    object qryIDPESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
    end
    object qryIDVERBA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDVERBA'
    end
    object qryIDTIPOCONTREMPTMO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOCONTREMPTMO'
    end
    object qryIDPLANOPREV: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPLANOPREV'
    end
    object qryIDPATRO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPATRO'
    end
    object qryNUMPARCELAS: TFloatField
      DisplayWidth = 10
      FieldName = 'NUMPARCELAS'
    end
    object qryIDINSCRICAOEMPTMO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDINSCRICAOEMPTMO'
    end
    object qryIDBENEF: TFloatField
      DisplayWidth = 10
      FieldName = 'IDBENEF'
    end
    object qryIDCBANCARIA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCBANCARIA'
    end
    object qryIDCBANCARIADEB: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCBANCARIADEB'
    end
    object qryCODFORMAPAG: TFloatField
      DisplayWidth = 10
      FieldName = 'CODFORMAPAG'
    end
    object qryPORTFORMAPAG: TFloatField
      DisplayWidth = 10
      FieldName = 'PORTFORMAPAG'
    end
    object qryPORTFORMAREC: TFloatField
      DisplayWidth = 10
      FieldName = 'PORTFORMAREC'
    end
    object qryDATACANC: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DATACANC'
    end
    object qryDATACREDITO: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DATACREDITO'
    end
    object qryDATASITUACAO: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DATASITUACAO'
    end
    object qryDATAASSINATURA: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DATAASSINATURA'
    end
    object qryDATAPRIMPARC: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DATAPRIMPARC'
    end
    object qryVLRCONTRATO: TFloatField
      DisplayWidth = 10
      FieldName = 'VLRCONTRATO'
    end
    object qryVLRPARCELA: TFloatField
      DisplayWidth = 10
      FieldName = 'VLRPARCELA'
    end
    object qryTXJUROS: TFloatField
      DisplayWidth = 10
      FieldName = 'TXJUROS'
    end
    object qryFLGSITUACAO: TStringField
      DisplayWidth = 1
      FieldName = 'FLGSITUACAO'
      FixedChar = True
      Size = 1
    end
    object qryFLGFORMAREC: TStringField
      DisplayWidth = 1
      FieldName = 'FLGFORMAREC'
      FixedChar = True
      Size = 1
    end
    object qryFLGFORMAPAG: TStringField
      DisplayWidth = 1
      FieldName = 'FLGFORMAPAG'
      FixedChar = True
      Size = 1
    end
    object qryVLRSALBASE: TFloatField
      DisplayWidth = 10
      FieldName = 'VLRSALBASE'
    end
    object qryVLRMARGEM: TFloatField
      DisplayWidth = 10
      FieldName = 'VLRMARGEM'
    end
    object qryVLRMAXPERMIT: TFloatField
      DisplayWidth = 10
      FieldName = 'VLRMAXPERMIT'
    end
    object qryMOECODIGO: TFloatField
      DisplayWidth = 10
      FieldName = 'MOECODIGO'
    end
    object qryIDTIPOSUSPEMPTMO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOSUSPEMPTMO'
    end
    object qryDATAINICIOSUSP: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DATAINICIOSUSP'
    end
    object qryDATAFIMSUSP: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DATAFIMSUSP'
    end
    object qryANOSUSPENSAO: TFloatField
      DisplayWidth = 10
      FieldName = 'ANOSUSPENSAO'
    end
    object qryMESSUSPENSAO: TFloatField
      DisplayWidth = 10
      FieldName = 'MESSUSPENSAO'
    end
    object qryIDPLANOORIGEM: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPLANOORIGEM'
    end
    object qryMOESIGLA: TStringField
      DisplayWidth = 10
      FieldName = 'MOESIGLA'
      Size = 10
    end
    object qryTSEDESCRICAO: TStringField
      DisplayWidth = 60
      FieldName = 'TSEDESCRICAO'
      Size = 60
    end
    object qryNOMERESPONSAVEL: TStringField
      DisplayWidth = 60
      FieldName = 'NOMERESPONSAVEL'
      Size = 60
    end
    object qryBANCODEB: TStringField
      DisplayWidth = 60
      FieldName = 'BANCODEB'
      Size = 60
    end
    object qryCONTACORRENTEDEB: TStringField
      DisplayWidth = 15
      FieldName = 'CONTACORRENTEDEB'
      Size = 15
    end
    object qryNUMAGENCIADEB: TStringField
      DisplayWidth = 15
      FieldName = 'NUMAGENCIADEB'
      FixedChar = True
      Size = 15
    end
    object qryNUMPARCDESCONTO: TFloatField
      DisplayWidth = 10
      FieldName = 'NUMPARCDESCONTO'
    end
    object qrySITUACAO_PLANO: TStringField
      DisplayWidth = 55
      FieldName = 'SITUACAO_PLANO'
      Size = 55
    end
    object qrySITUACAO_FUNC: TStringField
      DisplayWidth = 64
      FieldName = 'SITUACAO_FUNC'
      Size = 64
    end
    object qrySITUACAO_INT: TStringField
      DisplayWidth = 2
      FieldName = 'SITUACAO_INT'
      FixedChar = True
      Size = 2
    end
    object qrySITUACAO_INT_PLANO: TStringField
      DisplayWidth = 2
      FieldName = 'SITUACAO_INT_PLANO'
      FixedChar = True
      Size = 2
    end
    object qrySITUACAO_INT_FUNC: TStringField
      DisplayWidth = 1
      FieldName = 'SITUACAO_INT_FUNC'
      FixedChar = True
      Size = 1
    end
    object qryPLANOORIGEM: TStringField
      DisplayWidth = 50
      FieldName = 'PLANOORIGEM'
      Size = 50
    end
    object qryTCELEGENDAEXIBE: TStringField
      DisplayWidth = 10
      FieldName = 'TCELEGENDAEXIBE'
      Size = 10
    end
    object qryTCELEGENDACALC: TStringField
      DisplayWidth = 10
      FieldName = 'TCELEGENDACALC'
      Size = 10
    end
    object qryCEDIDO: TStringField
      DisplayWidth = 60
      FieldName = 'CEDIDO'
      Size = 60
    end
    object qryCODAUTOEMP: TFloatField
      DisplayWidth = 10
      FieldName = 'CODAUTOEMP'
    end
    object qryFORNCREDITO: TStringField
      DisplayWidth = 60
      FieldName = 'FORNCREDITO'
      Size = 60
    end
    object qryFLGUSAMARGEMALT: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGUSAMARGEMALT'
    end
    object qryFLGEXCEPCIONAL: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGEXCEPCIONAL'
    end
    object qryDATAMORTE: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DATAMORTE'
    end
    object qryVLRMAXPERMIT_1: TFloatField
      DisplayWidth = 10
      FieldName = 'VLRMAXPERMIT_1'
    end
    object qryDATAINICIO: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DATAINICIO'
    end
    object qryDATAFIM: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DATAFIM'
    end
    object qryVALORMAX: TStringField
      Alignment = taRightJustify
      FieldName = 'VALORMAX'
      Size = 13
    end
    object qryQTDEMESSUSP: TFloatField
      FieldName = 'QTDEMESSUSP'
    end
    object qryQTDECONTQUITADO: TFloatField
      FieldName = 'QTDECONTQUITADO'
    end
    object qryNUP: TStringField
      FieldName = 'NUP'
      EditMask = '99999.999999/9999;0;_'
    end
    object qryFLGPERDAEFETIVA: TFloatField
      FieldName = 'FLGPERDAEFETIVA'
    end
    object qryFLGACORDOJUDICIAL: TFloatField
      FieldName = 'FLGACORDOJUDICIAL'
    end
    object qrySISTEMA_AMORTIZACAO: TStringField
      DisplayWidth = 60
      FieldName = 'SISTEMA_AMORTIZACAO'
      Size = 60
    end
  end
  object dtsHistMov: TwwDataSource
    AutoEdit = False
    DataSet = qryHistMov
    Left = 329
    Top = 390
  end
  object updHistMovVirtual: TUpdateSQL
    ModifySQL.Strings = (
      'update HISTMOVEMPTMO'
      'set'
      '  ITEDESCRICAO = :ITEDESCRICAO,'
      '  EVENTO = :EVENTO,'
      '  ANOMES = :ANOMES,'
      '  HMEANOCOMPETENCIA = :HMEANOCOMPETENCIA,'
      '  HMEMESCOMPETENCIA = :HMEMESCOMPETENCIA,'
      '  HMESEQCOBRANCA = :HMESEQCOBRANCA,'
      '  HMETIPOMOV = :HMETIPOMOV,'
      '  IDCONTRATOEMPTMO = :IDCONTRATOEMPTMO,'
      '  IDITEMEMPTMO = :IDITEMEMPTMO,'
      '  HMEDATAPREVISTA = :HMEDATAPREVISTA,'
      '  HMEVLRPREVISTO = :HMEVLRPREVISTO,'
      '  HMESALDODEV = :HMESALDODEV,'
      '  HMETXJUROS = :HMETXJUROS,'
      '  HMEPARCELA = :HMEPARCELA'
      'where'
      '  IDCONTRATOEMPTMO = :OLD_IDCONTRATOEMPTMO')
    InsertSQL.Strings = (
      'insert into HISTMOVEMPTMO'
      
        '  (ITEDESCRICAO, EVENTO, ANOMES, HMEANOCOMPETENCIA, HMEMESCOMPET' +
        'ENCIA, '
      
        '   HMESEQCOBRANCA, HMETIPOMOV, IDCONTRATOEMPTMO, IDITEMEMPTMO, H' +
        'MEDATAPREVISTA, '
      '   HMEVLRPREVISTO, HMESALDODEV, HMETXJUROS, HMEPARCELA)'
      'values'
      
        '  (:ITEDESCRICAO, :EVENTO, :ANOMES, :HMEANOCOMPETENCIA, :HMEMESC' +
        'OMPETENCIA, '
      
        '   :HMESEQCOBRANCA, :HMETIPOMOV, :IDCONTRATOEMPTMO, :IDITEMEMPTM' +
        'O, :HMEDATAPREVISTA, '
      '   :HMEVLRPREVISTO, :HMESALDODEV, :HMETXJUROS, :HMEPARCELA)')
    DeleteSQL.Strings = (
      'delete from HISTMOVEMPTMO'
      'where'
      '  IDCONTRATOEMPTMO = :OLD_IDCONTRATOEMPTMO')
    Left = 868
    Top = 234
  end
  object dtsHistMovVirtual: TwwDataSource
    AutoEdit = False
    DataSet = qryHistMovVirtual
    Left = 868
    Top = 220
  end
  object qryHistMovVirtual: TwwQuery
    CachedUpdates = True
    AfterClose = qryHistMovVirtualAfterClose
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   '#39'12345678901234567890123456789012345678901234567890'#39' AS ITEDE' +
        'SCRICAO,'
      '   '#39'Atualização Débito'#39' AS EVENTO,'
      '   '#39'0000/00'#39' AS ANOMES,'
      ''
      
        '   HME.HMEANOCOMPETENCIA, HME.HMEMESCOMPETENCIA, HME.HMESEQCOBRA' +
        'NCA ,'
      
        '   HME.HMETIPOMOV       , HME.IDCONTRATOEMPTMO , HME.IDITEMEMPTM' +
        'O   ,'
      
        '   HME.HMEDATAPREVISTA  , HME.HMEVLRPREVISTO   , NVL(HME.HMESALD' +
        'ODEV, 0) AS HMESALDODEV,'
      '   HME.HMETXJUROS       , HME.HMEPARCELA'
      ''
      'FROM'
      '   HISTMOVEMPTMO HME'
      ''
      'WHERE'
      '   ( HME.IDCONTRATOEMPTMO = -1 )')
    UpdateObject = updHistMovVirtual
    ValidateWithMask = True
    Left = 868
    Top = 204
    object qryHistMovVirtualHMEANOCOMPETENCIA: TFloatField
      FieldName = 'HMEANOCOMPETENCIA'
    end
    object qryHistMovVirtualHMEMESCOMPETENCIA: TFloatField
      FieldName = 'HMEMESCOMPETENCIA'
    end
    object qryHistMovVirtualHMESEQCOBRANCA: TFloatField
      FieldName = 'HMESEQCOBRANCA'
    end
    object qryHistMovVirtualHMETIPOMOV: TFloatField
      FieldName = 'HMETIPOMOV'
    end
    object qryHistMovVirtualHMEDATAPREVISTA: TDateTimeField
      FieldName = 'HMEDATAPREVISTA'
      DisplayFormat = 'DD/MM/YYYY'
    end
    object qryHistMovVirtualHMEVLRPREVISTO: TFloatField
      FieldName = 'HMEVLRPREVISTO'
      DisplayFormat = '#,##0.00;(#,##0.00)'
      EditFormat = '#,##0.00;(#,##0.00)'
    end
    object qryHistMovVirtualHMESALDODEV: TFloatField
      FieldName = 'HMESALDODEV'
      DisplayFormat = '#,##0.00;(#,##0.00)'
      EditFormat = '#,##0.00;(#,##0.00)'
    end
    object qryHistMovVirtualHMETXJUROS: TFloatField
      FieldName = 'HMETXJUROS'
      DisplayFormat = '#,##0.00;(#,##0.00)'
      EditFormat = '#,##0.00;(#,##0.00)'
    end
    object qryHistMovVirtualHMEPARCELA: TFloatField
      FieldName = 'HMEPARCELA'
      DisplayFormat = '#00'
      EditFormat = '#00'
    end
    object qryHistMovVirtualEVENTO: TStringField
      FieldName = 'EVENTO'
      FixedChar = True
      Size = 18
    end
    object qryHistMovVirtualANOMES: TStringField
      Alignment = taCenter
      FieldName = 'ANOMES'
      FixedChar = True
      Size = 7
    end
    object qryHistMovVirtualITEDESCRICAO: TStringField
      FieldName = 'ITEDESCRICAO'
      FixedChar = True
      Size = 50
    end
    object qryHistMovVirtualIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryHistMovVirtualIDITEMEMPTMO: TFloatField
      FieldName = 'IDITEMEMPTMO'
    end
  end
  object qryItensAberto: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    Constrained = True
    SQL.Strings = (
      'SELECT'
      '   COUNT(HME.IDITEMEMPTMO)         AS QUANT_ABERTO,'
      '   SUM(NVL(HME.HMEVLRPREVISTO, 0)) AS VALOR_TOTAL_ABERTO,'
      '   IRC.ITEDESCRICAO,'
      ''
      '   -- Paulo Nobre - TAS000000006779 - Inicio'
      ''
      
        '--   TO_CHAR(HME.HMEMESCOMPETENCIA, '#39'00'#39') || '#39'/'#39' || HME.HMEANOCO' +
        'MPETENCIA AS ANOMESCOMP,'
      
        '--   TO_CHAR(HME.HMEMESCOBRANCA, '#39'00'#39')    || '#39'/'#39' || HME.HMEANOCO' +
        'BRANCA    AS ANOMESCOBR,'
      ''
      
        '   CAST( (TO_CHAR(HME.HMEMESCOMPETENCIA, '#39'00'#39') || '#39'/'#39' || HME.HME' +
        'ANOCOMPETENCIA) AS VARCHAR2(2)) AS ANOMESCOMP,'
      
        '   CAST( (TO_CHAR(HME.HMEMESCOBRANCA, '#39'00'#39')    || '#39'/'#39' || HME.HME' +
        'ANOCOBRANCA) AS VARCHAR2(2)) AS ANOMESCOBR,'
      ''
      '   -- Paulo Nobre - TAS000000006779 - Fim'
      ''
      '   NVL(HME.FLGENVIO, 1)     AS FLGENVIO,'
      '   NVL(HME.FLGBAIXADO, 1)   AS FLGBAIXADO,'
      '   NVL(HME.FLGESTORNADO, 0) AS FLGESTORNADO,'
      ''
      
        '   HME.HMEANOCOMPETENCIA, HME.HMEMESCOMPETENCIA, HME.HMESEQCOBRA' +
        'NCA ,'
      
        '   HME.HMETIPOMOV       , HME.IDCONTRATOEMPTMO , HME.IDITEMEMPTM' +
        'O   ,'
      '   HME.HMEDATAPREVISTA  , HME.HMEDATAVENCTO,'
      ''
      '   NVL(HME.HMEVLRPREVISTO, 0) AS HMEVLRPREVISTO,'
      '   NVL(HME.HMESALDODEV, 0) AS HMESALDODEV,'
      ''
      
        '   HME.HMETXJUROS       , HME.HMEPARCELA       , HME.HMEDATAEFET' +
        'IVA ,'
      
        '   HME.HMEDATAATUALIZA  , HME.HMEVLREFETIVO    , HME.PLNCODIGO  ' +
        '    ,'
      '   HME.PLNCODIGOESTORNO , HME.CODDOCUMENTO     ,'
      '   HME.IDRUBRICA        ,'
      ''
      '   HME.HMEFORMACOBRANCA,'
      
        '   DECODE(HME.HMEFORMACOBRANCA, '#39'C'#39', '#39'Conta'#39', '#39'F'#39', '#39'Folha'#39') AS F' +
        'ORMA_COBRANCA,'
      ''
      '   ITC.ITCSEQCALCULO,'
      ''
      '   DECODE(HME.HMETIPOMOV,'
      '          0, '#39'Concessão/Renovação'#39','
      '          1, '#39'Prestação '#39','
      '          2, '#39'Amortização/Refinanciamento'#39','
      '          3, '#39'Quitação'#39','
      '          4, '#39'Atualização de Débito'#39','
      '          5, '#39'Atualização de Saldo (Diária)'#39' ,'
      '          6, '#39'Importação/Migração'#39','
      '          7, '#39'Ajustes (Cobrança/Devolução)'#39','
      '          8, '#39'Ajustes (Saldo Devedor)'#39
      '         ) AS EVENTO'
      ''
      'FROM'
      '   HISTMOVEMPTMO  HME,'
      '   CONTRATOEMPTMO CON,'
      '   TIPOSUSPEMPTMO TSE,'
      '   ITEMXTIPOCONTR ITC,'
      '   ITEMEMPTMO     IRC'
      ''
      'WHERE'
      '       HME.IDCONTRATOEMPTMO      =:PIDCONTRATOEMPTMO'
      '   AND CON.IDCONTRATOEMPTMO      =:PIDCONTRATOEMPTMO'
      '   AND HME.FLGBAIXADO            = 0'
      '   AND HME.HMEVLREFETIVO         IS NULL'
      '   AND HME.HMEDATAEFETIVA        IS NULL'
      '   AND HME.HMETIPOMOV            IN (1, 2, 3, 4, 6, 7)'
      '   AND (HME.HMECENTRALIZA        = 1 OR HME.HMEDESTACADO  = 1)'
      ''
      '   AND NVL(HME.FLGQUITADO, 0)    = 0'
      '   AND NVL(HME.FLGABONADO, 0)    = 0'
      '   AND NVL(HME.FLGESTORNADO, 0)  = 0'
      ''
      '   AND CON.IDTIPOCONTREMPTMO     = ITC.IDTIPOCONTREMPTMO'
      '   AND HME.IDITEMEMPTMO          = ITC.IDITEMEMPTMO'
      '   AND ITC.IDITEMEMPTMO          = IRC.IDITEMEMPTMO'
      '   AND HME.IDCONTRATOEMPTMO      = CON.IDCONTRATOEMPTMO'
      '   AND HME.IDTIPOSUSPEMPTMO      = TSE.IDTIPOSUSPEMPTMO(+)'
      ''
      '   AND ( (:PINIBESUSP IS NULL) OR'
      '         (:PINIBESUSP = 1      AND ('
      
        '                                   NVL(HME.FLGSUSPENSAO, 0) = 0 ' +
        'OR'
      
        '                                   (NVL(HME.FLGSUSPENSAO, 0) <> ' +
        '0 AND NVL(TSE.FLGEMABERTO, 0) = 1)'
      '                                   )'
      '         )'
      '       )'
      ''
      'GROUP BY'
      '   IRC.ITEDESCRICAO,'
      ''
      '   -- Paulo Nobre - TAS000000006779 - Inicio'
      ''
      
        '--   TO_CHAR(HME.HMEMESCOMPETENCIA, '#39'00'#39') || '#39'/'#39' || HME.HMEANOCO' +
        'MPETENCIA,'
      
        '--   TO_CHAR(HME.HMEMESCOBRANCA, '#39'00'#39')    || '#39'/'#39' || HME.HMEANOCO' +
        'BRANCA,'
      ''
      
        '   CAST( (TO_CHAR(HME.HMEMESCOMPETENCIA, '#39'00'#39') || '#39'/'#39' || HME.HME' +
        'ANOCOMPETENCIA) AS VARCHAR2(2)),'
      
        '   CAST( (TO_CHAR(HME.HMEMESCOBRANCA, '#39'00'#39')    || '#39'/'#39' || HME.HME' +
        'ANOCOBRANCA) AS VARCHAR2(2)),'
      ''
      
        '   -- Paulo Nobre - TAS000000006779 - Fim                       ' +
        '                           '
      ''
      '   HME.FLGENVIO, HME.FLGBAIXADO, HME.FLGESTORNADO,'
      
        '   HME.HMEANOCOMPETENCIA, HME.HMEMESCOMPETENCIA, HME.HMESEQCOBRA' +
        'NCA ,'
      
        '   HME.HMETIPOMOV       , HME.IDCONTRATOEMPTMO , HME.IDITEMEMPTM' +
        'O   ,'
      '   HME.HMEDATAPREVISTA  , HME.HMEDATAVENCTO,'
      '   HME.HMEVLRPREVISTO   ,  HME.HMESALDODEV,'
      
        '   HME.HMETXJUROS       , HME.HMEPARCELA       , HME.HMEDATAEFET' +
        'IVA ,'
      
        '   HME.HMEDATAATUALIZA  , HME.HMEVLREFETIVO    , HME.PLNCODIGO  ' +
        '    ,'
      '   HME.PLNCODIGOESTORNO , HME.CODDOCUMENTO     ,'
      '   HME.IDRUBRICA        ,'
      '   HME.HMEFORMACOBRANCA,'
      '   ITC.ITCSEQCALCULO,'
      '   HME.HMETIPOMOV'
      ''
      'ORDER BY'
      '   HME.HMEPARCELA,'
      '   HME.HMETIPOMOV,'
      '   HME.HMEANOCOMPETENCIA,'
      '   HME.HMEMESCOMPETENCIA,'
      '   HME.HMESEQCOBRANCA,'
      '   ITC.ITCSEQCALCULO'
      ''
      ''
      ''
      '')
    ValidateWithMask = True
    Left = 241
    Top = 339
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
        Value = '45209'
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PINIBESUSP'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PINIBESUSP'
        ParamType = ptInput
      end>
    object qryItensAbertoITEDESCRICAO: TStringField
      FieldName = 'ITEDESCRICAO'
      Size = 40
    end
    object qryItensAbertoANOMESCOMP: TStringField
      FieldName = 'ANOMESCOMP'
      Size = 44
    end
    object qryItensAbertoANOMESCOBR: TStringField
      FieldName = 'ANOMESCOBR'
      Size = 44
    end
    object qryItensAbertoFLGENVIO: TFloatField
      FieldName = 'FLGENVIO'
    end
    object qryItensAbertoFLGBAIXADO: TFloatField
      FieldName = 'FLGBAIXADO'
    end
    object qryItensAbertoFLGESTORNADO: TFloatField
      FieldName = 'FLGESTORNADO'
    end
    object qryItensAbertoHMEANOCOMPETENCIA: TFloatField
      FieldName = 'HMEANOCOMPETENCIA'
    end
    object qryItensAbertoHMEMESCOMPETENCIA: TFloatField
      FieldName = 'HMEMESCOMPETENCIA'
    end
    object qryItensAbertoHMESEQCOBRANCA: TFloatField
      FieldName = 'HMESEQCOBRANCA'
    end
    object qryItensAbertoHMETIPOMOV: TFloatField
      FieldName = 'HMETIPOMOV'
    end
    object qryItensAbertoIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryItensAbertoIDITEMEMPTMO: TFloatField
      FieldName = 'IDITEMEMPTMO'
    end
    object qryItensAbertoHMEDATAPREVISTA: TDateTimeField
      FieldName = 'HMEDATAPREVISTA'
      DisplayFormat = 'DD/MM/YYYY'
    end
    object qryItensAbertoHMEVLRPREVISTO: TFloatField
      FieldName = 'HMEVLRPREVISTO'
      DisplayFormat = '#,##0.00;(#,##0.00)'
    end
    object qryItensAbertoHMESALDODEV: TFloatField
      FieldName = 'HMESALDODEV'
      DisplayFormat = '#,##0.00;(#,##0.00)'
    end
    object qryItensAbertoHMETXJUROS: TFloatField
      FieldName = 'HMETXJUROS'
      DisplayFormat = '#,##0.00;(#,##0.00)'
    end
    object qryItensAbertoHMEPARCELA: TFloatField
      FieldName = 'HMEPARCELA'
    end
    object qryItensAbertoHMEDATAEFETIVA: TDateTimeField
      FieldName = 'HMEDATAEFETIVA'
      DisplayFormat = 'DD/MM/YYYY'
    end
    object qryItensAbertoHMEDATAATUALIZA: TDateTimeField
      FieldName = 'HMEDATAATUALIZA'
      DisplayFormat = 'DD/MM/YYYY'
    end
    object qryItensAbertoHMEVLREFETIVO: TFloatField
      FieldName = 'HMEVLREFETIVO'
      DisplayFormat = '#,##0.00;(#,##0.00)'
    end
    object qryItensAbertoPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
    end
    object qryItensAbertoPLNCODIGOESTORNO: TFloatField
      FieldName = 'PLNCODIGOESTORNO'
    end
    object qryItensAbertoCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object qryItensAbertoIDRUBRICA: TFloatField
      FieldName = 'IDRUBRICA'
    end
    object qryItensAbertoEVENTO: TStringField
      FieldName = 'EVENTO'
      Size = 18
    end
    object qryItensAbertoHMEFORMACOBRANCA: TStringField
      FieldName = 'HMEFORMACOBRANCA'
      FixedChar = True
      Size = 1
    end
    object qryItensAbertoFORMA_COBRANCA: TStringField
      FieldName = 'FORMA_COBRANCA'
      Size = 5
    end
    object qryItensAbertoHMEDATAVENCTO: TDateTimeField
      FieldName = 'HMEDATAVENCTO'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryItensAbertoITCSEQCALCULO: TFloatField
      FieldName = 'ITCSEQCALCULO'
    end
    object qryItensAbertoQUANT_ABERTO: TFloatField
      FieldName = 'QUANT_ABERTO'
    end
    object qryItensAbertoVALOR_TOTAL_ABERTO: TFloatField
      FieldName = 'VALOR_TOTAL_ABERTO'
    end
  end
  object dtsItensAberto: TwwDataSource
    AutoEdit = False
    DataSet = qryItensAberto
    Left = 240
    Top = 399
  end
  object qryParcelasRestantes: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   PARCELAS_RESTANTES'
      'FROM'
      '   VW_MOVEP'
      'WHERE'
      '    IDCONTRATOEMPTMO = :PIDCONTRATOEMPTMO'
      'AND HMETIPOMOV <> 5'
      'AND (FLGESTORNADO IS NULL OR FLGESTORNADO = 0)'
      'AND (HMECENTRALIZA = 1 OR HMEDESTACADO = 1)'
      'ORDER BY'
      '   PARCELAS_RESTANTES ASC'
      '')
    ValidateWithMask = True
    Left = 540
    Top = 260
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end>
    object qryParcelasRestantesPARCELAS_RESTANTES: TFloatField
      FieldName = 'PARCELAS_RESTANTES'
      Origin = 'BASEDADOS.VW_MOVEP.PARCELAS_RESTANTES'
    end
  end
  object qryBenefSeguro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   CXB.IDINSCRICAOEMPTMO,'
      '   CXB.IDBENEFSEGURO,'
      '   CXB.PERCINDENIZACAO,'
      '   CXB.VLRSALDOREC,'
      '   CXB.VLRREPASSE,'
      '   CXB.DATAREPASSE,'
      
        '   CXB.NUMBANCO || '#39' / '#39' || CXB.CODAGENCIA || '#39' / '#39' || CXB.CONTA' +
        'CORRENTE AS BANCO,'
      '   CXB.NOME,'
      '   CXB.OBS'
      'FROM'
      '   CONTRATOXBENEFSEG CXB'
      'WHERE'
      '   CXB.IDINSCRICAOEMPTMO =:PIDINSCRICAOEMPTMO')
    ValidateWithMask = True
    Left = 868
    Top = 520
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDINSCRICAOEMPTMO'
        ParamType = ptInput
      end>
    object qryBenefSeguroNOME: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 38
      FieldName = 'NOME'
      Origin = 'BASEDADOS.CONTRATOXBENEFSEG.NOME'
      Size = 60
    end
    object qryBenefSeguroPERCINDENIZACAO: TFloatField
      DisplayLabel = '%'
      DisplayWidth = 5
      FieldName = 'PERCINDENIZACAO'
      Origin = 'BASEDADOS.CONTRATOXBENEFSEG.PERCINDENIZACAO'
    end
    object qryBenefSeguroBANCO: TStringField
      DisplayLabel = 'Conta Corrente'
      DisplayWidth = 20
      FieldName = 'BANCO'
      Origin = 'BASEDADOS.CONTRATOXBENEFSEG.NUMBANCO'
      Size = 66
    end
    object qryBenefSeguroVLRSALDOREC: TFloatField
      DisplayLabel = 'Vlr Fundação'
      DisplayWidth = 13
      FieldName = 'VLRSALDOREC'
      Origin = 'BASEDADOS.CONTRATOXBENEFSEG.VLRSALDOREC'
    end
    object qryBenefSeguroVLRREPASSE: TFloatField
      DisplayLabel = 'Vlr. Benef.'
      DisplayWidth = 13
      FieldName = 'VLRREPASSE'
      Origin = 'BASEDADOS.CONTRATOXBENEFSEG.VLRREPASSE'
    end
    object qryBenefSeguroDATAREPASSE: TDateTimeField
      DisplayLabel = 'Data Depósito'
      DisplayWidth = 11
      FieldName = 'DATAREPASSE'
      Origin = 'BASEDADOS.CONTRATOXBENEFSEG.DATAREPASSE'
    end
    object qryBenefSeguroIDINSCRICAOEMPTMO: TFloatField
      FieldName = 'IDINSCRICAOEMPTMO'
      Origin = 'BASEDADOS.CONTRATOXBENEFSEG.IDINSCRICAOEMPTMO'
      Visible = False
    end
    object qryBenefSeguroIDBENEFSEGURO: TFloatField
      FieldName = 'IDBENEFSEGURO'
      Origin = 'BASEDADOS.CONTRATOXBENEFSEG.IDBENEFSEGURO'
      Visible = False
    end
    object qryBenefSeguroOBS: TStringField
      FieldName = 'OBS'
      Origin = 'BASEDADOS.CONTRATOXBENEFSEG.OBS'
      Visible = False
      Size = 200
    end
  end
  object dsBenefSeguro: TDataSource
    DataSet = qryBenefSeguro
    Left = 868
    Top = 508
  end
  object qryTotalizaAberto: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    Constrained = True
    SQL.Strings = (
      'SELECT'
      '   COUNT(HME.IDITEMEMPTMO)         AS QUANT_ABERTO,'
      '   SUM(NVL(HME.HMEVLRPREVISTO, 0)) AS VALOR_TOTAL_ABERTO'
      ''
      'FROM'
      '   HISTMOVEMPTMO  HME,'
      '   CONTRATOEMPTMO CON,'
      '   TIPOSUSPEMPTMO TSE'
      ''
      'WHERE'
      '       HME.IDCONTRATOEMPTMO      =:PIDCONTRATOEMPTMO'
      
        'AND HME.HMEDATAPREVISTA  < TO_DATE(:PHMEDATAPREVISTA,'#39'DD/MM/YYYY' +
        #39')  '
      ' AND HME.FLGBAIXADO            = 0'
      '   AND HME.HMEVLREFETIVO         IS NULL'
      '   AND HME.HMEDATAEFETIVA        IS NULL'
      '   AND HME.HMETIPOMOV            IN (1, 2, 3, 4, 6, 7)'
      '   AND (HME.HMECENTRALIZA        = 1 OR HME.HMEDESTACADO = 1)'
      '   AND NVL(HME.FLGQUITADO, 0)    = 0'
      '   AND NVL(HME.FLGABONADO, 0)    = 0'
      '   AND NVL(HME.FLGESTORNADO, 0)  = 0'
      '   AND CON.IDCONTRATOEMPTMO      = HME.IDCONTRATOEMPTMO'
      ''
      '   AND HME.IDTIPOSUSPEMPTMO      = TSE.IDTIPOSUSPEMPTMO(+)'
      ''
      '   AND ( (:PINIBESUSP IS NULL)   OR'
      '         (:PINIBESUSP = 1        AND ('
      
        '                                     NVL(HME.FLGSUSPENSAO, 0) = ' +
        '0 OR'
      
        '                                     (NVL(HME.FLGSUSPENSAO, 0) <' +
        '> 0 AND NVL(TSE.FLGEMABERTO, 0) = 1)'
      '                                     )'
      '         )'
      '       )')
    ValidateWithMask = True
    Left = 868
    Top = 403
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
        Value = '45209'
      end
      item
        DataType = ftUnknown
        Name = 'PHMEDATAPREVISTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PINIBESUSP'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PINIBESUSP'
        ParamType = ptInput
      end>
    object qryTotalizaAbertoQUANT_ABERTO: TFloatField
      FieldName = 'QUANT_ABERTO'
    end
    object qryTotalizaAbertoVALOR_TOTAL_ABERTO: TFloatField
      FieldName = 'VALOR_TOTAL_ABERTO'
    end
  end
  object dtsTotalizaAberto: TwwDataSource
    AutoEdit = False
    DataSet = qryTotalizaAberto
    Left = 872
    Top = 387
  end
  object qryHistMov: TwwQuery
    CachedUpdates = True
    AfterScroll = qryHistMovAfterScroll
    AutoRefresh = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT ite.itedescricao,'
      '       to_char(hme.dataprevista,'#39'MM/YYYY'#39') AS ANOMESCOMP,'
      '       to_char(hme.datavencto,'#39'MM/YYYY'#39') AS ANOMESCOBR,'
      '       to_char(hme.dataprevista,'#39'YYYYMM'#39') AS ANOMESCOMPET,'
      '       to_char(hme.datavencto,'#39'YYYYMM'#39') AS ANOMESCOB,'
      '       hme.flgenvio,'
      '       hme.flgbaixado AS FLGBAIXADO,'
      '       DECODE(hme.flgquitabonoestorno, 3, 1, 0) AS FLGESTORNADO,'
      '       DECODE(hme.flgquitabonoestorno, 2, 1, 0) AS FLGABONADO,'
      '       DECODE(hme.flgquitabonoestorno, 1, 1, 0) AS FLGQUITADO,'
      '       hme.flgbaixamanual AS FLGBAIXAMANUAL,'
      '       (SELECT ht.flgdivergpend'
      '        FROM hmetratadiverg ht'
      
        '        WHERE ht.idhistmovemptmo = hme.idhistmovemptmo) AS FLGDI' +
        'VERGPEND,'
      '       NVL2(hme.idtiposuspemptmo,1,0) AS FLGSUSPENSAO,'
      '       (SELECT ht.flgtipodiverg'
      '        FROM hmetratadiverg ht'
      
        '        WHERE ht.idhistmovemptmo = hme.idhistmovemptmo) AS FLGTI' +
        'PODIVERG,'
      '       (SELECT ht.flgdivergtrat'
      '        FROM hmetratadiverg ht'
      
        '        WHERE ht.idhistmovemptmo = hme.idhistmovemptmo) AS FLGDI' +
        'VERGTRAT,'
      '       hme.flgentradamanual AS FLGENTRADAMANUAL,'
      '       DECODE(hme.flgenvio, 1, '#39'Sim'#39', NULL) AS ENVIADO,'
      '       DECODE(hme.naturezaitem, 2, 1, 0) AS HMECENTRALIZA, '
      '       DECODE(hme.naturezaitem, 1, 1, 0) AS HMEDESTACADO,'
      
        '       to_number(to_char(hme.dataprevista,'#39'YYYY'#39')) AS HMEANOCOMP' +
        'ETENCIA, '
      
        '       to_number(to_char(hme.dataprevista,'#39'MM'#39')) AS HMEMESCOMPET' +
        'ENCIA, '
      '       hme.seqcobranca AS HMESEQCOBRANCA,'
      '       hme.tipomov AS HMETIPOMOV, '
      '       hme.idcontratoemptmo, '
      '       hme.iditememptmo,'
      '       hme.dataprevista AS HMEDATAPREVISTA,'
      
        '       DECODE(itc.itctratasaldodev, 1, '#39'(-)'#39', 2, '#39'(+)'#39', '#39'   '#39') A' +
        'S TIPO_OPERACAO,'
      '       hme.vlrprevisto AS HMEVLRPREVISTO,'
      '       hme.saldodev AS HMESALDODEV,'
      '       hme.vlrbase AS  HMEVLRBASE,'
      '       hme.dataprevista AS  HMEDATA,'
      '       hme.dataefetiva AS HMEDATAEFETIVAORIG,'
      '       hme.vlrefetivo AS HMEVLREFETIVOORIG,'
      
        '       DECODE(hme.flgquitabonoestorno, 3, NULL, NVL(hme.dataquit' +
        'abonoestorno, hme.dataefetiva)) AS HMEDATAEFETIVA,'
      
        '       TO_NUMBER(DECODE(hme.flgquitabonoestorno, 3, NULL, NVL2(h' +
        'me.dataquitabonoestorno, hme.vlrprevisto, hme.vlrefetivo))) AS H' +
        'MEVLREFETIVO,'
      ''
      '       -- Paulo Nobre - TAS000000007015 - Inicio'
      '       -- Paulo Nobre - TAS000000006779 - Inicio'
      ''
      '       CAST(decode(LENGTH(to_char(NVL(hme.numparcelas, 0))), 3,'
      '       to_char(NVL(hme.parcelaalt, 0), '#39'000'#39') || '#39' / '#39' ||'
      '       to_char(NVL(hme.parcela, 0), '#39'000'#39') || '#39' / '#39' ||'
      '       to_char(NVL(hme.numparcelas, 0), '#39'000'#39'),'
      '       to_char(NVL(hme.parcelaalt, 0), '#39'000'#39') || '#39' / '#39' ||'
      '       to_char(NVL(hme.parcela, 0), '#39'000'#39') || '#39' / '#39' ||'
      
        '       to_char(NVL(hme.numparcelas, 0), '#39'000'#39')) AS VARCHAR2(21))' +
        ' as CONCAT_PARCELAS,'
      ''
      '       -- Paulo Nobre - TAS000000006779 - Fim'
      '       -- Paulo Nobre - TAS000000007015 - Fim       '
      ''
      '       hme.parcela AS HMEPARCELA, '
      '       hme.parcelaalt AS HMEPARCELAALT, '
      '       hme.numparcelas AS HMENUMPARCELAS,'
      '       con.txjuros AS HMETXJUROS,'
      '       hme.dataprevista AS HMEDATAATUALIZA,'
      '       (SELECT hcontab.plncodigo'
      '        FROM hmecontabilizacao hcontab'
      
        '        WHERE hcontab.idhistmovemptmo = hme.idhistmovemptmo) AS ' +
        'PLNCODIGO,'
      '       (SELECT hcontab.plncodigoestorno'
      '        FROM hmecontabilizacao hcontab'
      
        '        WHERE hcontab.idhistmovemptmo = hme.idhistmovemptmo) AS ' +
        'PLNCODIGOESTORNO,'
      '       (SELECT he.coddocumento'
      '        FROM hmeenvio he'
      
        '        WHERE he.idhistmovemptmo = hme.idhistmovemptmo) AS CODDO' +
        'CUMENTO,'
      '       hme.idrubrica,'
      ''
      '       -- Paulo Nobre - WO30535 - Inicio'
      '       --hme.datavencto AS HMEDATAVENCTO,'
      '       hst.HMEDATAVENCTO,'
      '       -- Paulo Nobre - WO30535 - Fim'
      ''
      '       DECODE(hme.tipomov, 0, '#39'Concessão/Renovação'#39','
      '                           1, '#39'Prestação '#39','
      '                           2, '#39'Amortização/Refinanciamento'#39','
      
        '                           3, DECODE(hme.origem, 8, '#39'Quitação po' +
        'r Falecimento'#39', '#39'Quitação'#39'),'
      '                           4, '#39'Atualização de Débito'#39','
      '                           5, '#39'Atualização de Saldo (Diária)'#39' ,'
      '                           6, '#39'Importação/Migração'#39','
      '                           7, '#39'Ajustes (Cobrança/Devolução)'#39','
      
        '                           8, '#39'Ajustes (Saldo Devedor)'#39') AS EVEN' +
        'TO,'
      '       DECODE(hme.origem, 0, '#39'Concessão/Renovação'#39','
      '                          1, '#39'Geração de Parcelas'#39','
      '                          2, '#39'Amortização/Refinanciamento'#39','
      '                          3, '#39'Quitação Antecipada'#39','
      '                          4, '#39'Tratamento de Divergências'#39','
      '                          5, '#39'Atualização de Saldo (Diária)'#39','
      '                          6, '#39'Recálculo Diário'#39','
      '                          7, '#39'Tratamento Individual'#39','
      '                          8, '#39'Quitação por Morte/Invalidez'#39','
      '                          9, '#39'Importação/Migração'#39','
      '                         10, '#39'Quitação por Resgate'#39','
      '                         --11, '#39'Recebimento'#39',         '
      
        '                         11, DECODE(TMP_ORI.PRESTPARCIAL,'#39'1'#39', '#39'P' +
        'restação Parcial'#39', NULL , '#39'Recebimento'#39'),'
      '                         12, '#39'Entrada Manual'#39','
      '                         13, '#39'Alteração de Concessão'#39','
      
        '                         14, '#39'Tratamento de Valores Não Programa' +
        'dos'#39','
      '                         15, '#39'Consulta de Contratos'#39','
      '                         16, '#39'Cancelamento de Concessão'#39','
      '                         17, '#39'Alteração Contratual'#39','
      '                         18, '#39'Liberação de Concessão'#39','
      '                         19, '#39'Envio'#39','
      
        '                         20, '#39'Tratamento de Itens não Recebidos'#39 +
        ','
      
        '                         21, '#39'Lançamento de Prestações Atualizad' +
        'as'#39','
      '                         23, '#39'Envio de Concessão em Lote'#39','
      '                         24, '#39'Envio de Seguros em Lote'#39','
      '                         25, '#39'Auto Atendimento Web'#39','
      
        '                         41, '#39'Contabilização em Lote de Concessã' +
        'o'#39','
      
        '                         42, '#39'Contabilização em Lote de Prestaçã' +
        'o'#39','
      
        '                         43, '#39'Contabilização em Lote de Amortiza' +
        'ção'#39','
      
        '                         44, '#39'Contabilização em Lote de Quitação' +
        #39','
      
        '                         45, '#39'Contabilização em Lote de Encargos' +
        #39','
      
        '                         46, '#39'Contabilização em Lote de Atualiza' +
        'ção Diária'#39','
      
        '                         47, '#39'Contabilização em Lote de Ajustes'#39 +
        ','
      '                         51, '#39'Desfazer Geração de Parcelas'#39','
      '                         52, '#39'Cancelamento de Amortização'#39','
      '                         53, '#39'Cancelamento de Quitação'#39','
      '                         61, '#39'Desfazer Envio'#39','
      '                         62, '#39'Desfazer Recebimento'#39','
      
        '                         63, '#39'Desfazer Envio de Concessão em Lot' +
        'e'#39','
      
        '                         64, '#39'Desfazer Envio de Seguros em Lote'#39 +
        ','
      
        '                         71, '#39'Desfazer Contabilização em Lote de' +
        ' Concessão'#39','
      
        '                         72, '#39'Desfazer Contabilização em Lote de' +
        ' Prestação'#39','
      
        '                         73, '#39'Desfazer Contabilização em Lote de' +
        ' Amortização'#39','
      
        '                         74, '#39'Desfazer Contabilização em Lote de' +
        ' Quitação'#39','
      
        '                         75, '#39'Desfazer Contabilização em Lote de' +
        ' Encargos'#39','
      
        '                         76, '#39'Desfazer Contabilização em Lote de' +
        ' Atualização Diária'#39','
      
        '                         77, '#39'Desfazer Contabilização em Lote de' +
        ' Ajustes'#39') AS ORIGEM,'
      '       (SELECT DECODE(tmp.sitenvio, '#39'0'#39', '#39'Em cobrança'#39','
      '                                    '#39'1'#39', '#39'Rec. Diverg.'#39','
      '                                    '#39'2'#39', '#39'Rec. OK'#39','
      '                                    '#39'X'#39', '#39'NÃO Recebido'#39','
      '                                    '#39'9'#39', '#39'Baixado EP'#39')'
      '        FROM hmeenvio hev'
      '             JOIN tmpdesc tmp ON tmp.idtmpdesc = hev.idtmpdesc'
      
        '        WHERE hev.idhistmovemptmo = hme.idhistmovemptmo) AS SITE' +
        'NVIO,'
      '       (SELECT doc.nodocumento'
      '        FROM hmeenvio hev'
      
        '             JOIN documento doc ON doc.coddocumento = hev.coddoc' +
        'umento'
      
        '        WHERE hev.idhistmovemptmo = hme.idhistmovemptmo) AS NODO' +
        'CUMENTO, '
      
        '       (SELECT DECODE(doc.status, '#39'0'#39', '#39'Em aberto'#39', '#39'2'#39', '#39'Baixad' +
        'o'#39', '#39#39')'
      '        FROM hmeenvio hev'
      
        '             JOIN documento doc ON doc.coddocumento = hev.coddoc' +
        'umento'
      
        '        WHERE hev.idhistmovemptmo = hme.idhistmovemptmo) AS STAT' +
        'US_DOC,'
      '       hme.trgdtinclusao,'
      '       hme.trguserinclusao,'
      
        '       DECODE(hme.formacobranca, '#39'C'#39', '#39'Financeiro'#39', '#39'F'#39', '#39'Folha'#39 +
        ', '#39#39') AS FORMACOBRANCA,'
      
        '       DECODE(hme.tipofolha, '#39'B'#39', '#39'Benefício'#39', '#39'P'#39', '#39'Patrocinado' +
        'ra'#39', '#39#39') AS TIPOFOLHA,'
      '       hme.datareceb AS HMEdatareceb,'
      '       (SELECT ht.datadivergtrat'
      '        FROM hmetratadiverg ht'
      
        '        WHERE ht.idhistmovemptmo = hme.idhistmovemptmo) AS HMEDA' +
        'TADIVERGTRAT, '
      '       (SELECT ht.flgtipodivergtrat'
      '        FROM hmetratadiverg ht'
      
        '        WHERE ht.idhistmovemptmo = hme.idhistmovemptmo) AS FLGTI' +
        'PODIVERGTRAT,'
      
        '       TO_DATE(DECODE(hme.flgquitabonoestorno, 3, NULL, hme.data' +
        'quitabonoestorno),'#39'DD/MM/YYYY'#39') AS HMEDATAQUITABONO,'
      
        '       TO_DATE(DECODE(hme.flgquitabonoestorno, 3, hme.dataquitab' +
        'onoestorno, NULL),'#39'DD/MM/YYYY'#39') AS HMEDATAESTORNO, '
      '       hme.dataestornoalt AS HMEDATAESTORNOALT,'
      '       (SELECT hev.dataenvio'
      '        FROM hmeenvio hev'
      
        '        WHERE hev.idhistmovemptmo = hme.idhistmovemptmo) AS HMED' +
        'ATAENVIO,'
      '       (SELECT pln.plnplanil'
      '        FROM hmecontabilizacao hcontab'
      
        '             JOIN planilha pln ON pln.plncodigo = hcontab.plncod' +
        'igo'
      
        '        WHERE hcontab.idhistmovemptmo = hme.idhistmovemptmo) AS ' +
        'PLNPLANIL, '
      '       (SELECT pla.plnplanil'
      '        FROM hmecontabilizacao hcontab'
      
        '             JOIN planilha pla ON pla.plncodigo = hcontab.plncod' +
        'igoestorno'
      
        '        WHERE hcontab.idhistmovemptmo = hme.idhistmovemptmo) AS ' +
        'PLANIL_ESTORNO,'
      '       (SELECT usu.nomeusuario'
      '        FROM usuariosistema usu'
      
        '        WHERE to_char(usu.idusuario) = SUBSTR(hme.trguserinclusa' +
        'o,3)) AS NOMEUSUARIO,'
      '       (SELECT us.nomeusuario'
      '        FROM usuariosistema us'
      
        '        WHERE us.idusuario = hme.idusuarioestorno) AS USU_ESTORN' +
        'O,'
      '       hme.idhistmovemptmo,'
      
        '       to_number(to_char(hme.datavencto,'#39'MM'#39')) AS HMEMESCOBRANCA' +
        ','
      
        '       to_number(to_char(hme.datavencto,'#39'YYYY'#39')) AS HMEANOCOBRAN' +
        'CA,'
      '       (SELECT hcontab.ccdebfinan'
      '        FROM hmecontabilizacao hcontab'
      
        '        WHERE hcontab.idhistmovemptmo = hme.idhistmovemptmo) AS ' +
        'CCDEBFINAN,'
      '       (SELECT hcontab.cccredfinan'
      '        FROM hmecontabilizacao hcontab'
      
        '        WHERE hcontab.idhistmovemptmo = hme.idhistmovemptmo) AS ' +
        'CCCREDFINAN,'
      '       hme.recpag AS HMERECPAG,'
      '       hme.versao,'
      '       (SELECT hev.idtmpdesc'
      '        FROM hmeenvio hev'
      
        '        WHERE hev.idhistmovemptmo = hme.idhistmovemptmo) AS IDTM' +
        'PDESC,'
      '       (SELECT tse.tsedescricao'
      '        FROM tiposuspemptmo tse'
      
        '        WHERE tse.idtiposuspemptmo = hme.idtiposuspemptmo) AS TS' +
        'EDESCRICAO'
      'FROM hmeall hme'
      
        '     JOIN contratoemptmo con ON con.idcontratoemptmo = hme.idcon' +
        'tratoemptmo'
      
        '     JOIN tipocontremptmo tce ON tce.idtipocontremptmo = con.idt' +
        'ipocontremptmo'
      '     JOIN tipoemptmo tep ON tep.idtipoemptmo = tce.idtipoemptmo'
      
        '     JOIN itemxtipocontr itc ON  itc.iditememptmo = hme.iditemem' +
        'ptmo'
      
        '                             AND itc.idtipocontremptmo = con.idt' +
        'ipocontremptmo'
      '     JOIN itememptmo ite ON ite.iditememptmo = hme.iditememptmo'
      '     --LEANDRO SIG131775 INICIO'
      '     LEFT OUTER JOIN (SELECT '#39'1'#39' AS PRESTPARCIAL , TMP.*'
      '                      FROM TMPDESC TMP'
      
        '                      WHERE ((TMP.VALORRECEBIDO > 0 AND TMP.VALO' +
        'RRECEBIDO < VALOR) AND  TMP.DATARECEBIMENTO IS NOT NULL))  TMP_O' +
        'RI'
      
        '                      ON HME.idcontratoemptmo = TMP_ORI.IDDESCON' +
        'TO AND HME.PARCELAALT = TMP_ORI.PARCELA'
      '     --LEANDRO SIG131775 FIM'
      ''
      '     -- Paulo Nobre - WO30535 - Inicio'
      
        '     JOIN histmovemptmo hst ON hme.idhistmovemptmo = hst.idhistm' +
        'ovemptmo and hme.idcontratoemptmo = hst.idcontratoemptmo'
      '     -- Paulo Nobre - WO30535 - Fim'
      ''
      'WHERE TEP.IDEMPRESAPROP      = :PIDEMPRESAPROP'
      'AND   hme.idcontratoemptmo   = :PIDCONTRATOEMPTMO'
      'AND   con.idcontratoemptmo   = :PIDCONTRATOEMPTMO'
      'AND   ( :PHMETIPOMOV IS NULL OR hme.tipomov = :PHMETIPOMOV)'
      
        'AND   ( :PIDITEMEMPTMO IS NULL OR hme.iditememptmo = :PIDITEMEMP' +
        'TMO)'
      
        'AND   ( :PFLGESTORNADO IS NULL OR (:PFLGESTORNADO = 0 AND hme.fl' +
        'gquitabonoestorno <> 3)'
      
        '                   OR (:PFLGESTORNADO = 1 AND hme.flgquitabonoes' +
        'torno = 3))'
      
        'AND   (:PFLGENVIO IS NULL OR (:PFLGENVIO = 1 AND hme.naturezaite' +
        'm > 0 OR (hme.tipomov = 3 AND hme.origem = 8)))'
      
        'AND   (:PFLGBAIXADO IS NULL OR (:PFLGBAIXADO = 0 AND hme.flgbaix' +
        'ado = 0 AND hme.flgquitabonoestorno = 0)'
      
        '                   OR (:PFLGBAIXADO = 1 AND (hme.flgbaixado = 1 ' +
        'OR hme.flgquitabonoestorno > 0)))'
      
        'AND   (:PNAOEXIBEATUDIA IS NULL OR (:PNAOEXIBEATUDIA IS NOT NULL' +
        ' AND hme.tipomov <> 5))'
      
        'AND   (:PFILTRODATA IS NULL OR ((:PDATAINI IS NULL OR hme.datapr' +
        'evista >= :PDATAINI) AND (:PDATAFIM IS NULL OR hme.dataprevista ' +
        '<= :PDATAFIM)))'
      ''
      'AND   (:PHMEPARCELA IS NULL OR hme.parcela = :PHMEPARCELA)'
      
        'AND   (:PFILTROCOMP IS NULL OR ( (:PANOMESCOMPINI IS NULL OR to_' +
        'char(hme.dataprevista,'#39'YYYYMM'#39') >= :PANOMESCOMPINI)'
      
        '                                 AND (:PANOMESCOMPFIM IS NULL OR' +
        ' to_char(hme.dataprevista,'#39'YYYYMM'#39') <= :PANOMESCOMPFIM)))'
      
        'AND   (:PFILTROCOB IS NULL OR ( (:PANOMESCOBINI IS NULL OR to_ch' +
        'ar(hme.datavencto,'#39'YYYYMM'#39') >= :PANOMESCOBINI)'
      
        '                                 AND (:PANOMESCOBFIM IS NULL OR ' +
        'to_char(hme.datavencto,'#39'YYYYMM'#39') <= :PANOMESCOBFIM)))'
      'ORDER BY DECODE(NVL(:PORDEM, 0), 1, HMEANOCOBRANCA),'
      '         DECODE(NVL(:PORDEM, 0), 1, HMEMESCOBRANCA),'
      '         DECODE(NVL(:PORDEM, 0), 2, HMEANOCOMPETENCIA),'
      '         DECODE(NVL(:PORDEM, 0), 2, HMEMESCOMPETENCIA),'
      '         DECODE(NVL(:PORDEM, 0), 3, HMEPARCELA),'
      '         DECODE(NVL(:PORDEM, 0), 4, HMEDATAATUALIZA),'
      '         DECODE(NVL(:PORDEM, 0), 5, HMEDATAPREVISTA),'
      '         NVL(ITCORDEMEXTRATO, 0),'
      '         HMEPARCELA,'
      
        '         DECODE(NVL(:PEXCEPCIONAL,0), 1, DECODE(HMETIPOMOV, 0, 0' +
        ', 1, 2, 2, 6, 3, 9, 4, 7, 5, 1, 6, 3, 7, 4, 8, 5, 8)),'
      
        '         DECODE(HMETIPOMOV, 0, 0, 1, 2, 2, 6, 3, 9, 4, 7, 5, 1, ' +
        '6, 3, 7, 4, 8, 5, 8),'
      '         HMECENTRALIZA,'
      '         HMEANOCOMPETENCIA,'
      '         HMEMESCOMPETENCIA,'
      '         HMEANOCOBRANCA,'
      '         HMEMESCOBRANCA,'
      '         HMESEQCOBRANCA,'
      '         ITCSEQCALCULO'
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 329
    Top = 334
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDEMPRESAPROP'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMETIPOMOV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMETIPOMOV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDITEMEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDITEMEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PFLGESTORNADO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PFLGESTORNADO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PFLGESTORNADO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PFLGENVIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PFLGENVIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PFLGBAIXADO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PFLGBAIXADO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PFLGBAIXADO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PNAOEXIBEATUDIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PNAOEXIBEATUDIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PFILTRODATA'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'PDATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'PDATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'PDATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'PDATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEPARCELA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEPARCELA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PFILTROCOMP'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PANOMESCOMPINI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PANOMESCOMPINI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PANOMESCOMPFIM'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PANOMESCOMPFIM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PFILTROCOB'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PANOMESCOBINI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PANOMESCOBINI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PANOMESCOBFIM'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PANOMESCOBFIM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PORDEM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PORDEM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PORDEM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PORDEM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PORDEM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PORDEM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PORDEM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PEXCEPCIONAL'
        ParamType = ptInput
      end>
    object qryHistMovITEDESCRICAO: TStringField
      FieldName = 'ITEDESCRICAO'
      Size = 40
    end
    object qryHistMovANOMESCOMP: TStringField
      FieldName = 'ANOMESCOMP'
      Size = 7
    end
    object qryHistMovANOMESCOBR: TStringField
      FieldName = 'ANOMESCOBR'
      Size = 7
    end
    object qryHistMovANOMESCOMPET: TStringField
      FieldName = 'ANOMESCOMPET'
      Size = 6
    end
    object qryHistMovANOMESCOB: TStringField
      FieldName = 'ANOMESCOB'
      Size = 6
    end
    object qryHistMovFLGENVIO: TFloatField
      FieldName = 'FLGENVIO'
    end
    object qryHistMovFLGBAIXADO: TFloatField
      FieldName = 'FLGBAIXADO'
    end
    object qryHistMovFLGESTORNADO: TFloatField
      FieldName = 'FLGESTORNADO'
    end
    object qryHistMovFLGABONADO: TFloatField
      FieldName = 'FLGABONADO'
    end
    object qryHistMovFLGQUITADO: TFloatField
      FieldName = 'FLGQUITADO'
    end
    object qryHistMovFLGBAIXAMANUAL: TFloatField
      FieldName = 'FLGBAIXAMANUAL'
    end
    object qryHistMovFLGDIVERGPEND: TFloatField
      FieldName = 'FLGDIVERGPEND'
    end
    object qryHistMovFLGSUSPENSAO: TFloatField
      FieldName = 'FLGSUSPENSAO'
    end
    object qryHistMovFLGTIPODIVERG: TFloatField
      FieldName = 'FLGTIPODIVERG'
    end
    object qryHistMovFLGDIVERGTRAT: TFloatField
      FieldName = 'FLGDIVERGTRAT'
    end
    object qryHistMovFLGENTRADAMANUAL: TFloatField
      FieldName = 'FLGENTRADAMANUAL'
    end
    object qryHistMovENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 3
    end
    object qryHistMovHMECENTRALIZA: TFloatField
      FieldName = 'HMECENTRALIZA'
    end
    object qryHistMovHMEDESTACADO: TFloatField
      FieldName = 'HMEDESTACADO'
    end
    object qryHistMovHMEANOCOMPETENCIA: TFloatField
      FieldName = 'HMEANOCOMPETENCIA'
    end
    object qryHistMovHMEMESCOMPETENCIA: TFloatField
      FieldName = 'HMEMESCOMPETENCIA'
    end
    object qryHistMovHMESEQCOBRANCA: TFloatField
      FieldName = 'HMESEQCOBRANCA'
    end
    object qryHistMovHMETIPOMOV: TFloatField
      FieldName = 'HMETIPOMOV'
    end
    object qryHistMovIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryHistMovIDITEMEMPTMO: TFloatField
      FieldName = 'IDITEMEMPTMO'
    end
    object qryHistMovHMEDATAPREVISTA: TDateTimeField
      FieldName = 'HMEDATAPREVISTA'
    end
    object qryHistMovTIPO_OPERACAO: TStringField
      FieldName = 'TIPO_OPERACAO'
      Size = 3
    end
    object qryHistMovHMEVLRPREVISTO: TFloatField
      FieldName = 'HMEVLRPREVISTO'
      DisplayFormat = '#,#0.00;(#,#0.00)'
    end
    object qryHistMovHMESALDODEV: TFloatField
      FieldName = 'HMESALDODEV'
      DisplayFormat = '#,#0.00;(#,#0.00)'
    end
    object qryHistMovHMEVLRBASE: TFloatField
      FieldName = 'HMEVLRBASE'
      DisplayFormat = '#,#0.00;(#,#0.00)'
    end
    object qryHistMovHMEDATA: TDateTimeField
      FieldName = 'HMEDATA'
    end
    object qryHistMovHMEDATAEFETIVAORIG: TDateTimeField
      FieldName = 'HMEDATAEFETIVAORIG'
    end
    object qryHistMovHMEVLREFETIVOORIG: TFloatField
      FieldName = 'HMEVLREFETIVOORIG'
      DisplayFormat = '#,#0.00;(#,#0.00)'
    end
    object qryHistMovHMEDATAEFETIVA: TStringField
      FieldName = 'HMEDATAEFETIVA'
      Size = 8
    end
    object qryHistMovCONCAT_PARCELAS: TStringField
      FieldName = 'CONCAT_PARCELAS'
      Size = 15
    end
    object qryHistMovHMEPARCELA: TFloatField
      FieldName = 'HMEPARCELA'
    end
    object qryHistMovHMEPARCELAALT: TFloatField
      FieldName = 'HMEPARCELAALT'
    end
    object qryHistMovHMENUMPARCELAS: TFloatField
      FieldName = 'HMENUMPARCELAS'
    end
    object qryHistMovHMETXJUROS: TFloatField
      FieldName = 'HMETXJUROS'
    end
    object qryHistMovHMEDATAATUALIZA: TDateTimeField
      FieldName = 'HMEDATAATUALIZA'
    end
    object qryHistMovPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
    end
    object qryHistMovPLNCODIGOESTORNO: TFloatField
      FieldName = 'PLNCODIGOESTORNO'
    end
    object qryHistMovCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object qryHistMovIDRUBRICA: TFloatField
      FieldName = 'IDRUBRICA'
    end
    object qryHistMovHMEDATAVENCTO: TDateTimeField
      FieldName = 'HMEDATAVENCTO'
    end
    object qryHistMovEVENTO: TStringField
      FieldName = 'EVENTO'
      Size = 29
    end
    object qryHistMovORIGEM: TStringField
      FieldName = 'ORIGEM'
      Size = 53
    end
    object qryHistMovSITENVIO: TStringField
      FieldName = 'SITENVIO'
      Size = 12
    end
    object qryHistMovNODOCUMENTO: TFloatField
      FieldName = 'NODOCUMENTO'
    end
    object qryHistMovSTATUS_DOC: TStringField
      FieldName = 'STATUS_DOC'
      Size = 9
    end
    object qryHistMovTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
    end
    object qryHistMovTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Size = 30
    end
    object qryHistMovFORMACOBRANCA: TStringField
      FieldName = 'FORMACOBRANCA'
      Size = 10
    end
    object qryHistMovTIPOFOLHA: TStringField
      FieldName = 'TIPOFOLHA'
      Size = 13
    end
    object qryHistMovHMEDATARECEB: TDateTimeField
      FieldName = 'HMEDATARECEB'
    end
    object qryHistMovHMEDATADIVERGTRAT: TDateTimeField
      FieldName = 'HMEDATADIVERGTRAT'
    end
    object qryHistMovFLGTIPODIVERGTRAT: TFloatField
      FieldName = 'FLGTIPODIVERGTRAT'
    end
    object qryHistMovHMEDATAQUITABONO: TDateTimeField
      FieldName = 'HMEDATAQUITABONO'
    end
    object qryHistMovHMEDATAESTORNO: TDateTimeField
      FieldName = 'HMEDATAESTORNO'
    end
    object qryHistMovHMEDATAESTORNOALT: TDateTimeField
      FieldName = 'HMEDATAESTORNOALT'
    end
    object qryHistMovHMEDATAENVIO: TDateTimeField
      FieldName = 'HMEDATAENVIO'
    end
    object qryHistMovPLNPLANIL: TFloatField
      FieldName = 'PLNPLANIL'
    end
    object qryHistMovPLANIL_ESTORNO: TFloatField
      FieldName = 'PLANIL_ESTORNO'
    end
    object qryHistMovNOMEUSUARIO: TStringField
      FieldName = 'NOMEUSUARIO'
      FixedChar = True
    end
    object qryHistMovUSU_ESTORNO: TStringField
      FieldName = 'USU_ESTORNO'
      FixedChar = True
    end
    object qryHistMovIDHISTMOVEMPTMO: TFloatField
      FieldName = 'IDHISTMOVEMPTMO'
    end
    object qryHistMovHMEMESCOBRANCA: TFloatField
      FieldName = 'HMEMESCOBRANCA'
    end
    object qryHistMovHMEANOCOBRANCA: TFloatField
      FieldName = 'HMEANOCOBRANCA'
    end
    object qryHistMovCCDEBFINAN: TStringField
      FieldName = 'CCDEBFINAN'
      Size = 18
    end
    object qryHistMovCCCREDFINAN: TStringField
      FieldName = 'CCCREDFINAN'
      Size = 18
    end
    object qryHistMovHMERECPAG: TStringField
      FieldName = 'HMERECPAG'
      Size = 1
    end
    object qryHistMovVERSAO: TStringField
      FieldName = 'VERSAO'
      Size = 10
    end
    object qryHistMovIDTMPDESC: TFloatField
      FieldName = 'IDTMPDESC'
    end
    object qryHistMovTSEDESCRICAO: TStringField
      FieldName = 'TSEDESCRICAO'
      Size = 60
    end
    object qryHistMovHMEVLREFETIVO: TFloatField
      FieldName = 'HMEVLREFETIVO'
      OnGetText = qryHistMovHMEVLREFETIVOGetText
      DisplayFormat = '#,#0.00;(#,#0.00)'
    end
  end
  object qryLogTotalPrev: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '   LTP.IDLOGTOTALPREV,'
      '   LTP.IDMODULO,'
      ''
      '   LTP.IDPESQUISA1 AS IDCONTRATOEMPTMO,'
      '   LTP.IDPESQUISA2 AS IDHISTMOVEMPTMO,'
      ''
      '   LTP.ORIGEM,'
      '   DECODE(LTP.ORIGEM,'
      '           0, '#39'Concessão/Renovação'#39','
      '           1, '#39'Geração de Parcelas'#39','
      '           2, '#39'Amortização/Refinanciamento'#39','
      '           3, '#39'Quitação Antecipada'#39','
      '           4, '#39'Tratamento de Divergências'#39','
      '           5, '#39'Atualização de Saldo (Diária)'#39','
      '           6, '#39'Recálculo Diário'#39','
      '           7, '#39'Tratamento Individual'#39','
      '           8, '#39'Quitação por Morte/Invalidez'#39','
      '           9, '#39'Importação/Migração'#39','
      '          10, '#39'Quitação por Resgate'#39','
      '          11, '#39'Recebimento'#39','
      '          12, '#39'Entrada Manual'#39','
      '          13, '#39'Alteração de Concessão'#39','
      '          14, '#39'Tratamento de Valores Não Programados'#39','
      '          15, '#39'Consulta de Contratos'#39','
      '          16, '#39'Cancelamento de Concessão'#39','
      '          17, '#39'Alteração Contratual'#39','
      '          18, '#39'Liberação de Concessão'#39','
      '          19, '#39'Envio'#39','
      '          41, '#39'Contabilização em Lote de Concessão'#39','
      '          42, '#39'Contabilização em Lote de Prestação'#39','
      '          43, '#39'Contabilização em Lote de Amortização'#39','
      '          44, '#39'Contabilização em Lote de Quitação'#39','
      '          45, '#39'Contabilização em Lote de Encargos'#39','
      '          46, '#39'Contabilização em Lote de Atualização Diária'#39','
      '          47, '#39'Contabilização em Lote de Ajustes'#39','
      '          51, '#39'Desfazer Geração de Parcelas'#39','
      '          52, '#39'Cancelamento de Amortização'#39','
      '          53, '#39'Cancelamento de Quitação'#39','
      '          61, '#39'Desfazer Envio'#39','
      '          62, '#39'Desfazer Recebimento'#39
      '         ) AS DESC_ORIGEM,'
      ''
      '   LTP.DESCOPERACAO, LTP.DATA, LTP.IDUSUARIO, LTP.VERSAO,'
      ''
      '   USU.NOMEUSUARIO,'
      '   PSU.NOME'
      ''
      'FROM'
      '   PESSOA         PSU,'
      '   LOGTOTALPREV   LTP,'
      '   USUARIOSISTEMA USU'
      ''
      'WHERE'
      '       LTP.IDMODULO     = 15'
      '   AND LTP.IDPESQUISA1  =:PIDCONTRATO'
      '   AND LTP.IDUSUARIO    = USU.IDUSUARIO(+)'
      '   AND USU.IDUSUARIO    = PSU.IDPESSOA(+)'
      ''
      'ORDER BY'
      '   LTP.DATA DESC'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 780
    Top = 414
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATO'
        ParamType = ptInput
        Value = 325227
      end>
    object qryLogTotalPrevDATA: TDateTimeField
      DisplayLabel = 'Data / Hora'
      DisplayWidth = 18
      FieldName = 'DATA'
    end
    object qryLogTotalPrevDESC_ORIGEM: TStringField
      DisplayLabel = 'Origem'
      DisplayWidth = 19
      FieldName = 'DESC_ORIGEM'
      Size = 37
    end
    object qryLogTotalPrevVERSAO: TStringField
      DisplayLabel = 'Versão'
      DisplayWidth = 8
      FieldName = 'VERSAO'
      Size = 10
    end
    object qryLogTotalPrevNOMEUSUARIO: TStringField
      DisplayLabel = 'Login'
      DisplayWidth = 10
      FieldName = 'NOMEUSUARIO'
      FixedChar = True
    end
    object qryLogTotalPrevNOME: TStringField
      DisplayLabel = 'Usuario'
      DisplayWidth = 20
      FieldName = 'NOME'
      Size = 60
    end
    object qryLogTotalPrevIDUSUARIO: TFloatField
      DisplayLabel = 'ID Usuário'
      DisplayWidth = 9
      FieldName = 'IDUSUARIO'
    end
    object qryLogTotalPrevIDHISTMOVEMPTMO: TFloatField
      DisplayLabel = 'ID HistMov'
      DisplayWidth = 13
      FieldName = 'IDHISTMOVEMPTMO'
    end
    object qryLogTotalPrevIDMODULO: TFloatField
      DisplayLabel = 'ID Módulo'
      DisplayWidth = 9
      FieldName = 'IDMODULO'
    end
    object qryLogTotalPrevIDCONTRATOEMPTMO: TFloatField
      DisplayLabel = 'Contrato'
      DisplayWidth = 13
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryLogTotalPrevIDLOGTOTALPREV: TFloatField
      DisplayLabel = 'ID Log'
      DisplayWidth = 10
      FieldName = 'IDLOGTOTALPREV'
    end
    object qryLogTotalPrevORIGEM: TFloatField
      DisplayWidth = 10
      FieldName = 'ORIGEM'
      Visible = False
    end
    object qryLogTotalPrevDESCOPERACAO: TMemoField
      FieldName = 'DESCOPERACAO'
      BlobType = ftMemo
      Size = 2000
    end
  end
  object dsLogTotalPrev: TwwDataSource
    DataSet = qryLogTotalPrev
    Left = 780
    Top = 399
  end
  object qryDataQuitacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   MAX(HME.HMEDATAPREVISTA) AS DATAQUITACAO'
      'FROM'
      '   HISTMOVEMPTMO HME'
      'WHERE'
      '       HME.IDCONTRATOEMPTMO     =:PIDCONTRATOEMPTMO'
      '   AND HME.HMETIPOMOV           IN (1, 3)'
      '   AND NVL(HME.FLGESTORNADO, 0) = 0'
      '   AND NVL(HME.FLGQUITADO, 0)   = 0'
      '   AND (HME.HMETIPOMOV          = 3 OR HME.HMECENTRALIZA = 1)')
    ValidateWithMask = True
    Left = 568
    Top = 396
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end>
    object qryDataQuitacaoDATAQUITACAO: TDateTimeField
      FieldName = 'DATAQUITACAO'
    end
  end
  object dsLogTotalPrevHist: TwwDataSource
    DataSet = qryLogTotalPrevHist
    Left = 681
    Top = 399
  end
  object qryLogTotalPrevHist: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '   LTP.IDLOGTOTALPREV,'
      '   LTP.IDMODULO,'
      ''
      '   LTP.IDPESQUISA1 AS IDCONTRATOEMPTMO,'
      '   LTP.IDPESQUISA2 AS IDHISTMOVEMPTMO,'
      ''
      '   LTP.ORIGEM,'
      '   DECODE(LTP.ORIGEM,'
      '           0, '#39'Concessão/Renovação'#39','
      '           1, '#39'Geração de Parcelas'#39','
      '           2, '#39'Amortização/Refinanciamento'#39','
      '           3, '#39'Quitação Antecipada'#39','
      '           4, '#39'Tratamento de Divergências'#39','
      '           5, '#39'Atualização de Saldo (Diária)'#39','
      '           6, '#39'Recálculo Diário'#39','
      '           7, '#39'Tratamento Individual'#39','
      '           8, '#39'Quitação por Morte/Invalidez'#39','
      '           9, '#39'Importação/Migração'#39','
      '          10, '#39'Quitação por Resgate'#39','
      '          11, '#39'Recebimento'#39','
      '          12, '#39'Entrada Manual'#39','
      '          13, '#39'Alteração de Concessão'#39','
      '          14, '#39'Tratamento de Valores Não Programados'#39','
      '          15, '#39'Consulta de Contratos'#39','
      '          16, '#39'Cancelamento de Concessão'#39','
      '          17, '#39'Alteração Contratual'#39','
      '          18, '#39'Liberação de Concessão'#39','
      '          19, '#39'Envio'#39','
      '          41, '#39'Contabilização em Lote de Concessão'#39','
      '          42, '#39'Contabilização em Lote de Prestação'#39','
      '          43, '#39'Contabilização em Lote de Amortização'#39','
      '          44, '#39'Contabilização em Lote de Quitação'#39','
      '          45, '#39'Contabilização em Lote de Encargos'#39','
      '          46, '#39'Contabilização em Lote de Atualização Diária'#39','
      '          47, '#39'Contabilização em Lote de Ajustes'#39','
      '          51, '#39'Desfazer Geração de Parcelas'#39','
      '          52, '#39'Cancelamento de Amortização'#39','
      '          53, '#39'Cancelamento de Quitação'#39','
      '          61, '#39'Desfazer Envio'#39','
      '          62, '#39'Desfazer Recebimento'#39
      '         ) AS DESC_ORIGEM,'
      ''
      '   LTP.DESCOPERACAO, LTP.DATA, LTP.IDUSUARIO, LTP.VERSAO,'
      ''
      '   USU.NOMEUSUARIO,'
      '   PSU.NOME'
      ''
      'FROM'
      '   PESSOA         PSU,'
      '   LOGTOTALPREV   LTP,'
      '   USUARIOSISTEMA USU'
      ''
      'WHERE'
      '       LTP.IDMODULO     = 15'
      '   AND LTP.IDPESQUISA2  =:PIDHISTMOVEMPTMO'
      '   AND LTP.IDUSUARIO    = USU.IDUSUARIO(+)'
      '   AND USU.IDUSUARIO    = PSU.IDPESSOA(+)'
      ''
      'ORDER BY'
      '   LTP.DATA DESC')
    ValidateWithMask = True
    Left = 681
    Top = 379
    ParamData = <
      item
        DataType = ftString
        Name = 'PIDHISTMOVEMPTMO'
        ParamType = ptInput
      end>
    object DateTimeField1: TDateTimeField
      DisplayLabel = 'Data / Hora'
      DisplayWidth = 18
      FieldName = 'DATA'
    end
    object StringField1: TStringField
      DisplayLabel = 'Origem'
      DisplayWidth = 19
      FieldName = 'DESC_ORIGEM'
      Size = 37
    end
    object StringField2: TStringField
      DisplayLabel = 'Versão'
      DisplayWidth = 8
      FieldName = 'VERSAO'
      Size = 10
    end
    object StringField3: TStringField
      DisplayLabel = 'Login'
      DisplayWidth = 10
      FieldName = 'NOMEUSUARIO'
      FixedChar = True
    end
    object StringField4: TStringField
      DisplayLabel = 'Usuario'
      DisplayWidth = 20
      FieldName = 'NOME'
      Size = 60
    end
    object FloatField1: TFloatField
      DisplayLabel = 'ID Usuário'
      DisplayWidth = 9
      FieldName = 'IDUSUARIO'
    end
    object FloatField2: TFloatField
      DisplayLabel = 'ID HistMov'
      DisplayWidth = 13
      FieldName = 'IDHISTMOVEMPTMO'
    end
    object FloatField3: TFloatField
      DisplayLabel = 'ID Módulo'
      DisplayWidth = 9
      FieldName = 'IDMODULO'
    end
    object FloatField4: TFloatField
      DisplayLabel = 'Contrato'
      DisplayWidth = 13
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object FloatField5: TFloatField
      DisplayLabel = 'ID Log'
      DisplayWidth = 10
      FieldName = 'IDLOGTOTALPREV'
    end
    object FloatField6: TFloatField
      DisplayWidth = 10
      FieldName = 'ORIGEM'
      Visible = False
    end
    object qryLogTotalPrevHistDESCOPERACAO: TMemoField
      FieldName = 'DESCOPERACAO'
      BlobType = ftMemo
      Size = 2000
    end
  end
  object qryHistMigracoes: TwwQuery
    AfterScroll = qryHistMigracoesAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT MI.IDCONTRATOEMPTMO,'
      '       DATAMIGRA,                      '
      '       OBSERVACAO,'
      '       PAT1.NOME     AS NOME_PATANT,'
      '       PAT2.NOME     AS NOME_PATATU,'
      '       PLAN_ANT.NOME AS NOME_PLANO_ANT,'
      '       PLAN_ATU.NOME AS NOME_PLANO_ATU'
      '  FROM MIGRACONTRATOEP MI, '
      '       PESSOA PAT1, '
      '       PESSOA PAT2,'
      '       PLANPREVCONTABIL PLAN_ANT,'
      '       PLANPREVCONTABIL PLAN_ATU'
      ' WHERE MI.IDPATROANT     = PAT1.IDPESSOA'
      '   AND MI.IDPATROATU     = PAT2.IDPESSOA'
      '   AND MI.IDPLANOCONTANT =  PLAN_ANT.IDPLANOPREV (+)'
      '   AND MI.IDPLANOCONTATU =  PLAN_ATU.IDPLANOPREV (+)'
      '   AND MI.IDCONTRATOEMPTMO = :IDCONTRATO '
      '   ')
    ValidateWithMask = True
    Left = 868
    Top = 460
    ParamData = <
      item
        DataType = ftLargeint
        Name = 'IDCONTRATO'
        ParamType = ptInput
      end>
  end
  object dsHistMigracoes: TwwDataSource
    DataSet = qryHistMigracoes
    Left = 870
    Top = 448
  end
  object qryItensMigracoes: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '   IT.ITEDESCRICAO, '
      '   MXI.VALOR'
      'FROM '
      '   MIGRACONTRATOEPXITEM MXI, '
      '   ITEMEMPTMO IT'
      'WHERE '
      '   MXI.IDITEMEMPTMO = IT.IDITEMEMPTMO AND'
      '   MXI.IDCONTRATOEMPTMO = :PIDCONTRATOEMPTMO AND'
      '   MXI.DATAMIGRA = :PDATAMIGRA')
    ValidateWithMask = True
    Left = 468
    Top = 332
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PDATAMIGRA'
        ParamType = ptInput
      end>
  end
  object dsItensMigracoes: TwwDataSource
    DataSet = qryItensMigracoes
    Left = 470
    Top = 316
  end
  object qryHistObservacao: TwwQuery
    CachedUpdates = True
    AfterScroll = qryHistMovAfterScroll
    AutoRefresh = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   HME.HMEOBSERVACAO'
      '   '
      'FROM'
      '   HISTMOVEMPTMO   HME'
      ''
      'WHERE'
      '       HME.IDHISTMOVEMPTMO    =:PIDHISTMOVEMPTMO'
      '')
    ValidateWithMask = True
    Left = 780
    Top = 472
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDHISTMOVEMPTMO'
        ParamType = ptInput
      end>
    object qryHistObservacaoHMEOBSERVACAO: TMemoField
      FieldName = 'HMEOBSERVACAO'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.HMEOBSERVACAO'
      BlobType = ftMemo
      Size = 2000
    end
  end
  object dsHistObservacao: TDataSource
    DataSet = qryHistObservacao
    Left = 776
    Top = 459
  end
  object dseventos: TwwDataSource
    DataSet = QryEventos
    Left = 788
    Top = 221
  end
  object QryEventos: TwwQuery
    AfterScroll = QryEventosAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      ' SELECT HST.IDCONTRATOEMPTMO,'
      '        HST.NUMCRM,'
      '        HST.DTAJUIZAMENTO,'
      '        HST.JURISDICAO,'
      '        HST.IDTIPOEVENTOCOBEMPTMO, HST.IDHISTEVENTOCOBEMPTMO,'
      '        T.DESCEVENTOCOB,'
      '        HST.DATAEVENTOCOB,'
      '        HST.OBSCOB,'
      '        HST.CE,'
      '        HST.AR,'
      '        HST.NUP,'
      '        HST.PROCJUD,'
      
        '        HST.DATAASSINATURAACORDO, HST.DATAHOMOLACORDO, HST.FORMA' +
        'PAGTO, HST.GEJUR, HST.CI,'
      '        DECODE(HST.SITAR, 0, '#39'0 - Recebido'#39', '
      '        '#9#9#9#9'  1, '#39'1 - Mudou-se'#39', '
      '        '#9#9#9#9'  2, '#39'2 - Endereço insuficiente'#39', '
      '        '#9#9#9#9'  3, '#39'3 - Não existe o número'#39', '
      '        '#9#9#9#9'  4, '#39'4 - Desconhecido'#39', '
      '        '#9#9#9#9'  5, '#39'5 - Recusado'#39', '
      '        '#9#9#9#9'  6, '#39'6 - Não procurado'#39', '
      '        '#9#9#9#9'  7, '#39'7 - Ausente'#39', '
      '        '#9#9#9#9'  8, '#39'8 - Falecido'#39', '
      '        '#9#9#9#9'  9, '#39'9 - Outros'#39', HST.SITAR) AS SITAR'
      ''
      '   FROM HISTEVENTOCOBEMPTMO HST,'
      '        TIPOEVENTOCOBEMPTMO T,'
      '        EVENTOCOBXHISTMOVEMPTMO E'
      ''
      '  WHERE HST.IDCONTRATOEMPTMO = :IDCONTRATOEMPTMO'
      '    AND HST.IDTIPOEVENTOCOBEMPTMO = T.IDTIPOEVENTOCOBEMPTMO'
      '    AND HST.IDHISTEVENTOCOBEMPTMO = E.IDHISTEVENTOCOBEMPTMO (+ )'
      '    AND NOT (HST.OBSCOB IS NULL'
      '    AND HST.CE IS NULL'
      '    AND HST.AR IS NULL'
      '    AND HST.NUP IS NULL'
      '    AND HST.PROCJUD IS NULL'
      '    AND HST.SITAR IS NULL'
      '    AND HST.NUMCRM IS NULL'
      '    AND HST.DTAJUIZAMENTO IS NULL'
      '    AND HST.JURISDICAO IS NULL )'
      ''
      '  GROUP BY HST.IDCONTRATOEMPTMO,'
      '        HST.IDHISTEVENTOCOBEMPTMO,'
      '        HST.IDTIPOEVENTOCOBEMPTMO,'
      '        T.DESCEVENTOCOB,'
      '        HST.DATAEVENTOCOB,'
      '        HST.OBSCOB,'
      '        HST.CE,'
      '        HST.AR,'
      '        HST.NUP,'
      '        HST.PROCJUD,'
      '        HST.SITAR,'
      '        HST.NUMCRM,'
      '        HST.DTAJUIZAMENTO,'
      '        HST.JURISDICAO,'
      '        HST.DATAASSINATURAACORDO, '
      '        HST.DATAHOMOLACORDO, '
      '        HST.FORMAPAGTO, '
      '        HST.GEJUR,'
      '        HST.CI'
      ''
      '  ORDER BY DATAEVENTOCOB')
    ValidateWithMask = True
    Left = 788
    Top = 205
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDCONTRATOEMPTMO'
        ParamType = ptUnknown
      end>
    object qryQryEventosDESCEVENTOCOB: TStringField
      DisplayLabel = 'Evento'
      DisplayWidth = 46
      FieldName = 'DESCEVENTOCOB'
      Size = 100
    end
    object qryQryEventosDATAEVENTOCOB: TDateTimeField
      DisplayLabel = 'Data do Evento'
      DisplayWidth = 14
      FieldName = 'DATAEVENTOCOB'
    end
    object qryQryEventosIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
      Visible = False
    end
    object qryQryEventosIDTIPOEVENTOCOBEMPTMO: TFloatField
      FieldName = 'IDTIPOEVENTOCOBEMPTMO'
      Visible = False
    end
    object qryQryEventosOBSCOB: TMemoField
      FieldName = 'OBSCOB'
      Visible = False
      BlobType = ftMemo
      Size = 1000
    end
    object qryQryEventosCE: TStringField
      FieldName = 'CE'
      Visible = False
      Size = 30
    end
    object qryQryEventosAR: TStringField
      FieldName = 'AR'
      Visible = False
      Size = 30
    end
    object qryQryEventosNUP: TStringField
      FieldName = 'NUP'
      Visible = False
      Size = 30
    end
    object qryQryEventosPROCJUD: TStringField
      FieldName = 'PROCJUD'
      Visible = False
      Size = 30
    end
    object qryQryEventosSITAR: TStringField
      FieldName = 'SITAR'
      Visible = False
      Size = 25
    end
    object fltfldQryEventosNUMCRM: TFloatField
      FieldName = 'NUMCRM'
      Visible = False
    end
    object QryEventosDTAJUIZAMENTO: TDateTimeField
      FieldName = 'DTAJUIZAMENTO'
      Visible = False
    end
    object QryEventosJURISDICAO: TStringField
      FieldName = 'JURISDICAO'
      Visible = False
      Size = 200
    end
    object fltfldQryEventosIDHISTEVENTOCOBEMPTMO: TFloatField
      FieldName = 'IDHISTEVENTOCOBEMPTMO'
      Visible = False
    end
    object dtmfldQryEventosDATAASSINATURAACORDO: TDateTimeField
      FieldName = 'DATAASSINATURAACORDO'
    end
    object dtmfldQryEventosDATAHOMOLACORDO: TDateTimeField
      FieldName = 'DATAHOMOLACORDO'
    end
    object strngfldQryEventosFORMAPAGTO: TStringField
      FieldName = 'FORMAPAGTO'
      Size = 30
    end
    object strngfldQryEventosCI: TStringField
      FieldName = 'CI'
      Size = 30
    end
    object mfldQryEventosGEJUR: TMemoField
      FieldName = 'GEJUR'
      BlobType = ftMemo
    end
  end
  object QryPrestacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT HME.IDCONTRATOEMPTMO,'
      '       HME.IDHISTMOVEMPTMO,'
      
        '       HME.HMEPARCELAALT || '#39'/'#39' || HME.HMEPARCELA || '#39'/'#39' ||HME.H' +
        'MENUMPARCELAS AS PARCELAS,'
      '       HME.HMEDATAPREVISTA,'
      '       HME.HMEVLRPREVISTO,'
      '       HME.HMEDATAEFETIVA,'
      '       HME.HMEVLREFETIVO ,'
      '       HME.HMEDATAVENCTO,'
      '       HME.HMEVLRPREVISTO,'
      '       IT.ITEDESCRICAO AS ITEM,'
      '       HME.HMEVLRPREVISTO as VALORENCARGO'
      ''
      'FROM HISTMOVEMPTMO HME, ITEMEMPTMO IT '
      ' WHERE IDCONTRATOEMPTMO = :IDCONTRATOEMPTMO'
      ' AND HME.IDHISTMOVEMPTMO IN ('
      
        '                             SELECT IDHISTMOVEMPTMO FROM HISTEVE' +
        'NTOCOBEMPTMO H, EVENTOCOBXHISTMOVEMPTMO E '
      
        '                             WHERE H.IDCONTRATOEMPTMO      = :ID' +
        'CONTRATOEMPTMO'
      
        '                             AND   H.IDTIPOEVENTOCOBEMPTMO = :ID' +
        'TIPOEVENTOCOBEMPTMO'
      
        '                             AND   H.IDHISTEVENTOCOBEMPTMO = :ID' +
        'HISTEVENTOCOBEMPTMO'
      
        '                             AND   TO_DATE(H.DATAEVENTOCOB,'#39'DD/M' +
        'M/RRRR'#39')  = :DATAEVENTOCOB'
      
        '                             AND   H.IDHISTEVENTOCOBEMPTMO = E.I' +
        'DHISTEVENTOCOBEMPTMO) '
      '   '
      '   AND HME.HMETIPOMOV = 1'
      '   AND (HME.HMECENTRALIZA + HME.HMEDESTACADO) = 1'
      '   AND HME.HMEORIGEM IN (1,11) /* Andre Imakawa - SIG 56779*/'
      '   AND NVL(HME.FLGESTORNADO, 0) = 0'
      '   AND IT.IDITEMEMPTMO = HME.IDITEMEMPTMO'
      ' ORDER BY HMEDATAPREVISTA'
      ' '
      ' '
      '')
    ValidateWithMask = True
    Left = 868
    Top = 299
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCONTRATOEMPTMO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCONTRATOEMPTMO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDTIPOEVENTOCOBEMPTMO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDHISTEVENTOCOBEMPTMO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DATAEVENTOCOB'
        ParamType = ptUnknown
      end>
  end
  object dsPrestacao: TwwDataSource
    DataSet = QryPrestacao
    Left = 868
    Top = 283
  end
  object dsValorMaximo: TDataSource
    DataSet = qryValorMaximo
    Left = 784
    Top = 528
  end
  object qryValorMaximo: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT VALORMAX, DATAINICIO, DATAFIM'
      '  FROM VALORMAXPRESTEP'
      ' WHERE IDCONTRATOEMPTMO = :IDCONTRATO')
    ValidateWithMask = True
    Left = 784
    Top = 515
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDCONTRATO'
        ParamType = ptUnknown
      end>
  end
  object QryHistEnvioEmptmo: TwwQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      '    SELECT decode(FORMACOBRANCA,'#39'C'#39','#39'Financeiro'#39','
      '           '#39'Folha'#39
      '           ||decode(TIPOFOLHA,null,null,'#39' '#39'||'
      '           decode (TIPOFOLHA,'#39'P'#39','#39'Patrocinadora'#39','#39'Benefício'#39' )'
      '           )) AS FORMAENVIO,'
      
        '           HIST.IDRUBRICA, HIST.DATAENVIO, HIST.IDTMPDESC, HIST.' +
        'CODDOCUMENTO, '
      '           HIST.DATAVENCTO'
      '         , (select NOMEUSUARIO from USUARIOSISTEMA USUA'
      
        '            Where '#39'CM'#39'||to_char(Idusuario) = HIST.trguserinclusa' +
        'o) NOMEUSUARIO        '
      '    FROM HISTENVIOEMPTMO  HIST '
      '    WHERE IDHISTMOVEMPTMO = :IDHISTMOVEMPTMO'
      '    ORDER BY DATAENVIO desc')
    ValidateWithMask = True
    Left = 464
    Top = 398
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDHISTMOVEMPTMO'
        ParamType = ptInput
      end>
    object QryHistEnvioEmptmoFORMAENVIO: TStringField
      DisplayLabel = 'Destino do Envio'
      DisplayWidth = 20
      FieldName = 'FORMAENVIO'
      Size = 3
    end
    object QryHistEnvioEmptmoIDRUBRICA: TFloatField
      DisplayLabel = 'Rubrica'
      DisplayWidth = 10
      FieldName = 'IDRUBRICA'
      Origin = 'BASEDADOS.HISTENVIOEMPTMO.IDRUBRICA'
    end
    object QryHistEnvioEmptmoDATAENVIO: TDateTimeField
      DisplayLabel = 'Data de Envio'
      DisplayWidth = 18
      FieldName = 'DATAENVIO'
      Origin = 'BASEDADOS.HISTENVIOEMPTMO.DATAENVIO'
    end
    object QryHistEnvioEmptmoIDTMPDESC: TFloatField
      DisplayLabel = 'Chave Folha'
      DisplayWidth = 11
      FieldName = 'IDTMPDESC'
      Origin = 'BASEDADOS.HISTENVIOEMPTMO.IDTMPDESC'
    end
    object QryHistEnvioEmptmoCODDOCUMENTO: TFloatField
      DisplayLabel = 'Documento CAP/CAR'
      DisplayWidth = 15
      FieldName = 'CODDOCUMENTO'
      Origin = 'BASEDADOS.HISTENVIOEMPTMO.CODDOCUMENTO'
    end
    object QryHistEnvioEmptmoDATAVENCTO: TDateTimeField
      DisplayLabel = 'Data de Vencimento'
      DisplayWidth = 17
      FieldName = 'DATAVENCTO'
      Origin = 'BASEDADOS.HISTENVIOEMPTMO.DATAVENCTO'
    end
    object QryHistEnvioEmptmoNOMEUSUARIO: TStringField
      DisplayLabel = 'Usuário'
      DisplayWidth = 20
      FieldName = 'NOMEUSUARIO'
      FixedChar = True
    end
  end
  object DSHistEnvioEmptmo: TDataSource
    DataSet = QryHistEnvioEmptmo
    Left = 464
    Top = 382
  end
  object QryContratosQuitados: TwwQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      '-- Paulo Nobre - WO31440 - Inicio'
      'SELECT CN.IDCONTRATOEMPTMO   as  "N° Contrato           ",'
      '       CN.DATACREDITO        as  "Data de Crédito     ",'
      '       (SELECT NVL(SUM(H.HMEVLRPREVISTO),0)'
      '        FROM HISTMOVEMPTMO H'
      '        WHERE H.IDCONTRATOEMPTMO = CN.IDCONTRATOEMPTMO'
      '              AND H.HMETIPOMOV = 3             -- Quitação'
      
        '              AND H.HMECENTRALIZA = 1          -- 0 - interno; 1' +
        ' - destacado; 2 - centralizador'
      '              AND NVL(H.FLGESTORNADO, 0) = 0   -- Não estornado'
      
        '              AND H.HMESALDODEV = 0) as "Valor da Quitacao     "' +
        ','
      '       TIP.TCEDESCRICAO as  "Modalidade"'
      'FROM CONTRATOEMPTMO CN,'
      '     TIPOCONTREMPTMO TIP'
      'WHERE CN.IDCONTRQUITACAO  = :IDCONTRATOEMPTMO'
      '      AND CN.IDTIPOCONTREMPTMO = TIP.IDTIPOCONTREMPTMO'
      '-- Paulo Nobre - WO31440 - Fim'
      ' ')
    ValidateWithMask = True
    Left = 289
    Top = 453
    ParamData = <
      item
        DataType = ftString
        Name = 'IDCONTRATOEMPTMO'
        ParamType = ptInput
      end>
  end
  object dsContratosQuitados: TwwDataSource
    AutoEdit = False
    DataSet = QryContratosQuitados
    Left = 292
    Top = 508
  end
  object qryLogNUP: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT idmodulo, '
      '       descoperacao, '
      '       idusuario, '
      '       data, '
      '       idpesquisa1, '
      '       origem, '
      '       versao'
      'FROM LOGTOTALPREV'
      ' WHERE (1 = 2)')
    UpdateObject = updLogNUP
    ValidateWithMask = True
    Left = 708
    Top = 252
  end
  object updLogNUP: TUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO LOGTOTALPREV'
      
        '(idlogtotalprev, idmodulo, descoperacao, idusuario, data, idpesq' +
        'uisa1, origem, versao)'
      'values'
      
        '(SEQLOGTOTALPREV.NEXTVAL, :idmodulo, :descoperacao, :idusuario, ' +
        ':data, :idpesquisa1, :origem, :versao)')
    Left = 649
    Top = 253
  end
  object qryUpdateNup: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDCONTRATOEMPTMO,'
      '  NUMPROTOCOLO'
      'FROM CONTRATOEMPTMO'
      '  WHERE IDCONTRATOEMPTMO = :IDCONTRATOEMPTMO')
    UpdateObject = updNup
    ValidateWithMask = True
    Left = 704
    Top = 320
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDCONTRATOEMPTMO'
        ParamType = ptUnknown
      end>
  end
  object updNup: TUpdateSQL
    ModifySQL.Strings = (
      'update CONTRATOEMPTMO'
      'set'
      '  NUMPROTOCOLO = :NUMPROTOCOLO'
      'where'
      '  IDCONTRATOEMPTMO = :OLD_IDCONTRATOEMPTMO')
    Left = 648
    Top = 320
  end
  object upd: TUpdateSQL
    Left = 840
    Top = 136
  end
  object qryDebAutomatico: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PF.DESCRICAO AS CONVENIO,'
      #9'   AB.NUMAGENCIA AS AGENCIA,'
      '       BD.NU_CONTACORRENTE,'
      '       SD2.NO_SITUACAO_DEBITO_AUTOMATICO AS STATUS,'
      '       BD.DT_ARQUIVO_ELETRONICO_REM, '
      '       BD.NO_ARQUIVO_ELETRONICO_REM,'
      '      PE.NOME as NOME'
      '  FROM CORE_CADASTRO.CONTA_BANCARIA_DEBITO_AUTO BD'
      '  JOIN CM.CONTABANCARIA CB'
      '    ON CB.CONTACORRENTE = BD.NU_CONTACORRENTE'
      '  LEFT JOIN CM.AGENCIABANCARIA AB'
      '    ON AB.IDPESSOA = CB.IDAGENCIA  '
      '  JOIN CM.PESSOA PE'
      '    ON PE.IDPESSOA = NVL(CB.IDTITULAR, CB.IDPESSOA)'
      '  JOIN CORE_CADASTRO.SITUACAO_DEBITO_AUTOMATICO SD2'
      
        '    ON SD2.CO_SITUACAO_DEBITO_AUTOMATICO = BD.CO_SITUACAO_DEBITO' +
        '_AUTOMATICO'
      '  LEFT JOIN CM.CONTRATOEMPTMO CO'
      '    ON CO.IDPESSOA = NVL(CB.IDTITULAR, CB.IDPESSOA)'
      '  LEFT JOIN CM.HSTCBANCARIAEMPTMO CE  '
      '    ON CE.IDCONTRATOEMPTMO IS NULL'
      '  JOIN CM.PORTADORFORMA PF'
      '    ON PF.CODPORTFORMA = BD.ID_PORTADOR_FORMA'
      
        ' WHERE NVL(CE.IDCONTRATOEMPTMO, CO.IDCONTRATOEMPTMO) = :PIDCONTR' +
        'ATOEMPTMO'
      ' AND BD.DT_ARQUIVO_ELETRONICO_REM IS NOT NULL'
      ' AND PF.CODPORTFORMA IN(259,293)'
      ' GROUP BY PF.DESCRICAO,'
      '       AB.NUMAGENCIA,'
      '       BD.NU_CONTACORRENTE,'
      '       SD2.NO_SITUACAO_DEBITO_AUTOMATICO,'
      '       BD.DT_ARQUIVO_ELETRONICO_REM, '
      '       BD.NO_ARQUIVO_ELETRONICO_REM,'
      '       PE.NOME'
      ' ORDER BY BD.DT_ARQUIVO_ELETRONICO_REM DESC')
    ValidateWithMask = True
    Left = 684
    Top = 420
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end>
  end
  object dsDebAutomatico: TDataSource
    AutoEdit = False
    DataSet = qryDebAutomatico
    Left = 684
    Top = 452
  end
  object qryAcordoQueroPagar: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dts
    SQL.Strings = (
      'SELECT 1'
      '  FROM CM.HISTEVENTOCOBEMPTMO '
      ' WHERE IDTIPOEVENTOCOBEMPTMO = 29 '
      '   AND IDCONTRATOEMPTMO = :IDCONTRATOEMPTMO')
    ValidateWithMask = True
    Left = 412
    Top = 524
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDCONTRATOEMPTMO'
        ParamType = ptUnknown
      end>
  end
  object qryPolRenogociacao: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dts
    SQL.Strings = (
      'SELECT 1'
      '  FROM CM.HISTEVENTOCOBEMPTMO '
      ' WHERE IDTIPOEVENTOCOBEMPTMO = 32 '
      '   AND IDCONTRATOEMPTMO = :IDCONTRATOEMPTMO')
    ValidateWithMask = True
    Left = 508
    Top = 500
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDCONTRATOEMPTMO'
        ParamType = ptUnknown
      end>
  end
  object qryMessagem: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  FLGEXIBEMSG'
      '  DATAEXPIRAMSG,'
      '  DESCRICAO '
      'FROM CONTRATOEMPTMOMSG'
      'WHERE IDCONTRATOEMPTMO = :IDCONTRATOEMPTMO AND'
      '      FLGEXIBEMSG = 1  AND'
      '      (DATAEXPIRAMSG > SYSDATE OR DATAEXPIRAMSG IS NULL)'
      'ORDER BY TRGDTINCLUSAO ASC')
    ValidateWithMask = True
    Left = 687
    Top = 142
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDCONTRATOEMPTMO'
        ParamType = ptUnknown
      end>
  end
end
