inherited frmCorrecaoMonet: TfrmCorrecaoMonet
  Left = 213
  Top = 138
  HelpContext = 7190023
  Caption = 'Correção Monetária dos Processos Selecionados'
  ClientHeight = 540
  ClientWidth = 782
  Font.Style = []
  FormStyle = fsMDIChild
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 782
    Height = 501
    inherited pnResult: TPanel
      Width = 778
      Height = 497
    end
    inherited pgctrlPrincipal: TPageControl
      Width = 778
      Height = 497
      ActivePage = tbshGeral
      inherited tbshGeral: TTabSheet
        object SpeedButton1: TSpeedButton [0]
          Left = 12
          Top = 338
          Width = 23
          Height = 22
          Visible = False
          OnClick = SpeedButton1Click
        end
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
      inherited tbshObjetos: TTabSheet
        inherited gpEtapa: TGroupBox
          inherited lblDe: TLabel
            Width = 17
          end
          inherited lblAte: TLabel
            Width = 19
          end
        end
      end
      object tbshCorrecaoMonet: TTabSheet
        Caption = 'Correção Monetária'
        ImageIndex = 4
        object lblAtualizar: TLabel
          Left = 8
          Top = 3
          Width = 62
          Height = 13
          Caption = 'Atualizar Até:'
        end
        object Label7: TLabel
          Left = 225
          Top = 328
          Width = 152
          Height = 16
          Caption = 'Etapa(s) para correção'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label10: TLabel
          Left = 181
          Top = 328
          Width = 37
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          Caption = '0'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object PageControlRateio: TPageControl
          Left = -1
          Top = 140
          Width = 775
          Height = 186
          ActivePage = tbshSelecao
          TabOrder = 0
          object tbshSelecao: TTabSheet
            Caption = 'Seleção dos Processos a Corrigir'
            object Label11: TLabel
              Left = 5
              Top = 21
              Width = 76
              Height = 16
              Caption = '                   '
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label12: TLabel
              Left = 512
              Top = 90
              Width = 128
              Height = 13
              Caption = 'Processo Selecionado :'
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblProc: TLabel
              Left = 646
              Top = 90
              Width = 24
              Height = 13
              Caption = '......'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label13: TLabel
              Left = 484
              Top = 47
              Width = 59
              Height = 13
              Caption = 'Programa:'
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblProg: TLabel
              Left = 578
              Top = 47
              Width = 24
              Height = 13
              Caption = '......'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label16: TLabel
              Left = 484
              Top = 67
              Width = 85
              Height = 13
              Caption = 'Sub-Programa:'
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblSubProg: TLabel
              Left = 578
              Top = 67
              Width = 24
              Height = 13
              Caption = '......'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label18: TLabel
              Left = 512
              Top = 110
              Width = 127
              Height = 13
              Caption = 'Objeto atualizado        :'
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblObj: TLabel
              Left = 647
              Top = 110
              Width = 24
              Height = 13
              Caption = '......'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label14: TLabel
              Left = 484
              Top = 135
              Width = 52
              Height = 13
              Caption = 'Situação:'
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblSit: TLabel
              Left = 543
              Top = 135
              Width = 18
              Height = 13
              Caption = '......'
              Font.Charset = ANSI_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object chklstProcesso: TColorCheckListBox
              Left = 0
              Top = 42
              Width = 471
              Height = 116
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Lucida Console'
              Font.Style = []
              ItemHeight = 13
              ParentFont = False
              Style = lbOwnerDrawFixed
              TabOrder = 0
              OnClick = chklstProcessoClick
            end
            object bbtnSelTodosFunc: TBitBtn
              Left = 353
              Top = 3
              Width = 116
              Height = 33
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
              Left = 472
              Top = 3
              Width = 113
              Height = 33
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
              Left = 615
              Top = 3
              Width = 130
              Height = 33
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
          Left = 6
          Top = 18
          Width = 103
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
          OnExit = dtedLimiteExit
        end
        object gbxOpcoes: TGroupBox
          Left = 130
          Top = 3
          Width = 81
          Height = 119
          Caption = 'Opções'
          TabOrder = 2
          object cbxObjetos: TCheckBox
            Left = 5
            Top = 26
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
            Enabled = False
            State = cbChecked
            TabOrder = 2
          end
        end
        object gbxRecursos: TGroupBox
          Left = 219
          Top = 33
          Width = 529
          Height = 45
          Caption = 'Indice e Juros para Recursos'
          TabOrder = 3
          Visible = False
          object Label8: TLabel
            Left = 481
            Top = 18
            Width = 31
            Height = 13
            Caption = '% a.m.'
          end
          object dblckIndRecursos: TwwDBLookupCombo
            Left = 12
            Top = 15
            Width = 407
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
            Left = 430
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
          Left = 219
          Top = 77
          Width = 529
          Height = 45
          Caption = 'Indice e Juros para Custas'
          TabOrder = 4
          object Label9: TLabel
            Left = 481
            Top = 18
            Width = 31
            Height = 13
            Caption = '% a.m.'
          end
          object dblckIndCustas: TwwDBLookupCombo
            Left = 12
            Top = 15
            Width = 405
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
            Left = 430
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
          Enabled = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 5
          OnClick = cbxProcessoClick
        end
        object cbxEtapa: TCheckBox
          Left = 6
          Top = 62
          Width = 119
          Height = 17
          Hint = 'Usa Indice e Juros do Tipo de Etapa'
          Caption = 'do Tipo Etapa <----------'
          Checked = True
          ParentShowHint = False
          ShowHint = True
          State = cbChecked
          TabOrder = 6
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
          TabOrder = 7
          OnClick = cbxDesfazerClick
        end
        object dbgEtapas: TwwDBGrid
          Left = 0
          Top = 349
          Width = 770
          Height = 120
          PictureMasks.Strings = (
            'VALORREC'#9'###,###,##0.00'#9'T'#9'T'
            'VALORCUSTAS'#9'###,###,##0.00'#9'T'#9'T')
          Selected.Strings = (
            'NUMPROCTRAB'#9'8'#9'Processo'
            'NUMSEQ'#9'5'#9'Seq.'
            'DESCRICAO'#9'51'#9'Etapa'
            'VALORREC'#9'13'#9'Valor Recurso'
            'VALORCUSTAS'#9'13'#9'Valor Custas'
            'DATAREALOCOR'#9'14'#9'Data Ocorrêcia'
            'DATAPREVOCORR'#9'13'#9'Data Correção')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alBottom
          DataSource = dsEtapa
          TabOrder = 8
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          TitleLines = 1
          TitleButtons = False
          IndicatorColor = icBlack
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 501
    Width = 782
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 542
    Top = 33
    TargetsData = (
      1
      1
      (
        ''
        'Filter'
        0))
  end
  inherited Cmp_Padrao: TCmParamReport
    Left = 48
    Top = 160
  end
  inherited dsProcesso: TwwDataSource
    Left = 48
    Top = 464
  end
  inherited CdsProcesso: TCMClientDataSet
    Left = 46
    Top = 418
  end
  inherited sqlProcesso: TCMSqlParams
    Left = 14
    Top = 228
  end
  inherited CdsAdvog2: TCMClientDataSet
    Left = 116
    Top = 456
  end
  inherited CdsAdvog1: TCMClientDataSet
    Left = 108
    Top = 416
  end
  inherited CdsVaraJustica: TCMClientDataSet
    Left = 244
    Top = 426
  end
  inherited CdsAT: TCMClientDataSet
    Left = 180
    Top = 455
  end
  inherited CdsUF: TCMClientDataSet
    Left = 176
    Top = 413
  end
  inherited CdsTipoProc: TCMClientDataSet
    Left = 159
    Top = 296
  end
  inherited CdsTipoAcao: TCMClientDataSet
    Left = 235
    Top = 297
  end
  inherited CdsObjeto: TCMClientDataSet
    Left = 233
    Top = 248
  end
  inherited CdsCidade: TCMClientDataSet
    Left = 345
    Top = 294
  end
  inherited CdsEtapa: TCMClientDataSet
    Active = True
    Left = 287
    Top = 285
    Data = {
      7E0900009619E0BD01000000180000005C0000000000030000007E0909444553
      43524943414F0100490000000100055749445448020002002800064E554D5345
      5108000400000000000856414C4F5252454308000400000000000C4441544152
      45414C4F434F5208000800000000000D44415441505245564F434F5252080008
      00000000000B56414C4F5243555354415308000400000000000B4E554D50524F
      435452414208000400000000000C49445245434C414D414E5445080004000000
      00000A49445449504F50524F4308000400000000000C49444144564F47524543
      544508000400000000000B434F445449504F53454E5408000400000000000943
      4F4449474F5452540800040000000000034A434A010049000000010005574944
      5448020002000A000A5154444552454354455308000400000000000944415441
      4E4F54494608000800000000000844415441504F535408000800000000000A50
      524F435452544E554D01004900000001000557494454480200020019000A5052
      4F435453544E554D01004900000001000557494454480200020019000D444154
      4150524556454E43455208000800000000000B4441544145464554454E430800
      08000000000009435553544F50524F430800040000000000095449504F454E43
      455201004900000002000753554254595045020049000A004669786564436861
      72000557494454480200020001000A464C4753495450524F4308000400000000
      000C515444455041524341434F5208000400000000000C49444144564F475245
      43444108000400000000000C49444153534953545445434E0800040000000000
      0A50524F434A434A4E554D01004900000001000557494454480200020019000A
      494E444D41544552494108000400000000000A49445449504F4143414F080004
      00000000000A4944454E54504153544101004900000001000557494454480200
      0200280009444154414A55495A4F08000800000000000D4944564152414A5553
      5449434108000400000000000949444349444144455308000400000000000B49
      444144564F474341534108000400000000000D464C4750415254454154495641
      08000400000000000F49444C49544953434F4E534F5254450800040000000000
      0F494450524F4356494E43554C41444F08000400000000000C464C4756494E43
      554C41444F08000400000000000D5452474454494E434C5553414F0800080000
      0000000F54524755534552494E434C5553414F01004900000001000557494454
      48020002001E000B4445535045534150524F4308000400000000000E4E554D56
      4152414A5553544943410800040000000000074944504154524F080004000000
      00000B4944504C414E4F5052455608000400000000000B434F44535542434F4E
      544108000400000000000D4944454D505245534150524F500800040000000000
      0E434F4443454E54524F435553544F0100490000000200075355425459504502
      0049000A0046697865644368617200055749445448020002000A0009554E4944
      4E45474F4308000400000000000B494E4454415841434F4E5608000400000000
      00074944524547524108000400000000000D4D4F45444150524F435452414208
      000400000000000849444D4F5449564F08000400000000000B4E554D50524F43
      4558454301004900000001000557494454480200020019000E4944564152414A
      5553544943413308000400000000000E4944564152414A555354494341320800
      04000000000009444154414A55524F53080008000000000009544158414A5552
      4F5308000400000000000A44415441414C5453495408000800000000000F5641
      4C4F52434F4E44454E4143414F08000400000000000D494E44434F4E44454E41
      43414F08000400000000000D4E554D5052454341544F52494101004900000001
      000557494454480200020019000F434F4443435553544F435041525445010049
      00000002000753554254595045020049000A0046697865644368617200055749
      445448020002000A00044E4F4D45010049000000010005574944544802000200
      3C00045449504F01004900000002000753554254595045020049000A00466978
      656443686172000557494454480200020001000C4E554D444F43554D454E544F
      01004900000002000753554254595045020049000A0046697865644368617200
      055749445448020002001200084944504553534F4108000400000000000B4944
      53494E44494341544F08000400000000000A4944464F4E545245435208000400
      000000000949444752494E535452080004000000000009494450524F46495353
      080004000000000008444154414E4153430800080000000000045345584F0100
      4900000002000753554254595045020049000A00466978656443686172000557
      4944544802000200010008455354434956494C01004900000002000753554254
      595045020049000A00466978656443686172000557494454480200020001000A
      4E554D4445504952524608000400000000000A4E554D44455053414C46080004
      0000000000094E554D444550544F5408000400000000000D464C474953454E54
      4F49525246080004000000000009434F52504553534F4108000400000000000D
      464C47444546494349454E544508000400000000000643494441444501004900
      000001000557494454480200020032000A4C4F475241444F55524F0100490000
      000100055749445448020002003C0009434F4445535441444F01004900000002
      000753554254595045020049000A004669786564436861720005574944544802
      0002000300064E554D45524F0100490000000100055749445448020002000800
      0B434F4D504C454D454E544F0100490000000100055749445448020002001400
      0642414952524F01004900000001000557494454480200020014000343455001
      004900000001000557494454480200020008000C4441544144454D495353414F
      01004900000002000753554254595045020049000A0046697865644368617200
      0557494454480200020001000C4441544141444D495353414F01004900000002
      000753554254595045020049000A004669786564436861720005574944544802
      0002000100094944504553534A5552080004000000000008494445535441444F
      0800040000000000084E4F4D4556415241010049000000010005574944544802
      000200280009454E4345525241444F0100490000000200075355425459504502
      0049000A004669786564436861720005574944544802000200030002000D4445
      4641554C545F4F5244455202008200010000000200044C434944040001000908
      0000}
  end
  inherited CdsSentenca: TCMClientDataSet
    Left = 347
    Top = 254
  end
  inherited CdsEstab: TCMClientDataSet
    Left = 467
    Top = 306
  end
  inherited CdsPlano: TCMClientDataSet
    Left = 463
    Top = 275
  end
  inherited CdsPatro: TCMClientDataSet
    Left = 465
    Top = 238
  end
  inherited CdsProfis: TCMClientDataSet
    Left = 525
    Top = 294
  end
  inherited CdsCargo: TCMClientDataSet
    Left = 519
    Top = 265
  end
  inherited CdsGrauInstr: TCMClientDataSet
    Left = 525
    Top = 226
  end
  inherited CdsSindic: TCMClientDataSet
    Left = 582
    Top = 297
  end
  inherited CdsLotacao: TCMClientDataSet
    Left = 584
    Top = 256
  end
  object CdsTipoDesemb: TCMClientDataSet [27]
    Aggregates = <>
    Params = <>
    Left = 408
    Top = 282
  end
  object CdsTipoOper: TCMClientDataSet [28]
    Aggregates = <>
    Params = <>
    Left = 408
    Top = 268
  end
  object CdsTipoDoc: TCMClientDataSet [29]
    Aggregates = <>
    Params = <>
    Left = 408
    Top = 254
  end
  object CdsMoeda: TCMClientDataSet [30]
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
  object CdsMoeda2: TCMClientDataSet [31]
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
    Left = 640
    Top = 89
  end
  object qryListaProcesso: TQuery [32]
    DatabaseName = 'BaseDados'
    Left = 214
    Top = 162
  end
  inherited CMSqlText: TCMSqlParams
    Left = 18
    Top = 270
  end
  inherited CMSqlTextEtapa: TCMSqlParams
    Left = 274
    Top = 190
  end
  inherited CMSqlEtapa: TCMSqlParams
    SQL.Strings = (
      'SELECT DISTINCT'
      
        '  TR.DESCRICAO, ETP.NUMSEQ, ETP.VALORREC, ETP.DATAREALOCOR, ETP.' +
        'DATAPREVOCORR, ETP.VALORCUSTAS, PT.NUMPROCTRAB'
      '  --PT.*, RECLAMANTES.*, CI.IDESTADO, VJ.DESCRICAO AS NOMEVARA,'
      
        ' -- CASE WHEN NVL(PT.FLGSITPROC,0) = 1 THEN '#39'Sim'#39' ELSE '#39'Não'#39' END' +
        ' AS ENCERRADO'
      'FROM'
      
        '  PROCESSOTRAB PT, CIDADES CI, VARAJUSTICA VJ, TIPORECTRAB TR, E' +
        'TAPAPROCTRAB ETP,'
      '  (SELECT DISTINCT'
      '     P.NOME, P.TIPO, P.NUMDOCUMENTO, P.IDPESSOA, PF.IDSINDICATO,'
      '     PF.IDFONTRECR, PF.IDGRINSTR, PF.IDPROFISS,'
      
        '     PF.DATANASC, PF.SEXO, PF.ESTCIVIL, PF.NUMDEPIRRF, PF.NUMDEP' +
        'SALF,'
      
        '     PF.NUMDEPTOT, PF.FLGISENTOIRRF, PF.CORPESSOA, PF.FLGDEFICIE' +
        'NTE,'
      '     CI.NOME AS CIDADE, E.LOGRADOURO, E.CODESTADO, E.NUMERO,'
      '     E.COMPLEMENTO, E.BAIRRO, E.CEP,'
      
        '     ('#39' '#39') AS DATADEMISSAO, ('#39' '#39') AS DATAADMISSAO, 0 AS IDPESSJU' +
        'R'
      '   FROM'
      
        '     PESSOA P, PESSOAFISICA PF, ENDPESS E, CIDADES CI, PROCESSOT' +
        'RAB PT'
      '   WHERE'
      '     (PT.IDRECLAMANTE    = P.IDPESSOA) AND'
      '     (P.IDENDRESIDENCIAL = E.IDENDERECO(+)) AND'
      '     (E.IDCIDADES        = CI.IDCIDADES(+)) AND'
      '     (P.IDPESSOA         = PF.IDPESSOA(+))'
      '  ) RECLAMANTES'
      
        '          ,(SELECT E1.NUMPROCTRAB, E1.NUMSEQ, E1.CODTIPORECURSO,' +
        ' E1.NUMSEQVINC'
      '            FROM ETAPAPROCTRAB E1'
      '            WHERE  NOT EXISTS (SELECT 1'
      '                               FROM ETAPAPROCTRAB E2'
      '                               WHERE E2.CODTIPORECURSO = 1034'
      '                               AND E2.NUMSEQVINC     > 0'
      '                               AND E2.NUMSEQVINC     = E1.NUMSEQ'
      
        '                               AND E2.NUMPROCTRAB    = E1.NUMPRO' +
        'CTRAB)'
      '            AND E1.CODTIPORECURSO <> 1034'
      
        '                                                       ) ETAPASR' +
        'ECURSO'
      'WHERE'
      '  (PT.IDRECLAMANTE  = RECLAMANTES.IDPESSOA) AND'
      '  (ETP.CODTIPORECURSO = TR.CODTIPORECURSO) AND'
      '  (PT.NUMPROCTRAB = ETP.NUMPROCTRAB) AND      '
      '  (PT.IDVARAJUSTICA = VJ.IDVARAJUSTICA(+)) AND'
      '  (PT.IDCIDADES     = CI.IDCIDADES(+)) AND'
      '  (PT.NUMPROCTRAB = ETAPASRECURSO.NUMPROCTRAB (+)) AND'
      '  (PT.NUMPROCTRAB >= 19567) AND'
      '  (PT.NUMPROCTRAB <= 19567) and'
      '   1=2')
    Left = 354
    Top = 190
  end
  inherited CdsEtapaGrid: TCMClientDataSet
    Active = True
    Filtered = True
    Left = 340
    Top = 420
    Data = {
      B80000009619E0BD010000001800000007000000000003000000B80009444553
      43524943414F0100490000000100055749445448020002002800064E554D5345
      5108000400000000000856414C4F5252454308000400000000000C4441544152
      45414C4F434F5208000800000000000D44415441505245564F434F5252080008
      00000000000B56414C4F5243555354415308000400000000000B4E554D50524F
      435452414208000400000000000100044C4349440400010009080000}
    object CdsEtapaGridNUMPROCTRAB: TFloatField
      DisplayLabel = 'Processo'
      DisplayWidth = 8
      FieldName = 'NUMPROCTRAB'
    end
    object CdsEtapaGridNUMSEQ: TFloatField
      DisplayLabel = 'Seq.'
      DisplayWidth = 5
      FieldName = 'NUMSEQ'
    end
    object CdsEtapaGridDESCRICAO: TStringField
      DisplayLabel = 'Etapa'
      DisplayWidth = 51
      FieldName = 'DESCRICAO'
      Size = 40
    end
    object CdsEtapaGridVALORREC: TFloatField
      DisplayLabel = 'Valor Recurso'
      DisplayWidth = 13
      FieldName = 'VALORREC'
      DisplayFormat = '###,###,##0.00'
    end
    object CdsEtapaGridVALORCUSTAS: TFloatField
      DisplayLabel = 'Valor Custas'
      DisplayWidth = 13
      FieldName = 'VALORCUSTAS'
      DisplayFormat = '###,###,##0.00'
    end
    object CdsEtapaGridDATAREALOCOR: TDateTimeField
      DisplayLabel = 'Data Ocorrêcia'
      DisplayWidth = 14
      FieldName = 'DATAREALOCOR'
    end
    object CdsEtapaGridDATAPREVOCORR: TDateTimeField
      DisplayLabel = 'Data Correção'
      DisplayWidth = 13
      FieldName = 'DATAPREVOCORR'
    end
  end
  object dsEtapa: TwwDataSource
    DataSet = CdsEtapaGrid
    Left = 400
    Top = 424
  end
  object Query1: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'BEGIN'
      
        'INSERT INTO TRDXCRESPON (CODCENTRORESPON, CODTIPRECDES, RECPAG, ' +
        'IDPESSOA) VALUES ('#39'9993'#39', '#39'1080003'#39', '#39'P'#39', 1);'
      
        'INSERT INTO TRDXCRESPON (CODCENTRORESPON, CODTIPRECDES, RECPAG, ' +
        'IDPESSOA) VALUES ('#39'9993'#39', '#39'1080005'#39', '#39'P'#39', 1);'
      
        'INSERT INTO TRDXCRESPON (CODCENTRORESPON, CODTIPRECDES, RECPAG, ' +
        'IDPESSOA) VALUES ('#39'9993'#39', '#39'1080006'#39', '#39'P'#39', 1);'
      
        'INSERT INTO TRDXCRESPON (CODCENTRORESPON, CODTIPRECDES, RECPAG, ' +
        'IDPESSOA) VALUES ('#39'9993'#39', '#39'1080007'#39', '#39'P'#39', 1);'
      
        'INSERT INTO TRDXCRESPON (CODCENTRORESPON, CODTIPRECDES, RECPAG, ' +
        'IDPESSOA) VALUES ('#39'9993'#39', '#39'1080008'#39', '#39'P'#39', 1);'
      
        'INSERT INTO TRDXCRESPON (CODCENTRORESPON, CODTIPRECDES, RECPAG, ' +
        'IDPESSOA) VALUES ('#39'9993'#39', '#39'1080009'#39', '#39'P'#39', 1);'
      
        'INSERT INTO TRDXCRESPON (CODCENTRORESPON, CODTIPRECDES, RECPAG, ' +
        'IDPESSOA) VALUES ('#39'9993'#39', '#39'1080010'#39', '#39'P'#39', 1);'
      
        'INSERT INTO TRDXCRESPON (CODCENTRORESPON, CODTIPRECDES, RECPAG, ' +
        'IDPESSOA) VALUES ('#39'9993'#39', '#39'1080011'#39', '#39'P'#39', 1);'
      
        'INSERT INTO TRDXCRESPON (CODCENTRORESPON, CODTIPRECDES, RECPAG, ' +
        'IDPESSOA) VALUES ('#39'9993'#39', '#39'1080012'#39', '#39'P'#39', 1);'
      
        'INSERT INTO TRDXCRESPON (CODCENTRORESPON, CODTIPRECDES, RECPAG, ' +
        'IDPESSOA) VALUES ('#39'9993'#39', '#39'1080013'#39', '#39'P'#39', 1);'
      
        'INSERT INTO TRDXCRESPON (CODCENTRORESPON, CODTIPRECDES, RECPAG, ' +
        'IDPESSOA) VALUES ('#39'9993'#39', '#39'0020024'#39', '#39'P'#39', 1);'
      'END;'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 70
    Top = 364
  end
end
