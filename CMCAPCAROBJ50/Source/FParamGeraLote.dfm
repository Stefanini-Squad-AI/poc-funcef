inherited FrmParamGeraLote: TFrmParamGeraLote
  Left = 234
  Top = 177
  BorderIcons = [biSystemMenu]
  Caption = 'Dados Para Pesquisa de Documentos'
  ClientHeight = 531
  ClientWidth = 630
  FormStyle = fsNormal
  Visible = False
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 630
    Height = 492
    object PageControl: TPageControl
      Left = 1
      Top = 1
      Width = 628
      Height = 490
      ActivePage = TabSheet1
      Align = alClient
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = 'Seleção'
        object Label1: TLabel
          Left = 8
          Top = 13
          Width = 188
          Height = 13
          Caption = 'Contas Caixas x Forma de Pagto.'
        end
        object Label2: TLabel
          Left = 8
          Top = 138
          Width = 82
          Height = 13
          Caption = 'Formas Pagto.'
        end
        object Label3: TLabel
          Left = 8
          Top = 165
          Width = 112
          Height = 13
          Caption = 'Tipo de Documento'
        end
        object Label4: TLabel
          Left = 8
          Top = 192
          Width = 106
          Height = 13
          Caption = 'Sistema de Origem'
        end
        object Label5: TLabel
          Left = 8
          Top = 222
          Width = 108
          Height = 13
          Caption = 'Data Prog. - Inicial'
        end
        object Label6: TLabel
          Left = 8
          Top = 249
          Width = 101
          Height = 13
          Caption = 'Data Prog. - Final'
        end
        object Label7: TLabel
          Left = 8
          Top = 109
          Width = 65
          Height = 13
          Caption = 'Documento'
        end
        object Label9: TLabel
          Left = 308
          Top = 108
          Width = 7
          Height = 13
          Caption = '/'
        end
        object Label10: TLabel
          Left = 9
          Top = 278
          Width = 82
          Height = 13
          Caption = 'Data de Lanç.'
        end
        object CPForCli: TCMProcuraForCli
          Left = 262
          Top = 37
          Width = 311
          Height = 57
          Caption = 'Fornecedor'
          TabOrder = 2
          OnExit = CPForCliExit
          CampoEdit = ceRazaoSocial
          MostraMensagens = True
          Mensagens.EmBranco = ' não pode estar em branco'
          Mensagens.NaoExiste = ' não existe'
          PermiteChaveInvalida = False
          PermiteChaveEmBranco = True
          ForCli = fcCliente
          MostraEndereco = False
          StatusForCli = fcAll
          MostraStatusCredito = False
        end
        object EdDoc: TEdit
          Left = 139
          Top = 103
          Width = 165
          Height = 21
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 3
        end
        object CmbSistema: TCMDBLookupCombo
          Left = 139
          Top = 187
          Width = 305
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOMEMODULO'#9'50'#9'Descricao'#9'F')
          DataField = 'IDMODULO'
          LookupTable = CdsModulo
          LookupField = 'IDMODULO'
          Options = [loTitles]
          Style = csDropDownList
          TabOrder = 7
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
        object CmbTipo: TCMDBLookupCombo
          Left = 139
          Top = 159
          Width = 305
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'60'#9'DESCRICAO')
          DataField = 'CODTIPDOC'
          LookupTable = CdsTipoDocRecPag
          LookupField = 'CODTIPDOC'
          Options = [loTitles]
          Style = csDropDownList
          TabOrder = 6
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
        object CmbFormas: TCMDBLookupCombo
          Left = 139
          Top = 131
          Width = 305
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'60'#9'Descrição'#9'F')
          DataField = 'CODFORMA'
          LookupTable = CdsFormaRecPag
          LookupField = 'CODFORMA'
          Options = [loTitles]
          Style = csDropDownList
          TabOrder = 5
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
        object Cmbcontas: TCMDBLookupCombo
          Left = 269
          Top = 7
          Width = 304
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'50'#9'Descrição'#9'F')
          DataField = 'CODPORTFORMA'
          LookupTable = CdsUmPortadorForma
          LookupField = 'CODPORTFORMA'
          Options = [loTitles]
          Style = csDropDownList
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
        object DtIni: TCMDateTimePicker
          Left = 139
          Top = 215
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
          TabOrder = 8
        end
        object DtFim: TCMDateTimePicker
          Left = 139
          Top = 243
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
          TabOrder = 9
        end
        object EdCompl: TEdit
          Left = 321
          Top = 103
          Width = 47
          Height = 21
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 4
        end
        object GroupBox1: TGroupBox
          Left = 6
          Top = 311
          Width = 606
          Height = 138
          Caption = 'Filtro Para Seleção de Documentos '
          TabOrder = 11
          object cbListaPortForma: TCheckBox
            Left = 11
            Top = 47
            Width = 478
            Height = 13
            Caption = 
              'Somente Documentos Com a Conta Caixa X Formas de Pagamento Selec' +
              'ionado'
            TabOrder = 0
          end
          object cbListaFormaPagto: TCheckBox
            Left = 11
            Top = 68
            Width = 390
            Height = 13
            Caption = 'Somente Documentos Com a Forma de Pagamento Selecionada'
            TabOrder = 1
          end
          object cbListaMesmoBanco: TCheckBox
            Left = 11
            Top = 89
            Width = 589
            Height = 13
            Caption = 
              'Somente Documentos do Banco Vinculado ao Contas Caixas X Forma d' +
              'e Pagamento Selecionada'
            TabOrder = 3
          end
          object cbListaCPMF: TCheckBox
            Left = 11
            Top = 25
            Width = 254
            Height = 13
            Caption = 'Lista também Documentos do tipo CPMF'
            TabOrder = 2
          end
          object chkDocAprovados: TCheckBox
            Left = 11
            Top = 110
            Width = 366
            Height = 13
            Caption = 'Somente Documentos com a ultima etapa do RAD aprovada'
            TabOrder = 4
          end
        end
        object dtLancto: TCMDateTimePicker
          Left = 139
          Top = 269
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
          TabOrder = 10
        end
        object rdgTpSelecao: TRadioGroup
          Left = 9
          Top = 37
          Width = 239
          Height = 57
          Caption = 'Tipo de Seleção'
          ItemIndex = 0
          Items.Strings = (
            'Ra&zão Social'
            'Nome de &Fantasia')
          TabOrder = 1
        end
        object btSelecionar: TBitBtn
          Left = 375
          Top = 99
          Width = 31
          Height = 25
          Cursor = crHandPoint
          Hint = 'Selecionar documento'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 12
          OnClick = btSelecionarClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000000000000000000000000
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
          NumGlyphs = 2
        end
        object btLimpar: TBitBtn
          Left = 411
          Top = 99
          Width = 31
          Height = 25
          Cursor = crHandPoint
          Hint = 'Limpar documento'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 13
          OnClick = btLimparClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            888888888888FF8888888888888008888888888888F77F8888888888800F0888
            88888888F7787F88888888800FFF0888888888F7788878888888800FFFFF8888
            8888877888888FF8888887FFFF880088888887F88888778F888887FFF8801108
            8888878F88878878F888887FF80999108888887F887F88878F88887FF8099991
            08888878F878F88878F88887F880999030888887F8878F87878F8887FF88090B
            030888878F887878787888887F8880B0B038888878F88787878888888788880B
            0B388888878888787888888888888880BBB88888888888878F88888888888888
            0BB888888888888878F888888888888880B88888888888888788}
          NumGlyphs = 2
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Plano Previdenciário Contábil'
        ImageIndex = 1
        object Label8: TLabel
          Left = 11
          Top = 152
          Width = 176
          Height = 13
          Caption = 'Plano Previdenciário Contábil :'
        end
        object grpPlanoPrev: TGroupBox
          Left = 11
          Top = 16
          Width = 590
          Height = 405
          Caption = 'Plano Previdenciário'
          TabOrder = 0
          object dbgrPlanoPrev: TwwDBGrid
            Left = 14
            Top = 32
            Width = 558
            Height = 356
            ControlType.Strings = (
              'MARCA;CheckBox;S;N')
            Selected.Strings = (
              'MARCA'#9'9'#9'Selecionar'
              'NOME'#9'61'#9'Descrição')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
            DataSource = dsPlanoPrev
            TabOrder = 0
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 2
            TitleButtons = False
            OnCalcCellColors = dbgrPlanoPrevCalcCellColors
            IndicatorColor = icBlack
            OnTopRowChanged = dbgrPlanoPrevTopRowChanged
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 492
    Width = 630
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 99
    Top = 11
  end
  object SqlUmPortadorForma: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  DESCRICAO,'
      '  CODPORTFORMA,'
      '  DMAIS,'
      '  LANCAFINANC,'
      '  PLANO,'
      '  PLACONTA,'
      '  CODPORTADOR,'
      '  DESCFINAN,'
      '  FLGCHEQUEDIFERIDO,'
      '  FLGCONTROLACHEQUE'
      'FROM'
      '  PORTADORFORMA'
      'WHERE'
      '  RECPAG   = :RECPAG   AND'
      '  IDPESSOA = :IDPESSOA AND'
      '  NVL(FLGENCCONTAS, '#39'N'#39') = '#39'N'#39
      '  AND NVL(FLGATIVO, '#39'S'#39') = '#39'S'#39
      'ORDER BY DESCRICAO')
    ClientDataSet = CdsUmPortadorForma
    Left = 309
    Top = 65
  end
  object CdsUmPortadorForma: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 285
    Top = 9
  end
  object SqlTipoDocRecPag: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  CODTIPDOC,'
      '  DESCRICAO,'
      '  DEBCRE,'
      '  FLGENGLOBAPARCELA,'
      '  FLGGERANUMDOC,'
      '  FLGDOCFISCAL'
      'FROM'
      '  TIPODOCRECPAG A'
      'WHERE'
      '   A.RECPAG =  :RECPAG AND'
      '   NOT EXISTS (SELECT'
      '                  *'
      '               FROM'
      '                  USUARIOXTPDOCTO B'
      '               WHERE'
      '                  B.IDUSUARIO = :IDUSUARIO AND'
      '                  RECPAG = :RECPAG)'
      '   UNION'
      'SELECT'
      '   CODTIPDOC,'
      '   DESCRICAO,'
      '   DEBCRE,'
      '   FLGENGLOBAPARCELA,'
      '   FLGGERANUMDOC,'
      '   FLGDOCFISCAL'
      'FROM'
      '   TIPODOCRECPAG A'
      'WHERE'
      '   A.RECPAG = :RECPAG AND'
      '   EXISTS (SELECT'
      '              *'
      '           FROM'
      '              USUARIOXTPDOCTO B'
      '           WHERE'
      '              A.CODTIPDOC=B.CODTIPDOC AND'
      '              B.IDUSUARIO=:IDUSUARIO AND'
      '              RECPAG=:RECPAG)'
      'ORDER BY DESCRICAO'
      '')
    ClientDataSet = CdsTipoDocRecPag
    Left = 365
    Top = 65497
  end
  object CdsTipoDocRecPag: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 245
    Top = 9
  end
  object SqlFormaRecPag: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  CODFORMA,'
      '  DESCRICAO'
      'FROM'
      '  FORMARECPAG'
      'WHERE'
      '  (RECPAG = :RECPAG) AND'
      '  (IDPESSOA = :IDPESSOA)'
      'ORDER BY'
      '  DESCRICAO')
    ClientDataSet = CdsFormaRecPag
    Left = 445
    Top = 65529
  end
  object CdsFormaRecPag: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 165
    Top = 9
  end
  object SqlModulo: TCMSqlParams
    SQL.Strings = (
      'select idmodulo,nomemodulo from modulo'
      ''
      ' '
      'order by nomemodulo'
      '')
    ClientDataSet = CdsModulo
    Left = 157
    Top = 49
  end
  object CdsModulo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 125
    Top = 9
  end
  object MsDoc: TMontaSelect
    Tag = 8
    Template.IdConsulta = 0
    Caption = 'Seleciona Documentos'
    Colunas.Strings = (
      'DOCUMENTO.NODOCUMENTO'
      'DOCUMENTO.COMPLDOCUMENTO'
      'DOCUMENTO.DATAPROGRAMADA'
      'DOCUMENTO.DATAVENCTO'
      'LANCTODOCUM.VALOR'
      'PESSOA.RAZAOSOCIAL'
      'LANCTODOCUM.HISTORICOCOMPL'
      'DOCUMENTO.NOSSONUMERO')
    TipodeDado.Strings = (
      'N'
      'C'
      'D'
      'D'
      'N'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Número do Documento'
      'Complemento'
      'Data Programada'
      'Data Vencimento'
      'Valor'
      'Razão Social'
      'Histórico'
      'Nosso Número')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'DOCUMENTO'
      'LANCTODOCUM'
      'PESSOA')
    CamposChave.Strings = (
      'DOCUMENTO.CODDOCUMENTO'
      
        'DECODE(DOCUMENTO.COMPLDOCUMENTO, NULL, TO_CHAR(DOCUMENTO.NODOCUM' +
        'ENTO), DOCUMENTO.NODOCUMENTO || '#39' - '#39' || DOCUMENTO.COMPLDOCUMENT' +
        'O)'
      'DOCUMENTO.NODOCUMENTO'
      'DOCUMENTO.COMPLDOCUMENTO')
    Filtro.Strings = (
      'DOCUMENTO.CODDOCUMENTO = LANCTODOCUM.CODDOCUMENTO'
      'DOCUMENTO.OPERACAO=LANCTODOCUM.OPERACAO'
      'DOCUMENTO.IDFORCLI=PESSOA.IDPESSOA'
      
        '((DOCUMENTO.STATUS='#39'0'#39') OR  (DOCUMENTO.STATUS='#39'1'#39' ) OR (DOCUMENT' +
        'O.STATUS is  NULL))'
      
        '((DOCUMENTO.OPERACAO='#39'2'#39') OR (DOCUMENTO.OPERACAO='#39'3'#39') OR (DOCUME' +
        'NTO.OPERACAO=14))'
      'LANCTODOCUM.ESTORNO IS NULL')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '3'
      '10'
      '10'
      '10'
      '60'
      '60'
      '20')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
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
      ''
      '')
    LookupCampoChave.Strings = (
      ''
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
      ''
      '')
    Left = 405
    Top = 57
  end
  object SqlSelecionados: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  D.IDFORCLI,'
      '  D.OPERACAO,'
      '  D.CODTIPDOC,'
      '  D.IDPESSOA,'
      '  D.CODDOCUMENTO,'
      '  D.NODOCUMENTO,'
      '  D.COMPLDOCUMENTO,'
      '  D.DATAPROGRAMADA,'
      '  D.DATAVENCTO,'
      '  D.IDMODULO,'
      '  D.RECPAG,'
      '  P.NOME,'
      '  D.STATUS,'
      '  D.MOECODIGO,'
      '  D.PLANO,'
      '  D.PLACONTA,'
      '  D.CODSUBCONTA,'
      '  D.CODCENTROCUSTO,'
      '  D.CODGRUPOCNAB,'
      '  D.NOSSONUMERO,'
      '  L.NUMLANCTO,'
      '  L.DATALANCTO,'
      '  L.VLRLIQUIDO,'
      '  L.VALOR,'
      '  L.VALOROUTRAMOEDA,'
      '  L.DEBCRE,'
      '  DECODE(SIGN(D.DATAVENCTO - SYSDATE), -1, 1, 0) AS SITUACAO,'
      '  2 AS STATUSVALOR, '
      ' PLANO.NOME AS PLANOPREV'
      ''
      'FROM'
      '  DOCUMENTO D,'
      '  PESSOA P,'
      '  LANCTODOCUM L,'
      '  (select distinct pp.idplanoprev, pp.nome, r.coddocumento'
      'from planprev pp, planprevcontabil pc, rateiodocum r'
      'where pp.idplanoprev = pc.idplanoprevprev and'
      'pc.idplanoprev = r.idplanoprev'
      'union'
      'select pc.idplanoprev, pc.nome, r.coddocumento'
      'from planprevcontabil pc, rateiodocum r'
      'where idplanoprevprev is null and'
      'pc.idplanoprev = r.idplanoprev) plano'
      ''
      'WHERE'
      ''
      '  1 = 2  '
      ' ')
    ClientDataSet = CdsSelecionados
    Left = 445
    Top = 249
  end
  object CdsSelecionados: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 389
    Top = 265
  end
  object DsSelecionados: TwwDataSource
    DataSet = CdsSelecionados
    Left = 397
    Top = 369
  end
  object SqlDocVazio: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  D.IDFORCLI,'
      '  D.OPERACAO,'
      '  D.CODTIPDOC,'
      '  D.IDPESSOA,'
      '  D.CODDOCUMENTO,'
      '  D.NODOCUMENTO,'
      '  D.COMPLDOCUMENTO,'
      '  D.DATAPROGRAMADA,'
      '  D.DATAVENCTO,'
      '  D.IDMODULO,'
      '  D.RECPAG,'
      '  P.NOME,'
      '  D.STATUS,'
      '  D.MOECODIGO,'
      '  D.PLANO,'
      '  D.PLACONTA,'
      '  D.CODSUBCONTA,'
      '  D.CODCENTROCUSTO,'
      '  D.CODGRUPOCNAB,'
      '  D.NOSSONUMERO,'
      '  L.NUMLANCTO,'
      '  L.DATALANCTO,'
      '  L.VLRLIQUIDO,'
      '  L.VALOR,'
      '  L.VALOROUTRAMOEDA,'
      '  L.DEBCRE,'
      '  DECODE(SIGN(D.DATAVENCTO - SYSDATE), -1, 1, 0) AS SITUACAO,'
      '  2 AS STATUSVALOR,'
      ' PLANO.NOME AS PLANOPREV'
      'FROM'
      '  DOCUMENTO D,'
      '  PESSOA P,'
      '  LANCTODOCUM L,'
      '  (select distinct pp.idplanoprev, pp.nome, r.coddocumento'
      'from planprev pp, planprevcontabil pc, rateiodocum r'
      'where pp.idplanoprev = pc.idplanoprevprev and'
      'pc.idplanoprev = r.idplanoprev'
      'union'
      'select pc.idplanoprev, pc.nome, r.coddocumento'
      'from planprevcontabil pc, rateiodocum r'
      'where idplanoprevprev is null and'
      'pc.idplanoprev = r.idplanoprev) plano'
      'WHERE'
      '  1 = 2'
      '  and d.idforcli = p.idpessoa'
      '  and d.coddocumento = l.coddocumento'
      '  and d.coddocumento = plano.coddocumento'
      ' '
      ''
      ' '
      ' ')
    Left = 557
    Top = 289
  end
  object DsPendentes: TwwDataSource
    Left = 333
    Top = 371
  end
  object cdsaux: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IDPLANOPREV'
        DataType = ftFloat
      end
      item
        Name = 'PLANOPREV'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'CODDOCUMENTO'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 117
    Top = 123
  end
  object sqlaux: TCMSqlParams
    SQL.Strings = (
      ''
      
        'select distinct pp.idplanoprev, pp.nome as planoprev , r.coddocu' +
        'mento'
      'from planprev pp, planprevcontabil pc, rateiodocum r'
      'where pp.idplanoprev = pc.idplanoprevprev and'
      'pc.idplanoprev = r.idplanoprev and'
      'r.coddocumento =:coddocumento'
      'union'
      'select pc.idplanoprev, pc.nome as planoprev, r.coddocumento'
      'from planprevcontabil pc, rateiodocum r'
      'where idplanoprevprev is null and'
      'pc.idplanoprev = r.idplanoprev'
      'and '
      'r.coddocumento=:coddocumento'
      ''
      ''
      ''
      ''
      ' ')
    ClientDataSet = cdsaux
    Left = 101
    Top = 273
  end
  object SqlPortadorForma: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  DESCRICAO,'
      '  CODPORTFORMA,'
      '  DMAIS,'
      '  LANCAFINANC,'
      '  PLANO,'
      '  PLACONTA,'
      '  CODPORTADOR,'
      '  DESCFINAN,'
      '  FLGCHEQUEDIFERIDO,'
      '  FLGCONTROLACHEQUE'
      'FROM'
      '  PORTADORFORMA'
      'WHERE'
      '  RECPAG   = :RECPAG   AND'
      '  IDPESSOA = :IDPESSOA'
      'ORDER BY DESCRICAO')
    ClientDataSet = CdsUmPortadorForma
    Left = 237
    Top = 273
  end
  object CdsPlanoPrev: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterOpen = CdsPlanoPrevAfterOpen
    Left = 487
    Top = 157
  end
  object dsPlanoPrev: TDataSource
    DataSet = CdsPlanoPrev
    Left = 321
    Top = 177
  end
  object sqlplanoprev: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  IDPLANOPREV, '
      '  NOME,'
      '  '#39'N'#39' AS MARCA '
      'FROM PLANPREVCONTABIL'
      'WHERE ATIVO = '#39'S'#39
      'ORDER BY NOME')
    ClientDataSet = CdsPlanoPrev
    Left = 245
    Top = 81
  end
  object CmpDadosParaBaixa: TCmParamReport
    Caption = 'Dados Para Pesquisa de Documentos'
    DataBaseName = 'BaseDados'
    Params = <
      item
        Caption = 'Contas Caixas X Tipos de Cobranca'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT'
          '  DESCRICAO,'
          '  CODPORTFORMA,'
          '  DMAIS,'
          '  LANCAFINANC,'
          '  PLANO,'
          '  PLACONTA,'
          '  CODPORTADOR,'
          '  DESCFINAN,'
          '  FLGCHEQUEDIFERIDO,'
          '  FLGCONTROLACHEQUE'
          'FROM'
          '  PORTADORFORMA'
          'WHERE'
          '  1=2')
        LookupSettings.Chave = 'CODPORTFORMA'
        LookupSettings.Display = 'DESCRICAO'
        LookupSettings.Descricao = 'Descrição'
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = True
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'dblkcmbDescricao'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = 'Fornecedor'
        Controle = tcProcuraFC
        TipodeDado = tdString
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = False
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'CPForCli'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = 'Documento'
        Controle = tcEdit
        TipodeDado = tdString
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = False
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'Documento'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 100
      end
      item
        Caption = 'Complemento'
        Controle = tcEdit
        TipodeDado = tdString
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = False
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'Complemento'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 50
      end
      item
        Caption = 'Forma de Pagamento'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT CODFORMA, RECPAG, DESCRICAO'
          'FROM FORMARECPAG '
          'WHERE (1=2)')
        LookupSettings.Chave = 'CODFORMA'
        LookupSettings.Display = 'DESCRICAO'
        LookupSettings.Descricao = 'Formade Pagamento'
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'DblCodForma'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = 'Tipo de Documento'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          '  SELECT CODTIPDOC,DESCRICAO  FROM TIPODOCRECPAG a'
          '  WHERE (1=2)')
        LookupSettings.Chave = 'CODTIPDOC'
        LookupSettings.Display = 'DESCRICAO'
        LookupSettings.Descricao = 'Descrição'
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'CmbTipoDocRecPag'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = 'Sistema de Origem'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT'
          '  IDMODULO, NOMEMODULO'
          'FROM'
          '  MODULO'
          'ORDER BY'
          '  NOMEMODULO')
        LookupSettings.Chave = 'IDMODULO'
        LookupSettings.Display = 'NOMEMODULO'
        LookupSettings.Descricao = 'Módulo'
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = False
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'CmbSisOrigem'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = 'Data Programada - Inicial'
        Controle = tcEdit
        TipodeDado = tdDate
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = False
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'DtIni'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = 'Data Programada - Final'
        Controle = tcEdit
        TipodeDado = tdDate
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = False
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'DtFim'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = ' Filtro Para Seleção de Documentos '
        Controle = tcEdit
        TipodeDado = tdString
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = False
        Required = False
        EditSettings.Color = clBtnFace
        EditSettings.Readonly = True
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clBtnFace
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 1
      end
      item
        Caption = 'Contas Caixas X Formas de Pagamento'
        Controle = tcCheckBox
        TipodeDado = tdBoolean
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = False
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = False
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'CkbPortForma'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = 'Formas de Pagamento'
        Controle = tcCheckBox
        TipodeDado = tdBoolean
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = False
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = False
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'CkbSelDoc'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = 
          'Somente Documentos com Conta Corrente do Mesmo Banco da Conta Ca' +
          'ixa x Forma de Pagamento'
        Controle = tcCheckBox
        TipodeDado = tdBoolean
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = False
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = False
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'CkbAutorPag'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = 'Lista também Documentos do tipo CPMF'
        Controle = tcCheckBox
        TipodeDado = tdBoolean
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = False
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = False
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'CkbCPMF'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = 'IdPlanosPrev'
        Controle = tcEdit
        TipodeDado = tdString
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = 'Data de Lançamento'
        Controle = tcEdit
        TipodeDado = tdDate
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = False
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'DtLanc'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = 'Coddocumento'
        Controle = tcEdit
        TipodeDado = tdInteger
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = 'NomePortadorForma'
        Controle = tcEdit
        TipodeDado = tdString
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'NomePortadorForma'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = 'TipoSelecaoForn'
        Controle = tcEdit
        TipodeDado = tdInteger
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'TipoSelecaoForn'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = 'DocAprovadoRAD'
        Controle = tcEdit
        TipodeDado = tdBoolean
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end>
    ExibeMensagem = True
    Formheight = 450
    FormWidth = 540
    Left = 517
    Top = 220
  end
  object CdsLoteXDocumento: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 309
    Top = 226
    object CdsLoteXDocumentoNOME: TStringField
      DisplayLabel = 'Nome\Razão Social'
      DisplayWidth = 39
      FieldName = 'NOME'
      Origin = 'PESSOA.NOME'
      Size = 60
    end
    object CdsLoteXDocumentoDATAPROGRAMADA: TDateTimeField
      DisplayLabel = 'Data Prog'
      DisplayWidth = 10
      FieldName = 'DATAPROGRAMADA'
      Origin = 'LOTEPAGTO.NUMLOTE'
    end
    object CdsLoteXDocumentoDATAVENCTO: TDateTimeField
      DisplayLabel = 'Data Venc'
      DisplayWidth = 10
      FieldName = 'DATAVENCTO'
      Origin = 'LOTEPAGTO.IDPESSJUR'
    end
    object CdsLoteXDocumentoNODOCUMENTO: TFloatField
      DisplayLabel = 'Documento'
      DisplayWidth = 15
      FieldName = 'NODOCUMENTO'
      Origin = 'LOTEPAGTO.IDPESSOA'
    end
    object CdsLoteXDocumentoCOMPLDOCUMENTO: TStringField
      DisplayLabel = 'Comp'
      DisplayWidth = 3
      FieldName = 'COMPLDOCUMENTO'
      Origin = 'LOTEPAGTO.CODPORTFORMA'
      Size = 3
    end
    object CdsLoteXDocumentoVALOR: TFloatField
      DisplayLabel = 'Valor Pago'
      DisplayWidth = 20
      FieldName = 'VALOR'
      Origin = 'LOTEXDOCUM.VALOR'
      DisplayFormat = '#,##0.00'
    end
    object CdsLoteXDocumentoDOCUMENTO: TStringField
      DisplayLabel = 'Documento'
      DisplayWidth = 19
      FieldKind = fkCalculated
      FieldName = 'DOCUMENTO'
      Visible = False
      Size = 50
      Calculated = True
    end
    object CdsLoteXDocumentoCODDOCUMENTO: TFloatField
      DisplayWidth = 10
      FieldName = 'CODDOCUMENTO'
      Origin = 'LOTEXDOCUM.CODDOCUMENTO'
      Visible = False
    end
    object CdsLoteXDocumentoNUMLOTE: TFloatField
      FieldName = 'NUMLOTE'
      Origin = 'LOTEXDOCUM.NUMLOTE'
      Visible = False
    end
    object CdsLoteXDocumentoCODBARRA: TStringField
      FieldName = 'CODBARRA'
      Origin = 'LOTEXDOCUM.CODBARRA'
      Size = 60
    end
    object CdsLoteXDocumentoCODBARRAVALOR: TStringField
      FieldName = 'CODBARRAVALOR'
      Origin = 'LOTEXDOCUM.CODBARRAVALOR'
      Size = 60
    end
    object CdsLoteXDocumentoOPERACAO: TStringField
      FieldName = 'OPERACAO'
      Origin = 'DOCUMENTO.OPERACAO'
      Size = 2
    end
    object CdsLoteXDocumentoIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
      Origin = 'DOCUMENTO.IDFORCLI'
    end
    object CdsLoteXDocumentoIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object CdsLoteXDocumentoVLRLIQUIDO: TFloatField
      FieldName = 'VLRLIQUIDO'
      DisplayFormat = '#,##0.00'
    end
    object CdsLoteXDocumentoIDPROCESSO: TFloatField
      FieldName = 'IDPROCESSO'
    end
  end
  object CMClientDataSet1: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 504
    Top = 114
    object DateTimeField1: TDateTimeField
      DisplayLabel = 'Data Prog'
      DisplayWidth = 10
      FieldName = 'DATAPROGRAMADA'
      Origin = 'DOCUMENTO.DATAPROGRAMADA'
    end
    object CdsDocPendentesDOCUMENTO: TStringField
      DisplayLabel = 'Documento'
      DisplayWidth = 18
      FieldKind = fkCalculated
      FieldName = 'DOCUMENTO'
      Size = 50
      Calculated = True
    end
    object DateTimeField2: TDateTimeField
      DisplayLabel = 'Data Venc'
      DisplayWidth = 10
      FieldName = 'DATAVENCTO'
      Origin = 'DOCUMENTO.DATAVENCTO'
    end
    object CdsDocPendentesSALDO: TFloatField
      DisplayLabel = 'Saldo'
      DisplayWidth = 17
      FieldName = 'SALDO'
      DisplayFormat = '#,##0.00'
    end
    object FloatField1: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      Origin = 'DOCUMENTO.IDPESSOA'
      Visible = False
    end
    object FloatField2: TFloatField
      DisplayWidth = 15
      FieldName = 'NODOCUMENTO'
      Origin = 'DOCUMENTO.NODOCUMENTO'
      Visible = False
    end
    object StringField1: TStringField
      DisplayWidth = 20
      FieldName = 'COMPLDOCUMENTO'
      Origin = 'DOCUMENTO.COMPLDOCUMENTO'
      Visible = False
      Size = 3
    end
    object FloatField3: TFloatField
      FieldName = 'CODDOCUMENTO'
      Origin = 'DOCUMENTO.CODDOCUMENTO'
      Visible = False
    end
    object StringField2: TStringField
      FieldName = 'RECPAG'
      Origin = 'DOCUMENTO.CODDOCUMENTO'
      Visible = False
      Size = 1
    end
    object StringField3: TStringField
      FieldName = 'STATUS'
      Origin = 'DOCUMENTO.CODDOCUMENTO'
      Visible = False
      Size = 1
    end
    object FloatField4: TFloatField
      FieldName = 'IDFORCLI'
      Visible = False
    end
    object StringField4: TStringField
      DisplayWidth = 2
      FieldName = 'OPERACAO'
      Visible = False
      Size = 2
    end
    object CdsDocPendentesNUMLEITCODBARRAS: TStringField
      FieldName = 'NUMLEITCODBARRAS'
      Size = 60
    end
    object CdsDocPendentesNUMDIGCODBARRAS: TStringField
      FieldName = 'NUMDIGCODBARRAS'
      Size = 60
    end
    object FloatField5: TFloatField
      FieldName = 'VLRLIQUIDO'
      DisplayFormat = '#,##0.00'
    end
    object CdsDocPendentesRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Size = 60
    end
    object CdsDocPendentesFORNECEDOR: TStringField
      FieldName = 'FORNECEDOR'
      Size = 60
    end
    object StringField5: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object CdsDocPendentesTIPO: TStringField
      FieldName = 'TIPO'
      Size = 6
    end
  end
  object CdsSaldoLoteNaoEmitido: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 407
    Top = 282
    object CdsSaldoLoteNaoEmitidoVALORLOTE: TFloatField
      FieldName = 'VALORLOTE'
      Origin = 'LOTEXDOCUM.VALOR'
    end
  end
  object Cdsseladiantpendent: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 275
    Top = 266
  end
  object CMClientDataSet2: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 310
    Top = 298
  end
  object CMClientDataSet3: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 571
    Top = 138
    object CdsTipoDocRecPagDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 35
      FieldName = 'DESCRICAO'
      Origin = 'TIPODOCRECPAG.DESCRICAO'
      Size = 35
    end
    object CdsTipoDocRecPagCODTIPDOC: TFloatField
      DisplayWidth = 10
      FieldName = 'CODTIPDOC'
      Origin = 'TIPODOCRECPAG.CODTIPDOC'
      Visible = False
    end
  end
  object CdsDescPortadorForma: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 323
    Top = 270
    object CdsDescPortadorFormaDESCRICAO: TStringField
      DisplayWidth = 35
      FieldName = 'DESCRICAO'
      Origin = 'PORTADORFORMA.DESCRICAO'
      Size = 50
    end
    object CdsDescPortadorFormaCODPORTFORMA: TFloatField
      FieldName = 'CODPORTFORMA'
      Origin = 'PORTADORFORMA.CODPORTFORMA'
    end
    object CdsDescPortadorFormaIDTEMPLCHEQUE: TFloatField
      FieldName = 'IDTEMPLCHEQUE'
      Origin = 'PORTADORFORMA.IDTEMPLCHEQUE'
    end
    object CdsDescPortadorFormaRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Size = 60
    end
    object CdsDescPortadorFormaCODFORMA: TFloatField
      FieldName = 'CODFORMA'
      Origin = 'PORTADORFORMA.CODFORMA'
    end
    object CdsDescPortadorFormaFLGCHEQUEDIFERIDO: TStringField
      FieldName = 'FLGCHEQUEDIFERIDO'
      Size = 1
    end
    object CdsDescPortadorFormaFLGOBRIGAFAV: TStringField
      FieldName = 'FLGOBRIGAFAV'
      Origin = 'PORTADORFORMA.FLGOBRIGAFAV'
      Size = 1
    end
  end
  object cdsPortForma: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 368
    Top = 295
  end
  object CdsModulos: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 452
    Top = 302
    object CdsModulosNOMEMODULO: TStringField
      DisplayWidth = 50
      FieldName = 'NOMEMODULO'
      Origin = 'MODULO.NOMEMODULO'
      Size = 50
    end
    object CdsModulosIDMODULO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDMODULO'
      Origin = 'MODULO.IDMODULO'
      Visible = False
    end
  end
  object CdsRateio: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 502
    Top = 288
  end
  object CdsNumlancto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 574
    Top = 188
    object CdsNumlanctoNUMLANCTO: TFloatField
      FieldName = 'NUMLANCTO'
      Origin = '"LANCTODOCUM".NUMLANCTO'
    end
    object CdsNumlanctoDEBCRE: TStringField
      FieldName = 'DEBCRE'
      Origin = '"LANCTODOCUM".DEBCRE'
      Size = 1
    end
  end
  object CdsFormadePagto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 459
    Top = 370
    object CdsFormaPagDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 35
      FieldName = 'DESCRICAO'
      Origin = 'FORMARECPAG.DESCRICAO'
      Size = 30
    end
    object CdsFormaPagCODFORMA: TFloatField
      FieldName = 'CODFORMA'
      Origin = 'FORMARECPAG.CODFORMA'
      Visible = False
    end
    object CdsFormaPagRECPAG: TStringField
      FieldName = 'RECPAG'
      Origin = 'FORMARECPAG.RECPAG'
      Visible = False
      Size = 1
    end
  end
  object dsDocPendentes: TwwDataSource
    DataSet = CMClientDataSet1
    Left = 272
    Top = 286
  end
  object dsLoteXDocum: TwwDataSource
    DataSet = CdsLoteXDocumento
    Left = 213
    Top = 286
  end
  object dsLotePagto: TwwDataSource
    DataSet = CdsLotePagto
    Left = 171
    Top = 270
  end
  object CdsLotePagto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 19
    Top = 122
    object CdsLotePagtoNUMLOTE: TFloatField
      FieldName = 'NUMLOTE'
      Origin = 'LOTEPAGTO.NUMLOTE'
    end
    object CdsLotePagtoCODPORTFORMA: TFloatField
      FieldName = 'CODPORTFORMA'
      Origin = 'LOTEPAGTO.CODPORTFORMA'
    end
    object CdsLotePagtoDATAEMISSAO: TDateTimeField
      FieldName = 'DATAEMISSAO'
      Origin = 'LOTEPAGTO.DATAEMISSAO'
    end
    object CdsLotePagtoNUMCHQBORDERO: TStringField
      FieldName = 'NUMCHQBORDERO'
      Origin = 'LOTEPAGTO.NUMCHQBORDERO'
      Size = 15
    end
    object CdsLotePagtoFAVORECIDO: TStringField
      FieldName = 'FAVORECIDO'
      Origin = 'LOTEPAGTO.FAVORECIDO'
      Size = 60
    end
    object CdsLotePagtoFLAGEMISSAO: TStringField
      FieldName = 'FLAGEMISSAO'
      Origin = 'LOTEPAGTO.FLAGEMISSAO'
      Size = 1
    end
    object CdsLotePagtoFLAGCANCEL: TStringField
      FieldName = 'FLAGCANCEL'
      Origin = 'LOTEPAGTO.FLAGCANCEL'
      Size = 1
    end
    object CdsLotePagtoOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Origin = 'LOTEPAGTO.OBSERVACAO'
      Size = 80
    end
    object CdsLotePagtoIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'LOTEPAGTO.NUMLOTE'
    end
    object CdsLotePagtoIDUSUARIOINCLUSAO: TFloatField
      FieldName = 'IDUSUARIOINCLUSAO'
      Origin = 'LOTEPAGTO.IDPESSOA'
    end
    object CdsLotePagtoIDPROCESSO: TFloatField
      FieldName = 'IDPROCESSO'
      Origin = '"LOTEPAGTO".IDPROCESSO'
    end
    object CdsLotePagtoDATADIFERIDO: TDateTimeField
      FieldName = 'DATADIFERIDO'
    end
    object CdsLotePagtoFLGRADLOTEDOC: TStringField
      FieldName = 'FLGRADLOTEDOC'
      Size = 1
    end
  end
  object CdsDocPendentes: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 368
    Top = 210
    object DateTimeField3: TDateTimeField
      DisplayLabel = 'Data Prog'
      DisplayWidth = 10
      FieldName = 'DATAPROGRAMADA'
      Origin = 'DOCUMENTO.DATAPROGRAMADA'
    end
    object StringField6: TStringField
      DisplayLabel = 'Documento'
      DisplayWidth = 18
      FieldKind = fkCalculated
      FieldName = 'DOCUMENTO'
      Size = 50
      Calculated = True
    end
    object DateTimeField4: TDateTimeField
      DisplayLabel = 'Data Venc'
      DisplayWidth = 10
      FieldName = 'DATAVENCTO'
      Origin = 'DOCUMENTO.DATAVENCTO'
    end
    object FloatField6: TFloatField
      DisplayLabel = 'Saldo'
      DisplayWidth = 17
      FieldName = 'SALDO'
      DisplayFormat = '#,##0.00'
    end
    object FloatField7: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      Origin = 'DOCUMENTO.IDPESSOA'
      Visible = False
    end
    object FloatField8: TFloatField
      DisplayWidth = 15
      FieldName = 'NODOCUMENTO'
      Origin = 'DOCUMENTO.NODOCUMENTO'
      Visible = False
    end
    object StringField7: TStringField
      DisplayWidth = 20
      FieldName = 'COMPLDOCUMENTO'
      Origin = 'DOCUMENTO.COMPLDOCUMENTO'
      Visible = False
      Size = 3
    end
    object FloatField9: TFloatField
      FieldName = 'CODDOCUMENTO'
      Origin = 'DOCUMENTO.CODDOCUMENTO'
      Visible = False
    end
    object StringField8: TStringField
      FieldName = 'RECPAG'
      Origin = 'DOCUMENTO.CODDOCUMENTO'
      Visible = False
      Size = 1
    end
    object StringField9: TStringField
      FieldName = 'STATUS'
      Origin = 'DOCUMENTO.CODDOCUMENTO'
      Visible = False
      Size = 1
    end
    object FloatField10: TFloatField
      FieldName = 'IDFORCLI'
      Visible = False
    end
    object StringField10: TStringField
      DisplayWidth = 2
      FieldName = 'OPERACAO'
      Visible = False
      Size = 2
    end
    object StringField11: TStringField
      FieldName = 'NUMLEITCODBARRAS'
      Size = 60
    end
    object StringField12: TStringField
      FieldName = 'NUMDIGCODBARRAS'
      Size = 60
    end
    object FloatField11: TFloatField
      FieldName = 'VLRLIQUIDO'
      DisplayFormat = '#,##0.00'
    end
    object StringField13: TStringField
      FieldName = 'RAZAOSOCIAL'
      Size = 60
    end
    object StringField14: TStringField
      FieldName = 'FORNECEDOR'
      Size = 60
    end
    object StringField15: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object StringField16: TStringField
      FieldName = 'TIPO'
      Size = 6
    end
  end
  object SqldocPendentes: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  D.IDFORCLI,'
      '  D.OPERACAO,'
      '  D.CODTIPDOC,'
      '  D.IDPESSOA,'
      '  D.CODDOCUMENTO,'
      '  D.NODOCUMENTO,'
      '  D.COMPLDOCUMENTO,'
      '  D.DATAPROGRAMADA,'
      '  D.DATAVENCTO,'
      '  D.IDMODULO,'
      '  D.RECPAG,'
      '  P.NOME,'
      '  D.STATUS,'
      '  D.MOECODIGO,'
      '  D.PLANO,'
      '  D.PLACONTA,'
      '  D.CODSUBCONTA,'
      '  D.CODCENTROCUSTO,'
      '  D.CODGRUPOCNAB,'
      '  D.NOSSONUMERO,'
      '  L.NUMLANCTO,'
      '  L.DATALANCTO,'
      '  L.VLRLIQUIDO,'
      '  L.VALOR,'
      '  L.VALOROUTRAMOEDA,'
      '  L.DEBCRE,'
      '  DECODE(SIGN(D.DATAVENCTO - SYSDATE), -1, 1, 0) AS SITUACAO,'
      '  2 AS STATUSVALOR, '
      ' PLANO.NOME AS PLANOPREV'
      ''
      'FROM'
      '  DOCUMENTO D,'
      '  PESSOA P,'
      '  LANCTODOCUM L,'
      '  (select distinct pp.idplanoprev, pp.nome, r.coddocumento'
      'from planprev pp, planprevcontabil pc, rateiodocum r'
      'where pp.idplanoprev = pc.idplanoprevprev and'
      'pc.idplanoprev = r.idplanoprev'
      'union'
      'select pc.idplanoprev, pc.nome, r.coddocumento'
      'from planprevcontabil pc, rateiodocum r'
      'where idplanoprevprev is null and'
      'pc.idplanoprev = r.idplanoprev) plano'
      ''
      'WHERE'
      ''
      '  1 = 2  '
      '')
    ClientDataSet = CdsDocPendentes
    Left = 501
    Top = 345
  end
end
