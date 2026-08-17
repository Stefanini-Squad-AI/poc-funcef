inherited frmAjusteOriginal: TfrmAjusteOriginal
  Left = 114
  Top = 129
  HelpContext = 7190032
  Caption = 'Ajuste da Estimativa Original às Penhoras e Depósitos'
  Font.Style = []
  FormStyle = fsMDIChild
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    inherited pgctrlPrincipal: TPageControl
      ActivePage = tbshAjusteOriginal
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
      object tbshAjusteOriginal: TTabSheet
        Caption = 'Ajuste do Original'
        ImageIndex = 4
        object PageControlRateio: TPageControl
          Left = 0
          Top = 44
          Width = 611
          Height = 290
          ActivePage = tbshSelecao
          Align = alBottom
          TabOrder = 0
          object tbshSelecao: TTabSheet
            Caption = 'Seleção dos Processos a Ajustar'
            object chklstProcesso: TColorCheckListBox
              Left = 1
              Top = 44
              Width = 592
              Height = 210
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
            object bbtnAjustar: TBitBtn
              Left = 395
              Top = 3
              Width = 130
              Height = 38
              Caption = '&Efetuar o Ajuste'
              Default = True
              Enabled = False
              TabOrder = 3
              OnClick = bbtnAjustarClick
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
        object gbxContabilizacao: TGroupBox
          Left = 185
          Top = 3
          Width = 305
          Height = 45
          Caption = 'Tipo de Operação (Contabilização)'
          TabOrder = 1
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
      end
    end
  end
  object CdsTipoOper: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 408
    Top = 268
  end
  object CdsHistObjetoGravar: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 242
    Top = 236
  end
end
