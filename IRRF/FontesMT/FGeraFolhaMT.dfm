inherited frmGeraFolhaMT: TfrmGeraFolhaMT
  Left = 206
  Top = 152
  HelpContext = 240008
  BorderIcons = [biSystemMenu]
  Caption = 'Gera IRRF a partir da Folha de Pagamento / Benefícios'
  ClientHeight = 458
  ClientWidth = 860
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 860
    Height = 419
    object Splitter1: TSplitter
      Left = 1
      Top = 137
      Width = 858
      Height = 3
      Cursor = crVSplit
      Align = alTop
    end
    object memResult: TMemo
      Left = 1
      Top = 140
      Width = 858
      Height = 256
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      ScrollBars = ssBoth
      TabOrder = 0
    end
    object pgcProcessaBusca: TPageControl
      Left = 1
      Top = 1
      Width = 858
      Height = 136
      ActivePage = tbsFolha
      Align = alTop
      TabOrder = 1
      object tbsDataProc: TTabSheet
        Caption = 'Informações Gerais'
        object grpDataProc: TGroupBox
          Left = 3
          Top = 1
          Width = 222
          Height = 81
          Caption = 'Data de Processamento'
          TabOrder = 0
          object lblDataInicial: TLabel
            Left = 10
            Top = 23
            Width = 66
            Height = 13
            Caption = 'Data Inicial'
          end
          object Label1: TLabel
            Left = 10
            Top = 50
            Width = 59
            Height = 13
            Caption = 'Data Final'
          end
          object dedDataFim: TCMDateTimePicker
            Left = 82
            Top = 49
            Width = 121
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
            TabOrder = 1
          end
          object dedDataIni: TCMDateTimePicker
            Left = 82
            Top = 22
            Width = 121
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
            TabOrder = 0
          end
        end
        object grbOutrasInformacoes: TGroupBox
          Left = 230
          Top = 1
          Width = 427
          Height = 81
          Caption = 'Demais Informações'
          TabOrder = 1
          object cbxIndividual: TCheckBox
            Left = 29
            Top = 19
            Width = 172
            Height = 17
            Hint = 'Processar individual por favorecido'
            Caption = 'Geração Lista de Pessoas'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            OnClick = cbxIndividualClick
          end
          object chkGeraPorRubrica: TCheckBox
            Left = 29
            Top = 39
            Width = 204
            Height = 17
            Hint = 'Processar apenas as rubricas selecionadas'
            Caption = 'Geração individual por rubricas'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            OnClick = chkGeraPorRubricaClick
          end
          object ckbCPF: TCheckBox
            Left = 29
            Top = 59
            Width = 172
            Height = 17
            Hint = 'Processar individual por favorecido'
            Caption = 'Geração Lista de CPF´s'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
            OnClick = ckbCPFClick
          end
        end
      end
      object tbsFolha: TTabSheet
        Caption = 'Sistema de Origem'
        ImageIndex = 8
        object grbOpcoesFolhaBenef: TGroupBox
          Left = 166
          Top = 6
          Width = 356
          Height = 57
          Caption = 'Opções de Folha de Benefícios'
          TabOrder = 1
          Visible = False
          object Label5: TLabel
            Left = 8
            Top = 15
            Width = 129
            Height = 13
            Caption = 'Versão de Pagamento:'
            Visible = False
          end
          object dblcNatureza: TwwDBLookupCombo
            Left = 8
            Top = 29
            Width = 338
            Height = 21
            DropDownAlignment = taLeftJustify
            LookupTable = qryVersoes
            LookupField = 'HISTORICO'
            Options = [loTitles]
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
        end
        object GroupBox1: TGroupBox
          Left = 166
          Top = 63
          Width = 357
          Height = 34
          TabOrder = 2
          Visible = False
          object chkBuscaProvDesc: TCheckBox
            Left = 8
            Top = 11
            Width = 342
            Height = 17
            Hint = 
              'Buscar no cadastro de rubricas a linha do informe e código da na' +
              'tureza de rendimento'
            Caption = 'Busca dados do cadastro de rubricas'
            Checked = True
            ParentShowHint = False
            ShowHint = True
            State = cbChecked
            TabOrder = 0
          end
        end
        object grpTipoDirf: TGroupBox
          Left = 528
          Top = 6
          Width = 153
          Height = 91
          Caption = 'Processamento'
          TabOrder = 3
          Visible = False
          object chkDirfNormal: TCheckBox
            Left = 6
            Top = 15
            Width = 140
            Height = 17
            Caption = 'Dirf Normal'
            Checked = True
            State = cbChecked
            TabOrder = 0
          end
          object chkDirfMolestia: TCheckBox
            Left = 6
            Top = 32
            Width = 140
            Height = 17
            Caption = 'Dirf Moléstia'
            Checked = True
            State = cbChecked
            TabOrder = 1
          end
          object chkDirf13Salario: TCheckBox
            Left = 6
            Top = 50
            Width = 140
            Height = 17
            Caption = 'Dirf 13o. Sal'
            Checked = True
            State = cbChecked
            TabOrder = 2
          end
          object chkDirf13SalBenEnc: TCheckBox
            Left = 6
            Top = 67
            Width = 140
            Height = 17
            Caption = 'Dirf 13o.Sal Ben Enc'
            Checked = True
            State = cbChecked
            TabOrder = 3
          end
        end
        object pnlSistemas: TPanel
          Left = 1
          Top = 11
          Width = 160
          Height = 86
          BevelInner = bvRaised
          BevelOuter = bvLowered
          TabOrder = 0
          object rbBuscaFlPagto: TRadioButton
            Left = 10
            Top = 19
            Width = 143
            Height = 17
            Caption = 'Folha de &Pagamento'
            TabOrder = 0
            TabStop = True
            OnClick = rbBuscaFlPagtoClick
          end
          object rbBuscaFlBenef: TRadioButton
            Left = 10
            Top = 55
            Width = 143
            Height = 17
            Caption = 'Folha de &Benefícios'
            TabOrder = 1
            TabStop = True
            Visible = False
            OnClick = rbBuscaFlPagtoClick
          end
        end
      end
      object tbsNatuzaRendimento: TTabSheet
        Caption = 'Natureza de Rendimento'
        ImageIndex = 1
        object gbxNaturezaGlobal: TGroupBox
          Left = 5
          Top = 47
          Width = 396
          Height = 44
          Caption = 'Natureza de Rendimento Específica'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          Visible = False
          object dblcNatRendimento: TwwDBLookupCombo
            Left = 20
            Top = 15
            Width = 358
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'60'#9'Descrição'
              'CODNATUREZA'#9'4'#9'Código')
            LookupTable = cdsNaturRendimento
            LookupField = 'CODNATUREZA'
            Options = [loTitles]
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
            ShowMatchText = True
          end
        end
        object rdgFiltro: TRadioGroup
          Left = 5
          Top = 2
          Width = 396
          Height = 41
          Columns = 2
          ItemIndex = 0
          Items.Strings = (
            'Todas'
            'Específica')
          TabOrder = 0
          OnClick = rdgFiltroClick
        end
      end
      object tbsBuscaIndividual: TTabSheet
        Caption = 'Busca Individual'
        ImageIndex = 3
        TabVisible = False
        object lblCPFPA: TLabel
          Left = 17
          Top = 20
          Width = 24
          Height = 13
          Caption = 'CPF'
        end
        object Label4: TLabel
          Left = 17
          Top = 47
          Width = 64
          Height = 13
          Caption = 'Favorecido'
        end
        object sbtnAddFav: TSpeedButton
          Left = 414
          Top = 43
          Width = 23
          Height = 22
          Hint = 'Escolher o favorecido que será processado'
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            33333333333333333333333333333333333333333333333333FF333333333333
            3000333333FFFFF3F77733333000003000B033333777773777F733330BFBFB00
            E00033337FFF3377F7773333000FBFB0E000333377733337F7773330FBFBFBF0
            E00033F7FFFF3337F7773000000FBFB0E000377777733337F7770BFBFBFBFBF0
            E00073FFFFFFFF37F777300000000FB0E000377777777337F7773333330BFB00
            000033333373FF77777733333330003333333333333777333333333333333333
            3333333333333333333333333333333333333333333333333333333333333333
            3333333333333333333333333333333333333333333333333333}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          OnClick = sbtnAddFavClick
        end
        object sbtnRemFav: TSpeedButton
          Left = 442
          Top = 43
          Width = 23
          Height = 22
          Hint = 'Apagar o favorecido selecionado'
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
            55555FFFFFFF5F55FFF5777777757559995777777775755777F7555555555550
            305555555555FF57F7F555555550055BB0555555555775F777F55555550FB000
            005555555575577777F5555550FB0BF0F05555555755755757F555550FBFBF0F
            B05555557F55557557F555550BFBF0FB005555557F55575577F555500FBFBFB0
            B05555577F555557F7F5550E0BFBFB00B055557575F55577F7F550EEE0BFB0B0
            B05557FF575F5757F7F5000EEE0BFBF0B055777FF575FFF7F7F50000EEE00000
            B0557777FF577777F7F500000E055550805577777F7555575755500000555555
            05555777775555557F5555000555555505555577755555557555}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          OnClick = sbtnRemFavClick
        end
        object Label3: TLabel
          Left = 17
          Top = 76
          Width = 48
          Height = 13
          Caption = 'Pessoas'
        end
        object edCPFFavPA: TEdit
          Left = 92
          Top = 16
          Width = 153
          Height = 21
          TabOrder = 0
        end
        object edNomeFavPA: TEdit
          Left = 92
          Top = 43
          Width = 311
          Height = 21
          TabOrder = 1
        end
        object edtListaPessoa: TEdit
          Left = 92
          Top = 72
          Width = 311
          Height = 21
          TabOrder = 2
          OnChange = edtListaPessoaChange
        end
      end
      object tbsGeraRubrica: TTabSheet
        Caption = 'Processar por Rubricas'
        ImageIndex = 5
        TabVisible = False
        object grbListaRubricas: TGroupBox
          Left = 0
          Top = 2
          Width = 577
          Height = 39
          TabOrder = 0
          object Label2: TLabel
            Left = 8
            Top = 15
            Width = 51
            Height = 13
            Hint = 'Código interno da rubrica, separado por vírgula'
            Caption = 'Rubricas'
            ParentShowHint = False
            ShowHint = True
          end
          object edtCodRub: TEdit
            Left = 64
            Top = 11
            Width = 497
            Height = 21
            Hint = 'Código interno da rubrica, separado por vírgula'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
          end
        end
      end
      object tbsRevisao: TTabSheet
        Caption = 'Acerto de Revisão de Benefícios'
        ImageIndex = 5
        TabVisible = False
        object Label6: TLabel
          Left = 9
          Top = 0
          Width = 415
          Height = 13
          Caption = 
            'Lista de Pessoas que tiveram acerto de abono na Revisão de Benef' +
            'ícios'
        end
        object lstRevisao: TListBox
          Left = 8
          Top = 15
          Width = 585
          Height = 89
          Columns = 10
          ItemHeight = 13
          TabOrder = 0
        end
        object BtnImportar: TBitBtn
          Left = 766
          Top = 14
          Width = 82
          Height = 89
          Anchors = [akTop, akRight]
          Caption = 'Importar'
          TabOrder = 1
          OnClick = BtnImportarClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
            55555555FFFFFFFF5555555000000005555555577777777FF555550999999900
            55555575555555775F55509999999901055557F55555557F75F5001111111101
            105577FFFFFFFF7FF75F00000000000011057777777777775F755070FFFFFF0F
            01105777F555557F75F75500FFFFFF0FF0105577F555FF7F57575550FF700008
            8F0055575FF7777555775555000888888F005555777FFFFFFF77555550000000
            0F055555577777777F7F555550FFFFFF0F05555557F5FFF57F7F555550F000FF
            0005555557F777557775555550FFFFFF0555555557F555FF7F55555550FF7000
            05555555575FF777755555555500055555555555557775555555}
          NumGlyphs = 2
        end
      end
      object tbsListaPessoa: TTabSheet
        Caption = 'Lista de Pessoas'
        ImageIndex = 6
        TabVisible = False
        inline frmFrameListaBenef1: TfrmFrameListaBenef
          Width = 850
          Height = 108
          Align = alClient
          inherited Panel3: TPanel
            Width = 850
            inherited Dock971: TDock97
              Width = 848
              inherited TB97oKCancelar: TToolbar97
                inherited lblQuant: TLabel
                  Width = 5
                end
                inherited bbtnIncluiBenef: TBitBtn
                  OnClick = frmFrameListaBenef1bbtnIncluiBenefClick
                end
              end
            end
          end
          inherited dbgrdPessoas: TwwDBGrid
            Width = 850
            Height = 74
          end
          inherited qryLista: TwwQuery
            SQL.Strings = (
              'SELECT'
              ' L.IDTITULAR,'
              '       L.IDPESSOA,'
              '       A.MATRICULA,'
              '       B.MATRICULA AS MATRICULADEP,'
              '       C.NOME AS NOMEDEP,'
              '       D.INSCRICAONUMERO,'
              '       TIT.NOME AS NOMETITULAR,'
              '       c.numdocumento'
              '  FROM LISTAFOLHABENEFDET L,'
              '       ELEGPATRO          A,'
              '       DEPENTIT           B,'
              '       PARTPREVPLAN       D,'
              '       PESSOA             C,'
              '       PESSOA             TIT'
              ' WHERE L.IDLISTA = :IDLISTA'
              '   AND L.IDTITULAR = A.IDPESSOA'
              '   AND L.IDTITULAR = B.IDTITULAR'
              '   AND L.IDPESSOA = B.IDPESSOA'
              '   AND B.IDPESSOA = C.IDPESSOA'
              '   AND L.IDTITULAR = D.IDPESSOA'
              '   AND TIT.IDPESSOA = A.IDPESSOA'
              '   --AND D.FLGDESATIVADO = 0'
              '   AND (D.FLGDESATIVADO = 0 OR'
              '       (D.FLGDESATIVADO = 1 AND NOT EXISTS'
              '        (SELECT 1'
              '            FROM PARTPREVPLAN PPP1'
              '           WHERE PPP1.IDPESSOA = D.IDPESSOA'
              '             AND PPP1.FLGDESATIVADO = 0) AND'
              '        (D.IDSITPLANOPREV = 25 OR'
              '        (D.IDPLANOPREV ='
              '        (SELECT MAX(PPP1.IDPLANOPREV)'
              '              FROM PARTPREVPLAN PPP1'
              '             WHERE PPP1.IDPESSOA = D.IDPESSOA'
              '      AND NVL(PPP1.DATACANCELAMENTO, TRIM(SYSDATE)) ='
              '       (SELECT NVL(MAX(PPP2.DATACANCELAMENTO), TRIM(SYSDATE))'
              '                      FROM PARTPREVPLAN PPP2'
              '                     WHERE PPP2.IDPESSOA = PPP1.IDPESSOA)'
              '               AND NOT EXISTS (SELECT 1'
              '                      FROM PARTPREVPLAN PPP2'
              '                     WHERE PPP2.IDPESSOA = PPP1.IDPESSOA'
              '                       AND PPP2.IDSITPLANOPREV = 25))))))'
              ' ORDER BY B.MATRICULA')
            Top = 58
          end
          inherited dsLista: TwwDataSource
            Top = 58
          end
          inherited qryIListlista: TwwQuery
            Top = 64
          end
        end
      end
      object tsDecimoTerceiro: TTabSheet
        BorderWidth = 5
        Caption = 'Décimo Terceiro'
        ImageIndex = 7
        TabVisible = False
        object grpDecimoTerceiro: TGroupBox
          Left = 0
          Top = 33
          Width = 840
          Height = 65
          Align = alClient
          Caption = 'Décimo Terceiro'
          Enabled = False
          TabOrder = 0
          object lblInicio: TLabel
            Left = 16
            Top = 24
            Width = 83
            Height = 13
            Caption = 'Início do CPF:'
            Enabled = False
          end
          object lblTermino: TLabel
            Left = 200
            Top = 24
            Width = 95
            Height = 13
            Caption = 'Término do CPF:'
            Enabled = False
          end
          object udInicio: TUpDown
            Left = 129
            Top = 19
            Width = 16
            Height = 21
            Associate = edtInicio
            Enabled = False
            Min = 0
            Max = 9
            Position = 0
            TabOrder = 0
            Wrap = False
          end
          object edtInicio: TEditNum
            Left = 104
            Top = 19
            Width = 25
            Height = 21
            Enabled = False
            MaxLength = 1
            TabOrder = 1
            Text = '0'
            IntDigits = 0
            Signal = False
            DecDigits = 0
            Numeric = False
          end
          object edtTermino: TEditNum
            Left = 296
            Top = 19
            Width = 25
            Height = 21
            Enabled = False
            MaxLength = 1
            TabOrder = 2
            Text = '0'
            IntDigits = 0
            Signal = False
            DecDigits = 0
            Numeric = False
          end
          object udTermino: TUpDown
            Left = 321
            Top = 19
            Width = 16
            Height = 21
            Associate = edtTermino
            Enabled = False
            Min = 0
            Max = 9
            Position = 0
            TabOrder = 3
            Wrap = False
          end
        end
        object pnlDecimoterceiro: TPanel
          Left = 0
          Top = 0
          Width = 840
          Height = 33
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          object chkQuebrarPorCPF: TCheckBox
            Left = 8
            Top = 8
            Width = 265
            Height = 17
            Caption = 'Usar Quebra por CPF no Décimo Terceiro'
            TabOrder = 0
            OnClick = chkQuebrarPorCPFClick
          end
          object chkUsarAnoTodo: TCheckBox
            Left = 320
            Top = 8
            Width = 329
            Height = 17
            Caption = 'Usar Ano todo na Seleção de Datas'
            TabOrder = 1
          end
        end
      end
      object tbsCPFS: TTabSheet
        Caption = 'Lista de Cpfs'
        ImageIndex = 8
        TabVisible = False
        object gbCpfs: TGroupBox
          Left = 8
          Top = 2
          Width = 832
          Height = 99
          Anchors = [akLeft, akTop, akRight, akBottom]
          Caption = ' Lista de CPF´s '
          TabOrder = 0
          object lbCpfs: TListBox
            Left = 8
            Top = 16
            Width = 736
            Height = 73
            Anchors = [akLeft, akTop, akRight, akBottom]
            Columns = 4
            ItemHeight = 13
            TabOrder = 0
          end
          object BitBtn1: TBitBtn
            Left = 751
            Top = 16
            Width = 73
            Height = 33
            Anchors = [akTop, akRight]
            Cancel = True
            Caption = 'Carregar'
            TabOrder = 1
            OnClick = BitBtn1Click
            NumGlyphs = 3
            Spacing = 2
          end
        end
      end
    end
    object pnl_tempo: TPanel
      Left = 1
      Top = 396
      Width = 858
      Height = 22
      Align = alBottom
      TabOrder = 2
      object lbl_inicio: TLabel
        Left = 224
        Top = 2
        Width = 153
        Height = 18
        AutoSize = False
        Caption = 'Início:'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Layout = tlCenter
      end
      object lbl_final: TLabel
        Left = 379
        Top = 2
        Width = 161
        Height = 18
        AutoSize = False
        Caption = 'Término:'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Layout = tlCenter
      end
      object lbl_decorrido: TLabel
        Left = 544
        Top = 2
        Width = 145
        Height = 18
        AutoSize = False
        Caption = 'Tempo Decorrido:'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Layout = tlCenter
      end
      object lblContagem: TLabel
        Left = 8
        Top = 2
        Width = 217
        Height = 18
        AutoSize = False
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Layout = tlCenter
      end
    end
  end
  inherited Dock971: TDock97
    Top = 419
    Width = 860
    inherited tb97Fundo: TToolbar97
      Left = 421
      inherited sep1: TToolbarSep97
        Left = 281
      end
      inherited bbtnSair: TBitBtn
        Left = 200
        TabOrder = 1
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 283
        HelpContext = 240008
        TabOrder = 2
      end
      object bbtnConfirmaGeracao: TBitBtn
        Left = 0
        Top = 0
        Width = 200
        Height = 33
        Cancel = True
        Caption = '&Confirma Geração'
        TabOrder = 0
        OnClick = bbtnConfirmaGeracaoClick
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
        Spacing = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 51
    Top = 165
    TargetsData = (
      1
      2
      (
        'TMemo'
        'Text'
        0)
      (
        'TRichEdit'
        'Text'
        0))
  end
  object cdsNaturRendimento: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 290
    Top = 253
  end
  object cdsParamIRRF: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 314
    Top = 213
  end
  object cdsParamFolha: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 178
    Top = 253
  end
  object MontaSelectBenef: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'PESSOA.NUMDOCUMENTO'
      'PESSOA.NOME'
      'DEPENTIT.MATRICULA')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'CPF'
      'Nome'
      'Matrícula')
    SensivelACaixa.Strings = (
      'S'
      'N'
      'S')
    Tabelas.Strings = (
      'PESSOA'
      'HISTRUBSAL'
      'DEPENTIT')
    CamposChave.Strings = (
      'PESSOA.IDPESSOA'
      'PESSOA.NOME'
      'PESSOA.NUMDOCUMENTO'
      'DEPENTIT.MATRICULA')
    Filtro.Strings = (
      'HISTRUBSAL.IDMODULO = 18'
      '((HISTRUBSAL.FLGESTORNO = 0) OR (HISTRUBSAL.FLGESTORNO IS NULL))'
      'HISTRUBSAL.IDPESSOA = PESSOA.IDPESSOA'
      'DEPENTIT.IDPESSOA = P.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '18'
      '60'
      '15')
    OperComparador.Strings = (
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
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      '')
    Left = 64
    Top = 229
  end
  object qryVersoes: TQuery
    DatabaseName = 'BaseDados'
    DataSource = dsVersoes
    SQL.Strings = (
      'SELECT'
      #9'IDHSTFOLHABENEF||'#39'-'#39'||HISTORICO AS HISTORICO,'
      #9'IDHSTFOLHABENEF,'
      #9'DATAPREVPAGTO'
      'FROM'
      #9'HSTFOLHABENEF'
      'WHERE'
      #9'DATAPREVPAGTO IS NOT NULL'
      'ORDER BY IDHSTFOLHABENEF DESC')
    Left = 139
    Top = 205
  end
  object dsVersoes: TDataSource
    Left = 207
    Top = 213
  end
  object OpenDialog1: TOpenDialog
    Left = 405
    Top = 193
  end
end
