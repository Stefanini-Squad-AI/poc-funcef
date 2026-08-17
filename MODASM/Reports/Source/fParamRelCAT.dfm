inherited frmParamRelCAT: TfrmParamRelCAT
  Left = 163
  Top = 142
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Emissão do CAT - Comunicação de Acidente do Trabalho'
  ClientHeight = 384
  ClientWidth = 529
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 529
    Height = 345
    BorderWidth = 2
    object PageControl1: TPageControl
      Left = 4
      Top = 4
      Width = 521
      Height = 337
      ActivePage = tbsGeral
      Align = alClient
      TabOrder = 0
      object tbsGeral: TTabSheet
        Caption = 'Geral'
        object Label1: TLabel
          Left = 9
          Top = 3
          Width = 72
          Height = 13
          Caption = 'Tipo de CAT'
        end
        object Label2: TLabel
          Left = 170
          Top = 3
          Width = 98
          Height = 13
          Caption = 'Tipo de Acidente'
        end
        object Label3: TLabel
          Left = 9
          Top = 48
          Width = 127
          Height = 13
          Caption = 'Último Dia Trabalhado'
        end
        object Label4: TLabel
          Left = 10
          Top = 148
          Width = 164
          Height = 13
          Caption = 'Parte(s) do Corpo Atingida(s)'
        end
        object Label5: TLabel
          Left = 10
          Top = 186
          Width = 98
          Height = 13
          Caption = 'Agente Causador'
        end
        object Label6: TLabel
          Left = 9
          Top = 225
          Width = 245
          Height = 13
          Caption = 'Situação Geradora do Acidente ou Doença'
        end
        object Label30: TLabel
          Left = 9
          Top = 95
          Width = 100
          Height = 13
          Caption = 'Hora do Acidente'
        end
        object cmbTipoCAT: TComboBox
          Left = 9
          Top = 17
          Width = 145
          Height = 21
          ItemHeight = 13
          TabOrder = 0
          OnChange = cmbTipoCATChange
          Items.Strings = (
            'Inicial'
            'Reabertura'
            'Comun.Óbito')
        end
        object cmbTipoAcid: TComboBox
          Left = 170
          Top = 17
          Width = 145
          Height = 21
          ItemHeight = 13
          TabOrder = 1
          Items.Strings = (
            'Típico'
            'Doença'
            'Trajeto')
        end
        object rgHouveAfast: TRadioGroup
          Left = 330
          Top = 3
          Width = 166
          Height = 35
          Caption = 'Houve Afastamento?'
          Columns = 2
          ItemIndex = 0
          Items.Strings = (
            'Sim'
            'Não')
          TabOrder = 2
          OnClick = rgHouveAfastClick
        end
        object edDataUtlDia: TCMDateTimePicker
          Left = 10
          Top = 64
          Width = 127
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
        object gbxLocal: TGroupBox
          Left = 170
          Top = 46
          Width = 325
          Height = 100
          Caption = 'Local do Acidente'
          TabOrder = 4
          object lblCNPJ: TLabel
            Left = 8
            Top = 76
            Width = 133
            Height = 13
            Caption = 'CGC/CNPJ da Empresa'
            Visible = False
          end
          object cmbLocal: TComboBox
            Left = 8
            Top = 14
            Width = 308
            Height = 21
            ItemHeight = 13
            TabOrder = 0
            OnChange = cmbLocalChange
            Items.Strings = (
              'Estabelecimento da empregadora'
              'Empresa onde a empregadora presta serviço'
              'Via Pública'
              'Área Rural'
              'Outros (especificar)')
          end
          object ProcuraCidade: TCMProcura
            Left = 8
            Top = 40
            Width = 280
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
            OnValidaDados = ProcuraCidadeValidaDados
            LookupChave = 'IDCIDADES'
            LookupDescricao = 'NOME'
            MontaSelect = MontaSelectCidade
            LookupTabela = 'CM.CIDADES'
            DataBaseName = 'BaseDados'
            ReadOnly = False
          end
          object edUF: TEdit
            Left = 291
            Top = 42
            Width = 27
            Height = 21
            TabOrder = 2
          end
          object edCNPJ: TEdit
            Left = 152
            Top = 72
            Width = 166
            Height = 21
            TabOrder = 3
            Visible = False
          end
        end
        object edParteCorpo: TEdit
          Left = 10
          Top = 162
          Width = 489
          Height = 21
          TabOrder = 5
        end
        object edAgente: TEdit
          Left = 10
          Top = 200
          Width = 489
          Height = 21
          TabOrder = 6
        end
        object edSitGeradora: TEdit
          Left = 9
          Top = 239
          Width = 489
          Height = 21
          TabOrder = 7
        end
        object rgRegPolicial: TRadioGroup
          Left = 9
          Top = 265
          Width = 190
          Height = 35
          Caption = 'Houve Registro Policial?'
          Columns = 2
          ItemIndex = 1
          Items.Strings = (
            'Sim'
            'Não')
          TabOrder = 8
        end
        object rgMorte: TRadioGroup
          Left = 310
          Top = 265
          Width = 188
          Height = 35
          Caption = 'Houve Morte?'
          Columns = 2
          ItemIndex = 1
          Items.Strings = (
            'Sim'
            'Não')
          TabOrder = 9
        end
        object edHoraAcid: TEdit
          Left = 9
          Top = 108
          Width = 102
          Height = 21
          TabOrder = 10
        end
      end
      object tbsTestemunhas: TTabSheet
        Caption = 'Testemunhas'
        ImageIndex = 1
        object Label7: TLabel
          Left = 12
          Top = 0
          Width = 33
          Height = 13
          Caption = 'Nome'
        end
        object Label8: TLabel
          Left = 12
          Top = 39
          Width = 224
          Height = 13
          Caption = 'Endereço (Rua, Número, Complemento)'
        end
        object Label9: TLabel
          Left = 12
          Top = 77
          Width = 34
          Height = 13
          Caption = 'Bairro'
        end
        object Label10: TLabel
          Left = 12
          Top = 112
          Width = 25
          Height = 13
          Caption = 'CEP'
        end
        object Label11: TLabel
          Left = 92
          Top = 112
          Width = 57
          Height = 13
          Caption = 'Município'
        end
        object Label12: TLabel
          Left = 309
          Top = 112
          Width = 17
          Height = 13
          Caption = 'UF'
        end
        object Label13: TLabel
          Left = 360
          Top = 112
          Width = 51
          Height = 13
          Caption = 'Telefone'
        end
        object Bevel1: TBevel
          Left = 0
          Top = 151
          Width = 511
          Height = 1
        end
        object Label14: TLabel
          Left = 12
          Top = 157
          Width = 33
          Height = 13
          Caption = 'Nome'
        end
        object Label15: TLabel
          Left = 12
          Top = 196
          Width = 224
          Height = 13
          Caption = 'Endereço (Rua, Número, Complemento)'
        end
        object Label16: TLabel
          Left = 12
          Top = 234
          Width = 34
          Height = 13
          Caption = 'Bairro'
        end
        object Label17: TLabel
          Left = 12
          Top = 269
          Width = 25
          Height = 13
          Caption = 'CEP'
        end
        object Label18: TLabel
          Left = 92
          Top = 269
          Width = 57
          Height = 13
          Caption = 'Município'
        end
        object Label19: TLabel
          Left = 309
          Top = 269
          Width = 17
          Height = 13
          Caption = 'UF'
        end
        object Label20: TLabel
          Left = 360
          Top = 269
          Width = 51
          Height = 13
          Caption = 'Telefone'
        end
        object edNome1: TEdit
          Left = 12
          Top = 12
          Width = 489
          Height = 21
          TabOrder = 0
        end
        object edEnder1: TEdit
          Left = 12
          Top = 52
          Width = 489
          Height = 21
          TabOrder = 1
        end
        object edBairro1: TEdit
          Left = 12
          Top = 90
          Width = 166
          Height = 21
          TabOrder = 2
        end
        object edCEP1: TEdit
          Left = 12
          Top = 125
          Width = 70
          Height = 21
          TabOrder = 3
        end
        object edCidade1: TEdit
          Left = 90
          Top = 125
          Width = 206
          Height = 21
          TabOrder = 4
        end
        object edUF1: TEdit
          Left = 307
          Top = 125
          Width = 38
          Height = 21
          TabOrder = 5
        end
        object edTelef1: TEdit
          Left = 360
          Top = 125
          Width = 140
          Height = 21
          TabOrder = 6
        end
        object edNome2: TEdit
          Left = 12
          Top = 169
          Width = 489
          Height = 21
          TabOrder = 7
        end
        object edEnder2: TEdit
          Left = 12
          Top = 209
          Width = 489
          Height = 21
          TabOrder = 8
        end
        object edBairro2: TEdit
          Left = 12
          Top = 247
          Width = 166
          Height = 21
          TabOrder = 9
        end
        object edCEP2: TEdit
          Left = 12
          Top = 282
          Width = 70
          Height = 21
          TabOrder = 10
        end
        object edCidade2: TEdit
          Left = 90
          Top = 282
          Width = 206
          Height = 21
          TabOrder = 11
        end
        object edUF2: TEdit
          Left = 307
          Top = 282
          Width = 38
          Height = 21
          TabOrder = 12
        end
        object edTelef2: TEdit
          Left = 360
          Top = 282
          Width = 140
          Height = 21
          TabOrder = 13
        end
        object bbtnBusca1: TBitBtn
          Left = 471
          Top = 83
          Width = 30
          Height = 25
          Hint = 'Busca Uma Testemunha Cadastrada'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 14
          OnClick = bbtnBusca1Click
          Glyph.Data = {
            42020000424D4202000000000000420000002800000010000000100000000100
            1000030000000002000000000000000000000000000000000000007C0000E003
            00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C104210421F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C00000000FF7F00001F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C00000000FF7FFF7FFF7F00001F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1F7C00000000FF7FFF7FFF7FFF7FFF7FFF7F00001F7C
            1F7C1F7C1F7C1F7C1F7C1F7C1042FF7FFF7FFF7FFF7FFF7F1F00FF7F00001F7C
            1F7C1F7C1F7C00401F7C1F7C1042FF7FFF7F1F001F001F00FF7FFF7FFF7F0000
            1F7C1F7C1F7C004000401F7C1F7C1042FF7FFF7FFF7FFF7FFF7F1F00FF7F0000
            1F7C1F7C1F7C0040004000401F7C1042FF7FFF7F1F001F001F00FF7FFF7FFF7F
            00001F7C1F7C1F7C0040004000400000000000000000FF7FFF7FFF7F1F00FF7F
            FF7F00001F7C1F7C1F7C00400000FF031F7CFF031F7C000010021F00FF7FFF7F
            FF7FFF7F00001F7C1F7C0000FF031F7CFF031F7CFF031F7C0000FF7FFF7FFF7F
            104210421F7C1F7C1F7C00001F7CFF031F7CFF031F7CFF030000FF7F10421042
            1F7C1F7C1F7C1F7C1F7C0000FF031F7CFF031F7CFF031F7C000010421F7C1F7C
            1F7C1F7C1F7C1F7C1F7C00001F7CFF031F7CFF031F7CFF0300001F7C1F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1F7C00001F7CFF031F7CFF0300001F7C1F7C1F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1F7C1F7C00000000000000001F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C}
        end
        object bbtnBusca2: TBitBtn
          Left = 471
          Top = 243
          Width = 30
          Height = 25
          Hint = 'Busca Outra Testemunha Cadastrada'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 15
          OnClick = bbtnBusca2Click
          Glyph.Data = {
            42020000424D4202000000000000420000002800000010000000100000000100
            1000030000000002000000000000000000000000000000000000007C0000E003
            00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C104210421F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C00000000FF7F00001F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C00000000FF7FFF7FFF7F00001F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1F7C00000000FF7FFF7FFF7FFF7FFF7FFF7F00001F7C
            1F7C1F7C1F7C1F7C1F7C1F7C1042FF7FFF7FFF7FFF7FFF7F1F00FF7F00001F7C
            1F7C1F7C1F7C00401F7C1F7C1042FF7FFF7F1F001F001F00FF7FFF7FFF7F0000
            1F7C1F7C1F7C004000401F7C1F7C1042FF7FFF7FFF7FFF7FFF7F1F00FF7F0000
            1F7C1F7C1F7C0040004000401F7C1042FF7FFF7F1F001F001F00FF7FFF7FFF7F
            00001F7C1F7C1F7C0040004000400000000000000000FF7FFF7FFF7F1F00FF7F
            FF7F00001F7C1F7C1F7C00400000FF031F7CFF031F7C000010021F00FF7FFF7F
            FF7FFF7F00001F7C1F7C0000FF031F7CFF031F7CFF031F7C0000FF7FFF7FFF7F
            104210421F7C1F7C1F7C00001F7CFF031F7CFF031F7CFF030000FF7F10421042
            1F7C1F7C1F7C1F7C1F7C0000FF031F7CFF031F7CFF031F7C000010421F7C1F7C
            1F7C1F7C1F7C1F7C1F7C00001F7CFF031F7CFF031F7CFF0300001F7C1F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1F7C00001F7CFF031F7CFF0300001F7C1F7C1F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1F7C1F7C00000000000000001F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C}
        end
      end
      object tbsAtestado: TTabSheet
        Caption = 'Atestado Médico'
        ImageIndex = 2
        object Label21: TLabel
          Left = 8
          Top = 6
          Width = 185
          Height = 13
          Caption = 'Unidade de Atendimento Médico'
        end
        object Label22: TLabel
          Left = 8
          Top = 104
          Width = 188
          Height = 13
          Caption = 'Duração provável do tratamento '
        end
        object Label23: TLabel
          Left = 256
          Top = 104
          Width = 26
          Height = 13
          Caption = 'Dias'
        end
        object Label24: TLabel
          Left = 8
          Top = 47
          Width = 102
          Height = 13
          Caption = 'Data Atendimento'
        end
        object Label25: TLabel
          Left = 149
          Top = 47
          Width = 102
          Height = 13
          Caption = 'Hora Atendimento'
        end
        object Label26: TLabel
          Left = 8
          Top = 127
          Width = 180
          Height = 13
          Caption = 'Descrição e Natureza da Lesão'
        end
        object Label27: TLabel
          Left = 8
          Top = 164
          Width = 122
          Height = 13
          Caption = 'Diagnóstico Provável'
        end
        object Label28: TLabel
          Left = 427
          Top = 164
          Width = 40
          Height = 13
          Caption = 'CID 10'
        end
        object Label29: TLabel
          Left = 8
          Top = 208
          Width = 75
          Height = 13
          Caption = 'Observações'
        end
        object edUnidade: TEdit
          Left = 8
          Top = 20
          Width = 489
          Height = 21
          TabOrder = 0
        end
        object dtDataAtend: TCMDateTimePicker
          Left = 8
          Top = 60
          Width = 102
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
        object edHora: TEdit
          Left = 149
          Top = 60
          Width = 102
          Height = 21
          TabOrder = 2
        end
        object rgInternacao: TRadioGroup
          Left = 312
          Top = 47
          Width = 184
          Height = 35
          Caption = 'Houve Internação ?'
          Columns = 2
          ItemIndex = 0
          Items.Strings = (
            'Sim'
            'Não')
          TabOrder = 3
        end
        object redDias: TRealEdit
          Left = 194
          Top = 100
          Width = 57
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '0,00')
          TabOrder = 4
          WordWrap = False
          IntDigits = 10
          DecDigits = 0
          NumberFormat = fNumber
          Signal = False
        end
        object rgAfastarse: TRadioGroup
          Left = 312
          Top = 88
          Width = 184
          Height = 35
          Caption = 'Deverá Afastar-se ?'
          Columns = 2
          ItemIndex = 0
          Items.Strings = (
            'Sim'
            'Não')
          TabOrder = 5
        end
        object edLesao: TEdit
          Left = 8
          Top = 141
          Width = 489
          Height = 21
          TabOrder = 6
        end
        object edDiagnostico: TEdit
          Left = 8
          Top = 178
          Width = 409
          Height = 21
          TabOrder = 7
        end
        object edCID: TEdit
          Left = 427
          Top = 178
          Width = 70
          Height = 21
          TabOrder = 8
        end
        object memObserv: TMemo
          Left = 8
          Top = 220
          Width = 489
          Height = 81
          ScrollBars = ssVertical
          TabOrder = 9
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 345
    Width = 529
    inherited tb97Fundo: TToolbar97
      Left = 359
    end
    inherited TB97oKCancelar: TToolbar97
      inherited ToolbarSep971: TToolbarSep97
        Visible = False
      end
      inherited bbtnConfirmar: TBitBtn
        ModalResult = 0
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Enabled = False
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 688
    Top = 64
    TargetsData = (
      1
      2
      (
        'TRealEdit'
        'Text'
        0)
      (
        'TMemo'
        'Text'
        0))
  end
  inherited Cmp_Padrao: TCmParamReport
    Left = 624
    Top = 64
  end
  object MontaSelectCidade: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Cidade'
    Colunas.Strings = (
      'CIDADES.NOME'
      'ESTADO.CODESTADO')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Nome da Cidade'
      'Sigla UF')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'CIDADES'
      'ESTADO')
    CamposChave.Strings = (
      'CIDADES.IDCIDADES'
      'ESTADO.CODESTADO')
    Filtro.Strings = (
      'CIDADES.IDESTADO = ESTADO.IDESTADO')
    Larguras.Strings = (
      '60'
      '10')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 632
    Top = 134
  end
  object MontaSelectTestemunha: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Procura Testemunhas Cadastradas'
    Colunas.Strings = (
      'P.NOME'
      'E.LOGRADOURO'
      'E.NUMERO'
      'E.COMPLEMENTO'
      'E.BAIRRO'
      'E.CEP'
      'C.NOME'
      'EST.CODESTADO'
      'TEL.DDI'
      'TEL.DDD'
      'TEL.NUMERO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Nome da Pessoa'
      'Logradouro'
      'Número'
      'Complemento'
      'Bairro'
      'CEP'
      'Nome da Cidade'
      'Sigla UF'
      'DDI'
      'DDD'
      'Número Telef.')
    SensivelACaixa.Strings = (
      'S'
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
      'PESSOA P'
      'ENDPESS E'
      'CIDADES C'
      'ESTADO EST'
      'TELENDPESS TEL')
    CamposChave.Strings = (
      'P.IDPESSOA'
      'P.NOME'
      'E.LOGRADOURO'
      'E.NUMERO'
      'E.COMPLEMENTO'
      'E.BAIRRO'
      'E.CEP'
      'C.NOME'
      'EST.CODESTADO'
      'TEL.DDI'
      'TEL.DDD'
      'TEL.NUMERO')
    Filtro.Strings = (
      'P.TIPO                             = '#39'F'#39
      'P.IDPESSOA                   = E.IDPESSOA(+)'
      'P.IDENDRESIDENCIAL  = E.IDENDERECO(+)'
      'E.IDCIDADES                  = C.IDCIDADES(+)'
      'P.IDENDRESIDENCIAL  = TEL.IDENDERECO(+)'
      'C.IDESTADO                   = EST.IDESTADO(+)')
    Larguras.Strings = (
      '60'
      '60'
      '6'
      '15'
      '20'
      '10'
      '20'
      '4'
      '5'
      '5'
      '10')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 632
    Top = 150
  end
end
