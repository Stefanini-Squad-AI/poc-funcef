inherited frmEventoRetornoMantidoParaAtivo: TfrmEventoRetornoMantidoParaAtivo
  Left = 539
  Top = 152
  Caption = 'Evento Retorno de Mantido Integral para Ativo'
  ClientHeight = 476
  ClientWidth = 732
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 732
    Height = 437
    object lblValores: TLabel
      Left = 15
      Top = 5
      Width = 222
      Height = 23
      AutoSize = False
      Caption = 'Dados do Participante'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -19
      Font.Name = 'Bookman Old Style'
      Font.Style = [fsItalic]
      ParentFont = False
    end
    object pgctrlEvento: TPageControl
      Left = 1
      Top = 202
      Width = 730
      Height = 234
      ActivePage = tbsInfoGerais
      Align = alBottom
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      object tbsInfoGerais: TTabSheet
        Caption = 'Informações Gerais'
        object pnlInformacao: TPanel
          Left = 0
          Top = 0
          Width = 722
          Height = 206
          Align = alClient
          BevelOuter = bvLowered
          TabOrder = 0
          object pnlSitAntes: TPanel
            Left = 1
            Top = 1
            Width = 189
            Height = 204
            Align = alLeft
            BevelInner = bvLowered
            TabOrder = 0
            object Label11: TLabel
              Left = 2
              Top = 2
              Width = 185
              Height = 13
              Align = alTop
              Caption = ' Situação Antes da Manutenção'
            end
            object lblPatroAntes: TLabel
              Left = 9
              Top = 24
              Width = 66
              Height = 13
              Caption = 'Patrocinadora'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object lblMatriculaAntes: TLabel
              Left = 9
              Top = 45
              Width = 43
              Height = 13
              Caption = 'Matricula'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object lblSitFuncAntes: TLabel
              Left = 9
              Top = 67
              Width = 36
              Height = 13
              Caption = 'SitFunc'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object lblSitPlanoAntes: TLabel
              Left = 9
              Top = 88
              Width = 39
              Height = 13
              Caption = 'SitPlano'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object lblSitPartAntes: TLabel
              Left = 9
              Top = 109
              Width = 31
              Height = 13
              Caption = 'SitPart'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object lblDataAdmAntes: TLabel
              Left = 9
              Top = 131
              Width = 112
              Height = 13
              Caption = 'Admissão : 10/10/1999'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object lblDataDemissAntes: TLabel
              Left = 9
              Top = 152
              Width = 113
              Height = 13
              Caption = 'Demissao : 10/10/1999'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
          end
          object pnlSitDurante: TPanel
            Left = 190
            Top = 1
            Width = 211
            Height = 204
            Align = alClient
            BevelInner = bvLowered
            TabOrder = 1
            object Label17: TLabel
              Left = 2
              Top = 2
              Width = 207
              Height = 13
              Align = alTop
              Caption = ' Situação Durante a Manutenção'
            end
            object lblSitFuncDurante: TLabel
              Left = 9
              Top = 67
              Width = 36
              Height = 13
              Caption = 'SitFunc'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object lblSitPlanoDurante: TLabel
              Left = 9
              Top = 88
              Width = 39
              Height = 13
              Caption = 'SitPlano'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object lblSitPartDurante: TLabel
              Left = 9
              Top = 109
              Width = 31
              Height = 13
              Caption = 'SitPart'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object lblIniManut: TLabel
              Left = 9
              Top = 131
              Width = 114
              Height = 13
              Caption = 'Início da Manutenção : '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object lblFimManut: TLabel
              Left = 9
              Top = 154
              Width = 94
              Height = 13
              Caption = 'Fim da Manutenção'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object dtVolta: TCMDateTimePicker
              Left = 9
              Top = 167
              Width = 130
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
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ShowButton = True
              TabOrder = 0
              OnExit = dtVoltaExit
            end
          end
          object pnlSitDepois: TPanel
            Left = 401
            Top = 1
            Width = 320
            Height = 204
            Align = alRight
            BevelInner = bvLowered
            TabOrder = 2
            object lblMatricula: TLabel
              Left = 107
              Top = 59
              Width = 55
              Height = 13
              Caption = 'Matrícula'
            end
            object Label4: TLabel
              Left = 7
              Top = 59
              Width = 95
              Height = 13
              Caption = 'Data de Retorno'
            end
            object Label18: TLabel
              Left = 2
              Top = 2
              Width = 316
              Height = 13
              Align = alTop
              Caption = ' Situação Após o Retorno para Ativo'
            end
            object Label5: TLabel
              Left = 7
              Top = 19
              Width = 309
              Height = 13
              Caption = 'Patrocinadora na qual o Participante está ingressando'
            end
            object lblSitNovaPatro: TLabel
              Left = 7
              Top = 95
              Width = 186
              Height = 13
              Caption = 'Nova Situação na Patrocinadora'
            end
            object Label7: TLabel
              Left = 7
              Top = 130
              Width = 139
              Height = 13
              Caption = 'Nova Situação no Plano'
            end
            object Label13: TLabel
              Left = 7
              Top = 165
              Width = 163
              Height = 13
              Caption = 'Nova Situação na Fundação'
            end
            object Label19: TLabel
              Left = 212
              Top = 59
              Width = 91
              Height = 13
              Caption = 'Salário de Ativo'
            end
            object edMatricula1: TEdit
              Left = 107
              Top = 71
              Width = 102
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
            end
            object dtEvento: TCMDateTimePicker
              Left = 7
              Top = 71
              Width = 98
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
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ShowButton = True
              TabOrder = 1
              OnExit = dtEventoExit
            end
            object dblkpcmbPatro: TwwDBLookupCombo
              Left = 7
              Top = 35
              Width = 307
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'60'#9'Patrocinadora')
              LookupTable = qryPatro
              LookupField = 'IDPESSOA'
              Options = [loTitles]
              ParentFont = False
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
            end
            object dblkpcmbSitFunc: TwwDBLookupCombo
              Left = 7
              Top = 108
              Width = 307
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'50'#9'Situação do Participante na Patrocinadora')
              DataField = 'IDSITFUNC'
              LookupTable = qrySitFunc
              LookupField = 'IDSITFUNC'
              Options = [loTitles]
              ParentFont = False
              TabOrder = 4
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
            object dblkpcmbSitPlanoPrev: TwwDBLookupCombo
              Left = 7
              Top = 144
              Width = 307
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'50'#9'Situação do Participante no Plano')
              DataField = 'IDSITPLANOPREV'
              LookupTable = qrySitPlanoPrev
              LookupField = 'IDSITPLANOPREV'
              Options = [loTitles]
              ParentFont = False
              TabOrder = 5
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
            object dblkpcmbSitPart: TwwDBLookupCombo
              Left = 7
              Top = 179
              Width = 307
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'50'#9'Situação do Participante na Fundação')
              DataField = 'IDSITPART'
              LookupTable = qrySitPart
              LookupField = 'IDSITPART'
              Options = [loTitles]
              ParentFont = False
              TabOrder = 6
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
            object reSalarioAtivo: TRealEdit
              Left = 212
              Top = 71
              Width = 102
              Height = 21
              Alignment = taRightJustify
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Lines.Strings = (
                '0,00')
              ParentFont = False
              TabOrder = 3
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
            end
          end
        end
      end
      object tbsHistFunc: TTabSheet
        Caption = 'Histórico Funcional'
        object pnlDadosHistFuncional: TPanel
          Left = 0
          Top = 0
          Width = 722
          Height = 206
          Align = alClient
          BevelOuter = bvLowered
          TabOrder = 0
          object Label9: TLabel
            Left = 11
            Top = 7
            Width = 34
            Height = 13
            Caption = 'Cargo'
          end
          object Label10: TLabel
            Left = 255
            Top = 7
            Width = 213
            Height = 13
            Caption = 'Tipo de Periculosidade/Insalubridade'
          end
          object Label14: TLabel
            Left = 11
            Top = 69
            Width = 184
            Height = 13
            Caption = 'Tipo de documento apresentado'
          end
          object Label15: TLabel
            Left = 248
            Top = 69
            Width = 103
            Height = 13
            Caption = 'Doc. Apresentado'
          end
          object dblkpcmbIdCargoExt: TwwDBLookupCombo
            Left = 11
            Top = 20
            Width = 238
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'TITULO'#9'30'#9'Cargo na Patrocinadora')
            LookupTable = qryCargoExt
            LookupField = 'IDCARGOEXT'
            Options = [loTitles]
            ParentFont = False
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
          end
          object dblkpcmbCodTpInsalubri: TwwDBLookupCombo
            Left = 255
            Top = 20
            Width = 238
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'60'#9'Tipo de Periculosidade / Insalubridade')
            LookupTable = qryTpInsalubri
            LookupField = 'CODTPINSALUBRI'
            Options = [loTitles]
            ParentFont = False
            TabOrder = 1
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
          end
          object dblkpcmbIdDocumento: TwwDBLookupCombo
            Left = 11
            Top = 81
            Width = 226
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOMEDOCUMENTO'#9'30'#9'Documento')
            DataField = 'IDDOCUMENTO'
            LookupTable = qryTipoDocPessoa
            LookupField = 'IDDOCUMENTO'
            ParentFont = False
            TabOrder = 2
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            OnChange = dblkpcmbIdDocumentoChange
          end
          object edNumDocumento: TEdit
            Left = 248
            Top = 81
            Width = 113
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            Text = 'edNumDocumento'
          end
        end
      end
      object tbsResultado: TTabSheet
        Caption = 'Resultado'
        object memResult: TMemo
          Left = 0
          Top = 0
          Width = 714
          Height = 206
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
      end
    end
    object Panel2: TPanel
      Left = 12
      Top = 27
      Width = 291
      Height = 166
      Enabled = False
      TabOrder = 0
      object Label2: TLabel
        Left = 11
        Top = 8
        Width = 69
        Height = 13
        Caption = 'Participante'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblPatro: TLabel
        Left = 11
        Top = 83
        Width = 80
        Height = 13
        Caption = 'Patrocinadora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 11
        Top = 46
        Width = 55
        Height = 13
        Caption = 'Matrícula'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 11
        Top = 123
        Width = 118
        Height = 13
        Caption = 'Plano Previdenciário'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edNome: TEdit
        Left = 11
        Top = 21
        Width = 270
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object edPatro: TEdit
        Left = 11
        Top = 96
        Width = 270
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
      object edMatricula: TEdit
        Left = 11
        Top = 59
        Width = 154
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object edPlano: TEdit
        Left = 11
        Top = 136
        Width = 270
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
      end
    end
    object Panel3: TPanel
      Left = 598
      Top = 27
      Width = 123
      Height = 166
      TabOrder = 1
      object ConsPart1: TConsPart
        Left = 13
        Top = 65
        Width = 91
        Height = 37
        Caption = '&Consulta'
        Enabled = False
        Glyph.Data = {
          76020000424D7602000000000000760000002800000020000000200000000100
          0400000000000002000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333333333333333333333333333333333333300333333
          3333333333333333333333330033333333333333333333333333333303333330
          3333333333333333333333330333333033333333333333333333333330333300
          0333333333333333333333333033330003333333333333333333333330033003
          3333333333333333333333333003300333333333333333333333333333030033
          3333333333333333333333333303003333333333333333333333333333000333
          3333333333333333333333333300033333333333333333330033333333000333
          3333333333333330003333333300033333333337000733000333333303300003
          333333000000000333333333033000033333307888EE70333333333330300333
          33337088888EE073333333333030033333330888888888033333333333000333
          33330888888888033333333333000333333308E8888888033333333333300333
          333308EEE888880333333333333003333333307EEE8870333333333333330033
          3333330088800333333333333333003333333337000733333333333333330033
          3333333333333333333333333333003333333333333333333333333333333333
          3333333333333333333333333333333333333333333333333333333333333333
          3333333333333333333333333333333333333333333333333333}
      end
      object bbtnProcurar: TBitBtn
        Left = 13
        Top = 22
        Width = 90
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
        TabOrder = 0
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
      object bbtnOpcoes: TBitBtn
        Left = 13
        Top = 108
        Width = 91
        Height = 37
        Hint = 'Verificar Regra de Concessão do Benefício'
        Cancel = True
        Caption = '&Opções'
        Enabled = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = bbtnOpcoesClick
        Glyph.Data = {
          42010000424D4201000000000000760000002800000011000000110000000100
          040000000000CC00000000000000000000001000000010000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
          DDDDD0000000DDDDDDDDDDDDDDDDD0000000D00000DDDDD00000D0000000D0FF
          F0DDDDD0FFF0D0000000D0FFF0DDDDD0FFF0D0000000D00000DD0DD00000D000
          0000DDD0DDD0F0DDD0DDD0000000DDD0DD0FFF0DD0DDD0000000DDD000FFFFF0
          00DDD0000000DDDDDD0FFF0DDDDDD0000000DDDDDDD0F0DDDDDDD0000000DDDD
          DDDD0DDDDDDDD0000000DDDDDD00000DDDDDD0000000DDDDDD0FFF0DDDDDD000
          0000DDDDDD0FFF0DDDDDD0000000DDDDDD00000DDDDDD0000000DDDDDDDDDDDD
          DDDDD0000000}
      end
    end
    object Panel5: TPanel
      Left = 312
      Top = 27
      Width = 277
      Height = 166
      Enabled = False
      TabOrder = 2
      object Label1: TLabel
        Left = 11
        Top = 8
        Width = 118
        Height = 13
        Caption = 'Número de Inscrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblSitPatro: TLabel
        Left = 11
        Top = 45
        Width = 152
        Height = 13
        Caption = 'Situação na Patrocinadora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 11
        Top = 83
        Width = 105
        Height = 13
        Caption = 'Situação no Plano'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label12: TLabel
        Left = 11
        Top = 121
        Width = 129
        Height = 13
        Caption = 'Situação na Fundação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edInscNumero: TEdit
        Left = 11
        Top = 21
        Width = 154
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object edSitPatro: TEdit
        Left = 11
        Top = 58
        Width = 245
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object edSitPlano: TEdit
        Left = 11
        Top = 96
        Width = 245
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
      object edSitFundacao: TEdit
        Left = 11
        Top = 134
        Width = 245
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
      end
    end
  end
  inherited Dock971: TDock97
    Top = 437
    Width = 732
    inherited tb97Fundo: TToolbar97
      Left = 559
      DockPos = 559
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 390
      DockPos = 390
      inherited bbtnConfirmar: TBitBtn
        ModalResult = 0
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        ModalResult = 0
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      1
      (
        'TRealEdit'
        'Text'
        0))
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 83
    Top = 438
  end
  object MontaSelectPart: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Participante'
    Colunas.Strings = (
      'ELEGPATRO.MATRICULA'
      'PESSOA.NOME'
      'PARTPREVPLAN.INSCRICAONUMERO'
      'PARTPREVPLAN.INSCRICAODATA'
      'PLANPREV.NOME'
      'PATRO.NOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'N'
      'D'
      'C'
      'C')
    Descricao.Strings = (
      'Matrícula'
      'Participante'
      'N° de Inscrição'
      'Data de Inscrição'
      'Plano Previdenciário'
      'Patrocinadora')
    SensivelACaixa.Strings = (
      'S'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'ELEGPATRO'
      'PARTPREVPLAN'
      'PESSOA PATRO'
      'PLANPREV'
      'SITFUNC'
      'SITPART'
      'SITPLANOPREV'
      'PESSOAFISICA')
    CamposChave.Strings = (
      'ELEGPATRO.IDPESSOA'
      'ELEGPATRO.IDPESSJUR'
      'PLANPREV.IDPLANOPREV'
      'PESSOA.NOME'
      'ELEGPATRO.MATRICULA'
      'PATRO.NOME AS PATRO'
      'PLANPREV.NOME AS PLANO'
      'SITFUNC.DESCRICAO'
      'SITPART.DESCRICAO'
      'SITPLANOPREV.DESCRICAO'
      'PARTPREVPLAN.INSCRICAONUMERO'
      'SITFUNC.IDSITFUNC'
      'SITPART.IDSITPART'
      'SITPLANOPREV.IDSITPLANOPREV'
      'PARTPREVPLAN.SEQPROPOSTA'
      'PARTPREVPLAN.INSCRICAODATA'
      'SITFUNC.TIPOSIT'
      'SITPART.FLGINTERNO'
      'SITPLANOPREV.FLGINTERNO'
      'ELEGPATRO.DATAADMISSAO'
      'PARTPREVPLAN.SALMANTIDO'
      'PARTPREVPLAN.SALPARTICIPACAO')
    Filtro.Strings = (
      'PESSOA.IDPESSOA = ELEGPATRO.IDPESSOA'
      'ELEGPATRO.IDPESSOA = PARTPREVPLAN.IDPESSOA'
      'ELEGPATRO.IDPESSJUR = PARTPREVPLAN.IDPESSJUR'
      'PARTPREVPLAN.IDPLANOPREV = PLANPREV.IDPLANOPREV'
      'PATRO.IDPESSOA = ELEGPATRO.IDPESSJUR'
      'ELEGPATRO.IDSITFUNC = SITFUNC.IDSITFUNC (+)'
      'PARTPREVPLAN.IDSITPART = SITPART.IDSITPART'
      'SITPART.FLGINTERNO IN ('#39'MA'#39', '#39'MP'#39','#39'MS'#39','#39'AS'#39','#39'AT'#39')'
      'PARTPREVPLAN.IDSITPLANOPREV = SITPLANOPREV.IDSITPLANOPREV'
      'PESSOA.IDPESSOA = PESSOAFISICA.IDPESSOA'
      'PARTPREVPLAN.FLGDESATIVADO = 0')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '30'
      '10'
      '15'
      '30'
      '30')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 10
    Top = 438
  end
  object qryGrava: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 119
    Top = 436
  end
  object qryPatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT P.IDPESSOA, P.NOME, PA.IDREGRAMATRICULA'
      'FROM  PESSOA P, PATRO PA, PLANPREVPATRO PL'
      'WHERE P.IDPESSOA = PA.IDPESSOA'
      'AND   P.IDPESSOA = PL.IDPESSJUR'
      'AND   PL.IDPLANOPREV =:pIdPlanoPrev'
      'ORDER BY P.NOME'
      '')
    ValidateWithMask = True
    Left = 162
    Top = 438
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIdPlanoPrev'
        ParamType = ptUnknown
      end>
  end
  object regCalculo: TRegra
    QueryIn = qryRegra
    DatabaseName = 'BaseDados'
    IdCalculo = 0
    IdEmpresa = -1
    Left = 52
    Top = 438
  end
  object qryCargoExt: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDCARGOEXT, TITULO, IDFAIXASALEXT'
      'FROM CARGOEXT'
      'ORDER BY TITULO')
    ValidateWithMask = True
    Left = 233
    Top = 436
  end
  object qryTpInsalubri: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODTPINSALUBRI, DESCRICAO, FATOR, IDREGRAINSALUBRI,'
      '              TEMPOPERMANMINIMO, FLGTEMPOCONTINUO'
      'FROM TPINSALUBRI'
      'ORDER BY DESCRICAO')
    ValidateWithMask = True
    Left = 280
    Top = 441
  end
  object qryTipoDocPessoa: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDDOCUMENTO, NOMEDOCUMENTO'
      'FROM TIPODOCPESSOA'
      'ORDER BY NOMEDOCUMENTO')
    ValidateWithMask = True
    Left = 537
    Top = 430
  end
  object qryTpBonusTrab: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODBONUSTRAB, DESCRICAO'
      'FROM TPBONUSTRAB'
      'ORDER BY DESCRICAO')
    ValidateWithMask = True
    Left = 631
    Top = 430
  end
  object qryRegra: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 701
    Top = 430
  end
  object qrySitFunc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT SIT.DESCRICAO , SIT.IDSITFUNC, SIT.FLGINTERNO, SIT.TIPOSI' +
        'T'
      'FROM SITFUNC SIT , EVENTOXSITFUNC E'
      'WHERE '
      'SIT.IDSITFUNC = E.IDSITFUNC'
      'AND E.IDEVENTOGERADOR = :IDEVENTO'
      'ORDER BY SIT.DESCRICAO')
    ValidateWithMask = True
    Left = 336
    Top = 448
    ParamData = <
      item
        DataType = ftString
        Name = 'IDEVENTO'
        ParamType = ptUnknown
      end>
  end
  object qrySitPlanoPrev: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT SIT.DESCRICAO , SIT.IDSITPLANOPREV, SIT.FLGINTERNO'
      ''
      'FROM SITPLANOPREV SIT , EVENTOXSITPLAPREV E'
      'WHERE '
      'SIT.IDSITPLANOPREV = E.IDSITPLANOPREV'
      'AND E.IDEVENTOGERADOR = :IDEVENTO'
      'ORDER BY SIT.DESCRICAO')
    ValidateWithMask = True
    Left = 448
    Top = 447
    ParamData = <
      item
        DataType = ftString
        Name = 'IDEVENTO'
        ParamType = ptUnknown
      end>
  end
  object qrySitPart: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT SIT.DESCRICAO , SIT.IDSITPART, SIT.FLGINTERNO'
      'FROM SITPART SIT , EVENTOXSITPART E'
      'WHERE '
      'SIT.IDSITPART = E.IDSITPART'
      'AND E.IDEVENTOGERADOR = :IDEVENTO'
      'ORDER BY SIT.DESCRICAO')
    ValidateWithMask = True
    Left = 510
    Top = 389
    ParamData = <
      item
        DataType = ftString
        Name = 'IDEVENTO'
        ParamType = ptUnknown
      end>
  end
  object qryEventos: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT E.IDEVENTOSPREV,   E.IDSITPLANOATUAL,E.IDSITFUNCATUAL,'
      '               E.IDSITPARTATUAL,'
      
        '               E.IDSITPLANONOVO, E.IDSITFUNCNOVO, E.IDSITPARTNOV' +
        'O,'
      
        '               E.DATAEVENTO,        SPATU.DESCRICAO AS NOMESITPA' +
        'RT,'
      '               SFATU.DESCRICAO   AS NOMESITFUNC,'
      
        '               SPLATU.DESCRICAO AS NOMESITPLANO, EL.DATAADMISSAO' +
        ','
      '               EL.DATADEMISSAO,  E.IDEVENTOGERADOR,'
      '               EG.FLGINTERNO'
      'FROM   EVENTOSPREV E, SITPART SP, SITPART SPATU, '
      '             SITFUNC SFATU, SITPLANOPREV SPLATU,'
      '             ELEGPATRO EL, EVENTOGERADOR EG'
      'WHERE  E.IDPESSOA    = :IDPESSOA'
      'AND    E.IDPESSJUR   = :IDPESSJUR'
      'AND    E.IDPLANOPREV = :IDPLANOPREV'
      'AND    E.SEQPROPOSTA = :SEQPROPOSTA'
      'AND    EL.IDPESSOA   = E.IDPESSOA'
      'AND    EL.IDPESSJUR  = E.IDPESSJUR'
      'AND    E.IDSITPARTNOVO = SP.IDSITPART'
      'AND    SP.FLGINTERNO  IN ('#39'MA'#39','#39'MP'#39','#39'MS'#39')'
      'AND    E.IDSITPLANOATUAL = SPLATU.IDSITPLANOPREV'
      'AND    E.IDSITFUNCATUAL  = SFATU.IDSITFUNC'
      'AND    E.IDSITPARTATUAL  = SPATU.IDSITPART'
      'AND    E.IDEVENTOGERADOR = EG.IDEVENTOGERADOR')
    ValidateWithMask = True
    Left = 205
    Top = 85
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'SEQPROPOSTA'
        ParamType = ptUnknown
      end>
  end
end
