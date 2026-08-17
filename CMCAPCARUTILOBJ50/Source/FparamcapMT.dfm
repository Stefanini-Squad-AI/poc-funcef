inherited frmParamCapMT: TfrmParamCapMT
  Left = 16
  Top = 67
  Caption = 'Parametros do Contas a Pagar'
  ClientHeight = 506
  ClientWidth = 774
  ParentFont = True
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 774
    Height = 420
    object PageContas: TPageControl
      Left = 1
      Top = 1
      Width = 772
      Height = 418
      ActivePage = tbstLancDoc
      Align = alClient
      TabHeight = 23
      TabOrder = 0
      object TbsGeralI: TTabSheet
        Caption = 'Gerais I'
        object LblAdtoForCli: TLabel
          Left = 202
          Top = 68
          Width = 218
          Height = 13
          Caption = 'Código do Adiantamento a Fornecedor'
        end
        object LblRamoTipoForCli: TLabel
          Left = 202
          Top = 110
          Width = 197
          Height = 13
          Caption = 'Tipo de Cliente para Adiantamento'
        end
        object LblEmisCqCarta: TLabel
          Left = 202
          Top = 193
          Width = 171
          Height = 13
          Caption = 'Local de Emissão de Cheques'
        end
        object Label17: TLabel
          Left = 202
          Top = 152
          Width = 178
          Height = 13
          Caption = 'Tipo de Documento para CPMF'
        end
        object Label5ContascaixaCheque: TLabel
          Left = 202
          Top = 236
          Width = 258
          Height = 13
          Caption = 'Conta/Caixa padrão para Emissão de Cheque'
        end
        object grpMascara: TGroupBox
          Left = 4
          Top = 1
          Width = 173
          Height = 49
          Caption = 'Máscara p/Desembolso'
          TabOrder = 0
          object dbedMascara: TDBEdit
            Left = 9
            Top = 18
            Width = 153
            Height = 21
            DataField = 'MASCARADESEMB'
            DataSource = ds
            TabOrder = 0
            OnKeyPress = dbedMascaraKeyPress
          end
        end
        object grpIntegracao: TGroupBox
          Left = 5
          Top = 97
          Width = 181
          Height = 85
          Caption = '     Integração Contábil      '
          TabOrder = 1
          object sbtnSim: TSpeedButton
            Left = 22
            Top = 17
            Width = 127
            Height = 29
            GroupIndex = 1
            Caption = 'Si&m'
            Glyph.Data = {
              16030000424D160300000000000076000000280000003F000000150000000100
              040000000000A002000000000000000000001000000010000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
              7777777777777777777777777777777777777777777777777770777888888888
              8888887777778888888888888887777778888888888888887770770000000000
              000008888770000000000000008888770000000000000008888070B7B7B70FBF
              BFB7B000070B7B7B70FBFBFB7B000070B7B7B70FBFBFB7B0000070FBFFFF0BFB
              FBFB7B7B770FBFFFF0BFBFBFB7B7B770FBFFFF0BFBFBFB7B7B7077000000BFBF
              BFFFB7B7B77000000BFBFBFFFB7B7B77000000BFBFBFFFB7B7B0707B7B7B0BFB
              FBFBFBFBF707B7B7B0BFBFBFBFBFBF707B7B7B0BFBFBFBFBFBF070BFBFFF0FFF
              FFFFBFBFB70BFBFFF0FFFFFFFBFBFB70BFBFFF0FFFFFFFBFBFB077000000FBFF
              FFFBFFFBF77000000FBFFFFFBFFFBF77000000FBFFFFFBFFFBF070B7B7BF0FF0
              FFFFFFBFF70B7B7BF0FF0FFFFFFBFF70B7B7BF0FF0FFFFFFBFF070FBFFFB0B0F
              FBFBFBFBF70FBFFFB0B0FFBFBFBFBF70FBFFFB0B0FFBFBFBFBF077000000BF0F
              BFFFFFFFF77000000BF0FBFFFFFFFF77000000BF0FBFFFFFFFF0707B7BFB00FB
              FBFBFBFBF707B7BFB00FBFBFBFBFBF707B7BFB00FBFBFBFBFBF070BFBFFF00FF
              BFBF0000070BFBFFF00FFBFBF0000070BFBFFF00FFBFBF0000007700000000FB
              FBF0777777700000000FBFBF0777777700000000FBFBF08888807777777770BF
              BF07777777777777770BFBF07777777777777770BFBF08888880777777770BFB
              F07777777777777770BFBF07777777777777770BFBF088777770777777770FBF
              077777777777777770FBF077777777777777770FBF0887777770777777770BF0
              777777777777777770BF0777777777777777770BF08877777770777777770FB0
              777777777777777770FB0777777777777777770FB08777777770777777777007
              7777777777777777770077777777777777777770087777777770}
            NumGlyphs = 3
            OnClick = sbtnSimClick
          end
          object sbtnNao: TSpeedButton
            Left = 22
            Top = 49
            Width = 127
            Height = 29
            GroupIndex = 1
            Caption = '&Não'
            Glyph.Data = {
              DE010000424DDE01000000000000760000002800000024000000120000000100
              0400000000006801000000000000000000001000000010000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              3333333333333FFFFF333333000033333388888833333333333F888888FFF333
              000033338811111188333333338833FFF388FF33000033381119999111833333
              38F338888F338FF30000339119933331111833338F388333383338F300003391
              13333381111833338F8F3333833F38F3000039118333381119118338F38F3338
              33F8F38F000039183333811193918338F8F333833F838F8F0000391833381119
              33918338F8F33833F8338F8F000039183381119333918338F8F3833F83338F8F
              000039183811193333918338F8F833F83333838F000039118111933339118338
              F3833F83333833830000339111193333391833338F33F8333FF838F300003391
              11833338111833338F338FFFF883F83300003339111888811183333338FF3888
              83FF83330000333399111111993333333388FFFFFF8833330000333333999999
              3333333333338888883333330000333333333333333333333333333333333333
              0000}
            NumGlyphs = 2
            OnClick = sbtnNaoClick
          end
        end
        object GroupBox1: TGroupBox
          Left = 4
          Top = 50
          Width = 173
          Height = 44
          Caption = ' Nº Dias Para Vencimento '
          TabOrder = 2
          object wwDBSpinEdit7: TwwDBSpinEdit
            Left = 83
            Top = 15
            Width = 82
            Height = 21
            Increment = 1
            DataField = 'NUMDIASVENCTO'
            DataSource = ds
            TabOrder = 0
            UnboundDataType = wwDefault
          end
        end
        object GroupBox3: TGroupBox
          Left = 181
          Top = 1
          Width = 401
          Height = 61
          Caption = ' Número do Documento '
          TabOrder = 3
          object Label13: TLabel
            Left = 12
            Top = 16
            Width = 49
            Height = 13
            Caption = 'Máscara'
          end
          object Label14: TLabel
            Left = 274
            Top = 20
            Width = 117
            Height = 26
            Caption = 'Atribui tipo de fatura ao Complemento'
            Enabled = False
            Visible = False
            WordWrap = True
          end
          object wwDBEdit1: TwwDBEdit
            Left = 12
            Top = 31
            Width = 233
            Height = 21
            DataField = 'MASCARANODOCUM'
            DataSource = ds
            TabOrder = 0
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object DBCheckBox3: TDBCheckBox
            Left = 255
            Top = 20
            Width = 15
            Height = 17
            DataField = 'FLGCOMPLTIPOFAT'
            DataSource = ds
            Enabled = False
            TabOrder = 1
            ValueChecked = 'S'
            ValueUnchecked = 'N'
            Visible = False
          end
        end
        object wwDBLookupCombo1: TwwDBLookupCombo
          Left = 202
          Top = 84
          Width = 375
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'35'#9'Descrição'#9'No')
          DataField = 'CODADFORNE'
          DataSource = ds
          LookupTable = cdsTipoDoc
          LookupField = 'CODTIPDOC'
          Options = [loTitles]
          Style = csDropDownList
          TabOrder = 4
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
        object CbCli: TwwDBLookupCombo
          Left = 202
          Top = 126
          Width = 375
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'40'#9'Descrição')
          DataField = 'IDTIPOCLIADIANTO'
          DataSource = ds
          LookupTable = cdsTipoCli
          LookupField = 'IDTIPOCLIENTE'
          Style = csDropDownList
          TabOrder = 5
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
        object CmDblRamoForn: TCMDBLookupCombo
          Left = 202
          Top = 126
          Width = 375
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRAMOFORNECEDOR'#9'30'#9'DESCRAMOFORNECEDOR')
          DataField = 'IDRAMOFORNECEDOR'
          DataSource = ds
          LookupTable = cdsRamoForn
          LookupField = 'IDRAMOFORNECEDOR'
          Options = [loTitles]
          Style = csDropDownList
          TabOrder = 6
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
        object dbedLocal: TDBEdit
          Left = 202
          Top = 208
          Width = 375
          Height = 21
          DataField = 'LOCALEMISCHEQUE'
          DataSource = ds
          TabOrder = 7
        end
        object CmbTipODocCpmf: TwwDBLookupCombo
          Left = 202
          Top = 168
          Width = 375
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'35'#9'Descrição'#9'No')
          DataField = 'CODTIPDOCCPMF'
          DataSource = ds
          LookupTable = cdsTipoDocCPMF
          LookupField = 'CODTIPDOC'
          Options = [loTitles]
          Style = csDropDownList
          TabOrder = 8
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
        object CmbContasCaixaCheque: TwwDBLookupCombo
          Left = 202
          Top = 251
          Width = 375
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'50'#9'Conta Caixa X Forma de Pagamento'#9'F')
          DataField = 'CODPORTFORMA'
          DataSource = ds
          LookupTable = cdsFormaRecPag
          LookupField = 'CODPORTFORMA'
          Options = [loTitles]
          Style = csDropDownList
          TabOrder = 9
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
        object GrbIntegraOrc: TGroupBox
          Left = 5
          Top = 189
          Width = 183
          Height = 85
          Caption = '     Integração Orçamentária '
          TabOrder = 10
          object spdIntegraOrc: TSpeedButton
            Left = 22
            Top = 16
            Width = 127
            Height = 29
            GroupIndex = 1
            Caption = 'Si&m'
            Glyph.Data = {
              16030000424D160300000000000076000000280000003F000000150000000100
              040000000000A002000000000000000000001000000010000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
              7777777777777777777777777777777777777777777777777770777888888888
              8888887777778888888888888887777778888888888888887770770000000000
              000008888770000000000000008888770000000000000008888070B7B7B70FBF
              BFB7B000070B7B7B70FBFBFB7B000070B7B7B70FBFBFB7B0000070FBFFFF0BFB
              FBFB7B7B770FBFFFF0BFBFBFB7B7B770FBFFFF0BFBFBFB7B7B7077000000BFBF
              BFFFB7B7B77000000BFBFBFFFB7B7B77000000BFBFBFFFB7B7B0707B7B7B0BFB
              FBFBFBFBF707B7B7B0BFBFBFBFBFBF707B7B7B0BFBFBFBFBFBF070BFBFFF0FFF
              FFFFBFBFB70BFBFFF0FFFFFFFBFBFB70BFBFFF0FFFFFFFBFBFB077000000FBFF
              FFFBFFFBF77000000FBFFFFFBFFFBF77000000FBFFFFFBFFFBF070B7B7BF0FF0
              FFFFFFBFF70B7B7BF0FF0FFFFFFBFF70B7B7BF0FF0FFFFFFBFF070FBFFFB0B0F
              FBFBFBFBF70FBFFFB0B0FFBFBFBFBF70FBFFFB0B0FFBFBFBFBF077000000BF0F
              BFFFFFFFF77000000BF0FBFFFFFFFF77000000BF0FBFFFFFFFF0707B7BFB00FB
              FBFBFBFBF707B7BFB00FBFBFBFBFBF707B7BFB00FBFBFBFBFBF070BFBFFF00FF
              BFBF0000070BFBFFF00FFBFBF0000070BFBFFF00FFBFBF0000007700000000FB
              FBF0777777700000000FBFBF0777777700000000FBFBF08888807777777770BF
              BF07777777777777770BFBF07777777777777770BFBF08888880777777770BFB
              F07777777777777770BFBF07777777777777770BFBF088777770777777770FBF
              077777777777777770FBF077777777777777770FBF0887777770777777770BF0
              777777777777777770BF0777777777777777770BF08877777770777777770FB0
              777777777777777770FB0777777777777777770FB08777777770777777777007
              7777777777777777770077777777777777777770087777777770}
            NumGlyphs = 3
            OnClick = spdIntegraOrcClick
          end
          object NspdIntegraOrc: TSpeedButton
            Left = 22
            Top = 48
            Width = 127
            Height = 29
            GroupIndex = 1
            Caption = '&Não'
            Glyph.Data = {
              DE010000424DDE01000000000000760000002800000024000000120000000100
              0400000000006801000000000000000000001000000010000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              3333333333333FFFFF333333000033333388888833333333333F888888FFF333
              000033338811111188333333338833FFF388FF33000033381119999111833333
              38F338888F338FF30000339119933331111833338F388333383338F300003391
              13333381111833338F8F3333833F38F3000039118333381119118338F38F3338
              33F8F38F000039183333811193918338F8F333833F838F8F0000391833381119
              33918338F8F33833F8338F8F000039183381119333918338F8F3833F83338F8F
              000039183811193333918338F8F833F83333838F000039118111933339118338
              F3833F83333833830000339111193333391833338F33F8333FF838F300003391
              11833338111833338F338FFFF883F83300003339111888811183333338FF3888
              83FF83330000333399111111993333333388FFFFFF8833330000333333999999
              3333333333338888883333330000333333333333333333333333333333333333
              0000}
            NumGlyphs = 2
            OnClick = NspdIntegraOrcClick
          end
        end
      end
      object TbsGeralII: TTabSheet
        Caption = 'Gerais II'
        object GroupBox2: TGroupBox
          Left = 10
          Top = 5
          Width = 615
          Height = 165
          Caption = 'Alteradores Para Lançamento de Juros / Correção'
          TabOrder = 0
          object Label7: TLabel
            Left = 16
            Top = 13
            Width = 82
            Height = 13
            Caption = 'Juros Simples:'
          end
          object Label8: TLabel
            Left = 16
            Top = 49
            Width = 32
            Height = 13
            Caption = 'Multa'
          end
          object Label9: TLabel
            Left = 16
            Top = 84
            Width = 94
            Height = 13
            Caption = 'Juros Composto:'
          end
          object Label10: TLabel
            Left = 16
            Top = 121
            Width = 52
            Height = 13
            Caption = 'Correção'
          end
          object wwDBLookupCombo6: TwwDBLookupCombo
            Left = 16
            Top = 27
            Width = 532
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'35'#9'Descrição')
            DataField = 'CODALTJUROSSIMPLES'
            DataSource = ds
            LookupTable = cdsAltJurosCor
            LookupField = 'CODALTERADOR'
            Style = csDropDownList
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
          object wwDBLookupCombo7: TwwDBLookupCombo
            Left = 16
            Top = 62
            Width = 532
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'35'#9'DESCRICAO')
            DataField = 'CODALTMULTA'
            DataSource = ds
            LookupTable = cdsAltJurosCor
            LookupField = 'CODALTERADOR'
            Style = csDropDownList
            TabOrder = 1
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
          object wwDBLookupCombo8: TwwDBLookupCombo
            Left = 16
            Top = 99
            Width = 532
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'35'#9'Descrição')
            DataField = 'CODALTJUROSCOMPOSTO'
            DataSource = ds
            LookupTable = cdsAltJurosCor
            LookupField = 'CODALTERADOR'
            Style = csDropDownList
            TabOrder = 2
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
          object wwDBLookupCombo9: TwwDBLookupCombo
            Left = 16
            Top = 135
            Width = 532
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'35'#9'Descrição')
            DataField = 'CODALTCORRECAO'
            DataSource = ds
            LookupTable = cdsAltJurosCor
            LookupField = 'CODALTERADOR'
            Style = csDropDownList
            TabOrder = 3
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
        end
        object CkbCalcBaixa: TDBCheckBox
          Left = 21
          Top = 210
          Width = 364
          Height = 17
          Caption = 'Calcula Correção Automaticamente na baixa do documento '
          DataField = 'FLGCORRIGEDOCAUTO'
          DataSource = ds
          TabOrder = 1
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object CkbTalao: TDBCheckBox
          Left = 21
          Top = 248
          Width = 279
          Height = 17
          Caption = 'Controla Talonário e Numeração de Cheques'
          DataField = 'FLGCONTROLACHEQUE'
          DataSource = ds
          TabOrder = 3
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object CkcFloatContabil: TDBCheckBox
          Left = 21
          Top = 304
          Width = 396
          Height = 17
          Caption = 'Considera o FLOAT para lançamento de baixas na contabilidade'
          DataField = 'FLGLANCAFLOAT'
          DataSource = ds
          TabOrder = 6
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object dbchkModAdDocPG: TDBCheckBox
          Left = 21
          Top = 267
          Width = 299
          Height = 17
          Caption = 'Modifica Alteradores para Documentos Baixados'
          DataField = 'FLGMODADDOCPG'
          DataSource = ds
          TabOrder = 4
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object chkFloatdiasuteis: TDBCheckBox
          Left = 21
          Top = 323
          Width = 252
          Height = 17
          Caption = 'FLOATS consideram somente dias úteis'
          DataField = 'FLGFLOATDIAUTIL'
          DataSource = ds
          TabOrder = 7
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object ChkObrigaUsuario: TDBCheckBox
          Left = 21
          Top = 229
          Width = 608
          Height = 17
          Caption = 
            'Na Impressão da Ficha de Conpensação, obrigar o preenchimento do' +
            ' usuário que lançou o documento'
          DataField = 'FLGOBRIGAUSUARIO'
          DataSource = ds
          TabOrder = 2
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object DBCheckBox5: TDBCheckBox
          Left = 21
          Top = 285
          Width = 195
          Height = 17
          Caption = 'Baixa na Emissão do Cheque'
          DataField = 'FLGBAIXACHQ'
          DataSource = ds
          TabOrder = 5
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
      end
      object tbstLancDoc: TTabSheet
        Caption = 'Lançamento de Documentos'
        ImageIndex = 6
        object GroupBox6: TGroupBox
          Left = 13
          Top = 257
          Width = 692
          Height = 117
          Caption = 'Plano e Patrocinadora'
          TabOrder = 9
          object Label5: TLabel
            Left = 12
            Top = 22
            Width = 118
            Height = 13
            Caption = 'Plano Previdenciário'
          end
          object Label6: TLabel
            Left = 12
            Top = 68
            Width = 80
            Height = 13
            Caption = 'Patrocinadora'
          end
          object cmbPlanoPrev: TwwDBLookupCombo
            Left = 12
            Top = 37
            Width = 640
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'40'#9'Plano Previdenciário'#9'F')
            DataField = 'IDPLANOPREV'
            DataSource = ds
            LookupTable = cdsPlano
            LookupField = 'IDPLANOPREV'
            Style = csDropDownList
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
          object cmbPatro: TwwDBLookupCombo
            Left = 12
            Top = 82
            Width = 640
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'60'#9'Patrocinadora'#9'F')
            DataField = 'IDPATRO'
            DataSource = ds
            LookupTable = cdsPatro
            LookupField = 'IDPESSOA'
            Style = csDropDownList
            TabOrder = 1
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
        end
        object CkbEmiteChq: TDBCheckBox
          Left = 13
          Top = 26
          Width = 281
          Height = 17
          Caption = 'Emite Cheque para Lança e Baixa simultânea'
          DataField = 'FLGEMITELANCBAIX'
          DataSource = ds
          TabOrder = 1
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object ChkObrigaFormaPagto: TDBCheckBox
          Left = 13
          Top = 6
          Width = 515
          Height = 17
          Caption = 
            'Obriga Indicação de Forma de Pagamento no Momento do Lançamento ' +
            'do Documento'
          DataField = 'FLGOBRIGFORMAPGTO'
          DataSource = ds
          TabOrder = 0
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object DBCheckBox4: TDBCheckBox
          Left = 13
          Top = 46
          Width = 156
          Height = 17
          Caption = 'Gera SLIP Automatico'
          DataField = 'FLGSLIPAUTO'
          DataSource = ds
          TabOrder = 2
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object DBCheckBox6: TDBCheckBox
          Left = 13
          Top = 66
          Width = 140
          Height = 17
          Caption = 'Gera OP Automático'
          DataField = 'FLGOPAUTO'
          DataSource = ds
          TabOrder = 3
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object ChkObrigaProg: TDBCheckBox
          Left = 13
          Top = 106
          Width = 396
          Height = 17
          Caption = 'Obriga Indicação do PROGRAMA no lançamento de Documentos'
          DataField = 'FLGOBRIGAPROG'
          DataSource = ds
          TabOrder = 5
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object dbckbRestringeAcesso: TDBCheckBox
          Left = 13
          Top = 86
          Width = 484
          Height = 17
          Caption = 
            'Restringe o Acesso ao Lançamento de Usuário pelo Centro de Respo' +
            'nsabilidade'
          DataField = 'FLGACESSLANCDOC'
          DataSource = ds
          TabOrder = 4
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object chkbRateio: TDBCheckBox
          Left = 13
          Top = 126
          Width = 695
          Height = 17
          Caption = 
            'No Rateio do Documento, Obrigar o Mesmo Plano Previdenciário Som' +
            'ente para Desembolsos/Recebimentos Positivos'
          DataField = 'FLGOBRIGAMESMOPP'
          DataSource = ds
          TabOrder = 6
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object dbChkDesvinculaCentrocusto: TDBCheckBox
          Left = 13
          Top = 145
          Width = 436
          Height = 17
          Caption = 
            'Desvincular Centros de Custo da Parametrização Contábil Predomin' +
            'ante.'
          DataField = 'FLGDESVINCCC'
          DataSource = ds
          TabOrder = 7
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object GroupBox8: TGroupBox
          Left = 14
          Top = 164
          Width = 692
          Height = 92
          Caption = ' Cálculo de Impostos no lançamento de documentos a pagar '
          TabOrder = 8
          object Label16: TLabel
            Left = 28
            Top = 20
            Width = 329
            Height = 13
            Caption = 'Valor mínimo para lançamento do alterador IRRF (Tributo)'
          end
          object Label18: TLabel
            Left = 28
            Top = 42
            Width = 343
            Height = 13
            Caption = 'Valor mínimo para retenção das contribuições sociais (base)'
          end
          object Label19: TLabel
            Left = 28
            Top = 64
            Width = 187
            Height = 13
            Caption = 'Base limite para cálculo do INSS'
          end
          object edtVLRMINIRRF: TDBRealEdit
            Left = 374
            Top = 16
            Width = 121
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '0,00')
            TabOrder = 0
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'VLRMINIRRF'
            DataSource = ds
          end
          object edtVLRMINCS: TDBRealEdit
            Left = 374
            Top = 38
            Width = 121
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '0,00')
            TabOrder = 1
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'VLRMINCS'
            DataSource = ds
          end
          object edtVLRBASEINSS2: TDBRealEdit
            Left = 374
            Top = 60
            Width = 121
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '0,00')
            TabOrder = 2
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'VLRBASEINSS'
            DataSource = ds
          end
        end
      end
      object TbsBaixas: TTabSheet
        Caption = 'Baixas'
        object dbrgrpLancaFin: TDBRadioGroup
          Left = 286
          Top = 5
          Width = 297
          Height = 78
          Caption = '  Momento de Lançamento no Financeiro  '
          DataField = 'LANCAFINANC'
          DataSource = ds
          Items.Strings = (
            'Exclusivamente no Pagamento do Documento '
            'Emissão Chq/Bord ou Pagamento do Doc')
          TabOrder = 2
          Values.Strings = (
            'N'
            'S')
        end
        object GrpHistFinanc: TGroupBox
          Left = 286
          Top = 85
          Width = 298
          Height = 50
          Caption = ' Histórico Financeiro '
          TabOrder = 0
          object dblkcmbfinan: TwwDBLookupCombo
            Left = 10
            Top = 17
            Width = 278
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'60'#9'Descrição')
            DataField = 'HISTPADFINAN'
            DataSource = ds
            LookupTable = cdsHistFinanc
            LookupField = 'HISTPADFINAN'
            Options = [loTitles]
            Style = csDropDownList
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
        end
        object GbAlt: TGroupBox
          Left = 6
          Top = 6
          Width = 275
          Height = 214
          Caption = ' Alteradores Para Remessa\Baixa Eletrônica: '
          TabOrder = 1
          object Label1: TLabel
            Left = 10
            Top = 22
            Width = 68
            Height = 13
            Caption = 'Abatimento:'
          end
          object Label2: TLabel
            Left = 10
            Top = 63
            Width = 59
            Height = 13
            Caption = 'Desconto:'
          end
          object Label3: TLabel
            Left = 10
            Top = 107
            Width = 35
            Height = 13
            Caption = 'Juros:'
          end
          object Label4: TLabel
            Left = 10
            Top = 152
            Width = 42
            Height = 13
            Caption = 'Outros:'
          end
          object wwDBLookupCombo2: TwwDBLookupCombo
            Left = 10
            Top = 37
            Width = 236
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'35'#9'DESCRICAO')
            DataField = 'CODALTERADORABAT'
            DataSource = ds
            LookupTable = cdsAltAbatDesc
            LookupField = 'CODALTERADOR'
            Style = csDropDownList
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
          object wwDBLookupCombo4: TwwDBLookupCombo
            Left = 10
            Top = 79
            Width = 236
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'35'#9'DESCRICAO')
            DataField = 'CODALTERADORDESC'
            DataSource = ds
            LookupTable = cdsAltAbatDesc
            LookupField = 'CODALTERADOR'
            Style = csDropDownList
            TabOrder = 1
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
          object wwDBLookupCombo5: TwwDBLookupCombo
            Left = 10
            Top = 123
            Width = 236
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'35'#9'Descrição')
            DataField = 'CODALTERADORJUROS'
            DataSource = ds
            LookupTable = cdsJuros
            LookupField = 'CODALTERADOR'
            Style = csDropDownList
            TabOrder = 2
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
          object wwDBLookupCombo3: TwwDBLookupCombo
            Left = 10
            Top = 168
            Width = 236
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'35'#9'Descrição')
            DataField = 'CODALTERADORTARIF'
            DataSource = ds
            LookupTable = cdsAltAbatDesc
            LookupField = 'CODALTERADOR'
            Style = csDropDownList
            TabOrder = 3
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
        end
        object RgCanceLote: TDBRadioGroup
          Left = 287
          Top = 137
          Width = 298
          Height = 40
          Caption = ' Cancelamento do Lote '
          Columns = 2
          DataField = 'FLGESTEXCFINANC'
          DataSource = ds
          Items.Strings = (
            'Exclui no financeiro'
            'Estorna no financeiro')
          TabOrder = 3
          Values.Strings = (
            'X'
            'S')
        end
        object GpbTipoDesemb: TGroupBox
          Left = 6
          Top = 221
          Width = 578
          Height = 51
          Caption = ' Cadastro de Tipo de Desembolso '
          TabOrder = 4
          object RgTipoRd1: TDBCheckBox
            Left = 10
            Top = 14
            Width = 548
            Height = 18
            Caption = 
              'Vincula a Inclusão ao Relacionamento com Centro de Custo X Conta' +
              ' Contábil'
            DataField = 'FLGTRDXCCXCONTA'
            DataSource = ds
            TabOrder = 0
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object RgTipoRd2: TDBCheckBox
            Left = 10
            Top = 29
            Width = 548
            Height = 17
            Caption = 
              'Vincula a Inclusão ao Relacionamento com Centro de Custo X Impos' +
              'tos Agregados'
            DataField = 'FLGTRDXIMPOSTOS'
            DataSource = ds
            TabOrder = 1
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
        end
        object dbrgStatusFinanc: TDBRadioGroup
          Left = 6
          Top = 273
          Width = 578
          Height = 36
          Caption = '  Status para o Lançamento no Financeiro  '
          Columns = 2
          DataField = 'FLGSTATUSFINANC'
          DataSource = ds
          Items.Strings = (
            'Lançamento &Não Conciliado'
            'Lançamento na &Casa')
          TabOrder = 5
          Values.Strings = (
            'N'
            'C')
        end
        object TPanel
          Left = 287
          Top = 181
          Width = 298
          Height = 41
          BevelInner = bvLowered
          BevelOuter = bvSpace
          TabOrder = 7
          object dbckLogfinan: TDBCheckBox
            Left = 8
            Top = 13
            Width = 281
            Height = 17
            Caption = 'Gera Arquivo de Log de Lanç. no Financeiro'
            DataField = 'FLGGERALOGFINAN'
            DataSource = ds
            TabOrder = 0
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
        end
        object GroupBox7: TGroupBox
          Left = 6
          Top = 312
          Width = 578
          Height = 63
          Caption = ' Caminho de Criação do Arquivo ETL '
          TabOrder = 6
          object Label11: TLabel
            Left = 10
            Top = 18
            Width = 55
            Height = 13
            Caption = 'Produção'
          end
          object Label12: TLabel
            Left = 294
            Top = 18
            Width = 78
            Height = 13
            Caption = 'Homologação'
          end
          object wwDBEdit2: TwwDBEdit
            Left = 10
            Top = 33
            Width = 275
            Height = 21
            DataField = 'PathEtlProducao'
            DataSource = ds
            TabOrder = 0
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object wwDBEdit3: TwwDBEdit
            Left = 294
            Top = 33
            Width = 275
            Height = 21
            DataField = 'PathEtlHom'
            DataSource = ds
            TabOrder = 1
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
        end
      end
      object TbsRelatorios: TTabSheet
        Caption = 'Parâmetros de Relatórios'
        object Label15: TLabel
          Left = 11
          Top = 4
          Width = 289
          Height = 13
          Caption = 'Relatório Para Emissão de Espelho de Documento:'
        end
        object SpeedButton2: TSpeedButton
          Left = 400
          Top = 18
          Width = 25
          Height = 25
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            33033333333333333F7F3333333333333000333333333333F777333333333333
            000333333333333F777333333333333000333333333333F77733333333333300
            033333333FFF3F777333333700073B703333333F7773F77733333307777700B3
            33333377333777733333307F8F8F7033333337F333F337F3333377F8F9F8F773
            3333373337F3373F3333078F898F870333337F33F7FFF37F333307F99999F703
            33337F377777337F3333078F898F8703333373F337F33373333377F8F9F8F773
            333337F3373337F33333307F8F8F70333333373FF333F7333333330777770333
            333333773FF77333333333370007333333333333777333333333}
          NumGlyphs = 2
          OnClick = SpeedButton2Click
        end
        object Panel1: TPanel
          Left = 0
          Top = 48
          Width = 437
          Height = 215
          BevelOuter = bvNone
          Caption = 'Panel1'
          TabOrder = 0
          object Pnldocpendentes: TPanel
            Left = 0
            Top = 0
            Width = 437
            Height = 30
            Align = alTop
            BevelInner = bvLowered
            BevelWidth = 2
            Caption = 'Assinaturas e Vistos'
            Color = clGray
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -16
            Font.Name = 'Arial'
            Font.Style = [fsBold, fsItalic]
            ParentFont = False
            TabOrder = 0
          end
          object TreeAssin: TTreeView
            Left = 0
            Top = 30
            Width = 437
            Height = 185
            Align = alClient
            Images = ImlReports
            Indent = 23
            TabOrder = 1
            OnEdited = TreeAssinEdited
            OnEditing = TreeAssinEditing
          end
        end
        object grpIntervalos: TGroupBox
          Left = 442
          Top = 8
          Width = 138
          Height = 250
          Caption = ' Posição dos Saldos '
          TabOrder = 1
          object lbl1: TLabel
            Left = 96
            Top = 42
            Width = 24
            Height = 13
            Caption = 'dias'
          end
          object lbl2: TLabel
            Left = 96
            Top = 140
            Width = 24
            Height = 13
            Caption = 'dias'
          end
          object lbl4: TLabel
            Left = 96
            Top = 75
            Width = 24
            Height = 13
            Caption = 'dias'
          end
          object lbl5: TLabel
            Left = 96
            Top = 175
            Width = 24
            Height = 13
            Caption = 'dias'
          end
          object lbl6: TLabel
            Left = 96
            Top = 111
            Width = 24
            Height = 13
            Caption = 'dias'
          end
          object dias: TLabel
            Left = 96
            Top = 209
            Width = 24
            Height = 13
            Caption = 'dias'
          end
          object wwDBSpinEdit1: TwwDBSpinEdit
            Left = 22
            Top = 34
            Width = 64
            Height = 21
            Increment = 1
            MaxValue = 500
            DataField = 'DD30'
            DataSource = ds
            TabOrder = 0
            UnboundDataType = wwDefault
          end
          object wwDBSpinEdit2: TwwDBSpinEdit
            Left = 22
            Top = 67
            Width = 64
            Height = 21
            Increment = 1
            MaxValue = 500
            DataField = 'DD60'
            DataSource = ds
            TabOrder = 1
            UnboundDataType = wwDefault
          end
          object wwDBSpinEdit3: TwwDBSpinEdit
            Left = 22
            Top = 103
            Width = 64
            Height = 21
            Increment = 1
            MaxValue = 500
            DataField = 'DD90'
            DataSource = ds
            TabOrder = 2
            UnboundDataType = wwDefault
          end
          object wwDBSpinEdit4: TwwDBSpinEdit
            Left = 22
            Top = 132
            Width = 64
            Height = 21
            Increment = 1
            MaxValue = 500
            DataField = 'DD120'
            DataSource = ds
            MaxLength = 300
            TabOrder = 3
            UnboundDataType = wwDefault
          end
          object wwDBSpinEdit5: TwwDBSpinEdit
            Left = 22
            Top = 167
            Width = 64
            Height = 21
            Increment = 1
            MaxValue = 500
            DataField = 'DD150'
            DataSource = ds
            MaxLength = 300
            TabOrder = 4
            UnboundDataType = wwDefault
          end
          object wwDBSpinEdit6: TwwDBSpinEdit
            Left = 22
            Top = 201
            Width = 64
            Height = 21
            Increment = 1
            MaxValue = 500
            DataField = 'DD180'
            DataSource = ds
            MaxLength = 300
            TabOrder = 5
            UnboundDataType = wwDefault
          end
        end
        object DbeReports: TwwDBEdit
          Left = 11
          Top = 21
          Width = 388
          Height = 21
          Color = clGray
          DataField = 'NAME'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
          OnExit = DbeReportsExit
        end
      end
      object tbsIntegacao: TTabSheet
        Caption = 'Parametrização Contábil Predominante'
        ImageIndex = 5
        object GroupBox4: TGroupBox
          Left = 8
          Top = 56
          Width = 249
          Height = 225
          Caption = 'Obriga a indicação de:'
          TabOrder = 0
          object DBCheckBox1: TDBCheckBox
            Left = 8
            Top = 24
            Width = 169
            Height = 17
            Caption = 'Centro de Custo'
            DataField = 'FLGPCPCCUSTO'
            DataSource = ds
            TabOrder = 0
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object DBCheckBox2: TDBCheckBox
            Left = 8
            Top = 66
            Width = 169
            Height = 17
            Caption = 'Programa'
            DataField = 'FLGPCPPRG'
            DataSource = ds
            TabOrder = 1
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object DBCheckBox7: TDBCheckBox
            Left = 8
            Top = 108
            Width = 169
            Height = 17
            Caption = 'Plano Previdenciário'
            DataField = 'FLGPCPPATRO'
            DataSource = ds
            TabOrder = 2
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object ChkContaContabil: TDBCheckBox
            Left = 8
            Top = 150
            Width = 169
            Height = 17
            Caption = 'Conta Contábil a Débito'
            DataField = 'FLGPCPCONTA'
            DataSource = ds
            TabOrder = 4
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object ChkContaContabilPass: TDBCheckBox
            Left = 8
            Top = 192
            Width = 233
            Height = 17
            Caption = 'Conta Contábil a (Crédito)'
            DataField = 'FLGPCPCONTAPASS'
            DataSource = ds
            TabOrder = 3
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
        end
        object GroupBox5: TGroupBox
          Left = 272
          Top = 56
          Width = 481
          Height = 225
          Caption = 'Hierarquia de busca (na sequência): '
          TabOrder = 1
          object chkPcp1: TDBCheckBox
            Left = 8
            Top = 24
            Width = 457
            Height = 17
            Caption = ', Centro de Custo, Programa e Plano Previdenciário'
            DataField = 'FLGPCPDECCPRPA'
            DataSource = ds
            TabOrder = 0
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object chkPcp2: TDBCheckBox
            Left = 8
            Top = 48
            Width = 393
            Height = 17
            Caption = ', Centro de Custo e Programa'
            DataField = 'FLGPCPDECCPR'
            DataSource = ds
            TabOrder = 1
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object chkPcp3: TDBCheckBox
            Left = 8
            Top = 72
            Width = 401
            Height = 17
            Caption = ' e Centro de Custo'
            DataField = 'FLGPCPDECC'
            DataSource = ds
            TabOrder = 2
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object chkPcp4: TDBCheckBox
            Left = 8
            Top = 96
            Width = 393
            Height = 17
            Caption = ' e Programa'
            DataField = 'FLGPCPDEPR'
            DataSource = ds
            TabOrder = 3
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object chkPcp5: TDBCheckBox
            Left = 8
            Top = 120
            Width = 393
            Height = 17
            Caption = ', Centro de Custo e Plano Previdenciário'
            DataField = 'FLGPCPDECCPA'
            DataSource = ds
            TabOrder = 4
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object chkPcp6: TDBCheckBox
            Left = 8
            Top = 144
            Width = 401
            Height = 17
            Caption = ', Programa e Plano Previdenciário'
            DataField = 'FLGPCPDEPRPA'
            DataSource = ds
            TabOrder = 5
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object chkPcp7: TDBCheckBox
            Left = 8
            Top = 168
            Width = 401
            Height = 17
            Caption = ' e Plano Previdenciário'
            DataField = 'FLGPCPDEPA'
            DataSource = ds
            TabOrder = 6
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object chkPcp8: TDBCheckBox
            Left = 8
            Top = 192
            Width = 401
            Height = 17
            DataField = 'FLGPCPDE'
            DataSource = ds
            TabOrder = 7
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
        end
        object panTipoRecDes: TPanel
          Left = 8
          Top = 8
          Width = 681
          Height = 33
          BevelOuter = bvLowered
          Caption = 'Por TIPO DE DESEMBOLSO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
        end
      end
      object tbsRadLote: TTabSheet
        Caption = 'Processos RAD'
        ImageIndex = 4
        object dbrgRADLote: TDBRadioGroup
          Left = 6
          Top = 17
          Width = 578
          Height = 36
          Caption = 'Faz validação do lote :'
          Columns = 2
          DataField = 'FLGRADLOTE'
          DataSource = ds
          Items.Strings = (
            'pelo valor total do lote'
            'por documento individual')
          TabOrder = 0
          Values.Strings = (
            '0'
            '1')
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 774
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Left = 60
        Enabled = False
        Visible = False
      end
      inherited sbtnAlterar: TToolbarButton97
        Left = 0
        Caption = '&Atualizar'
        Glyph.Data = {
          6E020000424D6E02000000000000760000002800000036000000120000000100
          040000000000F801000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7777777777777FFFFFF777777777777777777777770077777770000007777777
          777FF888888F7777777777777777777777007777700111111077017777F88777
          77787F8777777700000077777700777701111111110011777F877FFFFF7788F8
          7777004444440770470077701119999911111177F877F88888F777F877704444
          4444400447007701119777779111117F877F8777778F77F8770444CCCCC44444
          47007701197777777111117F87F87777777877F870444C77777C444447007700
          0977777711111177888877777F8FFFF87044C777777744444700777777777779
          99999977FFFFF777788888887000C77777744444470070000007777777777778
          888887777777FFF77777777777CCCCCCC7007044444C777777000C787777F877
          7777888800000077777777777700704444C7777777044C7877778777777F87F8
          011111C77777700097007044440077777044C778777788FFFFF8778701111C77
          7777701197007044444400000444C7787FF7778888877F870111100777770119
          7700704CC4444444444C7778F88FF777777FF8770111111000001119770077C7
          7CC444444CC7777787788FFFFFF88777019911111111119777007777777CCCCC
          C777777777777888888777777977991111119977770077777777777777777777
          777777777777777777777799999977777700}
      end
      inherited sbtnProcurar: TToolbarButton97
        Left = 120
        Enabled = False
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Left = 180
        Enabled = False
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 467
    Width = 774
    inherited tb97Fundo: TToolbar97
      Left = 169
      DockPos = 169
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 0
      DockPos = 0
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 89
    Top = 453
    TargetsData = (
      1
      2
      (
        ''
        'Text'
        0)
      (
        ''
        'DisplayLabel'
        0))
  end
  inherited ds: TwwDataSource
    Left = 441
    Top = 461
  end
  inherited ImlPadrao: TImageList
    Left = 25
    Top = 453
  end
  inherited CmeCadastro: TCmEventosCadastro
    RepetirInsert = False
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    Left = 185
    Top = 421
  end
  inherited Cds: TCMClientDataSet
    Left = 481
    Top = 461
  end
  inherited MontaSelect: TMontaSelect
    Left = 153
    Top = 453
  end
  object DirDlg: TProcuraDirDlg
    Caption = 'Impressora / Porta'
    Directory = 
      #0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0'ÿÿ'#7#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0 +
      #0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0 +
      #0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0 +
      #0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0 +
      #0#0#0#0
    Folder = foCustom
    Options = [bfStatusText, bfBrowseForPrinter]
    ShowPath = True
    Left = 185
    Top = 453
  end
  object ImlReports: TImageList
    Left = 57
    Top = 453
    Bitmap = {
      494C010103000500040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400FFFFFF00FFFFFF0000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      0000000000008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF008484840084848400FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      000084848400FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF000000000000000000FFFFFF0000000000FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484840000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF00000000000000
      00000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FF00000000000000FFFFFF0000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFF
      FF0000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFFFF000000
      00000000000000000000000000000000000084848400FFFFFF00FFFFFF00FF00
      0000FF000000FF00000000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF0000000000FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084848400848484008484840000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FF000000FF000000FF000000FFFFFF0084848400FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF0000000000FFFF
      FF00848484008484840000000000000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000FF00FFFF
      FF00FFFFFF00000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF00000084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFFFF000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF00FFFFFF000000FF000000FF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00848484008484840000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF00FFFFFF00FFFFFF00FFFFFF00848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484
      84008484840000000000000000000000000000000000000000000000FF000000
      FF000000FF00000000000000FF00848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084848400FFFFFF00FFFFFF00FFFFFF0084848400848484000000
      0000000000000000000000000000000000000000FF000000FF000000FF000000
      FF0000000000000000000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400848484008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FE3FFFFFFFFF0000F81FFF3FFCFF0000
      E01FFC3FF0F80000C01FF03FC0F00000C00FC01F00000000E00FC01F00400000
      8007C00F000000008003E00F802700008001E007800F0000C003F003C00F0000
      C00FC001C0070000E007F003E00F0000E003E00FF03F0000F007C43FF8FF0000
      F81F0DFFFFFF0000FC7FFFFFFFFF000000000000000000000000000000000000
      000000000000}
  end
  object MsReports: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Relatório Para Emissão de Espelho de Documento:'
    Colunas.Strings = (
      'REPORTS.NAME'
      'GRUPORELATORIO.DESCRICAO')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Relatório'
      'Grupo de Relatório')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'REPORTS'
      'GRUPORELATORIO')
    CamposChave.Strings = (
      'REPORTS.IDREPORTS'
      'REPORTS.ORIGEMCM'
      'REPORTS.NAME')
    Filtro.Strings = (
      'REPORTS.IDGRUPORELATORIO = GRUPORELATORIO.IDGRUPORELATORIO'
      'REPORTS.ORIGEMCMGR = GRUPORELATORIO.ORIGEMCMGR')
    Mascaras.Strings = (
      ''
      'Grupo de Exibição')
    Larguras.Strings = (
      '100'
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 121
    Top = 453
  end
  object sqlModImp: TCMSqlParams
    SQL.Strings = (
      'SELECT IDIMPRESSORA, MARCA, MODELO, NUMCOLDEF,'
      '(MODELO || '#39' -  '#39' || NUMCOLDEF)  AS DISPLAY  FROM'
      'IMPRESSORA ORDER BY MARCA, MODELO'
      '')
    ClientDataSet = cdsModImp
    Left = 313
    Top = 421
  end
  object cdsModImp: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 121
    Top = 421
  end
  object cdsTipoCli: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 153
    Top = 421
  end
  object cdsAltJurosCor: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 57
    Top = 421
  end
  object cdsRamoForn: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 121
    Top = 389
  end
  object cdsJuros: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 153
    Top = 389
  end
  object cdsAltAbatDesc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 185
    Top = 389
  end
  object cdsFormaRecPag: TCMClientDataSet
    Aggregates = <>
    Filtered = True
    Params = <>
    Left = 25
    Top = 389
  end
  object sqlHistFinanc: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   HISTPADFINAN, DESCRICAO '
      'FROM HISTORICOFINAN')
    ClientDataSet = cdsHistFinanc
    Left = 345
    Top = 421
  end
  object cdsTipoDoc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 57
    Top = 389
  end
  object cdsDesembolso: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 89
    Top = 389
  end
  object cdsHistFinanc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 313
    Top = 389
  end
  object cdsTipoDocCPMF: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 345
    Top = 389
  end
  object cdsParamRel: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 25
    Top = 421
  end
  object sqlAux: TCMSqlParams
    ClientDataSet = cdsAux
    Left = 217
    Top = 421
  end
  object cdsAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 217
    Top = 389
  end
  object cdsPatro: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 249
    Top = 389
  end
  object sqlPatro: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   PATRO.IDPESSOA,'
      '   PESSOA.NOME'
      'FROM'
      '   PESSOA,'
      '   PATRO'
      'WHERE'
      '   PESSOA.IDPESSOA = PATRO.IDPESSOA'
      'ORDER BY'
      '   PESSOA.NOME')
    ClientDataSet = cdsPatro
    Left = 249
    Top = 421
  end
  object cdsPlano: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 281
    Top = 389
  end
  object sqlPlano: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   IDPLANOPREV,'
      '   NOME'
      'FROM'
      '   PLANPREVCONTABIL'
      'WHERE'
      '   NVL(ATIVO, '#39'S'#39') = '#39'S'#39
      'ORDER BY'
      '   NOME'
      ' '
      ' '
      ' '
      '')
    ClientDataSet = cdsPlano
    Left = 281
    Top = 421
  end
end
