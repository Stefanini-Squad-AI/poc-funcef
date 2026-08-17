inherited frmParamFinanc: TfrmParamFinanc
  Left = 121
  Top = 167
  Caption = 'Parâmetros do Controle Financeiro'
  ClientHeight = 403
  ClientWidth = 422
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited Dock972: TDock97 [0]
    Width = 422
  end
  inherited Dock971: TDock97 [1]
    Top = 364
    Width = 422
    inherited tb97Fundo: TToolbar97
      Left = 248
      DockPos = 248
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 80
      DockPos = 80
    end
  end
  inherited pnlFundo: TPanel [2]
    Width = 422
    Height = 317
    object pcnParametros: TPageControl
      Left = 5
      Top = 5
      Width = 412
      Height = 307
      ActivePage = TabSheet1
      Align = alClient
      TabOrder = 0
      object tbsGeral: TTabSheet
        Caption = 'Geral &I'
        object grpIntegracao: TGroupBox
          Left = 9
          Top = 8
          Width = 385
          Height = 58
          Caption = '  Integra com a Contabilidade  '
          Ctl3D = True
          ParentCtl3D = False
          TabOrder = 0
          object sbtnSim: TSpeedButton
            Left = 45
            Top = 15
            Width = 101
            Height = 33
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
            Left = 219
            Top = 15
            Width = 101
            Height = 33
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
        object grpAlterador: TGroupBox
          Left = 9
          Top = 79
          Width = 384
          Height = 151
          Caption = ' Alteradores para Integração dos Empréstimos no CAP '
          TabOrder = 1
          object lblJuros: TLabel
            Left = 15
            Top = 18
            Width = 31
            Height = 13
            Caption = 'Juros'
          end
          object lblCorMonet: TLabel
            Left = 15
            Top = 57
            Width = 116
            Height = 13
            Caption = 'Correção Monetária '
          end
          object lblVarCambial: TLabel
            Left = 15
            Top = 96
            Width = 99
            Height = 13
            Caption = 'Variação Cambial'
          end
          object dblcJuros: TwwDBLookupCombo
            Left = 15
            Top = 30
            Width = 331
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'35'#9'DESCRICAO')
            DataField = 'CODJUROS'
            DataSource = ds
            LookupTable = qryAlterador
            LookupField = 'CODALTERADOR'
            TabOrder = 0
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = False
          end
          object dblcCorrecao: TwwDBLookupCombo
            Left = 15
            Top = 69
            Width = 331
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'35'#9'DESCRICAO')
            DataField = 'CODCORMONET'
            DataSource = ds
            LookupTable = qryAlterador1
            LookupField = 'CODALTERADOR'
            TabOrder = 1
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = False
          end
          object dblcVariacao: TwwDBLookupCombo
            Left = 15
            Top = 108
            Width = 331
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'35'#9'DESCRICAO')
            DataField = 'CODVARCAMBIAL'
            DataSource = ds
            LookupTable = qryAlterador1
            LookupField = 'CODALTERADOR'
            TabOrder = 2
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = False
          end
        end
      end
      object tbsGeral2: TTabSheet
        Caption = '&Geral II'
        object lblTipoAplic: TLabel
          Left = 8
          Top = 203
          Width = 221
          Height = 13
          Caption = 'Tipo de Aplicação para sobra de Caixa'
        end
        object Label4: TLabel
          Left = 8
          Top = 256
          Width = 215
          Height = 13
          Caption = 'Data do Bloqueio da Disponibilidade: '
        end
        object gbTrocaTipo: TGroupBox
          Left = 9
          Top = 11
          Width = 384
          Height = 102
          Caption = ' Troca de Tipo de Recebimento/Desembolso '
          TabOrder = 0
          object lblTroca: TLabel
            Left = 37
            Top = 34
            Width = 283
            Height = 13
            Caption = 'recebidos/pagos em mês diferente do lançamento'
          end
          object lblFinalCAR: TLabel
            Left = 16
            Top = 56
            Width = 126
            Height = 13
            Caption = 'Final para o C. a Rec.'
          end
          object lblFinalCAP: TLabel
            Left = 208
            Top = 56
            Width = 125
            Height = 13
            Caption = 'Final para o C. a Pag.'
          end
          object dbcbTroca: TDBCheckBox
            Left = 16
            Top = 18
            Width = 361
            Height = 17
            Caption = 'Troca Tipo de Recebimento/Desembolso para Documentos'
            DataField = 'FLGSEPARADATA'
            DataSource = ds
            TabOrder = 0
            ValueChecked = 'S'
            ValueUnchecked = 'N'
            OnClick = dbcbTrocaClick
          end
          object dbedFinalCAR: TwwDBEdit
            Left = 16
            Top = 72
            Width = 121
            Height = 21
            DataField = 'TRDFINALCAR'
            DataSource = ds
            TabOrder = 1
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbedFinalCAP: TwwDBEdit
            Left = 208
            Top = 72
            Width = 121
            Height = 21
            DataField = 'TRDFINALCAP'
            DataSource = ds
            TabOrder = 2
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
        end
        object dbcbConfirmaRP: TDBCheckBox
          Left = 16
          Top = 120
          Width = 361
          Height = 17
          Caption = 'Utiliza tela de confirmar recebimento e pagamento'
          DataField = 'FLGCONFIRMARECPAG'
          DataSource = ds
          TabOrder = 1
          ValueChecked = 'S'
          ValueUnchecked = 'N'
          OnClick = dbcbTrocaClick
        end
        object dblcTipoAplic: TCMDBLookupCombo
          Left = 8
          Top = 219
          Width = 384
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'60'#9'Descrição')
          DataField = 'TIPOAPLICACAO'
          DataSource = ds
          LookupTable = qryTipoAplic
          LookupField = 'TIPOAPLICACAO'
          Options = [loTitles]
          Style = csDropDownList
          TabOrder = 2
          AutoDropDown = True
          ShowButton = True
          OrderByDisplay = False
          AllowClearKey = True
          ShowMatchText = True
        end
        object dbckCalcImposto: TDBCheckBox
          Left = 16
          Top = 144
          Width = 361
          Height = 17
          Caption = 'Calcula Imposto sobre os Lançamentos do Financeiro'
          DataField = 'FLGCALCIMPOSTO'
          DataSource = ds
          TabOrder = 3
          ValueChecked = 'S'
          ValueUnchecked = 'N'
          OnClick = dbcbTrocaClick
        end
        object edDataBloqDisp: TCMDateTimePicker
          Left = 232
          Top = 252
          Width = 160
          Height = 21
          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
          CalendarAttributes.Font.Color = clWindowText
          CalendarAttributes.Font.Height = -11
          CalendarAttributes.Font.Name = 'MS Sans Serif'
          CalendarAttributes.Font.Style = []
          ButtonStyle = cbsCustom
          DataField = 'DATABLOQDISPFINAN'
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
          TabOrder = 5
        end
        object dbckImprimeCheque: TDBCheckBox
          Left = 16
          Top = 168
          Width = 377
          Height = 17
          Caption = 'Imprime Cheque na Transferência entre Contas'
          DataField = 'FLGIMPCHEQUE'
          DataSource = ds
          TabOrder = 4
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
      end
      object tbsNaoIdent: TTabSheet
        Caption = '&Lançamentos Não Identificados'
        object gbIntContab: TGroupBox
          Left = 3
          Top = 2
          Width = 391
          Height = 226
          Caption = 'Para Integraçao Contábil do Lançamento Não Identificado'
          TabOrder = 0
          object lblCentroCusto: TLabel
            Left = 20
            Top = 132
            Width = 92
            Height = 13
            Caption = 'Centro de Custo'
          end
          object lblSubConta: TLabel
            Left = 20
            Top = 172
            Width = 55
            Height = 13
            Caption = 'Subconta'
          end
          object dblcCCusto: TwwDBLookupCombo
            Left = 20
            Top = 146
            Width = 341
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'30'#9'Nome'
              'CODCENTROCUSTO'#9'10'#9'Código')
            DataField = 'CCUSTOLANCNAOID'
            DataSource = ds
            LookupTable = qryccusto
            LookupField = 'CODCENTROCUSTO'
            Options = [loTitles]
            Style = csDropDownList
            Enabled = False
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
          object dbccConta: TCMProcuraMaskContabil
            Left = 18
            Top = 39
            Width = 346
            Height = 84
            Caption = ' Conta Contábil '
            TabOrder = 1
            OnExit = dbccContaExit
            MostraMensagens = True
            MostraDescricao = True
            DataSource = ds
            DataField = 'CONTALANCNAOIDENT'
            Mensagens.EmBranco = 'não pode estar em branco'
            Mensagens.NaoExiste = 'não existe'
            Mensagens.Sintetica = 'não pode ser sintética'
            Mensagens.Analitica = 'não pode ser analítica'
            PermiteChaveInvalida = False
            PermiteChaveEmBranco = True
            AceitaTipoConta = SoAnalitica
            Plano = 0
            Status = scSoAtiva
          end
          object dblcSubConta: TwwDBLookupCombo
            Left = 20
            Top = 186
            Width = 341
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOMESUBCONTA'#9'60'#9'Nome da Subconta'
              'CODSUBCONTA'#9'10'#9'Código da Subconta')
            DataField = 'SUBCONTANAOIDENT'
            DataSource = ds
            LookupTable = qrySubConta
            LookupField = 'CODSUBCONTA'
            Options = [loTitles]
            Style = csDropDownList
            Enabled = False
            TabOrder = 2
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
        end
      end
      object tbsRelatorios: TTabSheet
        Caption = 'Parâmetros para Relatórios'
        object TreeAssin: TTreeView
          Left = 0
          Top = 30
          Width = 404
          Height = 249
          Align = alClient
          Images = ImlReports
          Indent = 23
          TabOrder = 1
          OnEdited = TreeAssinEdited
          OnEditing = TreeAssinEditing
        end
        object Pnldocpendentes: TPanel
          Left = 0
          Top = 0
          Width = 404
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
      end
      object tbsFluxoCaixa: TTabSheet
        Caption = 'Fluxo de Caixa'
        ImageIndex = 4
        object gpbDiasBloqueioFluxo: TGroupBox
          Left = 8
          Top = 8
          Width = 385
          Height = 105
          Caption = 'Número de dias de Bloqueio'
          TabOrder = 0
          object Label1: TLabel
            Left = 24
            Top = 20
            Width = 71
            Height = 13
            Caption = 'Curto Prazo:'
          end
          object Label2: TLabel
            Left = 20
            Top = 52
            Width = 75
            Height = 13
            Caption = 'Médio Prazo:'
          end
          object Label3: TLabel
            Left = 19
            Top = 84
            Width = 76
            Height = 13
            Caption = 'Longo Prazo:'
          end
          object dbedNumDiasBloqueioCurto: TDBEdit
            Left = 104
            Top = 16
            Width = 57
            Height = 21
            DataField = 'DIASBLOQORCCP'
            DataSource = ds
            TabOrder = 0
          end
          object dbedNumDiasBloqueioMedio: TDBEdit
            Left = 104
            Top = 48
            Width = 57
            Height = 21
            DataField = 'DIASBLOQORCMP'
            DataSource = ds
            TabOrder = 1
          end
          object dbedNumDiasBloqueioLongo: TDBEdit
            Left = 104
            Top = 80
            Width = 57
            Height = 21
            DataField = 'DIASBLOQORCLP'
            DataSource = ds
            TabOrder = 2
          end
        end
        object dbckbAtualizaFlx: TDBCheckBox
          Left = 16
          Top = 208
          Width = 385
          Height = 17
          Caption = 'Atualiza Fluxo de Médio Prazo para Curto Prazo'
          DataField = 'FLGATUALFLX'
          DataSource = ds
          TabOrder = 2
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object dbckExibeColExpandidas: TDBCheckBox
          Left = 16
          Top = 232
          Width = 385
          Height = 17
          Caption = 'Exibe Colunas do Fluxo Expandidas'
          DataField = 'FLGEXIBECOLEXP'
          DataSource = ds
          TabOrder = 3
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object gpbTitulos: TGroupBox
          Left = 8
          Top = 120
          Width = 385
          Height = 81
          Caption = 'Título das Linhas Fixas'
          TabOrder = 1
          object Label5: TLabel
            Left = 40
            Top = 24
            Width = 85
            Height = 13
            Caption = 'Saldo Anterior:'
          end
          object Label6: TLabel
            Left = 8
            Top = 56
            Width = 117
            Height = 13
            Caption = 'Saldo a Trasnportar:'
          end
          object dbeTituloSaldoAnt: TDBEdit
            Left = 136
            Top = 20
            Width = 233
            Height = 21
            DataField = 'TITSALDOANT'
            DataSource = ds
            TabOrder = 0
          end
          object dbeTituloSaldoTransp: TDBEdit
            Left = 136
            Top = 52
            Width = 233
            Height = 21
            DataField = 'TITSALDOTRANSP'
            DataSource = ds
            TabOrder = 1
          end
        end
        object dbckExibeDesemb: TDBCheckBox
          Left = 16
          Top = 256
          Width = 385
          Height = 17
          Caption = 'Exibe Desembolsos  em vermelho'
          DataField = 'FLGDESVERM'
          DataSource = ds
          TabOrder = 4
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
      end
      object TabSheet1: TTabSheet
        Caption = 'Investimentos'
        ImageIndex = 5
        object GroupBox1: TGroupBox
          Left = 16
          Top = 16
          Width = 369
          Height = 65
          Caption = 'Tipo de Documento Associado aos Investimentos'
          TabOrder = 0
          object dblcTipoDocurmento: TwwDBLookupCombo
            Left = 9
            Top = 22
            Width = 352
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'35'#9'Tipo de Documento'#9'F'
              'CODTIPDOC'#9'10'#9'Código'#9'F')
            DataField = 'CODTIPDOCINVEST'
            DataSource = ds
            LookupTable = qryTipoDocumento
            LookupField = 'CODTIPDOC'
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
          end
        end
      end
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'select * from paramfinanc')
    Left = 186
    Top = 6
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 334
    Top = 318
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update paramfinanc'
      'set'
      '  IDPESSOA = :IDPESSOA,'
      '  CODJUROS = :CODJUROS,'
      '  TIPOAPLICACAO = :TIPOAPLICACAO,'
      '  IDEMPRESA = :IDEMPRESA,'
      '  CODCORMONET = :CODCORMONET,'
      '  CCUSTOLANCNAOID = :CCUSTOLANCNAOID,'
      '  PLANO = :PLANO,'
      '  CODVARCAMBIAL = :CODVARCAMBIAL,'
      '  INTEGRACONTAB = :INTEGRACONTAB,'
      '  CONTALANCNAOIDENT = :CONTALANCNAOIDENT,'
      '  FLGORCADOPREVISTO = :FLGORCADOPREVISTO,'
      '  SUBCONTANAOIDENT = :SUBCONTANAOIDENT,'
      '  FLGSEPARADATA = :FLGSEPARADATA,'
      '  TRDFINALCAP = :TRDFINALCAP,'
      '  TRDFINALCAR = :TRDFINALCAR,'
      '  FLGCONFIRMARECPAG = :FLGCONFIRMARECPAG,'
      '  FLGCALCIMPOSTO = :FLGCALCIMPOSTO,'
      '  DIASBLOQORCCP = :DIASBLOQORCCP,'
      '  DIASBLOQORCMP = :DIASBLOQORCMP,'
      '  DIASBLOQORCLP = :DIASBLOQORCLP,'
      '  FLGATUALFLX = :FLGATUALFLX,'
      '  CODTIPDOCINVEST = :CODTIPDOCINVEST,'
      '  DATABLOQDISPFINAN = :DATABLOQDISPFINAN,'
      '  FLGIMPCHEQUE = :FLGIMPCHEQUE,'
      '  FLGEXIBECOLEXP = :FLGEXIBECOLEXP,'
      '  TITSALDOANT = :TITSALDOANT,'
      '  TITSALDOTRANSP = :TITSALDOTRANSP,'
      '  FLGDESVERM = :FLGDESVERM'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into paramfinanc'
      
        '  (IDPESSOA, CODJUROS, TIPOAPLICACAO, IDEMPRESA, CODCORMONET, CC' +
        'USTOLANCNAOID, '
      
        '   PLANO, CODVARCAMBIAL, INTEGRACONTAB, CONTALANCNAOIDENT, FLGOR' +
        'CADOPREVISTO, '
      
        '   SUBCONTANAOIDENT, FLGSEPARADATA, TRDFINALCAP, TRDFINALCAR, FL' +
        'GCONFIRMARECPAG, '
      
        '   FLGCALCIMPOSTO, DIASBLOQORCCP, DIASBLOQORCMP, DIASBLOQORCLP, ' +
        'FLGATUALFLX, '
      
        '   CODTIPDOCINVEST, DATABLOQDISPFINAN, FLGIMPCHEQUE, FLGEXIBECOL' +
        'EXP, TITSALDOANT, '
      '   TITSALDOTRANSP, FLGDESVERM)'
      'values'
      
        '  (:IDPESSOA, :CODJUROS, :TIPOAPLICACAO, :IDEMPRESA, :CODCORMONE' +
        'T, :CCUSTOLANCNAOID, '
      
        '   :PLANO, :CODVARCAMBIAL, :INTEGRACONTAB, :CONTALANCNAOIDENT, :' +
        'FLGORCADOPREVISTO, '
      
        '   :SUBCONTANAOIDENT, :FLGSEPARADATA, :TRDFINALCAP, :TRDFINALCAR' +
        ', :FLGCONFIRMARECPAG, '
      
        '   :FLGCALCIMPOSTO, :DIASBLOQORCCP, :DIASBLOQORCMP, :DIASBLOQORC' +
        'LP, :FLGATUALFLX, '
      
        '   :CODTIPDOCINVEST, :DATABLOQDISPFINAN, :FLGIMPCHEQUE, :FLGEXIB' +
        'ECOLEXP, '
      '   :TITSALDOANT, :TITSALDOTRANSP, :FLGDESVERM)')
    DeleteSQL.Strings = (
      'delete from paramfinanc'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 219
    Top = 6
  end
  inherited MontaSelect: TMontaSelect
    Left = 293
    Top = 6
  end
  inherited ds: TwwDataSource
    Left = 256
    Top = 8
  end
  inherited ImlPadrao: TImageList
    Left = 41
    Top = 6
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 366
    Top = 2
  end
  object qryAlterador: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 56
    Top = 160
  end
  object qryAlterador1: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '')
    ValidateWithMask = True
    Left = 132
    Top = 160
  end
  object qryccusto: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select * from centcust')
    ValidateWithMask = True
    Left = 200
    Top = 160
  end
  object UpdParamRel: TUpdateSQL
    ModifySQL.Strings = (
      'update PARAMRELATS'
      'set'
      '  IDPARAMRELATS = :IDPARAMRELATS,'
      '  IDMODULO = :IDMODULO,'
      '  IDPESSOA = :IDPESSOA,'
      '  NOMECOMPO = :NOMECOMPO,'
      '  DESCRICAO = :DESCRICAO,'
      '  VALOR = :VALOR,'
      '  NOMERELATORIO = :NOMERELATORIO'
      'where'
      '  IDPARAMRELATS = :OLD_IDPARAMRELATS')
    InsertSQL.Strings = (
      'insert into PARAMRELATS'
      '  (IDPARAMRELATS, IDMODULO, IDPESSOA, NOMECOMPO, DESCRICAO, '
      'VALOR, NOMERELATORIO)'
      'values'
      
        '  (:IDPARAMRELATS, :IDMODULO, :IDPESSOA, :NOMECOMPO, :DESCRICAO,' +
        ' '
      ':VALOR, '
      '   :NOMERELATORIO)')
    DeleteSQL.Strings = (
      'delete from PARAMRELATS'
      'where'
      '  IDPARAMRELATS = :OLD_IDPARAMRELATS')
    Left = 120
    Top = 312
  end
  object QryParamRel: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      
        ' IDPARAMRELATS,IDMODULO,IDPESSOA,NOMECOMPO,DESCRICAO,VALOR,NOMER' +
        'ELATORIO'
      'FROM'
      ' PARAMRELATS'
      'WHERE'
      ' (IDMODULO = :PIDMODULO) AND'
      ' (IDPESSOA = :PIDPESSOA)'
      'ORDER BY NOMERELATORIO,DESCRICAO,VALOR'
      '')
    UpdateObject = UpdParamRel
    ValidateWithMask = True
    Left = 48
    Top = 312
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDMODULO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
    object QryParamRelIDPARAMRELATS: TFloatField
      FieldName = 'IDPARAMRELATS'
      Origin = 'PARAMRELATS.IDPARAMRELATS'
    end
    object QryParamRelIDMODULO: TFloatField
      FieldName = 'IDMODULO'
      Origin = 'PARAMRELATS.IDMODULO'
    end
    object QryParamRelIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'PARAMRELATS.IDPESSOA'
    end
    object QryParamRelNOMECOMPO: TStringField
      FieldName = 'NOMECOMPO'
      Origin = 'PARAMRELATS.NOMECOMPO'
      Size = 100
    end
    object QryParamRelDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'PARAMRELATS.DESCRICAO'
      Size = 100
    end
    object QryParamRelVALOR: TStringField
      FieldName = 'VALOR'
      Origin = 'PARAMRELATS.VALOR'
      Size = 100
    end
    object QryParamRelNOMERELATORIO: TStringField
      FieldName = 'NOMERELATORIO'
      Origin = 'PARAMRELATS.NOMERELATORIO'
      Size = 100
    end
  end
  object ImlReports: TImageList
    Left = 282
    Top = 279
    Bitmap = {
      494C010103000500040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001001000000000000010
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
      0000000000000000000000000000000000000000000000000000000010421042
      FF7FFF7F00001042000000000000000000000000000000000000000000000000
      0000104210420000000000000000000000000000000000000000000000001042
      1042000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000010421042FF7FFF7F
      FF7FFF7FFF7F0000000000000000000000000000000000000000000000000000
      0000FF7F0000000000000000000000000000000000000000000000000000FF7F
      0000000000000000000000001042000000000000000000000000000000000000
      000000000000000000000000000000000000000000001042FF7FFF7FFF7FFF7F
      10421042FF7F000000000000000000000000000000000000000000000000FF7F
      FF7FFF7F00000000000000000000000000000000000000000000FF7FFF7FFF7F
      000000000000000000001042FF7F000000000000000000000000000000000000
      000000000000000000000000000000000000000000001042FF7FFF7F00000000
      FF7F0000FF7FFF7F000000000000000000000000000000000000FF7FFF7FFF7F
      FF7FFF7FFF7F00000000000000000000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7F10420000000000000000FF7F000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF7FFF7F
      FF7F0000FF7FFF7F00000000000000000000000000001042FF7FFF7FFF7FFF7F
      FF7F1F00FF7F0000000000000000000000001042FF7FFF7FFF7FFF7FFF7F1F00
      0000FF7F0000FF7FFF7FFF7FFF7F000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF7FFF7FFF7FFF7F
      FF7FFF7F0000FF7FFF7F0000000000000000000000001042FF7FFF7F1F001F00
      1F00FF7FFF7FFF7F000000000000000000001042FF7FFF7F1F001F001F000000
      00000000000000000000FF7F0000000000000000000000000000000000000000
      00000000000000000000000000000000000000001042FF7FFF7FFF7FFF7FFF7F
      1F00FF7F0000FF7FFF7FFF7F0000000000000000000000001042FF7FFF7FFF7F
      FF7FFF7F1F00FF7F0000000000000000000000001042FF7FFF7FFF7FFF7FFF7F
      1042104210420000FF7F00000000000000000000000000000000000000000000
      00000000000000000000000000000000000000001042FF7FFF7F1F001F001F00
      FF7FFF7FFF7F0000FF7FFF7FFF7F000000000000000000001042FF7FFF7F1F00
      1F001F00FF7FFF7FFF7F000000000000000000001042FF7FFF7F1F001F001F00
      FF7F1042FF7FFF7F000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001042FF7FFF7FFF7FFF7F
      FF7F1F00FF7F0000FF7F104210420000000000000000000000001042FF7FFF7F
      FF7FFF7FFF7F007CFF7FFF7F000000000000000000001042FF7FFF7FFF7FFF7F
      FF7F1F0010421042000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001042FF7FFF7F1F001F00
      1F00FF7FFF7FFF7F0000000000000000000000000000007C007C007C007C007C
      FF7F007C007CFF7FFF7FFF7FFF7F00000000000000001042FF7FFF7F1F001F00
      1F00FF7FFF7FFF7FFF7F00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000001042FF7FFF7FFF7F
      FF7FFF7F1F00FF7FFF7F00000000000000000000000000000000007C007C007C
      FF7FFF7FFF7FFF7FFF7F10421042000000000000000000001042FF7FFF7FFF7F
      FF7FFF7FFF7F1042104200000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000001042FF7FFF7F1F00
      1F001F00FF7FFF7FFF7FFF7F000000000000000000000000007C007C007C007C
      FF7FFF7FFF7F10421042000000000000000000000000000000001042FF7FFF7F
      FF7F104210420000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000001042FF7FFF7F
      FF7FFF7FFF7FFF7F1042104200000000000000000000007C007C007C0000007C
      1042104210420000000000000000000000000000000000000000000010421042
      1042000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000001042FF7F
      FF7FFF7F1042104200000000000000000000007C007C007C007C00000000007C
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001042
      1042104200000000000000000000000000000000000000000000000000000000
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
  object qrySubConta: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT S.NOMESUBCONTA,S.CODSUBCONTA'
      'FROM CONTASXSUBC C, SUBCONTA S'
      'WHERE (RTRIM(C.PLACONTA) = :pPLACONTA) AND'
      '      (C.PLANO = :pPLANO) AND'
      '      (S.IDPESSOA = :pIDPESSOA) AND'
      '      (C.CODSUBCONTA = S.CODSUBCONTA) AND'
      '      (C.IDPESSOA = S.IDPESSOA)'
      'ORDER BY S.NOMESUBCONTA'
      '')
    ValidateWithMask = True
    Left = 264
    Top = 160
    ParamData = <
      item
        DataType = ftString
        Name = 'pPLACONTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pPLANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryTipoAplic: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT TIPOAPLICACAO, DESCRICAO'
      'FROM TIPOAPLICACAO'
      'ORDER BY DESCRICAO')
    ValidateWithMask = True
    Left = 224
    Top = 280
  end
  object qryTipoDocumento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select * From TipoDocRecPag Order by Descricao')
    ValidateWithMask = True
    Left = 369
    Top = 232
  end
end
