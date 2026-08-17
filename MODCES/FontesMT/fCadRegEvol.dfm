inherited frmCadRegEvol: TfrmCadRegEvol
  Left = 37
  Top = 92
  Caption = 'Registro de Alteração Funcional'
  ClientHeight = 455
  ClientWidth = 721
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 721
    Height = 369
    BorderWidth = 2
    inherited pnlMestre: TPanel
      Left = 4
      Top = 4
      Width = 713
      Height = 55
      object Label1: TLabel
        Left = 18
        Top = 9
        Width = 55
        Height = 13
        Caption = 'Matrícula'
      end
      object Label10: TLabel
        Left = 240
        Top = 9
        Width = 33
        Height = 13
        Caption = 'Nome'
      end
      object dbedMat: TwwDBEdit
        Left = 81
        Top = 6
        Width = 112
        Height = 21
        Color = clGray
        DataField = 'MATRICULA'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbedNome: TwwDBEdit
        Left = 277
        Top = 6
        Width = 416
        Height = 21
        Color = clGray
        DataField = 'NOME'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object edSitFunc: TEdit
        Left = 18
        Top = 30
        Width = 250
        Height = 21
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
      end
      object edCargo: TEdit
        Left = 277
        Top = 30
        Width = 416
        Height = 21
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Left = 4
      Top = 59
      Width = 713
      Height = 306
      Tabs.Strings = (
        'Evolução Funcional')
      inherited pgctrlDetalhe: TPageControl
        Width = 615
        Height = 247
        inherited tbsDet: TTabSheet
          Caption = 'tbsDet'
          inherited dbgrdDet: TwwDBGrid [0]
            Width = 607
            Height = 219
            Selected.Strings = (
              'DATAALTERFUNC'#9'10'#9'Data Efet.'#9'F'
              'DESCRICAO'#9'50'#9'Tipo de Evento'#9'F'
              'SALARIO'#9'10'#9'Salário'#9'F'
              'TIPOPAGAMENTO'#9'1'#9'Freq.'#9'F'
              'PERC_REAJ'#9'10'#9'% Reaj.'#9'F'
              'TITULO'#9'40'#9'Cargo'#9'F'
              'FUNCAO'#9'40'#9'Cargo Alternativo ou Função'#9'F'
              'CENTROCUSTO'#9'30'#9'Centro de Custo'#9'F'
              'FILIAL'#9'60'#9'Estabelecimento'#9'F')
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgWordWrap]
            ParentFont = False
            UseTFields = False
          end
          inherited pnlControlesDet: TPanel [1]
            Width = 607
            Height = 219
            object Label2: TLabel
              Left = 6
              Top = 0
              Width = 88
              Height = 13
              Caption = 'Tipo de Evento'
            end
            object Label4: TLabel
              Left = 482
              Top = 0
              Width = 111
              Height = 13
              Caption = 'Data de Efetivação'
            end
            object gbxFaixa1: TGroupBox
              Left = 6
              Top = 112
              Width = 220
              Height = 102
              Caption = 'Faixa Salarial no Cargo Básico'
              TabOrder = 7
              object Label27: TLabel
                Left = 44
                Top = 65
                Width = 81
                Height = 13
                Caption = 'Step Na Faixa'
              end
              object dbspeStep1: TwwDBSpinEdit
                Left = 132
                Top = 62
                Width = 43
                Height = 21
                Increment = 1
                MaxValue = 9
                MinValue = 1
                DataField = 'NIVELINDIV1'
                DataSource = dsDet
                TabOrder = 0
                UnboundDataType = wwDefault
                AfterDownClick = dblckFaixa1Change
              end
              object dblckFaixa1: TwwDBLookupCombo
                Left = 47
                Top = 27
                Width = 127
                Height = 21
                DropDownAlignment = taRightJustify
                Selected.Strings = (
                  'IDFAIXASALARIAL'#9'10'#9'Código'
                  'STEP1'#9'10'#9'STEP 1'
                  'STEP2'#9'10'#9'STEP 2'
                  'STEP3'#9'10'#9'STEP 3'
                  'STEP4'#9'10'#9'STEP 4'
                  'STEP5'#9'10'#9'STEP 5'
                  'STEP6'#9'10'#9'STEP 6'
                  'STEP7'#9'10'#9'STEP 7'
                  'STEP8'#9'10'#9'STEP 8'
                  'STEP9'#9'10'#9'STEP 9'
                  'DATAEFETIV'#9'10'#9'Data Efetiv.')
                DataField = 'IDFAIXACARGO'
                DataSource = dsDet
                LookupTable = CdsFaixa2
                LookupField = 'IDFAIXASALARIAL'
                Options = [loColLines, loTitles]
                Style = csDropDownList
                TabOrder = 1
                AutoDropDown = True
                ShowButton = True
                UseTFields = False
                AllowClearKey = True
                OnChange = dblckFaixa1Change
              end
            end
            object gbxSalario: TGroupBox
              Left = 6
              Top = 112
              Width = 217
              Height = 102
              Enabled = False
              TabOrder = 3
              object Label5: TLabel
                Left = 9
                Top = 11
                Width = 40
                Height = 13
                Caption = 'Salário'
              end
              object Label8: TLabel
                Left = 137
                Top = 11
                Width = 62
                Height = 13
                Caption = 'Percentual'
              end
              object dbedSalario: TDBRealEdit
                Left = 9
                Top = 25
                Width = 121
                Height = 21
                Alignment = taRightJustify
                Lines.Strings = (
                  '0,00')
                TabOrder = 0
                WordWrap = False
                OnChange = dbedSalarioChange
                IntDigits = 10
                DecDigits = 2
                NumberFormat = fFixed
                Signal = False
                DataField = 'SALARIO'
                DataSource = dsDet
              end
              object dbedPerc: TDBRealEdit
                Left = 136
                Top = 25
                Width = 72
                Height = 21
                Alignment = taRightJustify
                Lines.Strings = (
                  '0,00')
                TabOrder = 1
                WordWrap = False
                OnChange = dbedPercChange
                IntDigits = 10
                DecDigits = 2
                NumberFormat = fFixed
                Signal = False
                DataField = 'PERC_REAJ'
                DataSource = dsDet
              end
              object gbxStepsFaixa: TGroupBox
                Left = 27
                Top = 51
                Width = 163
                Height = 44
                Caption = 'Steps da Faixa'
                TabOrder = 2
                Visible = False
                object cmbSteps: TComboBox
                  Left = 8
                  Top = 15
                  Width = 147
                  Height = 21
                  Style = csDropDownList
                  ItemHeight = 13
                  TabOrder = 0
                  OnChange = cmbStepsChange
                end
              end
            end
            object dblcTipoEv: TwwDBLookupCombo
              Left = 6
              Top = 14
              Width = 406
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'50'#9'DESCRICAO')
              DataField = 'IDMOTIVO'
              DataSource = dsDet
              LookupTable = CdsMotivo
              LookupField = 'IDMOTIVO'
              Style = csDropDownList
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              OnChange = dblcTipoEvChange
            end
            object rgAltSalario: TRadioGroup
              Left = 6
              Top = 38
              Width = 217
              Height = 35
              Caption = 'Altera Salário ?'
              Columns = 4
              Enabled = False
              ItemIndex = 0
              Items.Strings = (
                'Não'
                'Valor'
                '%'
                'Faixa')
              TabOrder = 2
              OnClick = rgAltSalarioClick
            end
            object gbxCargo: TGroupBox
              Left = 234
              Top = 38
              Width = 360
              Height = 42
              Caption = 'Cargo'
              TabOrder = 4
              object dblcCargo: TwwDBLookupCombo
                Left = 9
                Top = 14
                Width = 340
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'TITULO'#9'30'#9'TITULO')
                DataField = 'IDCARGO'
                DataSource = dsDet
                LookupTable = CdsCargo
                LookupField = 'IDCARGO'
                Style = csDropDownList
                TabOrder = 0
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
                OnChange = dblcCargoChange
              end
            end
            object gbxLotacao: TGroupBox
              Left = 234
              Top = 122
              Width = 360
              Height = 92
              Caption = 'Lotação'
              TabOrder = 5
              object Label3: TLabel
                Left = 9
                Top = 13
                Width = 94
                Height = 13
                Caption = 'Estabelecimento'
              end
              object Label7: TLabel
                Left = 10
                Top = 50
                Width = 92
                Height = 13
                Caption = 'Centro de Custo'
              end
              object dblcEstab: TwwDBLookupCombo
                Left = 9
                Top = 27
                Width = 340
                Height = 21
                DropDownAlignment = taRightJustify
                Selected.Strings = (
                  'NOME'#9'60'#9'NOME')
                DataField = 'IDESTAB'
                DataSource = dsDet
                LookupTable = CdsEstab
                LookupField = 'IDPESSOA'
                Style = csDropDownList
                TabOrder = 0
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
                OnChange = dblcEstabChange
              end
              object dblcLotac: TwwDBLookupCombo
                Left = 9
                Top = 63
                Width = 100
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'CODCENTROCUSTO'#9'10'#9'Código'
                  'NOME'#9'30'#9'Nome')
                DataField = 'CODCENTROCUSTO'
                DataSource = dsDet
                LookupTable = CdsLotacao
                LookupField = 'CODCENTROCUSTO'
                Options = [loColLines, loTitles]
                Style = csDropDownList
                TabOrder = 1
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
                OnChange = dblcLotacChange
              end
              object dbedNomeCC: TwwDBEdit
                Left = 114
                Top = 63
                Width = 235
                Height = 21
                Color = clGray
                DataField = 'CENTROCUSTO'
                DataSource = dsDet
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                TabOrder = 2
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
              end
              object bbtnEmpresas: TBitBtn
                Left = 165
                Top = 8
                Width = 30
                Height = 20
                Hint = 'Habilita Transferência para Outra Empresa'
                ParentShowHint = False
                ShowHint = True
                TabOrder = 3
                Visible = False
                OnClick = bbtnEmpresasClick
                Glyph.Data = {
                  76010000424D7601000000000000760000002800000020000000100000000100
                  04000000000000010000120B0000120B00001000000000000000000000000000
                  800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                  3333333333333333333333333333333333333333333333333333333333333333
                  3333333333333333333333333333333333333333333FF3333333333333003333
                  3333333333773FF3333333333309003333333333337F773FF333333333099900
                  33333FFFFF7F33773FF30000000999990033777777733333773F099999999999
                  99007FFFFFFF33333F7700000009999900337777777F333F7733333333099900
                  33333333337F3F77333333333309003333333333337F77333333333333003333
                  3333333333773333333333333333333333333333333333333333333333333333
                  3333333333333333333333333333333333333333333333333333}
                NumGlyphs = 2
              end
            end
            object dbedDatEfet: TCMDateTimePicker
              Left = 482
              Top = 14
              Width = 112
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATAALTERFUNC'
              DataSource = dsDet
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
              OnExit = dbedDatEfetExit
            end
            object gbxCargo2: TGroupBox
              Left = 234
              Top = 80
              Width = 360
              Height = 42
              Caption = 'Cargo Alternativo ou Função'
              TabOrder = 6
              object bbtnAtivarCargoAlt: TBitBtn
                Left = 56
                Top = 15
                Width = 249
                Height = 20
                Hint = 'Habilita Transferência para Outra Empresa'
                Caption = 'Ativar Tela para Cargo Alternativo'
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
                OnClick = bbtnAtivarCargoAltClick
                Glyph.Data = {
                  76010000424D7601000000000000760000002800000020000000100000000100
                  04000000000000010000120B0000120B00001000000000000000000000000000
                  800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                  33333FF3333333333333447333333333333377FFF33333333333744473333333
                  333337773FF3333333333444447333333333373F773FF3333333334444447333
                  33333373F3773FF3333333744444447333333337F333773FF333333444444444
                  733333373F3333773FF333334444444444733FFF7FFFFFFF77FF999999999999
                  999977777777777733773333CCCCCCCCCC3333337333333F7733333CCCCCCCCC
                  33333337F3333F773333333CCCCCCC3333333337333F7733333333CCCCCC3333
                  333333733F77333333333CCCCC333333333337FF7733333333333CCC33333333
                  33333777333333333333CC333333333333337733333333333333}
                NumGlyphs = 2
              end
            end
            object dbrgTipoSalar: TDBRadioGroup
              Left = 6
              Top = 77
              Width = 217
              Height = 31
              Caption = 'Base do Salário'
              Columns = 3
              DataField = 'TIPOPAGAMENTO'
              DataSource = dsDet
              Items.Strings = (
                'Hora'
                'Dia'
                'Mês')
              TabOrder = 8
              Values.Strings = (
                'H'
                'D'
                'M')
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 705
        object Toolbar972: TToolbar97
          Left = 123
          Top = 0
          Caption = 'tb97BotoesDetalhe'
          DockPos = 123
          TabOrder = 1
          object sbtnImprimirEtiqueta: TSpeedButton
            Left = 0
            Top = 0
            Width = 96
            Height = 25
            Hint = 'Imprimir Etiqueta referente ao registro atualmente posicionado'
            Caption = ' Etiqueta'
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
            ParentShowHint = False
            ShowHint = True
            OnClick = sbtnImprimirEtiquetaClick
          end
        end
      end
      inherited Dock974: TDock97
        Left = 619
        Height = 247
      end
    end
  end
  inherited Dock972: TDock97
    Width = 721
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
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
    Top = 416
    Width = 721
    inherited tb97Fundo: TToolbar97
      Left = 552
      DockPos = 560
      inherited sep1: TToolbarSep97
        SizeHorz = 2
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 385
      DockPos = 393
    end
  end
  object townEmpresas: TToolWindow97 [3]
    Left = 0
    Top = 432
    Caption = 'Habiliatação de Transferência para Outra Empresa'
    CloseButton = False
    ClientAreaHeight = 135
    ClientAreaWidth = 410
    Resizable = False
    TabOrder = 3
    Visible = False
    object btnOkMudar: TBitBtn
      Left = 195
      Top = 100
      Width = 99
      Height = 30
      Caption = ' &OK'
      Default = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btnOkMudarClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777000007
        777777770022222007777778222222222077778A227722222207778A2FFF7222
        220778A22FFFF722222078A22FFFFF72222078A22FF7FFF7222078A22FF72FFF
        722078A22FF222FF7220778A2222222FF207778A2222222222077778AA222222
        2077777788AAAAA8877777777788888777777777777777777777}
      Spacing = 2
    end
    object btnCancelarMudar: TBitBtn
      Left = 308
      Top = 100
      Width = 99
      Height = 30
      Caption = ' &Cancelar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnCancelarMudarClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777000007
        7777777700919190077777789919191910777789919191919107778918F919F8
        190778919FFF9FFF9190789919FFFFF919107891919FFF919190789919FFFFF9
        191078919FFF9FFF9190778918F919F819077789919191919107777899191919
        1077777788999998877777777788888777777777777777777777}
      Spacing = 2
    end
    object gbxEmpresas: TGroupBox
      Left = 2
      Top = 5
      Width = 405
      Height = 43
      Caption = 'Selecione a Empresa Desejada'
      TabOrder = 2
      object dblcEmpresas: TwwDBLookupCombo
        Left = 6
        Top = 14
        Width = 393
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'60'#9'NOME'#9'F')
        LookupTable = CdsEmpresa
        LookupField = 'IDPESSOA'
        Style = csDropDownList
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        UseTFields = False
        AllowClearKey = True
        ShowMatchText = True
      end
    end
    object gbxTransfer: TGroupBox
      Left = 2
      Top = 52
      Width = 405
      Height = 43
      Caption = 'Transfere Também'
      TabOrder = 3
      object cbxFichaFin: TCheckBox
        Left = 11
        Top = 18
        Width = 161
        Height = 17
        Caption = 'Ficha Financeira'
        TabOrder = 0
      end
      object cbxLancamentos: TCheckBox
        Left = 222
        Top = 18
        Width = 161
        Height = 17
        Caption = 'Lançamentos Pendentes'
        TabOrder = 1
      end
    end
  end
  object townCargoAlternativo: TToolWindow97 [4]
    Left = 302
    Top = 432
    Caption = 'Informações Relativas ao Cargo Alternativo ou Função'
    CloseButton = False
    ClientAreaHeight = 175
    ClientAreaWidth = 410
    Resizable = False
    TabOrder = 4
    Visible = False
    object bbtnFechar: TBitBtn
      Left = 300
      Top = 143
      Width = 99
      Height = 30
      Caption = ' &Fechar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = bbtnFecharClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777000007
        7777777700919190077777789919191910777789919191919107778918F919F8
        190778919FFF9FFF9190789919FFFFF919107891919FFF919190789919FFFFF9
        191078919FFF9FFF9190778918F919F819077789919191919107777899191919
        1077777788999998877777777788888777777777777777777777}
      Spacing = 2
    end
    object gbxCargoAlt: TGroupBox
      Left = 2
      Top = 5
      Width = 405
      Height = 43
      Caption = 'Selecione o Cargo Desejado'
      TabOrder = 1
      object dblcFuncao: TwwDBLookupCombo
        Left = 9
        Top = 14
        Width = 387
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'TITULO'#9'30'#9'TITULO')
        DataField = 'IDFUNCAO'
        DataSource = dsDet
        LookupTable = CdsCargo2
        LookupField = 'IDCARGO'
        Style = csDropDownList
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        OnChange = dblcFuncaoChange
      end
    end
    object gbxFaixa2: TGroupBox
      Left = 95
      Top = 58
      Width = 220
      Height = 76
      Caption = 'Faixa Salarial no Cargo Alternativo'
      TabOrder = 2
      object Label28: TLabel
        Left = 44
        Top = 49
        Width = 81
        Height = 13
        Caption = 'Step Na Faixa'
      end
      object dbspeStep2: TwwDBSpinEdit
        Left = 132
        Top = 46
        Width = 43
        Height = 21
        Increment = 1
        MaxValue = 9
        MinValue = 1
        DataField = 'NIVELINDIV2'
        DataSource = dsDet
        TabOrder = 0
        UnboundDataType = wwDefault
      end
      object dblckFaixa2: TwwDBLookupCombo
        Left = 47
        Top = 19
        Width = 127
        Height = 21
        DropDownAlignment = taRightJustify
        Selected.Strings = (
          'IDFAIXASALARIAL'#9'10'#9'Código'
          'STEP1'#9'10'#9'STEP 1'
          'STEP2'#9'10'#9'STEP 2'
          'STEP3'#9'10'#9'STEP 3'
          'STEP4'#9'10'#9'STEP 4'
          'STEP5'#9'10'#9'STEP 5'
          'STEP6'#9'10'#9'STEP 6'
          'STEP7'#9'10'#9'STEP 7'
          'STEP8'#9'10'#9'STEP 8'
          'STEP9'#9'10'#9'STEP 9'
          'DATAEFETIV'#9'10'#9'Data Efetiv.')
        DataField = 'IDFAIXAFUNCAO'
        DataSource = dsDet
        LookupTable = CdsFaixa2
        LookupField = 'IDFAIXASALARIAL'
        Options = [loColLines, loTitles]
        Style = csDropDownList
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        UseTFields = False
        AllowClearKey = True
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 597
    Top = 14
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 270
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 597
    Top = 1
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyEdit = CmeCadastroApplyEdit
    Left = 664
    Top = 14
  end
  inherited Cds: TCMClientDataSet
    Left = 242
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Empregado'
    Colunas.Strings = (
      'PESSOA.NOME'
      'FUNCIONARIO.MATRICULA'
      'PESSOA.NUMDOCUMENTO'
      'CARGO.TITULO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Nome da Pessoa'
      'Matrícula'
      'CPF (ou equivalente)'
      'Cargo')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'FUNCIONARIO'
      'CARGO')
    CamposChave.Strings = (
      'FUNCIONARIO.IDPESSOA')
    Filtro.Strings = (
      'FUNCIONARIO.IDCARGO   = CARGO.IDCARGO'
      'FUNCIONARIO.IDPESSOA  = PESSOA.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '60'
      '22'
      '22'
      '40')
    Left = 530
    Top = 1
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 664
    Top = 1
  end
  inherited dsDet: TwwDataSource
    DataSet = CdsDet
    OnStateChange = dsDetStateChange
    Left = 341
    Top = 1
  end
  object CdsDet: TCMClientDataSet
    Aggregates = <>
    Params = <>
    BeforePost = CdsDetBeforePost
    Left = 306
    Top = 1
  end
  object CdsMotivo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 655
    Top = 313
  end
  object CdsEstab: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 655
    Top = 299
  end
  object CdsCargo2: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 655
    Top = 285
  end
  object CdsLotacao: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 655
    Top = 272
  end
  object CdsFaixa: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 655
    Top = 259
  end
  object CdsCargo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 655
    Top = 245
  end
  object CdsParamRH: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 418
    Top = 1
  end
  object CdsEmpresa: TCMClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NOME'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'IDPESSOA'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'CdsPessoaFilialPessoaNOME'
        Fields = 'NOME'
      end>
    IndexName = 'CdsPessoaFilialPessoaNOME'
    Params = <>
    StoreDefs = True
    Left = 650
    Top = 361
    Data = {
      720000009619E0BD0100000018000000020002000000030000005100044E4F4D
      450100490000000100055749445448020002003C00084944504553534F410800
      0400000000000100044C43494404000100090800000000055245464552000000
      000000004000000652454645523200000000EABE3741}
  end
  object CdsFaixa2: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 591
    Top = 259
  end
end
