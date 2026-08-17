inherited frmMTCadParamCAF: TfrmMTCadParamCAF
  Left = 128
  Top = 110
  Caption = 'Par‚metros do Sistema'
  ClientHeight = 385
  ClientWidth = 500
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Top = 34
    Width = 500
    Height = 312
    object PageControl1: TPageControl
      Left = 1
      Top = 1
      Width = 498
      Height = 310
      ActivePage = TabIntegraContab
      Align = alClient
      TabOrder = 0
      object TabCadastros: TTabSheet
        Caption = 'Cadastros'
        object GroupBox4: TGroupBox
          Left = 208
          Top = 2
          Width = 267
          Height = 65
          Caption = ' Gerais '
          TabOrder = 0
          object dbcbCodPlaca: TDBCheckBox
            Left = 8
            Top = 38
            Width = 169
            Height = 17
            Caption = 'Gerar CÛdigo das Placas'
            DataField = 'EDITACODBEM'
            DataSource = ds
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object dbcbNomeBem: TDBCheckBox
            Left = 8
            Top = 14
            Width = 257
            Height = 17
            Caption = 'DescriÁ„o da Classe como Nome do Bem'
            DataField = 'FLGCLSDESBEM'
            DataSource = ds
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
        end
        object dbrgEmpresaGrupo: TDBRadioGroup
          Left = 208
          Top = 77
          Width = 267
          Height = 65
          Caption = ' Gerar CÛdigo das Placas por '
          Columns = 2
          DataField = 'SEQBEMEMP'
          DataSource = ds
          Items.Strings = (
            '&Empresa'
            '&Grupo'
            '&Classe'
            '&Sequencia')
          TabOrder = 1
          Values.Strings = (
            '0'
            '1'
            '2'
            '3')
        end
        object GroupBox3: TGroupBox
          Left = 8
          Top = 123
          Width = 184
          Height = 66
          Caption = ' M·scara do Grupo de Bens '
          TabOrder = 2
          object dbeMascaraGrupo: TwwDBEdit
            Left = 16
            Top = 25
            Width = 145
            Height = 21
            DataField = 'MASCCODGRUPO'
            DataSource = ds
            TabOrder = 0
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
        end
        object GroupBox6: TGroupBox
          Left = 8
          Top = 201
          Width = 184
          Height = 66
          Caption = ' M·scara da Classe de Bens '
          TabOrder = 3
          object dbeMascaraClasse: TwwDBEdit
            Left = 16
            Top = 26
            Width = 145
            Height = 21
            DataField = 'MASCARACLASSE'
            DataSource = ds
            TabOrder = 0
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
        end
        object GroupBox2: TGroupBox
          Left = 8
          Top = 2
          Width = 184
          Height = 113
          Caption = ' InstalaÁ„o do Sistema '
          TabOrder = 4
          object Label12: TLabel
            Left = 10
            Top = 16
            Width = 28
            Height = 13
            Caption = 'Data'
          end
          object Label13: TLabel
            Left = 10
            Top = 64
            Width = 27
            Height = 13
            Caption = 'PaÌs'
          end
          object dbdDataInicial: TCMDateTimePicker
            Left = 10
            Top = 32
            Width = 121
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            DataField = 'DATAINICIAL'
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
          object dbcmbPais: TwwDBLookupCombo
            Left = 10
            Top = 80
            Width = 165
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOMEPAIS'#9'30'#9'Nome'#9'F')
            DataField = 'IDPAIS'
            DataSource = ds
            LookupTable = cdsPais
            LookupField = 'IDPAIS'
            TabOrder = 1
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
            ShowMatchText = True
          end
        end
        object gboxNumPlacaIni: TGroupBox
          Left = 208
          Top = 151
          Width = 267
          Height = 61
          Caption = ' Placa de PatrimÙnio '
          TabOrder = 5
          object Label8: TLabel
            Left = 16
            Top = 16
            Width = 92
            Height = 13
            Caption = 'PrÛximo N˙mero'
          end
          object Label9: TLabel
            Left = 168
            Top = 16
            Width = 78
            Height = 13
            Caption = 'Quant.Digitos'
          end
          object dbeProxPlaca: TwwDBEdit
            Left = 16
            Top = 32
            Width = 129
            Height = 21
            DataField = 'PROXIMAPLACA'
            DataSource = ds
            TabOrder = 0
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbeDigitos: TwwDBEdit
            Left = 176
            Top = 32
            Width = 65
            Height = 21
            DataField = 'DIGMASCPLACA'
            DataSource = ds
            TabOrder = 1
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
        end
        object dbcbAluguelInterno: TDBCheckBox
          Left = 536
          Top = 368
          Width = 113
          Height = 17
          Caption = 'Aluguel Interno'
          DataField = 'ALUGUELINTERNO'
          DataSource = ds
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 6
          ValueChecked = '1'
          ValueUnchecked = '0'
          Visible = False
        end
        object dbcbGeraRequis: TDBCheckBox
          Left = 536
          Top = 384
          Width = 241
          Height = 17
          Caption = 'Gerar RequisiÁ„o de Material via O.S. '
          DataField = 'GERARREQMAT'
          DataSource = ds
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 7
          ValueChecked = '1'
          ValueUnchecked = '0'
          Visible = False
        end
        object dbgTipoConjunto: TDBRadioGroup
          Left = 208
          Top = 222
          Width = 267
          Height = 45
          Caption = ' Conjunto '
          Columns = 2
          DataField = 'TIPOCONJUNTO'
          DataSource = ds
          Items.Strings = (
            'MÈtodo 1'
            'MÈtodo 2')
          ParentShowHint = False
          ShowHint = True
          TabOrder = 8
          Values.Strings = (
            '0'
            '1'
            '2'
            '3')
        end
      end
      object TabIntegracao: TTabSheet
        Caption = 'IntegraÁ„o'
        object grpbxIntegra: TGroupBox
          Left = 32
          Top = 24
          Width = 201
          Height = 201
          Caption = ' Integrando com '
          TabOrder = 0
          object cbxContab: TDBCheckBox
            Left = 16
            Top = 24
            Width = 97
            Height = 17
            Caption = 'Contabilidade'
            DataField = 'INTEGRACONTAB'
            DataSource = ds
            TabOrder = 0
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object cbxCpg: TDBCheckBox
            Left = 16
            Top = 96
            Width = 113
            Height = 17
            Caption = 'Contas a Pagar'
            DataField = 'INTEGRACAP'
            DataSource = ds
            Enabled = False
            TabOrder = 1
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object cbxCre: TDBCheckBox
            Left = 16
            Top = 168
            Width = 129
            Height = 17
            Caption = 'Contas a Receber'
            DataField = 'INTEGRACAR'
            DataSource = ds
            Enabled = False
            TabOrder = 2
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
        end
        object gbSistemas: TGroupBox
          Left = 249
          Top = 24
          Width = 201
          Height = 201
          Caption = ' Derivando de  '
          TabOrder = 1
          object cbManut: TCheckBox
            Left = 16
            Top = 24
            Width = 107
            Height = 17
            Caption = 'ManutenÁ„o'
            TabOrder = 0
            OnClick = cbManutClick
          end
          object cbImob: TCheckBox
            Left = 16
            Top = 168
            Width = 166
            Height = 17
            Caption = 'Investimentos Imobili·rios'
            TabOrder = 1
            OnClick = cbImobClick
          end
          object cbAlmox: TCheckBox
            Left = 16
            Top = 96
            Width = 97
            Height = 17
            Caption = 'Almoxarifado'
            TabOrder = 2
            OnClick = cbAlmoxClick
          end
        end
        object cbCAF: TCheckBox
          Left = 608
          Top = 352
          Width = 153
          Height = 17
          Caption = 'Controle do Ativo Fixo'
          TabOrder = 2
          Visible = False
          OnClick = cbCAFClick
        end
      end
      object TabCalculos: TTabSheet
        Caption = 'C·lculos'
        object gbCalcula: TGroupBox
          Left = 256
          Top = 172
          Width = 193
          Height = 45
          Caption = ' Calcular '
          TabOrder = 0
          object cbCorrMonet: TDBCheckBox
            Left = 32
            Top = 17
            Width = 137
            Height = 17
            Caption = 'CorreÁ„o Monet·ria'
            DataField = 'FLGCALCCM'
            DataSource = ds
            TabOrder = 0
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
        end
        object dbrgFlgReaval: TDBRadioGroup
          Left = 256
          Top = 28
          Width = 193
          Height = 130
          Caption = ' MÈtodo de ReavaliaÁ„o '
          DataField = 'FLGREAVAL'
          DataSource = ds
          Items.Strings = (
            'FundaÁıes'
            'Empresas S.A.')
          TabOrder = 1
          Values.Strings = (
            '0'
            '1'
            '2')
        end
        object gbcalculo: TDBRadioGroup
          Left = 32
          Top = 28
          Width = 193
          Height = 130
          Caption = ' Periodo do Fechamento '
          DataField = 'FLGTIPOCALC'
          DataSource = ds
          Items.Strings = (
            'Di·rio'
            'Mensal'
            'Anual')
          TabOrder = 2
          Values.Strings = (
            'D'
            'M'
            'A')
        end
        object GroupBox1: TGroupBox
          Left = 32
          Top = 172
          Width = 193
          Height = 45
          Caption = ' Total de Dias do Ano '
          TabOrder = 3
          object dbednumdiasano: TwwDBEdit
            Left = 43
            Top = 17
            Width = 105
            Height = 21
            DataField = 'NUMDIASANO'
            DataSource = ds
            TabOrder = 0
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
        end
      end
      object TabIntegraContab: TTabSheet
        Caption = 'Dados Cont·beis'
        object GroupBox7: TGroupBox
          Left = 8
          Top = 104
          Width = 230
          Height = 45
          Caption = ' Plano de Contas Padr„o '
          TabOrder = 0
          object dblkcmbPlano: TwwDBLookupCombo
            Left = 8
            Top = 16
            Width = 214
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCPLANO'#9'20'#9'DESCRI«√O'
              'PLANO'#9'10'#9'PLANO')
            DataField = 'PLANOVIGENTE'
            DataSource = ds
            LookupTable = cdsPlano
            LookupField = 'PLANO'
            TabOrder = 0
            AutoDropDown = False
            ShowButton = True
            UseTFields = False
            AllowClearKey = False
          end
        end
        object GroupBox8: TGroupBox
          Left = 8
          Top = 56
          Width = 230
          Height = 45
          Caption = ' Tipo de OperaÁ„o Padr„o '
          TabOrder = 1
          object dblkcmbTipoOper: TwwDBLookupCombo
            Left = 8
            Top = 16
            Width = 214
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'TIPDESCRICAO'#9'25'#9'DescriÁ„o'#9'No')
            DataField = 'TIPOPERCTB'
            DataSource = ds
            LookupTable = cdsTipOper
            LookupField = 'TIPCODIGO'
            TabOrder = 0
            AutoDropDown = False
            ShowButton = True
            UseTFields = False
            AllowClearKey = False
          end
        end
        object dbrgEstornoPlan: TDBRadioGroup
          Left = 8
          Top = 160
          Width = 466
          Height = 41
          Caption = ' Em Estorno de MovimentaÁ„o, a Planilha Cont·bil ser· : '
          Columns = 2
          DataField = 'FLGREMOVEPLANCTB'
          DataSource = ds
          Items.Strings = (
            'ExcluÌda'
            'Estornada')
          TabOrder = 5
          Values.Strings = (
            'S'
            'N')
        end
        object GroupBox9: TGroupBox
          Left = 8
          Top = 8
          Width = 230
          Height = 45
          Caption = ' Atividade / Projeto Padr„o '
          TabOrder = 2
          object dblkcmbAtivProjeto: TwwDBLookupCombo
            Left = 8
            Top = 16
            Width = 214
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'25'#9'DescriÁ„o'
              'UNECODIGO'#9'10'#9'CÛdigo')
            DataField = 'ATIVPROJETO'
            DataSource = ds
            LookupTable = cdsAtivProjeto
            LookupField = 'UNIDNEGOC'
            TabOrder = 0
            AutoDropDown = False
            ShowButton = True
            UseTFields = False
            AllowClearKey = False
          end
        end
        object GroupBox10: TGroupBox
          Left = 240
          Top = 8
          Width = 233
          Height = 45
          Caption = ' Plano Previdenci·rio Padr„o '
          TabOrder = 3
          object dblkcmbPlanoPrev: TwwDBLookupCombo
            Left = 8
            Top = 16
            Width = 217
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'50'#9'DescriÁ„o')
            DataField = 'PLANPREVPADRAO'
            DataSource = ds
            LookupTable = cdsPlanoPrev
            LookupField = 'IDPLANOPREV'
            TabOrder = 0
            AutoDropDown = False
            ShowButton = True
            UseTFields = False
            AllowClearKey = False
          end
        end
        object GroupBox11: TGroupBox
          Left = 240
          Top = 56
          Width = 233
          Height = 45
          Caption = ' Patrocinadora Padr„o '
          TabOrder = 4
          object dblkcmbPatro: TwwDBLookupCombo
            Left = 8
            Top = 16
            Width = 217
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'60'#9'DescriÁ„o')
            DataField = 'PATROPADRAO'
            DataSource = ds
            LookupTable = cdsPatro
            LookupField = 'IDPATRO'
            TabOrder = 0
            AutoDropDown = False
            ShowButton = True
            UseTFields = False
            AllowClearKey = False
          end
        end
        object dbgPartidaContabil: TDBRadioGroup
          Left = 240
          Top = 104
          Width = 233
          Height = 45
          Caption = ' LanÁamento Cont·bil '
          Columns = 2
          DataField = 'FLGCONTABFECHAM'
          DataSource = ds
          Items.Strings = (
            'AnalÌtica'
            'SintÈtica')
          TabOrder = 6
          Values.Strings = (
            '0'
            '1')
        end
        object dbgCtaDespesaDepreciacao: TDBRadioGroup
          Left = 8
          Top = 216
          Width = 467
          Height = 41
          Caption = ' A Conta Cont·bil ser· definida pelo Centro de Custo ? '
          Columns = 2
          DataField = 'FLGCTADEPREC'
          DataSource = ds
          Items.Strings = (
            'N„o'
            'Sim')
          TabOrder = 7
          Values.Strings = (
            '0'
            '1')
        end
      end
      object TabInventario: TTabSheet
        Caption = 'Invent·rio'
        object grbColetor: TGroupBox
          Left = 8
          Top = 8
          Width = 465
          Height = 129
          Caption = 'Coletor de Dados'
          TabOrder = 0
          object Label1: TLabel
            Left = 16
            Top = 24
            Width = 42
            Height = 13
            Caption = 'Modelo'
          end
          object Label2: TLabel
            Left = 296
            Top = 24
            Width = 31
            Height = 13
            Caption = 'Porta'
          end
          object Label3: TLabel
            Left = 368
            Top = 24
            Width = 64
            Height = 13
            Caption = 'Velocidade'
          end
          object Label7: TLabel
            Left = 16
            Top = 72
            Width = 170
            Height = 13
            Caption = 'Pasta de Trabalho (Utilit·rios)'
          end
          object cmbColetor: TComboBox
            Left = 16
            Top = 40
            Width = 273
            Height = 21
            ItemHeight = 13
            TabOrder = 0
            Items.Strings = (
              'N„o usa coletor'
              'Coletor de Dados Seal - PDT 3100'
              'Coletor de Dados SCW LUCAS 7000'
              'Coletor de Dados PALM - CTRQ'
              'Coletor de Dados CMNet - Pocket PC')
          end
          object cmbPorta: TComboBox
            Left = 296
            Top = 40
            Width = 65
            Height = 21
            ItemHeight = 13
            TabOrder = 1
            Items.Strings = (
              'COM1'
              'COM2'
              'COM3'
              'COM4'
              'COM5'
              'COM6'
              'COM7'
              'COM8')
          end
          object cmbVeloc: TComboBox
            Left = 368
            Top = 40
            Width = 81
            Height = 21
            ItemHeight = 13
            TabOrder = 2
            Items.Strings = (
              '38400'
              '19200'
              '9600'
              '4800'
              '2400'
              '1200'
              '300')
          end
          object dbeCDPath: TwwDBEdit
            Left = 16
            Top = 88
            Width = 411
            Height = 21
            Color = clMenu
            DataField = 'CDPATH'
            DataSource = ds
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 3
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object bbtnSelPasta: TBitBtn
            Left = 427
            Top = 88
            Width = 21
            Height = 21
            TabOrder = 4
            OnClick = bbtnSelPastaClick
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
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 500
    Height = 34
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Width = 86
        Height = 28
        Enabled = False
        Layout = blGlyphLeft
        Visible = False
      end
      inherited sbtnAlterar: TToolbarButton97
        Left = 86
        Width = 86
        Height = 28
        Layout = blGlyphLeft
      end
      inherited sbtnProcurar: TToolbarButton97
        Left = 258
        Width = 86
        Height = 28
        Enabled = False
        Layout = blGlyphLeft
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Left = 172
        Width = 86
        Height = 28
        Enabled = False
        Layout = blGlyphLeft
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 346
    Width = 500
    inherited tb97Fundo: TToolbar97
      Left = 328
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 159
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 738
    Top = 511
    TargetsData = (
      1
      1
      (
        '*'
        'Filter'
        0))
  end
  inherited ds: TwwDataSource
    Left = 352
    Top = 0
  end
  inherited ImlPadrao: TImageList
    Left = 664
    Top = 512
  end
  inherited CmeCadastro: TCmEventosCadastro
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 264
    Top = 0
  end
  inherited Cds: TCMClientDataSet
    Left = 320
    Top = 0
  end
  inherited MontaSelect: TMontaSelect
    Left = 440
    Top = 0
  end
  object pDirColetor: TProcuraDirDlg
    Caption = 'Selecione a pasta de trabalho'
    Directory = 
      #0#2#0#0'‘ê'#6#16'Ãv'#6#20#0#0#0'Qââ;ƒ'#0#0#0#19#0#0#0'†'#30'ê'#6#0#0#0#0'Rââ;®Ïè'#6'¿”U'#6'î'#0#0#0'C:\ProjetosC' +
      'M5\CONTAB\Reports\Source\FParamBalanceteCCxC.DFM'#0'\so@ƒê'#6'`∏ê'#6'H'#0#0#0 +
      'C:\ProjetosCM5\CONTAB\Reports\Source\FParamBalanceteCol.h'#1#0#0#19#0#0#0 +
      'òCè'#6#0#0#0#0'('#9#0#0#19#0#0#0'x'#23'V'#6#0#0#0#0'¸'#12#0#0#27#0#0#0'Ä∆'#3'@'#0#0#0#0#0#0#0#0#0#0#0#0#1#0#0#0'†∂Å'#6'¨öU'#6'§'#0#0#0 +
      'CmEv'
    Folder = foCustom
    Options = [bfStatusText]
    ShowPath = True
    Left = 536
    Top = 456
  end
  object cdsPlano: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 24
    Top = 456
  end
  object cdsTipOper: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 80
    Top = 456
  end
  object cdsAtivProjeto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 344
    Top = 456
  end
  object cdsMoeda: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 272
    Top = 456
  end
  object cdsPatro: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 144
    Top = 456
  end
  object cdsPlanoPrev: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 208
    Top = 456
  end
  object cdsGrupo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 480
    Top = 456
  end
  object cdsClasse: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 416
    Top = 456
  end
  object cdsBem: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 600
    Top = 167
  end
  object sqlBem: TCMSqlParams
    SQL.Strings = (
      'SELECT IDBEM'
      'FROM BEM'
      'WHERE (IDPESSOA = :IDPESSOA)'
      'ORDER BY IDBEM')
    ClientDataSet = cdsBem
    Left = 600
    Top = 152
  end
  object cdsParamGlobal: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 600
    Top = 88
  end
  object cdsPais: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 600
    Top = 224
  end
  object sqlTemp: TCMSqlParams
    SQL.Strings = (
      'SELECT IDPAIS, NOMEPAIS, CODINTERNACIONAL'
      'FROM PAIS'
      'ORDER BY NOMEPAIS')
    Left = 600
    Top = 280
  end
end
