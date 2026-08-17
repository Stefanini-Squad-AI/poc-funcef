inherited frmParamGlobalMT: TfrmParamGlobalMT
  Left = 200
  Top = 68
  Caption = 'Parâmetros Globais'
  ClientHeight = 437
  ClientWidth = 537
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 537
    Height = 351
    object PageGlobal: TPageControl
      Left = 5
      Top = 5
      Width = 527
      Height = 341
      ActivePage = TbsSenha
      Align = alClient
      TabOrder = 0
      object TbsGeral: TTabSheet
        Caption = 'Geral'
        Enabled = False
        object lblMoedaCorrente: TLabel
          Left = 16
          Top = 18
          Width = 91
          Height = 13
          Caption = 'Moeda Corrente'
        end
        object grpIntegracao: TGroupBox
          Left = 248
          Top = 8
          Width = 225
          Height = 55
          Caption = ' Integra com o Orçamento '
          TabOrder = 1
          object sbtnSim: TSpeedButton
            Left = 16
            Top = 18
            Width = 93
            Height = 27
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
          end
          object sbtnNao: TSpeedButton
            Left = 116
            Top = 18
            Width = 93
            Height = 27
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
          end
        end
        object CkbCriaAgencia: TDBCheckBox
          Left = 24
          Top = 80
          Width = 329
          Height = 17
          Caption = 'Cria Agência Bancária No Cadastro de Fornecedores'
          DataField = 'FLGCRIAAGENCIA'
          DataSource = ds
          TabOrder = 2
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object DBCbMaiuscula: TDBCheckBox
          Left = 24
          Top = 104
          Width = 425
          Height = 17
          Caption = 'Usa MAIÚSCULAS para Razão Social/Nome nos cadastros de Pessoa'
          DataField = 'FLGUSAUPPERPESSOA'
          DataSource = ds
          TabOrder = 3
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object DBCbPesquisa: TDBCheckBox
          Left = 24
          Top = 128
          Width = 352
          Height = 18
          Caption = 'Permite pesquisa por endereço nas consultas de Pessoa'
          DataField = 'FLGUSAENDPESSOA'
          DataSource = ds
          TabOrder = 4
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object CkbObrigaDocPessoa: TDBCheckBox
          Left = 24
          Top = 152
          Width = 428
          Height = 17
          Caption = 
            'Obriga a indicação do Número do Documento nos cadastros de Pesso' +
            'a'
          DataField = 'FLGOBRIDOCPESSOA'
          DataSource = ds
          TabOrder = 5
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object DBCbDuplicidade: TDBCheckBox
          Left = 24
          Top = 176
          Width = 431
          Height = 17
          Caption = 'Não permite duplicidade de Documento nos cadastros de Pessoa'
          DataField = 'FLGDUPLDOCPESSOA'
          DataSource = ds
          TabOrder = 6
          ValueChecked = 'N'
          ValueUnchecked = 'S'
        end
        object dblkcmbMoeda: TwwDBLookupCombo
          Left = 16
          Top = 32
          Width = 212
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'MOEDESC'#9'20'#9'Descrição')
          DataField = 'MOEDACORRENTE'
          DataSource = ds
          LookupTable = CdsMoeda
          LookupField = 'MOECODIGO'
          TabOrder = 0
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = False
        end
        object DBCbModuloCadastro: TDBCheckBox
          Left = 24
          Top = 200
          Width = 431
          Height = 17
          Caption = 'Vincula módulo ao cadastro do pessoa '
          DataField = 'FLGUSAMODRESPON'
          DataSource = ds
          TabOrder = 7
          ValueChecked = 'N'
          ValueUnchecked = 'S'
        end
        object DBCbPartidaDobrada: TDBCheckBox
          Left = 24
          Top = 224
          Width = 431
          Height = 17
          Caption = 'Lança na contabilidade em Partida Dobrada'
          DataField = 'FLGCONTABPARTDOB'
          DataSource = ds
          TabOrder = 8
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object DbCkbSubContaClie: TDBCheckBox
          Left = 24
          Top = 272
          Width = 431
          Height = 17
          Caption = 'Cria Sub-Conta automaticamente no Cadastro de Clientes'
          DataField = 'FLGSUBCONTACLIE'
          DataSource = ds
          TabOrder = 10
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object DbCkbSubContaForn: TDBCheckBox
          Left = 24
          Top = 248
          Width = 431
          Height = 17
          Caption = 'Cria Sub-Conta automaticamente no Cadastro de Fornecedores'
          DataField = 'FLGSUBCONTAFORN'
          DataSource = ds
          TabOrder = 9
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object DBCheckBox1: TDBCheckBox
          Left = 25
          Top = 295
          Width = 431
          Height = 17
          Caption = 'Obriga CGC de Agência Bancária'
          DataField = 'FLGCGCAGENCIA'
          DataSource = ds
          TabOrder = 11
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
      end
      object TbsDocumento: TTabSheet
        Caption = 'Documentos'
        Enabled = False
        ImageIndex = 4
        object GbDocumentos: TGroupBox
          Left = 16
          Top = 8
          Width = 225
          Height = 105
          Caption = ' Documentos Chave '
          TabOrder = 0
          object Label1: TLabel
            Left = 16
            Top = 18
            Width = 81
            Height = 13
            Caption = 'Pessoa Física'
            FocusControl = dblkPesFisica
          end
          object Label2: TLabel
            Left = 16
            Top = 58
            Width = 92
            Height = 13
            Caption = 'Pessoa Jurídica'
            FocusControl = dblkPesJuridica
          end
          object dblkPesJuridica: TwwDBLookupCombo
            Left = 16
            Top = 72
            Width = 193
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOMEDOCUMENTO'#9'30'#9'NOMEDOCUMENTO')
            DataField = 'DOCPJURIDICA'
            DataSource = ds
            LookupTable = CdsTipoDocPJ
            LookupField = 'IDDOCUMENTO'
            TabOrder = 1
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = False
          end
          object dblkPesFisica: TwwDBLookupCombo
            Left = 16
            Top = 32
            Width = 193
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOMEDOCUMENTO'#9'30'#9'NOMEDOCUMENTO')
            DataField = 'DOCPFISICA'
            DataSource = ds
            LookupTable = CdsTipoDocPF
            LookupField = 'IDDOCUMENTO'
            TabOrder = 0
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = False
          end
        end
        object GbInscricao: TGroupBox
          Left = 256
          Top = 8
          Width = 225
          Height = 107
          Caption = ' Inscrições '
          TabOrder = 1
          object Label10: TLabel
            Left = 16
            Top = 18
            Width = 50
            Height = 13
            Caption = 'Estadual'
            FocusControl = DbLcbInscrEst
          end
          object Label16: TLabel
            Left = 16
            Top = 58
            Width = 55
            Height = 13
            Caption = 'Municipal'
            FocusControl = DbLcbInscrMun
          end
          object DbLcbInscrMun: TwwDBLookupCombo
            Left = 16
            Top = 72
            Width = 193
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOMEDOCUMENTO'#9'30'#9'NOMEDOCUMENTO')
            DataField = 'INSCMUNICIPAL'
            DataSource = ds
            LookupTable = CdsTipoDocPJ
            LookupField = 'IDDOCUMENTO'
            TabOrder = 1
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = False
          end
          object DbLcbInscrEst: TwwDBLookupCombo
            Left = 16
            Top = 32
            Width = 193
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOMEDOCUMENTO'#9'30'#9'NOMEDOCUMENTO')
            DataField = 'INSCESTADUAL'
            DataSource = ds
            LookupTable = CdsTipoDocPJ
            LookupField = 'IDDOCUMENTO'
            TabOrder = 0
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = False
          end
        end
        object GbPadroes: TGroupBox
          Left = 16
          Top = 120
          Width = 466
          Height = 105
          Caption = 'Padrões'
          TabOrder = 2
          object Label18: TLabel
            Left = 16
            Top = 18
            Width = 100
            Height = 13
            Caption = 'Atividade/Projeto'
            FocusControl = DbLcbAtivProjPadrao
          end
          object Label19: TLabel
            Left = 16
            Top = 58
            Width = 160
            Height = 13
            Caption = 'Centro de Responsabilidade'
            FocusControl = DbLcbCentResponPadrao
          end
          object DbLcbAtivProjPadrao: TwwDBLookupCombo
            Left = 16
            Top = 32
            Width = 433
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'25'#9'NOME')
            DataField = 'UNIDNEGOC'
            DataSource = ds
            LookupTable = CdsAtivProj
            LookupField = 'UNIDNEGOC'
            TabOrder = 0
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = False
          end
          object DbLcbCentResponPadrao: TwwDBLookupCombo
            Left = 16
            Top = 72
            Width = 433
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'25'#9'NOME')
            DataField = 'CODCENTRORESPON'
            DataSource = ds
            LookupTable = CdsCentRespon
            LookupField = 'CODCENTRORESPON'
            TabOrder = 1
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = False
          end
        end
      end
      object TbsMascara: TTabSheet
        Caption = 'Máscaras'
        Enabled = False
        object Label6: TLabel
          Left = 264
          Top = 18
          Width = 186
          Height = 13
          Caption = 'Máscara Num. Agência Bancária'
        end
        object Label5: TLabel
          Left = 264
          Top = 66
          Width = 135
          Height = 13
          Caption = 'Máscara Código Cliente'
        end
        object GbAtividadeProjeto: TGroupBox
          Left = 16
          Top = 8
          Width = 225
          Height = 97
          Caption = ' Atividade/Projeto  '
          TabOrder = 0
          object Label4: TLabel
            Left = 16
            Top = 18
            Width = 49
            Height = 13
            Caption = 'Máscara'
          end
          object dbedMascaraAP: TwwDBEdit
            Left = 16
            Top = 32
            Width = 194
            Height = 21
            DataField = 'MASCUNIDNEGOC'
            DataSource = ds
            TabOrder = 0
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object DBCbObrigaAtividade: TDBCheckBox
            Left = 24
            Top = 64
            Width = 145
            Height = 17
            Caption = 'Obriga a Indicação'
            DataField = 'USAABC'
            DataSource = ds
            TabOrder = 1
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
        end
        object DbEdMascAgencia: TwwDBEdit
          Left = 264
          Top = 32
          Width = 205
          Height = 21
          DataField = 'MASCARANUMAGENCIA'
          DataSource = ds
          TabOrder = 1
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
          OnKeyPress = DbEdMascAgenciaKeyPress
        end
        object DbEdMascCliente: TwwDBEdit
          Left = 264
          Top = 80
          Width = 205
          Height = 21
          DataField = 'MASCARACLIENTE'
          DataSource = ds
          TabOrder = 2
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
      end
      object TbsPrevidencia: TTabSheet
        Caption = 'Previdência'
        Enabled = False
        object Label11: TLabel
          Left = 16
          Top = 18
          Width = 118
          Height = 13
          Caption = 'Plano Previdenciário'
        end
        object Label12: TLabel
          Left = 16
          Top = 66
          Width = 80
          Height = 13
          Caption = 'Patrocinadora'
        end
        object CmbPlano: TCMDBLookupCombo
          Left = 16
          Top = 32
          Width = 427
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'50'#9'Plano Previdenciário')
          DataField = 'IDPLANOPREV'
          DataSource = ds
          LookupTable = CdsPlanoPrev
          LookupField = 'IDPLANOPREV'
          Options = [loTitles]
          Style = csDropDownList
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          OrderByDisplay = False
          AllowClearKey = True
          ShowMatchText = True
        end
        object CmbPatro: TCMDBLookupCombo
          Left = 16
          Top = 80
          Width = 427
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'60'#9'Nome')
          DataField = 'IDPATRO'
          DataSource = ds
          LookupTable = CdsPatroPrev
          LookupField = 'IDPATRO'
          Options = [loTitles]
          Style = csDropDownList
          TabOrder = 1
          AutoDropDown = True
          ShowButton = True
          OrderByDisplay = False
          AllowClearKey = True
          ShowMatchText = True
        end
        object GroupBox2: TGroupBox
          Left = 16
          Top = 110
          Width = 427
          Height = 89
          Caption = ' Segregação de Recursos '
          TabOrder = 2
          object Label24: TLabel
            Left = 36
            Top = 37
            Width = 368
            Height = 39
            Caption = 
              'ATENÇÃO!!! A ativação desse parâmetro muda conceitualmente toda ' +
              'a forma de contabilização da Solução TotalPrev.  Certifique-se d' +
              'e sua escolha.'
            WordWrap = True
          end
          object DBCheckBox2: TDBCheckBox
            Left = 16
            Top = 20
            Width = 131
            Height = 17
            Caption = 'Segregação Virtual'
            DataField = 'FLGSEGREGAVIRTUAL'
            DataSource = ds
            TabOrder = 0
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
        end
      end
      object tbsPlanos: TTabSheet
        Caption = 'Planos Correntes'
        ImageIndex = 5
        object Label20: TLabel
          Left = 16
          Top = 18
          Width = 220
          Height = 13
          Caption = 'Plano de Centros de Responsabilidade'
        end
        object Label3: TLabel
          Left = 16
          Top = 66
          Width = 49
          Height = 13
          Caption = 'Máscara'
        end
        object Label22: TLabel
          Left = 16
          Top = 130
          Width = 152
          Height = 13
          Caption = 'Plano de Centros de Custo'
        end
        object Label7: TLabel
          Left = 16
          Top = 178
          Width = 49
          Height = 13
          Caption = 'Máscara'
        end
        object dbedMascaraCR: TwwDBEdit
          Left = 16
          Top = 80
          Width = 193
          Height = 21
          DataField = 'MASCCENTRORESPON'
          DataSource = ds
          Enabled = False
          TabOrder = 1
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object DBCbObrigaCentroRespon: TDBCheckBox
          Left = 240
          Top = 82
          Width = 145
          Height = 17
          Caption = 'Obriga a Indicação'
          DataField = 'USACRESPON'
          DataSource = ds
          TabOrder = 2
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object dbedMascaraCC: TwwDBEdit
          Left = 16
          Top = 192
          Width = 193
          Height = 21
          DataField = 'MASCARACC'
          DataSource = ds
          Enabled = False
          TabOrder = 4
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
          OnExit = dbedMascaraCCExit
          OnKeyPress = dbedMascaraCCKeyPress
        end
        object DBCbObrigaCentroCusto: TDBCheckBox
          Left = 240
          Top = 194
          Width = 145
          Height = 17
          Caption = 'Obriga a Indicação'
          DataField = 'FLGOBRIGACC'
          DataSource = ds
          TabOrder = 5
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object DBcboPlanCentRespon: TwwDBLookupCombo
          Left = 16
          Top = 32
          Width = 427
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCPLANCRESPON'#9'60'#9'DESCPLANCRESPON'#9'F')
          DataField = 'IDPLANCRESPON'
          DataSource = ds
          LookupField = 'IDPLANCRESPON'
          Options = [loTitles]
          Style = csDropDownList
          DropDownWidth = 8
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          OrderByDisplay = False
          AllowClearKey = True
          ShowMatchText = True
          OnCloseUp = DBcboPlanCentResponCloseUp
        end
        object DBcboPlanCentCust: TwwDBLookupCombo
          Left = 16
          Top = 144
          Width = 427
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCPLANCENTCUST'#9'60'#9'DESCPLANCENTCUST'#9'F')
          DataField = 'IDPLANCENTCUST'
          DataSource = ds
          LookupField = 'IDPLANCENTCUST'
          Options = [loTitles]
          Style = csDropDownList
          DropDownWidth = 8
          TabOrder = 3
          AutoDropDown = True
          ShowButton = True
          OrderByDisplay = False
          AllowClearKey = True
          ShowMatchText = True
          OnCloseUp = DBcboPlanCentCustCloseUp
        end
      end
      object TbsSenha: TTabSheet
        Caption = 'Senha'
        Enabled = False
        ImageIndex = 3
        object Label23: TLabel
          Left = 184
          Top = 276
          Width = 171
          Height = 13
          Caption = 'Tempo Travamento / Logout: '
        end
        object Label13: TLabel
          Left = 424
          Top = 276
          Width = 57
          Height = 13
          Caption = 'Segundos'
        end
        object GbObrigatorio: TGroupBox
          Left = 16
          Top = 8
          Width = 465
          Height = 105
          Caption = ' Formação / Composição '
          TabOrder = 0
          object Label8: TLabel
            Left = 276
            Top = 20
            Width = 102
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tamanho Mínimo:'
          end
          object Label9: TLabel
            Left = 267
            Top = 48
            Width = 111
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tamanho Histórico:'
          end
          object DbCkbLetras: TDBCheckBox
            Left = 16
            Top = 24
            Width = 136
            Height = 17
            Caption = 'Obriga Letras'
            DataField = 'FLGSENHALETRAS'
            DataSource = DsSeguranca
            TabOrder = 0
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object DbCkbNumeros: TDBCheckBox
            Left = 16
            Top = 48
            Width = 136
            Height = 17
            Caption = 'Obriga Números'
            DataField = 'FLGSENHANUMEROS'
            DataSource = DsSeguranca
            TabOrder = 1
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object DBCbNomeSenha: TDBCheckBox
            Left = 16
            Top = 80
            Width = 392
            Height = 17
            Caption = 'Não permite parte do Nome/Sobrenome do usuário como SENHA'
            DataField = 'FLGVALSENHANOME'
            DataSource = DsSeguranca
            TabOrder = 2
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object DbSeTamMinimo: TwwDBSpinEdit
            Left = 384
            Top = 16
            Width = 57
            Height = 21
            Increment = 1
            MaxValue = 15
            MinValue = 1
            Value = 1
            DataField = 'TAMMINSENHA'
            DataSource = DsSeguranca
            TabOrder = 3
            UnboundDataType = wwDefault
          end
          object DbSeHisorico: TwwDBSpinEdit
            Left = 384
            Top = 44
            Width = 57
            Height = 21
            Increment = 1
            MaxValue = 10
            DataField = 'TAMHISTORICOSENHA'
            DataSource = DsSeguranca
            TabOrder = 4
            UnboundDataType = wwDefault
          end
        end
        object GroupBox1: TGroupBox
          Left = 16
          Top = 124
          Width = 465
          Height = 49
          Caption = ' Troca de Senha '
          TabOrder = 1
          object Label17: TLabel
            Left = 208
            Top = 22
            Width = 26
            Height = 13
            Caption = 'Dias'
          end
          object Label21: TLabel
            Left = 16
            Top = 21
            Width = 125
            Height = 13
            Caption = 'Trocar Senha a cada:'
          end
          object DbCkbRepete: TDBCheckBox
            Left = 272
            Top = 20
            Width = 183
            Height = 17
            Caption = 'Pode repetir senha na troca'
            DataField = 'FLGREPETESENHA'
            DataSource = DsSeguranca
            TabOrder = 1
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object DbSelDias: TwwDBSpinEdit
            Left = 144
            Top = 18
            Width = 58
            Height = 21
            Increment = 1
            MaxValue = 15000
            DataField = 'DIASTROCASENHA'
            DataSource = DsSeguranca
            TabOrder = 0
            UnboundDataType = wwDefault
          end
        end
        object DbSelTempo: TwwDBSpinEdit
          Left = 360
          Top = 272
          Width = 57
          Height = 21
          Increment = 1
          MaxValue = 60000
          DataField = 'TEMPOTRAVA'
          DataSource = DsSeguranca
          TabOrder = 3
          UnboundDataType = wwDefault
          AfterUpClick = DbSelTempoAfterUpClick
          AfterDownClick = DbSelTempoAfterDownClick
        end
        object GbAlteraSuper: TGroupBox
          Left = 16
          Top = 184
          Width = 465
          Height = 73
          TabOrder = 2
          object Label14: TLabel
            Left = 14
            Top = 43
            Width = 78
            Height = 13
            Caption = 'Senha Super:'
          end
          object Label15: TLabel
            Left = 248
            Top = 43
            Width = 75
            Height = 13
            Caption = 'Confirmação:'
          end
          object DbCkbSuper: TDBCheckBox
            Left = 16
            Top = 16
            Width = 201
            Height = 17
            Caption = 'Altera senha do usuário SUPER'
            DataField = 'FLGALTSENHASUPER'
            DataSource = DsSeguranca
            TabOrder = 0
            ValueChecked = 'S'
            ValueUnchecked = 'N'
            OnClick = DbCkbSuperClick
          end
          object EdSenhaSuper: TEdit
            Left = 96
            Top = 40
            Width = 121
            Height = 21
            CharCase = ecUpperCase
            PasswordChar = '*'
            TabOrder = 1
          end
          object EdSenhaSuper2: TEdit
            Left = 328
            Top = 40
            Width = 121
            Height = 21
            CharCase = ecUpperCase
            PasswordChar = '*'
            TabOrder = 2
          end
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 537
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Visible = False
      end
      inherited sbtnProcurar: TToolbarButton97
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 398
    Width = 537
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 970
    Top = 23
  end
  inherited ds: TwwDataSource
    Left = 344
    Top = 0
  end
  inherited ImlPadrao: TImageList
    Left = 968
    Top = 75
  end
  inherited CmeCadastro: TCmEventosCadastro
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyEdit = CmeCadastroApplyEdit
    Left = 392
    Top = 0
  end
  inherited Cds: TCMClientDataSet
    BeforePost = CdsBeforePost
    Left = 312
    Top = 0
  end
  inherited MontaSelect: TMontaSelect
    Left = 264
    Top = 0
  end
  object CdsSeguranca: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 520
    Top = 80
  end
  object CdsAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 600
    Top = 224
  end
  object CdsMoeda: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 600
    Top = 128
  end
  object CdsTipoDocPF: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 600
    Top = 176
  end
  object CdsTipoDocPJ: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 600
    Top = 272
  end
  object CdsPlanoPrev: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 520
    Top = 272
  end
  object DsSeguranca: TwwDataSource
    AutoEdit = False
    DataSet = CdsSeguranca
    Left = 600
    Top = 80
  end
  object CdsAtivProj: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 520
    Top = 176
  end
  object CdsCentRespon: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 520
    Top = 224
  end
  object CdsPatroPrev: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 520
    Top = 128
  end
end
