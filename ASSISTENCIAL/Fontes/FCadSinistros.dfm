inherited FrmCadSinistros: TFrmCadSinistros
  Left = 42
  Top = 1
  Caption = 'Cadastro de Sinistros'
  ClientHeight = 535
  ClientWidth = 719
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 719
    Height = 449
    inherited pnlMestre: TPanel
      Width = 717
      Height = 180
      object GroupBox1: TGroupBox
        Left = -1
        Top = -1
        Width = 313
        Height = 103
        Caption = 'Titular'
        TabOrder = 0
        object dbTPlano: TDBText
          Left = 6
          Top = 87
          Width = 46
          Height = 13
          AutoSize = True
          DataField = 'NOMEPLANO'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lblPlanoPrev: TLabel
          Left = 6
          Top = 74
          Width = 118
          Height = 13
          Caption = 'Plano Previdenciário'
        end
        object dbTPatro: TDBText
          Left = 6
          Top = 51
          Width = 44
          Height = 13
          AutoSize = True
          DataField = 'NOMEPATRO'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lblPatro: TLabel
          Left = 6
          Top = 38
          Width = 80
          Height = 13
          Caption = 'Patrocinadora'
        end
        object dbTNome: TDBText
          Left = 8
          Top = 25
          Width = 47
          Height = 13
          AutoSize = True
          DataField = 'NOME'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lblParticipante: TLabel
          Left = 8
          Top = 13
          Width = 33
          Height = 13
          Caption = 'Nome'
        end
        object dbTInscricao: TDBText
          Left = 236
          Top = 87
          Width = 62
          Height = 13
          AutoSize = True
          DataField = 'INSCRICAONUMERO'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lblInscricao: TLabel
          Left = 236
          Top = 74
          Width = 71
          Height = 13
          Caption = 'Inscrição Nº'
        end
        object dbTMatricula: TDBText
          Left = 236
          Top = 51
          Width = 62
          Height = 13
          AutoSize = True
          DataField = 'MATRICULA'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lblMatricula: TLabel
          Left = 236
          Top = 38
          Width = 55
          Height = 13
          Caption = 'Matrícula'
        end
      end
      object GroupBox2: TGroupBox
        Left = 314
        Top = 3
        Width = 393
        Height = 100
        Caption = 'Plano Assistencial'
        TabOrder = 1
        object dbTPlanassist: TDBText
          Left = 7
          Top = 17
          Width = 66
          Height = 13
          AutoSize = True
          DataField = 'PLANASSIST'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object DBGrid1: TDBGrid
          Left = 2
          Top = 15
          Width = 386
          Height = 83
          Align = alLeft
          DataSource = DsInfPlano
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          Columns = <
            item
              Expanded = False
              FieldName = 'TIPOSEG'
              Title.Caption = 'CLASSE'
              Width = 122
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CAPITALMN'
              Title.Caption = 'IMPORTÂNCIA SEGURADA'
              Width = 163
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DTVIGENCIA'
              Title.Caption = 'VIGÊNCIA'
              Width = 67
              Visible = True
            end>
        end
      end
      object GroupBox3: TGroupBox
        Left = -1
        Top = 102
        Width = 955
        Height = 64
        Caption = 'Beneficiários'
        TabOrder = 2
        object DBGrid2: TDBGrid
          Left = 2
          Top = 15
          Width = 702
          Height = 43
          DataSource = dsBeneficiarios
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          Columns = <
            item
              Expanded = False
              FieldName = 'NOME'
              Width = 495
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DEPENDENCIA'
              Width = 170
              Visible = True
            end>
        end
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 181
      Width = 717
      Height = 267
      Align = alBottom
      Tabs.Strings = (
        'Sinistros Ocorridos')
      OnChanging = nil
      detdbGrids.Strings = (
        'dbgrdDet'
        'dbgValores')
      inherited pgctrlDetalhe: TPageControl
        Width = 619
        Height = 208
        inherited tbsDet: TTabSheet
          inherited dbgrdDet: TwwDBGrid
            Width = 611
            Height = 180
            Selected.Strings = (
              'NOME'#9'60'#9'Nome'
              'SITATUAL'#9'17'#9'Situação Atual'
              'NUMAPOLICE'#9'15'#9'Numero da Apólice'
              'DATASINISTRO'#9'18'#9'Data do Sinistro'
              'TIPOSINISTRO'#9'12'#9'Tipo do Sinistro'
              'CAUSASINISTRO'#9'50'#9'Causa do Sinistro'
              'DATAAPOLICE'#9'18'#9'Data da Apólice'
              'RAMO'#9'4'#9'Ramo'
              'SEGURADORA'#9'20'#9'Seguradora'
              'DATAENTSEGURAD'#9'25'#9'Data de Entrada na Seguradora'
              'DOCPENDENTES'#9'100'#9'Documentos Pendentes'
              'DTSOLDOCPEND'#9'33'#9'Data de Solicitação dos Doc. Pendentes'
              'OBSERVACAO'#9'100'#9'Observação'
              'OPCRECEBIMENTO'#9'40'#9'Opção de Recebimento'
              'DATALIQUIDACAO'#9'18'#9'Data de Liquidação'
              'RECUSADO'#9'100'#9'RECUSADO')
          end
          inherited pnlControlesDet: TPanel
            Width = 611
            Height = 180
            object Label1: TLabel
              Left = 280
              Top = -1
              Width = 47
              Height = 13
              Caption = 'Sinistro '
            end
            object Label2: TLabel
              Left = 3
              Top = 32
              Width = 43
              Height = 13
              Caption = 'Apólice'
            end
            object Label3: TLabel
              Left = 565
              Top = -2
              Width = 33
              Height = 13
              Caption = 'Ramo'
            end
            object Label4: TLabel
              Left = 299
              Top = 32
              Width = 66
              Height = 13
              Caption = 'Seguradora'
            end
            object Label5: TLabel
              Left = 476
              Top = 33
              Width = 125
              Height = 13
              Caption = 'Entrega a Seguradora'
            end
            object Label6: TLabel
              Left = 448
              Top = -1
              Width = 96
              Height = 13
              Caption = 'Data do Sinistro '
            end
            object Label7: TLabel
              Left = 1
              Top = 67
              Width = 100
              Height = 13
              Caption = 'Causa do Sinistro'
            end
            object Label9: TLabel
              Left = 108
              Top = 66
              Width = 134
              Height = 13
              Caption = 'Opção de Recebimento'
            end
            object Label10: TLabel
              Left = 249
              Top = 66
              Width = 112
              Height = 13
              Caption = 'Data de Liquidação'
            end
            object Label11: TLabel
              Left = 369
              Top = 66
              Width = 84
              Height = 13
              Caption = 'Situação Atual'
            end
            object Label12: TLabel
              Left = 464
              Top = 66
              Width = 58
              Height = 13
              Caption = 'Recusado'
            end
            object Label13: TLabel
              Left = 3
              Top = 100
              Width = 135
              Height = 13
              Caption = 'Documentos Pendentes'
            end
            object Label14: TLabel
              Left = 1
              Top = 0
              Width = 37
              Height = 13
              Caption = 'Nome '
            end
            object Label15: TLabel
              Left = 172
              Top = 32
              Width = 106
              Height = 13
              Caption = 'Data Recebimento'
            end
            object Label16: TLabel
              Left = 207
              Top = 100
              Width = 149
              Height = 13
              Caption = 'Data Sol. Doc. Pendentes'
            end
            object Label17: TLabel
              Left = 363
              Top = 100
              Width = 75
              Height = 13
              Caption = 'Observações'
            end
            object Label8: TLabel
              Left = 331
              Top = -2
              Width = 113
              Height = 13
              Caption = 'Dt Vigência Apólice'
            end
            object dblkpcmbSitDependente: TwwDBLookupCombo
              Left = 2
              Top = 12
              Width = 274
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'60'#9'NOME'#9'F')
              DataField = 'IDPESSOA'
              DataSource = dsDet
              LookupTable = qryBeneficiarios
              LookupField = 'IDPESSOA'
              ParentFont = False
              TabOrder = 0
              AutoDropDown = False
              ShowButton = True
              AllowClearKey = True
            end
            object dbeApolice: TDBEdit
              Left = 3
              Top = 45
              Width = 166
              Height = 21
              DataField = 'NUMAPOLICE'
              DataSource = dsDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
            end
            object dbeTipoSinistrro: TDBEdit
              Left = 282
              Top = 12
              Width = 40
              Height = 21
              DataField = 'TIPOSINISTRO'
              DataSource = dsDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
            end
            object dbeRamoSinistro: TDBEdit
              Left = 563
              Top = 10
              Width = 40
              Height = 21
              DataField = 'RAMO'
              DataSource = dsDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 3
            end
            object dbeSeguradora: TDBEdit
              Left = 300
              Top = 45
              Width = 166
              Height = 21
              DataField = 'SEGURADORA'
              DataSource = dsDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 4
            end
            object dbdeDataMorte: TCMDateTimePicker
              Left = 446
              Top = 11
              Width = 115
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATASINISTRO'
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
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ShowButton = True
              TabOrder = 5
            end
            object CMDateTimePicker1: TCMDateTimePicker
              Left = 173
              Top = 45
              Width = 115
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATAAPOLICE'
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
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ShowButton = True
              TabOrder = 6
            end
            object CMDateTimePicker2: TCMDateTimePicker
              Left = 479
              Top = 46
              Width = 115
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATAENTSEGURAD'
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
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ShowButton = True
              TabOrder = 7
            end
            object DBEdit2: TDBEdit
              Left = 2
              Top = 79
              Width = 99
              Height = 21
              DataField = 'CAUSASINISTRO'
              DataSource = dsDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 8
            end
            object DBEdit3: TDBEdit
              Left = 3
              Top = 112
              Width = 199
              Height = 21
              DataField = 'DOCPENDENTES'
              DataSource = dsDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 9
            end
            object CMDateTimePicker3: TCMDateTimePicker
              Left = 208
              Top = 112
              Width = 115
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DTSOLDOCPEND'
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
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ShowButton = True
              TabOrder = 10
            end
            object DBEdit4: TDBEdit
              Left = 363
              Top = 112
              Width = 238
              Height = 21
              DataField = 'OBSERVACAO'
              DataSource = dsDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 11
            end
            object DBEdit5: TDBEdit
              Left = 109
              Top = 79
              Width = 132
              Height = 21
              DataField = 'OPCRECEBIMENTO'
              DataSource = dsDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 12
            end
            object CMDateTimePicker4: TCMDateTimePicker
              Left = 250
              Top = 79
              Width = 115
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATALIQUIDACAO'
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
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ShowButton = True
              TabOrder = 13
            end
            object DBEdit6: TDBEdit
              Left = 370
              Top = 79
              Width = 86
              Height = 21
              DataField = 'SITATUAL'
              DataSource = dsDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 14
            end
            object DBEdit7: TDBEdit
              Left = 465
              Top = 79
              Width = 136
              Height = 21
              DataField = 'RECUSADO'
              DataSource = dsDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 15
            end
            object CMDateTimePicker5: TCMDateTimePicker
              Left = 328
              Top = 10
              Width = 115
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATAVGAPOLICE'
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
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ShowButton = True
              TabOrder = 16
            end
            object dbmValores: TDBMemo
              Left = 0
              Top = 126
              Width = 611
              Height = 54
              Align = alBottom
              DataField = 'VLRPAGO'
              DataSource = dsDet
              TabOrder = 17
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 709
      end
      inherited Dock974: TDock97
        Left = 623
        Height = 208
      end
    end
  end
  inherited Dock972: TDock97
    Width = 719
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 496
    Width = 719
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 252
    Top = 7
    TargetsData = (
      1
      2
      (
        'TDBMemo'
        'Text'
        0)
      (
        'TMemo'
        'Text'
        0))
  end
  inherited dsDet: TwwDataSource
    DataSet = qryDet
    Left = 433
    Top = 255
  end
  inherited ds: TwwDataSource
    Left = 414
    Top = 7
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update PESSOA'
      'set'
      '  NOME = :NOME'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into PESSOA'
      '  (NOME)'
      'values'
      '  (:NOME)')
    DeleteSQL.Strings = (
      'delete from PESSOA'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 374
    Top = 7
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'EL.MATRICULA'
      'P.NOME'
      'PD.NOME'
      'PP.INSCRICAONUMERO'
      'PL.NOME'
      'PT.NOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'N'
      'C'
      'C')
    Descricao.Strings = (
      'Matrícula'
      'Titular'
      'Dependente'
      'Inscrição Nº'
      'Plano Previdenciário'
      'Patrocinadora')
    SensivelACaixa.Strings = (
      'S'
      'S'
      'S'
      'S'
      'S'
      'S')
    Tabelas.Strings = (
      'PESSOA P'
      'PESSOA PT'
      'PESSOA PD'
      'ELEGPATRO EL'
      'PLANPREV PL'
      'PARTPREVPLAN PP'
      'DEPENTIT DT'
      'PLANPREVPATRO PPP'
      'PARTASS PA')
    CamposChave.Strings = (
      'PP.IDPESSOA'
      'PP.IDPESSJUR'
      'PP.IDPLANOPREV'
      'PP.SEQPROPOSTA'
      'DT.IDPESSOA'
      'PA.IDPLANASS')
    Filtro.Strings = (
      'EL.IDPESSOA = PP.IDPESSOA    '
      'EL.IDPESSJUR = PP.IDPESSJUR'
      'PP.SEQPROPOSTA = 1'
      'PP.IDPESSJUR = PPP.IDPESSJUR'
      'PP.IDPLANOPREV = PPP.IDPLANOPREV'
      'PPP.IDPLANOPREV = PL.IDPLANOPREV'
      'EL.IDPESSOA = P.IDPESSOA'
      'EL.IDPESSJUR = PT.IDPESSOA'
      'EL.IDPESSOA = DT.IDTITULAR(+)'
      'DT.IDPESSOA = PD.IDPESSOA'
      'PP.FLGDESATIVADO = 0'
      'PA.IDPESSJUR = PP.IDPESSJUR'
      'PA.IDPESSOA = PP.IDPESSOA'
      'PA.SEQPROPOSTA = 1')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '15'
      '60'
      '60'
      '15'
      '60'
      '60')
    Left = 455
    Top = 7
  end
  inherited ImlPadrao: TImageList
    Left = 293
    Top = 7
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 570
    Top = 7
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT P.NOME,'
      '              PT.NOME AS NOMEPATRO, '
      '              PL.NOME AS NOMEPLANO,'
      '              PS.NOME AS PLANASSIST,'
      '              EL.MATRICULA,'
      '              PP.INSCRICAONUMERO,   '
      '              PP.IDPESSJUR,         '
      '              PP.IDPLANOPREV,'
      '              PP.IDPESSOA,        '
      '              PP.SEQPROPOSTA,'
      '              SP.FLGINTERNO,      '
      '              PP.INSCRICAODATA,    '
      '              PP.IDSITPART,'
      '              PF.DATANASC,'
      
        '              DECODE(SP.FLGINTERNO, '#39'MA'#39', PP.SALMANTIDO, PP.SALP' +
        'ARTICIPACAO) AS SALARIO'
      'FROM    PESSOA P,'
      '              PESSOA PT, '
      '              PESSOAFISICA PF,'
      '              PLANPREV PL, '
      '              PARTPREVPLAN PP,'
      '              ELEGPATRO EL, '
      '              SITPART SP ,'
      '              PLANASS PS,'
      '              PARTASS PA'
      'WHERE (PP.IDPESSJUR         = :IDPESSJUR)'
      'AND       (PP.IDPLANOPREV    = :IDPLANOPREV)'
      'AND       (PP.IDPESSOA           = :IDPESSOA)'
      'AND       (PP.SEQPROPOSTA  = :SEQPROPOSTA)'
      'AND       (PP.IDPLANOPREV    = PL.IDPLANOPREV)'
      'AND       (PP.IDPESSOA           = P.IDPESSOA)'
      'AND       (PP.IDPESSJUR         = PT.IDPESSOA)'
      'AND       (PP.IDPESSJUR         = EL.IDPESSJUR)'
      'AND       (PP.IDPESSOA           = EL.IDPESSOA)'
      'AND       (PP.IDSITPART          = SP.IDSITPART)'
      'AND       (EL.IDPESSOA            = PF.IDPESSOA)'
      'AND       (PA.IDPESSJUR = PP.IDPESSJUR)'
      'AND       (PA.IDPLANOPREV = PP.IDPLANOPREV)  '
      'AND       (PA.IDPESSOA = PP.IDPESSOA)'
      'AND       (PA.SEQPROPOSTA = 1)'
      'AND       (PA.IDPLANASS = PS.IDPLANASS)')
    Left = 333
    Top = 7
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SEQPROPOSTA'
        ParamType = ptUnknown
      end>
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Operacao = opIdle
    Left = 639
    Top = 7
  end
  object qryInfPlano: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM CAPSEGASS'
      'WHERE (FLGVIGENCIA=1) AND'
      '              (IDPLANASS= :IDPLANASS)'
      'ORDER BY ORDEM'
      ' ')
    ValidateWithMask = True
    Left = 589
    Top = 249
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANASS'
        ParamType = ptUnknown
      end>
    object qryInfPlanoIDCAPSEGASS: TFloatField
      FieldName = 'IDCAPSEGASS'
      Origin = 'BASEDADOS.CAPSEGASS.IDCAPSEGASS'
    end
    object qryInfPlanoIDPLANASS: TFloatField
      FieldName = 'IDPLANASS'
      Origin = 'BASEDADOS.CAPSEGASS.IDPLANASS'
    end
    object qryInfPlanoTIPOSEG: TStringField
      FieldName = 'TIPOSEG'
      Origin = 'BASEDADOS.CAPSEGASS.TIPOSEG'
      Size = 7
    end
    object qryInfPlanoCAPITALMN: TFloatField
      FieldName = 'CAPITALMN'
      Origin = 'BASEDADOS.CAPSEGASS.CAPITALMN'
    end
    object qryInfPlanoCAPITALIP: TFloatField
      FieldName = 'CAPITALIP'
      Origin = 'BASEDADOS.CAPSEGASS.CAPITALIP'
    end
    object qryInfPlanoCAPITALMA: TFloatField
      FieldName = 'CAPITALMA'
      Origin = 'BASEDADOS.CAPSEGASS.CAPITALMA'
    end
    object qryInfPlanoPREMIOFXA: TFloatField
      FieldName = 'PREMIOFXA'
      Origin = 'BASEDADOS.CAPSEGASS.PREMIOFXA'
    end
    object qryInfPlanoPREMIOFXB: TFloatField
      FieldName = 'PREMIOFXB'
      Origin = 'BASEDADOS.CAPSEGASS.PREMIOFXB'
    end
    object qryInfPlanoPREMIOFXC: TFloatField
      FieldName = 'PREMIOFXC'
      Origin = 'BASEDADOS.CAPSEGASS.PREMIOFXC'
    end
    object qryInfPlanoPREMIOFXD: TFloatField
      FieldName = 'PREMIOFXD'
      Origin = 'BASEDADOS.CAPSEGASS.PREMIOFXD'
    end
    object qryInfPlanoDESCPLANO: TStringField
      FieldName = 'DESCPLANO'
      Origin = 'BASEDADOS.CAPSEGASS.DESCPLANO'
      Size = 40
    end
    object qryInfPlanoDTVIGENCIA: TDateTimeField
      FieldName = 'DTVIGENCIA'
      Origin = 'BASEDADOS.CAPSEGASS.DTVIGENCIA'
    end
    object qryInfPlanoFLGVIGENCIA: TStringField
      FieldName = 'FLGVIGENCIA'
      Origin = 'BASEDADOS.CAPSEGASS.FLGVIGENCIA'
      FixedChar = True
      Size = 1
    end
  end
  object DsInfPlano: TwwDataSource
    DataSet = qryInfPlano
    Left = 648
    Top = 249
  end
  object dsBeneficiarios: TDataSource
    DataSet = qryBeneficiarios
    Left = 903
    Top = 7
  end
  object qryBeneficiarios: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      #9'DT.IDTITULAR,'
      #9'DT.IDPESSOA,'
      
        #9'DECODE(DT.IDDEPENDENCIA,'#39'PRP'#39','#39'PROPRIO'#39','#39'COM'#39','#39'CONJUGE'#39','#39'FIL'#39','#39 +
        'FILHO'#39','#39'IND'#39','#39'INDICADO'#39','#39'BIS'#39','#39'BISNETO'#39','#39'CUN'#39','#39'CUNHADO'#39','#39'IRM'#39','#39'I' +
        'RMAO'#39','#39'NET'#39','#39'NETO'#39','#39'PAI'#39','#39'PAI'#39','#39'SOB'#39','#39'SOBRINHO'#39#39#39') AS DEPENDENCI' +
        'A,'
      #9'PE.NOME'
      'FROM'
      #9'DEPENTIT DT,'
      #9'PESSOA PE'
      'WHERE'
      #9'DT.IDTITULAR = :TITULAR AND'
      #9'PE.IDPESSOA = DT.IDPESSOA '
      'ORDER BY DT.IDPESSOA'
      ' ')
    Left = 414
    Top = 65190
    ParamData = <
      item
        DataType = ftInteger
        Name = 'TITULAR'
        ParamType = ptUnknown
      end>
  end
  object qryDet: TwwQuery
    Tag = 5
    CachedUpdates = True
    BeforePost = qryDetBeforePost
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  P.NOME,'
      '  S.IDSINISTRO,'
      '  S.IDTITULAR,'
      '  S.IDPESSOA,'
      '  S.NUMAPOLICE,'
      '  S.DATASINISTRO,'
      '  S.DATAAPOLICE,'
      '  S.TIPOSINISTRO,'
      '  S.RAMO,'
      '  S.SEGURADORA,'
      '  S.DATAENTSEGURAD,'
      '  S.CAUSASINISTRO,'
      '  S.DOCPENDENTES,'
      '  S.DTSOLDOCPEND,'
      '  S.OBSERVACAO,'
      '  S.OPCRECEBIMENTO,'
      '  S.DATALIQUIDACAO,'
      '  S.SITATUAL,'
      '  S.RECUSADO,'
      '  S.VLRPAGO,'
      '  S.DATAVGAPOLICE'
      ''
      'FROM'
      '  SINISTROS S,'
      '  PESSOA P'
      ''
      'WHERE S.IDTITULAR = :IDTITULAR'
      '  AND S.IDPESSOA  = :IDPESSOA'
      '  AND S.IDPESSOA  = P.IDPESSOA')
    UpdateObject = updDet
    ValidateWithMask = True
    Left = 480
    Top = 254
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object updDet: TUpdateSQL
    ModifySQL.Strings = (
      'update CM.SINISTROS'
      'set'
      '  IDTITULAR = :IDTITULAR,'
      '  IDPESSOA = :IDPESSOA,'
      '  NUMAPOLICE = :NUMAPOLICE,'
      '  DATASINISTRO = :DATASINISTRO,'
      '  DATAAPOLICE = :DATAAPOLICE,'
      '  TIPOSINISTRO = :TIPOSINISTRO,'
      '  RAMO = :RAMO,'
      '  SEGURADORA = :SEGURADORA,'
      '  DATAENTSEGURAD = :DATAENTSEGURAD,'
      '  CAUSASINISTRO = :CAUSASINISTRO,'
      '  DOCPENDENTES = :DOCPENDENTES,'
      '  DTSOLDOCPEND = :DTSOLDOCPEND,'
      '  OBSERVACAO = :OBSERVACAO,'
      '  OPCRECEBIMENTO = :OPCRECEBIMENTO,'
      '  DATALIQUIDACAO = :DATALIQUIDACAO,'
      '  SITATUAL = :SITATUAL,'
      '  RECUSADO = :RECUSADO,'
      '  VLRPAGO = :VLRPAGO,'
      '  DATAVGAPOLICE = :DATAVGAPOLICE'
      'where'
      '  IDSINISTRO = :OLD_IDSINISTRO')
    InsertSQL.Strings = (
      'insert into CM.SINISTROS'
      '  (IDSINISTRO, IDTITULAR, IDPESSOA, NUMAPOLICE, DATASINISTRO, '
      'DATAAPOLICE, '
      '   TIPOSINISTRO, RAMO, SEGURADORA, DATAENTSEGURAD, '
      'CAUSASINISTRO, DOCPENDENTES, '
      '   DTSOLDOCPEND, OBSERVACAO, OPCRECEBIMENTO, DATALIQUIDACAO, '
      'SITATUAL, '
      '   RECUSADO, VLRPAGO, DATAVGAPOLICE)'
      'values'
      
        '  (:IDSINISTRO, :IDTITULAR, :IDPESSOA, :NUMAPOLICE, :DATASINISTR' +
        'O, '
      ':DATAAPOLICE, '
      '   :TIPOSINISTRO, :RAMO, :SEGURADORA, :DATAENTSEGURAD, '
      ':CAUSASINISTRO, '
      '   :DOCPENDENTES, :DTSOLDOCPEND, :OBSERVACAO, :OPCRECEBIMENTO, '
      ':DATALIQUIDACAO, '
      '   :SITATUAL, :RECUSADO, :VLRPAGO, :DATAVGAPOLICE)')
    DeleteSQL.Strings = (
      'delete from CM.SINISTROS'
      'where'
      '  IDSINISTRO = :OLD_IDSINISTRO')
    Left = 540
    Top = 254
  end
  object qryValorPago: TwwQuery
    Tag = 5
    CachedUpdates = True
    BeforePost = qryDetBeforePost
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      S.VLRPAGO'
      'FROM'
      '    CM.SINISTROS S'
      'WHERE'
      '     S.IDTITULAR = :IDTITULAR AND'
      '     S.IDPESSOA  = :IDPESSOA'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' ')
    UpdateObject = updValorpago
    ValidateWithMask = True
    Left = 480
    Top = 198
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object dsValorpago: TwwDataSource
    AutoEdit = False
    DataSet = qryValorPago
    Left = 417
    Top = 199
  end
  object updValorpago: TUpdateSQL
    ModifySQL.Strings = (
      'update CM.SINISTROS'
      'set'
      '  VLRPAGO = :VLRPAGO'
      'where'
      '  IDTITULAR = :OLD_IDTITULAR and'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 548
    Top = 198
  end
end
