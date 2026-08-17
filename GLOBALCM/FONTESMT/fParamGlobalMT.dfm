inherited frmParamGlobal: TfrmParamGlobal
  Left = 601
  Top = 82
  Caption = 'Parâmetros Globais'
  ClientHeight = 510
  ClientWidth = 537
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 537
    Height = 424
    object PageGlobal: TPageControl
      Left = 1
      Top = 1
      Width = 535
      Height = 422
      ActivePage = TbsGeral
      Align = alClient
      TabOrder = 0
      object TbsGeral: TTabSheet
        Caption = 'Geral'
        Enabled = False
        object lblMoedaCorrente: TLabel
          Left = 23
          Top = 15
          Width = 91
          Height = 13
          Caption = 'Moeda Corrente'
        end
        object BtnFolder: TSpeedButton
          Left = 181
          Top = 332
          Width = 23
          Height = 22
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            0400000000008000000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
            FFFFFFF7777777777777FF00000000000007FF0FB8B8B8B8B707F0FB8B8B8B8B
            8707F0F8B8B8B8B8B0070F8B8B8B8B8B70070FFFFFFFFFF70807000000000000
            0B07F0F0FFCFCFCFF007F0FB0FFCFCFCFF07F0F8B0FFCFCFF00FFF0FFF0FFCFF
            07FFFFF00070FFF07FFFFFFFFFFF0F07FFFFFFFFFFFFF07FFFFF}
          OnClick = BtnFolderClick
        end
        object Label27: TLabel
          Left = 25
          Top = 312
          Width = 92
          Height = 13
          Caption = 'Diretório Versão'
        end
        object grpIntegracao: TGroupBox
          Left = 280
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
          Left = 23
          Top = 80
          Width = 366
          Height = 18
          Caption = 'Cria Agência Bancária a partir do cadastro de Fornecedores'
          DataField = 'FLGCRIAAGENCIA'
          DataSource = ds
          TabOrder = 2
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object DBCbMaiuscula: TDBCheckBox
          Left = 23
          Top = 98
          Width = 424
          Height = 19
          Caption = 'Usa MAIÚSCULAS para Razão Social/Nome nos cadastros de Pessoa'
          DataField = 'FLGUSAUPPERPESSOA'
          DataSource = ds
          TabOrder = 3
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object DBCbPesquisa: TDBCheckBox
          Left = 23
          Top = 120
          Width = 346
          Height = 14
          Caption = 'Permite pesquisa por endereço nas consultas de Pessoa'
          DataField = 'FLGUSAENDPESSOA'
          DataSource = ds
          TabOrder = 4
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object CkbObrigaDocPessoa: TDBCheckBox
          Left = 23
          Top = 137
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
          Left = 23
          Top = 157
          Width = 395
          Height = 17
          Caption = 'Não permite duplicidade de Documento nos cadastros de Pessoa'
          DataField = 'FLGDUPLDOCPESSOA'
          DataSource = ds
          TabOrder = 6
          ValueChecked = 'N'
          ValueUnchecked = 'S'
        end
        object dblkcmbMoeda: TwwDBLookupCombo
          Left = 23
          Top = 29
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
          Left = 23
          Top = 177
          Width = 248
          Height = 17
          Caption = 'Vincula módulo ao cadastro do Pessoa '
          DataField = 'FLGUSAMODRESPON'
          DataSource = ds
          TabOrder = 7
          ValueChecked = 'N'
          ValueUnchecked = 'S'
        end
        object DBCbPartidaDobrada: TDBCheckBox
          Left = 23
          Top = 196
          Width = 275
          Height = 17
          Caption = 'Lança na contabilidade em Partida Dobrada'
          DataField = 'FLGCONTABPARTDOB'
          DataSource = ds
          TabOrder = 8
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object DbCkbSubContaClie: TDBCheckBox
          Left = 23
          Top = 236
          Width = 349
          Height = 17
          Caption = 'Cria Sub-Conta automaticamente no cadastro de Clientes'
          DataField = 'FLGSUBCONTACLIE'
          DataSource = ds
          TabOrder = 10
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object DbCkbSubContaForn: TDBCheckBox
          Left = 23
          Top = 216
          Width = 381
          Height = 17
          Caption = 'Cria Sub-Conta automaticamente no cadastro de Fornecedores'
          DataField = 'FLGSUBCONTAFORN'
          DataSource = ds
          TabOrder = 9
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object DBCheckBox1: TDBCheckBox
          Left = 23
          Top = 256
          Width = 214
          Height = 17
          Caption = 'Obriga CGC de Agência Bancária'
          DataField = 'FLGCGCAGENCIA'
          DataSource = ds
          TabOrder = 11
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object DBCheckBox2: TDBCheckBox
          Left = 23
          Top = 275
          Width = 165
          Height = 17
          Caption = 'Ordena moeda pela sigla'
          DataField = 'FLGORDENASIGLA'
          DataSource = ds
          TabOrder = 12
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dbckCritica: TDBCheckBox
          Left = 24
          Top = 293
          Width = 481
          Height = 17
          Caption = 
            'Ativa crítica de função/cargo na associação de grupo de acesso p' +
            'ara o usuário'
          DataField = 'CRITICAGRUPO'
          DataSource = ds
          TabOrder = 13
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object EdtVersao: TEdit
          Left = 27
          Top = 333
          Width = 145
          Height = 21
          ReadOnly = True
          TabOrder = 14
        end
      end
      object TbsDocumento: TTabSheet
        Caption = 'Documentos'
        Enabled = False
        ImageIndex = 4
        object GbDocumentos: TGroupBox
          Left = 19
          Top = 36
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
          Left = 273
          Top = 36
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
          Left = 21
          Top = 171
          Width = 479
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
            Width = 446
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
            Width = 445
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
          Left = 281
          Top = 46
          Width = 186
          Height = 13
          Caption = 'Máscara Num. Agência Bancária'
        end
        object Label5: TLabel
          Left = 281
          Top = 94
          Width = 135
          Height = 13
          Caption = 'Máscara Código Cliente'
        end
        object GbAtividadeProjeto: TGroupBox
          Left = 33
          Top = 36
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
            Left = 16
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
          Left = 281
          Top = 60
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
          Left = 281
          Top = 108
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
          Left = 46
          Top = 18
          Width = 188
          Height = 13
          Caption = 'Plano Previdenciário - "COMUM"'
        end
        object Label12: TLabel
          Left = 46
          Top = 102
          Width = 80
          Height = 13
          Caption = 'Patrocinadora'
        end
        object Label25: TLabel
          Left = 46
          Top = 61
          Width = 248
          Height = 13
          Caption = 'Plano Previdenciário - "ADMINISTRATIVO"'
        end
        object CmbPlano: TCMDBLookupCombo
          Left = 46
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
          Left = 46
          Top = 116
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
          Left = 46
          Top = 150
          Width = 427
          Height = 212
          Caption = ' Segregação de Recursos '
          TabOrder = 2
          object Label24: TLabel
            Left = 41
            Top = 166
            Width = 345
            Height = 39
            Caption = 
              'ATENÇÃO!!! A ativação desses parâmetros muda conceitualmente tod' +
              'a a forma de contabilização da Solução TotalPrev.  Certifique-se' +
              ' de sua escolha.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            WordWrap = True
          end
          object Bevel1: TBevel
            Left = 0
            Top = 54
            Width = 427
            Height = 107
          end
          object Label26: TLabel
            Left = 224
            Top = 26
            Width = 65
            Height = 13
            Caption = 'Data inicial'
          end
          object chkSegregaVirtual: TDBCheckBox
            Left = 16
            Top = 24
            Width = 130
            Height = 17
            Caption = 'Segregação Virtual'
            DataField = 'FLGSEGREGAVIRTUAL'
            DataSource = ds
            TabOrder = 0
            ValueChecked = 'S'
            ValueUnchecked = 'N'
            OnClick = chkSegregaVirtualClick
          end
          object dbchkSegregaComumOri: TDBCheckBox
            Left = 36
            Top = 59
            Width = 269
            Height = 17
            Caption = 'Segrega o Plano "COMUM" na origem'
            DataField = 'FLGSEGREGAORCOMUM'
            DataSource = ds
            TabOrder = 1
            ValueChecked = 'S'
            ValueUnchecked = 'N'
            OnClick = dbchkSegregaComumOriClick
          end
          object dbchkSegregaAdminOri: TDBCheckBox
            Left = 36
            Top = 111
            Width = 317
            Height = 17
            Caption = 'Segrega o Plano "ADMINISTRATIVO" na origem'
            DataField = 'FLGSEGREGAORADM'
            DataSource = ds
            TabOrder = 2
            ValueChecked = 'S'
            ValueUnchecked = 'N'
            OnClick = dbchkSegregaAdminOriClick
          end
          object edtDataInicial: TCMDateTimePicker
            Left = 296
            Top = 22
            Width = 102
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            DataField = 'DTSEGREGAVIRTUAL'
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
            TabOrder = 3
          end
          object dbchkApenasFinComum: TDBCheckBox
            Left = 52
            Top = 77
            Width = 133
            Height = 17
            Caption = 'Apenas o financeiro'
            DataField = 'FLGSEGORCOMFIN'
            DataSource = ds
            Enabled = False
            TabOrder = 4
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object dbchkApenasFinAdmin: TDBCheckBox
            Left = 52
            Top = 130
            Width = 133
            Height = 17
            Caption = 'Apenas o financeiro'
            DataField = 'FLGSEGORADMFIN'
            DataSource = ds
            Enabled = False
            TabOrder = 5
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
        end
        object CMDBLookupCombo1: TCMDBLookupCombo
          Left = 46
          Top = 75
          Width = 427
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'50'#9'Plano Previdenciário')
          DataField = 'IDPLANOPREVADM'
          DataSource = ds
          LookupTable = CdsPlanoPrevAdm
          LookupField = 'IDPLANOPREV'
          Options = [loTitles]
          Style = csDropDownList
          TabOrder = 3
          AutoDropDown = True
          ShowButton = True
          OrderByDisplay = False
          AllowClearKey = True
          ShowMatchText = True
        end
      end
      object tbsPlanos: TTabSheet
        Caption = 'Planos Correntes'
        ImageIndex = 5
        object Label20: TLabel
          Left = 46
          Top = 29
          Width = 220
          Height = 13
          Caption = 'Plano de Centros de Responsabilidade'
        end
        object Label3: TLabel
          Left = 46
          Top = 73
          Width = 49
          Height = 13
          Caption = 'Máscara'
        end
        object Label22: TLabel
          Left = 46
          Top = 181
          Width = 152
          Height = 13
          Caption = 'Plano de Centros de Custo'
        end
        object Label7: TLabel
          Left = 46
          Top = 224
          Width = 49
          Height = 13
          Caption = 'Máscara'
        end
        object dbedMascaraCR: TwwDBEdit
          Left = 46
          Top = 87
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
          Left = 46
          Top = 116
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
          Left = 46
          Top = 237
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
          Left = 46
          Top = 267
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
          Left = 46
          Top = 44
          Width = 427
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCPLANCRESPON'#9'60'#9'DESCPLANCRESPON'#9'F')
          DataField = 'IDPLANCRESPON'
          DataSource = ds
          LookupTable = dtmGlobal.cdsPlanCentRespon
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
          Left = 46
          Top = 195
          Width = 427
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCPLANCENTCUST'#9'60'#9'DESCPLANCENTCUST'#9'F')
          DataField = 'IDPLANCENTCUST'
          DataSource = ds
          LookupTable = dtmGlobal.cdsPlanCentCust
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
          Left = 195
          Top = 282
          Width = 171
          Height = 13
          Caption = 'Tempo Travamento / Logout: '
        end
        object Label13: TLabel
          Left = 435
          Top = 282
          Width = 57
          Height = 13
          Caption = 'Segundos'
        end
        object GbObrigatorio: TGroupBox
          Left = 27
          Top = 14
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
          Left = 27
          Top = 130
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
          Left = 371
          Top = 278
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
          Left = 27
          Top = 190
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
    Top = 471
    Width = 537
    inherited tb97Fundo: TToolbar97
      Left = 365
      DockPos = 405
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
    Left = 512
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
    Left = 512
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
    Left = 512
    Top = 176
  end
  object CdsCentRespon: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 512
    Top = 224
  end
  object CdsPatroPrev: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 512
    Top = 128
  end
  object CdsPlanoPrevAdm: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 512
    Top = 320
  end
  object DlgDir: TProcuraDirDlg
    Caption = 'Diretório Versão'
    Directory = 
      #0#0#0#0#0#0#0#0'Ð'#17'Ý'#7#0#0#0#0'H¿ù'#7' ¾ù'#7#0#0#0#0'èO'#18#1#1#0#0#0#0#0#0#1#0#0#0'x…ù'#7'x…ù'#7'Ô'#2#0#0#0#0#0#0#0#0#0#0 +
      #0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0'x¿ù'#7'x¿ù'#7' '#2#0#0't'#1#0#0#0#0#0#0#1#0#0#0#0#0#0#0#0#0#1#0 +
      #0#0#0#0'œ¿ù'#7'œ¿ù'#7'|'#2#0#0'Strings'#0'°wP'#18'°wP'#18'h'#2#0#0#4#18'Ý'#7'd0ç'#16#0#0#0#0#0#0#0#0'ì¿ù'#7#0'Àù'#7'8Àù'#7 +
      #0#0#1#1#0#0#0#0'ë÷¼'#7#1#0#0#0#24'¦Q'#18#24'¦Q'#18'0'#2#0#0#0#0#0#0#20#0#0#0#23#0#0#0'Ì,'#2'@'#0#0#0#0#0#0#0#0#0#0#0#0'(”ø'#7'\Îk'#17 +
      '$'#0#0#0
    Folder = foCustom
    ShowPath = False
    Left = 218
    Top = 397
  end
end
