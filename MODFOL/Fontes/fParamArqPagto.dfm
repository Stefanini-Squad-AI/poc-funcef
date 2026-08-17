inherited frmParamArqPagto: TfrmParamArqPagto
  Left = 225
  Top = 100
  HelpContext = 210090
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsToolWindow
  Caption = 'Geração do Arquivo para Pagamento Eletrônico'
  ClientHeight = 409
  ClientWidth = 484
  Font.Style = []
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 484
    Height = 370
    BorderWidth = 2
    object pnlResult: TPanel
      Left = 4
      Top = 4
      Width = 476
      Height = 362
      Align = alClient
      BevelOuter = bvNone
      Caption = 'pnlResult'
      TabOrder = 1
      object memResult: TMemo
        Left = 0
        Top = 0
        Width = 391
        Height = 362
        Align = alLeft
        Color = clBlack
        Font.Charset = ANSI_CHARSET
        Font.Color = clLime
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Lines.Strings = (
          'memResult')
        ParentFont = False
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 0
      end
      object bbtnVoltar: TBitBtn
        Left = 395
        Top = 162
        Width = 78
        Height = 33
        Caption = '&Voltar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = bbtnVoltarClick
        Glyph.Data = {
          E6000000424DE60000000000000076000000280000000E0000000E0000000100
          0400000000007000000000000000000000001000000010000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
          DD00DDDDD4444DDDDD00DDD44444444DDD00DD444DDDD444DD00DD44DDDDDD44
          DD00D44DDDDDDDD44D00D44DDDDDDDD44D00D44DDDDDDDD44D00D44DDDDDDDD4
          4D00DD44DDDD4D44DD00DD44DDDD4444DD00DDDDDDDD444DDD00DDDDDDDD4444
          DD00DDDDDDDDDDDDDD00}
      end
    end
    object pnlSelecao: TPanel
      Left = 4
      Top = 4
      Width = 476
      Height = 362
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      object Bevel1: TBevel
        Left = 45
        Top = 336
        Width = 425
        Height = 21
      end
      object lblDiretorio: TLabel
        Left = 49
        Top = 339
        Width = 415
        Height = 13
        AutoSize = False
        Caption = 'C:\'
        WordWrap = True
      end
      object gbxAnoMesRef: TGroupBox
        Left = 6
        Top = 77
        Width = 213
        Height = 43
        Caption = 'Mês e Ano de Referência'
        TabOrder = 0
        object cmbMes: TComboBox
          Left = 9
          Top = 14
          Width = 112
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 0
          Items.Strings = (
            'Janeiro'
            'Fevereiro'
            'Março'
            'Abril'
            'Maio'
            'Junho'
            'Julho'
            'Agosto'
            'Setembro'
            'Outubro'
            'Novembro'
            'Dezembro')
        end
        object speAno: TSpinEdit
          Left = 130
          Top = 14
          Width = 75
          Height = 22
          MaxValue = 0
          MinValue = 0
          TabOrder = 1
          Value = 0
          OnChange = dblkcbMotivoChange
        end
      end
      object gbxDataCredito: TGroupBox
        Left = 225
        Top = 77
        Width = 118
        Height = 43
        Caption = 'Data de Crédito'
        TabOrder = 1
        object dtedDtCredito: TCMDateTimePicker
          Left = 9
          Top = 14
          Width = 100
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
          OnChange = dblkcbMotivoChange
        end
      end
      object rgProcesso: TRadioGroup
        Left = 349
        Top = 77
        Width = 121
        Height = 43
        Caption = 'Processo'
        Columns = 2
        ItemIndex = 1
        Items.Strings = (
          'Prévia'
          'Final')
        TabOrder = 2
        TabStop = True
      end
      object gbxEstab: TGroupBox
        Left = 6
        Top = 122
        Width = 464
        Height = 44
        Caption = 'Estabelecimento'
        TabOrder = 3
        object dblkcbEstab: TwwDBLookupCombo
          Left = 9
          Top = 14
          Width = 446
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'60'#9'Estabelecimento')
          LookupTable = qryEstab
          LookupField = 'CODIGO'
          Style = csDropDownList
          TabOrder = 0
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = False
          OnChange = dblkcbEstabChange
        end
      end
      object gbxFunc: TGroupBox
        Left = 6
        Top = 168
        Width = 464
        Height = 164
        Caption = 'Empregados'
        TabOrder = 4
        object Paginas: TPageControl
          Left = 6
          Top = 15
          Width = 451
          Height = 142
          ActivePage = tbshListaFunc
          HotTrack = True
          TabOrder = 0
          object tbshListaFunc: TTabSheet
            Caption = '&Lista'
            object chklstFunc: TCheckListBox
              Left = 2
              Top = 1
              Width = 299
              Height = 111
              OnClickCheck = chklstFuncClickCheck
              ItemHeight = 13
              Style = lbOwnerDrawFixed
              TabOrder = 0
              OnDrawItem = chklstFuncDrawItem
              OnKeyDown = chklstFuncKeyDown
            end
            object bbtnSelTodosFunc: TBitBtn
              Left = 306
              Top = 2
              Width = 131
              Height = 25
              Caption = '   Seleciona Todos'
              TabOrder = 1
              TabStop = False
              OnClick = bbtnSelTodosFuncClick
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                80000080000000808000800000008000800080800000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                3333333333333333333333333333333333333333333333333333333333300000
                0003333333388888888333333330FF9FFF0333333338FF7FFF8333333000F999
                FF0333333888F777FF83333330F099F99F03333338F877F77F83333000F09FFF
                9903333888F87FFF77833330F090FFFFF9933338F878FFFFF7733000F0900000
                00993888F8788888887730F090FFFFF9933338F878FFFFF7733330F090000000
                993338F87888888877333090FFFFF99333333878FFFFF7733333309000000099
                3333387888888877333330FFFFF99333333338FFFFF773333333300000009933
                3333388888887733333333333333333333333333333333333333}
              NumGlyphs = 2
              Spacing = 0
            end
            object bbtnInverteSelFunc: TBitBtn
              Left = 306
              Top = 29
              Width = 131
              Height = 25
              Caption = '   Inverte Seleção'
              TabOrder = 2
              TabStop = False
              OnClick = bbtnInverteSelFuncClick
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                80000080000000808000800000008000800080800000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                3333333333333333333333333333000000003333333388888888333333330FFF
                FFF0333333338FFFFFF8333000330FFFFFF0333788338FFFFFF8333033330FFF
                FFF0333833338FFFFFF8330003330FFFFFF0337783338FFFFFF8333033330FFF
                FFF0333833338FFFFFF833333333000000003333333388888888000000003333
                333388888888333333330FF9FFF0333303338FF7FFF8333383330F999FF03330
                00338F777FF833387733099F99F033330333877F77F83333833309FFF9903300
                033387FFF778338873330FFFFF99333333338FFFFF7733333333000000099333
                3333888888877333333333333333333333333333333333333333}
              NumGlyphs = 2
              Spacing = 0
            end
          end
          object tbshFiltroFunc: TTabSheet
            Caption = '&Tipos / Situações'
            object gbxTipContra: TGroupBox
              Left = 28
              Top = 9
              Width = 245
              Height = 91
              Hint = '"Tique" Uma ou Mais Alternativas'
              Caption = 'Tipo de Contrato'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              OnEnter = gbxTipContraEnter
              OnExit = gbxTipContraExit
              object cbxEfetivos: TCheckBox
                Left = 9
                Top = 16
                Width = 64
                Height = 13
                Caption = 'Efetivos'
                Checked = True
                ParentShowHint = False
                ShowHint = True
                State = cbChecked
                TabOrder = 0
              end
              object cbxEspeciais: TCheckBox
                Left = 9
                Top = 34
                Width = 90
                Height = 13
                Caption = 'Efet. Especiais'
                Checked = True
                ParentShowHint = False
                ShowHint = True
                State = cbChecked
                TabOrder = 1
              end
              object cbxTemporarios: TCheckBox
                Left = 9
                Top = 51
                Width = 85
                Height = 13
                Caption = 'Temporários'
                ParentShowHint = False
                ShowHint = True
                TabOrder = 2
              end
              object cbxEstagiarios: TCheckBox
                Left = 9
                Top = 68
                Width = 74
                Height = 13
                Caption = 'Estagiários'
                ParentShowHint = False
                ShowHint = True
                TabOrder = 3
              end
              object cbxTerceiros: TCheckBox
                Left = 137
                Top = 16
                Width = 66
                Height = 13
                Caption = 'Terceiros'
                ParentShowHint = False
                ShowHint = True
                TabOrder = 4
              end
              object cbxProprietarios: TCheckBox
                Left = 137
                Top = 34
                Width = 97
                Height = 13
                Caption = 'Prop/Dir s/ Vinc'
                ParentShowHint = False
                ShowHint = True
                TabOrder = 5
              end
              object cbxAutonomos: TCheckBox
                Left = 137
                Top = 51
                Width = 75
                Height = 13
                Caption = 'Autônomos'
                ParentShowHint = False
                ShowHint = True
                TabOrder = 6
              end
            end
            object gbxSituacao: TGroupBox
              Left = 300
              Top = 9
              Width = 111
              Height = 74
              Hint = '"Tique" Uma ou Mais Alternativas'
              Caption = 'Situação Funcional'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              OnEnter = gbxSituacaoEnter
              OnExit = gbxSituacaoExit
              object cbxAtivos: TCheckBox
                Left = 9
                Top = 17
                Width = 52
                Height = 13
                Caption = 'Ativos'
                Checked = True
                ParentShowHint = False
                ShowHint = True
                State = cbChecked
                TabOrder = 0
              end
              object cbxAfastados: TCheckBox
                Left = 9
                Top = 36
                Width = 69
                Height = 13
                Caption = 'Afastados'
                Checked = True
                ParentShowHint = False
                ShowHint = True
                State = cbChecked
                TabOrder = 1
              end
              object cbxDemitidos: TCheckBox
                Left = 9
                Top = 54
                Width = 91
                Height = 13
                Caption = 'Demitidos'
                TabOrder = 2
              end
            end
          end
        end
      end
      object btnSelDir: TBitBtn
        Left = 7
        Top = 336
        Width = 35
        Height = 22
        Hint = 'Seleciona o Diretório'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
        OnClick = btnSelDirClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00303333333333
          333337F3333333333333303333333333333337F33FFFFF3FF3FF303300000300
          300337FF77777F77377330000BBB0333333337777F337F33333330330BB00333
          333337F373F773333333303330033333333337F3377333333333303333333333
          333337F33FFFFF3FF3FF303300000300300337FF77777F77377330000BBB0333
          333337777F337F33333330330BB00333333337F373F773333333303330033333
          333337F3377333333333303333333333333337FFFF3FF3FFF333000003003000
          333377777F77377733330BBB0333333333337F337F33333333330BB003333333
          333373F773333333333330033333333333333773333333333333}
        NumGlyphs = 2
      end
      object gbxTipPag: TGroupBox
        Left = 6
        Top = 1
        Width = 464
        Height = 74
        Caption = 'Tipo(s) de Pagamento'
        TabOrder = 6
        object chklstTipoFolha: TCheckListBox
          Left = 9
          Top = 14
          Width = 310
          Height = 52
          OnClickCheck = chklstTipoFolhaClickCheck
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 13
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          Style = lbOwnerDrawFixed
          TabOrder = 0
          OnDrawItem = chklstFuncDrawItem
          OnKeyDown = chklstTipoFolhaKeyDown
        end
        object bbtnSelTodosTipoFolha: TBitBtn
          Left = 325
          Top = 14
          Width = 131
          Height = 25
          Caption = '   Seleciona Todos'
          TabOrder = 1
          TabStop = False
          OnClick = bbtnSelTodosTipoFolhaClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            3333333333333333333333333333333333333333333333333333333333300000
            0003333333388888888333333330FF9FFF0333333338FF7FFF8333333000F999
            FF0333333888F777FF83333330F099F99F03333338F877F77F83333000F09FFF
            9903333888F87FFF77833330F090FFFFF9933338F878FFFFF7733000F0900000
            00993888F8788888887730F090FFFFF9933338F878FFFFF7733330F090000000
            993338F87888888877333090FFFFF99333333878FFFFF7733333309000000099
            3333387888888877333330FFFFF99333333338FFFFF773333333300000009933
            3333388888887733333333333333333333333333333333333333}
          NumGlyphs = 2
          Spacing = 0
        end
        object bbtnInvSelTipoFolha: TBitBtn
          Left = 325
          Top = 41
          Width = 131
          Height = 25
          Caption = '   Inverte Seleção'
          TabOrder = 2
          TabStop = False
          OnClick = bbtnInvSelTipoFolhaClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            3333333333333333333333333333000000003333333388888888333333330FFF
            FFF0333333338FFFFFF8333000330FFFFFF0333788338FFFFFF8333033330FFF
            FFF0333833338FFFFFF8330003330FFFFFF0337783338FFFFFF8333033330FFF
            FFF0333833338FFFFFF833333333000000003333333388888888000000003333
            333388888888333333330FF9FFF0333303338FF7FFF8333383330F999FF03330
            00338F777FF833387733099F99F033330333877F77F83333833309FFF9903300
            033387FFF778338873330FFFFF99333333338FFFFF7733333333000000099333
            3333888888877333333333333333333333333333333333333333}
          NumGlyphs = 2
          Spacing = 0
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 370
    Width = 484
    inherited tb97Fundo: TToolbar97
      Left = 189
      DockPos = 197
      inherited sep1: TToolbarSep97
        Left = 209
      end
      object ToolbarSep972: TToolbarSep97 [1]
        Left = 109
        Top = 0
        Blank = True
        SizeHorz = 20
      end
      inherited bbtnSair: TBitBtn
        Left = 129
        TabOrder = 1
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 211
        TabOrder = 2
      end
      object rbtnGerar: TBitBtn
        Left = 0
        Top = 0
        Width = 109
        Height = 33
        Cancel = True
        Caption = ' &Gerar Arquivo'
        Default = True
        TabOrder = 0
        OnClick = rbtnGerarClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333330070
          7700333333337777777733333333008088003333333377F73377333333330088
          88003333333377FFFF7733333333000000003FFFFFFF77777777000000000000
          000077777777777777770FFFFFFF0FFFFFF07F3333337F3333370FFFFFFF0FFF
          FFF07F3FF3FF7FFFFFF70F00F0080CCC9CC07F773773777777770FFFFFFFF039
          99337F3FFFF3F7F777F30F0000F0F09999937F7777373777777F0FFFFFFFF999
          99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
          99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
          93337FFFF7737777733300000033333333337777773333333333}
        NumGlyphs = 2
        Spacing = 0
      end
    end
  end
  object pnlDiretorio: TPanel [2]
    Left = -24
    Top = 379
    Width = 230
    Height = 256
    TabOrder = 2
    Visible = False
    OnExit = pnlDiretorioExit
    object Bevel2: TBevel
      Left = 3
      Top = 3
      Width = 224
      Height = 211
      Style = bsRaised
    end
    object fcLabel2: TfcLabel
      Left = 4
      Top = 5
      Width = 223
      Height = 16
      AutoSize = False
      Caption = 'Selecione o Diretório'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TextOptions.Alignment = taCenter
      TextOptions.LineSpacing = 1
      TextOptions.Shadow.Enabled = True
      TextOptions.Shadow.XOffset = 2
      TextOptions.Shadow.YOffset = 2
      TextOptions.VAlignment = vaTop
      Transparent = True
    end
    object Bevel3: TBevel
      Left = 3
      Top = 210
      Width = 224
      Height = 43
      Style = bsRaised
    end
    object DriveComboBox1: TDriveComboBox
      Left = 10
      Top = 23
      Width = 210
      Height = 19
      DirList = DirectoryListBox1
      TabOrder = 0
    end
    object DirectoryListBox1: TDirectoryListBox
      Left = 10
      Top = 47
      Width = 210
      Height = 160
      ItemHeight = 16
      TabOrder = 1
      OnKeyPress = DirectoryListBox1KeyPress
    end
    object btnOkDir: TBitBtn
      Left = 7
      Top = 217
      Width = 103
      Height = 33
      Caption = '&OK'
      Default = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = btnOkDirClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888FFFFF8888888888000008888888888F777778FF888888002222200
        88888887788888778F88887222222222088888788888888878F887A228822222
        208887F88FFF888887F887A2FFF8222220888788777FF888878F7A22FFFF8222
        22087F887777FF88887F7A22FFFFF82222087F8877777FF8887F7A22FF8FFF82
        22087F8877F777FF887F7A22FF82FFF822087F8877F8777F887F7A22FF222FF8
        220878F87788877FF87887A2222222FF208887F88888887787F887A222222222
        2088878F888888888788887AA222222208888878FF88888F788888877AAAAA77
        8888888778FFFF77888888888777778888888888877777888888}
      NumGlyphs = 2
      Spacing = 2
    end
    object btnSairDiretorio: TBitBtn
      Left = 120
      Top = 217
      Width = 103
      Height = 33
      Caption = '&Cancelar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = btnSairDiretorioClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888FFFFF8888888888000008888888888F777778FF888888009191900
        88888887788888778F88887991919191088888788888888878F8879919191919
        108887F888F888F887F887917F919F719088878887FF87FF878F7919FFF9FFF9
        19087F88777F7778887F79919FFFFF9191087F8887777788887F791919FFF919
        19087F8888777FF8887F79919FFFFF9191087F88877777FF887F7919FFF9FFF9
        190878F877787778887887917F919F71908887F88788878887F8879919191919
        1088878F88888888878888799191919108888878FF88888F7888888779999977
        8888888778FFFF77888888888777778888888888877777888888}
      NumGlyphs = 2
      Spacing = 2
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 160
    Top = 265
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qryMotivo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDMOTIVO, DESCRICAO '
      'FROM'
      '  MOTIVO '
      'WHERE'
      '  (GRUPOMOTIVO = '#39'F'#39')'
      'ORDER BY'
      '  UPPER(DESCRICAO)')
    ValidateWithMask = True
    Left = 142
    Top = 21
  end
  object qryFunc: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 186
    Top = 21
  end
  object qryEstab: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  PJ.IDPESSOA AS CODIGO, PJ.NOME'
      'FROM'
      '  PESSOA PJ, FILIALPESSOA FP'
      'WHERE'
      ''
      '  (PJ.IDGRUPO        = :EMPRESA) AND'
      '  (FP.IDFILIALPESSOA = PJ.IDPESSOA)')
    ValidateWithMask = True
    Left = 97
    Top = 21
    ParamData = <
      item
        DataType = ftInteger
        Name = 'EMPRESA'
        ParamType = ptUnknown
      end>
  end
  object qryParamRH: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  NORMALINI, NORMALFIM'
      'FROM'
      '  PARAMRH')
    ValidateWithMask = True
    Left = 44
    Top = 21
  end
  object qryFerias: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  INIGOZOFERIAS'
      'FROM'
      '  FERIAS')
    ValidateWithMask = True
    Left = 228
    Top = 21
  end
  object qryArqPagto: TwwQuery
    DatabaseName = 'BaseDados'
    Filtered = True
    SQL.Strings = (
      'SELECT DISTINCT'
      '  (PJ.RAZAOSOCIAL) AS EMPRESA,'
      '  (AG.NUMAGENCIA)  AS CODAGENCIA,'
      '  (PA.NOME)        AS NOMEAGENCIA,'
      '  B.NUMBANCO,'
      '  PF.NOME,'
      
        '  (DECODE(RUBRICA.VALOR,NULL,(PROVENTOS.VALOR-DESCONTOS.VALOR),R' +
        'UBRICA.VALOR)) AS LIQUIDO'
      'FROM'
      
        '  PESSOA PJ, PESSOA PF, FUNCIONARIO FUNC, PESSOA PA, AGENCIABANC' +
        'ARIA AG, EMPRESAPROP EP,'
      '  BANCO B, HISTRUBSAL H,'
      
        '  (SELECT H.IDPESSOA, P.FLGDESCONTO, SUM(H.VALORPROVENTO) AS VAL' +
        'OR, MO.DESCRICAO, H.MES'
      '   FROM  HISTRUBSAL H, PROVDESC P, MOTIVO MO'
      '   WHERE (H.IDRUBRICA   = P.IDPROVENTO) AND'
      '         (MO.IDMOTIVO   = H.IDMOTIVO)   AND'
      '         (H.IDMOTIVO    = 2)AND'
      '         (H.MES         = '#39'2000/04'#39')  AND'
      '         (P.FLGDESCONTO = 0)'
      
        '   GROUP BY H.IDPESSOA,P.FLGDESCONTO,MO.DESCRICAO,H.MES) PROVENT' +
        'OS,'
      
        '  (SELECT H.IDPESSOA, P.FLGDESCONTO, SUM(H.VALORPROVENTO) AS VAL' +
        'OR'
      '   FROM   HISTRUBSAL H, PROVDESC P'
      '   WHERE (H.IDRUBRICA   = P.IDPROVENTO) AND'
      '         (H.IDMOTIVO    = 2)AND'
      '         (H.MES         = '#39'2000/04'#39')     AND'
      '         (P.FLGDESCONTO = 1)'
      '   GROUP BY H.IDPESSOA,P.FLGDESCONTO) DESCONTOS,'
      
        '  (SELECT H.IDPESSOA,H.VALORPROVENTO AS VALOR, MO.DESCRICAO, H.M' +
        'ES'
      '   FROM   HISTRUBSAL H, PROVDESC P, MOTIVO MO'
      '   WHERE (H.IDRUBRICA  = IDPROVENTO)   AND'
      '         (MO.IDMOTIVO  = H.IDMOTIVO)   AND'
      '         (H.IDMOTIVO   = 2)AND'
      '         (H.MES        = '#39'2000/04'#39')     AND'
      '         (P.CODRUBCLT  = '#39'40999'#39')) RUBRICA'
      'WHERE'
      '  (PJ.IDPESSOA = 535) AND'
      '  (EP.IDPESSOA   = 2)  AND'
      '  (H.IDMOTIVO    = 2)         AND'
      '  (H.MES         = '#39'2000/04'#39')              AND'
      '  (EP.IDPESSOA   = PJ.IDGRUPO)  AND'
      '  (FUNC.IDESTAB  = PJ.IDPESSOA) AND'
      '  (FUNC.IDPESSOA = PF.IDPESSOA) AND'
      '  (PF.IDPESSOA   = H.IDPESSOA)  AND'
      '  (FUNC.IDAGENCIASALARIO = AG.IDPESSOA)   AND'
      '  (AG.IDPESSOA   = PA.IDPESSOA)           AND'
      '  (AG.IDBANCO    = B.IDPESSOA)            AND'
      '  (PF.IDPESSOA   = RUBRICA.IDPESSOA(+))   AND'
      '  (PF.IDPESSOA   = DESCONTOS.IDPESSOA(+)) AND'
      '  (PF.IDPESSOA   = PROVENTOS.IDPESSOA(+))'
      'ORDER BY'
      '  NOMEAGENCIA')
    ValidateWithMask = True
    Left = 192
    Top = 217
  end
  object updDocTxt: TUpdateSQL
    Left = 95
    Top = 264
  end
  object qryDocTxt: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '  '#39'123456789012345678'#39' CONTALIQUIDO,'
      '  0 IDPESSOA,'
      '  '#39'123456789012345678901234567890'#39' NOME,'
      '  '#39'123456789012345678901234567890'#39' RAZAOSOCIAL,'
      '  '#39'123456789012345678'#39' NUMDOCUMENTO,'
      '  '#39'123456789012345'#39' CONTACORRENTE,'
      '  '#39'1234567890'#39' CODBANCOFAVORECIDO,'
      '  '#39'123456789012345'#39' NUMAGENCIA,'
      '  '#39'1234567890123456789012345678901234567890'#39' LOGRADOURO,'
      '  '#39'12345678'#39' NUMERO,'
      '  '#39'12345678901234567890'#39' COMPLEMENTO,'
      '  '#39'12345678901234567890'#39' BAIRRO,'
      '  '#39'12345678901234567890'#39' CIDADE,'
      '  '#39'123'#39' CODESTADO,'
      '  '#39'12345678'#39' CEP,'
      '  0 IDFORCLI,'
      '  0 CODDOCUMENTO,'
      '  '#39'1234567890123'#39' LIVRE,'
      '  0 VALOR,'
      '  0 VALORDESCONTO,'
      '  0 VALORJUROS,'
      '  '#39'01/01/1990'#39' DATAVENCTO,'
      '  '#39'01/01/1990'#39' DATAPROGRAMADA,'
      '  0 TIPOMOEDA,'
      '  0 NUMLOTE,'
      '  0 CODPORTFORMA,'
      '  0 CODFORMAPAGTO,'
      '  0 CODTIPOPAGTO,'
      '  '#39'0'#39' FLGEMITEAVISO,'
      '  0 CODARQUIVOREMESSA,'
      '  0 CODPORTADOR,'
      '  0 IDBANCO,'
      '  '#39'123456789012345'#39' NOCONTACORR,'
      '  '#39'1234567890'#39' CODBARRA,'
      '  '#39'1234567890'#39' CODBARRAVALOR,'
      '  0 NODOCUMENTO,'
      '  '#39'123'#39' COMPLDOCUMENTO,'
      '  '#39'1'#39' TIPO,'
      '  '#39'12345678901234567890'#39' NUMEMPRESABANCO,'
      '  '#39'1'#39' DEBCRE, '#39'1'#39' TIPOCONTA'
      'FROM'
      '  DUAL'
      'WHERE'
      '  (1 = 2)')
    UpdateObject = updDocTxt
    ValidateWithMask = True
    Left = 39
    Top = 264
  end
  object qryPortadorForma: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '  PFR.CODPORTFORMA, PFR.CODPORTADOR, PFR.DESCRICAO, PFR.CODARQUI' +
        'VOREMESSA,'
      '  PFR.CONTROLEREMESSA, PFR.CODFORMAPAGTO, PFR.FLGEMITEAVISO,'
      '  PFR.CODTIPOPAGTO, PFR.NUMEMPRESABANCO,'
      '  PCT.IDBANCO, PCT.NOCONTACORR'
      'FROM'
      '  PORTADORFORMA PFR, PORTADORCONTA PCT'
      'WHERE'
      '  (PCT.CODPORTADOR = PFR.CODPORTADOR)')
    ValidateWithMask = True
    Left = 119
    Top = 217
  end
  object qryBanco: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  AGB.IDBANCO, BPF.CODPORTFORMA,'
      
        '  F.NUMCONTASALARIO AS CONTACORRENTE, AGB.NUMAGENCIA, BAN.NUMBAN' +
        'CO'
      'FROM'
      
        '  FUNCIONARIO F, AGENCIABANCARIA AGB, BANCO BAN, BANCOPORTFOLHA ' +
        'BPF'
      'WHERE'
      '  (F.IDPESSOA         = :IDRESPONSAVEL)  AND'
      '  (F.IDAGENCIASALARIO = AGB.IDPESSOA(+)) AND'
      '  (AGB.IDBANCO        = BAN.IDPESSOA(+)) AND'
      '  (AGB.IDBANCO        = BPF.IDBANCO(+))'
      ' ')
    ValidateWithMask = True
    Left = 274
    Top = 21
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDRESPONSAVEL'
        ParamType = ptUnknown
      end>
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 239
    Top = 217
  end
  object qryEndereco: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  END.LOGRADOURO,END.NUMERO,END.COMPLEMENTO,'
      '  END.BAIRRO,CIDADES.NOME AS CIDADE,END.CODESTADO,END.CEP,'
      '  DOC.NUMDOCUMENTO'
      'FROM'
      '  DOCPESSOA DOC, ENDPESS END, CIDADES'
      'WHERE'
      '  (END.IDPESSOA  = :IDRESPONSAVEL) AND'
      '  (DOC.IDPESSOA  = :IDRESPONSAVEL) AND'
      '  (END.IDCIDADES = CIDADES.IDCIDADES(+))')
    ValidateWithMask = True
    Left = 44
    Top = 217
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDRESPONSAVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDRESPONSAVEL'
        ParamType = ptUnknown
      end>
  end
end
