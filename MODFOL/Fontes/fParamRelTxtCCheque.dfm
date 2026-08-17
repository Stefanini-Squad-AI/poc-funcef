inherited frmParamRelTxtCCheque: TfrmParamRelTxtCCheque
  Left = 141
  Top = 69
  HelpContext = 210075
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsToolWindow
  Caption = 'Demonstrativo de Pagamento'
  ClientHeight = 446
  ClientWidth = 483
  Font.Style = []
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 483
    Height = 407
    BorderWidth = 2
    object gbxEstab: TGroupBox
      Left = 13
      Top = 126
      Width = 230
      Height = 43
      Caption = 'Estabelecimento'
      TabOrder = 3
      object dblkcbEstab: TwwDBLookupCombo
        Left = 9
        Top = 14
        Width = 212
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'60'#9'Estabelecimento')
        LookupTable = qryEstab
        LookupField = 'CODIGO'
        Style = csDropDownList
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        OnChange = dblkcbEstabChange
      end
    end
    object gbxTipPag: TGroupBox
      Left = 13
      Top = 6
      Width = 457
      Height = 74
      Caption = 'Tipo(s) de Pagamento'
      TabOrder = 0
      object chklstTipoFolha: TCheckListBox
        Left = 9
        Top = 13
        Width = 306
        Height = 55
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
        OnDrawItem = chklstTipoFolhaDrawItem
      end
      object bbtnSelTodosTipoFolha: TBitBtn
        Left = 320
        Top = 12
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
        Left = 320
        Top = 38
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
    object gbxMesAnoRef: TGroupBox
      Left = 13
      Top = 81
      Width = 230
      Height = 43
      Caption = 'Mês e Ano de Referência'
      TabOrder = 1
      object cmbMes: TComboBox
        Left = 9
        Top = 14
        Width = 136
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
        Left = 150
        Top = 14
        Width = 67
        Height = 22
        MaxValue = 0
        MinValue = 0
        TabOrder = 1
        Value = 0
        OnChange = speAnoChange
      end
    end
    object gbxOrdImpress: TGroupBox
      Left = 250
      Top = 81
      Width = 220
      Height = 43
      Caption = 'Ordem de Impressão'
      TabOrder = 2
      object cmbOrderBy: TComboBox
        Left = 9
        Top = 14
        Width = 202
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
        Items.Strings = (
          'Nome do Funcionário'
          'Centro de Custo, Nome'
          'Centro de Custo, Matrícula'
          'Matrícula do Funcionário')
      end
    end
    object rgProcesso: TRadioGroup
      Left = 250
      Top = 126
      Width = 220
      Height = 43
      Caption = 'Processo'
      Columns = 2
      ItemIndex = 1
      Items.Strings = (
        'Prévia'
        'Final')
      TabOrder = 4
    end
    object edNomeArqVerso: TEdit
      Left = 13
      Top = 337
      Width = 457
      Height = 21
      Hint = 'Frente do Demonstrativo'
      TabStop = False
      Color = clBtnFace
      Enabled = False
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 9
      Visible = False
    end
    object edNomeArqFrente: TEdit
      Left = 13
      Top = 376
      Width = 457
      Height = 21
      Hint = 'Arquivo imagem do demonstrativo'
      TabStop = False
      Color = clBtnFace
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 8
    end
    object gbxFunc: TGroupBox
      Left = 13
      Top = 211
      Width = 457
      Height = 160
      Caption = 'Empregados e Rubricas'
      TabOrder = 7
      object Paginas: TPageControl
        Left = 6
        Top = 15
        Width = 445
        Height = 139
        ActivePage = tbshListaFunc
        HotTrack = True
        TabOrder = 0
        object tbshListaFunc: TTabSheet
          Caption = '&Lista'
          object chklstFunc: TCheckListBox
            Left = 2
            Top = 2
            Width = 297
            Height = 105
            OnClickCheck = chklstFuncClickCheck
            ItemHeight = 13
            Style = lbOwnerDrawFixed
            TabOrder = 0
            OnDrawItem = chklstTipoFolhaDrawItem
          end
          object bbtnSelTodosFunc: TBitBtn
            Left = 304
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
            Left = 304
            Top = 28
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
            Left = 5
            Top = 1
            Width = 220
            Height = 90
            Caption = 'Tipo de Contrato'
            ParentShowHint = False
            ShowHint = False
            TabOrder = 0
            OnEnter = gbxTipContraEnter
            OnExit = gbxTipContraExit
            object cbxEfetivos: TCheckBox
              Left = 9
              Top = 17
              Width = 64
              Height = 13
              Caption = 'Efetivos'
              Checked = True
              ParentShowHint = False
              ShowHint = False
              State = cbChecked
              TabOrder = 0
            end
            object cbxEspeciais: TCheckBox
              Left = 9
              Top = 35
              Width = 90
              Height = 13
              Caption = 'Efet. Especiais'
              Checked = True
              ParentShowHint = False
              ShowHint = False
              State = cbChecked
              TabOrder = 1
            end
            object cbxTemporarios: TCheckBox
              Left = 9
              Top = 52
              Width = 85
              Height = 13
              Caption = 'Temporários'
              Checked = True
              ParentShowHint = False
              ShowHint = False
              State = cbChecked
              TabOrder = 2
            end
            object cbxEstagiarios: TCheckBox
              Left = 9
              Top = 69
              Width = 74
              Height = 13
              Caption = 'Estagiários'
              Checked = True
              ParentShowHint = False
              ShowHint = False
              State = cbChecked
              TabOrder = 3
            end
            object cbxTerceiros: TCheckBox
              Left = 113
              Top = 17
              Width = 66
              Height = 13
              Caption = 'Terceiros'
              ParentShowHint = False
              ShowHint = False
              TabOrder = 4
            end
            object cbxProprietarios: TCheckBox
              Left = 113
              Top = 35
              Width = 97
              Height = 13
              Caption = 'Prop/Dir s/ Vinc'
              ParentShowHint = False
              ShowHint = False
              TabOrder = 5
            end
            object cbxAutonomos: TCheckBox
              Left = 113
              Top = 52
              Width = 75
              Height = 13
              Caption = 'Autônomos'
              ParentShowHint = False
              ShowHint = False
              TabOrder = 6
            end
          end
          object gbxSituacao: TGroupBox
            Left = 253
            Top = 1
            Width = 111
            Height = 77
            Caption = 'Situação Funcional'
            ParentShowHint = False
            ShowHint = False
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
              ShowHint = False
              State = cbChecked
              TabOrder = 0
            end
            object cbxAfastados: TCheckBox
              Left = 9
              Top = 36
              Width = 69
              Height = 13
              Caption = 'Afastados'
              ParentShowHint = False
              ShowHint = False
              TabOrder = 1
            end
            object cbxDemitidos: TCheckBox
              Tag = 2
              Left = 9
              Top = 56
              Width = 69
              Height = 13
              Caption = 'Demitidos'
              ParentShowHint = False
              ShowHint = False
              TabOrder = 2
            end
          end
        end
        object Rubricas: TTabSheet
          Caption = 'Rubricas'
          ImageIndex = 2
          object chklstRubrica: TCheckListBox
            Left = 2
            Top = 2
            Width = 320
            Height = 105
            OnClickCheck = chklstRubricaClickCheck
            ItemHeight = 13
            Style = lbOwnerDrawFixed
            TabOrder = 0
            OnDrawItem = chklstTipoFolhaDrawItem
            OnKeyDown = chklstRubricaKeyDown
          end
          object bbtnSelTodosRub: TBitBtn
            Left = 330
            Top = 2
            Width = 100
            Height = 35
            Caption = 'Seleciona Todas'
            TabOrder = 1
            TabStop = False
            OnClick = bbtnSelTodosRubClick
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
            Layout = blGlyphTop
            NumGlyphs = 2
            Spacing = 0
          end
          object bbtnInverteSelRub: TBitBtn
            Left = 330
            Top = 39
            Width = 100
            Height = 40
            Caption = 'Inverte Seleção'
            TabOrder = 2
            TabStop = False
            OnClick = bbtnInverteSelRubClick
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
            Layout = blGlyphTop
            NumGlyphs = 2
            Spacing = 0
          end
        end
      end
    end
    object rgImprCab: TRadioGroup
      Left = 13
      Top = 173
      Width = 230
      Height = 35
      Hint = 'Imprime Cabeçalho com o Nome e Endereço da Empresa ?'
      Caption = 'Imprime Nome/Endereço da Empresa ?'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Sim'
        'Não')
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
    end
    object rgAltura: TRadioGroup
      Left = 361
      Top = 173
      Width = 108
      Height = 35
      Caption = 'Altura do Formulário'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        '5,5"'
        '6,0"')
      TabOrder = 6
    end
    object gbxDatas: TGroupBox
      Left = 250
      Top = 173
      Width = 108
      Height = 35
      Caption = 'Data Pagto.'
      TabOrder = 10
      object dtPagamento: TCMDateTimePicker
        Left = 7
        Top = 13
        Width = 94
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
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ShowButton = True
        TabOrder = 0
      end
    end
  end
  inherited Dock971: TDock97
    Top = 407
    Width = 483
    inherited tb97Fundo: TToolbar97
      Left = 34
      DockPos = 57
      inherited sep1: TToolbarSep97
        Left = 363
      end
      object ToolbarSep973: TToolbarSep97 [1]
        Left = 263
        Top = 0
        Blank = True
        SizeHorz = 20
      end
      object ToolbarSep972: TToolbarSep97 [2]
        Left = 75
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      object ToolbarSep974: TToolbarSep97 [3]
        Left = 152
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      inherited bbtnSair: TBitBtn
        Left = 283
        ModalResult = 2
        TabOrder = 3
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 365
        TabOrder = 4
      end
      object bbtnImagem: TBitBtn
        Left = 0
        Top = 0
        Width = 75
        Height = 33
        Hint = 'Localizar a Imagem Associada ao Demonstrativo'
        Caption = ' &Imagem'
        Default = True
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = bbtnImagemClick
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00666666666666
          66666888888888888886700000000000008670FFFFFFFFFFF08670F4444F0F00
          F08670FF00FFFFFFF08670F0110FFFFFF06670F011000000000870F000800888
          008070FF808087888080700000808F888080777770F0088800F0666660FF0000
          0FF066666000000000006666660680F086066666666668086666}
        Spacing = 2
      end
      object bbtnGerar: TBitBtn
        Left = 154
        Top = 0
        Width = 109
        Height = 33
        Hint = 'Gravar Arquivo Texto'
        Cancel = True
        Caption = ' &Gerar Arquivo'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = bbtnGerarClick
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
        Spacing = 2
      end
      object rbtnImprimir: TBitBtn
        Left = 77
        Top = 0
        Width = 75
        Height = 33
        Cancel = True
        Caption = ' &Imprimir'
        TabOrder = 1
        OnClick = rbtnImprimirClick
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
        Spacing = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 335
    Top = 269
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
      '  IDMOTIVO, DESCRICAO'
      'FROM'
      '  MOTIVO'
      'WHERE'
      '  (GRUPOMOTIVO = '#39'F'#39')'
      'ORDER BY'
      '  UPPER(DESCRICAO)')
    ValidateWithMask = True
    Left = 44
    Top = 67
    object qryMotivoDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 50
      FieldName = 'DESCRICAO'
      Origin = 'MOTIVO.DESCRICAO'
      Size = 50
    end
    object qryMotivoIDMOTIVO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDMOTIVO'
      Origin = 'MOTIVO.IDMOTIVO'
      Visible = False
    end
  end
  object qryFunc: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 44
    Top = 54
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
    Left = 44
    Top = 42
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
      '  NORMALINI,'
      '  NORMALFIM,'
      '  IDMOTIVO'
      'FROM PARAMRH')
    ValidateWithMask = True
    Left = 44
    Top = 30
  end
  object qryPessoa: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 280
    Top = 226
  end
  object ds: TwwDataSource
    DataSet = qryPessoa
    Left = 280
    Top = 214
  end
  object qryMargem: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = ds
    SQL.Strings = (
      'SELECT'
      '  PJ.NOME AS EMPRESA,'
      '  PF.NOME AS EMPREGADO,'
      '  FUNC.IDAGENCIAFGTS,'
      '  FUNC.NUMCONTAFGTS,'
      '  FUNC.MATRICULA,'
      '  TO_CHAR(SYSDATE,'#39'DD/MM/YYYY'#39') DATA,'
      '  C.TITULO,'
      '  RP.CODPROVDESC AS CODRUBRICA,'
      '  RP.DESCRPROVDESC AS RUBRICA,'
      '  RB.VALORRUBRICA,'
      '  CC.NOME CCUSTO,'
      
        '  RTRIM(DECODE(DECODE(TDO.SIGLADOCUMENTO,'#39'CGC:'#39','#39'Inscrição'#39' ||'#39' ' +
        #39'|| TDO.SIGLADOCUMENTO ||'#39' '#39'|| (SUBSTR(DO.NUMDOCUMENTO,1,2) ||'#39'.' +
        #39'|| SUBSTR(DO.NUMDOCUMENTO,3,3) ||'#39'.'#39'|| SUBSTR(DO.NUMDOCUMENTO,6' +
        ',3) ||'#39'/'#39'|| SUBSTR(DO.NUMDOCUMENTO,9,4) ||'#39'-'#39'||  SUBSTR(DO.NUMDO' +
        'CUMENTO,13,2))),'#39#39',DECODE(TDO.SIGLADOCUMENTO,'#39'CPF:'#39','#39'Inscriçào'#39' ' +
        '||'#39' '#39'|| TDO.SIGLADOCUMENTO ||'#39' '#39'||   SUBSTR(DO.NUMDOCUMENTO,1,3)' +
        ' ||'#39'.'#39'|| SUBSTR(DO.NUMDOCUMENTO,3,3) ||'#39'.'#39'|| SUBSTR(DO.NUMDOCUME' +
        'NTO,6,3) ||'#39'-'#39'|| SUBSTR(DO.NUMDOCUMENTO,9,2)),DECODE(TDO.SIGLADO' +
        'CUMENTO,'#39'CGC:'#39','#39'Inscrição'#39' ||'#39' '#39'|| TDO.SIGLADOCUMENTO ||'#39' '#39'||   ' +
        ' SUBSTR(DO.NUMDOCUMENTO,1,2) ||'#39'.'#39'|| SUBSTR(DO.NUMDOCUMENTO,3,3)' +
        ' ||'#39'.'#39'|| SUBSTR(DO.NUMDOCUMENTO,6,3) ||'#39'/'#39'|| SUBSTR(DO.NUMDOCUME' +
        'NTO,9,4) ||'#39'-'#39'||  SUBSTR(DO.NUMDOCUMENTO,13,2)))) AS CGCCPF,'
      
        '  RTRIM(DECODE(DECODE(TE.SIGLADOCUMENTO,'#39'ESTADUAL'#39','#39'Inscrição'#39' |' +
        '|'#39' '#39'|| TE.SIGLADOCUMENTO ||'#39' '#39'||  TE.NUMDOCUMENTO),'#39#39',DECODE(TE1' +
        '.SIGLADOCUMENTO,'#39'MUNICIPAL'#39','#39'Inscrição'#39' ||'#39' '#39'|| TE1.SIGLADOCUMEN' +
        'TO ||'#39' '#39'||  TE1.NUMDOCUMENTO)  ,DECODE(TE.SIGLADOCUMENTO,'#39'ESTADU' +
        'AL'#39','#39'Inscrição'#39' ||'#39' '#39'|| TE.SIGLADOCUMENTO ||'#39' '#39'||  TE.NUMDOCUMEN' +
        'TO))) AS ESTADUALMUNICIPAL,'
      
        '  ((decode(p.FlgDesconto,0,h.VALORPROVENTO,0)) - (decode(p.FlgDe' +
        'sconto,1,h.VALORPROVENTO,0))) as Liquido,'
      '  MO.DESCRICAO as MotivoFolha,'
      
        '  rtrim(end.logradouro) || '#39' n: '#39'|| end.numero || '#39', '#39' || rtrim(' +
        'end.complemento) || '#39' - '#39' ||  rtrim(end.bairro) || '#39' - '#39' || rtri' +
        'm(end.cidade) || '#39' - '#39' || end.codestado || '#39' - CEP:  '#39' || end.ce' +
        'p as endereco,'
      
        '  RTRIM(DECODE(H.REFERENCIA,'#39'***'#39','#39'RECIBO DE PAGAMENTO NORMAL'#39','#39 +
        'RECIBO DE PAGAMENTO DE 13º SÁLARIO'#39')) AS NOMERELAT'
      'FROM'
      
        '  PESSOA PJ, PESSOA PF, FUNCIONARIO FUNC,TIPODOCPESSOA TD,  DOCP' +
        'ESSOA D, DOCPESSOA DO, TIPODOCOFICIAL TDO, ENDPESS END, MOTIVO M' +
        'O,'
      
        '  HISTRUBSAL H,DOCUMENTO DOC, PROVDESC P,  RUBRICAXPESS RP, CARG' +
        'O C,CENTCUST CC, RUBRICAINDIV RB, PARAMRH PR,'
      '  (SELECT D.IDPESSOA, TD.CODDOCUMENTO,'
      
        '     SUBSTR(D.NUMDOCUMENTO,1,2) ||'#39'.'#39'|| SUBSTR(D.NUMDOCUMENTO,3,' +
        '3) ||'#39'.'#39'|| SUBSTR(D.NUMDOCUMENTO,6,3) AS NUMDOCUMENTO,'
      '    TD.SIGLADOCUMENTO'
      '    FROM DOCPESSOA D, TIPODOCOFICIAL TD'
      '    WHERE'
      '       (TD.CODDOCUMENTO = 7) AND'
      '       (D.IDDOCUMENTO = TD.IDDOCUMENTO)) TE,'
      '  (SELECT'
      
        '   D.IDPESSOA, TD.CODDOCUMENTO, D.NUMDOCUMENTO, TD.SIGLADOCUMENT' +
        'O'
      'FROM DOCPESSOA D, TIPODOCOFICIAL TD'
      '    WHERE'
      '       (TD.CODDOCUMENTO = 8) AND'
      '       (D.IDDOCUMENTO = TD.IDDOCUMENTO)) TE1,'
      '  (SELECT H.IDPESSOA,H.VALORPROVENTO, P.CODRUBCLT'
      '     FROM HISTRUBSAL H, PROVDESC P'
      '     WHERE'
      
        '        ((DECODE(P.CODRUBCLT,00001,H.VALORPROVENTO)-DECODE(P.COD' +
        'RUBCLT,00029,H.VALORPROVENTO)) < 1) AND'
      '        (H.IDRUBRICA = P.IDPROVENTO)) TESTE'
      'WHERE'
      '  (TDO.CODDOCUMENTO = 1) AND'
      '  (TD.IDDOCUMENTO = 7) AND'
      
        '  ((FUNC.TIPOCONTRATO = '#39'E'#39') OR (FUNC.TIPOCONTRATO = '#39'T'#39') OR (FU' +
        'NC.TIPOCONTRATO = '#39'G'#39')) AND'
      '  ((H.REFERENCIA = '#39'***'#39') OR (H.REFERENCIA = '#39'13.o Salar'#39')) AND'
      
        '  (SUBSTR(H.MES,6,7) ||'#39'/'#39'|| SUBSTR(H.MES,3,2) >= SUBSTR(PR.NORM' +
        'ALINI,4,10)) AND'
      
        '  (SUBSTR(H.MES,6,7) ||'#39'/'#39'|| SUBSTR(H.MES,3,2) <= SUBSTR(PR.NORM' +
        'ALFIM,4,10)) AND'
      '  (PJ.IDPESSOA = TE.IDPESSOA) AND'
      '  (PJ.IDPESSOA = TE1.IDPESSOA) AND'
      '  (D.IDPESSOA = PF.IDPESSOA) AND'
      '  (TD.IDDOCUMENTO = D.IDDOCUMENTO) AND'
      '  (PJ.IDPESSOA = FUNC.IDESTAB) AND'
      '  (PF.IDPESSOA = FUNC.IDPESSOA) AND'
      '  (PF.IDPESSOA = :IDPESSOA) AND'
      '  (PJ.IDPESSOA = DO.IDPESSOA) AND'
      '  (DO.IDDOCUMENTO = TDO.IDDOCUMENTO) AND'
      '  (PJ.IDPESSOA = END.IDPESSOA) AND'
      '  (H.IDPESSOA = PF.IDPESSOA) AND'
      '  (TESTE.IDPESSOA(+) = PF.IDPESSOA) AND'
      '  (DOC.IDPESSOA(+) = PJ.IDPESSOA) AND'
      '  (C.IDCARGO = FUNC.IDCARGO) AND'
      '  (FUNC.IDEMPRESA = CC.IDEMPRESA) AND'
      '  (FUNC.CODCENTROCUSTO = CC.CODCENTROCUSTO) AND'
      '  (H.IDMOTIVO = MO.IDMOTIVO) AND'
      '  (H.IDMOTIVO = PR.IDMOTIVO) AND'
      '  (H.IDRUBRICA = P.IDPROVENTO) AND'
      '  (H.IDRUBRICA = RP.IDRUBRICA) AND'
      '  (RP.IDPESSOA  = FUNC.IDEMPRESA) AND'
      '  (RB.IDPESSOA(+) = H.IDPESSOA)'
      'ORDER BY EMPREGADO, NOMERELAT')
    ValidateWithMask = True
    Left = 197
    Top = 52
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryBaseIRRF: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = ds
    ValidateWithMask = True
    Left = 197
    Top = 39
  end
  object qryFGTS: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = ds
    ValidateWithMask = True
    Left = 197
    Top = 27
  end
  object qrySalParticip: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = ds
    ValidateWithMask = True
    Left = 129
    Top = 66
  end
  object qryBaseINSS: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = ds
    ValidateWithMask = True
    Left = 129
    Top = 53
  end
  object qrySalBase: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = ds
    ValidateWithMask = True
    Left = 129
    Top = 40
  end
  object qryDescontos: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = ds
    SQL.Strings = (
      'SELECT'
      '  PJ.NOME AS EMPRESA,'
      '  PF.NOME AS EMPREGADO,'
      '  FUNC.IDAGENCIAFGTS,'
      '  FUNC.NUMCONTAFGTS,'
      '  FUNC.MATRICULA,'
      '  TO_CHAR(SYSDATE,'#39'DD/MM/YYYY'#39') DATA,'
      '  C.TITULO,'
      '  RP.CODPROVDESC AS CODRUBRICA,'
      '  RP.DESCRPROVDESC AS RUBRICA,'
      '  RB.VALORRUBRICA,'
      '  CC.NOME CCUSTO,'
      
        '  RTRIM(DECODE(DECODE(TDO.SIGLADOCUMENTO,'#39'CGC:'#39','#39'Inscrição'#39' ||'#39' ' +
        #39'|| TDO.SIGLADOCUMENTO ||'#39' '#39'|| (SUBSTR(DO.NUMDOCUMENTO,1,2) ||'#39'.' +
        #39'|| SUBSTR(DO.NUMDOCUMENTO,3,3) ||'#39'.'#39'|| SUBSTR(DO.NUMDOCUMENTO,6' +
        ',3) ||'#39'/'#39'|| SUBSTR(DO.NUMDOCUMENTO,9,4) ||'#39'-'#39'||  SUBSTR(DO.NUMDO' +
        'CUMENTO,13,2))),'#39#39',DECODE(TDO.SIGLADOCUMENTO,'#39'CPF:'#39','#39'Inscriçào'#39' ' +
        '||'#39' '#39'|| TDO.SIGLADOCUMENTO ||'#39' '#39'||   SUBSTR(DO.NUMDOCUMENTO,1,3)' +
        ' ||'#39'.'#39'|| SUBSTR(DO.NUMDOCUMENTO,3,3) ||'#39'.'#39'|| SUBSTR(DO.NUMDOCUME' +
        'NTO,6,3) ||'#39'-'#39'|| SUBSTR(DO.NUMDOCUMENTO,9,2)),DECODE(TDO.SIGLADO' +
        'CUMENTO,'#39'CGC:'#39','#39'Inscrição'#39' ||'#39' '#39'|| TDO.SIGLADOCUMENTO ||'#39' '#39'||   ' +
        ' SUBSTR(DO.NUMDOCUMENTO,1,2) ||'#39'.'#39'|| SUBSTR(DO.NUMDOCUMENTO,3,3)' +
        ' ||'#39'.'#39'|| SUBSTR(DO.NUMDOCUMENTO,6,3) ||'#39'/'#39'|| SUBSTR(DO.NUMDOCUME' +
        'NTO,9,4) ||'#39'-'#39'||  SUBSTR(DO.NUMDOCUMENTO,13,2)))) AS CGCCPF,'
      
        '  RTRIM(DECODE(DECODE(TE.SIGLADOCUMENTO,'#39'ESTADUAL'#39','#39'Inscrição'#39' |' +
        '|'#39' '#39'|| TE.SIGLADOCUMENTO ||'#39' '#39'||  TE.NUMDOCUMENTO),'#39#39',DECODE(TE1' +
        '.SIGLADOCUMENTO,'#39'MUNICIPAL'#39','#39'Inscrição'#39' ||'#39' '#39'|| TE1.SIGLADOCUMEN' +
        'TO ||'#39' '#39'||  TE1.NUMDOCUMENTO)  ,DECODE(TE.SIGLADOCUMENTO,'#39'ESTADU' +
        'AL'#39','#39'Inscrição'#39' ||'#39' '#39'|| TE.SIGLADOCUMENTO ||'#39' '#39'||  TE.NUMDOCUMEN' +
        'TO))) AS ESTADUALMUNICIPAL,'
      
        '  ((decode(p.FlgDesconto,0,h.VALORPROVENTO,0)) - (decode(p.FlgDe' +
        'sconto,1,h.VALORPROVENTO,0))) as Liquido,'
      '  MO.DESCRICAO as MotivoFolha,'
      
        '  rtrim(end.logradouro) || '#39' n: '#39'|| end.numero || '#39', '#39' || rtrim(' +
        'end.complemento) || '#39' - '#39' ||  rtrim(end.bairro) || '#39' - '#39' || rtri' +
        'm(end.cidade) || '#39' - '#39' || end.codestado || '#39' - CEP:  '#39' || end.ce' +
        'p as endereco,'
      
        '  RTRIM(DECODE(H.REFERENCIA,'#39'***'#39','#39'RECIBO DE PAGAMENTO NORMAL'#39','#39 +
        'RECIBO DE PAGAMENTO DE 13º SÁLARIO'#39')) AS NOMERELAT'
      'FROM'
      
        '  PESSOA PJ, PESSOA PF, FUNCIONARIO FUNC,TIPODOCPESSOA TD,  DOCP' +
        'ESSOA D, DOCPESSOA DO, TIPODOCOFICIAL TDO, ENDPESS END, MOTIVO M' +
        'O,'
      
        '  HISTRUBSAL H,DOCUMENTO DOC, PROVDESC P,  RUBRICAXPESS RP, CARG' +
        'O C,CENTCUST CC, RUBRICAINDIV RB, PARAMRH PR,'
      '  (SELECT D.IDPESSOA, TD.CODDOCUMENTO,'
      
        '     SUBSTR(D.NUMDOCUMENTO,1,2) ||'#39'.'#39'|| SUBSTR(D.NUMDOCUMENTO,3,' +
        '3) ||'#39'.'#39'|| SUBSTR(D.NUMDOCUMENTO,6,3) AS NUMDOCUMENTO,'
      '    TD.SIGLADOCUMENTO'
      '    FROM DOCPESSOA D, TIPODOCOFICIAL TD'
      '    WHERE'
      '       (TD.CODDOCUMENTO = 7) AND'
      '       (D.IDDOCUMENTO = TD.IDDOCUMENTO)) TE,'
      '  (SELECT'
      
        '   D.IDPESSOA, TD.CODDOCUMENTO, D.NUMDOCUMENTO, TD.SIGLADOCUMENT' +
        'O'
      'FROM DOCPESSOA D, TIPODOCOFICIAL TD'
      '    WHERE'
      '       (TD.CODDOCUMENTO = 8) AND'
      '       (D.IDDOCUMENTO = TD.IDDOCUMENTO)) TE1,'
      '  (SELECT H.IDPESSOA,H.VALORPROVENTO, P.CODRUBCLT'
      '     FROM HISTRUBSAL H, PROVDESC P'
      '     WHERE'
      
        '        ((DECODE(P.CODRUBCLT,00001,H.VALORPROVENTO)-DECODE(P.COD' +
        'RUBCLT,00029,H.VALORPROVENTO)) < 1) AND'
      '        (H.IDRUBRICA = P.IDPROVENTO)) TESTE'
      'WHERE'
      '  (TDO.CODDOCUMENTO = 1) AND'
      '  (TD.IDDOCUMENTO = 7) AND'
      
        '  ((FUNC.TIPOCONTRATO = '#39'E'#39') OR (FUNC.TIPOCONTRATO = '#39'T'#39') OR (FU' +
        'NC.TIPOCONTRATO = '#39'G'#39')) AND'
      '  ((H.REFERENCIA = '#39'***'#39') OR (H.REFERENCIA = '#39'13.o Salar'#39')) AND'
      
        '  (SUBSTR(H.MES,6,7) ||'#39'/'#39'|| SUBSTR(H.MES,3,2) >= SUBSTR(PR.NORM' +
        'ALINI,4,10)) AND'
      
        '  (SUBSTR(H.MES,6,7) ||'#39'/'#39'|| SUBSTR(H.MES,3,2) <= SUBSTR(PR.NORM' +
        'ALFIM,4,10)) AND'
      '  (PJ.IDPESSOA = TE.IDPESSOA) AND'
      '  (PJ.IDPESSOA = TE1.IDPESSOA) AND'
      '  (D.IDPESSOA = PF.IDPESSOA) AND'
      '  (TD.IDDOCUMENTO = D.IDDOCUMENTO) AND'
      '  (PJ.IDPESSOA = FUNC.IDESTAB) AND'
      '  (PF.IDPESSOA = FUNC.IDPESSOA) AND'
      '  (PF.IDPESSOA = :IDPESSOA) AND'
      '  (PJ.IDPESSOA = DO.IDPESSOA) AND'
      '  (DO.IDDOCUMENTO = TDO.IDDOCUMENTO) AND'
      '  (PJ.IDPESSOA = END.IDPESSOA) AND'
      '  (H.IDPESSOA = PF.IDPESSOA) AND'
      '  (TESTE.IDPESSOA(+) = PF.IDPESSOA) AND'
      '  (DOC.IDPESSOA(+) = PJ.IDPESSOA) AND'
      '  (C.IDCARGO = FUNC.IDCARGO) AND'
      '  (FUNC.IDEMPRESA = CC.IDEMPRESA) AND'
      '  (FUNC.CODCENTROCUSTO = CC.CODCENTROCUSTO) AND'
      '  (H.IDMOTIVO = MO.IDMOTIVO) AND'
      '  (H.IDMOTIVO = PR.IDMOTIVO) AND'
      '  (H.IDRUBRICA = P.IDPROVENTO) AND'
      '  (H.IDRUBRICA = RP.IDRUBRICA) AND'
      '  (RP.IDPESSOA  = FUNC.IDEMPRESA) AND'
      '  (RB.IDPESSOA(+) = H.IDPESSOA)'
      'ORDER BY EMPREGADO, NOMERELAT')
    ValidateWithMask = True
    Left = 129
    Top = 27
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryProventos: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = ds
    SQL.Strings = (
      'SELECT'
      '  PJ.NOME AS EMPRESA,'
      '  PF.NOME AS EMPREGADO,'
      '  FUNC.IDAGENCIAFGTS,'
      '  FUNC.NUMCONTAFGTS,'
      '  FUNC.MATRICULA,'
      '  TO_CHAR(SYSDATE,'#39'DD/MM/YYYY'#39') DATA,'
      '  C.TITULO,'
      '  RP.CODPROVDESC AS CODRUBRICA,'
      '  RP.DESCRPROVDESC AS RUBRICA,'
      '  RB.VALORRUBRICA,'
      '  CC.NOME CCUSTO,'
      
        '  RTRIM(DECODE(DECODE(TDO.SIGLADOCUMENTO,'#39'CGC:'#39','#39'Inscrição'#39' ||'#39' ' +
        #39'|| TDO.SIGLADOCUMENTO ||'#39' '#39'|| (SUBSTR(DO.NUMDOCUMENTO,1,2) ||'#39'.' +
        #39'|| SUBSTR(DO.NUMDOCUMENTO,3,3) ||'#39'.'#39'|| SUBSTR(DO.NUMDOCUMENTO,6' +
        ',3) ||'#39'/'#39'|| SUBSTR(DO.NUMDOCUMENTO,9,4) ||'#39'-'#39'||  SUBSTR(DO.NUMDO' +
        'CUMENTO,13,2))),'#39#39',DECODE(TDO.SIGLADOCUMENTO,'#39'CPF:'#39','#39'Inscriçào'#39' ' +
        '||'#39' '#39'|| TDO.SIGLADOCUMENTO ||'#39' '#39'||   SUBSTR(DO.NUMDOCUMENTO,1,3)' +
        ' ||'#39'.'#39'|| SUBSTR(DO.NUMDOCUMENTO,3,3) ||'#39'.'#39'|| SUBSTR(DO.NUMDOCUME' +
        'NTO,6,3) ||'#39'-'#39'|| SUBSTR(DO.NUMDOCUMENTO,9,2)),DECODE(TDO.SIGLADO' +
        'CUMENTO,'#39'CGC:'#39','#39'Inscrição'#39' ||'#39' '#39'|| TDO.SIGLADOCUMENTO ||'#39' '#39'||   ' +
        ' SUBSTR(DO.NUMDOCUMENTO,1,2) ||'#39'.'#39'|| SUBSTR(DO.NUMDOCUMENTO,3,3)' +
        ' ||'#39'.'#39'|| SUBSTR(DO.NUMDOCUMENTO,6,3) ||'#39'/'#39'|| SUBSTR(DO.NUMDOCUME' +
        'NTO,9,4) ||'#39'-'#39'||  SUBSTR(DO.NUMDOCUMENTO,13,2)))) AS CGCCPF,'
      
        '  RTRIM(DECODE(DECODE(TE.SIGLADOCUMENTO,'#39'ESTADUAL'#39','#39'Inscrição'#39' |' +
        '|'#39' '#39'|| TE.SIGLADOCUMENTO ||'#39' '#39'||  TE.NUMDOCUMENTO),'#39#39',DECODE(TE1' +
        '.SIGLADOCUMENTO,'#39'MUNICIPAL'#39','#39'Inscrição'#39' ||'#39' '#39'|| TE1.SIGLADOCUMEN' +
        'TO ||'#39' '#39'||  TE1.NUMDOCUMENTO)  ,DECODE(TE.SIGLADOCUMENTO,'#39'ESTADU' +
        'AL'#39','#39'Inscrição'#39' ||'#39' '#39'|| TE.SIGLADOCUMENTO ||'#39' '#39'||  TE.NUMDOCUMEN' +
        'TO))) AS ESTADUALMUNICIPAL,'
      
        '  ((decode(p.FlgDesconto,0,h.VALORPROVENTO,0)) - (decode(p.FlgDe' +
        'sconto,1,h.VALORPROVENTO,0))) as Liquido,'
      '  MO.DESCRICAO as MotivoFolha,'
      
        '  rtrim(end.logradouro) || '#39' n: '#39'|| end.numero || '#39', '#39' || rtrim(' +
        'end.complemento) || '#39' - '#39' ||  rtrim(end.bairro) || '#39' - '#39' || rtri' +
        'm(end.cidade) || '#39' - '#39' || end.codestado || '#39' - CEP:  '#39' || end.ce' +
        'p as endereco,'
      
        '  RTRIM(DECODE(H.REFERENCIA,'#39'***'#39','#39'RECIBO DE PAGAMENTO NORMAL'#39','#39 +
        'RECIBO DE PAGAMENTO DE 13º SÁLARIO'#39')) AS NOMERELAT'
      'FROM'
      
        '  PESSOA PJ, PESSOA PF, FUNCIONARIO FUNC,TIPODOCPESSOA TD,  DOCP' +
        'ESSOA D, DOCPESSOA DO, TIPODOCOFICIAL TDO, ENDPESS END, MOTIVO M' +
        'O,'
      
        '  HISTRUBSAL H,DOCUMENTO DOC, PROVDESC P,  RUBRICAXPESS RP, CARG' +
        'O C,CENTCUST CC, RUBRICAINDIV RB, PARAMRH PR,'
      '  (SELECT D.IDPESSOA, TD.CODDOCUMENTO,'
      
        '     SUBSTR(D.NUMDOCUMENTO,1,2) ||'#39'.'#39'|| SUBSTR(D.NUMDOCUMENTO,3,' +
        '3) ||'#39'.'#39'|| SUBSTR(D.NUMDOCUMENTO,6,3) AS NUMDOCUMENTO,'
      '    TD.SIGLADOCUMENTO'
      '    FROM DOCPESSOA D, TIPODOCOFICIAL TD'
      '    WHERE'
      '       (TD.CODDOCUMENTO = 7) AND'
      '       (D.IDDOCUMENTO = TD.IDDOCUMENTO)) TE,'
      '  (SELECT'
      
        '   D.IDPESSOA, TD.CODDOCUMENTO, D.NUMDOCUMENTO, TD.SIGLADOCUMENT' +
        'O'
      'FROM DOCPESSOA D, TIPODOCOFICIAL TD'
      '    WHERE'
      '       (TD.CODDOCUMENTO = 8) AND'
      '       (D.IDDOCUMENTO = TD.IDDOCUMENTO)) TE1,'
      '  (SELECT H.IDPESSOA,H.VALORPROVENTO, P.CODRUBCLT'
      '     FROM HISTRUBSAL H, PROVDESC P'
      '     WHERE'
      
        '        ((DECODE(P.CODRUBCLT,00001,H.VALORPROVENTO)-DECODE(P.COD' +
        'RUBCLT,00029,H.VALORPROVENTO)) < 1) AND'
      '        (H.IDRUBRICA = P.IDPROVENTO)) TESTE'
      'WHERE'
      '  (TDO.CODDOCUMENTO = 1) AND'
      '  (TD.IDDOCUMENTO = 7) AND'
      
        '  ((FUNC.TIPOCONTRATO = '#39'E'#39') OR (FUNC.TIPOCONTRATO = '#39'T'#39') OR (FU' +
        'NC.TIPOCONTRATO = '#39'G'#39')) AND'
      '  ((H.REFERENCIA = '#39'***'#39') OR (H.REFERENCIA = '#39'13.o Salar'#39')) AND'
      
        '  (SUBSTR(H.MES,6,7) ||'#39'/'#39'|| SUBSTR(H.MES,3,2) >= SUBSTR(PR.NORM' +
        'ALINI,4,10)) AND'
      
        '  (SUBSTR(H.MES,6,7) ||'#39'/'#39'|| SUBSTR(H.MES,3,2) <= SUBSTR(PR.NORM' +
        'ALFIM,4,10)) AND'
      '  (PJ.IDPESSOA = TE.IDPESSOA) AND'
      '  (PJ.IDPESSOA = TE1.IDPESSOA) AND'
      '  (D.IDPESSOA = PF.IDPESSOA) AND'
      '  (TD.IDDOCUMENTO = D.IDDOCUMENTO) AND'
      '  (PJ.IDPESSOA = FUNC.IDESTAB) AND'
      '  (PF.IDPESSOA = FUNC.IDPESSOA) AND'
      '  (PF.IDPESSOA = :IDPESSOA) AND'
      '  (PJ.IDPESSOA = DO.IDPESSOA) AND'
      '  (DO.IDDOCUMENTO = TDO.IDDOCUMENTO) AND'
      '  (PJ.IDPESSOA = END.IDPESSOA) AND'
      '  (H.IDPESSOA = PF.IDPESSOA) AND'
      '  (TESTE.IDPESSOA(+) = PF.IDPESSOA) AND'
      '  (DOC.IDPESSOA(+) = PJ.IDPESSOA) AND'
      '  (C.IDCARGO = FUNC.IDCARGO) AND'
      '  (FUNC.IDEMPRESA = CC.IDEMPRESA) AND'
      '  (FUNC.CODCENTROCUSTO = CC.CODCENTROCUSTO) AND'
      '  (H.IDMOTIVO = MO.IDMOTIVO) AND'
      '  (H.IDMOTIVO = PR.IDMOTIVO) AND'
      '  (H.IDRUBRICA = P.IDPROVENTO) AND'
      '  (H.IDRUBRICA = RP.IDRUBRICA) AND'
      '  (RP.IDPESSOA  = FUNC.IDEMPRESA) AND'
      '  (RB.IDPESSOA(+) = H.IDPESSOA)'
      'ORDER BY EMPREGADO, NOMERELAT')
    ValidateWithMask = True
    Left = 129
    Top = 14
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object GImp: TGImp
    DataBaseName = 'BASEDADOS'
    TipoFonte = TfNormal
    MostraPrinterSetup = True
    EjetarPagina = False
    Condensado = True
    Sublinhado = False
    SaltodeLinhaCondensado = True
    RegConfigImpressora.ValueNameId = 'IdImpressora'
    RegConfigImpressora.ValueNamePrinter = 'Impressora\Porta'
    Left = 416
    Top = 282
  end
  object SaveDialog: TSaveDialog
    DefaultExt = 'TXT'
    FileName = 'DemPag.TXT'
    Filter = 'Arquivo Texto (*.TXT)|*.TXT'
    Left = 416
    Top = 269
  end
  object opnpicDoc: TOpenPictureDialog
    DefaultExt = '*.bmp'
    Filter = 
      'Arquivos PRN (*.prn)|*.prn|Todos os Arquivos (*.*)|*.*|Bitmaps (' +
      '*.bmp)|*.bmp'
    Options = [ofExtensionDifferent, ofPathMustExist]
    Left = 416
    Top = 256
  end
  object OpenAplicativo: TOpenDialog
    Left = 416
    Top = 244
  end
  object PrintDialogo: TPrintDialog
    PrintToFile = True
    Left = 416
    Top = 230
  end
  object qryBaseFGTS: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = ds
    ValidateWithMask = True
    Left = 197
    Top = 14
  end
  object qryMargem2: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = ds
    SQL.Strings = (
      'SELECT'
      '  PJ.NOME AS EMPRESA,'
      '  PF.NOME AS EMPREGADO,'
      '  FUNC.IDAGENCIAFGTS,'
      '  FUNC.NUMCONTAFGTS,'
      '  FUNC.MATRICULA,'
      '  TO_CHAR(SYSDATE,'#39'DD/MM/YYYY'#39') DATA,'
      '  C.TITULO,'
      '  RP.CODPROVDESC AS CODRUBRICA,'
      '  RP.DESCRPROVDESC AS RUBRICA,'
      '  RB.VALORRUBRICA,'
      '  CC.NOME CCUSTO,'
      
        '  RTRIM(DECODE(DECODE(TDO.SIGLADOCUMENTO,'#39'CGC:'#39','#39'Inscrição'#39' ||'#39' ' +
        #39'|| TDO.SIGLADOCUMENTO ||'#39' '#39'|| (SUBSTR(DO.NUMDOCUMENTO,1,2) ||'#39'.' +
        #39'|| SUBSTR(DO.NUMDOCUMENTO,3,3) ||'#39'.'#39'|| SUBSTR(DO.NUMDOCUMENTO,6' +
        ',3) ||'#39'/'#39'|| SUBSTR(DO.NUMDOCUMENTO,9,4) ||'#39'-'#39'||  SUBSTR(DO.NUMDO' +
        'CUMENTO,13,2))),'#39#39',DECODE(TDO.SIGLADOCUMENTO,'#39'CPF:'#39','#39'Inscriçào'#39' ' +
        '||'#39' '#39'|| TDO.SIGLADOCUMENTO ||'#39' '#39'||   SUBSTR(DO.NUMDOCUMENTO,1,3)' +
        ' ||'#39'.'#39'|| SUBSTR(DO.NUMDOCUMENTO,3,3) ||'#39'.'#39'|| SUBSTR(DO.NUMDOCUME' +
        'NTO,6,3) ||'#39'-'#39'|| SUBSTR(DO.NUMDOCUMENTO,9,2)),DECODE(TDO.SIGLADO' +
        'CUMENTO,'#39'CGC:'#39','#39'Inscrição'#39' ||'#39' '#39'|| TDO.SIGLADOCUMENTO ||'#39' '#39'||   ' +
        ' SUBSTR(DO.NUMDOCUMENTO,1,2) ||'#39'.'#39'|| SUBSTR(DO.NUMDOCUMENTO,3,3)' +
        ' ||'#39'.'#39'|| SUBSTR(DO.NUMDOCUMENTO,6,3) ||'#39'/'#39'|| SUBSTR(DO.NUMDOCUME' +
        'NTO,9,4) ||'#39'-'#39'||  SUBSTR(DO.NUMDOCUMENTO,13,2)))) AS CGCCPF,'
      
        '  RTRIM(DECODE(DECODE(TE.SIGLADOCUMENTO,'#39'ESTADUAL'#39','#39'Inscrição'#39' |' +
        '|'#39' '#39'|| TE.SIGLADOCUMENTO ||'#39' '#39'||  TE.NUMDOCUMENTO),'#39#39',DECODE(TE1' +
        '.SIGLADOCUMENTO,'#39'MUNICIPAL'#39','#39'Inscrição'#39' ||'#39' '#39'|| TE1.SIGLADOCUMEN' +
        'TO ||'#39' '#39'||  TE1.NUMDOCUMENTO)  ,DECODE(TE.SIGLADOCUMENTO,'#39'ESTADU' +
        'AL'#39','#39'Inscrição'#39' ||'#39' '#39'|| TE.SIGLADOCUMENTO ||'#39' '#39'||  TE.NUMDOCUMEN' +
        'TO))) AS ESTADUALMUNICIPAL,'
      
        '  ((decode(p.FlgDesconto,0,h.VALORPROVENTO,0)) - (decode(p.FlgDe' +
        'sconto,1,h.VALORPROVENTO,0))) as Liquido,'
      '  MO.DESCRICAO as MotivoFolha,'
      
        '  rtrim(end.logradouro) || '#39' n: '#39'|| end.numero || '#39', '#39' || rtrim(' +
        'end.complemento) || '#39' - '#39' ||  rtrim(end.bairro) || '#39' - '#39' || rtri' +
        'm(end.cidade) || '#39' - '#39' || end.codestado || '#39' - CEP:  '#39' || end.ce' +
        'p as endereco,'
      
        '  RTRIM(DECODE(H.REFERENCIA,'#39'***'#39','#39'RECIBO DE PAGAMENTO NORMAL'#39','#39 +
        'RECIBO DE PAGAMENTO DE 13º SÁLARIO'#39')) AS NOMERELAT'
      'FROM'
      
        '  PESSOA PJ, PESSOA PF, FUNCIONARIO FUNC,TIPODOCPESSOA TD,  DOCP' +
        'ESSOA D, DOCPESSOA DO, TIPODOCOFICIAL TDO, ENDPESS END, MOTIVO M' +
        'O,'
      
        '  HISTRUBSAL H,DOCUMENTO DOC, PROVDESC P,  RUBRICAXPESS RP, CARG' +
        'O C,CENTCUST CC, RUBRICAINDIV RB, PARAMRH PR,'
      '  (SELECT D.IDPESSOA, TD.CODDOCUMENTO,'
      
        '     SUBSTR(D.NUMDOCUMENTO,1,2) ||'#39'.'#39'|| SUBSTR(D.NUMDOCUMENTO,3,' +
        '3) ||'#39'.'#39'|| SUBSTR(D.NUMDOCUMENTO,6,3) AS NUMDOCUMENTO,'
      '    TD.SIGLADOCUMENTO'
      '    FROM DOCPESSOA D, TIPODOCOFICIAL TD'
      '    WHERE'
      '       (TD.CODDOCUMENTO = 7) AND'
      '       (D.IDDOCUMENTO = TD.IDDOCUMENTO)) TE,'
      '  (SELECT'
      
        '   D.IDPESSOA, TD.CODDOCUMENTO, D.NUMDOCUMENTO, TD.SIGLADOCUMENT' +
        'O'
      'FROM DOCPESSOA D, TIPODOCOFICIAL TD'
      '    WHERE'
      '       (TD.CODDOCUMENTO = 8) AND'
      '       (D.IDDOCUMENTO = TD.IDDOCUMENTO)) TE1,'
      '  (SELECT H.IDPESSOA,H.VALORPROVENTO, P.CODRUBCLT'
      '     FROM HISTRUBSAL H, PROVDESC P'
      '     WHERE'
      
        '        ((DECODE(P.CODRUBCLT,00001,H.VALORPROVENTO)-DECODE(P.COD' +
        'RUBCLT,00029,H.VALORPROVENTO)) < 1) AND'
      '        (H.IDRUBRICA = P.IDPROVENTO)) TESTE'
      'WHERE'
      '  (TDO.CODDOCUMENTO = 1) AND'
      '  (TD.IDDOCUMENTO = 7) AND'
      
        '  ((FUNC.TIPOCONTRATO = '#39'E'#39') OR (FUNC.TIPOCONTRATO = '#39'T'#39') OR (FU' +
        'NC.TIPOCONTRATO = '#39'G'#39')) AND'
      '  ((H.REFERENCIA = '#39'***'#39') OR (H.REFERENCIA = '#39'13.o Salar'#39')) AND'
      
        '  (SUBSTR(H.MES,6,7) ||'#39'/'#39'|| SUBSTR(H.MES,3,2) >= SUBSTR(PR.NORM' +
        'ALINI,4,10)) AND'
      
        '  (SUBSTR(H.MES,6,7) ||'#39'/'#39'|| SUBSTR(H.MES,3,2) <= SUBSTR(PR.NORM' +
        'ALFIM,4,10)) AND'
      '  (PJ.IDPESSOA = TE.IDPESSOA) AND'
      '  (PJ.IDPESSOA = TE1.IDPESSOA) AND'
      '  (D.IDPESSOA = PF.IDPESSOA) AND'
      '  (TD.IDDOCUMENTO = D.IDDOCUMENTO) AND'
      '  (PJ.IDPESSOA = FUNC.IDESTAB) AND'
      '  (PF.IDPESSOA = FUNC.IDPESSOA) AND'
      '  (PF.IDPESSOA = :IDPESSOA) AND'
      '  (PJ.IDPESSOA = DO.IDPESSOA) AND'
      '  (DO.IDDOCUMENTO = TDO.IDDOCUMENTO) AND'
      '  (PJ.IDPESSOA = END.IDPESSOA) AND'
      '  (H.IDPESSOA = PF.IDPESSOA) AND'
      '  (TESTE.IDPESSOA(+) = PF.IDPESSOA) AND'
      '  (DOC.IDPESSOA(+) = PJ.IDPESSOA) AND'
      '  (C.IDCARGO = FUNC.IDCARGO) AND'
      '  (FUNC.IDEMPRESA = CC.IDEMPRESA) AND'
      '  (FUNC.CODCENTROCUSTO = CC.CODCENTROCUSTO) AND'
      '  (H.IDMOTIVO = MO.IDMOTIVO) AND'
      '  (H.IDMOTIVO = PR.IDMOTIVO) AND'
      '  (H.IDRUBRICA = P.IDPROVENTO) AND'
      '  (H.IDRUBRICA = RP.IDRUBRICA) AND'
      '  (RP.IDPESSOA  = FUNC.IDEMPRESA) AND'
      '  (RB.IDPESSOA(+) = H.IDPESSOA)'
      'ORDER BY EMPREGADO, NOMERELAT')
    ValidateWithMask = True
    Left = 197
    Top = 100
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
end
