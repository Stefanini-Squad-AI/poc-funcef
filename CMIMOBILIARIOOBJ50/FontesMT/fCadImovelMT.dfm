inherited frmCadImovelMT: TfrmCadImovelMT
  Left = 200
  Top = 118
  HelpContext = 640068
  Caption = 'Cadastro de Imóveis'
  ClientHeight = 489
  ClientWidth = 950
  OnActivate = FormActivate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Label56: TLabel [0]
    Left = 280
    Top = 272
    Width = 83
    Height = 13
    Caption = 'Tipo Indicador'
  end
  inherited pnlFundo: TPanel
    Width = 950
    Height = 403
    inherited pnlMestre: TPanel
      Width = 948
      Height = 50
      object Label2: TLabel
        Left = 372
        Top = 4
        Width = 92
        Height = 13
        Caption = 'Nome do Imóvel'
      end
      inline molImovelMestre1: TmolImovelMestre
        Left = 2
        Top = 2
        Width = 359
        inherited edtImovel: TEdit
          Width = 297
        end
        inherited btnBuscaImovel: TBitBtn
          Left = 304
          OnClick = molImovelMestre1btnBuscaImovelClick
        end
        inherited btnLimpaImovel: TBitBtn
          Left = 328
        end
      end
      object DBedtNomeImovel: TDBEdit2
        Left = 372
        Top = 18
        Width = 377
        Height = 21
        DataField = 'IMONOME'
        DataSource = ds
        TabOrder = 1
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 51
      Width = 948
      Height = 351
      Tabs.Strings = (
        'Geral'
        'Endereço'
        'Descrição'
        'Valores'
        'Complemento'
        'Indicadores'
        'Eventos'
        'Observações'
        'Imagens'
        'Segregação'
        'Voto'
        'Provisão')
      detdbGrids.Strings = (
        ''
        ''
        ''
        ''
        ''
        'dbgrdIndicador'
        'dbgrdEvento'
        ''
        'dbGrdImagens'
        'dbgrdPlanoPatro'
        'dbgrdvoto'
        'dbgrdProvisao')
      inherited pgctrlDetalhe: TPageControl
        Width = 850
        Height = 292
        ActivePage = tbsValores
        object tbsGeral: TTabSheet [0]
          Caption = 'Geral'
          ImageIndex = 1
          object Label29: TLabel
            Left = 165
            Top = 46
            Width = 55
            Height = 13
            Caption = 'Matrícula'
          end
          object lblMarca: TLabel
            Left = 8
            Top = 163
            Width = 107
            Height = 13
            Caption = 'Marca ou Franquia'
          end
          object Label16: TLabel
            Left = 380
            Top = 108
            Width = 72
            Height = 13
            Caption = 'Fração Ideal'
          end
          object Label40: TLabel
            Left = 463
            Top = 108
            Width = 54
            Height = 13
            Caption = 'N° Vagas'
          end
          object Label35: TLabel
            Left = 632
            Top = 108
            Width = 86
            Height = 13
            Caption = 'Data Habite-se'
          end
          object Bevel1: TBevel
            Left = 8
            Top = 158
            Width = 724
            Height = 3
            Shape = bsTopLine
          end
          object Label39: TLabel
            Left = 333
            Top = 163
            Width = 85
            Height = 13
            Caption = 'Tipo de Imóvel'
          end
          object Label20: TLabel
            Left = 6
            Top = 226
            Width = 117
            Height = 13
            Caption = 'Subconta Associada'
          end
          object Label15: TLabel
            Left = 523
            Top = 108
            Width = 96
            Height = 13
            Caption = 'Data Construção'
          end
          object Label21: TLabel
            Left = 166
            Top = 6
            Width = 40
            Height = 13
            Caption = 'Código'
          end
          object lblSituacao: TLabel
            Left = 184
            Top = 163
            Width = 110
            Height = 13
            Caption = 'Situação do Imóvel'
          end
          object LblArrematacao: TLabel
            Left = 335
            Top = 200
            Width = 121
            Height = 13
            Caption = 'Data de Arrematação'
          end
          object DBedtMatricula: TDBEdit2
            Left = 165
            Top = 60
            Width = 148
            Height = 21
            DataField = 'IMOMATRICULA'
            DataSource = ds
            TabOrder = 2
          end
          object DBcboMarca: TwwDBLookupCombo
            Left = 8
            Top = 177
            Width = 169
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'MRCNOME'#9'40'#9'Marca')
            DataField = 'IDMARCA'
            DataSource = ds
            LookupTable = cdsMarcas
            LookupField = 'IDMARCA'
            Style = csDropDownList
            DropDownWidth = 8
            TabOrder = 10
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
          end
          object DBedtVagas: TDBEdit
            Left = 463
            Top = 124
            Width = 54
            Height = 21
            DataField = 'IMOVAGAS'
            DataSource = ds
            MaxLength = 5
            TabOrder = 7
          end
          object DBedtDataHabitese: TCMDateTimePicker
            Left = 632
            Top = 124
            Width = 105
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            DataField = 'IMODATAHABITESE'
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
          end
          object DBedtTipoImovel: TDBEdit
            Left = 333
            Top = 177
            Width = 150
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'DSC_TIPOIMOVEL'
            DataSource = ds
            Enabled = False
            ReadOnly = True
            TabOrder = 13
          end
          object DBcboSubConta: TwwDBLookupCombo
            Left = 6
            Top = 240
            Width = 479
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOMESUBCONTA'#9'60'#9'NOMESUBCONTA')
            DataField = 'CODSUBCONTA'
            DataSource = ds
            LookupTable = cdsSubConta
            LookupField = 'CODSUBCONTA'
            Style = csDropDownList
            DropDownCount = 5
            DropDownWidth = 8
            TabOrder = 12
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
          end
          object DBedtDataConstrucao: TCMDateTimePicker
            Left = 523
            Top = 124
            Width = 105
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            DataField = 'IMODATACONSTRUCAO'
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
            TabOrder = 8
          end
          object GroupBox6: TGroupBox
            Left = 5
            Top = 93
            Width = 370
            Height = 57
            Caption = 'Área do imóvel'
            TabOrder = 5
            object Label33: TLabel
              Left = 8
              Top = 14
              Width = 30
              Height = 13
              Caption = 'Total'
            end
            object Label4: TLabel
              Left = 98
              Top = 14
              Width = 20
              Height = 13
              Caption = 'Útil'
            end
            object Label22: TLabel
              Left = 187
              Top = 14
              Width = 55
              Height = 13
              Caption = 'Gerencial'
            end
            object Label41: TLabel
              Left = 277
              Top = 14
              Width = 41
              Height = 13
              Caption = 'Comum'
            end
            object DBedtAreaTotal: TDBEdit
              Left = 8
              Top = 30
              Width = 85
              Height = 21
              DataField = 'IMOAREATOTAL'
              DataSource = ds
              MaxLength = 21
              TabOrder = 0
            end
            object DBedtAreaUtil: TDBEdit
              Left = 98
              Top = 30
              Width = 85
              Height = 21
              DataField = 'IMOAREA'
              DataSource = ds
              MaxLength = 21
              TabOrder = 1
            end
            object DBedtAreaGerencial: TDBEdit
              Left = 187
              Top = 30
              Width = 85
              Height = 21
              DataField = 'IMOAREAGERENCIAL'
              DataSource = ds
              MaxLength = 21
              TabOrder = 2
            end
            object DBedtAreaComum: TDBEdit
              Left = 277
              Top = 30
              Width = 85
              Height = 21
              DataField = 'IMOAREACOMUM'
              DataSource = ds
              MaxLength = 21
              TabOrder = 3
            end
          end
          object DBedtCodigo: TDBEdit2
            Left = 166
            Top = 20
            Width = 147
            Height = 21
            DataField = 'IMOCODIGO'
            DataSource = ds
            TabOrder = 1
          end
          inline molAdministradora1: TmolAdministradora
            Left = 330
            Top = 4
            Width = 407
            TabOrder = 3
          end
          inline molCartorio1: TmolCartorio
            Left = 330
            Top = 44
            Height = 41
            TabOrder = 4
          end
          object GroupBox1: TGroupBox
            Left = 4
            Top = 5
            Width = 141
            Height = 76
            TabOrder = 0
            object lblOcupado: TLabel
              Left = 10
              Top = 48
              Width = 93
              Height = 13
              Caption = 'Imóvel Ocupado'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object dbcbTipoImovel: TDBCheckBox
              Left = 10
              Top = 20
              Width = 113
              Height = 17
              Caption = 'Imóvel Mestre'
              DataField = 'FLGTIPOIMOVEL'
              DataSource = ds
              TabOrder = 0
              ValueChecked = '0'
              ValueUnchecked = '1'
              OnClick = dbcbTipoImovelClick
            end
          end
          object DBedtFracaoIdeal: TDBRealEdit
            Left = 380
            Top = 124
            Width = 78
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '0,000000')
            TabOrder = 6
            WordWrap = False
            IntDigits = 1
            DecDigits = 6
            NumberFormat = fNumber
            Signal = False
            DataField = 'IMOFRACAOIDEAL'
            DataSource = ds
          end
          object dbcbSitImovel: TwwDBComboBox
            Left = 184
            Top = 177
            Width = 140
            Height = 21
            ShowButton = True
            Style = csDropDownList
            MapList = True
            AllowClearKey = True
            AutoDropDown = True
            ShowMatchText = True
            DataField = 'FLGSTATUS'
            DataSource = ds
            DropDownCount = 6
            DropDownWidth = 201
            ItemHeight = 0
            Items.Strings = (
              'em Alienação'#9'A'
              'Desmembrado'#9'D'
              'em Estudos'#9'E'
              'Demolido'#9'M'
              'em Carteira'#9'N'
              'em Aquisição'#9'Q'
              'Remembrado'#9'R'
              'Vendido'#9'V'
              'em Obras'#9'O'
              'Transferido'#9'T'
              'em Penhora'#9'P'
              'não Comercializável'#9'Z'
              'em Ação Judicial'#9'J')
            Sorted = False
            TabOrder = 11
            UnboundDataType = wwDefault
          end
          object gbDaiea: TGroupBox
            Left = 496
            Top = 161
            Width = 230
            Height = 100
            Caption = ' Daiea '
            TabOrder = 14
            object lblCarteiraDaiea: TLabel
              Left = 10
              Top = 16
              Width = 106
              Height = 13
              Caption = 'Carteira Imobiliária'
            end
            object lblTipoImovelSPC: TLabel
              Left = 10
              Top = 57
              Width = 131
              Height = 13
              Caption = 'Tipo de Imóvel no SPC'
            end
            object DBcboMarca2: TwwDBLookupCombo
              Left = 9
              Top = 70
              Width = 209
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'MRCNOME'#9'40'#9'Marca')
              DataField = 'IDMARCA'
              DataSource = ds
              LookupTable = cdsMarcas
              LookupField = 'IDMARCA'
              Style = csDropDownList
              DropDownWidth = 8
              TabOrder = 2
              Visible = False
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
            object wwDBCodDaiea: TwwDBLookupCombo
              Left = 10
              Top = 29
              Width = 212
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCARTEIRASPC'#9'60'#9'DESCARTEIRASPC'#9'F')
              DataField = 'IDCARTEIRASPC'
              DataSource = ds
              LookupTable = cdsDaiea
              LookupField = 'IDCARTEIRASPC'
              Style = csDropDownList
              DropDownWidth = 8
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              UseTFields = False
              AllowClearKey = True
            end
            object dbcbTipoSPC: TwwDBComboBox
              Left = 9
              Top = 70
              Width = 212
              Height = 21
              ShowButton = True
              Style = csDropDownList
              MapList = True
              AllowClearKey = True
              AutoDropDown = True
              ShowMatchText = True
              DataField = 'CODIMOVELSPC'
              DataSource = ds
              DropDownCount = 6
              DropDownWidth = 201
              ItemHeight = 0
              Items.Strings = (
                'Industrial'#9'1'
                'Comercial'#9'2'
                'Loja'#9'3'
                'Shopping'#9'4'
                'Hospital'#9'5'
                'Hotel'#9'6'
                'Parque Temático'#9'7'
                'Rural / Agroindustrial'#9'8'
                'Residencial'#9'9'
                'Terreno'#9'10'
                'Outros'#9'11')
              Sorted = False
              TabOrder = 1
              UnboundDataType = wwDefault
            end
          end
          object dbedtDataArrematada: TCMDateTimePicker
            Left = 335
            Top = 215
            Width = 146
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            DataField = 'IMODATAARREMATADO'
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
            TabOrder = 16
            OnExit = dbedtDataArrematadaExit
          end
          object dbcbImoArrematado: TDBCheckBox
            Left = 200
            Top = 216
            Width = 128
            Height = 17
            Caption = 'Imóvel Arrematado'
            DataField = 'IMOARREMATADO'
            DataSource = ds
            TabOrder = 15
            ValueChecked = 'S'
            ValueUnchecked = 'N'
            OnClick = dbcbImoArrematadoClick
          end
        end
        object tbsEndereco: TTabSheet [1]
          Caption = 'Endereço'
          ImageIndex = 2
          object Label7: TLabel
            Left = 32
            Top = 74
            Width = 65
            Height = 13
            Caption = 'Logradouro'
          end
          object Label8: TLabel
            Left = 544
            Top = 74
            Width = 44
            Height = 13
            Caption = 'Número'
          end
          object Label9: TLabel
            Left = 32
            Top = 114
            Width = 76
            Height = 13
            Caption = 'Complemento'
          end
          object Label10: TLabel
            Left = 248
            Top = 114
            Width = 34
            Height = 13
            Caption = 'Bairro'
          end
          object Label12: TLabel
            Left = 544
            Top = 114
            Width = 25
            Height = 13
            Caption = 'CEP'
          end
          object Label13: TLabel
            Left = 32
            Top = 13
            Width = 109
            Height = 13
            Caption = 'Nome do Endereço'
          end
          object Label17: TLabel
            Left = 248
            Top = 154
            Width = 40
            Height = 13
            Caption = 'Estado'
          end
          object Label18: TLabel
            Left = 32
            Top = 154
            Width = 27
            Height = 13
            Caption = 'País'
          end
          object Bevel3: TBevel
            Left = 32
            Top = 64
            Width = 689
            Height = 3
            Shape = bsTopLine
          end
          object Bevel4: TBevel
            Left = 32
            Top = 200
            Width = 689
            Height = 3
            Shape = bsTopLine
          end
          object Label44: TLabel
            Left = 328
            Top = 154
            Width = 40
            Height = 13
            Caption = 'Cidade'
          end
          object DBedtLogradouro: TDBEdit2
            Left = 32
            Top = 88
            Width = 497
            Height = 21
            DataField = 'IMOLOGRADOURO'
            DataSource = ds
            TabOrder = 2
          end
          object DBedtComplemento: TDBEdit2
            Left = 32
            Top = 128
            Width = 201
            Height = 21
            DataField = 'IMOCOMPLEMENTO'
            DataSource = ds
            TabOrder = 4
          end
          object DBedtNumero: TDBEdit2
            Left = 544
            Top = 88
            Width = 97
            Height = 21
            DataField = 'IMONUMERO'
            DataSource = ds
            TabOrder = 3
          end
          object DBedtBairro: TDBEdit2
            Left = 248
            Top = 128
            Width = 281
            Height = 21
            DataField = 'IMOBAIRRO'
            DataSource = ds
            TabOrder = 5
          end
          object DBedtCEP: TDBEdit2
            Left = 544
            Top = 128
            Width = 97
            Height = 21
            DataField = 'IMOCEP'
            DataSource = ds
            TabOrder = 6
          end
          object DBedtNomeEndereco: TDBEdit2
            Left = 32
            Top = 27
            Width = 433
            Height = 21
            DataField = 'IMONOMEENDERECO'
            DataSource = ds
            TabOrder = 0
          end
          object dblcEstado: TwwDBLookupCombo
            Left = 248
            Top = 168
            Width = 65
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'CODESTADO'#9'3'#9'Estado')
            DataField = 'IDESTADO'
            DataSource = ds
            LookupTable = cdsEstado
            LookupField = 'IDESTADO'
            Style = csDropDownList
            DropDownWidth = 57
            TabOrder = 8
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
            OnCloseUp = dblcEstadoCloseUp
          end
          object btnBuscaEndereco: TBitBtn
            Left = 464
            Top = 27
            Width = 24
            Height = 22
            Hint = 'Busca um Endereço já existente'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            OnClick = btnBuscaEnderecoClick
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
          object dblcPais: TwwDBLookupCombo
            Left = 32
            Top = 168
            Width = 201
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOMEPAIS'#9'30'#9'Nome'#9'T')
            DataField = 'IDPAIS'
            DataSource = ds
            LookupTable = cdsPais
            LookupField = 'IDPAIS'
            Style = csDropDownList
            DropDownWidth = 57
            TabOrder = 7
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
            OnCloseUp = dblcPaisCloseUp
          end
          object dblcCidade: TwwDBLookupCombo
            Left = 328
            Top = 168
            Width = 313
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'50'#9'Nome'#9'F')
            DataField = 'IDCIDADES'
            DataSource = ds
            LookupTable = cdsCidade
            LookupField = 'IDCIDADES'
            Style = csDropDownList
            DropDownWidth = 57
            TabOrder = 9
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
          end
        end
        object tbsDescricao: TTabSheet [2]
          Caption = 'Descrição'
          ImageIndex = 3
          object wwDBGrid21: TwwDBGrid2
            Left = 0
            Top = 158
            Width = 842
            Height = 106
            Selected.Strings = (
              'CONNUMERO'#9'13'#9'Nº Contrato'
              'CONNOME'#9'54'#9'Nome do Contrato'
              'CIMDTINI'#9'15'#9'Início'
              'CIMDTFIM'#9'15'#9'Término'#9'F')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alBottom
            DataSource = dsContrato
            KeyOptions = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            TabOrder = 0
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = True
            OnTitleButtonClick = wwDBGrid21TitleButtonClick
            IndicatorColor = icBlack
          end
          object Panel8: TPanel
            Left = 0
            Top = 0
            Width = 842
            Height = 131
            Align = alClient
            BevelOuter = bvNone
            BorderWidth = 10
            TabOrder = 1
            object gbDescricao: TGroupBox
              Left = 10
              Top = 10
              Width = 822
              Height = 111
              Align = alClient
              Caption = 'Descrição do Imóvel'
              TabOrder = 0
              object Panel9: TPanel
                Left = 2
                Top = 15
                Width = 818
                Height = 94
                Align = alClient
                BevelOuter = bvNone
                BorderWidth = 7
                TabOrder = 0
                object DBmemDescricaoImovel: TwwDBRichEdit
                  Left = 7
                  Top = 7
                  Width = 804
                  Height = 80
                  ScrollBars = ssVertical
                  Align = alClient
                  AutoURLDetect = True
                  DataField = 'IMODESCRICAO'
                  DataSource = ds
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  MaxLength = 1750
                  ParentFont = False
                  PrintJobName = 'Delphi 5'
                  TabOrder = 0
                  PopupOptions = [rpoPopupEdit, rpoPopupCut, rpoPopupCopy, rpoPopupPaste, rpoPopupFont]
                  EditorCaption = 'Descrição do Imóvel'
                  EditorPosition.Left = 0
                  EditorPosition.Top = 0
                  EditorPosition.Width = 0
                  EditorPosition.Height = 0
                  MeasurementUnits = muCentimeters
                  PrintMargins.Top = 1
                  PrintMargins.Bottom = 1
                  PrintMargins.Left = 1
                  PrintMargins.Right = 1
                  RichEditVersion = 2
                  Data = {
                    880000007B5C727466315C616E73695C616E7369637067313235325C64656666
                    305C6465666C616E67313034367B5C666F6E7474626C7B5C66305C666E696C20
                    4D532053616E732053657269663B7D7D0D0A5C766965776B696E64345C756331
                    5C706172645C66305C667331342044426D656D44657363726963616F496D6F76
                    656C5C7061720D0A7D0D0A00}
                end
              end
            end
          end
          object Panel3: TPanel
            Left = 0
            Top = 131
            Width = 842
            Height = 27
            Align = alBottom
            BevelInner = bvRaised
            BevelOuter = bvLowered
            Caption = 'Histórico de Contratos'
            Color = clNavy
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -16
            Font.Name = 'Courier New'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
          end
        end
        object tbsValores: TTabSheet [3]
          Caption = 'Valores'
          ImageIndex = 5
          object Label34: TLabel
            Left = 576
            Top = 96
            Width = 148
            Height = 13
            Caption = 'Taxa Depreciação (% a.a)'
          end
          object Label37: TLabel
            Left = 576
            Top = 149
            Width = 154
            Height = 13
            Caption = 'Taxa Depreciação (% a.m) '
          end
          object lblPercentual: TLabel
            Left = 448
            Top = 149
            Width = 62
            Height = 13
            Caption = 'Percentual'
          end
          object gbAquisicao: TGroupBox
            Left = 8
            Top = 10
            Width = 417
            Height = 61
            Caption = ' Aquisição '
            TabOrder = 0
            object Label30: TLabel
              Left = 16
              Top = 16
              Width = 28
              Height = 13
              Caption = 'Data'
            end
            object Label32: TLabel
              Left = 136
              Top = 16
              Width = 30
              Height = 13
              Caption = 'Valor'
            end
            object Label31: TLabel
              Left = 272
              Top = 16
              Width = 39
              Height = 13
              Caption = 'Moeda'
            end
            object DBedtDataCompra: TCMDateTimePicker
              Left = 16
              Top = 30
              Width = 105
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'IMODATACOMPRA'
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
            object DBcboMoedaCompra: TwwDBLookupCombo
              Left = 272
              Top = 30
              Width = 137
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'MOESIGLA'#9'6'#9'Moeda')
              DataField = 'IMOMOEDACOMPRA'
              DataSource = ds
              LookupTable = cdsMoeda
              LookupField = 'MOECODIGO'
              Style = csDropDownList
              DropDownWidth = 8
              TabOrder = 2
              AutoDropDown = True
              ShowButton = True
              UseTFields = False
              AllowClearKey = True
              ShowMatchText = True
            end
            object DBedtVlrCompra: TDBEdit
              Left = 136
              Top = 30
              Width = 121
              Height = 21
              DataField = 'IMOVLRCOMPRA'
              DataSource = ds
              TabOrder = 1
            end
          end
          object gbReavalia: TGroupBox
            Left = 8
            Top = 80
            Width = 417
            Height = 61
            Caption = ' Última Reavaliação Contábil '
            TabOrder = 1
            object Label23: TLabel
              Left = 16
              Top = 16
              Width = 28
              Height = 13
              Caption = 'Data'
            end
            object Label24: TLabel
              Left = 136
              Top = 16
              Width = 30
              Height = 13
              Caption = 'Valor'
            end
            object Label25: TLabel
              Left = 272
              Top = 16
              Width = 39
              Height = 13
              Caption = 'Moeda'
            end
            object DBedtDataReaval: TCMDateTimePicker
              Left = 16
              Top = 30
              Width = 105
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'IMODATAREAVAL'
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
            object DBcboMoedaReaval: TwwDBLookupCombo
              Left = 272
              Top = 30
              Width = 137
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'MOESIGLA'#9'6'#9'Moeda')
              DataField = 'IMOMOEDAREAVAL'
              DataSource = ds
              LookupTable = cdsMoeda
              LookupField = 'MOECODIGO'
              Style = csDropDownList
              DropDownWidth = 8
              TabOrder = 2
              AutoDropDown = True
              ShowButton = True
              UseTFields = False
              AllowClearKey = True
              ShowMatchText = True
            end
            object DBedtVlrReaval: TDBEdit
              Left = 136
              Top = 30
              Width = 121
              Height = 21
              DataField = 'IMOVLRREAVAL'
              DataSource = ds
              TabOrder = 1
            end
          end
          object GroupBox4: TGroupBox
            Left = 8
            Top = 150
            Width = 417
            Height = 61
            Caption = 'Ultima Reavaliação de Mercado '
            TabOrder = 2
            object Label26: TLabel
              Left = 16
              Top = 16
              Width = 28
              Height = 13
              Caption = 'Data'
            end
            object Label27: TLabel
              Left = 136
              Top = 16
              Width = 30
              Height = 13
              Caption = 'Valor'
            end
            object Label28: TLabel
              Left = 272
              Top = 16
              Width = 39
              Height = 13
              Caption = 'Moeda'
            end
            object DBedtDataMercado: TCMDateTimePicker
              Left = 16
              Top = 30
              Width = 105
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'IMODATAMERCADO'
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
            object DBcboMoedaMercado: TwwDBLookupCombo
              Left = 272
              Top = 30
              Width = 137
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'MOESIGLA'#9'6'#9'Moeda')
              DataField = 'IMOMOEDAMERCADO'
              DataSource = ds
              LookupTable = cdsMoeda
              LookupField = 'MOECODIGO'
              Style = csDropDownList
              DropDownWidth = 8
              TabOrder = 2
              AutoDropDown = True
              ShowButton = True
              UseTFields = False
              AllowClearKey = True
              ShowMatchText = True
            end
            object DBedtVlrMercado: TDBEdit
              Left = 136
              Top = 30
              Width = 113
              Height = 21
              DataField = 'IMOVLRMERCADO'
              DataSource = ds
              TabOrder = 1
            end
          end
          object grpRetornoPrevisto: TGroupBox
            Left = 440
            Top = 10
            Width = 305
            Height = 61
            Caption = 'Retorno Previsto'
            TabOrder = 3
            object Label54: TLabel
              Left = 168
              Top = 16
              Width = 68
              Height = 13
              Caption = 'Taxa (% aa)'
            end
            object Label55: TLabel
              Left = 8
              Top = 16
              Width = 39
              Height = 13
              Caption = 'Moeda'
            end
            object Image2: TImage
              Left = 139
              Top = 31
              Width = 18
              Height = 18
              AutoSize = True
              Picture.Data = {
                07544269746D61704E010000424D4E0100000000000076000000280000001200
                0000120000000100040000000000D80000000000000000000000100000001000
                0000000000000000800000800000008080008000000080008000808000008080
                8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
                FF00888888888888888888000000888888877777888888000000888888000007
                8888880000008888880FFF078888880000008888880FFF078888880000008888
                880FFF078888880000008877770FFF077777780000008000000FFF0000007800
                000080FFFFFFFFFFFFF07800000080FFFFFFFFFFFFF07800000080FFFFFFFFFF
                FFF0780000008000000FFF000000880000008888880FFF078888880000008888
                880FFF078888880000008888880FFF078888880000008888880FFF0788888800
                0000888888000008888888000000888888888888888888000000}
              Transparent = True
            end
            object DBcboIndiceCompra: TwwDBLookupCombo
              Left = 8
              Top = 30
              Width = 121
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'MOESIGLA'#9'6'#9'Moeda')
              DataField = 'INDICECOMPRA'
              DataSource = ds
              LookupTable = cdsMoeda
              LookupField = 'MOECODIGO'
              Style = csDropDownList
              DropDownWidth = 8
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              UseTFields = False
              AllowClearKey = True
              ShowMatchText = True
            end
            object DBedtTaxaCompra: TDBEdit
              Left = 168
              Top = 30
              Width = 127
              Height = 21
              DataField = 'TAXACOMPRA'
              DataSource = ds
              TabOrder = 0
            end
          end
          object wwDBspnVidaUtil: TwwDBSpinEdit
            Left = 448
            Top = 112
            Width = 73
            Height = 21
            Increment = 1
            DataField = 'VIDAUTIL'
            DataSource = dsHistoricoVidaUtil
            TabOrder = 4
            UnboundDataType = wwDefault
            OnChange = wwDBspnVidaUtilChange
          end
          object StaticText2: TStaticText
            Left = 456
            Top = 96
            Width = 56
            Height = 17
            Caption = 'Vida Útil:'
            TabOrder = 5
          end
          object StaticText3: TStaticText
            Left = 525
            Top = 115
            Width = 40
            Height = 17
            Caption = 'Meses'
            TabOrder = 6
          end
          object DBedtTaxaDepreciacaoAA: TDBEdit
            Left = 576
            Top = 112
            Width = 154
            Height = 21
            DataField = 'TXDEP_ANO'
            DataSource = dsHistoricoVidaUtil
            MaxLength = 8
            ReadOnly = True
            TabOrder = 7
          end
          object DBedtTaxaDepreciacaoAM: TDBEdit
            Left = 576
            Top = 165
            Width = 154
            Height = 21
            DataField = 'TXDEP_MES'
            DataSource = dsHistoricoVidaUtil
            MaxLength = 8
            ReadOnly = True
            TabOrder = 8
          end
          object DBedtPercentual: TDBRealEdit
            Left = 448
            Top = 168
            Width = 73
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '0,00')
            MaxLength = 6
            TabOrder = 9
            WordWrap = False
            OnExit = DBedtPercentualExit
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'PERCENTUAL'
            DataSource = ds
          end
        end
        inherited tbsDet: TTabSheet
          Caption = 'Complemento'
          inherited dbgrdDet: TwwDBGrid [0]
            Left = 520
            Top = 24
            Width = 121
            Height = 53
            Selected.Strings = (
              'ODODESCRICAO'#9'52'#9'Descrição'
              'ODIVALOR'#9'48'#9'Valor')
            Align = alNone
            Enabled = False
            TitleButtons = True
            Visible = False
            OnTitleButtonClick = wwDBGrid21TitleButtonClick
          end
          inherited pnlControlesDet: TPanel [1]
            Width = 842
            Height = 264
            inline molArvoreCompl1: TmolArvoreCompl
              Width = 842
              Height = 264
              inherited dxTreeListDados: TdxTreeList
                Width = 842
                Height = 264
                inherited TreeListConteudo: TdxTreeListColumn
                  Width = 336
                end
                inherited TreeListIdOutroDado: TdxTreeListColumn
                  Width = 115
                end
                inherited TreeListAnaSint: TdxTreeListColumn
                  Width = 115
                end
                inherited TreeListTipoDado: TdxTreeListColumn
                  Width = 115
                end
                inherited TreeListOpcao: TdxTreeListColumn
                  Width = 115
                end
                inherited TreeListOutroDadoXImovel: TdxTreeListColumn
                  Width = 115
                end
                inherited TreeListImovel: TdxTreeListColumn
                  Width = 115
                end
                inherited TreeListContrato: TdxTreeListColumn
                  Width = 115
                end
              end
            end
          end
        end
        object tbsIndicadores: TTabSheet
          Caption = 'Indicadores'
          ImageIndex = 6
          object Panel2: TPanel
            Left = 0
            Top = 0
            Width = 842
            Height = 264
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object Label42: TLabel
              Left = 16
              Top = 10
              Width = 101
              Height = 13
              Caption = 'Tipo de Indicador'
            end
            object Label45: TLabel
              Left = 440
              Top = 10
              Width = 104
              Height = 13
              Caption = 'Data de Apuração'
            end
            object Label53: TLabel
              Left = 272
              Top = 56
              Width = 83
              Height = 13
              Caption = 'Tipo Indicador'
            end
            object Label57: TLabel
              Left = 272
              Top = 96
              Width = 76
              Height = 13
              Caption = 'Classificação'
            end
            object Label11: TLabel
              Left = 273
              Top = 142
              Width = 69
              Height = 13
              Caption = 'Observação'
            end
            object dbcboIndicador: TwwDBLookupCombo
              Left = 16
              Top = 25
              Width = 401
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'INMDESCRICAO'#9'60'#9'Indicador'#9'F')
              DataField = 'IDINDICADORIMOVEL'
              DataSource = dsIndicador
              LookupTable = cdsLookIndicador
              LookupField = 'IDINDICADORIMOVEL'
              Style = csDropDownList
              DropDownWidth = 8
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
              OnChange = dbcboIndicadorChange
            end
            object DBrdgPrevReal: TDBRadioGroup
              Left = 440
              Top = 56
              Width = 129
              Height = 76
              Caption = 'Lançamento '
              DataField = 'FLGPREVREAL'
              DataSource = dsIndicador
              Items.Strings = (
                'Previsto'
                'Realizado')
              TabOrder = 3
              TabStop = True
              Values.Strings = (
                'P'
                'R')
            end
            object dbedtDataIndicador: TCMDateTimePicker
              Left = 440
              Top = 25
              Width = 129
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATAAPURADO'
              DataSource = dsIndicador
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
            object GroupBox5: TGroupBox
              Left = 16
              Top = 56
              Width = 233
              Height = 76
              Caption = 'Competência'
              TabOrder = 2
              object Label43: TLabel
                Left = 16
                Top = 21
                Width = 24
                Height = 13
                Caption = 'Mês'
              end
              object Label46: TLabel
                Left = 162
                Top = 21
                Width = 23
                Height = 13
                Caption = 'Ano'
              end
              object cboMesCompetencia: TwwDBComboBox
                Left = 16
                Top = 35
                Width = 137
                Height = 21
                ShowButton = True
                Style = csDropDownList
                MapList = True
                AllowClearKey = False
                DataField = 'MESCOMPETENCIA'
                DataSource = dsIndicador
                DropDownCount = 8
                ItemHeight = 13
                Items.Strings = (
                  'Janeiro'#9'1'
                  'Fevereiro'#9'2'
                  'Março'#9'3'
                  'Abril'#9'4'
                  'Maio'#9'5'
                  'Junho'#9'6'
                  'Julho'#9'7'
                  'Agosto'#9'8'
                  'Setembro'#9'9'
                  'Outubro'#9'10'
                  'Novembro'#9'11'
                  'Dezembro'#9'12')
                Sorted = False
                TabOrder = 0
                UnboundDataType = wwDefault
              end
              object DBspnAnoCompetencia: TwwDBSpinEdit
                Left = 162
                Top = 35
                Width = 55
                Height = 21
                Increment = 1
                MaxValue = 2050
                MinValue = 1980
                Value = 1980
                DataField = 'ANOCOMPETENCIA'
                DataSource = dsIndicador
                TabOrder = 1
                UnboundDataType = wwDefault
              end
            end
            object GroupBox7: TGroupBox
              Left = 16
              Top = 144
              Width = 185
              Height = 57
              Caption = 'Valor'
              TabOrder = 4
              object dbedtVlrIndicador: TDBEdit
                Left = 38
                Top = 20
                Width = 113
                Height = 21
                DataField = 'VLRAPURADO'
                DataSource = dsIndicador
                TabOrder = 0
              end
            end
            object edTipoIndicador: TEdit
              Left = 272
              Top = 72
              Width = 145
              Height = 21
              Enabled = False
              ReadOnly = True
              TabOrder = 5
            end
            object edClasseIndicador: TEdit
              Left = 272
              Top = 112
              Width = 145
              Height = 21
              Enabled = False
              ReadOnly = True
              TabOrder = 6
            end
            object edtObservacao: TDBEdit
              Left = 272
              Top = 156
              Width = 297
              Height = 21
              DataField = 'OBSERVACAO'
              DataSource = dsIndicador
              ReadOnly = True
              TabOrder = 7
            end
          end
          object dbgrdIndicador: TwwDBGrid2
            Left = 0
            Top = 0
            Width = 842
            Height = 264
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsIndicador
            KeyOptions = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgWordWrap]
            TabOrder = 0
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = True
            OnTitleButtonClick = wwDBGrid21TitleButtonClick
            IndicatorColor = icBlack
            OnUpdateFooter = dbgrdIndicadorUpdateFooter
          end
        end
        object tbsEventos: TTabSheet
          Caption = 'Eventos'
          ImageIndex = 7
          object Panel1: TPanel
            Left = 0
            Top = 113
            Width = 842
            Height = 151
            Align = alClient
            BevelOuter = bvNone
            BorderWidth = 10
            TabOrder = 0
            object gbEvento: TGroupBox
              Left = 10
              Top = 10
              Width = 822
              Height = 131
              Align = alClient
              Caption = 'Descrição do Evento'
              Enabled = False
              TabOrder = 0
              object Panel7: TPanel
                Left = 2
                Top = 15
                Width = 818
                Height = 114
                Align = alClient
                BevelOuter = bvNone
                BorderWidth = 7
                TabOrder = 0
                object DBmemDescricao: TwwDBRichEdit
                  Left = 7
                  Top = 7
                  Width = 804
                  Height = 100
                  TabStop = False
                  Align = alClient
                  AutoURLDetect = True
                  DataField = 'EVIDESCRICAO'
                  DataSource = dsEvento
                  MaxLength = 1750
                  PrintJobName = 'Delphi 5'
                  TabOrder = 0
                  PopupOptions = [rpoPopupEdit, rpoPopupCut, rpoPopupCopy, rpoPopupPaste, rpoPopupFont]
                  EditorOptions = [reoShowLoad, reoShowSaveExit, reoShowPrint, reoShowPageSetup, reoShowFormatBar, reoShowToolBar, reoShowStatusBar, reoShowHints, reoCloseOnEscape]
                  EditorCaption = 'Descrição'
                  EditorPosition.Left = 0
                  EditorPosition.Top = 0
                  EditorPosition.Width = 0
                  EditorPosition.Height = 0
                  MeasurementUnits = muCentimeters
                  PrintMargins.Top = 1
                  PrintMargins.Bottom = 1
                  PrintMargins.Left = 1
                  PrintMargins.Right = 1
                  RichEditVersion = 2
                  Data = {
                    840000007B5C727466315C616E73695C616E7369637067313235325C64656666
                    305C6465666C616E67313034367B5C666F6E7474626C7B5C66305C666E696C20
                    4D532053616E732053657269663B7D7D0D0A5C766965776B696E64345C756331
                    5C706172645C625C66305C667331342044426D656D44657363726963616F5C70
                    61720D0A7D0D0A00}
                end
              end
            end
          end
          object Panel4: TPanel
            Left = 0
            Top = 0
            Width = 842
            Height = 113
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 1
            object Panel10: TPanel
              Left = 0
              Top = 0
              Width = 842
              Height = 113
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 0
              object Label3: TLabel
                Left = 18
                Top = 6
                Width = 90
                Height = 13
                Caption = 'Data do Evento'
              end
              object Label1: TLabel
                Left = 292
                Top = 6
                Width = 61
                Height = 13
                Caption = 'Cabeçalho'
              end
              object Label5: TLabel
                Left = 18
                Top = 55
                Width = 78
                Height = 13
                Caption = 'Valor Anterior'
              end
              object Label14: TLabel
                Left = 156
                Top = 55
                Width = 63
                Height = 13
                Caption = 'Valor Atual'
              end
              object Label19: TLabel
                Left = 289
                Top = 55
                Width = 62
                Height = 13
                Caption = 'Percentual'
              end
              object Label36: TLabel
                Left = 374
                Top = 55
                Width = 89
                Height = 13
                Caption = 'Próximo Evento'
              end
              object Label6: TLabel
                Left = 158
                Top = 5
                Width = 71
                Height = 13
                Caption = 'Nº Processo'
              end
              object DBedtDataEvento: TCMDateTimePicker
                Left = 18
                Top = 20
                Width = 121
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                ButtonStyle = cbsCustom
                DataField = 'EVIDATA'
                DataSource = dsEvento
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
              object DBedtCabEvento: TDBEdit
                Left = 292
                Top = 20
                Width = 342
                Height = 21
                DataField = 'EVICABECALHO'
                DataSource = dsEvento
                TabOrder = 1
              end
              object DBedtVlrAnterior: TDBEdit
                Left = 18
                Top = 70
                Width = 121
                Height = 21
                DataField = 'EVIVLRANTERIOR'
                DataSource = dsEvento
                TabOrder = 2
              end
              object DBedtVlrAjustado: TDBEdit
                Left = 156
                Top = 70
                Width = 121
                Height = 21
                DataField = 'EVIVLRAJUSTADO'
                DataSource = dsEvento
                TabOrder = 3
              end
              object DBedtPercent: TDBEdit
                Left = 289
                Top = 70
                Width = 73
                Height = 21
                DataField = 'EVIPERCENT'
                DataSource = dsEvento
                TabOrder = 4
              end
              object CMDateTimePicker1: TCMDateTimePicker
                Left = 374
                Top = 70
                Width = 121
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                ButtonStyle = cbsCustom
                DataField = 'EVIDATAPROX'
                DataSource = dsEvento
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
                TabOrder = 5
              end
              object GroupBox13: TGroupBox
                Left = 505
                Top = 46
                Width = 129
                Height = 67
                Caption = 'Aviso Programado'
                TabOrder = 6
                TabStop = True
                object Label80: TLabel
                  Left = 84
                  Top = 43
                  Width = 24
                  Height = 13
                  Caption = 'dias'
                end
                object wwDBSpinEdit1: TwwDBSpinEdit
                  Left = 27
                  Top = 39
                  Width = 53
                  Height = 21
                  Increment = 1
                  MaxValue = 99
                  MinValue = 1
                  Value = 1
                  DataField = 'DIASAVISO'
                  DataSource = dsEvento
                  MaxLength = 2
                  TabOrder = 1
                  UnboundDataType = wwDefault
                end
                object cbAvisoEvento: TDBCheckBox
                  Left = 8
                  Top = 18
                  Width = 113
                  Height = 17
                  Caption = 'Gera Aviso com'
                  DataField = 'FLGAVISO'
                  DataSource = dsEvento
                  TabOrder = 0
                  ValueChecked = 'S'
                  ValueUnchecked = 'N'
                end
              end
              object DBedtNumProcesso: TDBEdit
                Left = 156
                Top = 20
                Width = 121
                Height = 21
                DataField = 'NUMPROCESSO'
                DataSource = dsEvento
                TabOrder = 7
              end
            end
            object dbgrdEvento: TwwDBGrid2
              Left = 0
              Top = 0
              Width = 842
              Height = 113
              ControlType.Strings = (
                'FLGAVISO;CheckBox;S;N')
              Selected.Strings = (
                'EVIDATA'#9'10'#9'Data'#9'T'
                'NUMPROCESSO'#9'15'#9'Nº Processo'#9'F'
                'EVICABECALHO'#9'38'#9'Histórico'#9'T'
                'EVIVLRANTERIOR'#9'12'#9'Valor Anterior'#9'T'
                'EVIVLRAJUSTADO'#9'12'#9'Valor Corrigido'#9'T'
                'EVIPERCENT'#9'7'#9'Reajuste'#9'T'
                'DSC_INDICE'#9'8'#9'Indice'#9'T'
                'EVIDATAPROX'#9'10'#9'Próximo'#9'T'
                'FLGAVISO'#9'5'#9'Aviso'#9'F'
                'DIASAVISO'#9'6'#9'Dias'#9'F'
                'NOMEUSUARIO'#9'20'#9'Usuário'#9'F')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              Align = alClient
              DataSource = dsEvento
              KeyOptions = []
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgWordWrap]
              TabOrder = 1
              TitleAlignment = taLeftJustify
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -9
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = [fsBold]
              TitleLines = 1
              TitleButtons = True
              UseTFields = False
              OnTitleButtonClick = wwDBGrid21TitleButtonClick
              IndicatorColor = icBlack
            end
          end
        end
        object tbsObs: TTabSheet
          Caption = 'Observações'
          ImageIndex = 8
          object Panel12: TPanel
            Left = 0
            Top = 174
            Width = 842
            Height = 90
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 0
            object Panel6: TPanel
              Left = 0
              Top = 0
              Width = 842
              Height = 27
              Align = alTop
              BevelInner = bvRaised
              BevelOuter = bvLowered
              Caption = 'Histórico de Desmembramentos do imóvel'
              Color = clNavy
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -16
              Font.Name = 'Courier New'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
            end
            object wwDBGrid1: TwwDBGrid
              Left = 0
              Top = 27
              Width = 842
              Height = 63
              Selected.Strings = (
                'DMRDATA'#9'10'#9'Data'#9'F'
                'NOME_IMOVEL'#9'57'#9'Nome Imóvel'#9'F'
                'DMRPERCENT'#9'14'#9'% Desmembrado'#9'F'
                'PERC_ACUM'#9'18'#9'Fator s/ Imovel Atual'#9'F')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              Align = alClient
              DataSource = dsDesmembra
              Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
              ReadOnly = True
              TabOrder = 1
              TitleAlignment = taLeftJustify
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -9
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = [fsBold]
              TitleLines = 1
              TitleButtons = True
              OnTitleButtonClick = wwDBGrid21TitleButtonClick
              IndicatorColor = icBlack
            end
          end
          object Panel11: TPanel
            Left = 0
            Top = 0
            Width = 842
            Height = 174
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object Panel5: TPanel
              Left = 0
              Top = 0
              Width = 842
              Height = 27
              Align = alTop
              BevelInner = bvRaised
              BevelOuter = bvLowered
              Caption = 'Observações'
              Color = clNavy
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -16
              Font.Name = 'Courier New'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
            end
            object DBmemObservacao: TwwDBRichEdit
              Left = 0
              Top = 27
              Width = 842
              Height = 147
              ScrollBars = ssVertical
              Align = alClient
              AutoURLDetect = True
              DataField = 'IMOOBSERVACAO'
              DataSource = ds
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              MaxLength = 1750
              ParentFont = False
              PrintJobName = 'Delphi 5'
              TabOrder = 1
              PopupOptions = [rpoPopupEdit, rpoPopupCut, rpoPopupCopy, rpoPopupPaste, rpoPopupFont]
              EditorCaption = 'Descrição do Imóvel'
              EditorPosition.Left = 0
              EditorPosition.Top = 0
              EditorPosition.Width = 0
              EditorPosition.Height = 0
              MeasurementUnits = muCentimeters
              PrintMargins.Top = 1
              PrintMargins.Bottom = 1
              PrintMargins.Left = 1
              PrintMargins.Right = 1
              RichEditVersion = 2
              Data = {
                830000007B5C727466315C616E73695C616E7369637067313235325C64656666
                305C6465666C616E67313034367B5C666F6E7474626C7B5C66305C666E696C20
                4D532053616E732053657269663B7D7D0D0A5C766965776B696E64345C756331
                5C706172645C66305C667331342044426D656D4F62736572766163616F5C7061
                720D0A7D0D0A00}
            end
          end
        end
        object tbsDesmembra: TTabSheet
          Caption = 'Imagens'
          ImageIndex = 9
          object Panel13: TPanel
            Left = 0
            Top = 0
            Width = 461
            Height = 264
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object Label51: TLabel
              Left = 9
              Top = 51
              Width = 58
              Height = 13
              Caption = 'Descrição'
            end
            object Label52: TLabel
              Left = 9
              Top = 5
              Width = 44
              Height = 13
              Caption = 'Imagem'
            end
            object EdtArquivoImagem: TEdit
              Left = 9
              Top = 19
              Width = 234
              Height = 21
              TabOrder = 0
            end
            object Button1: TButton
              Left = 242
              Top = 19
              Width = 23
              Height = 22
              Caption = '...'
              ModalResult = 1
              TabOrder = 1
              OnClick = Button1Click
            end
            object DBDescrimagem: TDBEdit
              Left = 9
              Top = 65
              Width = 234
              Height = 21
              DataField = 'DESCRIMAGEM'
              DataSource = dsImagensXImoveis
              TabOrder = 2
            end
          end
          object dbGrdImagens: TwwDBGrid
            Left = 0
            Top = 0
            Width = 461
            Height = 264
            Selected.Strings = (
              'DESCRIMAGEM'#9'46'#9'Descrição da Imagem'#9'F')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsImagensXImoveis
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgWordWrap]
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
          object Panel14: TPanel
            Left = 461
            Top = 0
            Width = 381
            Height = 264
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 2
            object ScrollBox2: TScrollBox
              Left = 0
              Top = 0
              Width = 381
              Height = 264
              Align = alClient
              TabOrder = 0
              OnDblClick = DBImageDblClick
              object Image: TImage
                Left = 0
                Top = 0
                Width = 377
                Height = 209
                AutoSize = True
                Center = True
                OnDblClick = DBImageDblClick
              end
              object DBImage: TDBImage
                Left = 0
                Top = -48
                Width = 209
                Height = 209
                Color = clBtnFace
                DataField = 'IMAGEM'
                DataSource = dsImagensXImoveis
                TabOrder = 0
                Visible = False
                OnDblClick = DBImageDblClick
              end
            end
          end
        end
        object tbsPlanoPatro: TTabSheet
          Caption = 'Segregação'
          ImageIndex = 9
          object pgSegregacao: TPageControl
            Left = 0
            Top = 0
            Width = 842
            Height = 264
            ActivePage = tbsDadosSegregacao
            Align = alClient
            MultiLine = True
            TabOrder = 0
            OnChange = pgSegregacaoChange
            OnChanging = tbcDetalheChanging
            object tbsDadosSegregacao: TTabSheet
              Caption = 'Dados'
              object pnlPlanoPatro: TPanel
                Left = 0
                Top = 0
                Width = 834
                Height = 236
                Align = alClient
                BevelOuter = bvNone
                TabOrder = 1
                object Label47: TLabel
                  Left = 40
                  Top = 5
                  Width = 118
                  Height = 13
                  Caption = 'Plano Previdenciário'
                end
                object Label48: TLabel
                  Left = 40
                  Top = 57
                  Width = 80
                  Height = 13
                  Caption = 'Patrocinadora'
                end
                object Label49: TLabel
                  Left = 41
                  Top = 171
                  Width = 62
                  Height = 13
                  Caption = 'Percentual'
                  Visible = False
                end
                object lblDataVigencia: TLabel
                  Left = 300
                  Top = 104
                  Width = 118
                  Height = 13
                  Caption = 'Data Início Vigência'
                end
                object dblcPlanoPrev: TwwDBLookupCombo
                  Left = 40
                  Top = 21
                  Width = 385
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'NOME'#9'50'#9'Plano'#9'F')
                  DataField = 'IDPLANOPREV'
                  DataSource = dsPlanoPatro
                  LookupTable = cdsPlano
                  LookupField = 'IDPLANOPREV'
                  TabOrder = 0
                  AutoDropDown = False
                  ShowButton = True
                  UseTFields = False
                  AllowClearKey = False
                  OnChange = dblcPlanoPrevChange
                end
                object dblcPatro: TwwDBLookupCombo
                  Left = 40
                  Top = 71
                  Width = 385
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'NOME'#9'60'#9'NOME'#9'F')
                  DataField = 'IDPATRO'
                  DataSource = dsPlanoPatro
                  LookupTable = cdsPatro
                  LookupField = 'IDPESSOA'
                  TabOrder = 1
                  AutoDropDown = False
                  ShowButton = True
                  UseTFields = False
                  AllowClearKey = False
                end
                object dbedtPercPlanoPatro: TDBEdit
                  Left = 40
                  Top = 147
                  Width = 105
                  Height = 21
                  DataField = 'PPIPERCENTRATEIO'
                  DataSource = dsPlanoPatro
                  TabOrder = 2
                end
                object dbrgFlgTipo: TDBRadioGroup
                  Left = 40
                  Top = 104
                  Width = 248
                  Height = 36
                  Columns = 2
                  DataField = 'FLGTIPO'
                  DataSource = dsPlanoPatro
                  Items.Strings = (
                    'Percentual'
                    'Cotas')
                  TabOrder = 3
                  TabStop = True
                  Values.Strings = (
                    'P'
                    'C')
                end
                object dtVigenciaImob: TCMDateTimePicker
                  Left = 301
                  Top = 119
                  Width = 125
                  Height = 21
                  CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                  CalendarAttributes.Font.Color = clWindowText
                  CalendarAttributes.Font.Height = -11
                  CalendarAttributes.Font.Name = 'MS Sans Serif'
                  CalendarAttributes.Font.Style = []
                  ButtonStyle = cbsCustom
                  DataField = 'DATAVIGENCIA'
                  DataSource = dsPlanoPatro
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
                  UnboundDataType = wwDTEdtDate
                end
              end
              object dbgrdPlanoPatro: TwwDBGrid
                Left = 0
                Top = 0
                Width = 834
                Height = 236
                Selected.Strings = (
                  'NOME_PLANO'#9'45'#9'Plano Previdenciário'
                  'NOME_PATRO'#9'25'#9'Patrocinadora'
                  'PPIPERCENTRATEIO'#9'20'#9'Percentual'#9'F')
                IniAttributes.Delimiter = ';;'
                TitleColor = clBtnFace
                FixedCols = 0
                ShowHorzScrollBar = True
                Align = alClient
                DataSource = dsPlanoPatro
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgWordWrap]
                TabOrder = 0
                TitleAlignment = taLeftJustify
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -9
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = [fsBold]
                TitleLines = 1
                TitleButtons = True
                OnTitleButtonClick = wwDBGrid21TitleButtonClick
                OnDblClick = dbgrdDetDblClick
                IndicatorColor = icBlack
              end
            end
            object tbsHstSegregacao: TTabSheet
              Caption = 'Vigências'
              ImageIndex = 1
              object grdVigenciaImob: TwwDBGrid
                Left = 0
                Top = 0
                Width = 834
                Height = 236
                Selected.Strings = (
                  'DATAVIGENCIA'#9'12'#9'Data Vigência'
                  'NOMEPLANO'#9'40'#9'Plano Previdenciário'
                  'NOMEPATRO'#9'15'#9'Patrocinadora'
                  'PERCENTRATEIO'#9'10'#9'Percentual'
                  'NOMEUSUARIO'#9'22'#9'Responsável'#9'F')
                IniAttributes.Delimiter = ';;'
                TitleColor = clBtnFace
                FixedCols = 0
                ShowHorzScrollBar = True
                Align = alClient
                DataSource = dsPlanoPatroxVigenciaImob
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
        object tbsVoto: TTabSheet
          Caption = 'Voto'
          ImageIndex = 10
          object dbgrdVoto: TwwDBGrid
            Left = 0
            Top = 0
            Width = 842
            Height = 223
            Selected.Strings = (
              'VOTO'#9'20'#9'Voto'
              'RESOLUCAO'#9'20'#9'Resolução'
              'FORN'#9'20'#9'Fornecedor'
              'TIPO'#9'20'#9'Tipo de Investimento'
              'VLRAPROVADO'#9'20'#9'Valor Aprovado')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsVoto
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
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
          object pnlVoto: TPanel
            Left = 0
            Top = 223
            Width = 842
            Height = 41
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 0
            object btnImprimeVoto: TToolbarButton97
              Left = 381
              Top = 4
              Width = 80
              Height = 33
              AllowAllUp = True
              Caption = ' &Imprimir'
              Flat = False
              Glyph.Data = {
                DE010000424DDE01000000000000760000002800000024000000120000000100
                0400000000006801000000000000000000001000000010000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888880008
                8888888888888F7778FF8888000088888800877008888888888F7787F778FF88
                0000888800880007700888888F778F7778F778FF000088008800877007700888
                778F7787F778F778000080880088877770077087FF778887F88778F700008700
                888887777770008777888887FF888777000080888888F77777777087F8888F77
                78FF88870000878888FF888777777087F88F77888778FF8700008788FF888888
                87777087FF778888888778F7000087FF88899888888770877788888888888777
                000087888AA88888808880878FF8888888FFF8F700008877F888888FF0877888
                778FF88FF77787780000888877F87FFFFF08888888778F77788878F800008888
                88777FFFFFF088888888777FF888878F00008888888877FFFFFF008888888877
                8F888F77000088888888887FFF7788888888888878FF77880000888888888887
                7788888888888888877788880000888888888888888888888888888888888888
                0000}
              NumGlyphs = 2
              Opaque = False
              Spacing = 0
              OnClick = btnImprimeVotoClick
            end
          end
        end
        object tbsProvisao: TTabSheet
          Caption = 'Provisão '
          ImageIndex = 11
          object dbgrdProvisao: TwwDBGrid2
            Left = 0
            Top = 0
            Width = 842
            Height = 264
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsProvisaoImovel
            KeyOptions = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgWordWrap]
            TabOrder = 0
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = True
            IndicatorColor = icBlack
          end
          object pnlProvisao: TPanel
            Left = 0
            Top = 0
            Width = 842
            Height = 264
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object lblProvisaoPercentual: TLabel
              Left = 16
              Top = 10
              Width = 133
              Height = 13
              Caption = 'Percentual de Provisão'
            end
            object lblProvisaoInicio: TLabel
              Left = 16
              Top = 61
              Width = 110
              Height = 13
              Caption = 'Início da Apuração'
            end
            object dbEdtProvisaoInicio: TCMDateTimePicker
              Left = 16
              Top = 75
              Width = 129
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'VIGENCIA_INICIO'
              DataSource = dsProvisaoImovel
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
            object chkProvisaoAtivo: TCheckBox
              Left = 16
              Top = 125
              Width = 209
              Height = 17
              Caption = 'Percentual atual de apuração'
              Enabled = False
              TabOrder = 2
            end
            object edtPercProvisao: TDBRealEdit
              Left = 16
              Top = 24
              Width = 121
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              TabOrder = 0
              WordWrap = False
              IntDigits = 3
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'PERCENTUAL'
              DataSource = dsProvisaoImovel
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 940
        object cbPrevistos: TCheckBox
          Left = 451
          Top = 7
          Width = 93
          Height = 17
          Caption = 'Previstos'
          Checked = True
          State = cbChecked
          TabOrder = 1
          OnClick = cbPrevistosClick
        end
        object cbRealizados: TCheckBox
          Left = 546
          Top = 7
          Width = 116
          Height = 17
          Caption = 'Realizados'
          Checked = True
          State = cbChecked
          TabOrder = 2
          OnClick = cbPrevistosClick
        end
      end
      inherited Dock974: TDock97
        Left = 854
        Height = 292
      end
    end
  end
  inherited Dock972: TDock97
    Width = 950
    object lblAtivo: TLabel [0]
      Left = 809
      Top = 9
      Width = 127
      Height = 24
      Alignment = taRightJustify
      Caption = 'Ativo/Inativo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -21
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    inherited Toolbar971: TToolbar97
      object sbtnMestre: TToolbarButton97
        Left = 240
        Top = 0
        Width = 60
        Height = 41
        AllowAllUp = True
        GroupIndex = 1
        Caption = '&Mestre'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333CCCCC33
          33333FFFF77777FFFFFFCCCCCC808CCCCCC3777777F7F777777F008888070888
          8003777777777777777F0F0770F7F0770F0373F33337F333337370FFFFF7FFFF
          F07337F33337F33337F370FFFB99FBFFF07337F33377F33337F330FFBF99BFBF
          F033373F337733333733370BFBF7FBFB0733337F333FF3337F33370FBF98BFBF
          0733337F3377FF337F333B0BFB990BFB03333373FF777FFF73333FB000B99000
          B33333377737777733333BFBFBFB99FBF33333333FF377F333333FBF99BF99BF
          B333333377F377F3333333FB99FB99FB3333333377FF77333333333FB9999FB3
          333333333777733333333333FBFBFB3333333333333333333333}
        ImageIndex = 3
        Images = ImlPadrao
        Layout = blGlyphTop
        Opaque = False
        Spacing = 0
        OnClick = sbtnMestreClick
      end
    end
    object btnAtualiza: TButton
      Left = 364
      Top = 6
      Width = 129
      Height = 33
      Caption = 'Atualiza IDCidades'
      TabOrder = 1
      Visible = False
      OnClick = btnAtualizaClick
    end
    object btnAtualizaSit: TButton
      Left = 501
      Top = 6
      Width = 129
      Height = 33
      Caption = 'Atualiza Situação'
      TabOrder = 2
      Visible = False
      OnClick = btnAtualizaSitClick
    end
  end
  inherited Dock971: TDock97
    Top = 450
    Width = 950
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      6
      (
        'TwwDBRichEdit'
        'Text'
        0)
      (
        'TDBRealEdit'
        'Text'
        0)
      (
        ''
        'Items'
        0)
      (
        ''
        'Cells'
        0)
      (
        'TDBMemo'
        'Text'
        0)
      (
        ''
        'DisplayLabel'
        0))
  end
  inherited ds: TwwDataSource
    Left = 514
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyEdit = CmeCadastroApplyInsert
    ApplyDelete = CmeCadastroApplyDelete
    Left = 324
  end
  inherited Cds: TCMClientDataSet
    Left = 514
    Top = 27
    object CdsIDIMOVELMESTRE: TFloatField
      FieldName = 'IDIMOVELMESTRE'
    end
    object CdsIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
    end
    object CdsIDCIDADES: TFloatField
      FieldName = 'IDCIDADES'
    end
    object CdsCODSUBCONTA: TFloatField
      FieldName = 'CODSUBCONTA'
    end
    object CdsIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object CdsIDMARCA: TFloatField
      FieldName = 'IDMARCA'
    end
    object CdsIMOCEP: TStringField
      FieldName = 'IMOCEP'
      Size = 8
    end
    object CdsIMOBAIRRO: TStringField
      FieldName = 'IMOBAIRRO'
    end
    object CdsIDADMINIMOVEL: TFloatField
      FieldName = 'IDADMINIMOVEL'
    end
    object CdsFLGTIPOIMOVEL: TFloatField
      FieldName = 'FLGTIPOIMOVEL'
    end
    object CdsIMODATACONSTRUCAO: TDateTimeField
      FieldName = 'IMODATACONSTRUCAO'
    end
    object CdsIMOAREA: TFloatField
      FieldName = 'IMOAREA'
    end
    object CdsIMOFRACAOIDEAL: TFloatField
      FieldName = 'IMOFRACAOIDEAL'
    end
    object CdsIMODESCRICAO: TMemoField
      FieldName = 'IMODESCRICAO'
      BlobType = ftMemo
      Size = 2000
    end
    object CdsFLGSTATUSOCUPACAO: TStringField
      FieldName = 'FLGSTATUSOCUPACAO'
      FixedChar = True
      Size = 1
    end
    object CdsQTDETOTALCOTAS: TFloatField
      FieldName = 'QTDETOTALCOTAS'
    end
    object CdsIMONOME: TStringField
      FieldName = 'IMONOME'
      Size = 100
    end
    object CdsIMOLOGRADOURO: TStringField
      FieldName = 'IMOLOGRADOURO'
      Size = 80
    end
    object CdsIMONUMERO: TStringField
      FieldName = 'IMONUMERO'
      Size = 8
    end
    object CdsIMOCOMPLEMENTO: TStringField
      FieldName = 'IMOCOMPLEMENTO'
    end
    object CdsIMONOMEENDERECO: TStringField
      FieldName = 'IMONOMEENDERECO'
      Size = 60
    end
    object CdsCODESTADO: TStringField
      FieldName = 'CODESTADO'
      FixedChar = True
      Size = 3
    end
    object CdsIDESTADO: TFloatField
      FieldName = 'IDESTADO'
    end
    object CdsIDPAIS: TFloatField
      FieldName = 'IDPAIS'
    end
    object CdsIMOAREATOTAL: TFloatField
      FieldName = 'IMOAREATOTAL'
    end
    object CdsCODTIPIMOVEL: TStringField
      FieldName = 'CODTIPIMOVEL'
      Size = 5
    end
    object CdsFLGATIVO: TFloatField
      FieldName = 'FLGATIVO'
    end
    object CdsIMOPERCENTRATEIO: TFloatField
      FieldName = 'IMOPERCENTRATEIO'
    end
    object CdsCODIMOVELSPC: TFloatField
      FieldName = 'CODIMOVELSPC'
    end
    object CdsIMOMOEDACOMPRA: TFloatField
      FieldName = 'IMOMOEDACOMPRA'
    end
    object CdsIMOVLRCOMPRA: TFloatField
      FieldName = 'IMOVLRCOMPRA'
      DisplayFormat = '###,###,###,##0.00'
      EditFormat = '###,###,###,##0.00'
    end
    object CdsIMODATACOMPRA: TDateTimeField
      FieldName = 'IMODATACOMPRA'
    end
    object CdsIMOMATRICULA: TStringField
      FieldName = 'IMOMATRICULA'
    end
    object CdsIMOOBSERVACAO: TMemoField
      FieldName = 'IMOOBSERVACAO'
      BlobType = ftMemo
      Size = 2000
    end
    object CdsIMODATAHABITESE: TDateTimeField
      FieldName = 'IMODATAHABITESE'
    end
    object CdsIDCARTORIO: TFloatField
      FieldName = 'IDCARTORIO'
    end
    object CdsFLGSTATUS: TStringField
      FieldName = 'FLGSTATUS'
      FixedChar = True
      Size = 1
    end
    object CdsIMOCODIGO: TStringField
      FieldName = 'IMOCODIGO'
      Size = 15
    end
    object CdsIMOAREAGERENCIAL: TFloatField
      FieldName = 'IMOAREAGERENCIAL'
    end
    object CdsFLGCATIMOVEL: TStringField
      FieldName = 'FLGCATIMOVEL'
      FixedChar = True
      Size = 1
    end
    object CdsIMOVLRREAVAL: TFloatField
      FieldName = 'IMOVLRREAVAL'
      DisplayFormat = '###,###,###,##0.00'
      EditFormat = '###,###,###,##0.00'
    end
    object CdsIMODATAREAVAL: TDateTimeField
      FieldName = 'IMODATAREAVAL'
    end
    object CdsIMOVLRMERCADO: TFloatField
      FieldName = 'IMOVLRMERCADO'
      DisplayFormat = '###,###,###,##0.00'
      EditFormat = '###,###,###,##0.00'
    end
    object CdsIMODATAMERCADO: TDateTimeField
      FieldName = 'IMODATAMERCADO'
    end
    object CdsIMOMOEDAREAVAL: TFloatField
      FieldName = 'IMOMOEDAREAVAL'
    end
    object CdsIMOMOEDAMERCADO: TFloatField
      FieldName = 'IMOMOEDAMERCADO'
    end
    object CdsIDRESPONSAVEL: TFloatField
      FieldName = 'IDRESPONSAVEL'
    end
    object CdsIMOVAGAS: TFloatField
      FieldName = 'IMOVAGAS'
    end
    object CdsIMOAREACOMUM: TFloatField
      FieldName = 'IMOAREACOMUM'
    end
    object CdsIDCARTEIRASPC: TFloatField
      FieldName = 'IDCARTEIRASPC'
    end
    object CdsTAXACOMPRA: TFloatField
      FieldName = 'TAXACOMPRA'
    end
    object CdsINDICECOMPRA: TFloatField
      FieldName = 'INDICECOMPRA'
    end
    object CdsIMOARREMATADO: TStringField
      FieldName = 'IMOARREMATADO'
      FixedChar = True
      Size = 1
    end
    object CdsIMODATAARREMATADO: TDateTimeField
      FieldName = 'IMODATAARREMATADO'
    end
    object CdsIMOVEL_EXTENSO: TStringField
      FieldName = 'IMOVEL_EXTENSO'
      Size = 140
    end
    object CdsIMOCIDADE: TStringField
      FieldName = 'IMOCIDADE'
    end
    object CdsCODESTADO_1: TStringField
      FieldName = 'CODESTADO_1'
      FixedChar = True
      Size = 3
    end
    object CdsDSC_MESTRE: TStringField
      FieldName = 'DSC_MESTRE'
      Size = 100
    end
    object CdsDSC_ADMINISTRADORA: TStringField
      FieldName = 'DSC_ADMINISTRADORA'
      Size = 60
    end
    object CdsDSC_CARTORIO: TStringField
      FieldName = 'DSC_CARTORIO'
      Size = 60
    end
    object CdsDSC_TIPOIMOVEL: TStringField
      FieldName = 'DSC_TIPOIMOVEL'
      Size = 60
    end
    object CdsPERCENTUAL: TFloatField
      FieldName = 'PERCENTUAL'
    end
  end
  inherited MontaSelect: TMontaSelect
    Left = 456
    Top = 65534
  end
  inherited CmeDetalhe: TCmEventosCadastro
    AfterConfirma = CmeDetalheAfterConfirma
    Left = 258
    Top = 16
  end
  inherited dsDet: TwwDataSource
    DataSet = cdsOutroDado
    Left = 572
  end
  object dsIndicador: TwwDataSource
    AutoEdit = False
    DataSet = cdsIndicador
    Left = 710
    Top = 65535
  end
  object dsEvento: TwwDataSource
    AutoEdit = False
    DataSet = cdsEvento
    Left = 646
    Top = 1
  end
  object cdsMarcas: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 702
    Top = 247
    object cdsMarcasMRCNOME: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 40
      FieldName = 'MRCNOME'
      Size = 40
    end
    object cdsMarcasIDMARCA: TFloatField
      FieldName = 'IDMARCA'
      Visible = False
    end
  end
  object cdsSubConta: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 702
    Top = 260
    Data = {
      A70000009619E0BD010000001800000005000000000003000000A7000B434F44
      535542434F4E54410800040000000000084944504553534F4108000400000000
      000C4E4F4D45535542434F4E5441010049000000010005574944544802000200
      3C000D5452474454494E434C5553414F08000800000000000F54524755534552
      494E434C5553414F0100490000000100055749445448020002001E000100044C
      4349440400010009080000}
    object cdsSubContaCODSUBCONTA: TFloatField
      FieldName = 'CODSUBCONTA'
    end
    object cdsSubContaNOMESUBCONTA: TStringField
      DisplayLabel = 'Subconta'
      FieldName = 'NOMESUBCONTA'
      Size = 60
    end
  end
  object cdsMoeda: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 702
    Top = 273
    object cdsMoedaMOESIGLA: TStringField
      DisplayLabel = 'Sigla'
      DisplayWidth = 6
      FieldName = 'MOESIGLA'
      Size = 10
    end
    object cdsMoedaMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
      Visible = False
    end
    object cdsMoedaMOEDESC: TStringField
      DisplayLabel = 'Descrição'
      FieldName = 'MOEDESC'
      Visible = False
    end
    object cdsMoedaMOEPERIODICIDADE: TStringField
      FieldName = 'MOEPERIODICIDADE'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object cdsMoedaFLGPERCVALOR: TStringField
      FieldName = 'FLGPERCVALOR'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object cdsPais: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 702
    Top = 286
    Data = {
      5C0100009619E0BD010000001800000009000100000003000000270106494450
      4149530800040000000000084E4F4D4550414953010049000000010005574944
      5448020002001E00114E4F4D454E4143494F4E414C4944414445010049000000
      0100055749445448020002001E0011434F44524543454954414645444552414C
      080004000000000010434F44494E5445524E4143494F4E414C01004900000001
      000557494454480200020003000E4D41534341524143504F5354414C01004900
      000001000557494454480200020014000D5452474454494E434C5553414F0800
      0800000000000F54524755534552494E434C5553414F01004900000001000557
      49445448020002001E0009434F4452454749414F08000400000000000100044C
      434944040001000908000000000401000000000000F03F0642726173696C0A42
      726173696C6569726100000000000024400342524100ECE93581ABCC4202434D}
    object cdsPaisNOMEPAIS: TStringField
      DisplayWidth = 30
      FieldName = 'NOMEPAIS'
      Size = 30
    end
    object cdsPaisIDPAIS: TFloatField
      FieldName = 'IDPAIS'
      Visible = False
    end
  end
  object cdsEstado: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 702
    Top = 299
    object cdsEstadoCODESTADO: TStringField
      FieldName = 'CODESTADO'
      FixedChar = True
      Size = 3
    end
    object cdsEstadoIDPAIS: TFloatField
      FieldName = 'IDPAIS'
    end
    object cdsEstadoNOMEESTADO: TStringField
      FieldName = 'NOMEESTADO'
      Size = 30
    end
    object cdsEstadoIDESTADO: TFloatField
      FieldName = 'IDESTADO'
    end
  end
  object MontaEndereco: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'IMOVEL.IMONOMEENDERECO'
      'IMOVEL.IMONOME')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Nome do Endereço'
      'Nome do Imóvel')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'IMOVEL')
    CamposChave.Strings = (
      'IMOVEL.IDIMOVEL')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '30'
      '30')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 455
    Top = 10
  end
  object cdsContrato: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IDCONTRATOIMOVEL'
        DataType = ftFloat
      end
      item
        Name = 'CONNUMERO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'CONNOME'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'CONDATAINICIO'
        DataType = ftDateTime
      end
      item
        Name = 'CONDATAFIM'
        DataType = ftDateTime
      end
      item
        Name = 'CIMDTINI'
        DataType = ftDateTime
      end
      item
        Name = 'CIMDTFIM'
        DataType = ftDateTime
      end>
    IndexDefs = <>
    IndexFieldNames = 'CONNUMERO'
    Params = <>
    StoreDefs = True
    Left = 894
    Top = 9
    object cdsContratoCONNUMERO: TStringField
      DisplayLabel = 'Nº Contrato'
      DisplayWidth = 13
      FieldName = 'CONNUMERO'
    end
    object cdsContratoCONNOME: TStringField
      DisplayLabel = 'Nome do Contrato'
      DisplayWidth = 54
      FieldName = 'CONNOME'
      Size = 60
    end
    object cdsContratoCIMDTINI: TDateTimeField
      DisplayLabel = 'Início'
      DisplayWidth = 15
      FieldName = 'CIMDTINI'
    end
    object cdsContratoCIMDTFIM: TDateTimeField
      DisplayLabel = 'Término'
      DisplayWidth = 15
      FieldName = 'CIMDTFIM'
    end
    object cdsContratoCONDATAINICIO: TDateTimeField
      DisplayLabel = 'Início'
      DisplayWidth = 12
      FieldName = 'CONDATAINICIO'
      Visible = False
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsContratoCONDATAFIM: TDateTimeField
      DisplayLabel = 'Término'
      DisplayWidth = 12
      FieldName = 'CONDATAFIM'
      Visible = False
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsContratoIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
      Visible = False
    end
  end
  object dsContrato: TwwDataSource
    AutoEdit = False
    DataSet = cdsContrato
    Left = 894
    Top = 22
  end
  object cdsEvento: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IDEVENTOIMOVEL'
        DataType = ftFloat
      end
      item
        Name = 'IDIMOVEL'
        DataType = ftFloat
      end
      item
        Name = 'IDCONTRATOIMOVEL'
        DataType = ftFloat
      end
      item
        Name = 'IDUSUARIO'
        DataType = ftFloat
      end
      item
        Name = 'IDCONTRATOLOJA'
        DataType = ftFloat
      end
      item
        Name = 'EVIDATAPROX'
        DataType = ftDateTime
      end
      item
        Name = 'EVICABECALHO'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'EVIDESCRICAO'
        DataType = ftMemo
        Size = 2000
      end
      item
        Name = 'EVIDATA'
        DataType = ftDateTime
      end
      item
        Name = 'FLGTIPOEVENTO'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'EVIPERCENT'
        DataType = ftFloat
      end
      item
        Name = 'EVIINDICEREAJUSTE'
        DataType = ftFloat
      end
      item
        Name = 'EVIVLRANTERIOR'
        DataType = ftFloat
      end
      item
        Name = 'EVIVLRAJUSTADO'
        DataType = ftFloat
      end
      item
        Name = 'CODDOCUMENTO'
        DataType = ftFloat
      end
      item
        Name = 'FLGAVISO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'DIASAVISO'
        DataType = ftFloat
      end
      item
        Name = 'USUARIO_EXTENSO'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'DSC_INDICE'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'NOMEUSUARIO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'NUMPROCESSO'
        DataType = ftString
        Size = 30
      end>
    IndexDefs = <>
    IndexFieldNames = 'EVIDATA'
    Params = <>
    StoreDefs = True
    Left = 646
    Top = 15
    object cdsEventoIDEVENTOIMOVEL: TFloatField
      FieldName = 'IDEVENTOIMOVEL'
    end
    object cdsEventoIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
    end
    object cdsEventoEVIDATA: TDateTimeField
      Alignment = taCenter
      DisplayLabel = 'Data'
      FieldName = 'EVIDATA'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsEventoEVICABECALHO: TStringField
      FieldName = 'EVICABECALHO'
      Size = 60
    end
    object cdsEventoEVIDESCRICAO: TMemoField
      FieldName = 'EVIDESCRICAO'
      BlobType = ftMemo
      Size = 2000
    end
    object cdsEventoIDUSUARIO: TFloatField
      FieldName = 'IDUSUARIO'
    end
    object cdsEventoIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
    end
    object cdsEventoFLGTIPOEVENTO: TStringField
      FieldName = 'FLGTIPOEVENTO'
      Size = 2
    end
    object cdsEventoEVIVLRANTERIOR: TFloatField
      DisplayLabel = 'Valor Anterior'
      FieldName = 'EVIVLRANTERIOR'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
    end
    object cdsEventoEVIVLRAJUSTADO: TFloatField
      DisplayLabel = 'Valor Corrigido'
      FieldName = 'EVIVLRAJUSTADO'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
    end
    object cdsEventoEVIDATAPROX: TDateTimeField
      DisplayLabel = 'Próximo'
      FieldName = 'EVIDATAPROX'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsEventoEVIPERCENT: TFloatField
      DisplayLabel = 'Reajuste'
      FieldName = 'EVIPERCENT'
      DisplayFormat = '##0.00%'
      EditFormat = '##0.00%'
    end
    object cdsEventoEVIINDICEREAJUSTE: TFloatField
      FieldName = 'EVIINDICEREAJUSTE'
    end
    object cdsEventoIDCONTRATOLOJA: TFloatField
      FieldName = 'IDCONTRATOLOJA'
    end
    object cdsEventoDSC_INDICE: TStringField
      DisplayLabel = 'Indice'
      DisplayWidth = 10
      FieldName = 'DSC_INDICE'
      FixedChar = True
      Size = 10
    end
    object cdsEventoFLGAVISO: TStringField
      FieldName = 'FLGAVISO'
      FixedChar = True
      Size = 1
    end
    object cdsEventoDIASAVISO: TFloatField
      FieldName = 'DIASAVISO'
    end
    object cdsEventoNOMEUSUARIO: TStringField
      FieldName = 'NOMEUSUARIO'
      FixedChar = True
    end
    object cdsEventoCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object cdsEventoUSUARIO_EXTENSO: TStringField
      FieldName = 'USUARIO_EXTENSO'
      Size = 100
    end
    object cdsEventoNUMPROCESSO: TStringField
      FieldName = 'NUMPROCESSO'
      Size = 30
    end
  end
  object cdsIndicador: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IDDOCUMENTO'
        DataType = ftFloat
      end
      item
        Name = 'OBSERVACAO'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'IDINDICADORXAPUR'
        DataType = ftFloat
      end
      item
        Name = 'IDIMOVEL'
        DataType = ftFloat
      end
      item
        Name = 'IDUNIDAUT'
        DataType = ftFloat
      end
      item
        Name = 'MESCOMPETENCIA'
        DataType = ftFloat
      end
      item
        Name = 'ANOCOMPETENCIA'
        DataType = ftFloat
      end
      item
        Name = 'VLRAPURADO'
        DataType = ftFloat
      end
      item
        Name = 'DATAAPURADO'
        DataType = ftDateTime
      end
      item
        Name = 'FLGPREVREAL'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'IDINDICADORIMOVEL'
        DataType = ftFloat
      end
      item
        Name = 'FLGTIPOAPURACAO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'INMDESCRICAO'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'FLGTIPOVALOR'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'RECPAG'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'DSC_TIPOVALOR'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'DSC_RECPAG'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'DSC_PREVREAL'
        DataType = ftString
        Size = 9
      end
      item
        Name = 'DSC_TIPOAPURACAO'
        DataType = ftString
        Size = 10
      end>
    IndexDefs = <>
    IndexFieldNames = 'INMDESCRICAO'
    Params = <>
    StoreDefs = True
    Left = 710
    Top = 15
    object cdsIndicadorINMDESCRICAO: TStringField
      DisplayLabel = 'Indicador'
      DisplayWidth = 45
      FieldName = 'INMDESCRICAO'
      Size = 60
    end
    object cdsIndicadorDATAAPURADO: TDateTimeField
      DisplayLabel = 'Data'
      DisplayWidth = 11
      FieldName = 'DATAAPURADO'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = 'dd/mm/yyyy'
    end
    object cdsIndicadorMESCOMPETENCIA: TFloatField
      DisplayLabel = 'Mês'
      DisplayWidth = 5
      FieldName = 'MESCOMPETENCIA'
    end
    object cdsIndicadorANOCOMPETENCIA: TFloatField
      DisplayLabel = 'Ano'
      DisplayWidth = 5
      FieldName = 'ANOCOMPETENCIA'
    end
    object cdsIndicadorVLRAPURADO: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 11
      FieldName = 'VLRAPURADO'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
    end
    object cdsIndicadorDSC_TIPOVALOR: TStringField
      DisplayLabel = 'Tipo Valor'
      DisplayWidth = 7
      FieldName = 'DSC_TIPOVALOR'
      Size = 7
    end
    object cdsIndicadorDSC_RECPAG: TStringField
      DisplayLabel = 'Tipo Indicador'
      DisplayWidth = 10
      FieldName = 'DSC_RECPAG'
      Size = 10
    end
    object cdsIndicadorDSC_PREVREAL: TStringField
      DisplayLabel = 'Tipo Lanc.'
      DisplayWidth = 9
      FieldName = 'DSC_PREVREAL'
      Size = 9
    end
    object cdsIndicadorOBSERVACAO: TStringField
      DisplayLabel = 'Observação'
      DisplayWidth = 80
      FieldName = 'OBSERVACAO'
      Size = 200
    end
    object cdsIndicadorFLGTIPOVALOR: TStringField
      DisplayLabel = 'Tipo Valor'
      DisplayWidth = 13
      FieldName = 'FLGTIPOVALOR'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object cdsIndicadorFLGPREVREAL: TStringField
      DisplayLabel = 'Tipo Lanc.'
      DisplayWidth = 12
      FieldName = 'FLGPREVREAL'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object cdsIndicadorRECPAG: TStringField
      DisplayLabel = 'Tipo Indicador'
      DisplayWidth = 7
      FieldName = 'RECPAG'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object cdsIndicadorIDINDICADORXAPUR: TFloatField
      DisplayWidth = 10
      FieldName = 'IDINDICADORXAPUR'
      Visible = False
    end
    object cdsIndicadorIDIMOVEL: TFloatField
      DisplayWidth = 10
      FieldName = 'IDIMOVEL'
      Visible = False
    end
    object cdsIndicadorIDUNIDAUT: TFloatField
      DisplayWidth = 10
      FieldName = 'IDUNIDAUT'
      Visible = False
    end
    object cdsIndicadorIDINDICADORIMOVEL: TFloatField
      DisplayWidth = 10
      FieldName = 'IDINDICADORIMOVEL'
      Visible = False
    end
    object cdsIndicadorIDDOCUMENTO: TFloatField
      FieldName = 'IDDOCUMENTO'
      Visible = False
    end
    object cdsIndicadorFLGTIPOAPURACAO: TStringField
      FieldName = 'FLGTIPOAPURACAO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object cdsIndicadorDSC_TIPOAPURACAO: TStringField
      FieldName = 'DSC_TIPOAPURACAO'
      Visible = False
      Size = 10
    end
  end
  object cdsOutroDado: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IDOUTRODADO'
        DataType = ftFloat
      end
      item
        Name = 'IDIMOVEL'
        DataType = ftFloat
      end
      item
        Name = 'ODIVALOR'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'IDOUTRODADOXIMOVEL'
        DataType = ftFloat
      end
      item
        Name = 'IDOUTRODADO_1'
        DataType = ftFloat
      end
      item
        Name = 'ODODESCRICAO'
        DataType = ftString
        Size = 40
      end>
    IndexDefs = <>
    IndexFieldNames = 'ODODESCRICAO'
    Params = <>
    StoreDefs = True
    Left = 572
    Top = 44
    object cdsOutroDadoODODESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 52
      FieldName = 'ODODESCRICAO'
      Size = 40
    end
    object cdsOutroDadoODIVALOR: TStringField
      DisplayLabel = 'Valor'
      DisplayWidth = 48
      FieldName = 'ODIVALOR'
      Size = 60
    end
    object cdsOutroDadoIDIMOVEL: TFloatField
      DisplayWidth = 10
      FieldName = 'IDIMOVEL'
      Visible = False
    end
    object cdsOutroDadoIDOUTRODADO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDOUTRODADO'
      Visible = False
    end
    object cdsOutroDadoIDOUTRODADOXIMOVEL: TFloatField
      FieldName = 'IDOUTRODADOXIMOVEL'
    end
  end
  object cdsDesmembra: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'DMRDATA'
        DataType = ftDateTime
      end
      item
        Name = 'IDIMOVELINI'
        DataType = ftFloat
      end
      item
        Name = 'IDIMOVELFIM'
        DataType = ftFloat
      end
      item
        Name = 'DMRPERCENT'
        DataType = ftFloat
      end
      item
        Name = 'PERC_ACUM'
        DataType = ftFloat
      end
      item
        Name = 'NOME_IMOVEL'
        Attributes = [faFixed]
        DataType = ftString
        Size = 60
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 836
    Top = 9
    object cdsDesmembraDMRDATA: TDateTimeField
      DisplayLabel = 'Data'
      DisplayWidth = 10
      FieldName = 'DMRDATA'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsDesmembraNOME_IMOVEL: TStringField
      DisplayLabel = 'Nome Imóvel'
      DisplayWidth = 57
      FieldName = 'NOME_IMOVEL'
      FixedChar = True
      Size = 60
    end
    object cdsDesmembraDMRPERCENT: TFloatField
      DisplayLabel = '% Desmembrado'
      DisplayWidth = 14
      FieldName = 'DMRPERCENT'
      DisplayFormat = '##0.00 %'
    end
    object cdsDesmembraPERC_ACUM: TFloatField
      DisplayLabel = 'Fator s/ Imovel Atual'
      DisplayWidth = 18
      FieldName = 'PERC_ACUM'
    end
    object cdsDesmembraIDIMOVELINI: TFloatField
      DisplayWidth = 10
      FieldName = 'IDIMOVELINI'
      Visible = False
    end
    object cdsDesmembraIDIMOVELFIM: TFloatField
      DisplayWidth = 10
      FieldName = 'IDIMOVELFIM'
      Visible = False
    end
  end
  object dsDesmembra: TwwDataSource
    AutoEdit = False
    DataSet = cdsDesmembra
    Left = 836
    Top = 22
  end
  object cdsComplemento: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 702
    Top = 314
    object cdsComplementoODODESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 40
      FieldName = 'ODODESCRICAO'
      Size = 40
    end
    object cdsComplementoIDOUTRODADO: TFloatField
      FieldName = 'IDOUTRODADO'
      Visible = False
    end
  end
  object cdsLookIndicador: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 703
    Top = 328
    object StringField1: TStringField
      DisplayLabel = 'Indicador'
      DisplayWidth = 60
      FieldName = 'INMDESCRICAO'
      Size = 60
    end
    object FloatField1: TFloatField
      DisplayWidth = 10
      FieldName = 'IDINDICADORIMOVEL'
      Visible = False
    end
    object StringField2: TStringField
      DisplayWidth = 1
      FieldName = 'FLGTIPOVALOR'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object StringField3: TStringField
      DisplayWidth = 1
      FieldName = 'RECPAG'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object CdsIndicadorFLGUNIDAUT: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGUNIDAUT'
      Visible = False
    end
    object cdsLookIndicadorDSC_TIPOVALOR: TStringField
      FieldName = 'DSC_TIPOVALOR'
      Size = 12
    end
    object cdsLookIndicadorDSC_RECPAG: TStringField
      FieldName = 'DSC_RECPAG'
      Size = 10
    end
  end
  object cdsCidade: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 702
    Top = 341
    object cdsCidadeNOME: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 50
      FieldName = 'NOME'
      Size = 50
    end
    object cdsCidadeIDCIDADES: TFloatField
      FieldName = 'IDCIDADES'
      Visible = False
    end
  end
  object qryBuscaCidade: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDCIDADES'
      '   FROM CIDADES'
      '  WHERE TRIM(LOWER(UF)) = :PUF'
      '    AND ( TRIM(LOWER(NOME)) = :PCIDADE'
      '          OR (TRIM(LOWER(NOME)) = :PCIDADE2)'
      '          OR (TRIM(LOWER(NOME)) = :PCIDADE3)'
      '         )'
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 637
    Top = 248
    ParamData = <
      item
        DataType = ftString
        Name = 'PUF'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PCIDADE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PCIDADE2'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PCIDADE3'
        ParamType = ptUnknown
      end>
    object qryBuscaCidadeIDCIDADES: TFloatField
      FieldName = 'IDCIDADES'
      Origin = 'BASEDADOS.CIDADES.IDCIDADES'
    end
  end
  object qryUpdCidade: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE IMOVEL'
      '       SET IDCIDADES = :PIDCIDADES'
      'WHERE IDIMOVEL = :PIDIMOVEL')
    ValidateWithMask = True
    Left = 637
    Top = 258
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCIDADES'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVEL'
        ParamType = ptUnknown
      end>
    object FloatField2: TFloatField
      FieldName = 'IDCIDADES'
      Origin = 'BASEDADOS.CIDADES.IDCIDADES'
    end
  end
  object qryLimpaCidades: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE IMOVEL  SET IDCIDADES = NULL')
    ValidateWithMask = True
    Left = 637
    Top = 271
    object FloatField3: TFloatField
      FieldName = 'IDCIDADES'
      Origin = 'BASEDADOS.CIDADES.IDCIDADES'
    end
  end
  object dsPlanoPatro: TwwDataSource
    AutoEdit = False
    DataSet = cdsPlanoPatro
    Left = 465
    Top = 187
  end
  object cdsPlanoPatro: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IDIMOVEL'
        DataType = ftFloat
      end
      item
        Name = 'IDPATRO'
        DataType = ftFloat
      end
      item
        Name = 'IDPLANOPREV'
        DataType = ftFloat
      end
      item
        Name = 'PPIPERCENTRATEIO'
        DataType = ftFloat
      end
      item
        Name = 'FLGTIPO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'NOME_PATRO'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'NOME_PLANO'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'DESCR_FLGTIPO'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'DATAVIGENCIA'
        DataType = ftDateTime
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 465
    Top = 200
    object cdsPlanoPatroNOME_PLANO: TStringField
      DisplayLabel = 'Plano Previdenciário'
      DisplayWidth = 45
      FieldName = 'NOME_PLANO'
      Size = 50
    end
    object cdsPlanoPatroNOME_PATRO: TStringField
      DisplayLabel = 'Patrocinadora'
      DisplayWidth = 25
      FieldName = 'NOME_PATRO'
      Size = 60
    end
    object cdsPlanoPatroPPIPERCENTRATEIO: TFloatField
      DisplayLabel = 'Percentual'
      DisplayWidth = 20
      FieldName = 'PPIPERCENTRATEIO'
    end
    object cdsPlanoPatroDATAVIGENCIA: TDateTimeField
      DisplayLabel = 'Data Vigência'
      DisplayWidth = 12
      FieldName = 'DATAVIGENCIA'
      Visible = False
    end
    object cdsPlanoPatroIDIMOVEL: TFloatField
      DisplayWidth = 10
      FieldName = 'IDIMOVEL'
      Visible = False
    end
    object cdsPlanoPatroIDPATRO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPATRO'
      Visible = False
    end
    object cdsPlanoPatroIDPLANOPREV: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPLANOPREV'
      Visible = False
    end
    object cdsPlanoPatroFLGTIPO: TStringField
      DisplayWidth = 1
      FieldName = 'FLGTIPO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object cdsPlanoPatroDESCR_FLGTIPO: TStringField
      DisplayWidth = 10
      FieldName = 'DESCR_FLGTIPO'
      Visible = False
      Size = 10
    end
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = Query2
    Constraints = True
    Left = 558
    Top = 355
  end
  object cdsPlano: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 702
    Top = 356
    Data = {
      280100009619E0BD010000001800000005000400000003000000B3000B494450
      4C414E4F505245560800040000000000044E4F4D450100490000000100055749
      4454480200020032000C434F444F5243414D454E544F01004900000001000557
      494454480200020002000E5349474C414F5243414D454E544F01004900000001
      00055749445448020002000A0006434F44535043010049000000010005574944
      5448020002000A000100044C4349440400010009080000005001000000000000
      08401250545220313020505245564944454E4349410050010000000000002C40
      0B504C414E4F205054522031005001000000000080404017504C414E4F205054
      52203120505245564944454E4349410050010000000000804840114D4F44454C
      4F2042454E45464943494F53}
    object cdsPlanoNOME: TStringField
      DisplayWidth = 50
      FieldName = 'NOME'
      Size = 50
    end
    object cdsPlanoIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Visible = False
    end
  end
  object cdsPatro: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 702
    Top = 372
    Data = {
      460100009619E0BD010000001800000002000E00000003000000510008494450
      4553534F410800040000000000044E4F4D450100490000000100055749445448
      020002003C000100044C43494404000100090800000000000000000000F03F05
      5054522032000000000000000000400F46554E4441C7C34F204D4F44454C4F00
      0000000000000008400550545220330000000000000000104005505452203400
      000000000000C05B4005505452203600000000000010F6304105505452203500
      000000000039F630410A50545220313131313520000000000000BCF630410950
      5452203131313136000000000000C6F6304103464341000000000000CAF63041
      03465341000000000000D0F6304103465443000000000000D2F630410343464E
      000000000000488232410850545220313131310000000000000E6637410C4241
      4E434F204D4F44454C4F}
    object cdsPatroIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object cdsPatroNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
  end
  object cdsDaiea: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 703
    Top = 384
    Data = {
      600000009619E0BD01000000180000000200000000000300000060000D494443
      4152544549524153504308000400000000000E44455343415254454952415350
      430100490000000100055749445448020002003C000100044C43494404000100
      09080000}
    object cdsDaieaIDCARTEIRASPC: TFloatField
      FieldName = 'IDCARTEIRASPC'
    end
    object cdsDaieaDESCARTEIRASPC: TStringField
      FieldName = 'DESCARTEIRASPC'
      Size = 60
    end
  end
  object cdsImagensXImoveis: TCMClientDataSet
    Aggregates = <>
    IndexFieldNames = 'DESCRIMAGEM'
    Params = <>
    AfterScroll = cdsImagensXImoveisAfterScroll
    Left = 557
    Top = 373
    object cdsImagensXImoveisDESCRIMAGEM: TStringField
      DisplayLabel = 'Descrição da Imagem'
      DisplayWidth = 46
      FieldName = 'DESCRIMAGEM'
      Size = 50
    end
    object cdsImagensXImoveisIDIMAGEM: TFloatField
      DisplayWidth = 10
      FieldName = 'IDIMAGEM'
      Visible = False
    end
    object cdsImagensXImoveisIMAGEM: TBlobField
      DisplayWidth = 10
      FieldName = 'IMAGEM'
      Visible = False
      BlobType = ftBlob
      Size = 1
    end
    object cdsImagensXImoveisIDIMOVEL: TFloatField
      DisplayWidth = 10
      FieldName = 'IDIMOVEL'
      Visible = False
    end
  end
  object dsImagensXImoveis: TDataSource
    AutoEdit = False
    DataSet = cdsImagensXImoveis
    Left = 557
    Top = 385
  end
  object opdImagem: TOpenPictureDialog
    Filter = 'Bitmaps (*.bmp); Jpeg(*.jpg)|*.bmp; *.jpg'
    Left = 558
    Top = 396
  end
  object CMSqlParams2: TCMSqlParams
    SQL.Strings = (
      'SELECT E.IDEVENTOIMOVEL, E.IDIMOVEL,       E.IDCONTRATOIMOVEL,'
      '       E.IDUSUARIO,      E.IDCONTRATOLOJA, E.EVIDATAPROX,'
      '       E.EVICABECALHO,   E.EVIDESCRICAO,   E.EVIDATA,'
      '       E.FLGTIPOEVENTO,  E.EVIPERCENT,     E.EVIINDICEREAJUSTE,'
      '       E.EVIVLRANTERIOR, E.EVIVLRAJUSTADO, E.CODDOCUMENTO,'
      '       E.FLGAVISO,       E.DIASAVISO,'
      
        '       RTRIM(U.NOMEUSUARIO)||'#39#39' - '#39#39'||PU.NOME AS USUARIO_EXTENSO' +
        ','
      '       M.MOESIGLA AS DSC_INDICE,'
      '       U.NOMEUSUARIO, E.NUMPROCESSO'
      'FROM EVENTOIMOVEL E,'
      '     PESSOA PU,'
      '     USUARIOSISTEMA U,'
      '     MOEDA M'
      'WHERE E.EVIINDICEREAJUSTE = M.MOECODIGO(+)'
      '  AND E.IDUSUARIO = U.IDUSUARIO(+)'
      '  AND U.IDUSUARIO = PU.IDPESSOA(+)'
      ''
      '  and 1=2'
      'ORDER BY E.EVIDATA')
    Left = 768
    Top = 8
  end
  object sqlIndicador: TCMSqlParams
    SQL.Strings = (
      
        'SELECT IA.IDDOCUMENTO, IA.OBSERVACAO, IA.IDINDICADORXAPUR, IA.ID' +
        'IMOVEL, IA.IDUNIDAUT,'
      
        '       IA.MESCOMPETENCIA, IA.ANOCOMPETENCIA, IA.VLRAPURADO, IA.D' +
        'ATAAPURADO, IA.FLGPREVREAL,'
      
        '       IA.IDINDICADORIMOVEL, IA.FLGTIPOAPURACAO, I.INMDESCRICAO,' +
        ' I.FLGTIPOVALOR, I.RECPAG,'
      
        '       DECODE(I.FLGTIPOVALOR,'#39'M'#39','#39'Monet'#39','#39'P'#39','#39'Percent'#39','#39'Quant'#39') ' +
        ' AS DSC_TIPOVALOR,'
      
        '       DECODE(I.RECPAG,'#39'R'#39','#39'Receita'#39','#39'D'#39','#39'Despesa'#39','#39'Desempenho'#39')' +
        ' AS DSC_RECPAG,'
      
        '       DECODE(IA.FLGPREVREAL,'#39'P'#39','#39'Previsto'#39','#39'Realizado'#39')        ' +
        ' AS DSC_PREVREAL,'
      
        '       DECODE(IA.FLGTIPOAPURACAO,'#39'A'#39','#39'Automático'#39','#39'Manual'#39')     ' +
        ' AS DSC_TIPOAPURACAO'
      'FROM INDICADORXAPUR IA, INDICADORIMOVEL I'
      'WHERE IA.IDINDICADORIMOVEL = I.IDINDICADORIMOVEL'
      'ORDER BY I.INMDESCRICAO, IA.ANOCOMPETENCIA, IA.MESCOMPETENCIA')
    ClientDataSet = cdsIndicador
    Left = 711
    Top = 30
  end
  object CMSqlParams1: TCMSqlParams
    SQL.Strings = (
      
        'SELECT PERCENTUAL,                                              ' +
        '                        '
      
        '                 VIGENCIA_INICIO,                               ' +
        '                                 '
      
        '                 VIGENCIA_FIM,                                  ' +
        '                                   '
      
        '                 FLGATIVO,                                      ' +
        '                                 '
      
        '                 DECODE(FLGATIVO, '#39'S'#39', '#39'Vigência atual'#39', '#39'Vigênc' +
        'ia anterior'#39') AS FLGATIVO_S'
      
        '            FROM PROVISAOIMOVEL                                 ' +
        '                                  '
      
        '          WHERE IDIMOVEL = -1                                   ' +
        '           '
      ' ORDER BY VIGENCIA_INICIO DESC       ')
    Left = 848
    Top = 48
  end
  object dsPlanoPatroxVigenciaImob: TwwDataSource
    AutoEdit = False
    DataSet = cdsPlanoPatroxVigenciaImob
    Left = 561
    Top = 199
  end
  object cdsPlanoPatroxVigenciaImob: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IDPLANOPATROXVIGENCIAIMOB'
        DataType = ftFloat
      end
      item
        Name = 'IDIMOVEL'
        DataType = ftFloat
      end
      item
        Name = 'DATAVIGENCIA'
        DataType = ftDateTime
      end
      item
        Name = 'IDPLANOPREV'
        DataType = ftFloat
      end
      item
        Name = 'NOMEPLANO'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'IDPATRO'
        DataType = ftFloat
      end
      item
        Name = 'NOMEPATRO'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'PERCENTRATEIO'
        DataType = ftFloat
      end
      item
        Name = 'TRGDTINCLUSAO'
        DataType = ftDateTime
      end
      item
        Name = 'TRGUSERINCLUSAO'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'NOMEUSUARIO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    StoreDefs = True
    Left = 561
    Top = 186
    object cdsPlanoPatroxVigenciaImobDATAVIGENCIA: TDateTimeField
      DisplayLabel = 'Data Vigência'
      DisplayWidth = 12
      FieldName = 'DATAVIGENCIA'
    end
    object cdsPlanoPatroxVigenciaImobNOMEPLANO: TStringField
      DisplayLabel = 'Plano Previdenciário'
      DisplayWidth = 40
      FieldName = 'NOMEPLANO'
      Size = 50
    end
    object cdsPlanoPatroxVigenciaImobNOMEPATRO: TStringField
      DisplayLabel = 'Patrocinadora'
      DisplayWidth = 15
      FieldName = 'NOMEPATRO'
      Size = 60
    end
    object cdsPlanoPatroxVigenciaImobPERCENTRATEIO: TFloatField
      DisplayLabel = 'Percentual'
      DisplayWidth = 10
      FieldName = 'PERCENTRATEIO'
    end
    object cdsPlanoPatroxVigenciaImobNOMEUSUARIO: TStringField
      DisplayLabel = 'Responsável'
      DisplayWidth = 22
      FieldName = 'NOMEUSUARIO'
      FixedChar = True
      Size = 1
    end
    object cdsPlanoPatroxVigenciaImobIDIMOVEL: TFloatField
      DisplayWidth = 10
      FieldName = 'IDIMOVEL'
      Visible = False
    end
    object cdsPlanoPatroxVigenciaImobIDPLANOPREV: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPLANOPREV'
      Visible = False
    end
    object cdsPlanoPatroxVigenciaImobIDPATRO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPATRO'
      Visible = False
    end
    object cdsPlanoPatroxVigenciaImobTRGDTINCLUSAO: TDateTimeField
      DisplayWidth = 18
      FieldName = 'TRGDTINCLUSAO'
      Visible = False
    end
    object cdsPlanoPatroxVigenciaImobTRGUSERINCLUSAO: TStringField
      DisplayWidth = 30
      FieldName = 'TRGUSERINCLUSAO'
      Visible = False
      Size = 30
    end
    object cdsPlanoPatroxVigenciaImobIDPLANOPATROXVIGENCIAIMOB: TFloatField
      FieldName = 'IDPLANOPATROXVIGENCIAIMOB'
      Visible = False
    end
  end
  object Query1: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '/*'
      
        'SELECT PI.IDIMOVEL, PI.IDPATRO, PI.IDPLANOPREV, PI.PPIPERCENTRAT' +
        'EIO,'
      '       PI.FLGTIPO, P.NOME AS NOME_PATRO, PL.NOME AS NOME_PLANO,'
      
        '       DECODE(PI.FLGTIPO,'#39'P'#39','#39'PERCENTUAL'#39','#39'COTAS'#39') AS DESCR_FLGT' +
        'IPO'
      '  FROM PLANOPATROXIMOVEL PI, PESSOA P, PLANPREVCONTABIL PL'
      ' WHERE PI.IDPATRO  = P.IDPESSOA'
      '   AND PI.IDPLANOPREV = PL.IDPLANOPREV'
      '   AND 1 = 2'
      ' ORDER BY NOME_PATRO, NOME_PLANO'
      '*/'
      ''
      '/*'
      'SELECT II.IDIMAGEM, II.IMAGEM, II.DESCRIMAGEM, IM.IDIMOVEL'
      '  FROM IMAGENS II, IMAGENSXIMOVEIS IM'
      ' WHERE II.IDIMAGEM = IM.IDIMAGEM'
      ''
      ''
      'SELECT *'
      '  FROM IMAGENSXIMOVEIS'
      ' WHERE 1=2'
      ''
      ''
      'SELECT IDCARTEIRASPC, DESCARTEIRASPC'
      '  FROM CARTEIRASPC'
      ' WHERE CODSEGMENTO = 3'
      ''
      ''
      
        'SELECT I.IDIMOVELMESTRE,  I.IDIMOVEL,        I.IDCIDADES,       ' +
        '  I.CODSUBCONTA,'
      
        '       I.IDPESSOA,        I.IDMARCA,         I.IMOCEP,          ' +
        '  I.IMOBAIRRO,'
      
        '       I.IDADMINIMOVEL,   I.FLGTIPOIMOVEL,   I.IMODATACONSTRUCAO' +
        ', I.IMOAREA,'
      
        '       I.IMOFRACAOIDEAL,  I.IMODESCRICAO,    I.FLGSTATUSOCUPACAO' +
        ', I.QTDETOTALCOTAS,'
      
        '       I.IMONOME,         I.IMOLOGRADOURO,   I.IMONUMERO,       ' +
        '  I.IMOCOMPLEMENTO,'
      
        '       I.IMONOMEENDERECO, CI.IDESTADO,       CI.IDPAIS,         ' +
        '  I.IMOAREATOTAL,'
      
        '       I.CODTIPIMOVEL,    I.FLGATIVO,        I.IMOPERCENTRATEIO,' +
        '  I.CODIMOVELSPC,'
      
        '       I.IMOMOEDACOMPRA,  I.IMOVLRCOMPRA,    I.IMODATACOMPRA,   ' +
        '  I.IMOMATRICULA,'
      
        '       I.IMOOBSERVACAO,   I.IMODATAHABITESE, I.IDCARTORIO,      ' +
        '  I.FLGSTATUS,'
      
        '       I.IMOCODIGO,       I.IMOAREAGERENCIAL,I.FLGCATIMOVEL,    ' +
        '  I.IMOVLRREAVAL,'
      
        '       I.IMODATAREAVAL,   I.IMOVLRMERCADO,   I.IMODATAMERCADO,  ' +
        '  I.IMOMOEDAREAVAL,'
      
        '       I.IMOMOEDAMERCADO, I.IDRESPONSAVEL,   I.IMOVAGAS,        ' +
        '  I.IMOAREACOMUM,'
      '       I.IDCARTEIRASPC,'
      
        '       IM.IMONOME || '#39' - '#39' || I.IMONOME AS IMOVEL_EXTENSO, I.IMO' +
        'CIDADE, I.CODESTADO,'
      '       IM.IMONOME        AS DSC_MESTRE,'
      '       A.NOME            AS DSC_ADMINISTRADORA,'
      '       C.NOME            AS DSC_CARTORIO,'
      '       TI.DESCTIPOIMOVEL AS DSC_TIPOIMOVEL'
      '  FROM IMOVEL I,'
      '       IMOVEL IM,'
      '       TIPOIMOVEL TI,'
      '       CIDADES CI,'
      '       ADMINIMOVEL AM, PESSOA A,'
      '       CARTORIO    CA, PESSOA C'
      ' WHERE I.IDIMOVELMESTRE = IM.IDIMOVEL(+)'
      '   AND I.CODTIPIMOVEL   = TI.CODTIPIMOVEL(+)'
      '   AND I.IDCIDADES      = CI.IDCIDADES(+)'
      '   AND I.IDADMINIMOVEL  = AM.IDADMINIMOVEL(+)'
      '   AND AM.IDADMINIMOVEL = A.IDPESSOA(+)'
      '   AND I.IDCARTORIO     = CA.IDCARTORIO(+)'
      '   AND CA.IDCARTORIO    = C.IDPESSOA(+)'
      '   AND 1=2'
      ''
      ''
      ' SELECT * FROM PLANPREVCONTABIL'
      ''
      ''
      'select P.IDPESSOA, P.NOME'
      '  FROM PESSOA P, PATRO PT'
      ' WHERE PT.IDPESSOA = P.IDPESSOA'
      ''
      ''
      'SELECT E.IDEVENTOIMOVEL, E.IDIMOVEL,       E.IDCONTRATOIMOVEL,'
      '       E.IDUSUARIO,      E.IDCONTRATOLOJA, E.CODDOCUMENTO,'
      '       E.FLGAVISO,       E.DIASAVISO,'
      '       E.EVICABECALHO,   E.EVIDESCRICAO,   E.EVIDATA,'
      '       E.FLGTIPOEVENTO,  E.EVIPERCENT,     E.EVIINDICEREAJUSTE,'
      '       E.EVIVLRANTERIOR, E.EVIVLRAJUSTADO, E.EVIDATAPROX,'
      '       RTRIM(U.NOMEUSUARIO)||'#39' - '#39'||PU.NOME AS USUARIO_EXTENSO,'
      '       M.MOESIGLA AS DSC_INDICE'
      '  FROM EVENTOIMOVEL E,'
      '       PESSOA PU,'
      '       USUARIOSISTEMA U,'
      '       MOEDA M'
      ' WHERE E.EVIINDICEREAJUSTE = M.MOECODIGO(+)'
      '   AND E.IDUSUARIO = U.IDUSUARIO(+)'
      '   AND U.IDUSUARIO = PU.IDPESSOA(+)'
      ' AND E.IDCONTRATOIMOVEL = 274'
      ' ORDER BY E.EVIDATA'
      ''
      ''
      
        'SELECT I.IDINDICADORIMOVEL, I.INMDESCRICAO, I.FLGTIPOVALOR, I.RE' +
        'CPAG, I.FLGUNIDAUT, I.CODINTERNO,'
      
        '       DECODE(I.FLGTIPOVALOR,'#39'M'#39','#39'Monetário'#39','#39'P'#39','#39'Percentual'#39','#39'Q' +
        'uantitativo'#39') AS DSC_TIPOVALOR,'
      
        '       DECODE(I.RECPAG,'#39'R'#39','#39'Receita'#39','#39'D'#39','#39'Despesa'#39','#39'Desempenho'#39')' +
        ' AS DSC_RECPAG'
      'FROM INDICADORIMOVEL I, INDICADORXTIPOIMO IT'
      'WHERE I.IDINDICADORIMOVEL = IT.IDINDICADORIMOVEL'
      'AND IT.CODTIPIMOVEL = '#39'RENDA'#39
      'ORDER BY I.INMDESCRICAO'
      ' */'
      ''
      '/*'
      
        'SELECT O1.IDOUTRODADO, O1.IDIMOVEL, O1.ODIVALOR, O1.IDOUTRODADOX' +
        'IMOVEL, O1.IDCONTRATOIMOVEL, O2.IDOUTRODADO, O2.ODODESCRICAO, O2' +
        '.ANASINT, O2.CODCOMPL, O2.TIPODADO, O2.OPCOES, O2.FLGORIGEM'
      'FROM OUTRODADOXIMOVEL O1, OUTRODADO O2'
      'WHERE  (O1.IDOUTRODADO = O2.IDOUTRODADO)'
      '*/'
      ''
      ''
      'SELECT HST.IDIMOVEL,'
      '       HST.DATAVIGENCIA,'
      '       HST.IDPLANOPREV,'
      '       PPC.NOME AS NOMEPLANO,'
      '       HST.IDPATRO,'
      '       PES.NOME AS NOMEPATRO,'
      '       HST.PERCSEGREGAIMOV,'
      '       HST.TRGDTINCLUSAO,'
      '       HST.TRGUSERINCLUSAO'
      '  FROM HSTPERCSEGREGAIMOB HST,'
      '       PESSOA PES,'
      '       PLANOPREVCONTABIL PPC'
      ' WHERE HST.IDPATRO  = PES.IDPESSOA'
      '   AND HST.IDPLANOPREV = PPC.IDPLANOPREV'
      '   AND 1 = 2'
      '/*'
      'SELECT PPB.IDPLANOPREV,'
      '       PPB.IDPATRO,'
      '       PPB.IDBEM,'
      '       PPB.IDPESSOA,'
      '       PPB.PPBPERCRATEIO'
      '  FROM PLANOPATROXBEM PPB,'
      '       IMOVELXBEM IXB'
      ' WHERE IXB.IDIMOVEL = :pIDIMOVEL'
      '   AND PPB.IDBEM = IXB.IDBEM(+)'
      ' */'
      ''
      ' /*'
      'SELECT HPB.IDBEM,'
      '       HPB.DATAVIGENCIA,'
      '       HPB.IDPLANOPREV,'
      '       HPB.IDPATRO,'
      '       HPB.PERCSEGREGABEM'
      '  FROM HSTPERCSEGREGABEM HPB,'
      '       IMOVELXBEM IXB'
      ' WHERE IXB.IDIMOVEL = :pIDIMOVEL'
      '   AND HPB.IDBEM = IXB.IDBEM(+)'
      '*/'
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 577
    Top = 313
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pIDIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pIDIMOVEL'
        ParamType = ptUnknown
      end>
  end
  object Query2: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      ''
      'SELECT PPV.IDPLANOPATROXVIGENCIAIMOB,'
      '       PPV.IDIMOVEL,'
      '       PPV.DATAVIGENCIA,'
      '       PPV.IDPLANOPREV,'
      '       PPC.NOME AS NOMEPLANO,'
      '       PPV.IDPATRO,'
      '       PES.NOME AS NOMEPATRO,'
      '       PPV.PERCENTRATEIO,'
      '       PPV.TRGDTINCLUSAO,'
      '       PPV.TRGUSERINCLUSAO,'
      '       '#39' '#39' AS NOMEUSUARIO'
      '  FROM PLANOPATROXVIGENCIAIMOB PPV,'
      '       PESSOA PES,'
      '       PLANPREVCONTABIL PPC'
      ' WHERE PPV.IDPATRO  = PES.IDPESSOA'
      '   AND PPV.IDPLANOPREV = PPC.IDPLANOPREV'
      '   AND 1 = 2'
      ''
      ''
      '/*'
      
        'SELECT PI.IDIMOVEL, PI.IDPATRO, PI.IDPLANOPREV, PI.PPIPERCENTRAT' +
        'EIO,'
      '       PI.FLGTIPO, P.NOME AS NOME_PATRO, PL.NOME AS NOME_PLANO,'
      
        '       DECODE(PI.FLGTIPO,'#39'P'#39','#39'PERCENTUAL'#39','#39'COTAS'#39') AS DESCR_FLGT' +
        'IPO,'
      '       HST.DATAVIGENCIA'
      
        '  FROM PLANOPATROXIMOVEL PI, PESSOA P, PLANPREVCONTABIL PL, HSTP' +
        'ERCSEGREGAIMOB HST'
      ' WHERE PI.IDPATRO  = P.IDPESSOA'
      '   AND PI.IDPLANOPREV = PL.IDPLANOPREV'
      '   AND 1 = 2'
      ' ORDER BY NOME_PATRO, NOME_PLANO'
      '*/'
      ''
      '/*'
      'SELECT DISTINCT PI.IDIMOVEL,'
      '                PI.IDPATRO AS IDPATRO,'
      '                PI.IDPLANOPREV,'
      '                PI.PPIPERCENTRATEIO,'
      '                PI.FLGTIPO,'
      '                P.NOME AS NOME_PATRO,'
      '                PL.NOME AS NOME_PLANO,'
      
        '                DECODE(PI.FLGTIPO, '#39'P'#39', '#39'Percentual'#39', '#39'C'#39', '#39'Cota' +
        's'#39', Null) AS DESCR_FLGTIPO,'
      
        '                TO_DATE(TO_CHAR(SYSDATE, '#39'DD/MM/YYYY'#39'), '#39'DD/MM/Y' +
        'YYY'#39') AS DATAVIGENCIA'
      '  FROM PLANOPATROXIMOVEL  PI,'
      '       PESSOA             P,'
      '       PLANPREVCONTABIL   PL,'
      '       PLANOPATROXVIGENCIAIMOB PPV'
      ' WHERE PI.IDPATRO = P.IDPESSOA'
      '   AND PI.IDPLANOPREV = PL.IDPLANOPREV'
      '   AND 1 = 2'
      ' ORDER BY NOME_PATRO, NOME_PLANO'
      '*/'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 609
    Top = 329
  end
  object cdsHistoricoVidaUtil: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'VIDAUTIL'
        DataType = ftFloat
      end
      item
        Name = 'TXDEP_ANO'
        DataType = ftFloat
      end
      item
        Name = 'TXDEP_MES'
        DataType = ftFloat
      end
      item
        Name = 'VIGENTE'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'TRGDTINCLUSAO'
        DataType = ftDateTime
      end
      item
        Name = 'TRGUSERINCLUSAO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'IDIMOVEL'
        DataType = ftFloat
      end
      item
        Name = 'HIST_EVENTO'
        DataType = ftString
        Size = 30
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 656
    Top = 435
    object cdsHistoricoVidaUtilVIDAUTIL: TFloatField
      FieldName = 'VIDAUTIL'
    end
    object cdsHistoricoVidaUtilTXDEP_ANO: TFloatField
      FieldName = 'TXDEP_ANO'
    end
    object cdsHistoricoVidaUtilTXDEP_MES: TFloatField
      FieldName = 'TXDEP_MES'
    end
    object cdsHistoricoVidaUtilVIGENTE: TStringField
      FieldName = 'VIGENTE'
    end
    object cdsHistoricoVidaUtilTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
    end
    object cdsHistoricoVidaUtilTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
    end
    object cdsHistoricoVidaUtilHistVidaUtilIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
    end
    object cdsHistoricoVidaUtilHIST_EVENTO: TStringField
      FieldName = 'HIST_EVENTO'
    end
  end
  object dsHistoricoVidaUtil: TwwDataSource
    DataSet = cdsHistoricoVidaUtil
    Left = 624
    Top = 440
  end
  object CdsVoto: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 440
    Top = 296
    Data = {
      EE0000009619E0BD010000001800000008000000000003000000EE0004564F54
      4F0100490000000100055749445448020002001400095245534F4C5543414F01
      00490000000100055749445448020002001400045449504F0100490000000100
      0557494454480200020014000B564C524150524F5641444F0800040000000000
      0944455343524943414F010049000000010005574944544802000200FA000849
      44504553534F41080004000000000004464F524E010049000000010005574944
      5448020002003C00124944564F544F47455354414F494D4F56454C0800040000
      0000000100044C4349440400010009080000}
    object CdsVotoVOTO: TStringField
      DisplayLabel = 'Voto'
      DisplayWidth = 20
      FieldName = 'VOTO'
    end
    object CdsVotoRESOLUCAO: TStringField
      DisplayLabel = 'Resolução'
      DisplayWidth = 20
      FieldName = 'RESOLUCAO'
    end
    object CdsVotoFORN: TStringField
      DisplayLabel = 'Fornecedor'
      DisplayWidth = 20
      FieldName = 'FORN'
      Size = 60
    end
    object CdsVotoTIPO: TStringField
      DisplayLabel = 'Tipo de Investimento'
      DisplayWidth = 20
      FieldName = 'TIPO'
      FixedChar = True
      Size = 1
    end
    object CdsVotoVLRAPROVADO: TFloatField
      DisplayLabel = 'Valor Aprovado'
      DisplayWidth = 20
      FieldName = 'VLRAPROVADO'
      DisplayFormat = '###,##0.00'
    end
    object CdsVotoIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Visible = False
    end
    object CdsVotoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Visible = False
      Size = 250
    end
    object CdsVotoIDVOTOGESTAOIMOVEL: TFloatField
      FieldName = 'IDVOTOGESTAOIMOVEL'
      Visible = False
    end
  end
  object dsVoto: TDataSource
    DataSet = CdsVoto
    Left = 440
    Top = 344
  end
  object rptVoto: TppReport
    AutoStop = False
    DataPipeline = ppRelVoto
    PassSetting = psTwoPass
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
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
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
    Left = 392
    Top = 296
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppRelVoto'
    object HeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 73290
      mmPrintPosition = 0
      object Line1: TppLine
        UserName = 'Line1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 68263
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label1'
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 0
        mmTop = 68792
        mmWidth = 6096
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label2'
        Caption = 'Nº Documento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 48948
        mmTop = 69056
        mmWidth = 19315
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label5'
        Caption = 'Saldo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 133086
        mmTop = 68527
        mmWidth = 7673
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label6'
        Caption = 'Status'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 169334
        mmTop = 68792
        mmWidth = 8731
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line3'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 72231
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label15'
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 92604
        mmTop = 68792
        mmWidth = 6879
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        Caption = 'Voto:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 265
        mmTop = 30480
        mmWidth = 7144
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        Caption = 'Descrição:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 265
        mmTop = 40640
        mmWidth = 14552
        BandType = 0
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        Caption = 'Valor aprovado:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 0
        mmTop = 50800
        mmWidth = 21431
        BandType = 0
      end
      object ppLabel19: TppLabel
        UserName = 'Label19'
        Caption = 'Resolução:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 79111
        mmTop = 30480
        mmWidth = 15875
        BandType = 0
      end
      object ppLine3: TppLine
        UserName = 'Line5'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 60590
        mmWidth = 197300
        BandType = 0
      end
      object ppLine4: TppLine
        UserName = 'Line6'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 67204
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel20: TppLabel
        UserName = 'Label20'
        Caption = 'DETALHES'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 0
        mmTop = 61648
        mmWidth = 196586
        BandType = 0
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'VOTO'
        DataPipeline = ppVoto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppVoto'
        mmHeight = 3704
        mmLeft = 10319
        mmTop = 30480
        mmWidth = 49742
        BandType = 0
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'RESOLUCAO'
        DataPipeline = ppVoto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppVoto'
        mmHeight = 3704
        mmLeft = 97367
        mmTop = 30480
        mmWidth = 49742
        BandType = 0
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'DESCRICAO'
        DataPipeline = ppVoto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppVoto'
        mmHeight = 3704
        mmLeft = 15610
        mmTop = 40640
        mmWidth = 49742
        BandType = 0
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'VLRAPROVADO'
        DataPipeline = ppVoto
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppVoto'
        mmHeight = 3704
        mmLeft = 22490
        mmTop = 50800
        mmWidth = 49742
        BandType = 0
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'RAZAOSOCIAL'
        DataPipeline = ppFundacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 5027
        mmLeft = 16933
        mmTop = 2910
        mmWidth = 179917
        BandType = 0
      end
      object pdbmg1: TppDBImage
        UserName = 'pdbmg1'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppFundacao'
        mmHeight = 16933
        mmLeft = 0
        mmTop = 0
        mmWidth = 16404
        BandType = 0
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'BLOCO1'
        DataPipeline = ppFundacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3704
        mmLeft = 16933
        mmTop = 8467
        mmWidth = 179917
        BandType = 0
      end
      object pdbtxt1: TppDBText
        UserName = 'pdbtxt1'
        DataField = 'BLOCO2'
        DataPipeline = ppFundacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3704
        mmLeft = 16933
        mmTop = 12700
        mmWidth = 179917
        BandType = 0
      end
      object lblFornecedor: TppLabel
        UserName = 'Label7'
        Caption = 'Fornecedor:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3439
        mmLeft = 79111
        mmTop = 35719
        mmWidth = 17992
        BandType = 0
      end
      object lblNmFornecedor: TppLabel
        UserName = 'Label8'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3725
        mmLeft = 97366
        mmTop = 35720
        mmWidth = 49699
        BandType = 0
      end
    end
    object DetailBand1: TppDetailBand
      BeforeGenerate = DetailBand1BeforeGenerate
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 3704
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'DATAEMISSAO'
        DataPipeline = ppRelVoto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppRelVoto'
        mmHeight = 3969
        mmLeft = 529
        mmTop = 0
        mmWidth = 34925
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'NODOCUMENTO'
        DataPipeline = ppRelVoto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppRelVoto'
        mmHeight = 3969
        mmLeft = 48419
        mmTop = 0
        mmWidth = 34925
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'VALOR'
        DataPipeline = ppRelVoto
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppRelVoto'
        mmHeight = 3969
        mmLeft = 91811
        mmTop = 0
        mmWidth = 34925
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'STATUS'
        DataPipeline = ppRelVoto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppRelVoto'
        mmHeight = 3969
        mmLeft = 168805
        mmTop = 0
        mmWidth = 26723
        BandType = 4
      end
      object lblSaldo: TppLabel
        UserName = 'lblSaldo'
        Caption = 'lblSaldo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3302
        mmLeft = 132821
        mmTop = 265
        mmWidth = 9567
        BandType = 4
      end
    end
    object FooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object Calc2: TppSystemVariable
        UserName = 'Calc2'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 153723
        mmTop = 1323
        mmWidth = 42069
        BandType = 8
      end
      object ppLabel5: TppLabel
        UserName = 'Label3'
        Caption = 'Emissão:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 265
        mmTop = 794
        mmWidth = 12700
        BandType = 8
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        VarType = vtPrintDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 14288
        mmTop = 794
        mmWidth = 25929
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      BeforeGenerate = ppSummaryBand1BeforeGenerate
      mmBottomOffset = 0
      mmHeight = 15610
      mmPrintPosition = 0
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Saldo Final:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 115623
        mmTop = 6879
        mmWidth = 16140
        BandType = 7
      end
      object lblSaldoFinal: TppLabel
        UserName = 'lblSaldoFinal'
        Caption = 'lblSaldoFinal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 132557
        mmTop = 6879
        mmWidth = 38100
        BandType = 7
      end
    end
    object raCodeModule1: TraCodeModule
      ProgramStream = {
        01060F5472614576656E7448616E646C65720B50726F6772616D4E616D650611
        5265706F72744265666F72655072696E740B50726F6772616D54797065070B74
        7450726F63656475726506536F75726365062D70726F63656475726520526570
        6F72744265666F72655072696E743B0D0A626567696E0D0A0D0A656E643B0D0A
        0D436F6D706F6E656E744E616D6506065265706F7274094576656E744E616D65
        060B4265666F72655072696E74074576656E74494402010000}
    end
    object ppParameterList1: TppParameterList
    end
  end
  object ppRelVoto: TppBDEPipeline
    DataSource = dsRelVoto
    UserName = 'RelVoto'
    Left = 393
    Top = 344
    object ppRelVotoppField1: TppField
      FieldAlias = 'NODOCUMENTO'
      FieldName = 'NODOCUMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppRelVotoppField2: TppField
      FieldAlias = 'STATUS'
      FieldName = 'STATUS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppRelVotoppField3: TppField
      FieldAlias = 'NUMAPGR'
      FieldName = 'NUMAPGR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppRelVotoppField4: TppField
      FieldAlias = 'DATAEMISSAO'
      FieldName = 'DATAEMISSAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppRelVotoppField5: TppField
      FieldAlias = 'RECPAG'
      FieldName = 'RECPAG'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppRelVotoppField6: TppField
      FieldAlias = 'VALOR'
      FieldName = 'VALOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
  end
  object qryRelVoto: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT NODOCUMENTO,'
      '       STATUS,'
      '       NUMAPGR,'
      '       DATAEMISSAO,'
      '       RECPAG,'
      '       VALOR,'
      
        '       SUM(SUM(VALOR)) OVER(ORDER BY NODOCUMENTO ROWS BETWEEN UN' +
        'BOUNDED PRECEDING AND CURRENT ROW) AS VALORACUMULADO'
      '  from (SELECT DOC.NODOCUMENTO,'
      '               case DOC.STATUS'
      '                 when '#39'0'#39' then'
      '                  '#39'Aberto'#39
      '                 when '#39'1'#39' then'
      '                  '#39'Cobrança emitida'#39
      '                 when '#39'2'#39' then'
      '                  '#39'Recebido/Pago'#39
      '               end STATUS,'
      '               DOC.NUMAPGR,'
      '               DOC.DATAEMISSAO,'
      '               DOC.RECPAG,'
      '               CASE'
      '                 WHEN DOC.RECPAG = '#39'P'#39' THEN'
      
        '                  SUM(DECODE(LD.DEBCRE, '#39'C'#39', LD.VALOR, (LD.VALOR' +
        ' * -1)))'
      '                 ELSE'
      
        '                  SUM(DECODE(LD.DEBCRE, '#39'D'#39', LD.VALOR, (LD.VALOR' +
        ' * -1)))'
      '               END VALOR'
      '          FROM DOCUMENTO DOC, LANCTODOCUM LD, DOCUMENTOXVOTO DV'
      '         WHERE DOC.CODDOCUMENTO = LD.CODDOCUMENTO'
      '           AND DOC.CODDOCUMENTO = DV.CODDOCUMENTO'
      '           AND LD.OPERACAO <> 5'
      '           AND DV.IDVOTOGESTAOIMOVEL =  :IDVOTOGESTAOIMOVEL'
      '         group by DOC.NODOCUMENTO,'
      '                  DOC.STATUS,'
      '                  DOC.NUMAPGR,'
      '                  DOC.DATAEMISSAO,'
      '                  DOC.RECPAG) T'
      
        ' group by NODOCUMENTO, STATUS, NUMAPGR, DATAEMISSAO, RECPAG, VAL' +
        'OR')
    ValidateWithMask = True
    Left = 345
    Top = 345
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDVOTOGESTAOIMOVEL'
        ParamType = ptUnknown
      end>
    object qryRelVotoNODOCUMENTO: TFloatField
      FieldName = 'NODOCUMENTO'
    end
    object qryRelVotoSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 16
    end
    object qryRelVotoNUMAPGR: TFloatField
      FieldName = 'NUMAPGR'
    end
    object qryRelVotoDATAEMISSAO: TDateTimeField
      FieldName = 'DATAEMISSAO'
    end
    object qryRelVotoRECPAG: TStringField
      FieldName = 'RECPAG'
      FixedChar = True
      Size = 1
    end
    object qryRelVotoVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object qryRelVotoVALORACUMULADO: TFloatField
      FieldName = 'VALORACUMULADO'
    end
  end
  object dsRelVoto: TDataSource
    DataSet = qryRelVoto
    Left = 344
    Top = 296
  end
  object ppFundacao: TppBDEPipeline
    DataSource = dsFundacao
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'Fundacao'
    Left = 246
    Top = 343
    object ppFundacaoppField2: TppField
      FieldAlias = 'RAZAOSOCIAL'
      FieldName = 'RAZAOSOCIAL'
      FieldLength = 60
      DisplayWidth = 60
      Position = 0
    end
    object ppFundacaoppField3: TppField
      FieldAlias = 'BLOCO1'
      FieldName = 'BLOCO1'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object ppFundacaoppField4: TppField
      FieldAlias = 'BLOCO2'
      FieldName = 'BLOCO2'
      FieldLength = 8
      DisplayWidth = 60
      Position = 2
    end
    object ppFundacaoppField10: TppField
      FieldAlias = 'IMAGEM'
      FieldName = 'IMAGEM'
      FieldLength = 1
      DataType = dtBLOB
      DisplayWidth = 10
      Position = 3
      Searchable = False
      Sortable = False
    end
  end
  object dsFundacao: TwwDataSource
    DataSet = qryFundacao
    Left = 294
    Top = 343
  end
  object qryFundacao: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT'
      '       P.RAZAOSOCIAL,'
      '       I.IMAGEM,'
      '       E.NOME AS BLOCO1,'
      
        '       C.NOME || '#39' '#39' || C.CODESTADO || '#39' CEP '#39' || E.CEP || '#39' - (' +
        #39' ||'
      
        '       TRIM(T.DDD) || '#39')'#39' || T.NUMERO || '#39' - '#39' || P.HOMEPAGE AS ' +
        'BLOCO2'
      '  FROM PESSOA     P,'
      '       ENDPESS    E,'
      '       IMAGENS    I,'
      '       CIDADES    C,'
      '       TELENDPESS T'
      ' WHERE (P.IDPESSOA = 1)'
      '   AND (E.IDPESSOA(+) = P.IDPESSOA)'
      '   AND (E.IDCIDADES = C.IDCIDADES(+))'
      '   AND (I.IDIMAGEM(+) = P.IDIMAGEM)'
      '   AND (E.IDENDERECO = T.IDENDERECO(+))'
      '   AND (T.TIPO = '#39'C'#39')')
    ValidateWithMask = True
    Left = 294
    Top = 295
    object qryFundacaoBLOCO1: TStringField
      FieldName = 'BLOCO1'
      Size = 40
    end
    object qryFundacaoBLOCO2: TMemoField
      FieldName = 'BLOCO2'
      BlobType = ftMemo
      Size = 350
    end
    object qryFundacaoIMAGEM: TBlobField
      FieldName = 'IMAGEM'
      BlobType = ftBlob
      Size = 1
    end
    object qryFundacaoRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Size = 60
    end
  end
  object ppVoto: TppBDEPipeline
    DataSource = dsVoto
    UserName = 'Voto'
    Left = 441
    Top = 257
    object ppVotoppField11: TppField
      FieldAlias = 'VOTO'
      FieldName = 'VOTO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 0
    end
    object ppVotoppField12: TppField
      FieldAlias = 'RESOLUCAO'
      FieldName = 'RESOLUCAO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 1
    end
    object ppVotoppField13: TppField
      FieldAlias = 'FORN'
      FieldName = 'FORN'
      FieldLength = 60
      DisplayWidth = 20
      Position = 2
    end
    object ppVotoppField14: TppField
      FieldAlias = 'TIPO'
      FieldName = 'TIPO'
      FieldLength = 1
      DisplayWidth = 20
      Position = 3
    end
    object ppVotoppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRAPROVADO'
      FieldName = 'VLRAPROVADO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 20
      Position = 4
    end
    object ppVotoppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPESSOA'
      FieldName = 'IDPESSOA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object ppVotoppField17: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 250
      DisplayWidth = 250
      Position = 6
    end
    object ppVotoppField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDVOTOGESTAOIMOVEL'
      FieldName = 'IDVOTOGESTAOIMOVEL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
  end
  object cdsProvisaoImovel: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 201
    Top = 209
    object cdsProvisaoImovelIDPROVISAOIMOVEL: TFloatField
      FieldName = 'IDPROVISAOIMOVEL'
      Visible = False
    end
    object cdsProvisaoImovelIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
      Visible = False
    end
    object cdsProvisaoImovelPERCENTUAL: TFloatField
      DisplayLabel = 'Percentual de provisão'
      DisplayWidth = 15
      FieldName = 'PERCENTUAL'
    end
    object cdsProvisaoImovelVIGENCIA_INICIO: TDateTimeField
      DisplayLabel = 'Início da Vigência'
      FieldName = 'VIGENCIA_INICIO'
    end
    object cdsProvisaoImovelVIGENCIA_FIM: TDateTimeField
      DisplayLabel = 'Término da vigência'
      FieldName = 'VIGENCIA_FIM'
    end
    object cdsProvisaoImovelFLGATIVO: TStringField
      FieldName = 'FLGATIVO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object cdsProvisaoImovelFLGATIVO_S: TStringField
      DisplayLabel = 'Status da vigência'
      DisplayWidth = 50
      FieldName = 'FLGATIVO_S'
      Size = 50
    end
  end
  object dsProvisaoImovel: TwwDataSource
    DataSet = cdsProvisaoImovel
    Left = 200
    Top = 192
  end
end
