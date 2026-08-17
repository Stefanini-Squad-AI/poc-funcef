inherited frmCadProcesso: TfrmCadProcesso
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    inherited pnlMestre: TPanel
      inherited Label2: TLabel
        Visible = False
      end
      inherited Label19: TLabel
        Left = 8
        Visible = False
      end
      inherited dbedDataAju: TCMDateTimePicker
        Visible = False
      end
      inherited dbedDataNot: TCMDateTimePicker
        Left = 8
        Visible = False
      end
      inherited rgSituacao: TDBRadioGroup
        Left = 8
        Height = 48
      end
      inherited gbxSitContraparte: TGroupBox
        Left = 430
        Width = 301
        TabOrder = 8
        inherited dblckMotivoContraparte: TwwDBLookupCombo
          Width = 217
        end
      end
      inherited gbxContraparte: TGroupBox
        Left = 430
        Width = 301
        TabOrder = 7
        inherited edNomeContraparte: TEdit
          Width = 259
        end
        inherited spbtnProcContraparte: TBitBtn
          Left = 270
        end
      end
      object dbrgMateria: TDBRadioGroup
        Left = 261
        Top = 2
        Width = 165
        Height = 90
        Hint = 
          '1.Trabalhista  2.Previdenciária  3.Previdenciária/Trabalhista  4' +
          '.Civil  5.Comercial  6.Tributária  7.Penal'
        Caption = 'Matéria'
        Columns = 2
        DataField = 'INDMATERIA'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Items.Strings = (
          'Trabalh.'
          'Previd.'
          'PrevTrab'
          'Civil'
          'Comercial'
          'Tributária'
          'Penal')
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
        TabStop = True
        Values.Strings = (
          '1'
          '2'
          '3'
          '4'
          '5'
          '6'
          '7')
      end
      object rgAtivo: TDBRadioGroup
        Left = 136
        Top = 44
        Width = 120
        Height = 48
        Caption = 'Somos a Parte'
        DataField = 'FLGPARTEATIVA'
        DataSource = ds
        Items.Strings = (
          'Passiva'
          'Ativa')
        TabOrder = 5
        Values.Strings = (
          '0'
          '1')
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      inherited pgctrlDetalhe: TPageControl
        inherited tbshContraparte: TTabSheet
          object ntbkDadosRequerente: TNotebook
            Left = 3
            Top = 0
            Width = 629
            Height = 213
            PageIndex = 1
            TabOrder = 0
            object TPage
              Left = 0
              Top = 0
              Caption = 'ModCon'
              object Label9: TLabel
                Left = 171
                Top = 22
                Width = 73
                Height = 13
                Caption = 'Último Cargo'
              end
              object Label10: TLabel
                Left = 171
                Top = 63
                Width = 79
                Height = 13
                Caption = 'Último Salário'
              end
              object Label11: TLabel
                Left = 171
                Top = 101
                Width = 54
                Height = 13
                Caption = 'Admissão'
              end
              object Label12: TLabel
                Left = 396
                Top = 104
                Width = 55
                Height = 13
                Caption = 'Demissão'
              end
              object Label23: TLabel
                Left = 171
                Top = 136
                Width = 119
                Height = 13
                Caption = 'Motivo Desligamento'
              end
              object Label32: TLabel
                Left = 171
                Top = 177
                Width = 48
                Height = 13
                Caption = 'Unidade'
              end
              object dbedCargo: TDBEdit
                Left = 292
                Top = 19
                Width = 259
                Height = 21
                TabStop = False
                Color = clGray
                DataField = 'TITULO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                TabOrder = 0
              end
              object dbedSalAtual_ModCon: TDBEdit
                Left = 292
                Top = 61
                Width = 90
                Height = 21
                TabStop = False
                Color = clGray
                DataField = 'SALARIOATUAL'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                TabOrder = 1
              end
              object dbrgTipoSalar: TDBRadioGroup
                Left = 390
                Top = 47
                Width = 161
                Height = 41
                Columns = 3
                DataField = 'TIPOPAGAMENTO'
                Items.Strings = (
                  'Hora'
                  'Dia'
                  'Mês')
                ReadOnly = True
                TabOrder = 2
                Values.Strings = (
                  'H'
                  'D'
                  'M')
              end
              object dbedAdm_ModCon: TDBEdit
                Left = 292
                Top = 99
                Width = 90
                Height = 21
                TabStop = False
                Color = clGray
                DataField = 'DATAADMISSAO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                TabOrder = 3
              end
              object dbedDem_ModCon: TDBEdit
                Left = 460
                Top = 99
                Width = 90
                Height = 21
                TabStop = False
                Color = clGray
                DataField = 'DATADEMISSAO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                TabOrder = 4
              end
              object dbedMotivo: TDBEdit
                Left = 292
                Top = 133
                Width = 259
                Height = 21
                TabStop = False
                Color = clGray
                DataField = 'DESCRICAO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                TabOrder = 5
              end
              object dbedEstab: TDBEdit
                Left = 292
                Top = 173
                Width = 259
                Height = 21
                TabStop = False
                Color = clGray
                DataField = 'ESTAB'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                TabOrder = 6
              end
            end
            object TPage
              Left = 0
              Top = 0
              Caption = 'ProcJud'
              object Label60: TLabel
                Left = 75
                Top = 21
                Width = 76
                Height = 13
                Caption = 'Razão Social'
              end
              object Label61: TLabel
                Left = 75
                Top = 54
                Width = 77
                Height = 13
                Caption = 'CPF ou CNPJ'
              end
              object Label62: TLabel
                Left = 75
                Top = 87
                Width = 31
                Height = 13
                Caption = 'Email'
              end
              object Label63: TLabel
                Left = 75
                Top = 129
                Width = 55
                Height = 13
                Caption = 'Endereço'
              end
              object dbedRazao: TDBEdit
                Left = 176
                Top = 18
                Width = 447
                Height = 21
                TabStop = False
                Color = clGray
                DataField = 'RAZAOSOCIAL'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                TabOrder = 0
              end
              object dbedNumDoc: TDBEdit
                Left = 176
                Top = 52
                Width = 185
                Height = 21
                TabStop = False
                Color = clGray
                DataField = 'NUMDOCUMENTO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                TabOrder = 1
              end
              object dbrgTipoPessoa: TDBRadioGroup
                Left = 438
                Top = 44
                Width = 185
                Height = 36
                Columns = 2
                DataField = 'TIPO'
                Items.Strings = (
                  'Física'
                  'Juridica')
                TabOrder = 2
                Values.Strings = (
                  'F'
                  'J')
              end
              object dbedEmail: TDBEdit
                Left = 176
                Top = 82
                Width = 185
                Height = 21
                TabStop = False
                Color = clGray
                DataField = 'EMAIL'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                TabOrder = 3
              end
              object dbedLogra: TDBEdit
                Left = 176
                Top = 125
                Width = 259
                Height = 21
                TabStop = False
                Color = clGray
                DataField = 'LOGRADOURO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                TabOrder = 4
              end
              object dbedNumLogra: TDBEdit
                Left = 439
                Top = 125
                Width = 90
                Height = 21
                TabStop = False
                Color = clGray
                DataField = 'NUMERO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                TabOrder = 5
              end
              object dbedComplem: TDBEdit
                Left = 533
                Top = 125
                Width = 90
                Height = 21
                TabStop = False
                Color = clGray
                DataField = 'COMPLEMENTO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                TabOrder = 6
              end
              object dbedBairro: TDBEdit
                Left = 176
                Top = 159
                Width = 259
                Height = 21
                TabStop = False
                Color = clGray
                DataField = 'BAIRRO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                TabOrder = 7
              end
            end
            object TPage
              Left = 0
              Top = 0
              Caption = 'ProcPrev'
              object Label51: TLabel
                Left = 174
                Top = 10
                Width = 33
                Height = 13
                Caption = 'Plano'
              end
              object Label53: TLabel
                Left = 174
                Top = 43
                Width = 53
                Height = 13
                Caption = 'Inscrição'
              end
              object Label54: TLabel
                Left = 174
                Top = 76
                Width = 80
                Height = 13
                Caption = 'Patrocinadora'
              end
              object Label55: TLabel
                Left = 174
                Top = 110
                Width = 73
                Height = 13
                Caption = 'Último Cargo'
              end
              object Label56: TLabel
                Left = 174
                Top = 141
                Width = 79
                Height = 13
                Caption = 'Último Salário'
              end
              object Label57: TLabel
                Left = 174
                Top = 176
                Width = 54
                Height = 13
                Caption = 'Admissão'
              end
              object Label58: TLabel
                Left = 399
                Top = 175
                Width = 55
                Height = 13
                Caption = 'Demissão'
              end
              object Label59: TLabel
                Left = 430
                Top = 43
                Width = 28
                Height = 13
                Caption = 'Data'
              end
              object dbedPlano: TDBEdit
                Left = 295
                Top = 7
                Width = 259
                Height = 21
                TabStop = False
                Color = clGray
                DataField = 'PLANO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                TabOrder = 0
              end
              object dbedInscNum: TDBEdit
                Left = 295
                Top = 40
                Width = 90
                Height = 21
                TabStop = False
                Color = clGray
                DataField = 'INSCRICAONUMERO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                TabOrder = 1
              end
              object dbedInscData: TDBEdit
                Left = 463
                Top = 40
                Width = 90
                Height = 21
                TabStop = False
                Color = clGray
                DataField = 'INSCRICAODATA'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                TabOrder = 2
              end
              object dbedPatro: TDBEdit
                Left = 295
                Top = 73
                Width = 259
                Height = 21
                TabStop = False
                Color = clGray
                DataField = 'PATROC'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                TabOrder = 3
              end
              object dbedCargoI: TDBEdit
                Left = 295
                Top = 107
                Width = 259
                Height = 21
                TabStop = False
                Color = clGray
                DataField = 'TITULO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                TabOrder = 4
              end
              object dbedSalAtual_ProcPrev: TDBEdit
                Left = 295
                Top = 139
                Width = 90
                Height = 21
                TabStop = False
                Color = clGray
                DataField = 'SALPARTICIPACAO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                TabOrder = 5
              end
              object dbedAdm_ProcPrev: TDBEdit
                Left = 295
                Top = 171
                Width = 90
                Height = 21
                TabStop = False
                Color = clGray
                DataField = 'DATAADMISSAO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                TabOrder = 6
              end
              object dbedDem_ProcPrev: TDBEdit
                Left = 463
                Top = 171
                Width = 90
                Height = 21
                TabStop = False
                Color = clGray
                DataField = 'DATADEMISSAO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                TabOrder = 7
              end
            end
          end
        end
        inherited tbshOutrosDados: TTabSheet
          inherited pgCtrlOutrosDados: TPageControl
            inherited tbshTipos: TTabSheet
              Caption = 'Datas, Tipo e Localização'
              inherited Label3: TLabel
                Left = 376
              end
              object LabelDataAjuiz2: TLabel [6]
                Left = 212
                Top = 10
                Width = 118
                Height = 13
                Caption = 'Data do Ajuizamento'
              end
              object labellDataNot2: TLabel [7]
                Left = 50
                Top = 10
                Width = 115
                Height = 13
                Caption = 'Data da Notificação'
              end
              inherited dbedPost: TCMDateTimePicker
                Left = 376
                TabOrder = 2
              end
              inherited gbxQuantContraparte: TGroupBox
                Left = 376
                Top = 60
                TabOrder = 8
              end
              inherited dblckTipProc: TwwDBLookupCombo
                TabOrder = 3
              end
              inherited dblckTipAcao: TwwDBLookupCombo
                TabOrder = 4
              end
              inherited dbedPasta: TDBEdit
                TabOrder = 5
              end
              object dbedDataAju2: TCMDateTimePicker [14]
                Left = 212
                Top = 25
                Width = 120
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                ButtonStyle = cbsCustom
                DataField = 'DATAJUIZO'
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
              object dbedDataNot2: TCMDateTimePicker [15]
                Left = 50
                Top = 25
                Width = 120
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                ButtonStyle = cbsCustom
                DataField = 'DATANOTIF'
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
                TabOrder = 0
              end
            end
          end
        end
      end
    end
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'PESSOA.NOME'
      'PROCESSOTRAB.INDMATERIA'
      'PROCESSOTRAB.DATANOTIF'
      'PROCESSOTRAB.PROCJCJNUM'
      'VARAJUSTICA.DESCRICAO'
      'PROCESSOTRAB.NUMVARAJUSTICA'
      'PROCESSOTRAB.PROCTRTNUM'
      'PROCESSOTRAB.PROCTSTNUM'
      'PROCESSOTRAB.NUMPROCEXEC'
      'PROCESSOTRAB.NUMPROCTRAB')
    TipodeDado.Strings = (
      'C'
      'N'
      'D'
      'C'
      'C'
      'N'
      'C'
      'C'
      'C'
      'N')
    Descricao.Strings = (
      'Nome Contraparte'
      'Matéria (1 a 7)'
      'Data de Notificação'
      'Número Proc. na 1a Inst.'
      'Órgão Jurisd. (Vara)'
      'Número da Vara'
      'Número Proc. na 2a Inst.'
      'Número Proc. na 3a Inst.'
      'Número de Execução'
      'Número Proc. Interno')
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
      'N')
    Larguras.Strings = (
      '50'
      '12'
      '12'
      '15'
      '40'
      '15'
      '15'
      '15'
      '15'
      '25')
  end
  inherited MontaSelectFunc: TMontaSelect
    Caption = 'Seleciona (ex-)Empregado'
    Descricao.Strings = (
      'Nome Reclamante'
      'Matrícula'
      'Estabelecimento'
      'Admissão'
      'Demissão')
    CamposChave.Strings = (
      'F.IDPESSOA'
      'P1.NOME')
    Mascaras.Strings = ()
    Larguras.Strings = (
      '50'
      '15'
      '40'
      '15'
      '15')
  end
  inherited CdsCCusto: TCMClientDataSet
    IndexDefs = <
      item
        Name = 'CdsCCustoIndex'
        Fields = 'NOME'
        Options = [ixCaseInsensitive]
      end>
  end
  object MontaSelectPartic: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Participante'
    Colunas.Strings = (
      'P1.NOME'
      'PL.NOME'
      'PR.INSCRICAONUMERO'
      'P2.NOME'
      'EL.MATRICULA'
      'EL.DATAADMISSAO'
      'EL.DATADEMISSAO')
    TipodeDado.Strings = (
      'C'
      'C'
      'N'
      'C'
      'C'
      'D'
      'D')
    Descricao.Strings = (
      'Nome Participante'
      'Plano Previd.'
      'Num. Inscrição'
      'Patrocinadora'
      'Matrícula'
      'Admissão'
      'Demissão')
    Tabelas.Strings = (
      'PESSOA P1'
      'PESSOA P2'
      'ELEGPATRO EL'
      'PLANPREV PL'
      'PARTPREVPLAN PR')
    CamposChave.Strings = (
      'PR.IDPESSOA'
      'P1.NOME')
    Filtro.Strings = (
      'PR.IDPESSOA = P1.IDPESSOA'
      'PR.IDPESSJUR = P2.IDPESSOA'
      'PR.IDPLANOPREV = PL.IDPLANOPREV'
      'PR.IDPESSOA = EL.IDPESSOA'
      'PR.IDPESSJUR = EL.IDPESSJUR')
    Larguras.Strings = (
      '50'
      '50'
      '15'
      '50'
      '15'
      '15'
      '15')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 589
    Top = 282
  end
end
