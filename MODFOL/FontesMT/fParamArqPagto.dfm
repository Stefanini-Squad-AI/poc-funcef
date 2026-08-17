inherited frmParamArqPagto: TfrmParamArqPagto
  Left = 470
  Top = 183
  HelpContext = 210090
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsToolWindow
  Caption = 'Geração do Arquivo para Pagamento Eletrônico'
  ClientHeight = 431
  ClientWidth = 484
  Font.Style = []
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 484
    Height = 392
    BorderWidth = 2
    object Bevel1: TBevel
      Left = 37
      Top = 364
      Width = 437
      Height = 22
      Visible = False
    end
    object lblDiretorio: TLabel
      Left = 41
      Top = 369
      Width = 427
      Height = 13
      AutoSize = False
      Caption = 'C:\'
      Visible = False
      WordWrap = True
    end
    object spbtnProcurarArquivo: TSpeedButton
      Left = 10
      Top = 364
      Width = 23
      Height = 22
      Glyph.Data = {
        66010000424D6601000000000000760000002800000013000000140000000100
        040000000000F000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        888888800000888888888888888888800000888008888888888888800000880F
        108888888888888000008809F108888888888880000088809F00888888888880
        0000888809F0000788888880000088888090FFF0788888800000887000088888
        00888880000088007B0F8F8F0B0888800000880F0708F8F8070888800000880B
        0B708F807B7088800000880F70B70007B7B088800000880BF07B7B7B7B7B0880
        0000880FBF0007B7B7B708800000880BFBFBF000000088800000880FBFBFBFBF
        B088888000008870000000000788888000008888888888888888888000008888
        88888888888888800000}
      Visible = False
      OnClick = spbtnProcurarArquivoClick
    end
    object gbxTipPag: TGroupBox
      Left = 10
      Top = 5
      Width = 464
      Height = 96
      Caption = 'Tipo(s) de Pagamento'
      TabOrder = 0
      object chklstTipoFolha: TColorCheckListBox
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
      object chkConvenioFloat: TCheckBox
        Left = 9
        Top = 72
        Width = 310
        Height = 17
        Caption = 'Utilizar convênio bancário de FLOAT antecipado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
      end
    end
    object gbxAnoMesRef: TGroupBox
      Left = 10
      Top = 105
      Width = 213
      Height = 43
      Caption = 'Mês e Ano de Referência'
      TabOrder = 1
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
      Left = 229
      Top = 105
      Width = 118
      Height = 43
      Caption = 'Data de Crédito'
      TabOrder = 2
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
      Left = 353
      Top = 105
      Width = 121
      Height = 43
      Caption = 'Processo'
      Columns = 2
      ItemIndex = 1
      Items.Strings = (
        'Prévia'
        'Final')
      TabOrder = 3
      TabStop = True
    end
    object gbxEstab: TGroupBox
      Left = 10
      Top = 150
      Width = 464
      Height = 44
      Caption = 'Estabelecimento'
      TabOrder = 4
      object dblckEstab: TwwDBLookupCombo
        Left = 9
        Top = 14
        Width = 446
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'60'#9'Estabelecimento')
        LookupTable = CdsEstab
        LookupField = 'IDPESSOA'
        Style = csDropDownList
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        UseTFields = False
        AllowClearKey = True
        OnChange = dblckEstabChange
      end
    end
    object gbxFunc: TGroupBox
      Left = 10
      Top = 196
      Width = 464
      Height = 164
      Caption = 'Empregados'
      TabOrder = 5
      object Paginas: TPageControl
        Left = 6
        Top = 15
        Width = 451
        Height = 142
        ActivePage = tbshFiltroFunc
        HotTrack = True
        TabOrder = 0
        object tbshListaFunc: TTabSheet
          Caption = '&Lista'
          object chklstFunc: TColorCheckListBox
            Left = 2
            Top = 1
            Width = 299
            Height = 111
            ItemHeight = 13
            Style = lbOwnerDrawFixed
            TabOrder = 0
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
            Left = 29
            Top = 8
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
              Caption = 'LEF'
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
              Caption = 'Terceirizados'
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
              Caption = 'Cessão'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 4
            end
            object cbxPropDirSemVinc: TCheckBox
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
  end
  inherited Dock971: TDock97
    Top = 392
    Width = 484
    inherited tb97Fundo: TToolbar97
      Left = 58
      DockPos = 197
      inherited sep1: TToolbarSep97
        Left = 339
      end
      object ToolbarSep972: TToolbarSep97 [1]
        Left = 238
        Top = 0
        Blank = True
        SizeHorz = 20
      end
      object ToolbarSep971: TToolbarSep97 [2]
        Left = 109
        Top = 0
        Blank = True
        SizeHorz = 20
      end
      inherited bbtnSair: TBitBtn
        Left = 258
        TabOrder = 1
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 341
        TabOrder = 2
      end
      object rbtnGerar: TBitBtn
        Left = 129
        Top = 0
        Width = 109
        Height = 33
        Cancel = True
        Caption = ' &Gerar Arquivo'
        Default = True
        TabOrder = 0
        Visible = False
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
      object bbtnGerarDados: TBitBtn
        Left = 0
        Top = 0
        Width = 109
        Height = 33
        Caption = 'Gerar &Dados'
        Default = True
        TabOrder = 3
        OnClick = bbtnGerarDadosClick
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333330000333333333333333333333333F33333333333
          00003333344333333333333333388F3333333333000033334224333333333333
          338338F3333333330000333422224333333333333833338F3333333300003342
          222224333333333383333338F3333333000034222A22224333333338F338F333
          8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
          33333338F83338F338F33333000033A33333A222433333338333338F338F3333
          0000333333333A222433333333333338F338F33300003333333333A222433333
          333333338F338F33000033333333333A222433333333333338F338F300003333
          33333333A222433333333333338F338F00003333333333333A22433333333333
          3338F38F000033333333333333A223333333333333338F830000333333333333
          333A333333333333333338330000333333333333333333333333333333333333
          0000}
        NumGlyphs = 2
      end
    end
  end
  object pnlDiretorio: TPanel [2]
    Left = 368
    Top = 133
    Width = 230
    Height = 255
    TabOrder = 2
    Visible = False
    OnExit = pnlDiretorioExit
    object Bevel3: TBevel
      Left = 6
      Top = 209
      Width = 218
      Height = 4
      Style = bsRaised
    end
    object Label1: TLabel
      Left = 6
      Top = 5
      Width = 218
      Height = 16
      Alignment = taCenter
      AutoSize = False
      Caption = 'Selecione o Diretório'
      Color = clNavy
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object DriveComboBox1: TDriveComboBox
      Left = 6
      Top = 23
      Width = 218
      Height = 19
      DirList = DirectoryListBox1
      TabOrder = 0
    end
    object DirectoryListBox1: TDirectoryListBox
      Left = 6
      Top = 45
      Width = 218
      Height = 160
      ItemHeight = 16
      TabOrder = 1
      OnKeyPress = DirectoryListBox1KeyPress
    end
    object bbtnOkDir: TBitBtn
      Left = 6
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
      OnClick = bbtnOkDirClick
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
    object bbtnCancelarDir: TBitBtn
      Left = 121
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
      OnClick = bbtnCancelarDirClick
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
    Left = 96
    Top = 21
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object CdsEstab: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 44
    Top = 21
  end
end
