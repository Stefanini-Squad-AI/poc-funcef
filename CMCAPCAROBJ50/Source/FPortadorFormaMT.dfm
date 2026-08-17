inherited frmPortadorFormaMT: TfrmPortadorFormaMT
  Left = 188
  Top = 86
  Caption = 'Contas Bancárias/Caixas x Formas de Pagamento'
  ClientHeight = 625
  ClientWidth = 662
  PixelsPerInch = 96
  TextHeight = 13
  inherited Dock971: TDock97 [0]
    Top = 586
    Width = 662
    inherited tb97Fundo: TToolbar97
      Left = 0
      DockPos = 0
      inherited bbtnSair: TBitBtn
        Tag = 9999
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 172
      DockPos = 172
      inherited bbtnCancelar: TBitBtn
        Tag = 9999
      end
    end
  end
  inherited Dock972: TDock97
    Width = 662
  end
  inherited pnlFundo: TPanel [2]
    Width = 662
    Height = 539
    object PgPortForma: TPageControl
      Left = 1
      Top = 1
      Width = 660
      Height = 537
      ActivePage = TbsContas
      Align = alClient
      TabOrder = 0
      object TbsContas: TTabSheet
        Caption = 'Contas Bancárias\Caixas'
        object lblPortadorConta: TLabel
          Left = 12
          Top = 2
          Width = 125
          Height = 13
          Caption = 'Conta Bancária\Caixa'
        end
        object lblDias: TLabel
          Left = 383
          Top = 4
          Width = 29
          Height = 13
          Caption = 'Float'
        end
        object lblDescricao: TLabel
          Left = 12
          Top = 80
          Width = 58
          Height = 13
          Caption = 'Descrição'
        end
        object lblFormapg: TLabel
          Left = 196
          Top = 2
          Width = 141
          Height = 13
          Caption = 'Formas de Recebimento:'
        end
        object Lbltipodoc: TLabel
          Left = 11
          Top = 44
          Width = 102
          Height = 13
          Caption = 'Tipo Documento :'
          Visible = False
        end
        object dbseDMais: TwwDBSpinEdit
          Left = 384
          Top = 19
          Width = 59
          Height = 21
          Increment = 1
          MaxValue = 999
          DataField = 'DMAIS'
          DataSource = ds
          TabOrder = 2
          UnboundDataType = wwDefault
        end
        object edDescricao: TwwDBEdit
          Left = 12
          Top = 95
          Width = 430
          Height = 21
          AutoFillDate = False
          DataField = 'DESCRICAO'
          DataSource = ds
          TabOrder = 5
          UnboundDataType = wwDefault
          UsePictureMask = False
          WantReturns = False
          WordWrap = False
          OnEnter = edDescricaoEnter
        end
        object GroupBox1: TGroupBox
          Left = 12
          Top = 288
          Width = 434
          Height = 91
          Caption = ' Lança no Controle Financeiro '
          TabOrder = 6
          object sbtnSim: TSpeedButton
            Left = 98
            Top = 14
            Width = 101
            Height = 33
            GroupIndex = 1
            Down = True
            Caption = 'Si&m'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
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
            ParentFont = False
            OnClick = sbtnSimClick
          end
          object sbtnNao: TSpeedButton
            Left = 235
            Top = 14
            Width = 101
            Height = 33
            GroupIndex = 1
            Caption = '&Não'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
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
            ParentFont = False
            OnClick = sbtnNaoClick
          end
          object Label2: TLabel
            Left = 11
            Top = 49
            Width = 171
            Height = 13
            Caption = 'Descrição para o Lançamento'
          end
          object DbEdDescFinan: TwwDBEdit
            Left = 11
            Top = 64
            Width = 414
            Height = 21
            AutoFillDate = False
            DataField = 'DESCFINAN'
            DataSource = ds
            TabOrder = 0
            UnboundDataType = wwDefault
            UsePictureMask = False
            WantReturns = False
            WordWrap = False
            OnEnter = edDescricaoEnter
          end
        end
        object grbIntContab: TGroupBox
          Left = 13
          Top = 134
          Width = 433
          Height = 139
          Caption = ' Preencher para integração com a Contabilidade '
          TabOrder = 7
          object lblCentroCusto: TLabel
            Left = 226
            Top = 18
            Width = 92
            Height = 13
            Caption = 'Centro de Custo'
          end
          object Label20: TLabel
            Left = 226
            Top = 53
            Width = 55
            Height = 13
            Caption = 'Subconta'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblUnidNegoc: TLabel
            Left = 226
            Top = 92
            Width = 104
            Height = 13
            Caption = 'Atividade\Projeto:'
          end
          object CContabil: TCMProcuraMaskContabil
            Left = 9
            Top = 15
            Width = 210
            Height = 112
            Caption = ' Conta Contábil '
            TabOrder = 0
            OnExit = CContabilExit
            MostraMensagens = True
            MostraDescricao = True
            DataSource = ds
            DataField = 'PLACONTA'
            Mensagens.EmBranco = 'Conta Contábil não pode estar em branco'
            Mensagens.NaoExiste = 'Conta Contábil não existe'
            Mensagens.Sintetica = 'Conta Contábil não pode ser sintética'
            Mensagens.Analitica = 'Conta Contábil não pode ser analítica'
            PermiteChaveInvalida = False
            PermiteChaveEmBranco = True
            AceitaTipoConta = SoAnalitica
            Plano = 0
            Status = scSoAtiva
            OnApertouBotao = CContabilApertouBotao
          end
          object cmbCCusto: TwwDBLookupCombo
            Left = 226
            Top = 32
            Width = 194
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'30'#9'Centro de Custo'#9'F'
              'CODEXTERNO'#9'10'#9'Código'#9'F')
            DataField = 'CODCENTROCUSTO'
            DataSource = ds
            LookupTable = CdsCCusto
            LookupField = 'CODCENTROCUSTO'
            Options = [loTitles]
            Style = csDropDownList
            TabOrder = 1
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
          object dblkSubconta: TwwDBLookupCombo
            Left = 226
            Top = 69
            Width = 194
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOMESUBCONTA'#9'30'#9'Nome'
              'CODSUBCONTA'#9'10'#9'Código')
            DataField = 'CODSUBCONTA'
            DataSource = ds
            LookupTable = CdsSubConta
            LookupField = 'CODSUBCONTA'
            Style = csDropDownList
            TabOrder = 2
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
          object dblcUnidNegoc: TwwDBLookupCombo
            Left = 226
            Top = 107
            Width = 194
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'25'#9'Descrição'#9'No'
              'UNETIPO'#9'1'#9'T'#9'No'
              'UNECODIGO'#9'10'#9'Código'#9'No')
            DataField = 'UNIDNEGOC'
            DataSource = ds
            LookupTable = CdsUnidNegoc
            LookupField = 'UNIDNEGOC'
            Options = [loColLines, loTitles]
            Style = csDropDownList
            TabOrder = 3
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
            OnExit = dblcUnidNegocExit
          end
        end
        object CmbFormadeRecebimento: TwwDBLookupCombo
          Left = 194
          Top = 18
          Width = 185
          Height = 21
          DropDownAlignment = taRightJustify
          Selected.Strings = (
            'DESCRICAO'#9'30'#9'Descrição')
          DataField = 'CODFORMA'
          DataSource = ds
          LookupTable = CdsFormaRecPag
          LookupField = 'CODFORMA'
          DropDownWidth = 370
          TabOrder = 1
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
        object dblkcmbPortadorContar: TwwDBLookupCombo
          Left = 12
          Top = 18
          Width = 174
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'35'#9'DESCRICAO')
          DataField = 'CODPORTADOR'
          DataSource = ds
          LookupTable = CdsPortadorConta
          LookupField = 'CODPORTADOR'
          DropDownWidth = 370
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
          OnCloseUp = dblkcmbPortadorContarCloseUp
        end
        object DbCkAlteradores: TDBCheckBox
          Left = 256
          Top = 59
          Width = 185
          Height = 17
          Caption = 'Utiliza &Alteradores no Envio'
          DataField = 'FLGUSAALTENVIO'
          DataSource = ds
          TabOrder = 4
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dblkcmbtipdoc: TwwDBLookupCombo
          Left = 12
          Top = 58
          Width = 229
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'35'#9'DESCRICAO')
          DataField = 'CODTIPDOC'
          DataSource = ds
          LookupTable = CdsTipo
          LookupField = 'CODTIPDOC'
          DropDownWidth = 370
          TabOrder = 3
          Visible = False
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
        object dbchkFlgEncContas: TDBCheckBox
          Left = 12
          Top = 400
          Width = 282
          Height = 17
          Caption = 'Portador específico para encontro de contas'
          DataField = 'FLGENCCONTAS'
          DataSource = ds
          TabOrder = 8
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object DBFlgAtivo: TDBCheckBox
          Left = 12
          Top = 424
          Width = 141
          Height = 17
          Caption = 'Portador inativo'
          DataField = 'FLGATIVO'
          DataSource = ds
          TabOrder = 9
          ValueChecked = 'N'
          ValueUnchecked = 'S'
        end
      end
      object TbsForma: TTabSheet
        Caption = 'Modelos'
        object lblModeloCheque: TLabel
          Left = 17
          Top = 0
          Width = 168
          Height = 13
          Caption = 'Modelo de Bloqueto Bancário'
        end
        object LblRemessa: TLabel
          Left = 17
          Top = 37
          Width = 180
          Height = 13
          Caption = 'Modelo de Arquivo de Remessa'
        end
        object LblFichaComp: TLabel
          Left = 234
          Top = 0
          Width = 196
          Height = 13
          Caption = 'Modelo de Ficha de Compensação'
        end
        object GpbDados: TGroupBox
          Left = 4
          Top = 74
          Width = 637
          Height = 427
          Anchors = [akLeft, akTop, akRight, akBottom]
          Caption = ' Dados Arquivo de Cobrança Eletrônica '
          TabOrder = 0
          object PnlSISPAG: TPanel
            Left = 2
            Top = 15
            Width = 633
            Height = 410
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 2
            Visible = False
            object Label14: TLabel
              Left = 11
              Top = 330
              Width = 235
              Height = 13
              Anchors = [akLeft, akBottom]
              Caption = 'Diretório Padrão do Arquivo de Remessa:'
            end
            object Label15: TLabel
              Left = 11
              Top = 370
              Width = 229
              Height = 13
              Anchors = [akLeft, akBottom]
              Caption = 'Diretório Padrão do Arquivo de Retorno:'
            end
            object SpeedButton3: TSpeedButton
              Left = 560
              Top = 383
              Width = 23
              Height = 22
              Hint = 'Seleciona Diretório'
              Anchors = [akLeft, akBottom]
              Flat = True
              Glyph.Data = {
                06020000424D0602000000000000760000002800000028000000140000000100
                0400000000009001000000000000000000001000000010000000000000000000
                80000080000000808000800000008000800080800000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                33333333333333333333333333333333333333333333333333FFFFFFFFFFFFFF
                3333380000000000000333333888888888888883F3333007B7B7B7B7B7B03333
                3883F33333333338F33330F07B7B7B7B7B70333338F8F333333333383F3330B0
                B7B7B7B7B7B7033338F83F33333333338F3330FB0B7B7B7B7B7B033338F38F33
                3333333383F330BF07B7B7B7B7B7B03338F383FFFFF3333338F330FBF000007B
                7B7B703338F33888883FFFFFF83330BFB0FFFF000000033338F338F333888888
                8F3330FBF0FFFFFFFFFF033338F338F33FFFFFF38F3330BFB0FF000000FF0333
                38F338F3888888338F3330FBF0FFFFFFFFFF0333387F88F3FFFFF3338F333300
                00F00000FFFF0333338888F8888833FF8F33333330FFFFFFF0000333333338F3
                FFFFF8888333333330F00000F0FF0333333338F8888838F38333333330FFFFFF
                F0F03333333338F3333338F83333333330FFFFFFF0033333333338FFFFFFF883
                3333333330000000003333333333388888888833333333333333333333333333
                33333333333333333333}
              NumGlyphs = 2
              ParentShowHint = False
              ShowHint = True
              OnClick = SpeedButton2Click
            end
            object SpeedButton4: TSpeedButton
              Left = 561
              Top = 347
              Width = 22
              Height = 22
              Hint = 'Seleciona Diretório'
              Anchors = [akLeft, akBottom]
              Flat = True
              Glyph.Data = {
                06020000424D0602000000000000760000002800000028000000140000000100
                0400000000009001000000000000000000001000000010000000000000000000
                80000080000000808000800000008000800080800000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                33333333333333333333333333333333333333333333333333FFFFFFFFFFFFFF
                3333380000000000000333333888888888888883F3333007B7B7B7B7B7B03333
                3883F33333333338F33330F07B7B7B7B7B70333338F8F333333333383F3330B0
                B7B7B7B7B7B7033338F83F33333333338F3330FB0B7B7B7B7B7B033338F38F33
                3333333383F330BF07B7B7B7B7B7B03338F383FFFFF3333338F330FBF000007B
                7B7B703338F33888883FFFFFF83330BFB0FFFF000000033338F338F333888888
                8F3330FBF0FFFFFFFFFF033338F338F33FFFFFF38F3330BFB0FF000000FF0333
                38F338F3888888338F3330FBF0FFFFFFFFFF0333387F88F3FFFFF3338F333300
                00F00000FFFF0333338888F8888833FF8F33333330FFFFFFF0000333333338F3
                FFFFF8888333333330F00000F0FF0333333338F8888838F38333333330FFFFFF
                F0F03333333338F3333338F83333333330FFFFFFF0033333333338FFFFFFF883
                3333333330000000003333333333388888888833333333333333333333333333
                33333333333333333333}
              NumGlyphs = 2
              ParentShowHint = False
              ShowHint = True
              OnClick = SpeedButton1Click
            end
            object Label16: TLabel
              Left = 295
              Top = 5
              Width = 111
              Height = 13
              Caption = 'Tipo de Pagamento'
            end
            object Label17: TLabel
              Left = 14
              Top = 45
              Width = 120
              Height = 13
              Caption = 'Forma de Pagamento'
            end
            object Bevel1: TBevel
              Left = 8
              Top = 95
              Width = 575
              Height = 44
            end
            object lblValorMax: TLabel
              Left = 14
              Top = 100
              Width = 76
              Height = 13
              Caption = 'Valor Máximo'
            end
            object Label8: TLabel
              Left = 103
              Top = 100
              Width = 185
              Height = 13
              Caption = 'Forma de Pagamento Alternativa'
            end
            object Label12: TLabel
              Left = 517
              Top = 100
              Width = 52
              Height = 13
              Caption = 'Float Alt.'
            end
            object DBRadioGroup1: TDBRadioGroup
              Left = 8
              Top = 143
              Width = 578
              Height = 63
              Anchors = [akLeft, akTop, akRight]
              Caption = 'Aviso de Pgto:'
              Columns = 2
              DataField = 'FLGEMITEAVISO'
              DataSource = ds
              Items.Strings = (
                'Não Emite'
                'No Agendamento'
                'Após Pagamento'
                'Agendamento/Pagto'
                'Com Cópia Para o Favorecido')
              TabOrder = 0
              Values.Strings = (
                '0'
                '3'
                '5'
                '9'
                '7')
            end
            object CmbFormaPgto: TComboBox
              Left = 14
              Top = 61
              Width = 571
              Height = 21
              ItemHeight = 0
              TabOrder = 1
              OnChange = CmbFormaPgtoChange
            end
            object DBEdtValMax: TwwDBEdit
              Left = 14
              Top = 113
              Width = 83
              Height = 21
              DataField = 'VALORMAXIMO'
              DataSource = ds
              TabOrder = 2
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object CmbFormaPgtoAlt: TComboBox
              Left = 102
              Top = 113
              Width = 407
              Height = 21
              ItemHeight = 0
              TabOrder = 3
              OnChange = CmbFormaPgtoChange
            end
            object wwDBSpinEdit2: TwwDBSpinEdit
              Left = 517
              Top = 113
              Width = 59
              Height = 21
              Increment = 1
              MaxValue = 999
              DataField = 'DMAISALT'
              DataSource = ds
              TabOrder = 4
              UnboundDataType = wwDefault
            end
            object CmbTipoPgto: TwwDBComboBox
              Left = 296
              Top = 21
              Width = 289
              Height = 21
              ShowButton = True
              Style = csDropDown
              MapList = False
              AllowClearKey = False
              ShowMatchText = True
              DropDownCount = 8
              DropDownWidth = 400
              ItemHeight = 0
              Sorted = False
              TabOrder = 5
              UnboundDataType = wwDefault
            end
            object Panel1: TPanel
              Left = 8
              Top = 218
              Width = 577
              Height = 99
              BevelInner = bvLowered
              BevelOuter = bvSpace
              ParentShowHint = False
              ShowHint = True
              TabOrder = 6
              OnMouseMove = Panel1MouseMove
              object dbRdgArqivo: TDBRadioGroup
                Left = 8
                Top = 29
                Width = 433
                Height = 56
                Caption = 'Para Geração do Arquivo'
                DataField = 'FLGDATATDEBCRED'
                DataSource = ds
                Items.Strings = (
                  'Considera Data para Crédito na Conta do Fornecedor'
                  'Considera Data para Débito na Conta da Fundação')
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
                Values.Strings = (
                  'C'
                  'D')
                OnChange = dbRdgArqivoChange
              end
              object dbchkDTcredito: TDBCheckBox
                Left = 11
                Top = 7
                Width = 430
                Height = 20
                Caption = 
                  'Considera FLOAT para cálculo de data de pagamento arquivo bancár' +
                  'io.'
                DataField = 'FLGFLOATARQBANC'
                DataSource = ds
                TabOrder = 1
                ValueChecked = 'S'
                ValueUnchecked = 'N'
                OnClick = dbchkDTcreditoClick
              end
            end
          end
          object PnlCNAB: TPanel
            Left = 2
            Top = 15
            Width = 633
            Height = 410
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 3
            Visible = False
            object Label5: TLabel
              Left = 13
              Top = 42
              Width = 83
              Height = 13
              Caption = 'Nosso Número'
            end
            object Label6: TLabel
              Left = 13
              Top = 82
              Width = 77
              Height = 13
              Caption = 'Dias Protesto'
            end
            object Label7: TLabel
              Left = 117
              Top = 82
              Width = 76
              Height = 13
              Caption = 'Juros por Dia'
            end
            object Label9: TLabel
              Left = 221
              Top = 82
              Width = 83
              Height = 13
              Caption = 'Data Remessa'
            end
            object LblDirRemessa: TLabel
              Left = 13
              Top = 332
              Width = 231
              Height = 13
              Anchors = [akLeft, akBottom]
              Caption = 'Diretório Padrão do Arquivo de Remessa'
            end
            object LblDirRetorno: TLabel
              Left = 14
              Top = 370
              Width = 225
              Height = 13
              Anchors = [akLeft, akBottom]
              Caption = 'Diretório Padrão do Arquivo de Retorno'
            end
            object SpeedButton2: TSpeedButton
              Left = 395
              Top = 382
              Width = 27
              Height = 24
              Hint = 'Seleciona Diretório'
              Anchors = [akLeft, akBottom]
              Flat = True
              Glyph.Data = {
                7E010000424D7E01000000000000760000002800000016000000160000000100
                0400000000000801000000000000000000001000000010000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                88888888880070000000000000000000000078F8F8F8F8F8F8F8F8F8F0007F8F
                8F8F8F8F8F8F8F8F800078F8000000000000F118F0007F800B8B8B8B8B8B1111
                800078F0B0B8B8B8B8B11118F0007F80F08B8B8B8B11118F800078F0BF08B8B8
                B1111808F0007F80FBF0000018118B0F800078F0BFBFB000018000F8F0007F80
                FBFB0EEE01FB0F8F800078F0BFB0EEEEE0BF08F8F0007F80FBF0EEEEE0FB0F8F
                800078F0BFB0EEEEE000F8F8F0007F8F00000EEE0F8F8F8F800078F8F8F8F000
                F8F8F8F8F0007F8F8F8F8F8F8F8F8F8F80007000000000000000000000007F0C
                CCCCCCCCCCCCC0F0F00077777777777777777777770088888888888888888888
                8800}
              ParentShowHint = False
              ShowHint = True
              OnClick = SpeedButton2Click
            end
            object SpeedButton1: TSpeedButton
              Left = 395
              Top = 345
              Width = 28
              Height = 24
              Hint = 'Seleciona Diretório'
              Anchors = [akLeft, akBottom]
              Flat = True
              Glyph.Data = {
                7E010000424D7E01000000000000760000002800000016000000160000000100
                0400000000000801000000000000000000001000000010000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                88888888880070000000000000000000000078F8F8F8F8F8F8F8F8F8F0007F8F
                8F8F8F8F8F8F8F8F800078F8000000000000F118F0007F800B8B8B8B8B8B1111
                800078F0B0B8B8B8B8B11118F0007F80F08B8B8B8B11118F800078F0BF08B8B8
                B1111808F0007F80FBF0000018118B0F800078F0BFBFB000018000F8F0007F80
                FBFB0EEE01FB0F8F800078F0BFB0EEEEE0BF08F8F0007F80FBF0EEEEE0FB0F8F
                800078F0BFB0EEEEE000F8F8F0007F8F00000EEE0F8F8F8F800078F8F8F8F000
                F8F8F8F8F0007F8F8F8F8F8F8F8F8F8F80007000000000000000000000007F0C
                CCCCCCCCCCCCC0F0F00077777777777777777777770088888888888888888888
                8800}
              ParentShowHint = False
              ShowHint = True
              OnClick = SpeedButton1Click
            end
            object Label1: TLabel
              Left = 220
              Top = 0
              Width = 110
              Height = 13
              Caption = 'Código da Empresa'
            end
            object LblNumEmpresa: TLabel
              Left = 11
              Top = 0
              Width = 154
              Height = 13
              Caption = 'Número Empresa no Banco'
            end
            object EdtNossoNumero: TwwDBEdit
              Left = 13
              Top = 58
              Width = 401
              Height = 21
              AutoFillDate = False
              DataField = 'NOSSONUMERO'
              DataSource = ds
              MaxLength = 35
              TabOrder = 0
              UnboundDataType = wwDefault
              UsePictureMask = False
              WantReturns = False
              WordWrap = False
            end
            object wwDBEdit3: TwwDBEdit
              Left = 13
              Top = 98
              Width = 93
              Height = 21
              AutoFillDate = False
              DataField = 'PRAZOPROTESTO'
              DataSource = ds
              MaxLength = 35
              TabOrder = 1
              UnboundDataType = wwDefault
              UsePictureMask = False
              WantReturns = False
              WordWrap = False
            end
            object wwDBEdit6: TwwDBEdit
              Left = 219
              Top = 98
              Width = 107
              Height = 21
              AutoFillDate = False
              Color = clWhite
              DataField = 'DATACONTRREMESSA'
              DataSource = ds
              MaxLength = 35
              ReadOnly = True
              TabOrder = 2
              UnboundDataType = wwDefault
              UsePictureMask = False
              WantReturns = False
              WordWrap = False
            end
            object wwDBEdit5: TDBRealEdit
              Left = 117
              Top = 98
              Width = 92
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '      0,00')
              TabOrder = 3
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'JUROSPORDIA'
              DataSource = ds
            end
            object wwDBEdit1: TwwDBEdit
              Left = 220
              Top = 14
              Width = 194
              Height = 21
              AutoFillDate = False
              DataField = 'NUMRAZAOCC'
              DataSource = ds
              MaxLength = 35
              TabOrder = 4
              UnboundDataType = wwDefault
              UsePictureMask = False
              WantReturns = False
              WordWrap = False
            end
            object DblkNumEmpresa: TwwDBLookupCombo
              Left = 13
              Top = 15
              Width = 196
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NUMEMPRESABANCO'#9'20'#9'Num. Emp Banco'#9'F'
                'DESCRICAO'#9'25'#9'Descrição'#9'F'
                'CONTROLEREMESSA'#9'5'#9'Ctrl. Rem.'#9'F')
              DataField = 'NUMEMPRESABANCO'
              DataSource = ds
              LookupTable = CdsSeqRemessa
              LookupField = 'NUMEMPRESABANCO'
              Options = [loTitles]
              Style = csDropDownList
              TabOrder = 5
              AutoDropDown = False
              ShowButton = True
              AllowClearKey = False
              ShowMatchText = True
            end
          end
          object wwDBEdit7: TwwDBEdit
            Left = 13
            Top = 362
            Width = 548
            Height = 21
            Anchors = [akLeft, akBottom]
            AutoFillDate = False
            Color = 12320767
            DataField = 'PATHARQUIVOREM'
            DataSource = ds
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            MaxLength = 35
            ParentFont = False
            TabOrder = 0
            UnboundDataType = wwDefault
            UsePictureMask = False
            WantReturns = False
            WordWrap = False
          end
          object wwDBEdit8: TwwDBEdit
            Left = 13
            Top = 399
            Width = 548
            Height = 21
            Anchors = [akLeft, akBottom]
            AutoFillDate = False
            Color = 12320767
            DataField = 'PATHARQUIVORET'
            DataSource = ds
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            MaxLength = 35
            ParentFont = False
            TabOrder = 1
            UnboundDataType = wwDefault
            UsePictureMask = False
            WantReturns = False
            WordWrap = False
          end
        end
        object CmbCheque: TwwDBLookupCombo
          Left = 16
          Top = 17
          Width = 214
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'LAYOUT'#9'25'#9'Descrição')
          DataField = 'IDTEMPLCHEQUE'
          DataSource = ds
          LookupTable = CdsModeloCheque
          LookupField = 'IDTEMPLCHEQUE'
          DropDownWidth = 250
          TabOrder = 2
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = False
        end
        object CmbBloq: TwwDBLookupCombo
          Left = 16
          Top = 17
          Width = 214
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'LAYOUT'#9'10'#9'Descrição')
          DataField = 'CODBLOQCHE'
          DataSource = ds
          LookupTable = CdsModeloBloquete
          LookupField = 'CODBLOQCHE'
          DropDownWidth = 250
          TabOrder = 1
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
        object CmbModeloCnab: TCMDBLookupCombo
          Left = 16
          Top = 52
          Width = 423
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'60'#9'DESCRICAO')
          DataField = 'CODARQUIVOREMESSA'
          DataSource = ds
          LookupTable = CdsModelosCnab
          LookupField = 'IDMODELOSCNAB'
          Options = [loTitles]
          Style = csDropDownList
          TabOrder = 3
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
          OnChange = CmbModeloCnabChange
          OnCloseUp = CmbModeloCnabCloseUp
        end
        object CmbFichaComp: TwwDBLookupCombo
          Left = 233
          Top = 17
          Width = 206
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCCONFIGBARRAS'#9'60'#9'Descrição')
          DataField = 'IDCONFIGBARRAS'
          DataSource = ds
          LookupTable = CdsConfigBarras
          LookupField = 'IDCONFIGBARRAS'
          DropDownWidth = 250
          TabOrder = 4
          AutoDropDown = True
          ShowButton = True
          OrderByDisplay = False
          AllowClearKey = True
          ShowMatchText = True
        end
        object DBCheckBox2: TDBCheckBox
          Left = 448
          Top = 56
          Width = 193
          Height = 17
          Caption = 'Imprime Mensagens no Verso'
          DataField = 'FLGMENSAGEMVERSO'
          DataSource = ds
          TabOrder = 5
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
      end
      object TbsEmissao: TTabSheet
        Caption = 'Geral'
        object GpbEmisCheque: TGroupBox
          Left = 10
          Top = 154
          Width = 443
          Height = 113
          Caption = ' Emissão '
          TabOrder = 0
          object CContabilCheque: TCMProcuraMaskContabil
            Left = 13
            Top = 35
            Width = 418
            Height = 70
            Caption = ' Conta Contábil '
            TabOrder = 0
            MostraMensagens = True
            MostraDescricao = True
            DataSource = ds
            DataField = 'PLACONTACONTABCHQ'
            Mensagens.EmBranco = 'Conta Contábil não pode estar em branco'
            Mensagens.NaoExiste = 'Conta Contábil não existe'
            Mensagens.Sintetica = 'Conta Contábil não pode ser sintética'
            Mensagens.Analitica = 'Conta Contábil não pode ser analítica'
            PermiteChaveInvalida = False
            PermiteChaveEmBranco = True
            AceitaTipoConta = SoAnalitica
            Plano = 0
            Status = scSoAtiva
          end
          object CkbContabEmissao: TDBCheckBox
            Left = 13
            Top = 17
            Width = 229
            Height = 17
            Caption = 'Contabiliza a Emissão de Cheques'
            DataField = 'FLGCONTABEMISCHQ'
            DataSource = ds
            TabOrder = 1
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
        end
        object GpLancDoc: TGroupBox
          Left = 10
          Top = 6
          Width = 443
          Height = 139
          Caption = ' Dados Para Lançamento de Documento Associado a Imposto '
          TabOrder = 1
          object CmpForCli: TCMProcuraForCli
            Left = 12
            Top = 16
            Width = 419
            Height = 49
            Caption = ' Favorecido '
            TabOrder = 0
            OnExit = CmpForCliExit
            CampoEdit = ceRazaoSocial
            MostraMensagens = True
            DataSource = ds
            DataField = 'IDFORCLI'
            Mensagens.EmBranco = 'não pode estar em branco'
            Mensagens.NaoExiste = 'não existe'
            PermiteChaveInvalida = False
            PermiteChaveEmBranco = True
            ForCli = fcFornecedor
            MostraEndereco = False
            StatusForCli = fcAll
            MostraStatusCredito = False
          end
          object GroupBox2: TGroupBox
            Left = 12
            Top = 69
            Width = 421
            Height = 64
            Caption = ' Para Data Programada do Documento Considerar '
            TabOrder = 1
            object Label3: TLabel
              Left = 11
              Top = 23
              Width = 46
              Height = 26
              Caption = 'Dia da Semana'
              WordWrap = True
            end
            object Label4: TLabel
              Left = 219
              Top = 23
              Width = 137
              Height = 26
              Caption = 'Dias Úteis Para Lançamento na Semana'
              WordWrap = True
            end
            object wwDBComboBox1: TwwDBComboBox
              Left = 62
              Top = 26
              Width = 141
              Height = 21
              ShowButton = True
              Style = csDropDownList
              MapList = False
              AllowClearKey = False
              DataField = 'DIASEMANALANCTO'
              DataSource = ds
              DropDownCount = 8
              ItemHeight = 0
              Items.Strings = (
                'Segunda'
                'Terça'
                'Quarta'
                'Quinta'
                'Sexta')
              Sorted = False
              TabOrder = 0
              UnboundDataType = wwDefault
            end
            object wwDBSpinEdit1: TwwDBSpinEdit
              Left = 362
              Top = 26
              Width = 49
              Height = 21
              Increment = 1
              MaxValue = 4
              DataField = 'DIASUTEISLANCTO'
              DataSource = ds
              TabOrder = 1
              UnboundDataType = wwDefault
            end
          end
        end
        object CkbIndicaFavorecido: TDBCheckBox
          Left = 11
          Top = 276
          Width = 395
          Height = 17
          Caption = 'Obriga a Indicação do Favorecido no momento da criação do lote'
          DataField = 'FLGOBRIGAFAV'
          DataSource = ds
          TabOrder = 2
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object DBCheckBox1: TDBCheckBox
          Left = 11
          Top = 294
          Width = 197
          Height = 17
          Caption = 'Caracteriza Cheques Diferidos'
          DataField = 'FLGCHEQUEDIFERIDO'
          DataSource = ds
          TabOrder = 3
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object CkbCtrlTalao: TDBCheckBox
          Left = 11
          Top = 313
          Width = 280
          Height = 17
          Caption = 'Controla Talonário e Numeração de Cheques'
          DataField = 'FLGCONTROLACHEQUE'
          DataSource = ds
          TabOrder = 4
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 515
    Top = 159
    TargetsData = (
      1
      2
      (
        'TMemo'
        'Text'
        0)
      (
        'TwwDBRichEdit'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 280
    Top = 3
  end
  inherited ImlPadrao: TImageList
    Left = 568
    Top = 8
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 470
    Top = 10
  end
  inherited Cds: TCMClientDataSet
    BeforeInsert = CdsBeforeInsert
    BeforeEdit = CdsBeforeEdit
    Left = 316
    Top = 15
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'PORTADORFORMA.DESCRICAO')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Descrição')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'PORTADORFORMA')
    CamposChave.Strings = (
      'PORTADORFORMA.CODPORTFORMA')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '50')
    Left = 365
    Top = 3
  end
  object DlgAbrir: TProcuraDirDlg
    Caption = 'Impressora / Porta'
    Directory = 
      #0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0 +
      #0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0 +
      #0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0 +
      #0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0 +
      #0#0#0#0
    Folder = foCustom
    Options = [bfStatusText, bfBrowseForComputer]
    ShowPath = True
    Left = 512
    Top = 82
  end
  object CdsConta: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 453
    Top = 490
  end
  object CdsFormaRecPag: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 553
    Top = 418
  end
  object CdsModeloCheque: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 523
    Top = 202
  end
  object CdsConfigBarras: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 501
    Top = 410
  end
  object CdsModelosCnab: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 469
    Top = 202
  end
  object CdsUnidNegoc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 509
    Top = 274
  end
  object CdsPortadorConta: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 557
    Top = 322
  end
  object CdsModeloBloquete: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 501
    Top = 442
  end
  object CdsAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 517
    Top = 378
  end
  object CdsCCusto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 477
    Top = 354
  end
  object CdsSubConta: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 533
    Top = 458
  end
  object dsModelosCnab: TwwDataSource
    DataSet = CdsModelosCnab
    Left = 495
    Top = 317
  end
  object CdsParamGlobal: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 529
    Top = 244
  end
  object CdsSeqRemessa: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 581
    Top = 152
  end
  object dsSeqRemessa: TwwDataSource
    DataSet = CdsSeqRemessa
    Left = 552
    Top = 200
  end
  object CdsTipo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    BeforeInsert = CdsBeforeInsert
    BeforeEdit = CdsBeforeEdit
    Left = 316
    Top = 151
  end
  object dstipo: TwwDataSource
    DataSet = CdsTipo
    Left = 400
    Top = 27
  end
end
