inherited frmRateioDespesas: TfrmRateioDespesas
  Left = 180
  Top = 127
  HelpContext = 7190022
  Caption = 'Rateio de Despesas Judiciais e Administrativas'
  Font.Style = []
  FormStyle = fsMDIChild
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    inherited pgctrlPrincipal: TPageControl
      ActivePage = tbshRateio
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
      object tbshRateio: TTabSheet
        Caption = 'Rateio'
        ImageIndex = 4
        OnShow = tbshRateioShow
        object Label7: TLabel
          Left = 127
          Top = 4
          Width = 116
          Height = 13
          Caption = 'Valor a Ser Rateado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label8: TLabel
          Left = 259
          Top = 4
          Width = 255
          Height = 13
          Caption = 'Escolha uma Etapa para a Despesa Rateada'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label9: TLabel
          Left = 13
          Top = 4
          Width = 87
          Height = 13
          Caption = 'Data do Rateio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object PageControlRateio: TPageControl
          Left = 0
          Top = 52
          Width = 611
          Height = 282
          ActivePage = tbshSelecao
          Align = alBottom
          TabOrder = 3
          object tbshSelecao: TTabSheet
            Caption = 'Seleção dos Processos a Ratear'
            object chklstProcesso: TColorCheckListBox
              Left = 1
              Top = 44
              Width = 592
              Height = 222
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
            object bbtnRatear: TBitBtn
              Left = 395
              Top = 3
              Width = 130
              Height = 38
              Caption = '&Efetuar o Rateio'
              Default = True
              Enabled = False
              TabOrder = 3
              OnClick = bbtnRatearClick
              Glyph.Data = {
                76040000424D7604000000000000760000002800000040000000200000000100
                0400000000000004000000000000000000001000000000000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                8888888888888888888888888888888888888888888888888888888888888888
                88888888888888888888888888888888888888FFFFFFFFFFFFF8888888888888
                88888000000000000088888888888888888887777777777777F8888888888888
                8888807707FFF70770888888888888888888877777F7F77777F8888888888888
                8888807707FCF70770888888888888888888877777F7F77777F8888888888888
                8888807707FCF70770888888888888888888877777F7F77777F8888888888888
                8888807777F6F77770888888888888888888877777F7F77777F8888888888888
                8888807777FCF77770888888888888888888877777F7F7777788888888888888
                8888880000000000088888888888888888888877777777777888888888888888
                8888888888888888888888888888888888888888888FFF888888888888888888
                888888888800088888888888888888888888888888777FF88888888888888888
                88888888803B3088888888888888888888888888877777F88888888888888888
                8888888880B3B088888888888888888888888888877777F88888888888888888
                88888888803B3088888888888888888888888888877777888888888888888888
                8888888888000888888888888888888888888888887778888888888888888888
                88888888888F88888888888FF888FFF888FF88888888F888888888BB888B4B88
                8BB8888888F4888888888877FFF777F8F77F88888887FF88888888BBBB84CC8B
                BBB888888F4CC8888888887777F777F77778888888777FF88888888B84CCCCCC
                8B888888F4CCCC8888888887F7777777F7F88888877777FF8888888B4C88C88C
                4B8888884CCCCCC88888888777F87F87778888887777777888888888CC88C88C
                488888888F4CC8888888888877887F877F88888888777F88888888888888C88C
                488888888F4CC88888888888F8887FF778F8888888777F888888888B8884CCCC
                8B8888888F4CC88888888887F8F7777787FF888888777F88888888BB84CCCC88
                8BB8F8F8FF4CC88888888877F77777888778F8F8FF777F888888888B4C88C888
                8B84848444CCC8888888888777F87F88F787F7F777777F88888888884C88C88C
                488C8C8CCCCCC8888888888877F87F877FF7F7F7777778888888888B4C88C88C
                4B8C8C8CCCCC88888888888777FF7FF777F78787777788888888888B8CCCCCC4
                8B8888888888888888888887F7777777F7FF788888888888888888BBBB8CC48B
                BBB888888888888888888877778777F7777F888888888888888888BB888BCB88
                8BB8888888888888888888778887778887788888888888888888888888888888
                8888888888888888888888888888888888888888888888888888888888888888
                8888888888888888888888888888888888888888888888888888}
              NumGlyphs = 2
              Spacing = 2
            end
          end
          object tbshCAP: TTabSheet
            Caption = 'Contabilização e/ou Contas a Pagar'
            ImageIndex = 1
            object gbxCAP: TGroupBox
              Left = 22
              Top = 174
              Width = 430
              Height = 63
              Caption = 'Contas a Pagar'
              TabOrder = 0
              object Label47: TLabel
                Left = 122
                Top = 16
                Width = 94
                Height = 13
                Caption = 'Tipo de Documento'
              end
              object Label46: TLabel
                Left = 14
                Top = 16
                Width = 80
                Height = 13
                Caption = 'Data Pagamento'
              end
              object dblckTipoDoc: TwwDBLookupCombo
                Left = 119
                Top = 31
                Width = 300
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCRICAO'#9'35'#9'DESCRICAO')
                LookupTable = CdsTipoDoc
                LookupField = 'CODTIPDOC'
                Style = csDropDownList
                TabOrder = 0
                AutoDropDown = True
                ShowButton = True
                UseTFields = False
                AllowClearKey = True
                OnCloseUp = dblckTipoDocCloseUp
              end
              object dtPagamento: TCMDateTimePicker
                Left = 12
                Top = 31
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
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ShowButton = True
                TabOrder = 1
                OnExit = dtPagamentoExit
              end
            end
            object gbxContabilizacao: TGroupBox
              Left = 22
              Top = 67
              Width = 430
              Height = 45
              Caption = 'Tipo de Operação (Contabilização)'
              TabOrder = 1
              object dblckTipOper: TwwDBLookupCombo
                Left = 12
                Top = 15
                Width = 405
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
                OnCloseUp = dblckTipOperCloseUp
              end
            end
            object gbkTipoDesemb: TGroupBox
              Left = 22
              Top = 16
              Width = 430
              Height = 45
              Caption = 'Tipo de Desembolso'
              TabOrder = 2
              object dblckTipoDesemb: TwwDBLookupCombo
                Left = 12
                Top = 15
                Width = 405
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCRICAO'#9'35'#9'DESCRICAO')
                LookupTable = CdsTipoDesemb
                LookupField = 'CODTIPRECDES'
                Style = csDropDownList
                TabOrder = 0
                AutoDropDown = True
                ShowButton = True
                UseTFields = False
                AllowClearKey = True
                OnCloseUp = dblckTipoDesembCloseUp
              end
            end
            object cmprocFonecedor: TCMProcuraForCli
              Left = 22
              Top = 120
              Width = 430
              Height = 50
              Caption = 'Favorecido'
              TabOrder = 3
              OnExit = cmprocFonecedorExit
              CampoEdit = ceRazaoSocial
              MostraMensagens = True
              Mensagens.EmBranco = 'Fornecedor não pode estar em branco'
              Mensagens.NaoExiste = 'Fornecedor não existe'
              PermiteChaveInvalida = True
              PermiteChaveEmBranco = False
              ForCli = fcFornecedor
              MostraEndereco = True
              StatusForCli = fcAll
              MostraStatusCredito = False
            end
            object bbtnGerarCAP: TBitBtn
              Left = 464
              Top = 90
              Width = 129
              Height = 73
              Caption = '&Gerar Contas a Pagar'
              Default = True
              Enabled = False
              TabOrder = 4
              OnClick = bbtnGerarCAPClick
              Glyph.Data = {
                76040000424D7604000000000000760000002800000040000000200000000100
                0400000000000004000000000000000000001000000000000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                8888888888888888888888888888888888888888888888888888888888888888
                88888888888888888888888888888888888888FFFFFFFFFFFFF8888888888888
                88888000000000000088888888888888888887777777777777F8888888888888
                8888807707FFF70770888888888888888888877777F7F77777F8888888888888
                8888807707FCF70770888888888888888888877777F7F77777F8888888888888
                8888807707FCF70770888888888888888888877777F7F77777F8888888888888
                8888807777F6F77770888888888888888888877777F7F77777F8888888888888
                8888807777FCF77770888888888888888888877777F7F7777788888888888888
                8888880000000000088888888888888888888877777777777888888888888888
                8888888888888888888888888888888888888888888FFF888888888888888888
                888888888800088888888888888888888888888888777FF88888888888888888
                88888888803B3088888888888888888888888888877777F88888888888888888
                8888888880B3B088888888888888888888888888877777F88888888888888888
                88888888803B3088888888888888888888888888877777888888888888888888
                8888888888000888888888888888888888888888887778888888888888888888
                88888888888F88888888888FF888FFF888FF88888888F888888888BB888B4B88
                8BB8888888F4888888888877FFF777F8F77F88888887FF88888888BBBB84CC8B
                BBB888888F4CC8888888887777F777F77778888888777FF88888888B84CCCCCC
                8B888888F4CCCC8888888887F7777777F7F88888877777FF8888888B4C88C88C
                4B8888884CCCCCC88888888777F87F87778888887777777888888888CC88C88C
                488888888F4CC8888888888877887F877F88888888777F88888888888888C88C
                488888888F4CC88888888888F8887FF778F8888888777F888888888B8884CCCC
                8B8888888F4CC88888888887F8F7777787FF888888777F88888888BB84CCCC88
                8BB8F8F8FF4CC88888888877F77777888778F8F8FF777F888888888B4C88C888
                8B84848444CCC8888888888777F87F88F787F7F777777F88888888884C88C88C
                488C8C8CCCCCC8888888888877F87F877FF7F7F7777778888888888B4C88C88C
                4B8C8C8CCCCC88888888888777FF7FF777F78787777788888888888B8CCCCCC4
                8B8888888888888888888887F7777777F7FF788888888888888888BBBB8CC48B
                BBB888888888888888888877778777F7777F888888888888888888BB888BCB88
                8BB8888888888888888888778887778887788888888888888888888888888888
                8888888888888888888888888888888888888888888888888888888888888888
                8888888888888888888888888888888888888888888888888888}
              Layout = blGlyphTop
              NumGlyphs = 2
              Spacing = 2
            end
          end
        end
        object redValor: TRealEdit
          Left = 127
          Top = 18
          Width = 117
          Height = 21
          Alignment = taRightJustify
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Lines.Strings = (
            '0,00')
          ParentFont = False
          TabOrder = 1
          WordWrap = False
          OnChange = redValorChange
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
        end
        object dblcEtapaRateio: TwwDBLookupCombo
          Left = 259
          Top = 18
          Width = 328
          Height = 21
          Hint = 
            'Se Optado, Será Criada uma Etapa com o Valor Rateado para cada P' +
            'rocesso'
          DropDownAlignment = taRightJustify
          LookupTable = CdsEtapa
          LookupField = 'DESCRICAO'
          Style = csDropDownList
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          OnCloseUp = dblcTipoProcCloseUp
        end
        object edDataRateio: TCMDateTimePicker
          Left = 13
          Top = 18
          Width = 102
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
          OnChange = edDataRateioChange
        end
      end
    end
  end
  inherited Cmp_Padrao: TCmParamReport
    Left = 40
    Top = 144
  end
  inherited CdsEtapa: TCMClientDataSet
    StoreDefs = True
  end
  inherited CMSqlTextEtapa: TCMSqlParams
    Left = 218
    Top = 222
  end
  inherited CMSqlEtapa: TCMSqlParams
    Left = 362
    Top = 206
  end
  inherited CdsEtapaGrid: TCMClientDataSet
    Left = 290
    Top = 196
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
end
