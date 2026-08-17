inherited frmCorrecaoMonet: TfrmCorrecaoMonet
  Left = 154
  HelpContext = 7190023
  Caption = 'Correção Monetária dos Processos Selecionados'
  Font.Style = []
  FormStyle = fsMDIChild
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    inherited pgctrlPrincipal: TPageControl
      ActivePage = tbshCorrecaoMonet
      inherited tbshGeral: TTabSheet
        inherited gbxNumPr: TGroupBox
          inherited Label2: TLabel
            Width = 6
          end
        end
        inherited gbxSalario: TGroupBox
          inherited Label4: TLabel
            Width = 6
          end
        end
        inherited gbxFaixaInc: TGroupBox
          inherited Label15: TLabel
            Width = 6
          end
        end
        inherited gbxFaixaAju: TGroupBox
          inherited Label6: TLabel
            Width = 6
          end
        end
        inherited gbxFaixaData: TGroupBox
          inherited Label3: TLabel
            Width = 6
          end
        end
        inherited gbxDataEnc: TGroupBox
          inherited Label5: TLabel
            Width = 6
          end
        end
        inherited gbxTempAdm: TGroupBox
          inherited Label1: TLabel
            Width = 6
          end
        end
      end
      object tbshCorrecaoMonet: TTabSheet
        Caption = 'Correção Monetária'
        ImageIndex = 4
        object lblAtualizar: TLabel
          Left = 9
          Top = 3
          Width = 62
          Height = 13
          Caption = 'Atualizar Até:'
        end
        object PageControlRateio: TPageControl
          Left = 0
          Top = 134
          Width = 611
          Height = 200
          ActivePage = tbshSelecao
          Align = alBottom
          TabOrder = 0
          object tbshSelecao: TTabSheet
            Caption = 'Seleção dos Processos a Corrigir'
            object chklstProcesso: TColorCheckListBox
              Left = 0
              Top = 44
              Width = 603
              Height = 128
              Align = alBottom
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Lucida Console'
              Font.Style = []
              ItemHeight = 13
              ParentFont = False
              Style = lbOwnerDrawFixed
              TabOrder = 0
            end
            object bbtnSelTodosFunc: TBitBtn
              Left = 51
              Top = 3
              Width = 130
              Height = 38
              Caption = '   Seleciona Todos'
              Enabled = False
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
              Left = 203
              Top = 3
              Width = 130
              Height = 38
              Caption = '    Inverte Seleção'
              Enabled = False
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
            object bbtnCorrigir: TBitBtn
              Left = 395
              Top = 3
              Width = 130
              Height = 38
              Caption = '&Efetuar a Correção'
              Default = True
              Enabled = False
              TabOrder = 3
              OnClick = bbtnCorrigirClick
              Glyph.Data = {
                4E030000424D4E030000000000007600000028000000340000001A0000000100
                040000000000D8020000C40E0000C40E00001000000000000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00EDBBDDEEBEBB
                BCEBABEBDBEBBBFFDFDEBDEFEDF9AEDEBFEBEDFB0000BFADFEBBDDEFBCCBFDEB
                DABDFFDBEBBDEDBEDBFE9EDBEDBDEBFE0000DBDBBB9EDFBBBCABBDBDEBBBABBE
                DEDFBEBDBEBCDFBDEDEFBDED0000FEBBBBBBBBDECCC0EEBBBBBBFDEDBFEBEDDB
                ED9AA9EFBBEDEDBB0000DFDBBBBBBBECCCCCDBBBBBBBBDBEDDBDDEBEFACDACBD
                EDDBFBEE0000EBEBFBFECCCCCCCCCCCDFBBFDEFEBEBEBFB0A9A9CA909EBEBDED
                0000EBDDEBDCCCCCFCCEDDCCCBBBEBFBDDEDED0DCBDA99ECACBDEDBB0000DEFE
                BBACCCBDFCDBEBCCCBBDEDEEDEBFADAABEDECEDB09ADBEDE0000DBDBDBECCCFE
                FCCFDFCCCEBEBBDBBEBDE90DFDF99BFEAD0DFEBF0000EDBEEBCCCEBDBCCBEDCC
                CDFDDEFEDDFB0DAEBEBDAEDEDA0EBFDE0000BEBDDEBBDDBEDCEBFDCCCEBBEBDF
                EDEDBFDDBDFA9FBE0D9BDEDB0000DFEEBBFEFFDCCCCDCCCCEB9EDBEBBBDEBFBB
                EED9CA9DBAEDBEEB0000EDBDFBBDBFB9CCCCCCCDDBBFDEDDEEBEDEEDFABABD0E
                CDBFFBDB0000BABBBB9BCCCCCCCCBBEBEBBBBBEBDDBDBDAA0C9CC0EBFBEDEDED
                0000FFB9BBBDCCCE0CCECDDBEBBFBBEBBEDEBE0DE9E0BBDBEDEBFEBE0000EDBE
                FBACCEEFFCDDBEFDDBBFDEDEDEBF90EBDFDCEEBDEFBDBDBD0000FEBDBECCCCBD
                BCCBEDCCCBEDEBBEBDBDEB9CFBE0DEDFD0ADEFEB0000BDDEDBECCCFDBCCFDBCC
                CEDBFEDDEFEDEACCBDEBCBBEBE0EBDBD0000BEBBEBCCCCFBECCBEFCCCBBEDBED
                BDBBDA9BDDB0DEFD099BFDEE0000EFDEDB90CCCCDCCEDCCCCBBBDEBEBEFEDBCA
                EBECAD9BEDEEBEDB0000DBEDBBBFCCCCCCCCCCCCEBBEDBDDFDDBEFBC00909EC0
                9ABDDEBD0000EBDBBBBBBBBDCCCCFDBBBBBBBEBEBEBFDDBDDEADA9DFEBDBEDBB
                0000DFEBBBBABBDECCCCEFBBBBBBEDDBEDBEBEEBED0EACEBDEFEBEFD0000BEDB
                BBBDEBEBBC9BDBEDEBBBBEEFDEDBDFDEBFB0DBEDBDFDFBED0000DEBFBDEBDEDA
                BCCBBFDDEDBEBFBDBDFEBFBDEBE0EFBDEBEBDDBF0000BBBEFBEDBDBFBCABDEBB
                FBFEBBBEFEBDEDEBDDF9DFEBDEDFEEBE0000}
              NumGlyphs = 2
              Spacing = 2
            end
          end
        end
        object dtedLimite: TCMDateTimePicker
          Left = 9
          Top = 18
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
          TabOrder = 1
        end
        object gbxContabilizacao: TGroupBox
          Left = 220
          Top = 3
          Width = 305
          Height = 45
          Caption = 'Tipo de Operação (Contabilização)'
          TabOrder = 3
          object dblckTipOper: TwwDBLookupCombo
            Left = 12
            Top = 15
            Width = 281
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'TIPDESCRICAO'#9'25'#9'TIPDESCRICAO')
            LookupTable = CdsTipoOper
            LookupField = 'TIPCODIGO'
            Style = csDropDownList
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            UseTFields = False
            AllowClearKey = True
          end
        end
        object gbxOpcoes: TGroupBox
          Left = 128
          Top = 3
          Width = 81
          Height = 126
          Caption = 'Opções'
          TabOrder = 2
          object cbxObjetos: TCheckBox
            Left = 5
            Top = 24
            Width = 70
            Height = 17
            Caption = 'Objetos'
            Checked = True
            State = cbChecked
            TabOrder = 0
            OnClick = cbxObjetosClick
          end
          object cbxRecursos: TCheckBox
            Left = 5
            Top = 59
            Width = 70
            Height = 17
            Caption = 'Recursos'
            Checked = True
            State = cbChecked
            TabOrder = 1
            OnClick = cbxRecursosClick
          end
          object cbxCustas: TCheckBox
            Left = 5
            Top = 93
            Width = 70
            Height = 17
            Caption = 'Custas'
            Checked = True
            State = cbChecked
            TabOrder = 2
            OnClick = cbxCustasClick
          end
        end
        object gbxRecursos: TGroupBox
          Left = 220
          Top = 47
          Width = 384
          Height = 45
          Caption = 'Indice e Juros para Recursos'
          TabOrder = 4
          Visible = False
          object Label8: TLabel
            Left = 350
            Top = 18
            Width = 31
            Height = 13
            Caption = '% a.m.'
          end
          object dblckIndRecursos: TwwDBLookupCombo
            Left = 12
            Top = 15
            Width = 281
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'MOEDESC'#9'20'#9'Descrição'
              'MOESIGLA'#9'10'#9'Sigla')
            LookupTable = CdsMoeda
            LookupField = 'MOECODIGO'
            Style = csDropDownList
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            UseTFields = False
            AllowClearKey = True
          end
          object dbredJurosRecursos: TRealEdit
            Left = 299
            Top = 15
            Width = 48
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '      0,00')
            TabOrder = 1
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
        end
        object gbxCustas: TGroupBox
          Left = 220
          Top = 91
          Width = 384
          Height = 45
          Caption = 'Indice e Juros para Custas'
          TabOrder = 5
          Visible = False
          object Label9: TLabel
            Left = 350
            Top = 18
            Width = 31
            Height = 13
            Caption = '% a.m.'
          end
          object dblckIndCustas: TwwDBLookupCombo
            Left = 12
            Top = 15
            Width = 281
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'MOEDESC'#9'20'#9'Descrição'
              'MOESIGLA'#9'10'#9'Sigla')
            LookupTable = CdsMoeda2
            LookupField = 'MOECODIGO'
            Style = csDropDownList
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            UseTFields = False
            AllowClearKey = True
          end
          object dbredJurosCustas: TRealEdit
            Left = 299
            Top = 15
            Width = 48
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '      0,00')
            TabOrder = 1
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
        end
        object cbxProcesso: TCheckBox
          Left = 5
          Top = 96
          Width = 120
          Height = 17
          Hint = 'Usa Indice e Juros do Processo'
          Caption = 'do Processo <---------------'
          Checked = True
          ParentShowHint = False
          ShowHint = True
          State = cbChecked
          TabOrder = 6
          OnClick = cbxProcessoClick
        end
        object cbxEtapa: TCheckBox
          Left = 5
          Top = 62
          Width = 120
          Height = 17
          Hint = 'Usa Indice e Juros do Tipo de Etapa'
          Caption = 'do Tipo Etapa <----------'
          Checked = True
          ParentShowHint = False
          ShowHint = True
          State = cbChecked
          TabOrder = 7
          OnClick = cbxEtapaClick
        end
        object cbxDesfazer: TCheckBox
          Left = 6
          Top = 40
          Width = 120
          Height = 17
          Hint = 'Usa Indice e Juros do Tipo de Etapa'
          Caption = 'Desfazer'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 8
          OnClick = cbxDesfazerClick
        end
      end
    end
  end
  object CdsTipoDesemb: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 408
    Top = 282
  end
  object CdsTipoOper: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 408
    Top = 268
  end
  object CdsTipoDoc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 408
    Top = 254
  end
  object CdsHistObjetoGravar: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 242
    Top = 236
  end
  object CdsMoeda: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'CdsMoedaIndex'
        CaseInsFields = 'MOEDESC'
        Fields = 'MOEDESC'
        Options = [ixCaseInsensitive]
      end>
    IndexName = 'CdsMoedaIndex'
    Params = <>
    ProviderName = 'Dsp'
    StoreDefs = True
    Left = 458
    Top = 81
  end
  object CdsMoeda2: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'CdsMoedaIndex'
        CaseInsFields = 'MOEDESC'
        Fields = 'MOEDESC'
        Options = [ixCaseInsensitive]
      end>
    IndexName = 'CdsMoedaIndex'
    Params = <>
    ProviderName = 'Dsp'
    StoreDefs = True
    Left = 402
    Top = 129
  end
end
