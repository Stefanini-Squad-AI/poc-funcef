inherited frmCadParamCaf: TfrmCadParamCaf
  Left = 293
  Top = 70
  Caption = 'Parâmetros do Ativo Fixo'
  ClientHeight = 376
  ClientWidth = 501
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 501
    Height = 290
    object PageControl1: TPageControl
      Left = 5
      Top = 5
      Width = 491
      Height = 280
      ActivePage = TabInventario
      Align = alClient
      TabOrder = 0
      object TabCadastros: TTabSheet
        Caption = 'Cadastros'
        object GroupBox4: TGroupBox
          Left = 208
          Top = 8
          Width = 267
          Height = 65
          Caption = ' Parâmetros '
          TabOrder = 0
          object dbcbCodPlaca: TDBCheckBox
            Left = 8
            Top = 37
            Width = 169
            Height = 17
            Caption = 'Gerar Código das Placas'
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
            Top = 15
            Width = 257
            Height = 17
            Caption = 'Descrição da Classe como Nome do Bem'
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
          Top = 76
          Width = 266
          Height = 57
          Caption = ' Gerar Código das Placas por '
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
          Top = 72
          Width = 181
          Height = 55
          Caption = ' Máscara do Grupo de Bens '
          TabOrder = 2
          object dbeMascaraGrupo: TwwDBEdit
            Left = 16
            Top = 24
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
          Top = 136
          Width = 181
          Height = 55
          Caption = ' Máscara da Classe de Bens '
          TabOrder = 3
          object dbeMascaraClasse: TwwDBEdit
            Left = 16
            Top = 24
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
        object GroupBox1: TGroupBox
          Left = 8
          Top = 200
          Width = 181
          Height = 45
          Caption = ' Total de Dias do Ano '
          TabOrder = 4
          object dbednumdiasano: TwwDBEdit
            Left = 32
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
        object GroupBox2: TGroupBox
          Left = 8
          Top = 8
          Width = 181
          Height = 57
          Caption = ' Instalação do Sistema '
          TabOrder = 5
          object dbdDataInicial: TCMDateTimePicker
            Left = 30
            Top = 22
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
        end
        object gboxNumPlacaIni: TGroupBox
          Left = 208
          Top = 136
          Width = 265
          Height = 61
          Caption = ' Placa de Patrimônio '
          TabOrder = 6
          object Label8: TLabel
            Left = 16
            Top = 16
            Width = 92
            Height = 13
            Caption = 'Próximo Número'
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
          TabOrder = 7
          ValueChecked = '1'
          ValueUnchecked = '0'
          Visible = False
        end
        object dbcbGeraRequis: TDBCheckBox
          Left = 536
          Top = 384
          Width = 241
          Height = 17
          Caption = 'Gerar Requisição de Material via O.S. '
          DataField = 'GERARREQMAT'
          DataSource = ds
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 8
          ValueChecked = '1'
          ValueUnchecked = '0'
          Visible = False
        end
        object dbgTipoConjunto: TDBRadioGroup
          Left = 208
          Top = 200
          Width = 265
          Height = 45
          Caption = ' Conjunto '
          Columns = 2
          DataField = 'TIPOCONJUNTO'
          DataSource = ds
          Items.Strings = (
            'Método 1'
            'Método 2')
          ParentShowHint = False
          ShowHint = True
          TabOrder = 9
          Values.Strings = (
            '0'
            '1'
            '2'
            '3')
        end
      end
      object TabIntegracao: TTabSheet
        Caption = 'Integração'
        object grpbxIntegra: TGroupBox
          Left = 32
          Top = 8
          Width = 418
          Height = 60
          Caption = 'Integração'
          TabOrder = 0
          object cbxContab: TCheckBox
            Left = 16
            Top = 24
            Width = 97
            Height = 17
            Caption = 'Contabilidade'
            TabOrder = 0
          end
          object cbxCre: TCheckBox
            Left = 280
            Top = 24
            Width = 129
            Height = 17
            Caption = 'Contas a Receber'
            TabOrder = 1
          end
          object cbxCpg: TCheckBox
            Left = 144
            Top = 24
            Width = 113
            Height = 17
            Caption = 'Contas a Pagar'
            TabOrder = 2
          end
        end
        object gbSistemas: TGroupBox
          Left = 33
          Top = 96
          Width = 417
          Height = 57
          Caption = 'Sistemas Instalados'
          TabOrder = 1
          object cbCAF: TCheckBox
            Left = 16
            Top = 24
            Width = 89
            Height = 17
            Caption = 'Ativo Fixo'
            TabOrder = 0
            OnClick = cbCAFExit
          end
          object cbManut: TCheckBox
            Left = 104
            Top = 24
            Width = 107
            Height = 17
            Caption = 'Manutenção'
            TabOrder = 1
            OnClick = cbManutExit
          end
          object cbImob: TCheckBox
            Left = 312
            Top = 24
            Width = 81
            Height = 17
            Caption = 'Imobiliario'
            TabOrder = 2
            OnClick = cbImobExit
          end
          object cbAlmox: TCheckBox
            Left = 208
            Top = 24
            Width = 97
            Height = 17
            Caption = 'Almoxarifado'
            TabOrder = 3
            OnClick = cbAlmoxExit
          end
        end
      end
      object TabCalculos: TTabSheet
        Caption = 'Cálculos'
        object gbCalcula: TGroupBox
          Left = 248
          Top = 184
          Width = 201
          Height = 41
          Caption = 'Calcula  '
          TabOrder = 0
          object cbCorrMonet: TCheckBox
            Left = 32
            Top = 16
            Width = 137
            Height = 17
            Caption = 'Correção Monetária'
            TabOrder = 0
          end
        end
        object dbrgFlgReaval: TDBRadioGroup
          Left = 24
          Top = 160
          Width = 193
          Height = 65
          Caption = 'Método de Reavaliação'
          DataField = 'FLGREAVAL'
          DataSource = ds
          Items.Strings = (
            'Fundações'
            'Empresas S.A.')
          TabOrder = 1
          Values.Strings = (
            '0'
            '1')
        end
        object gbcalculo: TDBRadioGroup
          Left = 24
          Top = 72
          Width = 193
          Height = 81
          Caption = 'Cálculo'
          DataField = 'FLGTIPOCALC'
          DataSource = ds
          Items.Strings = (
            'Diário'
            'Mensal'
            'Anual')
          TabOrder = 2
          Values.Strings = (
            'D'
            'M'
            'A')
        end
        object GroupBox5: TGroupBox
          Left = 248
          Top = 8
          Width = 201
          Height = 169
          Caption = 'Moedas'
          TabOrder = 3
          object Label4: TLabel
            Left = 18
            Top = 18
            Width = 37
            Height = 13
            Caption = 'Oficial'
          end
          object Label6: TLabel
            Left = 18
            Top = 70
            Width = 34
            Height = 13
            Caption = 'Fiscal'
          end
          object Label5: TLabel
            Left = 18
            Top = 121
            Width = 55
            Height = 13
            Caption = 'Gerencial'
          end
          object dblcMoedaFiscal: TwwDBLookupCombo
            Left = 18
            Top = 86
            Width = 168
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'MOEDESC'#9'20'#9'Descrição')
            DataField = 'MOEDAFISCAL'
            DataSource = ds
            LookupTable = qryMoeda
            LookupField = 'MOECODIGO'
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
            ShowMatchText = True
          end
          object dblcMoedaOficial: TwwDBLookupCombo
            Left = 18
            Top = 34
            Width = 168
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'MOEDESC'#9'20'#9'Descrição')
            DataField = 'MOEDAOFICIAL'
            DataSource = ds
            LookupTable = qryMoeda
            LookupField = 'MOECODIGO'
            TabOrder = 1
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
            ShowMatchText = True
          end
          object dblcMoedaGerencial: TwwDBLookupCombo
            Left = 18
            Top = 137
            Width = 168
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'MOEDESC'#9'20'#9'Descrição')
            DataField = 'MOEDAGERENCIAL'
            DataSource = ds
            LookupTable = qryMoeda
            LookupField = 'MOECODIGO'
            Options = [loTitles]
            TabOrder = 2
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
            ShowMatchText = True
            OnExit = dblcMoedaGerencialExit
          end
        end
        object dbrdgTipAtuSaldoContab: TDBRadioGroup
          Left = 24
          Top = 8
          Width = 193
          Height = 57
          Caption = 'Atualização do Saldo Contábil'
          DataField = 'TIPATUSALDOCONTAB'
          DataSource = ds
          Items.Strings = (
            'Servidor'
            'Cliente')
          TabOrder = 4
          Values.Strings = (
            '0'
            '1')
        end
      end
      object TabIntegraContab: TTabSheet
        Caption = 'Integração Contábil'
        object GroupBox7: TGroupBox
          Left = 128
          Top = 112
          Width = 230
          Height = 45
          Caption = ' Plano de Contas Padrão '
          TabOrder = 4
          object dblkcmbPlano: TwwDBLookupCombo
            Left = 8
            Top = 16
            Width = 214
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCPLANO'#9'20'#9'DESCRIÇÃO'
              'PLANO'#9'10'#9'PLANO')
            DataField = 'PLANOVIGENTE'
            DataSource = ds
            LookupTable = qryPlano
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
          Top = 59
          Width = 230
          Height = 45
          Caption = ' Tipo de Operação Padrão '
          TabOrder = 2
          object dblkcmbTipoOper: TwwDBLookupCombo
            Left = 8
            Top = 16
            Width = 214
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'TIPDESCRICAO'#9'25'#9'Descrição'#9'No')
            DataField = 'TIPOPERCTB'
            DataSource = ds
            LookupTable = qryTipOper
            LookupField = 'TIPCODIGO'
            TabOrder = 0
            AutoDropDown = False
            ShowButton = True
            UseTFields = False
            AllowClearKey = False
          end
        end
        object dbrgEstornoPlan: TDBRadioGroup
          Left = 64
          Top = 176
          Width = 353
          Height = 57
          Caption = 'Remove a Planilha Contábil em Estorno de Movimentação ?'
          Columns = 2
          DataField = 'FLGREMOVEPLANCTB'
          DataSource = ds
          Items.Strings = (
            'Sim'
            'Não')
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
          Caption = ' Atividade / Projeto Padrão '
          TabOrder = 0
          object dblkcmbAtivProjeto: TwwDBLookupCombo
            Left = 8
            Top = 16
            Width = 214
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'25'#9'Descrição'
              'UNECODIGO'#9'10'#9'Código')
            DataField = 'ATIVPROJETO'
            DataSource = ds
            LookupTable = qryAtivProjeto
            LookupField = 'UNIDNEGOC'
            TabOrder = 0
            AutoDropDown = False
            ShowButton = True
            UseTFields = False
            AllowClearKey = False
          end
        end
        object GroupBox10: TGroupBox
          Left = 243
          Top = 8
          Width = 233
          Height = 45
          Caption = ' Plano Previdenciário Padrão '
          TabOrder = 1
          object dblkcmbPlanoPrev: TwwDBLookupCombo
            Left = 8
            Top = 16
            Width = 217
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'50'#9'Descrição')
            DataField = 'PLANPREVPADRAO'
            DataSource = ds
            LookupTable = qryPlanoPrev
            LookupField = 'IDPLANOPREV'
            TabOrder = 0
            AutoDropDown = False
            ShowButton = True
            UseTFields = False
            AllowClearKey = False
          end
        end
        object GroupBox11: TGroupBox
          Left = 243
          Top = 59
          Width = 233
          Height = 45
          Caption = ' Patrocinadora Padrão '
          TabOrder = 3
          object dblkcmbPatro: TwwDBLookupCombo
            Left = 8
            Top = 16
            Width = 217
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'60'#9'Descrição')
            DataField = 'PATROPADRAO'
            DataSource = ds
            LookupTable = qryPatro
            LookupField = 'IDPATRO'
            TabOrder = 0
            AutoDropDown = False
            ShowButton = True
            UseTFields = False
            AllowClearKey = False
          end
        end
      end
      object TabInventario: TTabSheet
        Caption = 'Inventário'
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
            Caption = 'Pasta de Trabalho (Utilitários)'
          end
          object cmbColetor: TComboBox
            Left = 16
            Top = 40
            Width = 273
            Height = 21
            ItemHeight = 13
            TabOrder = 0
            Items.Strings = (
              'Não usa coletor'
              'Coletor de Dados Seal - PDT 3100'
              'Coletor de Dados SCW LUCAS 7000')
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
    Width = 501
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Enabled = False
        Visible = False
      end
      inherited sbtnProcurar: TToolbarButton97
        Enabled = False
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Enabled = False
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 337
    Width = 501
    inherited tb97Fundo: TToolbar97
      Left = 282
      DockPos = 282
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 114
      DockPos = 114
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT IDPESSOA,MOEDAOFICIAL,MOEDAFISCAL,MOEDAGERENCIAL,'
      '       NUMDIASANO,MASCCODGRUPO,ALUGUELINTERNO,'
      '       GERARREQMAT,DATAULTDEP,DATARECALCDEP,DTAULTALUG,'
      '       SEQBEMEMP,EDITACODBEM,SISTEMAS,EDITACODGRUPO,'
      '       DATAINICIAL,ULTTXTCONTAB,FLGCALCCM,FLGTIPOCALC,'
      '       MASCARACLASSE,INTEGRACONTAB,INTEGRACAR,'
      '       INTEGRACAP, PLANOVIGENTE,FLGREAVAL,TIPOPERCTB,'
      '       FLGREMOVEPLANCTB,ATIVPROJETO,PROXIMAPLACA,DIGMASCPLACA,'
      '       FLGCLSDESBEM,COLETORDADOS,CDPORTA,CDVELOC,CDPATH,'
      '       PLANPREVPADRAO,PATROPADRAO,TIPATUSALDOCONTAB,'
      '       FLGCONTABFECHAM,TIPOCONJUNTO'
      'FROM PARAMETROSCAFMANUT'
      'WHERE (IDPESSOA = :PIDPESSOA)'
      ' ')
    Left = 287
    Top = 0
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
    object qryIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryMOEDAOFICIAL: TFloatField
      FieldName = 'MOEDAOFICIAL'
    end
    object qryMOEDAFISCAL: TFloatField
      FieldName = 'MOEDAFISCAL'
    end
    object qryMOEDAGERENCIAL: TFloatField
      FieldName = 'MOEDAGERENCIAL'
    end
    object qryNUMDIASANO: TFloatField
      FieldName = 'NUMDIASANO'
    end
    object qryMASCCODGRUPO: TStringField
      FieldName = 'MASCCODGRUPO'
    end
    object qryALUGUELINTERNO: TFloatField
      FieldName = 'ALUGUELINTERNO'
    end
    object qryGERARREQMAT: TFloatField
      FieldName = 'GERARREQMAT'
    end
    object qryDATAULTDEP: TDateTimeField
      FieldName = 'DATAULTDEP'
    end
    object qryDATARECALCDEP: TDateTimeField
      FieldName = 'DATARECALCDEP'
    end
    object qryDTAULTALUG: TDateTimeField
      FieldName = 'DTAULTALUG'
    end
    object qrySEQBEMEMP: TFloatField
      FieldName = 'SEQBEMEMP'
    end
    object qryEDITACODBEM: TFloatField
      FieldName = 'EDITACODBEM'
    end
    object qrySISTEMAS: TStringField
      FieldName = 'SISTEMAS'
      Size = 8
    end
    object qryEDITACODGRUPO: TFloatField
      FieldName = 'EDITACODGRUPO'
    end
    object qryDATAINICIAL: TDateTimeField
      FieldName = 'DATAINICIAL'
    end
    object qryULTTXTCONTAB: TDateTimeField
      FieldName = 'ULTTXTCONTAB'
    end
    object qryFLGCALCCM: TFloatField
      FieldName = 'FLGCALCCM'
    end
    object qryFLGTIPOCALC: TStringField
      FieldName = 'FLGTIPOCALC'
      Size = 1
    end
    object qryMASCARACLASSE: TStringField
      FieldName = 'MASCARACLASSE'
      Size = 15
    end
    object qryINTEGRACONTAB: TStringField
      FieldName = 'INTEGRACONTAB'
      Size = 1
    end
    object qryINTEGRACAR: TStringField
      FieldName = 'INTEGRACAR'
      Size = 1
    end
    object qryINTEGRACAP: TStringField
      FieldName = 'INTEGRACAP'
      Size = 1
    end
    object qryPLANOVIGENTE: TFloatField
      FieldName = 'PLANOVIGENTE'
    end
    object qryFLGREAVAL: TStringField
      FieldName = 'FLGREAVAL'
      Size = 1
    end
    object qryTIPOPERCTB: TStringField
      FieldName = 'TIPOPERCTB'
      Size = 2
    end
    object qryFLGREMOVEPLANCTB: TStringField
      FieldName = 'FLGREMOVEPLANCTB'
      Size = 1
    end
    object qryATIVPROJETO2: TFloatField
      FieldName = 'ATIVPROJETO'
    end
    object qryPROXIMAPLACA: TFloatField
      FieldName = 'PROXIMAPLACA'
      Origin = 'PARAMETROSCAFMANUT.PROXIMAPLACA'
    end
    object qryFLGCLSDESBEM: TFloatField
      FieldName = 'FLGCLSDESBEM'
      Origin = 'PARAMETROSCAFMANUT.FLGCLSDESBEM'
    end
    object qryCOLETORDADOS: TFloatField
      FieldName = 'COLETORDADOS'
    end
    object qryCDPORTA: TFloatField
      FieldName = 'CDPORTA'
    end
    object qryCDVELOC: TStringField
      FieldName = 'CDVELOC'
      Size = 6
    end
    object qryCDPATH: TStringField
      FieldName = 'CDPATH'
      Size = 128
    end
    object qryDIGMASCPLACA: TFloatField
      FieldName = 'DIGMASCPLACA'
    end
    object qryPLANPREVPADRAO: TFloatField
      FieldName = 'PLANPREVPADRAO'
    end
    object qryPATROPADRAO: TFloatField
      FieldName = 'PATROPADRAO'
    end
    object qryTIPATUSALDOCONTAB: TFloatField
      FieldName = 'TIPATUSALDOCONTAB'
      Origin = 'BASEDADOS.PARAMETROSCAFMANUT.TIPATUSALDOCONTAB'
    end
    object qryFLGCONTABFECHAM: TFloatField
      FieldName = 'FLGCONTABFECHAM'
      Origin = 'BASEDADOS.PARAMETROSCAFMANUT.FLGCONTABFECHAM'
    end
    object qryTIPOCONJUNTO: TFloatField
      FieldName = 'TIPOCONJUNTO'
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 400
    Top = 414
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update PARAMETROSCAFMANUT'
      'set'
      '  MOEDAOFICIAL = :MOEDAOFICIAL,'
      '  MOEDAFISCAL = :MOEDAFISCAL,'
      '  MOEDAGERENCIAL = :MOEDAGERENCIAL,'
      '  NUMDIASANO = :NUMDIASANO,'
      '  MASCCODGRUPO = :MASCCODGRUPO,'
      '  ALUGUELINTERNO = :ALUGUELINTERNO,'
      '  GERARREQMAT = :GERARREQMAT,'
      '  DATAULTDEP = :DATAULTDEP,'
      '  DATARECALCDEP = :DATARECALCDEP,'
      '  DTAULTALUG = :DTAULTALUG,'
      '  SEQBEMEMP = :SEQBEMEMP,'
      '  EDITACODBEM = :EDITACODBEM,'
      '  SISTEMAS = :SISTEMAS,'
      '  EDITACODGRUPO = :EDITACODGRUPO,'
      '  DATAINICIAL = :DATAINICIAL,'
      '  ULTTXTCONTAB = :ULTTXTCONTAB,'
      '  FLGCALCCM = :FLGCALCCM,'
      '  FLGTIPOCALC = :FLGTIPOCALC,'
      '  MASCARACLASSE = :MASCARACLASSE,'
      '  INTEGRACONTAB = :INTEGRACONTAB,'
      '  INTEGRACAR = :INTEGRACAR,'
      '  INTEGRACAP = :INTEGRACAP,'
      '  PLANOVIGENTE = :PLANOVIGENTE,'
      '  FLGREAVAL = :FLGREAVAL,'
      '  TIPOPERCTB = :TIPOPERCTB,'
      '  FLGREMOVEPLANCTB = :FLGREMOVEPLANCTB,'
      '  ATIVPROJETO = :ATIVPROJETO,'
      '  PROXIMAPLACA = :PROXIMAPLACA,'
      '  DIGMASCPLACA = :DIGMASCPLACA,'
      '  FLGCLSDESBEM = :FLGCLSDESBEM,'
      '  COLETORDADOS = :COLETORDADOS,'
      '  CDPORTA = :CDPORTA,'
      '  CDVELOC = :CDVELOC,'
      '  CDPATH = :CDPATH,'
      '  PLANPREVPADRAO = :PLANPREVPADRAO,'
      '  PATROPADRAO = :PATROPADRAO,'
      '  TIPATUSALDOCONTAB = :TIPATUSALDOCONTAB,'
      '  FLGCONTABFECHAM = :FLGCONTABFECHAM,'
      '  TIPOCONJUNTO = :TIPOCONJUNTO'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into PARAMETROSCAFMANUT'
      
        '  (IDPESSOA, MOEDAOFICIAL, MOEDAFISCAL, MOEDAGERENCIAL, NUMDIASA' +
        'NO, MASCCODGRUPO, '
      
        '   ALUGUELINTERNO, GERARREQMAT, DATAULTDEP, DATARECALCDEP, DTAUL' +
        'TALUG, '
      
        '   SEQBEMEMP, EDITACODBEM, SISTEMAS, EDITACODGRUPO, DATAINICIAL,' +
        ' ULTTXTCONTAB, '
      
        '   FLGCALCCM, FLGTIPOCALC, MASCARACLASSE, INTEGRACONTAB, INTEGRA' +
        'CAR, INTEGRACAP, '
      
        '   PLANOVIGENTE, FLGREAVAL, TIPOPERCTB, FLGREMOVEPLANCTB, ATIVPR' +
        'OJETO, '
      
        '   PROXIMAPLACA, DIGMASCPLACA, FLGCLSDESBEM, COLETORDADOS, CDPOR' +
        'TA, CDVELOC, '
      
        '   CDPATH, PLANPREVPADRAO, PATROPADRAO, TIPATUSALDOCONTAB, FLGCO' +
        'NTABFECHAM, '
      '   TIPOCONJUNTO)'
      'values'
      
        '  (:IDPESSOA, :MOEDAOFICIAL, :MOEDAFISCAL, :MOEDAGERENCIAL, :NUM' +
        'DIASANO, '
      
        '   :MASCCODGRUPO, :ALUGUELINTERNO, :GERARREQMAT, :DATAULTDEP, :D' +
        'ATARECALCDEP, '
      
        '   :DTAULTALUG, :SEQBEMEMP, :EDITACODBEM, :SISTEMAS, :EDITACODGR' +
        'UPO, :DATAINICIAL, '
      
        '   :ULTTXTCONTAB, :FLGCALCCM, :FLGTIPOCALC, :MASCARACLASSE, :INT' +
        'EGRACONTAB, '
      
        '   :INTEGRACAR, :INTEGRACAP, :PLANOVIGENTE, :FLGREAVAL, :TIPOPER' +
        'CTB, :FLGREMOVEPLANCTB, '
      
        '   :ATIVPROJETO, :PROXIMAPLACA, :DIGMASCPLACA, :FLGCLSDESBEM, :C' +
        'OLETORDADOS, '
      
        '   :CDPORTA, :CDVELOC, :CDPATH, :PLANPREVPADRAO, :PATROPADRAO, :' +
        'TIPATUSALDOCONTAB, '
      '   :FLGCONTABFECHAM, :TIPOCONJUNTO)')
    DeleteSQL.Strings = (
      'delete from PARAMETROSCAFMANUT'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 257
    Top = 0
  end
  inherited MontaSelect: TMontaSelect
    Left = 485
    Top = 464
  end
  inherited ds: TwwDataSource
    Left = 317
    Top = 0
  end
  inherited ImlPadrao: TImageList
    Left = 481
    Top = 414
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 384
    Top = 0
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 448
  end
  object qryMoeda: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT MOECODIGO,MOEDESC,MOESIGLA'
      'FROM MOEDA'
      'WHERE MOEINATIVO = '#39'A'#39' '
      'ORDER BY MOEDESC')
    ValidateWithMask = True
    Left = 232
    Top = 392
  end
  object qryPlano: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PLANO,DESCPLANO'
      'FROM PLANO'
      'ORDER BY PLANO')
    ValidateWithMask = True
    Left = 24
    Top = 392
    object qryPlanoPLANO: TFloatField
      DisplayWidth = 10
      FieldName = 'PLANO'
      Origin = 'PLANO.PLANO'
    end
    object qryPlanoDESCPLANO: TStringField
      DisplayLabel = 'DESCRIÇÃO'
      DisplayWidth = 20
      FieldName = 'DESCPLANO'
      Origin = 'PLANO.DESCPLANO'
    end
  end
  object qryTipOper: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT TIPCODIGO, TIPDESCRICAO'
      'FROM TIPOPER'
      'ORDER BY TIPDESCRICAO')
    ValidateWithMask = True
    Left = 88
    Top = 392
    object qryTipOperTIPDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 25
      FieldName = 'TIPDESCRICAO'
      Origin = 'TIPOPER.TIPDESCRICAO'
      Size = 25
    end
    object qryTipOperTIPCODIGO: TStringField
      DisplayWidth = 2
      FieldName = 'TIPCODIGO'
      Origin = 'TIPOPER.TIPCODIGO'
      Visible = False
      Size = 2
    end
  end
  object qryAtivProjeto: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT UNIDNEGOC, UNECODIGO, NOME'
      'FROM UNIDNEGOCIO'
      'WHERE (IDPESSOA = :PIDPESSOA)'
      '  AND (UNETIPO = '#39'A'#39')'
      '  AND (UNIDNEGOC >= 0)'
      'ORDER BY NOME'
      '')
    ValidateWithMask = True
    Left = 160
    Top = 392
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
    object qryAtivProjetoUNIDNEGOC: TFloatField
      DisplayWidth = 10
      FieldName = 'UNIDNEGOC'
      Origin = 'UNIDNEGOCIO.UNIDNEGOC'
    end
    object qryAtivProjetoUNECODIGO: TStringField
      DisplayLabel = 'Código'
      DisplayWidth = 10
      FieldName = 'UNECODIGO'
      Origin = 'UNIDNEGOCIO.UNECODIGO'
      Size = 10
    end
    object qryAtivProjetoNOME: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 25
      FieldName = 'NOME'
      Origin = 'UNIDNEGOCIO.NOME'
      Size = 25
    end
  end
  object qryPatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PATRO.IDPESSOA AS IDPATRO, PESSOA.NOME'
      'FROM PATRO,'
      '     PESSOA'
      'WHERE (PATRO.IDPESSOA = PESSOA.IDPESSOA)'
      'ORDER BY PESSOA.NOME')
    ValidateWithMask = True
    Left = 161
    Top = 440
    object qryPatroIDPATRO: TFloatField
      FieldName = 'IDPATRO'
      Origin = '"CM.PATRO".IDPESSOA'
    end
    object qryPatroNOME: TStringField
      FieldName = 'NOME'
      Origin = '"CM.PESSOA".NOME'
      Size = 60
    end
  end
  object qryPlanoPrev: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPLANOPREV, NOME'
      'FROM PLANPREVCONTABIL'
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 233
    Top = 440
    object qryPlanoPrevIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Origin = '"CM.PLANPREVCONTABIL".IDPLANOPREV'
    end
    object qryPlanoPrevNOME: TStringField
      FieldName = 'NOME'
      Origin = '"CM.PLANPREVCONTABIL".NOME'
      Size = 50
    end
  end
  object pDirColetor: TProcuraDirDlg
    Caption = 'Selecione a pasta de trabalho'
    Directory = 
      'Left'#20#0#0#0#23#0#0#0#0#0#0#0#4#0#0#0'Left('#0#0#0#19#0#0#0#0#0#0#0#3#0#0#0'8'#0#0#0#19#0#0#0#0#0#0#0#3#0#0#0'H'#0#0#0#23#0#0#0 +
      #0#0#0#0#5#0#0#0'Widt\'#0#0#0#23#0#0#0#0#0#0#0#5#0#0#0'Widtp'#0#0#0#23#0#0#0#0#0#0#0#6#0#0#0'Heig„'#0#0#0#23#0#0#0#0#0#0#0 +
      #6#0#0#0'Heig˜'#0#0#0#23#0#0#0#0#0#0#0#7#0#0#0'Capt¬'#0#0#0#23#0#0#0#0#0#0#0#7#0#0#0'Caption'#0' bÒ'#5' bÒ'#5','#0#0#0 +
      ' Atividade / Projeto Padrão ì'#0#0#0'+'#0#0#0'!'#0#0#0' Atividade / Projeto Pad' +
      'rão '
    Folder = foCustom
    Options = [bfStatusText]
    ShowPath = True
    Left = 312
    Top = 392
  end
end
