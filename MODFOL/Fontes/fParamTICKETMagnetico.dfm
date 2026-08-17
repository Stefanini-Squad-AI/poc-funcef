inherited frmParamTICKETMagnetico: TfrmParamTICKETMagnetico
  Left = 160
  Top = 121
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsToolWindow
  Caption = 'Tickets (Meio MagnÈtico)'
  ClientHeight = 399
  ClientWidth = 460
  Font.Style = []
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 460
    Height = 360
    BorderWidth = 2
    object Label3: TLabel
      Left = 32
      Top = 24
      Width = 32
      Height = 13
      Caption = 'Label3'
    end
    object Label12: TLabel
      Left = 360
      Top = 32
      Width = 38
      Height = 13
      Caption = 'Label12'
    end
    object pgctrlPaginas: TPageControl
      Left = 2
      Top = 2
      Width = 456
      Height = 356
      ActivePage = tbshPrincipal
      Align = alClient
      TabOrder = 0
      object tbshPrincipal: TTabSheet
        Caption = '&OpÁıes Principais'
        object Label13: TLabel
          Left = 6
          Top = 0
          Width = 78
          Height = 13
          Caption = 'Estabelecimento'
        end
        object Label16: TLabel
          Left = 169
          Top = 40
          Width = 74
          Height = 13
          Caption = 'Data do Pedido'
        end
        object Label4: TLabel
          Left = 260
          Top = 40
          Width = 78
          Height = 13
          Caption = 'Data de Entrega'
        end
        object Label11: TLabel
          Left = 350
          Top = 40
          Width = 83
          Height = 13
          Caption = 'CÛdigo do Cliente'
        end
        object Label14: TLabel
          Left = 6
          Top = 82
          Width = 62
          Height = 13
          Caption = 'Respons·vel'
        end
        object dblkcbEstab: TwwDBLookupCombo
          Left = 6
          Top = 14
          Width = 432
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'60'#9'NOME')
          LookupTable = qryNomeEstab
          LookupField = 'IDPESSOA'
          Style = csDropDownList
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          OnChange = dblkcbEstabChange
        end
        object gbxMesAnoRef: TGroupBox
          Left = 6
          Top = 38
          Width = 157
          Height = 41
          Caption = 'MÍs e Ano de ReferÍncia'
          TabOrder = 1
          object cmbMes: TComboBox
            Left = 8
            Top = 14
            Width = 81
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 0
            Items.Strings = (
              'Janeiro'
              'Fevereiro'
              'MarÁo'
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
            Left = 95
            Top = 14
            Width = 53
            Height = 22
            MaxValue = 0
            MinValue = 0
            TabOrder = 1
            Value = 0
          end
        end
        object dtedDataPedido: TCMDateTimePicker
          Left = 169
          Top = 54
          Width = 84
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
          TabOrder = 2
        end
        object dtedDataEntrega: TCMDateTimePicker
          Left = 260
          Top = 54
          Width = 84
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
        object edCodCli: TEdit
          Left = 350
          Top = 54
          Width = 88
          Height = 21
          Hint = 'CÛdigo do Estabelecimento junto ‡ Ticket'
          MaxLength = 10
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
        end
        object dblkcbResp: TwwDBLookupCombo
          Left = 6
          Top = 96
          Width = 432
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'60'#9'NOME')
          LookupTable = qryNomeResp
          LookupField = 'IDPESSOA'
          Style = csDropDownList
          TabOrder = 5
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
        end
        object gbxFunc: TGroupBox
          Left = 6
          Top = 120
          Width = 432
          Height = 198
          Caption = 'Empregados'
          TabOrder = 6
          object gpctrlEmpregados: TPageControl
            Left = 6
            Top = 15
            Width = 419
            Height = 177
            ActivePage = tbshFiltroFunc
            HotTrack = True
            TabOrder = 0
            object tbshListaFunc: TTabSheet
              Caption = '&Lista'
              object chklstFunc: TColorCheckListBox
                Left = 1
                Top = 1
                Width = 273
                Height = 146
                ItemHeight = 13
                Style = lbOwnerDrawFixed
                TabOrder = 0
              end
              object bbtnSelTodosFunc: TBitBtn
                Left = 278
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
                Left = 278
                Top = 29
                Width = 131
                Height = 25
                Caption = '   Inverte SeleÁ„o'
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
              Caption = '&Tipos'
              object gbxTipContra: TGroupBox
                Left = 29
                Top = 24
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
                  Caption = 'LEF'
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
                  Caption = 'Terceirizados'
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
                  Caption = 'Estagi·rios'
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
                  Caption = 'Cess„o'
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
                  Caption = 'AutÙnomos'
                  ParentShowHint = False
                  ShowHint = False
                  TabOrder = 6
                end
              end
            end
          end
        end
      end
      object tbshOpcoes: TTabSheet
        Caption = '&OpÁıes Adicionais'
        object rgTipSigla: TRadioGroup
          Left = 4
          Top = 26
          Width = 132
          Height = 50
          Caption = 'Indicar o C. Custo por'
          Columns = 2
          ItemIndex = 0
          Items.Strings = (
            'Sigla'
            'Nome')
          TabOrder = 0
          TabStop = True
        end
        object gbxImprime: TGroupBox
          Left = 217
          Top = 1
          Width = 222
          Height = 96
          Caption = 'Impress„o de Dados'
          TabOrder = 1
          object cbxRecEncar: TCheckBox
            Left = 31
            Top = 17
            Width = 111
            Height = 17
            Caption = 'Recibo de Encarte'
            TabOrder = 0
          end
          object cbxRelAssinat: TCheckBox
            Left = 31
            Top = 34
            Width = 139
            Height = 17
            Caption = 'RelatÛrio para Assinatura'
            TabOrder = 1
          end
          object cbxRelGer: TCheckBox
            Left = 31
            Top = 51
            Width = 111
            Height = 17
            Caption = 'RelatÛrio Gerencial'
            TabOrder = 2
          end
          object cbxRelResUnid: TCheckBox
            Left = 31
            Top = 68
            Width = 170
            Height = 17
            Caption = 'RelatÛrio Resumo por Unidade'
            TabOrder = 3
          end
        end
        object GroupBox1: TGroupBox
          Left = 4
          Top = 101
          Width = 435
          Height = 218
          Caption = 'Per&sonalizaÁ„o dos Tickets'
          TabOrder = 2
          object Label6: TLabel
            Left = 9
            Top = 17
            Width = 72
            Height = 13
            Caption = 'PersonalizaÁ„o'
          end
          object Label7: TLabel
            Left = 9
            Top = 56
            Width = 81
            Height = 13
            Caption = 'Pers. Linha 1 Tkt'
          end
          object Label8: TLabel
            Left = 9
            Top = 95
            Width = 81
            Height = 13
            Caption = 'Pers. Linha 2 Tkt'
          end
          object Label9: TLabel
            Left = 9
            Top = 135
            Width = 82
            Height = 13
            Caption = 'Pers. Linha 1 Rot'
          end
          object Label10: TLabel
            Left = 9
            Top = 175
            Width = 82
            Height = 13
            Caption = 'Pers. Linha 2 Rot'
          end
          object edPersTicket: TEdit
            Left = 9
            Top = 31
            Width = 265
            Height = 21
            MaxLength = 26
            TabOrder = 0
          end
          object cmbPersLinhaTkt1: TComboBox
            Left = 9
            Top = 70
            Width = 418
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            ParentShowHint = False
            ShowHint = False
            TabOrder = 1
            Items.Strings = (
              'EspaÁos'
              'Pers. 1 do Cadastro (Conf. Ficha Cadastral)'
              'Pers. 2 do Cadastro (Conf. Ficha Cadastral)'
              'Pers. 1 do Cadastro (Conf. Ficha Cadastral)'
              'Nome da Unidade (Conf. Reg. Tipo 2 Nome da Unidade)'
              'Departamento (Conf. Reg. Tipo 3)'
              'Nome do Funcion·rio (Conf. Reg. Tipo 3)'
              
                'Pers. da 1™ ou 2™ Linha do Ticket Montada pelo pelo Cliente Conf' +
                '. Reg. Tipo 3')
          end
          object cmbPersLinhaTkt2: TComboBox
            Left = 9
            Top = 109
            Width = 418
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            ParentShowHint = False
            ShowHint = False
            TabOrder = 2
            Items.Strings = (
              'EspaÁos'
              'Pers. 1 do Cadastro (Conf. Ficha Cadastral)'
              'Pers. 2 do Cadastro (Conf. Ficha Cadastral)'
              'Pers. 1 do Cadastro (Conf. Ficha Cadastral)'
              'Nome da Unidade (Conf. Reg. Tipo 2 Nome da Unidade)'
              'Departamento (Conf. Reg. Tipo 3)'
              'Nome do Funcion·rio (Conf. Reg. Tipo 3)'
              
                'Pers. da 1™ ou 2™ Linha do Ticket Montada pelo pelo Cliente Conf' +
                '. Reg. Tipo 3')
          end
          object cmbPersLinhaRot1: TComboBox
            Left = 9
            Top = 149
            Width = 418
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            ParentShowHint = False
            ShowHint = False
            TabOrder = 3
            Items.Strings = (
              'EspaÁos'
              'Pers. 1 do Cadastro (Conf. Ficha Cadastral)'
              'Pers. 2 do Cadastro (Conf. Ficha Cadastral)'
              'Pers. 1 do Cadastro (Conf. Ficha Cadastral)'
              'Nome da Unidade (Conf. Reg. Tipo 2 Nome da Unidade)'
              'Departamento (Conf. Reg. Tipo 3)'
              'Nome do Funcion·rio (Conf. Reg. Tipo 3)'
              
                'Pers. da 1™ ou 2™ Linha do Ticket Montada pelo pelo Cliente Conf' +
                '. Reg. Tipo 3')
          end
          object cmbPersLinhaRot2: TComboBox
            Left = 9
            Top = 189
            Width = 418
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            ParentShowHint = False
            ShowHint = False
            TabOrder = 4
            Items.Strings = (
              'EspaÁos'
              'Pers. 1 do Cadastro (Conf. Ficha Cadastral)'
              'Pers. 2 do Cadastro (Conf. Ficha Cadastral)'
              'Pers. 1 do Cadastro (Conf. Ficha Cadastral)'
              'Nome da Unidade (Conf. Reg. Tipo 2 Nome da Unidade)'
              'Departamento (Conf. Reg. Tipo 3)'
              'Nome do Funcion·rio (Conf. Reg. Tipo 3)'
              
                'Pers. da 1™ ou 2™ Linha do Ticket Montada pelo pelo Cliente Conf' +
                '. Reg. Tipo 3')
          end
        end
      end
      object tbshPedidoSup: TTabSheet
        Caption = '&Pedido Suplementar'
        object Label1: TLabel
          Left = 6
          Top = 210
          Width = 76
          Height = 13
          Caption = 'Qtde de Tickets'
        end
        object Label5: TLabel
          Left = 146
          Top = 210
          Width = 128
          Height = 13
          Caption = 'Qtde de Tickets por Carnet'
        end
        object Label2: TLabel
          Left = 330
          Top = 210
          Width = 63
          Height = 13
          Caption = 'Valor Unit·rio'
        end
        object rgPedSupl: TRadioGroup
          Left = 6
          Top = 6
          Width = 213
          Height = 45
          Caption = 'Gera o Pedido Suplementar?'
          Columns = 2
          ItemIndex = 1
          Items.Strings = (
            'Sim'
            'N„o')
          TabOrder = 0
          OnClick = rgPedSuplClick
        end
        object rgSomentePedSupl: TRadioGroup
          Left = 232
          Top = 6
          Width = 206
          Height = 45
          Caption = 'Gera somente o Pedido Suplementar?'
          Columns = 2
          ItemIndex = 1
          Items.Strings = (
            'Sim'
            'N„o')
          TabOrder = 1
        end
        object gbxCCusto: TGroupBox
          Left = 6
          Top = 59
          Width = 432
          Height = 142
          Caption = 'Centro de Custo'
          TabOrder = 2
          object chklstCCusto: TColorCheckListBox
            Left = 8
            Top = 15
            Width = 280
            Height = 118
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
          object bbtnSelTodosCCusto: TBitBtn
            Left = 293
            Top = 15
            Width = 131
            Height = 25
            Caption = '   Seleciona Todos'
            TabOrder = 1
            TabStop = False
            OnClick = bbtnSelTodosCCustoClick
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
          object bbtnInverteSelCCusto: TBitBtn
            Left = 293
            Top = 42
            Width = 131
            Height = 25
            Caption = '   Inverte SeleÁ„o'
            TabOrder = 2
            TabStop = False
            OnClick = bbtnInverteSelCCustoClick
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
        object spedNumTicketsSupl: TSpinEdit
          Left = 6
          Top = 224
          Width = 89
          Height = 22
          Hint = 'Quantidade total de Tickets do Pedido Suplementar'
          MaxValue = 0
          MinValue = 0
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          Value = 0
        end
        object spedNumTicketsCarnet: TSpinEdit
          Left = 146
          Top = 224
          Width = 128
          Height = 22
          Enabled = False
          MaxValue = 0
          MinValue = 0
          TabOrder = 4
          Value = 0
        end
        object redValUnit: TRealEdit
          Left = 330
          Top = 224
          Width = 89
          Height = 21
          Alignment = taRightJustify
          Enabled = False
          Lines.Strings = (
            '      0,00')
          TabOrder = 5
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
        end
        object rgAcabSuplem: TRadioGroup
          Left = 6
          Top = 256
          Width = 432
          Height = 61
          Caption = 'Tipo de Acabamento'
          Columns = 3
          Enabled = False
          ItemIndex = 0
          Items.Strings = (
            'Carnet'
            'Blocado'
            'Solto')
          TabOrder = 6
        end
      end
      object tbshIntegraCAP: TTabSheet
        Caption = 'Contas a Pagar'
        object Label19: TLabel
          Left = 6
          Top = 72
          Width = 80
          Height = 13
          Caption = 'Data Pagamento'
        end
        object Label20: TLabel
          Left = 118
          Top = 72
          Width = 94
          Height = 13
          Caption = 'Tipo de Documento'
        end
        object rgFazIntegraCAP: TRadioGroup
          Left = 6
          Top = 16
          Width = 221
          Height = 45
          Caption = 'Faz IntegraÁ„o com o Contas a Pagar ?'
          Columns = 2
          ItemIndex = 1
          Items.Strings = (
            'Sim'
            'N„o')
          TabOrder = 0
          OnClick = rgFazIntegraCAPClick
        end
        object chkRateioCC: TCheckBox
          Left = 243
          Top = 32
          Width = 160
          Height = 17
          Caption = '   Ratear por Centro de Custo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object dtPagamento: TCMDateTimePicker
          Left = 6
          Top = 87
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
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ShowButton = True
          TabOrder = 2
        end
        object dblcTipoDoc: TwwDBLookupCombo
          Left = 118
          Top = 86
          Width = 319
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'35'#9'DESCRICAO')
          LookupTable = qryTipoDoc
          LookupField = 'CODTIPDOC'
          Style = csDropDownList
          Enabled = False
          TabOrder = 3
          AutoDropDown = True
          ShowButton = True
          SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
          AllowClearKey = True
        end
        object cmprocFonecedor: TCMProcuraForCli
          Left = 6
          Top = 127
          Width = 431
          Height = 94
          Caption = 'Fonecedor'
          Enabled = False
          TabOrder = 4
          CampoEdit = ceRazaoSocial
          MostraMensagens = True
          Mensagens.EmBranco = 'Fornecedor n„o pode estar em branco'
          Mensagens.NaoExiste = 'Fornecedor n„o existe'
          PermiteChaveInvalida = True
          PermiteChaveEmBranco = False
          OnChange = cmprocFonecedorChange
          ForCli = fcFornecedor
          MostraEndereco = True
          StatusForCli = fcAll
          MostraStatusCredito = False
          object Label15: TLabel
            Left = 7
            Top = 48
            Width = 97
            Height = 13
            Caption = 'Tipo de Desembolso'
          end
          object bdlckTipoDesemb: TwwDBLookupCombo
            Left = 7
            Top = 62
            Width = 418
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'35'#9'DESCRICAO')
            LookupTable = qryTipoDesenb
            LookupField = 'CODTIPRECDES'
            Style = csDropDownList
            Enabled = False
            TabOrder = 1
            AutoDropDown = True
            ShowButton = True
            SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
            AllowClearKey = True
          end
        end
      end
      object sbshResult: TTabSheet
        Caption = 'Resultado'
        object Bevel1: TBevel
          Left = 0
          Top = 285
          Width = 441
          Height = 38
        end
        object memResult: TMemo
          Left = 0
          Top = 0
          Width = 444
          Height = 283
          Align = alTop
          Color = clBlack
          Font.Charset = ANSI_CHARSET
          Font.Color = clLime
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 0
        end
        object bbtnSalvar: TBitBtn
          Left = 4
          Top = 289
          Width = 116
          Height = 30
          Caption = 'S&alvar'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          OnClick = bbtnSalvarClick
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
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 360
    Width = 460
    inherited tb97Fundo: TToolbar97
      Left = 153
      DockPos = 168
      inherited sep1: TToolbarSep97
        Left = 220
      end
      object ToolbarSep972: TToolbarSep97 [1]
        Left = 109
        Top = 0
        Blank = True
        SizeHorz = 30
      end
      inherited bbtnSair: TBitBtn
        Left = 139
        TabOrder = 1
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 222
        TabOrder = 2
      end
      object bbtnGerar: TBitBtn
        Left = 0
        Top = 0
        Width = 109
        Height = 33
        Caption = '  &Gerar Arquivo'
        Default = True
        TabOrder = 0
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
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 402
    Top = 353
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object svdlgDialogo: TOpenDialog
    DefaultExt = '*.TXT'
    FileName = 'LOG_TICKET.TXT'
    Filter = 'Arquivos Texto|*.TXT|Todos|*.*'
    InitialDir = 'C:\'
    Options = [ofHideReadOnly, ofPathMustExist, ofNoNetworkButton]
    Title = 'Escolha a Pasta para salvar o Resultado da GeraÁ„o'
    Left = 402
    Top = 340
  end
  object qryTicket: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 22
    Top = 354
  end
  object qryNomeResp: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  PF.IDPESSOA, PF.NOME'
      'FROM'
      '  PESSOA PF, FUNCIONARIO F, FILIALPESSOA FP'
      'WHERE'
      '  (F.IDEMPRESA       = :EMPRESA)  AND'
      '  (FP.IDFILIALPESSOA = F.IDESTAB) AND'
      '  (F.IDPESSOA        = PF.IDPESSOA)'
      'ORDER BY'
      '  UPPER(PF.NOME)')
    ValidateWithMask = True
    Left = 92
    Top = 353
    ParamData = <
      item
        DataType = ftInteger
        Name = 'EMPRESA'
        ParamType = ptUnknown
      end>
  end
  object qryNomeEstab: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  PJ.IDPESSOA, PJ.NOME'
      'FROM'
      '  PESSOA PJ, FILIALPESSOA FP'
      'WHERE'
      ''
      '  (PJ.IDGRUPO        = :EMPRESA) AND'
      '  (FP.IDFILIALPESSOA = PJ.IDPESSOA)')
    ValidateWithMask = True
    Left = 22
    Top = 341
    ParamData = <
      item
        DataType = ftInteger
        Name = 'EMPRESA'
        ParamType = ptUnknown
      end>
  end
  object qryEstab: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '  RTRIM(E.LOGRADOURO)  LOGRADOURO,'
      '  E.NUMERO,'
      '  RTRIM(E.COMPLEMENTO) COMPLEMENTO,'
      '  RTRIM(CI.NOME)       CIDADE,'
      '  RTRIM(E.BAIRRO)      BAIRRO,'
      '  SUBSTR(E.CEP,1,5)    CEP,'
      '  RTRIM(ES.CODESTADO)  ESTADO,'
      '  SUBSTR(E.CEP,6,3)    CEP_COMPLEM'
      'FROM'
      '  PESSOA PJ, ENDPESS E, CIDADES CI, ESTADO ES'
      'WHERE'
      '  (PJ.IDPESSOA        = :IDPESSOA)       AND'
      '  (PJ.IDENDCOMERCIAL  = E.IDENDERECO) AND'
      '  (PJ.IDPESSOA        = E.IDPESSOA)   AND'
      '  (E.IDCIDADES        = CI.IDCIDADES) AND'
      '  (CI.IDESTADO        = ES.IDESTADO)')
    ValidateWithMask = True
    Left = 22
    Top = 329
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryTipoDoc: TwwQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      'SELECT '
      '  CODTIPDOC, DESCRICAO, DEBCRE'
      'FROM'
      '  TIPODOCRECPAG'
      'WHERE'
      '  (RECPAG = '#39'P'#39')'
      'ORDER BY'
      '  UPPER(DESCRICAO)')
    ValidateWithMask = True
    Left = 94
    Top = 340
  end
  object qryTipoDesenb: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 94
    Top = 327
  end
  object tblDocumentos: TTable
    Left = 264
    Top = 351
  end
  object ProcuraDirDlg: TProcuraDirDlg
    Caption = 'SeleÁ„o'
    Directory = 
      #28'ÒÜ'#7#0#0#0#0'PÒÜ'#7#0#0#0#0'hÒÜ'#7#0#0#0#0'àÒÜ'#7#0#0#0#0'†ÒÜ'#7#0#0#0#0'∏ÒÜ'#7#0#0#0#0'–ÒÜ'#7#0#0#0#0'ËÒÜ'#7#0#0#0#0 +
      #0'ÚÜ'#7#0#0#0#0#24'ÚÜ'#7#0#0#0#0'0ÚÜ'#7#0#0#0#0'HÚÜ'#7#0#0#0#0'`ÚÜ'#7#0#0#0#0'xÚÜ'#7#0#0#0#0'êÚÜ'#7#0#0#0#0'∞ÚÜ'#7#0#0#0#0 +
      '–ÚÜ'#7#0#0#0#0'ÚÜ'#7#0#0#0#0#8'ÛÜ'#7#0#0#0#0#28'ÛÜ'#7#0#0#0#0'4ÛÜ'#7#0#0#0#0'LÛÜ'#7#0#0#0#0'dÛÜ'#7#0#0#0#0'|ÛÜ'#7#0#0#0#0 +
      'úÛÜ'#7#0#0#0#0'¥ÛÜ'#7#0#0#0#0'ÃÛÜ'#7#0#0#0#0'‡ÛÜ'#7#0#0#0#0'¯ÛÜ'#7#0#0#0#0#16'ÙÜ'#7#0#0#0#0'(ÙÜ'#7#0#0#0#0'@ÙÜ'#7#0#0#0#0 +
      'TÙÜ'#7
    Folder = foCustom
    Options = [bfStatusText]
    ShowPath = True
    Title = 'Escolha a Pasta para a GeraÁ„o do Ticket MagnÈtico'
    Left = 402
    Top = 327
  end
end
