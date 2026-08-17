inherited FrmWizDesmembraAgrupa: TFrmWizDesmembraAgrupa
  Left = 22
  Top = 125
  Caption = 'Desmembramento/Agrupamento de Contas'
  ClientHeight = 407
  ClientWidth = 743
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 743
    Height = 368
    inherited PagControle: TPageControl
      Width = 741
      Height = 366
      Style = tsTabs
      inherited tabSelecao: TTabSheet
        inherited lblTitulo: TfcLabel
          Width = 733
          Caption = 'Desmembramento/Agrupamento de contas [ Etapa 1 de 3]'
        end
        object GroupBox1: TGroupBox
          Left = 16
          Top = 41
          Width = 536
          Height = 136
          Caption = 'Conta de Origem (a ser Desmembrada/Agrupada)'
          Color = clBtnFace
          ParentColor = False
          TabOrder = 0
          object lblPeriodo: TLabel
            Left = 16
            Top = 74
            Width = 46
            Height = 13
            Caption = 'Período'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblExercicio: TLabel
            Left = 16
            Top = 32
            Width = 55
            Height = 13
            Caption = 'Exercício'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object dblkExercicio: TwwDBLookupCombo
            Left = 16
            Top = 47
            Width = 133
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'PEREXERCICIO'#9'10'#9'Exercício')
            DataField = 'PEREXERCICIO'
            DataSource = ds
            LookupTable = cdsExercicio
            LookupField = 'PEREXERCICIO'
            Style = csDropDownList
            DropDownWidth = 8
            ParentFont = False
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
            OnChange = dblkExercicioChange
            OnCloseUp = dblkExercicioCloseUp
          end
          object dblkPeriodo: TwwDBLookupCombo
            Left = 16
            Top = 89
            Width = 133
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'PERNOME'#9'25'#9'Nome')
            DataField = 'PERNUMERO'
            DataSource = ds
            LookupTable = cdsPeriodo
            LookupField = 'PERNUMERO'
            Style = csDropDownList
            DropDownWidth = 8
            ParentFont = False
            TabOrder = 1
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
            OnChange = dblkPeriodoChange
            OnCloseUp = dblkPeriodoCloseUp
          end
          object cmConta: TCMProcuraMaskContabil
            Left = 165
            Top = 30
            Width = 354
            Height = 84
            Caption = ' Conta de Origem '
            TabOrder = 2
            OnExit = cmContaExit
            MostraMensagens = True
            MostraDescricao = True
            DataSource = ds
            DataField = 'PLACONTA'
            Mensagens.EmBranco = 'Conta de Origem pode estar em branco'
            Mensagens.NaoExiste = 'Conta de Origem não existe'
            Mensagens.Sintetica = 'Conta de Origem não pode ser sintética'
            Mensagens.Analitica = 'Conta de Origem não pode ser analítica'
            PermiteChaveInvalida = False
            PermiteChaveEmBranco = False
            AceitaTipoConta = SoAnalitica
            Plano = 0
            Status = scAmbas
          end
        end
        object gbAS: TGroupBox
          Left = 16
          Top = 198
          Width = 536
          Height = 128
          Caption = ' Desmembramento - Criação da conta analítica '
          TabOrder = 1
          object Label1: TLabel
            Left = 16
            Top = 73
            Width = 88
            Height = 13
            Caption = 'Nome da Conta'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label2: TLabel
            Left = 16
            Top = 31
            Width = 206
            Height = 13
            Caption = 'Conta Analítica com Compl. do Cód.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object edNomeContaAnalitica: TEdit
            Left = 16
            Top = 88
            Width = 348
            Height = 21
            TabOrder = 0
            OnExit = edNomeContaAnaliticaExit
          end
          object edComplContaAnalitica: TMaskEdit
            Left = 16
            Top = 45
            Width = 246
            Height = 21
            TabOrder = 1
            OnChange = edComplContaAnaliticaChange
            OnExit = edComplContaAnaliticaExit
          end
          object edtmask2: TMaskEdit
            Left = 520
            Top = 93
            Width = 246
            Height = 21
            TabOrder = 2
            Visible = False
            OnChange = edComplContaAnaliticaChange
            OnExit = edComplContaAnaliticaExit
          end
        end
        object GroupBox2: TGroupBox
          Left = 565
          Top = 41
          Width = 142
          Height = 285
          Caption = 'Operação'
          TabOrder = 2
          object spBtnDesmembra: TSpeedButton
            Left = 19
            Top = 28
            Width = 102
            Height = 30
            Hint = 'Faz Desmembramento'
            AllowAllUp = True
            GroupIndex = 1
            Caption = '&Desmembrar'
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000130B0000130B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333300000003
              33333333777777733333333330CCC03333333333F7777733F3333330330C0330
              33333337337773373333333333303333333333F33337333333F3303333333333
              3033373333333333373333333333333333333F3333333333333F033333333333
              3303733333333333337333333333333333333F3333333333333F033333333333
              3303733333333333FF7333333333333000333FFFFF33333777FF000003333307
              B70377777F333377777F09990333330BBB0377777F333377777F099903333307
              B70377777F3333777773099903333330003377777F3333377733000003333330
              3333777773F3F3F7333333333030303333333333373737333333}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            Transparent = False
            OnClick = spBtnDesmembraClick
          end
          object spBtnAgrupa: TSpeedButton
            Left = 19
            Top = 60
            Width = 102
            Height = 30
            Hint = 'Faz Agrupamento'
            AllowAllUp = True
            GroupIndex = 1
            Caption = '&Agrupar      '
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000130B0000130B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              3333333333FFFFF3333333333000003333333333F777773FF333333003333300
              33333337733333773F33330333333333033333733FFFFFFF73F3303300000003
              303337F37777777337F3303330CCC0333033373337777733373F0333330C0333
              33037F33337773FFF37F03333330300033037F3FFFF73777FF7F0300000307B7
              03037F77777F77777F7F030999030BBB03037F77777F77777F7F0309990307B7
              03037377777F7777737330099903300030333777777F377737F3300000033333
              3033377777733333373333033333333303333373FF33333F7333333003333300
              3333333773FFFF77333333333000003333333333377777333333}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            Transparent = False
            OnClick = spBtnAgrupaClick
          end
          object sBtnExcluir: TSpeedButton
            Left = 19
            Top = 92
            Width = 102
            Height = 30
            Hint = 'Desfaz Desmembramento\Agrupamento'
            AllowAllUp = True
            GroupIndex = 1
            Caption = '&Desfazer'
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
              3333333777777777F3333330F777777033333337F3F3F3F7F3333330F0808070
              33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
              33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
              333333F7F7F7F7F7F3F33030F080707030333737F7F7F7F7F7333300F0808070
              03333377F7F7F7F773333330F080707033333337F7F7F7F7F333333070707070
              33333337F7F7F7F7FF3333000000000003333377777777777F33330F88877777
              0333337FFFFFFFFF7F3333000000000003333377777777777333333330777033
              3333333337FFF7F3333333333000003333333333377777333333}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            Transparent = False
            OnClick = sBtnExcluirClick
          end
        end
      end
      inherited TabSheet1: TTabSheet
        inherited fcLabel1: TfcLabel
          Width = 716
          Caption = 
            'Seleção da conta destino para desfazer o agrupamento [ Etapa 2 d' +
            'e 3 ]'
        end
        object Label3: TLabel
          Left = 4
          Top = 95
          Width = 292
          Height = 13
          Caption = 'Conta Sintética (consolidadação do agrupamento): '
        end
        object Label4: TLabel
          Left = 2
          Top = 136
          Width = 375
          Height = 13
          Caption = 'Selecione a conta destino para qual será desfeito o agrupamento.'
        end
        object DBText1: TDBText
          Left = 453
          Top = 94
          Width = 50
          Height = 13
          AutoSize = True
          DataField = 'NOMECONTAPARA'
          DataSource = dsPlanoDepara
        end
        object dbgContaDesfazAgrupa: TwwDBGrid
          Left = 0
          Top = 155
          Width = 733
          Height = 201
          ControlType.Strings = (
            'FLGCHECKED;CheckBox;S;N')
          Selected.Strings = (
            'CONTADE'#9'36'#9'Código da Conta'
            'NOMECONTADE'#9'62'#9'Conta')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alBottom
          DataSource = dsPlanoDepara
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
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
        object DBEdit1: TDBEdit
          Left = 304
          Top = 88
          Width = 142
          Height = 21
          DataField = 'CONTAPARA'
          DataSource = dsPlanoDepara
          ReadOnly = True
          TabOrder = 1
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'TabSheet2'
        ImageIndex = 2
        TabVisible = False
        object fcLabel2: TfcLabel
          Left = 0
          Top = 0
          Width = 733
          Height = 24
          Align = alTop
          Caption = 'Alteração de Plano Contábil [ Etapa 3 de 3 ]'
          Color = clBtnFace
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          TextOptions.Alignment = taLeftJustify
          TextOptions.Style = fclsRaised
          TextOptions.VAlignment = vaTop
        end
        object Panel5: TPanel
          Left = 0
          Top = 24
          Width = 733
          Height = 332
          Align = alClient
          BevelOuter = bvNone
          BorderWidth = 1
          TabOrder = 0
          object Bevel1: TBevel
            Left = 7
            Top = 64
            Width = 555
            Height = 38
          end
          object Label6: TLabel
            Left = 24
            Top = 16
            Width = 55
            Height = 13
            Caption = 'Exercício'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label5: TLabel
            Left = 714
            Top = 224
            Width = 607
            Height = 13
            Caption = 
              'Data Atualização (Válido somente se o checkbox Gera Lançamentos ' +
              'para o Saldo Anterior  estiver em uso)'
            Visible = False
          end
          object Label9: TLabel
            Left = 7
            Top = 120
            Width = 129
            Height = 13
            AutoSize = False
            Caption = 'Processando Conta...: '
          end
          object lblConta: TLabel
            Left = 139
            Top = 120
            Width = 280
            Height = 13
            AutoSize = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Bevel3: TBevel
            Left = 5
            Top = 115
            Width = 441
            Height = 3
            Shape = bsTopLine
            Style = bsRaised
          end
          object Label10: TLabel
            Left = 7
            Top = 177
            Width = 111
            Height = 13
            Caption = 'Total de Registro..:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label11: TLabel
            Left = 7
            Top = 156
            Width = 110
            Height = 13
            Caption = 'Nome da Tabela...:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label12: TLabel
            Left = 264
            Top = 177
            Width = 103
            Height = 13
            Caption = 'Registro Número.:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object NREG: TLabel
            Left = 371
            Top = 178
            Width = 5
            Height = 13
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object TOTREG: TLabel
            Left = 120
            Top = 177
            Width = 5
            Height = 13
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object TABELA: TLabel
            Left = 120
            Top = 156
            Width = 5
            Height = 13
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label13: TLabel
            Left = 7
            Top = 138
            Width = 91
            Height = 13
            Caption = 'Processamento:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lparte: TLabel
            Left = 101
            Top = 139
            Width = 5
            Height = 13
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label14: TLabel
            Left = 184
            Top = 16
            Width = 110
            Height = 13
            Caption = 'A Partir do Período'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Bevel4: TBevel
            Left = 4
            Top = 192
            Width = 441
            Height = 3
            Shape = bsTopLine
            Style = bsRaised
          end
          object Label15: TLabel
            Left = 2
            Top = 195
            Width = 129
            Height = 13
            Caption = 'Log do processamento'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblPlanilha: TLabel
            Left = 25
            Top = 68
            Width = 487
            Height = 13
            Caption = 
              'Gerada planilha para transferência de saldo de código interno: 0' +
              '0000 em 01/01/2000'
          end
          object Label7: TLabel
            Left = 25
            Top = 85
            Width = 418
            Height = 13
            Caption = 
              'Somente haverá planilha para lançamentos de valores maiores que ' +
              'ZERO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object dblkexercicioAltPlano: TwwDBLookupCombo
            Left = 24
            Top = 31
            Width = 85
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'PEREXERCICIO'#9'10'#9'Exercício')
            DataField = 'PEREXERCI'
            LookupTable = cdsExercicio
            LookupField = 'PEREXERCICIO'
            Style = csDropDownList
            DropDownWidth = 8
            ParentFont = False
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
          end
          object dteDataAtualizacao: TCMDateTimePicker
            Left = 714
            Top = 344
            Width = 142
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
            TabOrder = 2
            Visible = False
          end
          object pgr: TProgressBar
            Left = 2
            Top = 214
            Width = 723
            Height = 8
            Min = 0
            Max = 100
            TabOrder = 3
          end
          object cbMesmosCCSC: TCheckBox
            Left = 719
            Top = 136
            Width = 309
            Height = 17
            Caption = 'Grava os Mesmos Centros de Custo e Subcontas'
            Checked = True
            State = cbChecked
            TabOrder = 4
            Visible = False
          end
          object cbMesmoPlano: TCheckBox
            Left = 722
            Top = 187
            Width = 309
            Height = 17
            Caption = 'De/Para é para o Mesmo Plano de Contas'
            Checked = True
            Enabled = False
            State = cbChecked
            TabOrder = 5
            Visible = False
          end
          object Anim: TAnimate
            Left = 138
            Top = 196
            Width = 18
            Height = 15
            Active = False
            AutoSize = False
            CommonAVI = aviFindFile
            StopFrame = 8
            Visible = False
          end
          object cbGeraLancSaldoAnt: TCheckBox
            Left = 714
            Top = 296
            Width = 503
            Height = 17
            Caption = 
              'Gera Lançamentos para o Saldo Anterior (somente para período esp' +
              'ecial)'
            TabOrder = 7
            Visible = False
          end
          object cbConverteSoAnterior: TCheckBox
            Left = 714
            Top = 272
            Width = 617
            Height = 17
            Caption = 
              'Converter Somente Saldo Anterior (está invisível porque não tem ' +
              'sentido fazer somente saldo anterior)'
            TabOrder = 8
            Visible = False
          end
          object dblkPeriodoAltPlano: TwwDBLookupCombo
            Left = 184
            Top = 31
            Width = 185
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'PERNOME'#9'25'#9'Período'#9'F')
            DataField = 'PERNUMERO'
            LookupTable = cdsPeriodo
            LookupField = 'PERNUMERO'
            Style = csDropDownList
            DropDownWidth = 8
            ParentFont = False
            TabOrder = 1
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
          end
          object MemoLog: TMemo
            Left = 1
            Top = 222
            Width = 731
            Height = 109
            Align = alBottom
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            ScrollBars = ssBoth
            TabOrder = 9
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 368
    Width = 743
    inherited tb97Fundo: TToolbar97
      Left = 303
      inherited btnConfirmar: TfcShapeBtn
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      1
      (
        'TMemo'
        'Text'
        0))
  end
  object Cds: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 666
    Top = 77
  end
  object ds: TwwDataSource
    DataSet = Cds
    Left = 604
    Top = 133
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'PLANODEPARA.CONTA1'
      'PLANODEPARA.PLANO1'
      'PLANODEPARA.CONTA2'
      'PLANODEPARA.PLANO2'
      'PLANOCONTAPER.PERNUMERO + 1'
      'PLANOCONTAPER.PEREXERCICIO'
      
        'DECODE(PLANOCONTAPER.FLGDESMAGRUP, NULL, '#39'?'#39', '#39'D'#39', '#39'DESMEMBRAMEN' +
        'TO'#39', '#39'A'#39', '#39'AGRUPAMENTO'#39')')
    TipodeDado.Strings = (
      'C'
      'N'
      'C'
      'N'
      'N'
      'N'
      'C')
    Descricao.Strings = (
      'Conta de Origem'
      'Plano Cont. Origem'
      'Conta de Destino'
      'Plano Cont. Destino'
      'Pernumero'
      'Exercício'
      'Desmembramento/Agrupamento')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PLANOCONTAPER'
      'PLANODEPARA')
    CamposChave.Strings = (
      'PLANOCONTAPER.IDPLANOCONTAPER'
      'PLANODEPARA.IDPLANODEPARA'
      'PLANODEPARA.CONTA1'
      'PLANODEPARA.PLANO1'
      'PLANODEPARA.CONTA2'
      'PLANODEPARA.PLANO2'
      
        'DECODE(PLANOCONTAPER.FLGDESMAGRUP, NULL, '#39'?'#39', '#39'D'#39', '#39'DESMEMBRAMEN' +
        'TO'#39', '#39'A'#39', '#39'AGRUPAMENTO'#39')')
    Filtro.Strings = (
      
        'PLANOCONTAPER.PLACONTA = PLANODEPARA.CONTA1 OR PLANOCONTAPER.PLA' +
        'CONTA = PLANODEPARA.CONTA2'
      'PLANOCONTAPER.PLANO = PLANODEPARA.PLANO1')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '18'
      '10'
      '18'
      '10'
      '10'
      '10'
      '1')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = True
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    LookupSQL.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 433
    Top = 150
  end
  object cdsPeriodo: TCMClientDataSet
    Aggregates = <>
    MasterFields = 'PEREXERCICIO'
    MasterSource = dsperiodo
    PacketRecords = 0
    Params = <>
    Left = 679
    Top = 190
  end
  object cdsPlanoConta: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 488
    Top = 149
  end
  object cdsExercicio: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 609
    Top = 77
  end
  object cdsCustoIni: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 600
    Top = 177
  end
  object cdsContas: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 680
    Top = 249
  end
  object cdsCustoFim: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 632
    Top = 18
  end
  object cdsPlanoFim: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 576
    Top = 17
  end
  object cdsPlanoIni: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 432
    Top = 209
  end
  object sqlDesmembraAgrupa: TCMSqlParams
    SQL.Strings = (
      
        'SELECT  PD.IDPLANODEPARA, PD.CONTA1 AS PLACONTA, PD.CONTA2, PD.P' +
        'LANO1, PD.PLANO1, PCP.*, PER.*,'
      '  PL.PLANOME AS NOMECONTA2'
      
        'FROM PLANODEPARA PD, PLANOCONTAPER PCP, PERIODO PER, PLANOCONTA ' +
        'PL'
      'WHERE'
      '      (PD.CONTA1 = PCP.PLACONTA OR PD.CONTA2 = PCP.PLACONTA) AND'
      '      (PD.PLANO1 = PCP.PLANO OR PD.PLANO2 = PCP.PLANO) AND'
      '      NVL(PCP.PERNUMERO, 0) +1 = PER.PERNUMERO AND'
      '      PCP.PEREXERCICIO = PER.PEREXERCICIO AND'
      '      (PD.PLANO1 = PL.PLANO) AND'
      '      (PD.CONTA1 = PL.PLACONTA) AND   '
      '      PD.IDPLANODEPARA = :IDPLANODEPARA '
      ' '
      ' ')
    ClientDataSet = Cds
    Left = 680
    Top = 16
  end
  object dsperiodo: TwwDataSource
    DataSet = cdsExercicio
    Left = 670
    Top = 129
  end
  object CdsDePara: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 605
    Top = 231
  end
  object cdsPlanoDepara: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 229
    Top = 295
  end
  object dsPlanoDepara: TwwDataSource
    DataSet = cdsPlanoDepara
    Left = 356
    Top = 293
  end
  object CMSqlParams1: TCMSqlParams
    SQL.Strings = (
      
        'SELECT PCP.IDPLANOCONTAPER,  PD.IDPLANODEPARA, PD.CONTA1 AS CONT' +
        'ADE, PC.PLANOME AS NOMECONTADE, PD.CONTA2 AS CONTAPARA, PC2.PLAN' +
        'OME AS NOMECONTAPARA, PCP.PEREXERCICIO, (PCP.PERNUMERO + 1) AS P' +
        'ERNUMERO,'
      #39'N'#39' AS FLGCHECKED  '
      
        'FROM PLANODEPARA PD, PLANOCONTAPER PCP, PLANOCONTA PC, PLANOCONT' +
        'A PC2'
      'WHERE'
      ' (PD.CONTA1 = PCP.PLACONTA OR PD.CONTA2 = PCP.PLACONTA) AND'
      ' (PD.PLANO1 = PCP.PLANO OR PD.PLANO2 = PCP.PLANO) AND'
      ' (PC.PLACONTA = PD.CONTA1) AND'
      ' (PC.PLANO = PD.PLANO1) AND  '
      ' (PC2.PLACONTA = PD.CONTA2) AND'
      ' (PC2.PLANO = PD.PLANO2) AND  '
      '  PCP.IDPLANOCONTAPER = 246 ')
    ClientDataSet = cdsPlanoDepara
    Left = 285
    Top = 295
  end
end
