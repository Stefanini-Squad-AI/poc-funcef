inherited frmCadImovel: TfrmCadImovel
  Left = 8
  Top = 113
  HelpContext = 640068
  Caption = 'Cadastro de Imóveis'
  ClientHeight = 408
  ClientWidth = 778
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Top = 35
    Width = 778
    Height = 340
    BevelInner = bvNone
    BorderWidth = 0
    inherited pnlMestre: TPanel
      Left = 1
      Top = 1
      Width = 776
      Height = 0
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Left = 1
      Top = 1
      Width = 776
      Height = 338
      Tabs.Strings = (
        'Geral'
        'Características'
        'Endereço'
        'Descrição'
        'Dados Complementares'
        'Valores'
        'Indicadores'
        'Eventos'
        'Observações'
        'Desmembramentos')
      detdbGrids.Strings = (
        ''
        'dbgrdDet'
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        '')
      inherited pgctrlDetalhe: TPageControl
        Top = 53
        Width = 678
        Height = 281
        ActivePage = tbsGeral
        OnChanging = pgctrlDetalheChanging
        object tbsGeral: TTabSheet [0]
          Caption = 'Geral'
          object Label1: TLabel
            Left = 208
            Top = 10
            Width = 80
            Height = 13
            Caption = 'Imóvel Mestre'
          end
          object Label2: TLabel
            Left = 16
            Top = 50
            Width = 92
            Height = 13
            Caption = 'Nome do Imóvel'
          end
          object Label4: TLabel
            Left = 128
            Top = 170
            Width = 50
            Height = 13
            Caption = 'Área Útil'
          end
          object Label5: TLabel
            Left = 344
            Top = 130
            Width = 143
            Height = 13
            Caption = 'Administradora do Imóvel'
          end
          object Label16: TLabel
            Left = 448
            Top = 170
            Width = 72
            Height = 13
            Caption = 'Fração Ideal'
          end
          object Label6: TLabel
            Left = 16
            Top = 130
            Width = 107
            Height = 13
            Caption = 'Marca ou Franquia'
          end
          object Label20: TLabel
            Left = 240
            Top = 218
            Width = 117
            Height = 13
            Caption = 'Subconta Associada'
          end
          object Label3: TLabel
            Left = 264
            Top = 90
            Width = 45
            Height = 13
            Caption = 'Cartório'
          end
          object Label29: TLabel
            Left = 16
            Top = 90
            Width = 55
            Height = 13
            Caption = 'Matrícula'
          end
          object Bevel1: TBevel
            Left = 16
            Top = 212
            Width = 697
            Height = 3
            Shape = bsTopLine
          end
          object Label34: TLabel
            Left = 520
            Top = 218
            Width = 110
            Height = 13
            Caption = 'Situação do Imóvel'
          end
          object Label21: TLabel
            Left = 448
            Top = 50
            Width = 40
            Height = 13
            Caption = 'Código'
          end
          object Label22: TLabel
            Left = 240
            Top = 170
            Width = 85
            Height = 13
            Caption = 'Área Gerencial'
          end
          object Label37: TLabel
            Left = 288
            Top = 258
            Width = 145
            Height = 13
            Caption = 'Carteira de Investimentos'
            Enabled = False
            Visible = False
          end
          object Label39: TLabel
            Left = 16
            Top = 218
            Width = 85
            Height = 13
            Caption = 'Tipo de Imóvel'
          end
          object Label40: TLabel
            Left = 552
            Top = 170
            Width = 54
            Height = 13
            Caption = 'N° Vagas'
          end
          object Label41: TLabel
            Left = 352
            Top = 170
            Width = 71
            Height = 13
            Caption = 'Área Comum'
          end
          object Label42: TLabel
            Left = 56
            Top = 258
            Width = 51
            Height = 13
            Caption = '% Rateio'
            Enabled = False
            Visible = False
          end
          object Label35: TLabel
            Left = 624
            Top = 170
            Width = 86
            Height = 13
            Caption = 'Data Habite-se'
          end
          object Label33: TLabel
            Left = 16
            Top = 170
            Width = 60
            Height = 13
            Caption = 'Área Total'
          end
          object DBrdgImovelMestre: TDBRadioGroup
            Left = 16
            Top = 8
            Width = 177
            Height = 37
            Caption = ' Imóvel Mestre ? '
            Columns = 2
            DataField = 'FLGTIPOIMOVEL'
            DataSource = ds
            Enabled = False
            Items.Strings = (
              'Sim'
              'Não')
            TabOrder = 0
            TabStop = True
            Values.Strings = (
              '0'
              '1')
            OnClick = DBrdgImovelMestreClick
          end
          object DBedtNomeImovel: TDBEdit2
            Left = 16
            Top = 64
            Width = 417
            Height = 21
            DataField = 'IMONOME'
            DataSource = ds
            TabOrder = 3
          end
          object DBrdgImovelOcupado: TDBRadioGroup
            Left = 600
            Top = 53
            Width = 129
            Height = 33
            Caption = ' Imóvel Ocupado ? '
            Columns = 2
            DataField = 'FLGSTATUSOCUPACAO'
            DataSource = ds
            Items.Strings = (
              'Sim'
              'Não')
            TabOrder = 5
            TabStop = True
            Values.Strings = (
              'O'
              'D')
          end
          object btnBuscaImovelMestre: TBitBtn
            Left = 704
            Top = 24
            Width = 24
            Height = 22
            Hint = 'Busca um Imóvel Mestre'
            TabOrder = 2
            OnClick = btnBuscaImovelMestreClick
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
          object DBcboMarca: TwwDBLookupCombo
            Left = 16
            Top = 144
            Width = 313
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'MRCNOME'#9'40'#9'Marca')
            DataField = 'IDMARCA'
            DataSource = ds
            LookupTable = qryLookMarca
            LookupField = 'IDMARCA'
            Style = csDropDownList
            DropDownWidth = 8
            TabOrder = 11
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
          end
          object DBcboSubConta: TwwDBLookupCombo
            Left = 240
            Top = 232
            Width = 265
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOMESUBCONTA'#9'60'#9'NOMESUBCONTA')
            DataField = 'CODSUBCONTA'
            DataSource = ds
            LookupTable = qryLookSubConta
            LookupField = 'CODSUBCONTA'
            Style = csDropDownList
            DropDownCount = 5
            DropDownWidth = 8
            TabOrder = 24
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
          end
          object DBedtMatricula: TDBEdit2
            Left = 16
            Top = 104
            Width = 161
            Height = 21
            DataField = 'IMOMATRICULA'
            DataSource = ds
            TabOrder = 6
          end
          object DBcboStatus: TwwDBComboBox
            Left = 520
            Top = 232
            Width = 201
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
              'em Obras'#9'O')
            Sorted = False
            TabOrder = 25
            UnboundDataType = wwDefault
          end
          object DBedtFracaoIdeal: TDBEdit
            Left = 448
            Top = 184
            Width = 89
            Height = 21
            DataField = 'IMOFRACAOIDEAL'
            DataSource = ds
            TabOrder = 19
          end
          object DBedtCodigo: TDBEdit2
            Left = 448
            Top = 64
            Width = 137
            Height = 21
            DataField = 'IMOCODIGO'
            DataSource = ds
            TabOrder = 4
          end
          object DBedtAreaUtil: TDBEdit
            Left = 128
            Top = 184
            Width = 105
            Height = 21
            DataField = 'IMOAREA'
            DataSource = ds
            MaxLength = 21
            TabOrder = 16
          end
          object DBedtAreaGerencial: TDBEdit
            Left = 240
            Top = 184
            Width = 105
            Height = 21
            DataField = 'IMOAREAGERENCIAL'
            DataSource = ds
            MaxLength = 21
            TabOrder = 17
          end
          object DBedtCarteiraInvest: TDBEdit
            Left = 288
            Top = 272
            Width = 241
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'DESCCARTINVEST'
            DataSource = ds
            Enabled = False
            ReadOnly = True
            TabOrder = 23
            Visible = False
          end
          object DBedtTipoImovel: TDBEdit
            Left = 16
            Top = 232
            Width = 217
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'DESCTIPOIMOVEL'
            DataSource = ds
            Enabled = False
            ReadOnly = True
            TabOrder = 22
          end
          object DBedtNomeMestre: TDBEdit2
            Left = 208
            Top = 24
            Width = 497
            Height = 21
            DataField = 'NOME_MESTRE'
            DataSource = ds
            Enabled = False
            TabOrder = 1
          end
          object btnBuscaCartorio: TBitBtn
            Left = 678
            Top = 104
            Width = 24
            Height = 22
            Hint = 'Busca um Cartório'
            TabOrder = 8
            OnClick = btnBuscaCartorioClick
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
          object DBedtCartorio: TDBEdit2
            Left = 262
            Top = 104
            Width = 417
            Height = 21
            DataField = 'NF_CARTORIO'
            DataSource = ds
            Enabled = False
            TabOrder = 7
          end
          object DBedtAdmin: TDBEdit2
            Left = 344
            Top = 144
            Width = 337
            Height = 21
            DataField = 'NF_ADMIN'
            DataSource = ds
            Enabled = False
            TabOrder = 12
          end
          object btnBuscaAdmin: TBitBtn
            Left = 680
            Top = 144
            Width = 24
            Height = 22
            Hint = 'Busca uma Administradora'
            TabOrder = 13
            OnClick = btnBuscaAdminClick
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
          object btnLimpaCartorio: TBitBtn
            Left = 702
            Top = 104
            Width = 24
            Height = 22
            Hint = 'Limpa a seleção de Cartório'
            TabOrder = 9
            OnClick = btnLimpaCartorioClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              88888888888FF8888888888888008888888888888F77F8888888888800F08888
              8888888F7787F88888888800FFF0888888888F7788878F88888800FFFFFF0888
              88887788888F788888887FFFFFCF888888887F88FF7888FF88887FFCCCF88008
              888878F777888778F88887FFFF880110888887F88F8878878F8887FFC8809991
              0888878F7887F88878F8887FF88099991088887F88878F88878F887FF8880999
              03088878F88878F878788887F8888090B03088878F888787878788887888880B
              0B038888788888787878888888888880B0B38888888888878788888888888888
              0BBB88888888888878F888888888888880BB8888888888888788}
            NumGlyphs = 2
          end
          object btnLimpaAdmin: TBitBtn
            Left = 704
            Top = 144
            Width = 24
            Height = 22
            Hint = 'Limpa a seleção de Administradora'
            TabOrder = 14
            OnClick = btnLimpaAdminClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              88888888888FF8888888888888008888888888888F77F8888888888800F08888
              8888888F7787F88888888800FFF0888888888F7788878F88888800FFFFFF0888
              88887788888F788888887FFFFFCF888888887F88FF7888FF88887FFCCCF88008
              888878F777888778F88887FFFF880110888887F88F8878878F8887FFC8809991
              0888878F7887F88878F8887FF88099991088887F88878F88878F887FF8880999
              03088878F88878F878788887F8888090B03088878F888787878788887888880B
              0B038888788888787878888888888880B0B38888888888878788888888888888
              0BBB88888888888878F888888888888880BB8888888888888788}
            NumGlyphs = 2
          end
          object DBedtVagas: TDBEdit
            Left = 552
            Top = 184
            Width = 57
            Height = 21
            DataField = 'IMOVAGAS'
            DataSource = ds
            MaxLength = 3
            TabOrder = 20
          end
          object DBedtAreaComum: TDBEdit
            Left = 352
            Top = 184
            Width = 81
            Height = 21
            DataField = 'IMOAREACOMUM'
            DataSource = ds
            MaxLength = 21
            TabOrder = 18
          end
          object DBedtAreaTotal: TDBEdit
            Left = 16
            Top = 184
            Width = 105
            Height = 21
            DataField = 'IMOAREATOTAL'
            DataSource = ds
            MaxLength = 21
            TabOrder = 15
          end
          object DBedtDataHabitese: TCMDateTimePicker
            Left = 624
            Top = 184
            Width = 97
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
            TabOrder = 21
          end
          object DBEdit1: TDBEdit
            Left = 56
            Top = 272
            Width = 57
            Height = 21
            DataField = 'IMOPERCENTRATEIO'
            DataSource = ds
            Enabled = False
            MaxLength = 21
            TabOrder = 10
            Visible = False
          end
        end
        inherited tbsDet: TTabSheet
          Caption = 'Características'
          inherited dbgrdDet: TwwDBGrid
            Width = 670
            Height = 253
            Selected.Strings = (
              'DESCRICAO'#9'60'#9'Características do Imóvel')
            TabOrder = 0
          end
          inherited pnlControlesDet: TPanel
            Width = 670
            Height = 253
            TabOrder = 1
            object Label19: TLabel
              Left = 120
              Top = 58
              Width = 140
              Height = 13
              Caption = 'Característica do Imóvel'
            end
            object DBlkcboCaracteristica: TwwDBLookupCombo
              Left = 120
              Top = 72
              Width = 433
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'CTIDESCRICAO'#9'60'#9'Característica do Imóvel')
              DataField = 'IDCATEGORIAIMOVEL'
              DataSource = dsDet
              LookupTable = qryLookCaracteristicas
              LookupField = 'IDCATEGORIAIMOVEL'
              Style = csDropDownList
              DropDownWidth = 8
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
            end
          end
        end
        object tbsEndereco: TTabSheet
          Caption = 'Endereço'
          object Label7: TLabel
            Left = 16
            Top = 66
            Width = 65
            Height = 13
            Caption = 'Logradouro'
          end
          object Label8: TLabel
            Left = 408
            Top = 66
            Width = 44
            Height = 13
            Caption = 'Número'
          end
          object Label9: TLabel
            Left = 512
            Top = 66
            Width = 76
            Height = 13
            Caption = 'Complemento'
          end
          object Label10: TLabel
            Left = 16
            Top = 106
            Width = 34
            Height = 13
            Caption = 'Bairro'
          end
          object Label11: TLabel
            Left = 312
            Top = 106
            Width = 40
            Height = 13
            Caption = 'Cidade'
          end
          object Label12: TLabel
            Left = 608
            Top = 106
            Width = 25
            Height = 13
            Caption = 'CEP'
          end
          object Label13: TLabel
            Left = 16
            Top = 10
            Width = 109
            Height = 13
            Caption = 'Nome do Endereço'
          end
          object Label17: TLabel
            Left = 16
            Top = 146
            Width = 40
            Height = 13
            Caption = 'Estado'
          end
          object Label18: TLabel
            Left = 96
            Top = 146
            Width = 27
            Height = 13
            Caption = 'País'
          end
          object Bevel3: TBevel
            Left = 16
            Top = 56
            Width = 689
            Height = 3
            Shape = bsTopLine
          end
          object Bevel4: TBevel
            Left = 16
            Top = 192
            Width = 689
            Height = 3
            Shape = bsTopLine
          end
          object DBedtLogradouro: TDBEdit2
            Left = 16
            Top = 80
            Width = 377
            Height = 21
            DataField = 'IMOLOGRADOURO'
            DataSource = ds
            TabOrder = 2
          end
          object DBedtComplemento: TDBEdit2
            Left = 512
            Top = 80
            Width = 193
            Height = 21
            DataField = 'IMOCOMPLEMENTO'
            DataSource = ds
            TabOrder = 4
          end
          object DBedtNumero: TDBEdit2
            Left = 408
            Top = 80
            Width = 89
            Height = 21
            DataField = 'IMONUMERO'
            DataSource = ds
            TabOrder = 3
          end
          object DBedtBairro: TDBEdit2
            Left = 16
            Top = 120
            Width = 281
            Height = 21
            DataField = 'IMOBAIRRO'
            DataSource = ds
            TabOrder = 5
          end
          object DBedtCidade: TDBEdit2
            Left = 312
            Top = 120
            Width = 281
            Height = 21
            DataField = 'IMOCIDADE'
            DataSource = ds
            TabOrder = 6
          end
          object DBedtCEP: TDBEdit2
            Left = 608
            Top = 120
            Width = 97
            Height = 21
            DataField = 'IMOCEP'
            DataSource = ds
            TabOrder = 7
          end
          object DBedtNomeEndereco: TDBEdit2
            Left = 16
            Top = 24
            Width = 433
            Height = 21
            DataField = 'IMONOMEENDERECO'
            DataSource = ds
            TabOrder = 0
          end
          object DBlkcboEstado: TwwDBLookupCombo
            Left = 16
            Top = 160
            Width = 65
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'CODESTADO'#9'3'#9'Estado')
            DataField = 'CODESTADO'
            DataSource = ds
            LookupTable = qryLookEstado
            LookupField = 'CODESTADO'
            Style = csDropDownList
            DropDownWidth = 57
            TabOrder = 8
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
            OnChange = DBlkcboEstadoChange
          end
          object DBedtPais: TDBEdit2
            Left = 96
            Top = 160
            Width = 201
            Height = 21
            DataField = 'NOMEPAIS'
            DataSource = dsPais
            Enabled = False
            TabOrder = 9
          end
          object btnBuscaEndereco: TBitBtn
            Left = 448
            Top = 24
            Width = 24
            Height = 22
            Hint = 'Busca um Endereço'
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
        end
        object tbsDescricao: TTabSheet
          Caption = 'Descrição'
          object Label14: TLabel
            Left = 16
            Top = 42
            Width = 117
            Height = 13
            Caption = 'Descrição do Imóvel'
          end
          object Label15: TLabel
            Left = 616
            Top = 10
            Width = 96
            Height = 13
            Caption = 'Data Construção'
          end
          object DBmemDescricaoImovel: TwwDBRichEdit
            Left = 16
            Top = 56
            Width = 705
            Height = 73
            ScrollBars = ssVertical
            AutoURLDetect = False
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
            PopupOptions = []
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
              900000007B5C727466315C616E73695C616E7369637067313235325C64656666
              305C6465666C616E67313033337B5C666F6E7474626C7B5C66305C6673776973
              73204D532053616E732053657269663B7D7D0D0A5C766965776B696E64345C75
              63315C706172645C66305C667331342044426D656D44657363726963616F496D
              6F76656C5C7061720D0A5C7061720D0A7D0D0A00}
          end
          object wwDBGrid21: TwwDBGrid2
            Left = 16
            Top = 163
            Width = 705
            Height = 97
            Selected.Strings = (
              'CONNUMERO'#9'11'#9'Nº Contrato'
              'CONNOME'#9'30'#9'Nome do Contrato'
              'STATUS_CONTRATO'#9'10'#9'Status'
              'NOME'#9'40'#9'Locatário'
              'CIMVLRALUGUEL'#9'15'#9'Aluguel Original'
              'MOESIGLA'#9'9'#9'Moeda'
              'CONDATAINICIO'#9'11'#9'Data de Início'
              'CONDATAFIM'#9'11'#9'Data de Término')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            DataSource = dsContratos
            KeyOptions = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
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
          object DBedtDataConstrucao: TCMDateTimePicker
            Left = 616
            Top = 24
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
            TabOrder = 2
          end
          object Panel3: TPanel
            Left = 16
            Top = 137
            Width = 705
            Height = 27
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
            TabOrder = 3
          end
        end
        object TabSheet1: TTabSheet
          Caption = 'Dados Complementares'
          object Panel1: TPanel
            Left = 0
            Top = 0
            Width = 670
            Height = 27
            Align = alTop
            BevelInner = bvRaised
            BevelOuter = bvLowered
            Caption = 'Dados Complementares'
            Color = clNavy
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -16
            Font.Name = 'Courier New'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
          end
          object DBgrdOutroDadoXImovel: TwwDBGrid2
            Left = 0
            Top = 27
            Width = 670
            Height = 226
            Selected.Strings = (
              'ODODESCRICAO'#9'37'#9'Tipo de Dado Complementar'
              'ODIVALOR'#9'50'#9' ')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsOutroDadoXImovel
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
            TitleButtons = False
            OnCalcCellColors = DBgrdOutroDadoXImovelCalcCellColors
            IndicatorColor = icBlack
            OnTopRowChanged = DBgrdOutroDadoXImovelTopRowChanged
          end
        end
        object tbsValor: TTabSheet
          Caption = 'Valores'
          object GroupBox1: TGroupBox
            Left = 16
            Top = 8
            Width = 449
            Height = 65
            Caption = ' Aquisição '
            TabOrder = 0
            object Label30: TLabel
              Left = 16
              Top = 18
              Width = 28
              Height = 13
              Caption = 'Data'
            end
            object Label32: TLabel
              Left = 136
              Top = 18
              Width = 30
              Height = 13
              Caption = 'Valor'
            end
            object Label31: TLabel
              Left = 296
              Top = 18
              Width = 39
              Height = 13
              Caption = 'Moeda'
            end
            object DBedtDataCompra: TCMDateTimePicker
              Left = 16
              Top = 32
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
              Left = 296
              Top = 32
              Width = 137
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'MOESIGLA'#9'6'#9'Moeda')
              DataField = 'IMOMOEDACOMPRA'
              DataSource = ds
              LookupTable = qryLookMoeda
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
              Top = 32
              Width = 145
              Height = 21
              DataField = 'IMOVLRCOMPRA'
              DataSource = ds
              TabOrder = 1
            end
          end
          object GroupBox2: TGroupBox
            Left = 16
            Top = 80
            Width = 449
            Height = 65
            Caption = ' Última Reavaliação '
            TabOrder = 1
            object Label23: TLabel
              Left = 16
              Top = 18
              Width = 28
              Height = 13
              Caption = 'Data'
            end
            object Label24: TLabel
              Left = 136
              Top = 18
              Width = 30
              Height = 13
              Caption = 'Valor'
            end
            object Label25: TLabel
              Left = 296
              Top = 18
              Width = 39
              Height = 13
              Caption = 'Moeda'
            end
            object DBedtDataReaval: TCMDateTimePicker
              Left = 16
              Top = 32
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
              Left = 296
              Top = 32
              Width = 137
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'MOESIGLA'#9'6'#9'Moeda')
              DataField = 'IMOMOEDAREAVAL'
              DataSource = ds
              LookupTable = qryLookMoeda
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
              Top = 32
              Width = 145
              Height = 21
              DataField = 'IMOVLRREAVAL'
              DataSource = ds
              TabOrder = 1
            end
          end
          object GroupBox3: TGroupBox
            Left = 16
            Top = 152
            Width = 449
            Height = 65
            Caption = ' Mercado '
            TabOrder = 2
            object Label26: TLabel
              Left = 16
              Top = 18
              Width = 28
              Height = 13
              Caption = 'Data'
            end
            object Label27: TLabel
              Left = 136
              Top = 18
              Width = 30
              Height = 13
              Caption = 'Valor'
            end
            object Label28: TLabel
              Left = 296
              Top = 18
              Width = 39
              Height = 13
              Caption = 'Moeda'
            end
            object DBedtDataMercado: TCMDateTimePicker
              Left = 16
              Top = 32
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
              Left = 296
              Top = 32
              Width = 137
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'MOESIGLA'#9'6'#9'Moeda')
              DataField = 'IMOMOEDAMERCADO'
              DataSource = ds
              LookupTable = qryLookMoeda
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
              Top = 32
              Width = 145
              Height = 21
              DataField = 'IMOVLRMERCADO'
              DataSource = ds
              TabOrder = 1
            end
          end
        end
        object tbsIndicadores: TTabSheet
          Caption = 'Indicadores'
          object DBgrdIndicador: TwwDBGrid2
            Left = 15
            Top = 72
            Width = 705
            Height = 185
            Selected.Strings = (
              'DATAAPURADO'#9'12'#9'Data'#9'F'
              'INMDESCRICAO'#9'60'#9'Descrição'#9'F'
              'VLRAPURADO'#9'10'#9'Valor'#9'F')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            DataSource = dsIndicador
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
            TitleButtons = False
            OnCalcCellColors = DBgrdIndicadorCalcCellColors
            IndicatorColor = icBlack
            OnTopRowChanged = DBgrdIndicadorTopRowChanged
          end
          object btnPorData: TfcShapeBtn
            Left = 152
            Top = 8
            Width = 217
            Height = 29
            Caption = 'Ordenar por Data de medição'
            Color = clBtnFace
            DitherColor = clWhite
            Down = True
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              888888FFFFFF88888F8881111118888808888777777F88887FF8811888188887
              0788877FF878888777F888118888888000888877FF88888777FF888118888870
              007888877FF88877777F888811888800000888F877FF88777778818881188888
              088887FFF77F88887F8881111118888808888777777888887F88888888888888
              088888FFF8FFF8887F88844484448888088887778777F8887F88874888478888
              0888877FFF7788887F8888444448888808888877777F88887F88887484788888
              08888877F77888887F888884448888880888888777F888887F88888747888888
              08888887778888887F8888884888888808888888788888887888}
            GroupIndex = 1
            Margin = 12
            NumGlyphs = 2
            ParentClipping = True
            RoundRectBias = 25
            ShadeColors.Btn3DLight = 14671839
            ShadeColors.BtnHighlight = 15724527
            ShadeColors.BtnShadow = 6316128
            ShadeColors.BtnBlack = 3158064
            ShadeStyle = fbsHighlight
            Spacing = 6
            TabOrder = 1
            TextOptions.Alignment = taLeftJustify
            TextOptions.LineSpacing = 2
            TextOptions.OutlineColor = clNone
            TextOptions.VAlignment = vaVCenter
            TextOptions.WordWrap = True
            OnClick = btnPorDataClick
          end
          object btnPorTipo: TfcShapeBtn
            Left = 368
            Top = 8
            Width = 217
            Height = 29
            Caption = 'Ordenar por Tipo de Indicador'
            Color = clBtnFace
            DitherColor = clWhite
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              888888FFF8FFF8888F88844484448888088887778777F8887FF8874888478887
              0788877FFF77888777F888444448888000888877777F888777FF887484788870
              00788877F7788877777F8884448888000008888777F888777778888747888888
              08888887778888887F8888884888888808888888788888887F88888888888888
              088888FFFFFF88887F8881111118888808888777777F88887F88811888188888
              0888877FF87888887F8888118888888808888877FF8888887F88888118888888
              088888877FF888887F88888811888888088888F877FF88887F88818881188888
              088887FFF77F88887F8881111118888808888777777888887888}
            GroupIndex = 1
            Margin = 12
            NumGlyphs = 2
            ParentClipping = True
            RoundRectBias = 25
            ShadeColors.Btn3DLight = 14671839
            ShadeColors.BtnHighlight = 15724527
            ShadeColors.BtnShadow = 6316128
            ShadeColors.BtnBlack = 3158064
            ShadeStyle = fbsHighlight
            Spacing = 6
            TabOrder = 2
            TextOptions.Alignment = taLeftJustify
            TextOptions.LineSpacing = 2
            TextOptions.OutlineColor = clNone
            TextOptions.VAlignment = vaVCenter
            TextOptions.WordWrap = True
            OnClick = btnPorTipoClick
          end
          object Panel2: TPanel
            Left = 15
            Top = 46
            Width = 705
            Height = 27
            BevelInner = bvRaised
            BevelOuter = bvLowered
            Caption = 'Histórico de Indicadores'
            Color = clNavy
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -16
            Font.Name = 'Courier New'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 3
          end
        end
        object tbsEventos: TTabSheet
          Caption = 'Eventos'
          object Label38: TLabel
            Left = 16
            Top = 178
            Width = 120
            Height = 13
            Caption = 'Descrição do Evento'
          end
          object Bevel2: TBevel
            Left = 16
            Top = 172
            Width = 705
            Height = 2
            Shape = bsTopLine
          end
          object DBgrdEvento: TwwDBGrid2
            Left = 16
            Top = 32
            Width = 705
            Height = 129
            Selected.Strings = (
              'EVIDATA'#9'10'#9'Data'
              'EVICABECALHO'#9'64'#9'Histórico'
              'NOMEUSUARIO'#9'15'#9'Usuário'#9'F'
              'NOME'#9'60'#9'Nome Usuário'#9'F')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            DataSource = dsEvento
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
            TitleButtons = False
            UseTFields = False
            OnCalcCellColors = DBgrdEventoCalcCellColors
            IndicatorColor = icBlack
            OnTopRowChanged = DBgrdEventoTopRowChanged
          end
          object DBmemDescricao: TwwDBRichEdit
            Left = 16
            Top = 192
            Width = 705
            Height = 61
            TabStop = False
            AutoURLDetect = False
            DataField = 'EVIDESCRICAO'
            DataSource = dsEvento
            MaxLength = 1750
            PrintJobName = 'Delphi 5'
            ReadOnly = True
            TabOrder = 1
            PopupOptions = []
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
          object Panel4: TPanel
            Left = 16
            Top = 6
            Width = 705
            Height = 27
            BevelInner = bvRaised
            BevelOuter = bvLowered
            Caption = 'Histórico de Eventos'
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
        object tbsObs: TTabSheet
          Caption = 'Observações'
          object DBmemObservacao: TwwDBRichEdit
            Left = 0
            Top = 27
            Width = 670
            Height = 211
            ScrollBars = ssVertical
            Align = alTop
            AutoURLDetect = False
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
              8B0000007B5C727466315C616E73695C616E7369637067313235325C64656666
              305C6465666C616E67313033337B5C666F6E7474626C7B5C66305C6673776973
              73204D532053616E732053657269663B7D7D0D0A5C766965776B696E64345C75
              63315C706172645C66305C667331342044426D656D4F62736572766163616F5C
              7061720D0A5C7061720D0A7D0D0A00}
          end
          object btnLimpaObs: TfcShapeBtn
            Left = 296
            Top = 242
            Width = 169
            Height = 29
            Caption = 'Limpa Observação'
            Color = clBtnFace
            DitherColor = clWhite
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              888888888888FF8888888888888778888888888888F77F8888888888800F0887
              88888888F7787F88888888800FFF0878888888F7788878888888800FFFFFF788
              888887788888F888888887FFFFFF7888888887F888888888888887FFFF888888
              8788878F888FF8888888887FF80088887888887F88778F888888887F80D50887
              88888878F78878F88F8888870DDD508F08888887788887F878F88880EDDDD0FF
              F08888878F888788F788880E6EDD0FF77888887888F878F7788880E6E6E0F778
              888887F88887F7788888806E6E0778888888878F8877788888888806E0888888
              88888878F7888888888888800888888888888887788888888888}
            NumGlyphs = 2
            ParentClipping = True
            RoundRectBias = 25
            ShadeStyle = fbsHighlight
            TabOrder = 1
            TextOptions.Alignment = taCenter
            TextOptions.VAlignment = vaVCenter
            OnClick = btnLimpaObsClick
          end
          object Panel5: TPanel
            Left = 0
            Top = 0
            Width = 670
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
            TabOrder = 2
          end
        end
        object TabSheet2: TTabSheet
          Caption = 'Desmembramentos'
          ImageIndex = 9
          object wwDBGrid1: TwwDBGrid
            Left = 0
            Top = 0
            Width = 670
            Height = 253
            Selected.Strings = (
              'DMRDATA'#9'18'#9'Data'
              'NOME_IMOVEL'#9'60'#9'Nome Imóvel'
              'DMRPERCENT'#9'10'#9'% Desmembrado'
              'PERC_ACUM'#9'10'#9'Fator s/ Imovel Atual'#9'F')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsDesmembramentos
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
        end
      end
      inherited Dock973: TDock97
        Width = 768
        Height = 29
        inherited tb97BotoesDetalhe: TToolbar97
          BorderStyle = bsNone
          inherited sbtnInsDet: TToolbarButton97
            Width = 73
            Height = 23
            Caption = '&Inserir'
          end
          inherited sbtnAltDet: TToolbarButton97
            Left = 73
            Width = 73
            Height = 23
            Caption = '&Alterar'
          end
          inherited sbtnExcluiDet: TToolbarButton97
            Left = 146
            Width = 73
            Height = 23
            Caption = '&Excluir'
          end
        end
      end
      inherited Dock974: TDock97
        Left = 682
        Top = 53
        Height = 281
        inherited tb97Detalhe: TToolbar97
          BorderStyle = bsNone
          inherited bbtnOkDet: TBitBtn
            Height = 25
            Margin = 4
          end
          inherited bbtnCancelarDet: TBitBtn
            Top = 25
            Height = 25
            Margin = 4
            Spacing = 4
          end
          inherited bbtnVoltarDet: TBitBtn
            Top = 50
            Height = 25
            Enabled = False
            Visible = False
            Margin = 4
          end
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 778
    Height = 35
    object DBlblAtivoInativo: TDBText [0]
      Left = 568
      Top = 4
      Width = 174
      Height = 24
      Alignment = taRightJustify
      AutoSize = True
      DataField = '_ATIVO_INATIVO'
      DataSource = ds
      Font.Charset = ANSI_CHARSET
      Font.Color = clGray
      Font.Height = -21
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Width = 85
        Height = 29
        Layout = blGlyphLeft
        Spacing = 4
      end
      inherited sbtnAlterar: TToolbarButton97
        Left = 85
        Width = 85
        Height = 29
        Layout = blGlyphLeft
        Spacing = 4
      end
      inherited sbtnProcurar: TToolbarButton97
        Left = 255
        Width = 85
        Height = 29
        Layout = blGlyphLeft
        Spacing = 4
      end
      inherited sbtnApagar: TToolbarButton97
        Left = 170
        Width = 85
        Height = 29
        Layout = blGlyphLeft
        Spacing = 4
      end
      object ToolbarSep972: TToolbarSep97
        Left = 461
        Top = 0
      end
      object btnBuscaMestre: TToolbarButton97
        Left = 340
        Top = 0
        Width = 121
        Height = 29
        AllowAllUp = True
        GroupIndex = 1
        Caption = 'Imóvel &Mestre'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
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
        Opaque = False
        OnClick = btnBuscaMestreClick
      end
      object btnRefresh: TToolbarButton97
        Left = 467
        Top = 0
        Width = 85
        Height = 29
        AllowAllUp = True
        GroupIndex = 2
        Caption = 'A&tualizar'
        Enabled = False
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
        Visible = False
        OnClick = btnRefreshClick
      end
      object btnTrazer: TToolbarButton97
        Left = 552
        Top = 0
        Width = 85
        Height = 29
        AllowAllUp = True
        GroupIndex = 3
        Caption = 'Tra&zer'
        Enabled = False
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888888F88888888888888778888888888888F77F8888888888800F088
          888888888F7787F88888888800FFF0888888888F7788878F88888800FFFFFF08
          8888887788888F7F8888887FFFFFCF088888887F88FF7878F888887FFFCCFFF0
          8888887F877788F7F888888744FFFCF088888887778FF7878F888884CC4FCFFF
          088888878878788F78F8884CCCC4FFCFF088887888878F78878F84CCCCCC4FFF
          FF0887FF88887F888F788444CC444FFF77888777F877788F77888884CC4FFF77
          88888887F87F8F7788888884CC47778888888887F877778888888884CC488888
          88888887FF7F8888888888844448888888888887777888888888}
        NumGlyphs = 2
        Opaque = False
        Visible = False
        OnClick = btnTrazerClick
      end
    end
  end
  inherited Dock971: TDock97
    Top = 375
    Width = 778
    Height = 33
    inherited tb97Fundo: TToolbar97
      Left = 550
      DockPos = 550
      inherited sep1: TToolbarSep97
        Left = 166
        SizeHorz = 2
      end
      inherited sep3: TToolbarSep97
        Left = 0
        SizeHorz = 2
      end
      object ToolbarSep975: TToolbarSep97 [2]
        Left = 83
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      inherited bbtnSair: TBitBtn
        Left = 2
        Width = 81
        Height = 27
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 85
        Width = 81
        Height = 27
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 378
      DockPos = 378
      inherited ToolbarSep971: TToolbarSep97
        Left = 0
        SizeHorz = 2
      end
      object ToolbarSep973: TToolbarSep97 [1]
        Left = 83
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      object ToolbarSep974: TToolbarSep97 [2]
        Left = 166
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      inherited bbtnConfirmar: TBitBtn
        Left = 2
        Width = 81
        Height = 27
      end
      inherited bbtnCancelar: TBitBtn
        Left = 85
        Width = 81
        Height = 27
      end
    end
  end
  inherited qry: TwwQuery
    OnCalcFields = qryCalcFields
    SQL.Strings = (
      'SELECT'
      '   I.IDIMOVEL, I.IDIMOVELMESTRE, I.IDPESSOA,'
      ''
      '   I.IMONOME, IM.IMONOME as NOME_MESTRE,'
      '   I.IMOCODIGO, I.IMOMATRICULA,'
      ''
      '   I.CODESTADO, I.IDPAIS,'
      '   I.IDMARCA, I.IDADMINIMOVEL, I.FLGTIPOIMOVEL,'
      ''
      '   I.IMOLOGRADOURO, I.IMONUMERO,'
      '   I.IMOCOMPLEMENTO, I.IMOBAIRRO, I.IMOCIDADE,'
      '   I.IMONOMEENDERECO, I.IMOCEP, I.CODSUBCONTA,'
      '   I.CODTIPIMOVEL, I.IMOPERCENTRATEIO,'
      ''
      '   I.IMODESCRICAO, I.IMOOBSERVACAO,'
      '   I.FLGSTATUS, I.FLGATIVO, I.IDCARTORIO,'
      '   I.FLGSTATUSOCUPACAO, I.QTDETOTALCOTAS,'
      ''
      
        '   I.IMOAREA, I.IMOAREAGERENCIAL, I.IMOAREACOMUM, I.IMOAREATOTAL' +
        ','
      '   I.IMOFRACAOIDEAL, I.IMOVAGAS,'
      '   I.IMODATACONSTRUCAO, I.IMODATAHABITESE,'
      ''
      '   I.IMOVLRCOMPRA, I.IMOMOEDACOMPRA, I.IMODATACOMPRA,'
      '   I.IMOVLRREAVAL, I.IMOMOEDAREAVAL, I.IMODATAREAVAL,'
      '   I.IMOVLRMERCADO, I.IMOMOEDAMERCADO, I.IMODATAMERCADO,'
      ''
      '   CI.DESCCARTINVEST, TI.DESCTIPOIMOVEL,'
      ''
      '   PA.NOME AS NF_ADMIN, PA.RAZAOSOCIAL AS RS_ADMIN,'
      '   PC.NOME AS NF_CARTORIO, PC.RAZAOSOCIAL AS RS_CARTORIO'
      ''
      'FROM'
      '   PESSOA PA, PESSOA PC,'
      '   IMOVEL I, IMOVEL IM,'
      '   CARTEIRAINVEST CI, TIPOIMOVEL TI'
      ''
      'WHERE'
      '   ( I.IDIMOVEL =:IMOVEL )'
      '   AND ( I.IDIMOVELMESTRE = IM.IDIMOVEL(+) )'
      '   AND ( I.IDADMINIMOVEL = PA.IDPESSOA(+) )'
      '   AND ( I.IDCARTORIO = PC.IDPESSOA(+) )'
      '   AND ( I.CODTIPIMOVEL = TI.CODTIPIMOVEL(+) )'
      '   AND ( I.IDCARTEIRAINVEST = CI.IDCARTEIRAINVEST(+) )')
    Left = 512
    Top = 152
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IMOVEL'
        ParamType = ptUnknown
      end>
    object qry_ATIVO_INATIVO: TStringField
      DisplayWidth = 15
      FieldKind = fkCalculated
      FieldName = '_ATIVO_INATIVO'
      Size = 15
      Calculated = True
    end
    object qryIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
    end
    object qryIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryCODESTADO: TStringField
      FieldName = 'CODESTADO'
      Size = 3
    end
    object qryIDPAIS: TFloatField
      FieldName = 'IDPAIS'
    end
    object qryIDADMINIMOVEL: TFloatField
      FieldName = 'IDADMINIMOVEL'
    end
    object qryFLGTIPOIMOVEL: TFloatField
      FieldName = 'FLGTIPOIMOVEL'
    end
    object qryIDIMOVELMESTRE: TFloatField
      FieldName = 'IDIMOVELMESTRE'
    end
    object qryIMODATACONSTRUCAO: TDateTimeField
      FieldName = 'IMODATACONSTRUCAO'
    end
    object qryIMOAREA: TFloatField
      DisplayWidth = 17
      FieldName = 'IMOAREA'
      DisplayFormat = '###,###,###,###,##0.00 m2'
      EditFormat = '###,###,###,###,##0'
    end
    object qryIMOFRACAOIDEAL: TFloatField
      DefaultExpression = '0'
      FieldName = 'IMOFRACAOIDEAL'
      DisplayFormat = '0.000000'
      EditFormat = '0.000000'
      MaxValue = 1
      MinValue = 1E-6
    end
    object qryFLGSTATUSOCUPACAO: TStringField
      FieldName = 'FLGSTATUSOCUPACAO'
      Size = 1
    end
    object qryQTDETOTALCOTAS: TFloatField
      FieldName = 'QTDETOTALCOTAS'
    end
    object qryIMONOME: TStringField
      FieldName = 'IMONOME'
      Size = 60
    end
    object qryIMONUMERO: TStringField
      FieldName = 'IMONUMERO'
      Size = 8
    end
    object qryIMOCOMPLEMENTO: TStringField
      FieldName = 'IMOCOMPLEMENTO'
    end
    object qryIMOBAIRRO: TStringField
      FieldName = 'IMOBAIRRO'
    end
    object qryIMOCEP: TStringField
      DisplayWidth = 8
      FieldName = 'IMOCEP'
      EditMask = '99999-999;0; '
      Size = 8
    end
    object qryIMOCIDADE: TStringField
      FieldName = 'IMOCIDADE'
    end
    object qryIDMARCA: TFloatField
      FieldName = 'IDMARCA'
      Origin = 'IMOVEL.IDMARCA'
    end
    object qryCODSUBCONTA: TFloatField
      FieldName = 'CODSUBCONTA'
      Origin = 'IMOVEL.CODSUBCONTA'
    end
    object qryIMODATACOMPRA: TDateTimeField
      FieldName = 'IMODATACOMPRA'
      Origin = 'IMOVEL.IMODATACOMPRA'
    end
    object qryIMOMOEDACOMPRA: TFloatField
      FieldName = 'IMOMOEDACOMPRA'
      Origin = 'IMOVEL.IMOMOEDACOMPRA'
    end
    object qryIMOVLRCOMPRA: TFloatField
      FieldName = 'IMOVLRCOMPRA'
      Origin = 'IMOVEL.IMOVLRCOMPRA'
      DisplayFormat = '###,###,###,###,###,##0.00'
      EditFormat = '###,###,###,###,###,##0.00'
    end
    object qryIMOMATRICULA: TStringField
      FieldName = 'IMOMATRICULA'
      Origin = 'IMOVEL.IMOMATRICULA'
    end
    object qryCODTIPIMOVEL: TStringField
      FieldName = 'CODTIPIMOVEL'
      Origin = 'IMOVEL.CODTIPIMOVEL'
      Size = 5
    end
    object qryDESCCARTINVEST: TStringField
      FieldName = 'DESCCARTINVEST'
      Size = 60
    end
    object qryDESCTIPOIMOVEL: TStringField
      FieldName = 'DESCTIPOIMOVEL'
      Size = 25
    end
    object qryIMODATAHABITESE: TDateTimeField
      FieldName = 'IMODATAHABITESE'
    end
    object qryIMOPERCENTRATEIO: TFloatField
      FieldName = 'IMOPERCENTRATEIO'
    end
    object qryIMODESCRICAO: TMemoField
      FieldName = 'IMODESCRICAO'
      BlobType = ftMemo
      Size = 2000
    end
    object qryIMOOBSERVACAO: TMemoField
      FieldName = 'IMOOBSERVACAO'
      BlobType = ftMemo
      Size = 2000
    end
    object qryFLGSTATUS: TStringField
      FieldName = 'FLGSTATUS'
      OnChange = qryFLGSTATUSChange
      Size = 1
    end
    object qryFLGATIVO: TFloatField
      FieldName = 'FLGATIVO'
    end
    object qryIDCARTORIO: TFloatField
      FieldName = 'IDCARTORIO'
    end
    object qryIMOCODIGO: TStringField
      FieldName = 'IMOCODIGO'
      Size = 15
    end
    object qryIMOAREAGERENCIAL: TFloatField
      DisplayWidth = 17
      FieldName = 'IMOAREAGERENCIAL'
      DisplayFormat = '###,###,###,###,##0.00 m2'
      EditFormat = '###,###,###,###,##0'
    end
    object qryIMOVLRREAVAL: TFloatField
      FieldName = 'IMOVLRREAVAL'
      DisplayFormat = '###,###,###,###,###,##0.00'
      EditFormat = '###,###,###,###,###,##0.00'
    end
    object qryIMOMOEDAREAVAL: TFloatField
      FieldName = 'IMOMOEDAREAVAL'
    end
    object qryIMODATAREAVAL: TDateTimeField
      FieldName = 'IMODATAREAVAL'
    end
    object qryIMOVLRMERCADO: TFloatField
      FieldName = 'IMOVLRMERCADO'
      DisplayFormat = '###,###,###,###,###,##0.00'
      EditFormat = '###,###,###,###,###,##0.00'
    end
    object qryIMOMOEDAMERCADO: TFloatField
      FieldName = 'IMOMOEDAMERCADO'
    end
    object qryIMODATAMERCADO: TDateTimeField
      FieldName = 'IMODATAMERCADO'
    end
    object qryNOME_MESTRE: TStringField
      FieldName = 'NOME_MESTRE'
      Size = 60
    end
    object qryNF_ADMIN: TStringField
      FieldName = 'NF_ADMIN'
      Size = 60
    end
    object qryRS_ADMIN: TStringField
      FieldName = 'RS_ADMIN'
      Size = 60
    end
    object qryNF_CARTORIO: TStringField
      FieldName = 'NF_CARTORIO'
      Size = 60
    end
    object qryRS_CARTORIO: TStringField
      FieldName = 'RS_CARTORIO'
      Size = 60
    end
    object qryIMOLOGRADOURO: TStringField
      FieldName = 'IMOLOGRADOURO'
      Size = 80
    end
    object qryIMONOMEENDERECO: TStringField
      FieldName = 'IMONOMEENDERECO'
      Size = 60
    end
    object qryIMOAREACOMUM: TFloatField
      DisplayWidth = 17
      FieldName = 'IMOAREACOMUM'
      DisplayFormat = '###,###,###,###,##0.00 m2'
      EditFormat = '###,###,###,###,##0'
    end
    object qryIMOVAGAS: TFloatField
      FieldName = 'IMOVAGAS'
      DisplayFormat = '#0'
      EditFormat = '#0'
      MaxValue = 999
    end
    object qryIMOAREATOTAL: TFloatField
      FieldName = 'IMOAREATOTAL'
      DisplayFormat = '###,###,###,###,##0.00 m2'
      EditFormat = '###,###,###,###,##0'
    end
  end
  inherited dsDet: TwwDataSource
    AutoEdit = True
    DataSet = qryDetCaracteristicas
    Left = 776
    Top = 36
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 984
    Top = 2
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update IMOVEL'
      'set'
      '  IDIMOVEL = :IDIMOVEL,'
      '  IDIMOVELMESTRE = :IDIMOVELMESTRE,'
      '  IDPESSOA = :IDPESSOA,'
      '  IMONOME = :IMONOME,'
      '  IMOCODIGO = :IMOCODIGO,'
      '  IMOMATRICULA = :IMOMATRICULA,'
      '  CODESTADO = :CODESTADO,'
      '  IDPAIS = :IDPAIS,'
      '  IDMARCA = :IDMARCA,'
      '  IDADMINIMOVEL = :IDADMINIMOVEL,'
      '  FLGTIPOIMOVEL = :FLGTIPOIMOVEL,'
      '  IMOLOGRADOURO = :IMOLOGRADOURO,'
      '  IMONUMERO = :IMONUMERO,'
      '  IMOCOMPLEMENTO = :IMOCOMPLEMENTO,'
      '  IMOBAIRRO = :IMOBAIRRO,'
      '  IMOCIDADE = :IMOCIDADE,'
      '  IMONOMEENDERECO = :IMONOMEENDERECO,'
      '  IMOCEP = :IMOCEP,'
      '  CODSUBCONTA = :CODSUBCONTA,'
      '  IMOPERCENTRATEIO = :IMOPERCENTRATEIO,'
      '  IMODESCRICAO = :IMODESCRICAO,'
      '  IMOOBSERVACAO = :IMOOBSERVACAO,'
      '  FLGSTATUS = :FLGSTATUS,'
      '  FLGATIVO = :FLGATIVO,'
      '  IDCARTORIO = :IDCARTORIO,'
      '  FLGSTATUSOCUPACAO = :FLGSTATUSOCUPACAO,'
      '  QTDETOTALCOTAS = :QTDETOTALCOTAS,'
      '  IMOAREA = :IMOAREA,'
      '  IMOAREAGERENCIAL = :IMOAREAGERENCIAL,'
      '  IMOAREACOMUM = :IMOAREACOMUM,'
      '  IMOAREATOTAL = :IMOAREATOTAL,'
      '  IMOFRACAOIDEAL = :IMOFRACAOIDEAL,'
      '  IMOVAGAS = :IMOVAGAS,'
      '  IMODATACONSTRUCAO = :IMODATACONSTRUCAO,'
      '  IMODATAHABITESE = :IMODATAHABITESE,'
      '  IMOVLRCOMPRA = :IMOVLRCOMPRA,'
      '  IMOMOEDACOMPRA = :IMOMOEDACOMPRA,'
      '  IMODATACOMPRA = :IMODATACOMPRA,'
      '  IMOVLRREAVAL = :IMOVLRREAVAL,'
      '  IMOMOEDAREAVAL = :IMOMOEDAREAVAL,'
      '  IMODATAREAVAL = :IMODATAREAVAL,'
      '  IMOVLRMERCADO = :IMOVLRMERCADO,'
      '  IMOMOEDAMERCADO = :IMOMOEDAMERCADO,'
      '  IMODATAMERCADO = :IMODATAMERCADO'
      'where'
      '  IDIMOVEL = :OLD_IDIMOVEL'
      ' ')
    InsertSQL.Strings = (
      'insert into IMOVEL'
      '  (IDIMOVEL, IDIMOVELMESTRE, IDPESSOA, IMONOME, IMOCODIGO, '
      'IMOMATRICULA, '
      '   CODESTADO, IDPAIS, IDMARCA, IDADMINIMOVEL, FLGTIPOIMOVEL, '
      'IMOLOGRADOURO, '
      '   IMONUMERO, IMOCOMPLEMENTO, IMOBAIRRO, IMOCIDADE, '
      'IMONOMEENDERECO, IMOCEP, '
      '   CODSUBCONTA, IMOPERCENTRATEIO, IMODESCRICAO, IMOOBSERVACAO, '
      'FLGSTATUS, '
      '   FLGATIVO, IDCARTORIO, FLGSTATUSOCUPACAO, QTDETOTALCOTAS, '
      'IMOAREA, IMOAREAGERENCIAL, '
      '   IMOAREACOMUM, IMOAREATOTAL, IMOFRACAOIDEAL, IMOVAGAS, '
      'IMODATACONSTRUCAO, '
      '   IMODATAHABITESE, IMOVLRCOMPRA, IMOMOEDACOMPRA, '
      'IMODATACOMPRA, IMOVLRREAVAL, '
      '   IMOMOEDAREAVAL, IMODATAREAVAL, IMOVLRMERCADO, '
      'IMOMOEDAMERCADO, IMODATAMERCADO)'
      'values'
      '  (:IDIMOVEL, :IDIMOVELMESTRE, :IDPESSOA, :IMONOME, :IMOCODIGO, '
      ':IMOMATRICULA, '
      
        '   :CODESTADO, :IDPAIS, :IDMARCA, :IDADMINIMOVEL, :FLGTIPOIMOVEL' +
        ', '
      ':IMOLOGRADOURO, '
      '   :IMONUMERO, :IMOCOMPLEMENTO, :IMOBAIRRO, :IMOCIDADE, '
      ':IMONOMEENDERECO, '
      '   :IMOCEP, :CODSUBCONTA, :IMOPERCENTRATEIO, :IMODESCRICAO, '
      ':IMOOBSERVACAO, '
      '   :FLGSTATUS, :FLGATIVO, :IDCARTORIO, :FLGSTATUSOCUPACAO, '
      ':QTDETOTALCOTAS, '
      '   :IMOAREA, :IMOAREAGERENCIAL, :IMOAREACOMUM, :IMOAREATOTAL, '
      ':IMOFRACAOIDEAL, '
      
        '   :IMOVAGAS, :IMODATACONSTRUCAO, :IMODATAHABITESE, :IMOVLRCOMPR' +
        'A, '
      ':IMOMOEDACOMPRA, '
      '   :IMODATACOMPRA, :IMOVLRREAVAL, :IMOMOEDAREAVAL, '
      ':IMODATAREAVAL, :IMOVLRMERCADO, '
      '   :IMOMOEDAMERCADO, :IMODATAMERCADO)')
    DeleteSQL.Strings = (
      'delete from IMOVEL'
      'where'
      '  IDIMOVEL = :OLD_IDIMOVEL')
    Left = 504
    Top = 104
  end
  inherited MontaSelect: TMontaSelect
    RepeteConsulta = True
    ExibePergunta = False
    Left = 440
    Top = 100
  end
  inherited ds: TwwDataSource
    Left = 592
    Top = 104
  end
  inherited ImlPadrao: TImageList
    Left = 985
    Top = 42
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 228
    Top = 42
  end
  inherited CmeDetalhe: TCmEventosCadastro
    BeforeConfirma = CmeDetalheBeforeConfirma
    Left = 152
    Top = 44
  end
  object qryDetCaracteristicas: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDIMOVEL, IDCATEGORIAIMOVEL'
      'FROM'
      '  CATEGORIAXIMOVEL'
      'WHERE'
      '  ( IDIMOVEL =:IMOVEL )')
    UpdateObject = updDetCaracteristicas
    ValidateWithMask = True
    Left = 776
    Top = 24
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IMOVEL'
        ParamType = ptUnknown
      end>
    object qryDetCaracteristicasDESCRICAO: TStringField
      DisplayLabel = 'Características do Imóvel'
      DisplayWidth = 60
      FieldKind = fkLookup
      FieldName = 'DESCRICAO'
      LookupDataSet = qryLookCaracteristicas
      LookupKeyFields = 'IDCATEGORIAIMOVEL'
      LookupResultField = 'CTIDESCRICAO'
      KeyFields = 'IDCATEGORIAIMOVEL'
      Size = 60
      Lookup = True
    end
    object qryDetCaracteristicasIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
      Origin = 'CATEGORIAXIMOVEL.IDIMOVEL'
      Visible = False
    end
    object qryDetCaracteristicasIDCATEGORIAIMOVEL: TFloatField
      FieldName = 'IDCATEGORIAIMOVEL'
      Origin = 'CATEGORIAXIMOVEL.IDCATEGORIAIMOVEL'
      Visible = False
    end
  end
  object updDetCaracteristicas: TUpdateSQL
    ModifySQL.Strings = (
      'update CATEGORIAXIMOVEL'
      'set'
      '  IDIMOVEL = :IDIMOVEL,'
      '  IDCATEGORIAIMOVEL = :IDCATEGORIAIMOVEL'
      'where'
      '  IDIMOVEL = :OLD_IDIMOVEL and'
      '  IDCATEGORIAIMOVEL = :OLD_IDCATEGORIAIMOVEL')
    InsertSQL.Strings = (
      'insert into CATEGORIAXIMOVEL'
      '  (IDIMOVEL, IDCATEGORIAIMOVEL)'
      'values'
      '  (:IDIMOVEL, :IDCATEGORIAIMOVEL)')
    DeleteSQL.Strings = (
      'delete from CATEGORIAXIMOVEL'
      'where'
      '  IDIMOVEL = :OLD_IDIMOVEL and'
      '  IDCATEGORIAIMOVEL = :OLD_IDCATEGORIAIMOVEL')
    Left = 776
    Top = 12
  end
  object qryDetContratos: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   X.IDIMOVEL, X.IDCONTRATOIMOVEL, X.CIMVLRALUGUEL,'
      '   C.CONNOME, C.CONNUMERO,'
      '   C.CONDATAINICIO, C.CONDATAFIM,'
      '   C.IDLOCATARIO, C.MOECODIGO,'
      
        '   (DECODE(C.FLGSTATUS, '#39'V'#39', '#39'Vigente'#39', '#39'R'#39', '#39'Rescindido'#39', '#39'Ence' +
        'rrado'#39')) AS STATUS_CONTRATO,'
      '   M.MOESIGLA,'
      '   PL.NOME'
      ''
      'FROM'
      '   PESSOA PL,'
      '   CONTRATOXIMOVEL X, CONTRATOIMOVEL C,'
      '   MOEDA M'
      ''
      'WHERE'
      '   ( X.IDIMOVEL =:IMOVEL )'
      '   AND'
      '   ( C.IDLOCATARIO = PL.IDPESSOA ) AND'
      '   ( C.MOECODIGO = M.MOECODIGO ) AND'
      '   ( X.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL )'
      ''
      'ORDER BY'
      '   C.CONDATAINICIO')
    ValidateWithMask = True
    Left = 293
    Top = 363
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IMOVEL'
        ParamType = ptUnknown
      end>
    object qryDetContratosCONNUMERO: TStringField
      DisplayLabel = 'Nº Contrato'
      DisplayWidth = 11
      FieldName = 'CONNUMERO'
      Origin = 'CONTRATOIMOVEL.CONNUMERO'
    end
    object qryDetContratosCONNOME: TStringField
      DisplayLabel = 'Nome do Contrato'
      DisplayWidth = 30
      FieldName = 'CONNOME'
      Origin = '"CM.CONTRATOIMOVEL".CONNOME'
      Size = 60
    end
    object qryDetContratosSTATUS_CONTRATO: TStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS_CONTRATO'
      Size = 10
    end
    object qryDetContratosNOME: TStringField
      DisplayLabel = 'Locatário'
      DisplayWidth = 40
      FieldName = 'NOME'
      Origin = '"CM.PESSOA".NOME'
      Size = 60
    end
    object qryDetContratosCIMVLRALUGUEL: TFloatField
      DisplayLabel = 'Aluguel Original'
      DisplayWidth = 15
      FieldName = 'CIMVLRALUGUEL'
      Origin = '"CM.CONTRATOXIMOVEL".CIMVLRALUGUEL'
      DisplayFormat = '###,###,###,###,##0.00'
      EditFormat = '###,###,###,###,##0.00'
    end
    object qryDetContratosMOESIGLA: TStringField
      DisplayLabel = 'Moeda'
      DisplayWidth = 9
      FieldName = 'MOESIGLA'
      Origin = '"CM.MOEDA".MOESIGLA'
      Size = 10
    end
    object qryDetContratosCONDATAINICIO: TDateTimeField
      DisplayLabel = 'Data de Início'
      DisplayWidth = 11
      FieldName = 'CONDATAINICIO'
      Origin = '"CM.CONTRATOIMOVEL".CONDATAINICIO'
    end
    object qryDetContratosCONDATAFIM: TDateTimeField
      DisplayLabel = 'Data de Término'
      DisplayWidth = 11
      FieldName = 'CONDATAFIM'
      Origin = '"CM.CONTRATOIMOVEL".CONDATAFIM'
    end
    object qryDetContratosIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
      Origin = '"CM.CONTRATOXIMOVEL".IDIMOVEL'
      Visible = False
    end
    object qryDetContratosIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
      Origin = '"CM.CONTRATOXIMOVEL".IDCONTRATOIMOVEL'
      Visible = False
    end
    object qryDetContratosMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
      Origin = '"CM.CONTRATOXIMOVEL".MOECODIGO'
      Visible = False
    end
    object qryDetContratosIDLOCATARIO: TFloatField
      FieldName = 'IDLOCATARIO'
      Origin = '"CM.CONTRATOIMOVEL".IDLOCATARIO'
      Visible = False
    end
  end
  object dsContratos: TwwDataSource
    AutoEdit = False
    DataSet = qryDetContratos
    Left = 293
    Top = 351
  end
  object qryLookCaracteristicas: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDCATEGORIAIMOVEL, CTIDESCRICAO'
      'FROM'
      '  CATEGORIAIMOVEL'
      'ORDER BY'
      '  CTIDESCRICAO')
    ValidateWithMask = True
    Left = 776
    object qryLookCaracteristicasCTIDESCRICAO: TStringField
      DisplayLabel = 'Característica do Imóvel'
      DisplayWidth = 60
      FieldName = 'CTIDESCRICAO'
      Origin = 'CATEGORIAIMOVEL.CTIDESCRICAO'
      Size = 60
    end
    object qryLookCaracteristicasIDCATEGORIAIMOVEL: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCATEGORIAIMOVEL'
      Origin = 'CATEGORIAIMOVEL.IDCATEGORIAIMOVEL'
      Visible = False
    end
  end
  object qryLookEstado: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  CODESTADO, IDPAIS'
      'FROM'
      '  ESTADO'
      'ORDER BY'
      '  CODESTADO')
    ValidateWithMask = True
    Left = 733
    Top = 391
    object qryLookEstadoPAIS: TStringField
      DisplayLabel = 'País'
      DisplayWidth = 30
      FieldKind = fkLookup
      FieldName = 'PAIS'
      LookupDataSet = qryLookPais
      LookupKeyFields = 'IDPAIS'
      LookupResultField = 'NOMEPAIS'
      KeyFields = 'IDPAIS'
      Size = 30
      Lookup = True
    end
    object qryLookEstadoCODESTADO: TStringField
      DisplayLabel = 'Estado'
      DisplayWidth = 3
      FieldName = 'CODESTADO'
      Origin = 'ESTADO.CODESTADO'
      Visible = False
      Size = 3
    end
    object qryLookEstadoIDPAIS: TFloatField
      FieldName = 'IDPAIS'
      Origin = 'ESTADO.IDPAIS'
      Visible = False
    end
  end
  object qryLookPais: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDPAIS, NOMEPAIS'
      'FROM'
      '  PAIS'
      'WHERE'
      '  ( IDPAIS =:PAIS )'
      'ORDER BY'
      '  NOMEPAIS')
    ValidateWithMask = True
    Left = 373
    Top = 363
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PAIS'
        ParamType = ptUnknown
      end>
    object qryLookPaisIDPAIS: TFloatField
      FieldName = 'IDPAIS'
      Origin = 'PAIS.IDPAIS'
    end
    object qryLookPaisNOMEPAIS: TStringField
      FieldName = 'NOMEPAIS'
      Origin = 'PAIS.NOMEPAIS'
      Size = 30
    end
  end
  object dsPais: TwwDataSource
    DataSet = qryLookPais
    Left = 373
    Top = 351
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
    Left = 440
    Top = 88
  end
  object qryAuxEnd: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDIMOVEL, IMOLOGRADOURO, IMONUMERO, IMOCOMPLEMENTO,'
      '  IMOBAIRRO, IMOCIDADE, IMONOMEENDERECO, IMOCEP,'
      '  CODESTADO, IDPAIS'
      'FROM'
      '  IMOVEL'
      'WHERE'
      '  ( IDIMOVEL =:IMOVEL )')
    ValidateWithMask = True
    Left = 536
    Top = 100
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IMOVEL'
        ParamType = ptUnknown
      end>
    object qryAuxEndIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
      Origin = 'IMOVEL.IDIMOVEL'
    end
    object qryAuxEndIMOLOGRADOURO: TStringField
      FieldName = 'IMOLOGRADOURO'
      Origin = '"CM.IMOVEL".IMOLOGRADOURO'
      Size = 80
    end
    object qryAuxEndIMONUMERO: TStringField
      FieldName = 'IMONUMERO'
      Origin = 'IMOVEL.IMONUMERO'
      Size = 8
    end
    object qryAuxEndIMOCOMPLEMENTO: TStringField
      FieldName = 'IMOCOMPLEMENTO'
      Origin = 'IMOVEL.IMOCOMPLEMENTO'
    end
    object qryAuxEndIMONOMEENDERECO: TStringField
      FieldName = 'IMONOMEENDERECO'
      Origin = '"CM.IMOVEL".IMONOMEENDERECO'
      Size = 60
    end
    object qryAuxEndIMOBAIRRO: TStringField
      FieldName = 'IMOBAIRRO'
      Origin = 'IMOVEL.IMOBAIRRO'
    end
    object qryAuxEndIMOCIDADE: TStringField
      FieldName = 'IMOCIDADE'
      Origin = 'IMOVEL.IMOCIDADE'
    end
    object qryAuxEndIMOCEP: TStringField
      FieldName = 'IMOCEP'
      Origin = 'IMOVEL.IMOCEP'
      Size = 8
    end
    object qryAuxEndCODESTADO: TStringField
      FieldName = 'CODESTADO'
      Origin = 'IMOVEL.CODESTADO'
      Size = 3
    end
    object qryAuxEndIDPAIS: TFloatField
      FieldName = 'IDPAIS'
      Origin = 'IMOVEL.IDPAIS'
    end
  end
  object dsIndicador: TwwDataSource
    DataSet = dtmLookImobiliario.qryLookIndicadorPorData
    Left = 728
    Top = 318
  end
  object qryLookMoeda: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  MOECODIGO, MOEDESC, MOESIGLA'
      'FROM'
      '  MOEDA'
      'ORDER BY '
      '  MOESIGLA')
    ValidateWithMask = True
    Left = 733
    Top = 379
    object qryLookMoedaMOESIGLA: TStringField
      DisplayLabel = 'Moeda'
      DisplayWidth = 6
      FieldName = 'MOESIGLA'
      Size = 10
    end
    object qryLookMoedaMOECODIGO: TFloatField
      DisplayWidth = 10
      FieldName = 'MOECODIGO'
      Visible = False
    end
    object qryLookMoedaMOEDESC: TStringField
      DisplayWidth = 20
      FieldName = 'MOEDESC'
      Visible = False
    end
  end
  object qryLookMarca: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDMARCA, MRCNOME'
      'FROM'
      '  MARCAS'
      'ORDER BY'
      '  MRCNOME')
    ValidateWithMask = True
    Left = 733
    Top = 367
    object qryLookMarcaMRCNOME: TStringField
      DisplayLabel = 'Marca'
      DisplayWidth = 40
      FieldName = 'MRCNOME'
      Origin = '"CM.MARCAS".MRCNOME'
      Size = 40
    end
    object qryLookMarcaIDMARCA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDMARCA'
      Origin = '"CM.MARCAS".IDMARCA'
      Visible = False
    end
  end
  object qryInvestimento: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   I.IDINVESTIMENTO,'
      '   I.DESCINVESTIMENTO,'
      '   I.IDEMISSOR, I.IDTIPOINVEST, I.IDMOEDACONTAB'
      'FROM'
      '   INVESTIMENTO I')
    UpdateObject = updInvestimento
    ValidateWithMask = True
    Left = 653
    Top = 363
    object qryInvestimentoIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Origin = 'INVESTIMENTO.IDINVESTIMENTO'
    end
    object qryInvestimentoIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'INVESTIMENTO.IDTIPOINVEST'
    end
    object qryInvestimentoIDMOEDACONTAB: TFloatField
      FieldName = 'IDMOEDACONTAB'
      Origin = 'INVESTIMENTO.IDMOEDACONTAB'
    end
    object qryInvestimentoIDEMISSOR: TFloatField
      FieldName = 'IDEMISSOR'
      Origin = 'INVESTIMENTO.IDEMISSOR'
    end
    object qryInvestimentoDESCINVESTIMENTO: TStringField
      FieldName = 'DESCINVESTIMENTO'
      Origin = 'INVESTIMENTO.DESCINVESTIMENTO'
      Size = 60
    end
  end
  object updInvestimento: TUpdateSQL
    ModifySQL.Strings = (
      'update INVESTIMENTO'
      'set'
      '  IDINVESTIMENTO = :IDINVESTIMENTO,'
      '  DESCINVESTIMENTO = :DESCINVESTIMENTO,'
      '  IDEMISSOR = :IDEMISSOR,'
      '  IDTIPOINVEST = :IDTIPOINVEST,'
      '  IDMOEDACONTAB = :IDMOEDACONTAB'
      'where'
      '  IDINVESTIMENTO = :OLD_IDINVESTIMENTO')
    InsertSQL.Strings = (
      'insert into INVESTIMENTO'
      '  (IDINVESTIMENTO, DESCINVESTIMENTO, IDEMISSOR, IDTIPOINVEST, '
      'IDMOEDACONTAB)'
      'values'
      '  (:IDINVESTIMENTO, :DESCINVESTIMENTO, NULL, 3, NULL)')
    DeleteSQL.Strings = (
      'delete from INVESTIMENTO'
      'where'
      '  IDINVESTIMENTO = :OLD_IDINVESTIMENTO')
    Left = 653
    Top = 351
  end
  object qryLookSubConta: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   CODSUBCONTA, NOMESUBCONTA'
      'FROM'
      '   SUBCONTA'
      'WHERE'
      '   IDPESSOA =:EMPRESAPROP'
      'ORDER BY'
      '   NOMESUBCONTA')
    ValidateWithMask = True
    Left = 536
    Top = 56
    ParamData = <
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end>
  end
  object qryEvento: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   E.IDEVENTOIMOVEL, E.IDIMOVEL,'
      '   E.EVIDATA, E.EVICABECALHO, E.EVIDESCRICAO,'
      '   E.IDUSUARIO,'
      ''
      '   U.NOMEUSUARIO, PU.NOME'
      ''
      'FROM'
      '   PESSOA PU, EVENTOIMOVEL E, USUARIOSISTEMA U'
      ''
      'WHERE'
      '   ( E.IDIMOVEL =:IMOVEL )'
      '   AND ( E.IDUSUARIO = U.IDUSUARIO(+) )'
      '   AND ( U.IDUSUARIO = PU.IDPESSOA(+) )'
      ''
      'ORDER BY'
      '   E.EVIDATA, E.EVICABECALHO')
    ValidateWithMask = True
    Left = 448
    Top = 364
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IMOVEL'
        ParamType = ptUnknown
      end>
    object qryEVIDATA: TDateTimeField
      DisplayLabel = 'Data'
      DisplayWidth = 10
      FieldName = 'EVIDATA'
      Origin = 'EVENTOIMOVEL.EVIDATA'
    end
    object qryEVICABECALHO: TStringField
      DisplayLabel = 'Histórico'
      DisplayWidth = 60
      FieldName = 'EVICABECALHO'
      Origin = 'EVENTOIMOVEL.EVICABECALHO'
      Size = 60
    end
    object FloatField1: TFloatField
      FieldName = 'IDIMOVEL'
      Origin = 'EVENTOIMOVEL.IDIMOVEL'
      Visible = False
    end
    object qryIDEVENTOIMOVEL: TFloatField
      FieldName = 'IDEVENTOIMOVEL'
      Origin = 'EVENTOIMOVEL.IDEVENTOIMOVEL'
      Visible = False
    end
    object qryEventoEVIDESCRICAO: TMemoField
      FieldName = 'EVIDESCRICAO'
      Origin = 'EVENTOIMOVEL.EVIDESCRICAO'
      BlobType = ftMemo
      Size = 2000
    end
    object qryEventoIDUSUARIO: TFloatField
      FieldName = 'IDUSUARIO'
    end
    object qryEventoNOMEUSUARIO: TStringField
      FieldName = 'NOMEUSUARIO'
      FixedChar = True
    end
    object qryEventoNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
  end
  object dsEvento: TwwDataSource
    DataSet = qryEvento
    Left = 448
    Top = 352
  end
  object qryOutroDadoXImovel: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   OX.IDIMOVEL, OX.IDOUTRODADO, OX.ODIVALOR,'
      '   O.ODODESCRICAO'
      'FROM'
      '   OUTRODADOXIMOVEL OX, OUTRODADO O'
      'WHERE'
      '       ( OX.IDIMOVEL =:IMOVEL )'
      '   AND ( OX.IDOUTRODADO = O.IDOUTRODADO )'
      'ORDER BY'
      '   O.ODODESCRICAO')
    ValidateWithMask = True
    Left = 552
    Top = 364
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IMOVEL'
        ParamType = ptUnknown
      end>
    object qryODODESCRICAO: TStringField
      DisplayLabel = 'Tipo de Dado Complementar'
      DisplayWidth = 37
      FieldName = 'ODODESCRICAO'
      Origin = 'OUTRODADO.ODODESCRICAO'
      Size = 40
    end
    object qryODIVALOR: TStringField
      DisplayLabel = ' '
      DisplayWidth = 50
      FieldName = 'ODIVALOR'
      Origin = 'OUTRODADOXIMOVEL.ODIVALOR'
      Size = 60
    end
    object FloatField2: TFloatField
      FieldName = 'IDIMOVEL'
      Origin = 'OUTRODADOXIMOVEL.IDIMOVEL'
      Visible = False
    end
    object qryIDOUTRODADO: TFloatField
      FieldName = 'IDOUTRODADO'
      Origin = 'OUTRODADOXIMOVEL.IDOUTRODADO'
      Visible = False
    end
  end
  object dsOutroDadoXImovel: TwwDataSource
    DataSet = qryOutroDadoXImovel
    Left = 552
    Top = 352
  end
  object dsDesmembramentos: TwwDataSource
    DataSet = dtmCAF.qryDesmembramentos
    Left = 169
    Top = 345
  end
end
