inherited frmConsAtend: TfrmConsAtend
  Left = 19
  Top = 58
  HelpContext = 190038
  BorderStyle = bsNone
  Caption = 'Consulta de Atendimento'
  ClientHeight = 469
  ClientWidth = 737
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 737
    Height = 431
    Align = alNone
    object PagConsulta: TPageControl
      Left = 1
      Top = 1
      Width = 735
      Height = 429
      ActivePage = TbsResultado
      Align = alClient
      TabOrder = 0
      object TbsFiltro: TTabSheet
        Caption = 'Filtro'
        object Bevel1: TBevel
          Left = 580
          Top = 256
          Width = 117
          Height = 97
          Shape = bsFrame
        end
        object Label1: TLabel
          Left = 5
          Top = 62
          Width = 84
          Height = 13
          Caption = 'Patrocinadora '
        end
        object Label2: TLabel
          Left = 6
          Top = 153
          Width = 59
          Height = 13
          Caption = 'Atendente'
        end
        object Label6: TLabel
          Left = 358
          Top = 106
          Width = 37
          Height = 13
          Caption = 'Status'
        end
        object Label4: TLabel
          Left = 358
          Top = 62
          Width = 127
          Height = 13
          Caption = 'Forma de Atendimento'
        end
        object Label29: TLabel
          Left = 4
          Top = 106
          Width = 27
          Height = 13
          Caption = 'Filial'
        end
        object Label7: TLabel
          Left = 590
          Top = 263
          Width = 65
          Height = 13
          Caption = 'Data inicial'
        end
        object Label8: TLabel
          Left = 590
          Top = 306
          Width = 59
          Height = 13
          Caption = 'Data Final'
        end
        object Label3: TLabel
          Left = 6
          Top = 199
          Width = 118
          Height = 13
          Caption = 'Plano Previdenciário'
        end
        object Label10: TLabel
          Left = 358
          Top = 153
          Width = 129
          Height = 13
          Caption = 'Situação na Fundação'
        end
        object Label11: TLabel
          Left = 358
          Top = 199
          Width = 124
          Height = 13
          Caption = 'Local de Atendimento'
        end
        object Label34: TLabel
          Left = 5
          Top = 20
          Width = 40
          Height = 13
          Caption = 'Código'
        end
        object Label35: TLabel
          Left = 101
          Top = 20
          Width = 39
          Height = 13
          Caption = 'Compl.'
        end
        object Label36: TLabel
          Left = 89
          Top = 34
          Width = 8
          Height = 13
          Caption = '_'
        end
        object cmbpatro: TwwDBLookupCombo
          Left = 5
          Top = 78
          Width = 341
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'60'#9'Nome da Patrocinadora')
          LookupTable = qrypatro
          LookupField = 'IDPESSOA'
          TabOrder = 2
          AutoDropDown = True
          ShowButton = True
          OrderByDisplay = False
          AllowClearKey = True
          ShowMatchText = True
          OnEnter = cmbpatroEnter
        end
        object cmbatend: TwwDBLookupCombo
          Left = 6
          Top = 170
          Width = 341
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOMEUSUARIO'#9'20'#9'Nome do Usuário')
          LookupTable = qryatendent
          LookupField = 'IDUSUARIO'
          TabOrder = 3
          AutoDropDown = True
          ShowButton = True
          OrderByDisplay = False
          AllowClearKey = True
          ShowMatchText = True
          OnEnter = cmbpatroEnter
        end
        object cmbforma: TwwDBLookupCombo
          Left = 358
          Top = 78
          Width = 341
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'60'#9'Forma de Atendimento')
          LookupTable = qryformaatend
          LookupField = 'IDTIPOATEND'
          TabOrder = 4
          AutoDropDown = True
          ShowButton = True
          OrderByDisplay = False
          AllowClearKey = True
          ShowMatchText = True
          OnEnter = cmbpatroEnter
        end
        object cmbstatus: TComboBox
          Left = 358
          Top = 123
          Width = 341
          Height = 21
          ItemHeight = 13
          Sorted = True
          TabOrder = 5
          Items.Strings = (
            'Cancelado'
            'Concluído'
            'Pendente')
        end
        object GroupBox4: TGroupBox
          Left = 4
          Top = 251
          Width = 572
          Height = 102
          Caption = 'Participante'
          TabOrder = 6
          TabStop = True
          object Label15: TLabel
            Left = 11
            Top = 15
            Width = 55
            Height = 13
            Caption = 'Matrícula'
          end
          object Label13: TLabel
            Left = 11
            Top = 55
            Width = 33
            Height = 13
            Caption = 'Nome'
          end
          object Label5: TLabel
            Left = 202
            Top = 15
            Width = 24
            Height = 13
            Caption = 'CPF'
          end
          object Label9: TLabel
            Left = 402
            Top = 16
            Width = 143
            Height = 13
            Caption = 'Inscrição em Plano Prev.'
          end
          object edmatricula: TEdit
            Left = 11
            Top = 31
            Width = 184
            Height = 21
            TabOrder = 0
          end
          object edcpf: TEdit
            Left = 202
            Top = 31
            Width = 193
            Height = 21
            TabOrder = 1
          end
          object ednome: TEdit
            Left = 11
            Top = 70
            Width = 552
            Height = 21
            CharCase = ecUpperCase
            TabOrder = 2
          end
          object edinsc: TEdit
            Left = 402
            Top = 32
            Width = 161
            Height = 21
            TabOrder = 3
          end
        end
        object cmbfilial: TwwDBLookupCombo
          Left = 5
          Top = 123
          Width = 341
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'60'#9'Noma da Filial')
          LookupTable = qryfilial
          LookupField = 'IDPESSOA'
          TabOrder = 7
          AutoDropDown = True
          ShowButton = True
          OrderByDisplay = False
          AllowClearKey = True
          ShowMatchText = True
          OnEnter = cmbpatroEnter
        end
        object dataini: TCMDateTimePicker
          Left = 590
          Top = 279
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
          TabOrder = 8
        end
        object datafin: TCMDateTimePicker
          Left = 590
          Top = 321
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
          TabOrder = 9
        end
        object CmbPlanPrev: TwwDBLookupCombo
          Left = 6
          Top = 219
          Width = 341
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'50'#9'Nome'
            'IDPLANOPREV'#9'10'#9'IDPLANOPREV')
          LookupTable = QryPlanPrev
          LookupField = 'IDPLANOPREV'
          TabOrder = 10
          AutoDropDown = True
          ShowButton = True
          OrderByDisplay = False
          AllowClearKey = True
          ShowMatchText = True
          OnEnter = cmbpatroEnter
        end
        object CmbSitcad: TwwDBLookupCombo
          Left = 358
          Top = 170
          Width = 341
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'50'#9'DESCRICAO'
            'IDSITPART'#9'10'#9'IDSITPART')
          LookupTable = QrySituCad
          LookupField = 'IDSITPART'
          TabOrder = 11
          AutoDropDown = True
          ShowButton = True
          OrderByDisplay = False
          AllowClearKey = True
          ShowMatchText = True
          OnEnter = cmbpatroEnter
        end
        object CmbLocalAtend: TwwDBLookupCombo
          Left = 358
          Top = 219
          Width = 341
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCLOCALATEND'#9'60'#9'DESCLOCALATEND')
          LookupTable = QtyLocalAtend
          LookupField = 'IDLOCALATEND'
          TabOrder = 12
          AutoDropDown = True
          ShowButton = True
          OrderByDisplay = False
          AllowClearKey = True
          ShowMatchText = True
          OnEnter = cmbpatroEnter
        end
        object EdtMaskCodAtend: TMaskEdit
          Left = 5
          Top = 36
          Width = 80
          Height = 21
          EditMask = '9999999999999999999999;0; '
          MaxLength = 22
          TabOrder = 0
        end
        object EdtMaskCompl: TMaskEdit
          Left = 103
          Top = 36
          Width = 22
          Height = 21
          EditMask = '99;0; '
          MaxLength = 2
          TabOrder = 1
        end
      end
      object TbsResultado: TTabSheet
        Caption = 'Resultado'
        object PgResposta: TPageControl
          Left = 0
          Top = 0
          Width = 727
          Height = 401
          ActivePage = TbsAssuntos
          Align = alClient
          HotTrack = True
          MultiLine = True
          TabOrder = 0
          TabPosition = tpBottom
          object TbsGeral: TTabSheet
            Caption = 'Atendimentos'
            object Label12: TLabel
              Left = 8
              Top = 42
              Width = 40
              Height = 13
              Caption = 'Código'
              FocusControl = DBEdit1
            end
            object Label14: TLabel
              Left = 93
              Top = 42
              Width = 35
              Height = 13
              Caption = 'Compl'
              FocusControl = DBEdit2
            end
            object Label16: TLabel
              Left = 132
              Top = 42
              Width = 98
              Height = 13
              Caption = 'Data\Hora Início'
              FocusControl = DBEdit3
            end
            object Label17: TLabel
              Left = 260
              Top = 42
              Width = 84
              Height = 13
              Caption = 'Data\Hora Fim'
              FocusControl = DBEdit4
            end
            object Label18: TLabel
              Left = 392
              Top = 42
              Width = 57
              Height = 13
              Caption = 'Tempo (s)'
              FocusControl = DBEdit5
            end
            object Label19: TLabel
              Left = 368
              Top = 80
              Width = 61
              Height = 13
              Caption = 'Solicitante'
              FocusControl = DBEdit6
            end
            object Label20: TLabel
              Left = 8
              Top = 119
              Width = 37
              Height = 13
              Caption = 'Titular'
              FocusControl = DBEdit7
            end
            object Label21: TLabel
              Left = 273
              Top = 119
              Width = 65
              Height = 13
              Caption = 'Documento'
              FocusControl = DBEdit8
            end
            object Label22: TLabel
              Left = 565
              Top = 119
              Width = 55
              Height = 13
              Caption = 'Matrícula'
              FocusControl = DBEdit9
            end
            object Label23: TLabel
              Left = 586
              Top = 80
              Width = 51
              Height = 13
              Caption = 'Telefone'
              FocusControl = DBEdit10
            end
            object Label24: TLabel
              Left = 8
              Top = 80
              Width = 95
              Height = 13
              Caption = 'Nome Atendente'
              FocusControl = DBEdit11
            end
            object Label25: TLabel
              Left = 458
              Top = 42
              Width = 37
              Height = 13
              Caption = 'Status'
              FocusControl = DBEdit12
            end
            object Label26: TLabel
              Left = 552
              Top = 42
              Width = 35
              Height = 13
              Caption = 'Forma'
              FocusControl = DBEdit13
            end
            object Label27: TLabel
              Left = 389
              Top = 119
              Width = 80
              Height = 13
              Caption = 'Patrocinadora'
              FocusControl = DBEdit14
            end
            object Label28: TLabel
              Left = 257
              Top = 80
              Width = 68
              Height = 13
              Caption = 'Computador'
              FocusControl = DBEdit15
            end
            object Label30: TLabel
              Left = 137
              Top = 80
              Width = 106
              Height = 13
              Caption = 'Local Atendimento'
              FocusControl = DBEdit16
            end
            object Label31: TLabel
              Left = 8
              Top = 157
              Width = 52
              Height = 13
              Caption = 'Pergunta'
            end
            object Label32: TLabel
              Left = 241
              Top = 157
              Width = 54
              Height = 13
              Caption = 'Resposta'
            end
            object Label33: TLabel
              Left = 476
              Top = 157
              Width = 23
              Height = 13
              Caption = 'Obs'
            end
            object Bevel2: TBevel
              Left = 7
              Top = 276
              Width = 695
              Height = 4
            end
            object DBText1: TDBText
              Left = 8
              Top = 294
              Width = 60
              Height = 16
              AutoSize = True
              DataField = 'LABELCOUNT'
              DataSource = ds
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBEdit1: TDBEdit
              Left = 8
              Top = 58
              Width = 77
              Height = 21
              Color = clGray
              DataField = 'CODATEND'
              DataSource = ds
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
            end
            object DBEdit2: TDBEdit
              Left = 93
              Top = 58
              Width = 28
              Height = 21
              Color = clGray
              DataField = 'COMPLCODATEND'
              DataSource = ds
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 1
            end
            object DBEdit3: TDBEdit
              Left = 132
              Top = 59
              Width = 126
              Height = 21
              Color = clGray
              DataField = 'DATAINICIO'
              DataSource = ds
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 2
            end
            object DBEdit4: TDBEdit
              Left = 260
              Top = 59
              Width = 130
              Height = 21
              Color = clGray
              DataField = 'DATA'
              DataSource = ds
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 3
            end
            object DBEdit5: TDBEdit
              Left = 392
              Top = 59
              Width = 62
              Height = 21
              Color = clGray
              DataField = 'TEMPOATENDIMENTO'
              DataSource = ds
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 4
            end
            object DBEdit6: TDBEdit
              Left = 368
              Top = 97
              Width = 215
              Height = 21
              Color = clGray
              DataField = 'NOMESOLICITANTE'
              DataSource = ds
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 5
            end
            object DBEdit7: TDBEdit
              Left = 8
              Top = 134
              Width = 261
              Height = 21
              Color = clGray
              DataField = 'TITULAR'
              DataSource = ds
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 6
            end
            object DBEdit8: TDBEdit
              Left = 273
              Top = 134
              Width = 113
              Height = 21
              Color = clGray
              DataField = 'CPF'
              DataSource = ds
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 7
            end
            object DBEdit9: TDBEdit
              Left = 565
              Top = 134
              Width = 137
              Height = 21
              Color = clGray
              DataField = 'MATRICULA'
              DataSource = ds
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 8
            end
            object DBEdit10: TDBEdit
              Left = 586
              Top = 97
              Width = 116
              Height = 21
              Color = clGray
              DataField = 'NUMEROTELSOLIC'
              DataSource = ds
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 9
            end
            object DBEdit11: TDBEdit
              Left = 8
              Top = 96
              Width = 125
              Height = 21
              Color = clGray
              DataField = 'NOMEUSUARIO'
              DataSource = ds
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 10
            end
            object DBEdit12: TDBEdit
              Left = 458
              Top = 59
              Width = 90
              Height = 21
              Color = clGray
              DataField = 'STATUS'
              DataSource = ds
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 11
            end
            object DBEdit13: TDBEdit
              Left = 552
              Top = 58
              Width = 150
              Height = 21
              Color = clGray
              DataField = 'TIPO'
              DataSource = ds
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 12
            end
            object DBEdit14: TDBEdit
              Left = 389
              Top = 134
              Width = 172
              Height = 21
              Color = clGray
              DataField = 'PATRO'
              DataSource = ds
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 13
            end
            object DBEdit15: TDBEdit
              Left = 257
              Top = 97
              Width = 108
              Height = 21
              Color = clGray
              DataField = 'DESCCPUATEND'
              DataSource = ds
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 14
            end
            object DBEdit16: TDBEdit
              Left = 137
              Top = 97
              Width = 117
              Height = 21
              Color = clGray
              DataField = 'DESCLOCALATEND'
              DataSource = ds
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 15
            end
            object DBMemo1: TDBMemo
              Left = 8
              Top = 171
              Width = 228
              Height = 98
              Color = clGray
              DataField = 'PERGUNTA'
              DataSource = ds
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              ScrollBars = ssVertical
              TabOrder = 16
            end
            object DBMemo2: TDBMemo
              Left = 241
              Top = 171
              Width = 228
              Height = 98
              Color = clGray
              DataField = 'RESPOSTA'
              DataSource = ds
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              ScrollBars = ssVertical
              TabOrder = 17
            end
            object DBMemo3: TDBMemo
              Left = 475
              Top = 171
              Width = 227
              Height = 98
              Color = clGray
              DataField = 'OBSERVACAO'
              DataSource = ds
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              ScrollBars = ssVertical
              TabOrder = 18
            end
            object DBNavigator1: TDBNavigator
              Left = 478
              Top = 288
              Width = 224
              Height = 25
              DataSource = ds
              VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
              TabOrder = 19
            end
          end
          object TbsAssuntos: TTabSheet
            Caption = 'Assuntos'
            object GrdAssuntoxAtend: TwwDBGrid
              Left = 0
              Top = 0
              Width = 719
              Height = 373
              Selected.Strings = (
                'DESCGRUPOASSUNTO'#9'35'#9'Grupo de Assunto'#9'F'
                'NOME'#9'35'#9'Assunto'#9'F'
                'EXISTERAD'#9'4'#9'RAD'#9'F'
                'EXISTERUB'#9'5'#9'RUBS'#9'F'
                'IDPROCESSO'#9'6'#9'Nº RAD'#9'F'
                'IDRUBS'#9'10'#9'Nº da RUBS'#9'F'
                'DESCRESPATEN'#9'200'#9'Resposta Padrão'#9'F')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              Align = alClient
              DataSource = DsAssuntoxAtend
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
      end
    end
  end
  inherited Dock971: TDock97
    Top = 430
    Width = 737
    inherited tb97Fundo: TToolbar97
      Left = 439
      DockPos = 439
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited ToolbarSep971: TToolbarSep97
        Left = 161
      end
      inherited bbtnConfirmar: TBitBtn
        Left = 80
      end
      inherited bbtnCancelar: TBitBtn
        Left = 164
      end
      object bbtnConsultar: TBitBtn
        Left = 0
        Top = 0
        Width = 80
        Height = 33
        Caption = '&Consulta'
        Default = True
        TabOrder = 2
        OnClick = bbtnConsultarClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          333333333333FF3333333333333C0C333333333333F777F3333333333CC0F0C3
          333333333777377F33333333C30F0F0C333333337F737377F333333C00FFF0F0
          C33333F7773337377F333CC0FFFFFF0F0C3337773F33337377F3C30F0FFFFFF0
          F0C37F7373F33337377F00FFF0FFFFFF0F0C7733373F333373770FFFFF0FFFFF
          F0F073F33373F333373730FFFFF0FFFFFF03373F33373F333F73330FFFFF0FFF
          00333373F33373FF77333330FFFFF000333333373F333777333333330FFF0333
          3333333373FF7333333333333000333333333333377733333333333333333333
          3333333333333333333333333333333333333333333333333333}
        NumGlyphs = 2
        Spacing = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 523
    Top = 344
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object ds: TwwDataSource
    AutoEdit = False
    DataSet = qryatend
    Left = 198
    Top = 344
  end
  object qryatend: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      ' SELECT'
      ' AT.IDATEND, '
      
        ' AT.CODATEND, AT.COMPLCODATEND, AT.NOMESOLICITANTE, AT.NUMEROTEL' +
        'SOLIC,'
      ' AT.CODATENDENTE ,AT.DATA , AT.STATUS, AT.OBSERVACAO,'
      ' TP.NOME TIPO ,'
      ' EL.MATRICULA ,'
      ' P.NUMDOCUMENTO CPF, P.NOME TITULAR , PJ.NOME PATRO,'
      
        ' US.NOMEUSUARIO, AT.DATAINICIO, ((AT.DATA - AT.DATAINICIO)*86400' +
        ') AS TEMPOATENDIMENTO,'
      ' AT.PERGUNTA, AT.RESPOSTA, C.DESCCPUATEND, L.DESCLOCALATEND'
      ' FROM'
      ' ATEND AT , TIPOATEND TP , ELEGPATRO EL, PESSOA P ,'
      ' PESSOA PJ, USUARIOSISTEMA US, PARTPREVPLAN PREV,'
      ' LOCALATENDXCPU X, CPUATEND C, LOCALATEND L'
      ' WHERE'
      ' 1=2'
      ' ')
    ValidateWithMask = True
    Left = 38
    Top = 350
    object qryatendCODATEND: TFloatField
      DisplayLabel = 'Código'
      DisplayWidth = 15
      FieldName = 'CODATEND'
    end
    object qryatendCOMPLCODATEND: TFloatField
      DisplayLabel = 'Compl'
      DisplayWidth = 3
      FieldName = 'COMPLCODATEND'
    end
    object qryatendDATAINICIO: TDateTimeField
      DisplayLabel = 'Data\Hora Início'
      DisplayWidth = 16
      FieldName = 'DATAINICIO'
      DisplayFormat = 'DD\MM\YYYY HH:NN:SS'
    end
    object qryatendDATA: TDateTimeField
      DisplayLabel = 'Data\Hora Fim'
      DisplayWidth = 17
      FieldName = 'DATA'
      DisplayFormat = 'DD\MM\YYYY HH:NN:SS'
    end
    object qryatendTEMPOATENDIMENTO: TFloatField
      DisplayLabel = 'Tempo (s)'
      DisplayWidth = 10
      FieldName = 'TEMPOATENDIMENTO'
    end
    object qryatendNOMESOLICITANTE: TStringField
      DisplayLabel = 'Solicitante'
      DisplayWidth = 60
      FieldName = 'NOMESOLICITANTE'
      Size = 60
    end
    object qryatendTITULAR: TStringField
      DisplayLabel = 'Titular'
      DisplayWidth = 60
      FieldName = 'TITULAR'
      Size = 60
    end
    object qryatendCPF: TStringField
      DisplayLabel = 'Documento'
      DisplayWidth = 18
      FieldName = 'CPF'
      Size = 18
    end
    object qryatendMATRICULA: TStringField
      DisplayLabel = 'Matrícula'
      DisplayWidth = 13
      FieldName = 'MATRICULA'
      Size = 13
    end
    object qryatendCODATENDENTE: TStringField
      DisplayLabel = 'Atendente'
      DisplayWidth = 10
      FieldName = 'CODATENDENTE'
    end
    object qryatendNOMEUSUARIO: TStringField
      DisplayLabel = 'Nome Atendente'
      DisplayWidth = 20
      FieldName = 'NOMEUSUARIO'
    end
    object qryatendSTATUS: TStringField
      DisplayLabel = 'Status'
      DisplayWidth = 10
      FieldName = 'STATUS'
    end
    object qryatendTIPO: TStringField
      DisplayLabel = 'Tipo'
      DisplayWidth = 60
      FieldName = 'TIPO'
      Size = 60
    end
    object qryatendPATRO: TStringField
      DisplayLabel = 'Patrocinadora'
      DisplayWidth = 60
      FieldName = 'PATRO'
      Size = 60
    end
    object qryatendDESCCPUATEND: TStringField
      DisplayLabel = 'Computador'
      DisplayWidth = 20
      FieldName = 'DESCCPUATEND'
      Size = 60
    end
    object qryatendDESCLOCALATEND: TStringField
      DisplayLabel = 'Local Atendimento'
      DisplayWidth = 20
      FieldName = 'DESCLOCALATEND'
      Size = 60
    end
    object qryatendPERGUNTA: TStringField
      DisplayLabel = 'Pergunta'
      DisplayWidth = 250
      FieldName = 'PERGUNTA'
      Size = 250
    end
    object qryatendRESPOSTA: TStringField
      DisplayLabel = 'Resposta'
      DisplayWidth = 250
      FieldName = 'RESPOSTA'
      Size = 250
    end
    object qryatendOBSERVACAO: TStringField
      DisplayLabel = 'Obs'
      DisplayWidth = 250
      FieldName = 'OBSERVACAO'
      Size = 250
    end
    object qryatendIDATEND: TFloatField
      FieldName = 'IDATEND'
      Visible = False
    end
    object qryatendLABELCOUNT: TStringField
      FieldKind = fkCalculated
      FieldName = 'LABELCOUNT'
      Size = 40
      Calculated = True
    end
    object qryatendNUMEROTELSOLIC: TStringField
      FieldName = 'NUMEROTELSOLIC'
      FixedChar = True
    end
  end
  object qryformaatend: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDTIPOATEND, NOME '
      'FROM'
      ' TIPOATEND'
      'ORDER BY'
      '  NOME')
    ValidateWithMask = True
    Left = 103
    Top = 350
    object qryformaatendIDTIPOATEND: TFloatField
      FieldName = 'IDTIPOATEND'
      Origin = '"CM.TIPOATEND".IDTIPOATEND'
    end
    object qryformaatendNOME: TStringField
      FieldName = 'NOME'
      Origin = '"CM.TIPOATEND".NOME'
      Size = 60
    end
  end
  object dsformaatend: TwwDataSource
    DataSet = qryformaatend
    Left = 244
    Top = 288
  end
  object dspatro: TwwDataSource
    DataSet = qrypatro
    Left = 291
    Top = 344
  end
  object qrypatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  P.IDPESSOA , P.NOME'
      'FROM'
      '  PESSOA P, PATRO PA'
      'WHERE'
      '  P.IDPESSOA = PA.IDPESSOA'
      'ORDER'
      '  BY P.NOME')
    ValidateWithMask = True
    Left = 296
    Top = 390
    object qrypatroIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = '"CM.PESSOA".IDPESSOA'
    end
    object qrypatroNOME: TStringField
      DisplayLabel = 'Nome da Patrocinadora'
      DisplayWidth = 60
      FieldName = 'NOME'
      Origin = '"CM.PESSOA".NOME'
      Size = 60
    end
  end
  object qryatendent: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '  IDUSUARIO, NOMEUSUARIO'
      'FROM '
      '  USUARIOSISTEMA'
      'ORDER BY'
      '  NOMEUSUARIO')
    ValidateWithMask = True
    Left = 338
    Top = 390
    object qryatendentIDUSUARIO: TFloatField
      FieldName = 'IDUSUARIO'
      Origin = 'USUARIOSISTEMA.IDUSUARIO'
    end
    object qryatendentNOMEUSUARIO: TStringField
      FieldName = 'NOMEUSUARIO'
      Origin = 'USUARIOSISTEMA.NOMEUSUARIO'
    end
  end
  object dsatend: TwwDataSource
    DataSet = qryatendent
    Left = 337
    Top = 344
  end
  object QrySituCad: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDSITPART, DESCRICAO'
      'FROM'
      '  SITPART'
      'ORDER BY'
      '  DESCRICAO')
    ValidateWithMask = True
    Left = 384
    Top = 320
    object QrySituCadDESCRICAO: TStringField
      DisplayWidth = 50
      FieldName = 'DESCRICAO'
      Origin = '"CM.SITPART".DESCRICAO'
      Size = 50
    end
    object QrySituCadIDSITPART: TFloatField
      DisplayWidth = 10
      FieldName = 'IDSITPART'
      Origin = '"CM.SITPART".IDSITPART'
    end
  end
  object qryfilial: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '   P.NOME, P.IDPESSOA '
      'FROM  '
      '  PESSOA P, FILIALPESSOA FP'
      'WHERE '
      '  P.IDPESSOA = FP.IDFILIALPESSOA'
      'ORDER BY'
      '   P.NOME')
    ValidateWithMask = True
    Left = 387
    Top = 390
    object qryfilialNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qryfilialIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
  end
  object QtyLocalAtend: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDLOCALATEND, DESCLOCALATEND'
      'FROM'
      '  LOCALATEND'
      'ORDER BY'
      '  DESCLOCALATEND')
    ValidateWithMask = True
    Left = 436
    Top = 390
    object QtyLocalAtendDESCLOCALATEND: TStringField
      DisplayWidth = 60
      FieldName = 'DESCLOCALATEND'
      Origin = 'LOCALATEND.DESCLOCALATEND'
      Size = 60
    end
    object QtyLocalAtendIDLOCALATEND: TFloatField
      DisplayWidth = 10
      FieldName = 'IDLOCALATEND'
      Origin = 'LOCALATEND.IDLOCALATEND'
      Visible = False
    end
  end
  object QryPlanPrev: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '  IDPLANOPREV, NOME '
      'FROM '
      '  PLANPREV'
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 430
    Top = 344
    object QryPlanPrevNOME: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 50
      FieldName = 'NOME'
      Origin = '"CM.PLANPREV".NOME'
      Size = 50
    end
    object QryPlanPrevIDPLANOPREV: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPLANOPREV'
      Origin = '"CM.PLANPREV".IDPLANOPREV'
    end
  end
  object QryAssuntoxAtend: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = ds
    SQL.Strings = (
      'SELECT GR.DESCGRUPOASSUNTO, A.IDATEND, A.IDPROCESSO, RU.IDRUBS,'
      '       DECODE(A.IDPROCESSO,NULL,0.00,1.00) AS EXISTERAD,'
      '       DECODE(A.IDRUBS,NULL,0.00,1.00) AS EXISTERUB,'
      '       R.DESCRESPATEN, ASS.NOME'
      'FROM ASSUNTOXATEND A, RESPATEND R, ASSUNTOXRESP AR, ASSUNTO ASS,'
      '     GRUPOASSUNTO GR, RUBS RU'
      'WHERE ( IDATEND            = :IDATEND              )'
      '  AND ( A.IDASSUNTOXRESP   = AR.IDASSUNTOXRESP(+)  )'
      '  AND ( AR.IDRESPATEND     = R.IDRESPATEND(+)      )'
      '  AND ( A.IDASSUNTO        = ASS.IDASSUNTO         )'
      '  AND ( ASS.IDGRUPOASSUNTO = GR.IDGRUPOASSUNTO     )'
      ''
      '  AND ( A.IDASSUNTOXATEND  = RU.IDASSUNTOXATEND(+) )')
    ControlType.Strings = (
      'DESCRESPATEN;RichEdit;'
      'EXISTERAD;CheckBox;1;0'
      'EXISTERUB;CheckBox;1;0')
    ValidateWithMask = True
    Left = 445
    Top = 302
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDATEND'
        ParamType = ptUnknown
      end>
    object QryAssuntoxAtendDESCGRUPOASSUNTO: TStringField
      DisplayLabel = 'Grupo de Assunto'
      DisplayWidth = 35
      FieldName = 'DESCGRUPOASSUNTO'
      Size = 60
    end
    object QryAssuntoxAtendNOME: TStringField
      DisplayLabel = 'Assunto'
      DisplayWidth = 35
      FieldName = 'NOME'
      Size = 60
    end
    object QryAssuntoxAtendEXISTERAD: TFloatField
      DisplayLabel = 'RAD'
      DisplayWidth = 4
      FieldName = 'EXISTERAD'
    end
    object QryAssuntoxAtendEXISTERUB: TFloatField
      DisplayLabel = 'RUBS'
      DisplayWidth = 5
      FieldName = 'EXISTERUB'
    end
    object QryAssuntoxAtendIDPROCESSO: TFloatField
      DisplayLabel = 'Nº RAD'
      DisplayWidth = 6
      FieldName = 'IDPROCESSO'
    end
    object QryAssuntoxAtendIDRUBS: TFloatField
      DisplayLabel = 'Nº da RUBS'
      DisplayWidth = 10
      FieldName = 'IDRUBS'
    end
    object QryAssuntoxAtendDESCRESPATEN: TMemoField
      DisplayLabel = 'Resposta Padrão'
      DisplayWidth = 200
      FieldName = 'DESCRESPATEN'
      BlobType = ftMemo
      Size = 2000
    end
    object QryAssuntoxAtendIDATEND: TFloatField
      DisplayWidth = 10
      FieldName = 'IDATEND'
      Visible = False
    end
  end
  object DsAssuntoxAtend: TwwDataSource
    DataSet = QryAssuntoxAtend
    Left = 477
    Top = 344
  end
end
