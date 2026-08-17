inherited FrmMTMontaProcesso: TFrmMTMontaProcesso
  Left = 108
  Top = 136
  HelpContext = 1130010
  Caption = 'Montagem do Processo de Compra'
  ClientHeight = 442
  ClientWidth = 768
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 768
    Height = 356
    object plnComp: TPanel
      Left = 1
      Top = 101
      Width = 766
      Height = 254
      Align = alClient
      BevelOuter = bvNone
      Caption = 'plnComp'
      TabOrder = 0
      object plnOpItem: TPanel
        Left = 724
        Top = 0
        Width = 42
        Height = 254
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 0
        object BtnRemove: TSpeedButton
          Left = 7
          Top = 136
          Width = 30
          Height = 41
          Hint = 'Remove os Itens'
          Flat = True
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            8888888888FFFFF8888888888000008888888888F777778FF888888006666600
            88888887788888778F8888766666666608888878888FFF8878F887E666FFF666
            608887F888777F8887F887E666FFF6666088878888777F88878F7E6666FFF666
            66087F8888777F88887F7E6666FFF66666087F8888777FFFF87F7E6FFFFFFFFF
            66087F8777777777887F7E66FFFFFFF666087F8877777778887F7E666FFFFF66
            660878F887777788887887E666FFF666608887F88877788887F887E6666F6666
            6088878F888788888788887EE666666608888878FF888888788888877EEEEE77
            8888888778FFFF77888888888777778888888888877777888888}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          OnClick = BtnRemoveClick
        end
        object BtnAdiciona: TSpeedButton
          Left = 7
          Top = 48
          Width = 30
          Height = 41
          Hint = 'Adiciona os Itens'
          Flat = True
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            8888888888FFFFF8888888888777778888888888F777778FF888888776666677
            88888887788888778F88887666666666088888788888F88878F887E6666F6666
            608887F888878F8887F887E666FFF66660888788887778F8878F7E666FFFFF66
            66087F888777778F887F7E66FFFFFFF666087F8877777778F87F7E6FFFFFFFFF
            66087F8777777777887F7E6666FFF66666087F8888777F88887F7E6666FFF666
            660878F888777F88887887E666FFF666608887F888777F8887F887E666FFF666
            6088878F887778888788887EE666666608888878FF888888788888800EEEEE00
            8888888778FFFF77888888888000008888888888877777888888}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          OnClick = BtnAdicionaClick
        end
      end
      object Panel7: TPanel
        Left = 0
        Top = 0
        Width = 724
        Height = 254
        Align = alClient
        BevelOuter = bvNone
        Caption = 'Panel7'
        TabOrder = 1
        object Splitter1: TSplitter
          Left = 0
          Top = 104
          Width = 724
          Height = 7
          Cursor = crVSplit
          Align = alTop
        end
        object Panel4: TPanel
          Left = 0
          Top = 0
          Width = 724
          Height = 104
          Align = alTop
          BevelOuter = bvNone
          Caption = 'Panel3'
          TabOrder = 0
          object Panel5: TPanel
            Left = 0
            Top = 0
            Width = 26
            Height = 104
            Align = alLeft
            BevelInner = bvLowered
            Caption = 'Panel5'
            Color = clGray
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -16
            Font.Name = 'Arial'
            Font.Style = [fsBold, fsItalic]
            ParentFont = False
            TabOrder = 0
            object fcLabel2: TfcLabel
              Left = 2
              Top = 2
              Width = 22
              Height = 100
              Align = alClient
              Caption = 'Itens Pendentes'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = [fsBold, fsItalic]
              ParentFont = False
              TextOptions.Alignment = taLeftJustify
              TextOptions.Rotation = 90
              TextOptions.VAlignment = vaTop
            end
          end
          object grdItem: TwwDBGrid
            Left = 26
            Top = 0
            Width = 698
            Height = 104
            Selected.Strings = (
              'NUMSOLCOMPRA'#9'10'#9'Nº da S.C.I.'
              'CODARTIGO'#9'14'#9'Código'
              'CODMEDIDA'#9'4'#9'Unid.'
              'QTDEPEDIDA'#9'10'#9'Qtde. Pedida'
              'DESCRICAO'#9'60'#9'Descrição'
              'DATAENTREGA'#9'10'#9'Necessidade')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            BorderStyle = bsNone
            Ctl3D = True
            DataSource = dsItens
            MultiSelectOptions = [msoAutoUnselect, msoShiftSelect]
            Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgMultiSelect]
            ParentCtl3D = False
            TabOrder = 1
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
        end
        object Panel3: TPanel
          Left = 0
          Top = 111
          Width = 724
          Height = 143
          Align = alClient
          BevelOuter = bvNone
          Caption = 'Panel3'
          TabOrder = 1
          object Panel2: TPanel
            Left = 0
            Top = 0
            Width = 26
            Height = 143
            Align = alLeft
            BevelInner = bvLowered
            Caption = 'Panel2'
            Color = clGray
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -16
            Font.Name = 'Arial'
            Font.Style = [fsBold, fsItalic]
            ParentFont = False
            TabOrder = 0
            object fcLabel1: TfcLabel
              Left = 2
              Top = 2
              Width = 22
              Height = 139
              Align = alClient
              Caption = 'Itens Atribuidos'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = [fsBold, fsItalic]
              ParentFont = False
              TextOptions.Alignment = taLeftJustify
              TextOptions.Rotation = 90
              TextOptions.VAlignment = vaTop
            end
          end
          object GrdItemAtrib: TwwDBGrid
            Left = 26
            Top = 0
            Width = 698
            Height = 143
            Hint = 'Duplo Click para Indicar Fornecedores'
            Selected.Strings = (
              'NUMSOLCOMPRA'#9'10'#9'Nº da S.C.I.'
              'CODARTIGO'#9'14'#9'Código'
              'CODMEDIDA'#9'4'#9'Unid.'
              'QTDEPEDIDA'#9'10'#9'Qtde. Pedida'
              'DESCRICAO'#9'60'#9'Descrição'
              'DATAENTREGA'#9'10'#9'Necessidade')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            BorderStyle = bsNone
            Ctl3D = True
            DataSource = dsItensAtrib
            MultiSelectOptions = [msoAutoUnselect, msoShiftSelect]
            Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgMultiSelect]
            ParentCtl3D = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            OnDblClick = GrdItemAtribDblClick
            IndicatorColor = icBlack
          end
        end
      end
    end
    object plnSel: TPanel
      Left = 1
      Top = 1
      Width = 766
      Height = 100
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object Label1: TLabel
        Left = 8
        Top = 8
        Width = 69
        Height = 13
        Caption = 'Nº da S.C.I.'
      end
      object Label3: TLabel
        Left = 8
        Top = 48
        Width = 34
        Height = 13
        Caption = 'Artigo'
      end
      object Label2: TLabel
        Left = 168
        Top = 8
        Width = 107
        Height = 13
        Caption = 'Grupo de Produtos'
      end
      object Label4: TLabel
        Left = 384
        Top = 48
        Width = 74
        Height = 13
        Caption = 'Necessidade'
      end
      object Bevel6: TBevel
        Left = 638
        Top = 3
        Width = 110
        Height = 87
        Shape = bsLeftLine
      end
      object BtnSelecinar: TSpeedButton
        Left = 646
        Top = 5
        Width = 98
        Height = 41
        Caption = '&Selecionar'
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
          777777777777F88F7777777777700F077777777777F8878F77777777700FFF07
          77777777F8877787F77777700FFFFFF077777778877777F8F7777778FFFFFCF0
          77777F78F77FF8787F771778FFCCCFFF07778FF87F88877F8F7711778FFFFFCF
          077788FF8F77FF8787F711178FFCCCFFF077888F8FF88877F87F71110000FFFC
          FF07788888887FF877877710E7E706CFFFF077887777888777F8770E7E7E70FF
          F887778F777778F7F8877707E7E7E0F88777778F777778F88777770E7E7E7087
          7777778F7777788777777707E7E7E07777777787F7777877777777707E7E0777
          777777787FFF8777777777770000777777777777888877777777}
        Margin = 7
        NumGlyphs = 2
        OnClick = BtnSelecinarClick
      end
      object BtnLimpar: TSpeedButton
        Left = 646
        Top = 47
        Width = 98
        Height = 41
        Caption = '&Limpar'
        Flat = True
        Glyph.Data = {
          66010000424D6601000000000000760000002800000012000000140000000100
          040000000000F000000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          888888000000888888078888888888000000888880D078888888880000008888
          0DD507888888880000008880DD705078888888000000880DD7DD050788888800
          000080DD7DDDD05078888800000080D7DDDDDD05078888000000807DDDDDDDD0
          607888000000880DDDDDDDDD0607880000008880DDDDDDD7E060780000008888
          0DDDDD7E6E0608000000888880DDD7E6E6E0080000008888880D7E6E6E6E0800
          000088888880E6E6E6E088000000888888880E6E6E08880000008888888880E6
          E0888800000088888888880E0888880000008888888888808888880000008888
          88888888888888000000}
        Margin = 7
        OnClick = BtnLimparClick
      end
      object dblcSCI: TCMDBLookupCombo
        Left = 8
        Top = 24
        Width = 153
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NUMSOLCOMPRA'#9'10'#9'Nº da SCI')
        LookupTable = cdsSCI
        LookupField = 'NUMSOLCOMPRA'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object dblcArt: TwwDBLookupCombo
        Left = 8
        Top = 64
        Width = 369
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'50'#9'Descrição'
          'CODARTIGO'#9'14'#9'Código')
        LookupTable = cdsArtigo
        LookupField = 'CODARTIGO'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object dblcGrupo: TCMDBLookupCombo
        Left = 168
        Top = 24
        Width = 345
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCGRUPOPROD'#9'30'#9'Descrição')
        LookupTable = cdsGrupoProd
        LookupField = 'CODGRUPOPROD'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object edDataNec: TCMDateTimePicker
        Left = 384
        Top = 64
        Width = 129
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
        TabOrder = 3
      end
      object RgEmpresa: TRadioGroup
        Left = 520
        Top = 6
        Width = 113
        Height = 80
        Caption = ' Pela Empresa '
        ItemIndex = 0
        Items.Strings = (
          'Login'
          'Todas')
        TabOrder = 4
      end
    end
  end
  inherited Dock972: TDock97
    Width = 768
    object Label5: TLabel [0]
      Left = 504
      Top = 16
      Width = 96
      Height = 16
      Caption = 'Processo Nº :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object edProc: TDBEdit
      Left = 608
      Top = 16
      Width = 145
      Height = 21
      TabStop = False
      Color = clGray
      DataField = 'CODPROCESSO'
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
  end
  inherited Dock971: TDock97
    Top = 403
    Width = 768
    inherited tb97Fundo: TToolbar97
      Left = 596
      DockPos = 679
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 1130010
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 427
      DockPos = 510
    end
  end
  object twAtribForn: TToolWindow97 [3]
    Left = 80
    Top = 64
    Caption = 'Atribuição de Fornecedor'
    ClientAreaHeight = 275
    ClientAreaWidth = 459
    DockableTo = []
    Resizable = False
    TabOrder = 3
    UseLastDock = False
    Visible = False
    OnVisibleChanged = twAtribFornVisibleChanged
    object Panel1: TPanel
      Left = 0
      Top = 0
      Width = 459
      Height = 33
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object btnMarcaTodos: TSpeedButton
        Left = 32
        Top = 0
        Width = 32
        Height = 32
        Hint = 'Marca todos os Fornecedores '
        AllowAllUp = True
        Flat = True
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
        ParentShowHint = False
        ShowHint = True
        OnClick = btnMarcaTodosClick
      end
      object btnInvertSel: TSpeedButton
        Left = 64
        Top = 0
        Width = 32
        Height = 32
        Hint = 'Inverter a seleção dos Fornecedor'
        AllowAllUp = True
        Flat = True
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
        ParentShowHint = False
        ShowHint = True
        OnClick = btnInvertSelClick
      end
      object btnAddFornecedor: TSpeedButton
        Left = 96
        Top = 0
        Width = 32
        Height = 32
        Hint = 'Adicionar um Novo Fornecedor'
        Flat = True
        Glyph.Data = {
          36010000424D3601000000000000760000002800000011000000100000000100
          040000000000C000000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00880008888880
          008880000000800800888800800880000000000800000000800080000000000F
          00666000F007000000000E000E6E6040004F0000000006E6E6E6E04444470000
          00000E6E6E6E6044444C0000000006E6E6E6E00000C0800000000E6E6E6E60FF
          FF088000000006E6E6E6E0F8FB88800000000E6E6E6E600B0B8B8000000006E6
          E6E6E088BBB8800000000E6E6E6E60BBBBBBB0000000000000000088BBB88000
          000088888888888B8B8B800000008888888888888B8880000000}
        Layout = blGlyphTop
        ParentShowHint = False
        ShowHint = True
        OnClick = btnAddFornecedorClick
      end
      object btnCopiaSel: TSpeedButton
        Left = 128
        Top = 0
        Width = 32
        Height = 32
        Hint = 
          'Copiar a Seleção de Fornecedores deste artigo para todos os outr' +
          'os'
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          77777777777FFFFFFFFF7777770000000007777777888888888F777777877777
          77077777778F7777778F7777778FFFFFF7077777778F7777778F7777778FCCCC
          F70777FFFF8F7777778F7000008FFFFFF7077888888F7777778F7877778FCCCC
          F70778F7778F7777778F78FFFF8FFFFFF70778F7778F7777FF8F78FCCC8FCCF0
          000778F7778F7778888778FFFF8FFFF7F87778F7778F7778F87778FCCC8FFFF7
          877778F7778FFFF8877778FFFF888888777778F777888888777778FCCCCF7077
          777778F7777778F7777778FFFFFF7077777778F7777778F7777778FFFFFF7077
          777778FFFFFFF8F7777778888888887777777888888888777777}
        Layout = blGlyphTop
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = btnCopiaSelClick
      end
      object btnFechar: TSpeedButton
        Left = 0
        Top = 0
        Width = 32
        Height = 32
        Hint = 'Fechar'
        Flat = True
        Glyph.Data = {
          F6010000424DF601000000000000760000002800000030000000100000000100
          0400000000008001000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FF8F8FF8F00F
          8F77FF8F8FF8F00F8F778FF8F8FF8F8FF8F7F8FF8F8FF0E0FF87F8FF8F8FF0E0
          FF878F8FF8F8FF8F8FF7F8F8FF8F80E608F7F8F8FF8F80E608F7FF8F8FF8F8FF
          8F87000000FF80E66007000000FF80E66007F8FF8F8FF8F8FF87777770F8F0E6
          6087777770F8F0E6608777777066666668777777007770E660877777007770E6
          608777777066666668777777007770E660877777007770E66087777770666666
          68777788060770E760877788060770E76087777770666666687770000E6070E0
          608770000E6070E0608777777066666668770EEEEEE600E660870EEEEEE600E6
          608777777067666668770EEEEEE600E660870EEEEEE600E66087777770606666
          687770000E6070E6608770000E6070E6608777777066666668777777060770E6
          60877777060770E66087777770666666687777770077770E608777770077770E
          60877777706666666877777770777770E087777770777770E087777770666666
          687777777000000000777777700000000077777770EEEEEEE877}
        NumGlyphs = 3
        OnClick = btnFecharClick
      end
    end
    object GrdAtribForn: TwwDBGrid
      Left = 0
      Top = 33
      Width = 459
      Height = 242
      Selected.Strings = (
        'STATUS'#9'3'#9'SSS'#9'F'
        'RAZAOSOCIAL'#9'60'#9'RAZAOSOCIAL'#9'T')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
      Align = alClient
      DataSource = DsAtribForn
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      KeyOptions = []
      Options = [dgEditing, dgColumnResize, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      ParentFont = False
      TabOrder = 1
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = False
      UseTFields = False
      IndicatorColor = icBlack
      OnFieldChanged = GrdAtribFornFieldChanged
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 770
    Top = 65527
  end
  inherited ds: TwwDataSource
    Left = 286
    Top = 7
  end
  inherited ImlPadrao: TImageList
    Left = 784
    Top = 65511
  end
  inherited CmeCadastro: TCmEventosCadastro
    RepetirInsert = False
    OnFind = CmeCadastroFind
    ApplyDelete = CmeCadastroApplyDelete
    Left = 352
    Top = 7
  end
  inherited Cds: TCMClientDataSet
    Left = 244
    Top = 7
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'PROCESSO.CODPROCESSO'
      'PROCXART.CODARTIGO'
      
        'SUBSTR(DECODE(PROCXART.IDPRODVARI,NULL,PRODUTO.DESCPROD,PRODVARI' +
        '.DESCPRODVARI),1,60)')
    TipodeDado.Strings = (
      'N'
      'C'
      'C')
    Descricao.Strings = (
      'Nº do Processo'
      'Codigo do Item'
      'Descrição do Item')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PROCESSO'
      'PROCXART'
      'PRODUTO'
      'PRODVARI')
    CamposChave.Strings = (
      'PROCESSO.CODPROCESSO'
      'PROCESSO.STATUS')
    Filtro.Strings = (
      'PROCESSO.STATUS <> '#39'F'#39
      'PROCXART.CODPROCESSO = PROCESSO.CODPROCESSO '
      'SUBSTR(PROCXART.CODARTIGO,1,6) =  PRODUTO.CODPRODUTO'
      'PROCXART.IDPRODVARI = PRODVARI.IDPRODVARI(+)')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '14'
      '60')
    Left = 448
    Top = 7
  end
  object cdsArtigo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 272
    Top = 63
  end
  object cdsSCI: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 56
    Top = 64
  end
  object cdsGrupoProd: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 232
    Top = 64
  end
  object cdsItens: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 511
    Top = 200
  end
  object dsItens: TwwDataSource
    AutoEdit = False
    DataSet = cdsItens
    Left = 472
    Top = 200
  end
  object dsItensAtrib: TwwDataSource
    AutoEdit = False
    DataSet = cdsItensAtrib
    Left = 457
    Top = 293
  end
  object cdsItensAtrib: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 519
    Top = 293
  end
  object DsAtribForn: TwwDataSource
    Left = 371
    Top = 259
  end
  object cdsCotacao: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 165
    Top = 208
  end
  object cdsNovoForn: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 93
    Top = 319
  end
  object cdsRestricao: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 637
    Top = 367
  end
end
