inherited frmCadContribuicaoPortada: TfrmCadContribuicaoPortada
  Left = 74
  Top = 26
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  Caption = 'Cadastro de Contribuições Portadas'
  ClientHeight = 654
  ClientWidth = 1262
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object Label7: TLabel [0]
    Left = 16
    Top = 8
    Width = 75
    Height = 13
    Caption = 'Participantes'
  end
  object Label8: TLabel [1]
    Left = 272
    Top = 8
    Width = 55
    Height = 13
    Caption = 'Matrícula'
  end
  object Label9: TLabel [2]
    Left = 432
    Top = 8
    Width = 71
    Height = 13
    Caption = 'Inscrição Nº'
  end
  object Label10: TLabel [3]
    Left = 584
    Top = 8
    Width = 80
    Height = 13
    Caption = 'Patrocinadora'
  end
  object Label11: TLabel [4]
    Left = 752
    Top = 8
    Width = 118
    Height = 13
    Caption = 'Plano Previdenciário'
  end
  object Label12: TLabel [5]
    Left = 920
    Top = 8
    Width = 72
    Height = 13
    Caption = 'Contribuição'
  end
  inherited pnlFundo: TPanel
    Width = 1262
    Height = 568
    inherited pnlMestre: TPanel
      Width = 1260
      Height = 264
      object Label1: TLabel
        Left = 16
        Top = 8
        Width = 61
        Height = 13
        Caption = 'Participantes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 272
        Top = 8
        Width = 45
        Height = 13
        Caption = 'Matrícula'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 432
        Top = 8
        Width = 58
        Height = 13
        Caption = 'Inscrição Nº'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 584
        Top = 8
        Width = 66
        Height = 13
        Caption = 'Patrocinadora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        Left = 752
        Top = 8
        Width = 97
        Height = 13
        Caption = 'Plano Previdenciário'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label6: TLabel
        Left = 920
        Top = 8
        Width = 59
        Height = 13
        Caption = 'Contribuição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object LblParticipante: TLabel
        Left = 16
        Top = 21
        Width = 75
        Height = 13
        Caption = 'Participantes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LblMatricula: TLabel
        Left = 272
        Top = 21
        Width = 55
        Height = 13
        Caption = 'Matrícula'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LblInscricao: TLabel
        Left = 432
        Top = 21
        Width = 71
        Height = 13
        Caption = 'Inscrição Nº'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LblPatrocinadora: TLabel
        Left = 584
        Top = 21
        Width = 80
        Height = 13
        Caption = 'Patrocinadora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LblPlanoPrevidenciario: TLabel
        Left = 752
        Top = 21
        Width = 118
        Height = 13
        Caption = 'Plano Previdenciário'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LblContribuicao: TLabel
        Left = 920
        Top = 21
        Width = 72
        Height = 13
        Caption = 'Contribuição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object GroupBox1: TGroupBox
        Left = 4
        Top = 48
        Width = 1253
        Height = 217
        Caption = 'Portabilidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object Label13: TLabel
          Left = 8
          Top = 14
          Width = 93
          Height = 13
          Caption = 'Entidade de Origem'
        end
        object Label14: TLabel
          Left = 385
          Top = 14
          Width = 27
          Height = 13
          Caption = 'CNPJ'
        end
        object Label15: TLabel
          Left = 610
          Top = 14
          Width = 70
          Height = 13
          Caption = 'CNPB/SUSEP'
        end
        object Label16: TLabel
          Left = 839
          Top = 6
          Width = 104
          Height = 13
          Caption = 'Data de Recebimento'
        end
        object Label19: TLabel
          Left = 8
          Top = 80
          Width = 128
          Height = 13
          Caption = 'Portabilidades Cadastradas'
        end
        object Label27: TLabel
          Left = 840
          Top = 48
          Width = 98
          Height = 13
          Caption = 'Data Opção IR Reg.'
        end
        object sbtnProcurarEntidade: TToolbarButton97
          Left = 350
          Top = 31
          Width = 25
          Height = 21
          AllowAllUp = True
          GroupIndex = 1
          Enabled = False
          Flat = False
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333CCCCC33
            33333FFFF77777FFFFFFCCCCCC808CCCCCC3777777F7F777777F008888070888
            8003777777777777777F0F0770F7F0770F0373F33337F333337370FFFFF7FFFF
            F07337F33337F33337F370FFFB99FBFFF07337F33377F33337F330FFBF99BFBF
            F033373F337733333733370BFBF7FBFB0733337F333FF3337F33370FBF98BFBF
            0733337F3377FF337F333B0BFB990BFB03333373FF777FFF73333FB000B99000
            B33333377737777733333BFBFBFB99FBF33333333FF377F333333FBF99BF99BF
            B333333377F377F3333333FB99FB99FB3333333377FF77333333333FB9999FB3
            333333333777733333333333FBFBFB3333333333333333333333}
          ImageIndex = 3
          Images = ImlPadrao
          Layout = blGlyphTop
          Opaque = False
          Spacing = 0
          OnClick = sbtnProcurarEntidadeClick
        end
        object GroupBox4: TGroupBox
          Left = 948
          Top = 8
          Width = 294
          Height = 83
          Caption = 'Tempo Vinculação Entidadade Origem'
          TabOrder = 5
          object Label17: TLabel
            Left = 8
            Top = 16
            Width = 30
            Height = 13
            Caption = 'Ano(s)'
          end
          object Label18: TLabel
            Left = 47
            Top = 16
            Width = 37
            Height = 13
            Caption = 'Mês(es)'
          end
          object Label20: TLabel
            Left = 88
            Top = 16
            Width = 84
            Height = 13
            Caption = 'Tempo em Meses'
          end
          object Label26: TLabel
            Left = 193
            Top = 42
            Width = 42
            Height = 13
            Caption = 'Data Fim'
          end
          object Label25: TLabel
            Left = 193
            Top = 8
            Width = 53
            Height = 13
            Caption = 'Data Início'
          end
          object edtanos: TEdit
            Left = 8
            Top = 32
            Width = 33
            Height = 21
            Enabled = False
            MaxLength = 3
            TabOrder = 0
            OnExit = edtanosExit
            OnKeyPress = edtanosKeyPress
          end
          object edtmeses: TEdit
            Left = 48
            Top = 32
            Width = 36
            Height = 21
            Enabled = False
            MaxLength = 2
            TabOrder = 1
            OnExit = edtmesesExit
            OnKeyPress = edtmesesKeyPress
          end
          object edtempomeses: TEdit
            Left = 90
            Top = 32
            Width = 81
            Height = 21
            Enabled = False
            TabOrder = 2
          end
          object dtDatainicio: TCMDateTimePicker
            Left = 193
            Top = 22
            Width = 79
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
            ShowButton = True
            TabOrder = 3
            OnExit = dtDatainicioExit
          end
          object dtDatafim: TCMDateTimePicker
            Left = 193
            Top = 55
            Width = 79
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
            ShowButton = True
            TabOrder = 4
            OnExit = dtDatafimExit
          end
        end
        object DtDataRecebimento: TDateTimePicker
          Left = 839
          Top = 24
          Width = 105
          Height = 21
          CalAlignment = dtaLeft
          Date = 40113
          Time = 40113
          DateFormat = dfShort
          DateMode = dmComboBox
          Enabled = False
          Kind = dtkDate
          ParseInput = False
          TabOrder = 4
        end
        object DBGrid1: TDBGrid
          Left = 8
          Top = 96
          Width = 1233
          Height = 113
          DataSource = DsPortabilidade
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
          TabOrder = 6
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnKeyUp = DBGrid1KeyUp
          Columns = <
            item
              Expanded = False
              FieldName = 'CNPJformat'
              Title.Caption = 'CNPJ'
              Width = 126
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME'
              Title.Caption = 'Entidade de Origem'
              Width = 317
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CNPBSUSEP'
              Title.Caption = 'CNPB/SUSEP'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DescTIPO'
              Title.Caption = 'Tipo'
              Width = 58
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DescOPCAOIR'
              Title.Caption = 'Opcao IR'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DATAOPCAOIR'
              Title.Caption = 'Data Opcao IR Reg.'
              Width = 104
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DATARECEBIMENTO'
              Title.Caption = 'Data Recebimento'
              Width = 104
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VINCANO'
              Title.Caption = 'Tempo Vinc. Ano(s)'
              Width = 101
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VINCMES'
              Title.Caption = 'Tempo Vinc. Mes(es)'
              Width = 105
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TEMPOMESES'
              Title.Caption = 'Tempo Total Vinc. Meses'
              Width = 129
              Visible = True
            end>
        end
        object edtentidade: TEdit
          Left = 8
          Top = 32
          Width = 337
          Height = 21
          CharCase = ecUpperCase
          Enabled = False
          MaxLength = 200
          ReadOnly = True
          TabOrder = 0
        end
        object GroupBox2: TGroupBox
          Left = 520
          Top = 8
          Width = 81
          Height = 81
          Caption = 'Tipo'
          TabOrder = 7
          object RbAberta: TRadioButton
            Left = 8
            Top = 24
            Width = 57
            Height = 17
            Caption = 'Aberta'
            Enabled = False
            TabOrder = 0
          end
          object RbFechada: TRadioButton
            Left = 8
            Top = 48
            Width = 65
            Height = 17
            Caption = 'Fechada'
            Enabled = False
            TabOrder = 1
          end
        end
        object edtcnpb: TEdit
          Left = 608
          Top = 32
          Width = 121
          Height = 21
          Enabled = False
          MaxLength = 20
          ReadOnly = True
          TabOrder = 2
          OnKeyPress = edtcnpbKeyPress
        end
        object GroupBox3: TGroupBox
          Left = 744
          Top = 8
          Width = 89
          Height = 81
          Caption = 'Opção IR'
          TabOrder = 3
          object RbRegressivo: TRadioButton
            Left = 8
            Top = 24
            Width = 73
            Height = 17
            Caption = 'Regressivo'
            Enabled = False
            TabOrder = 0
            OnClick = RbRegressivoClick
          end
          object RbProgressivo: TRadioButton
            Left = 8
            Top = 48
            Width = 73
            Height = 17
            Caption = 'Progressivo'
            Enabled = False
            TabOrder = 1
            OnClick = RbProgressivoClick
          end
        end
        object MskCNPJ: TMaskEdit
          Left = 384
          Top = 32
          Width = 121
          Height = 21
          EditMask = '99.999.999/9999-99;0;_'
          MaxLength = 18
          ReadOnly = True
          TabOrder = 1
        end
        object DtDataOpcaoIrReg: TCMDateTimePicker
          Left = 839
          Top = 63
          Width = 105
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
          ShowButton = True
          TabOrder = 8
          OnExit = dtDatafimExit
        end
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 265
      Width = 1260
      Height = 302
      Tabs.Strings = (
        'Histórico')
      object lblImportaArquivo: TLabel [0]
        Left = 14
        Top = 255
        Width = 94
        Height = 13
        Caption = 'Importar Arquivo'
      end
      object btnImportaArquivo: TToolbarButton97 [1]
        Left = 293
        Top = 251
        Width = 25
        Height = 21
        AllowAllUp = True
        GroupIndex = 1
        Enabled = False
        Flat = False
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333CCCCC33
          33333FFFF77777FFFFFFCCCCCC808CCCCCC3777777F7F777777F008888070888
          8003777777777777777F0F0770F7F0770F0373F33337F333337370FFFFF7FFFF
          F07337F33337F33337F370FFFB99FBFFF07337F33377F33337F330FFBF99BFBF
          F033373F337733333733370BFBF7FBFB0733337F333FF3337F33370FBF98BFBF
          0733337F3377FF337F333B0BFB990BFB03333373FF777FFF73333FB000B99000
          B33333377737777733333BFBFBFB99FBF33333333FF377F333333FBF99BF99BF
          B333333377F377F3333333FB99FB99FB3333333377FF77333333333FB9999FB3
          333333333777733333333333FBFBFB3333333333333333333333}
        ImageIndex = 3
        Images = ImlPadrao
        Layout = blGlyphTop
        Opaque = False
        Spacing = 0
        OnClick = btnImportaArquivoClick
      end
      inherited pgctrlDetalhe: TPageControl
        Width = 1157
        Height = 186
        Align = alNone
        inherited tbsDet: TTabSheet
          Caption = 'Histórico'
          inherited dbgrdDet: TwwDBGrid
            Width = 1149
            Height = 158
            ControlType.Strings = (
              'FLGCALCRESERVA;CheckBox;0;1'
              'FLGDESCFOLHA;CheckBox;0;1')
            PictureMasks.Strings = (
              'VALORESPERADO'#9'###0.00'#9'T'#9'T'
              'VALORRECEBIDO'#9'#,##0.00'#9'T'#9'T'
              'VALORPARARESERVA'#9'#,##0.00'#9'T'#9'T')
            Selected.Strings = (
              'MESREFERENCIA'#9'12'#9'Mês Referencia'
              'MESCOBRANCA'#9'12'#9'Mês Cobrança'
              'FLGCALCRESERVA'#9'8'#9'Alimentou'
              'FLGDESCFOLHA'#9'16'#9'Cobrança Bancaria'
              'DESCSITRECEBIMENTO'#9'21'#9'Situação da Contribuição'
              'DESCMOTIVO'#9'22'#9'Motivo'
              'DESCPORTFORMA'#9'17'#9'Forma de Cobrança'
              'VALORESPERADO'#9'13'#9'Valor Esperado'
              'VALORPARARESERVA'#9'12'#9'Valor Reserva'
              'VALORRECEBIDO'#9'10'#9'Valor Total'
              'DATAPREVISAORECE'#9'23'#9'Data Previsão Recebimento'
              'DATARECEBIMENTO'#9'16'#9'Data Recebimento')
            object dbgrdDetIButton: TwwIButton
              Left = 0
              Top = 0
              Width = 13
              Height = 22
              AllowAllUp = True
            end
          end
          inherited pnlControlesDet: TPanel
            Width = 1149
            Height = 158
            Font.Style = []
            ParentFont = False
            object Label23: TLabel
              Left = 8
              Top = 49
              Width = 72
              Height = 13
              Caption = 'Valor Esperado'
            end
            object Label24: TLabel
              Left = 160
              Top = 49
              Width = 82
              Height = 13
              Caption = 'Data de Previsao'
            end
            object GroupBox5: TGroupBox
              Left = 8
              Top = 1
              Width = 137
              Height = 50
              Caption = 'Ano e Mês Referência'
              TabOrder = 0
              object Label21: TLabel
                Left = 65
                Top = 27
                Width = 5
                Height = 13
                Caption = '/'
              end
              object EdtAnoReferencia: TEdit
                Left = 16
                Top = 24
                Width = 49
                Height = 21
                MaxLength = 4
                TabOrder = 0
                OnChange = EdtAnoReferenciaChange
                OnKeyPress = EdtAnoReferenciaKeyPress
              end
              object EdtMesReferencia: TEdit
                Left = 72
                Top = 24
                Width = 41
                Height = 21
                MaxLength = 2
                TabOrder = 1
                OnExit = EdtMesReferenciaExit
                OnKeyPress = EdtMesReferenciaKeyPress
              end
            end
            object GroupBox6: TGroupBox
              Left = 154
              Top = 1
              Width = 143
              Height = 50
              Caption = 'Ano e Mês de Cobrança'
              TabOrder = 1
              object Label22: TLabel
                Left = 53
                Top = 24
                Width = 5
                Height = 13
                Caption = '/'
              end
              object EdtAnoCobranca: TEdit
                Left = 8
                Top = 21
                Width = 46
                Height = 21
                Enabled = False
                MaxLength = 4
                TabOrder = 0
              end
              object EdtMesCobranca: TEdit
                Left = 63
                Top = 20
                Width = 42
                Height = 21
                Enabled = False
                MaxLength = 2
                TabOrder = 1
              end
            end
            object EdtValorEsperado: TRealEdit
              Left = 9
              Top = 65
              Width = 136
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              TabOrder = 3
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
            end
            object GroupBox7: TGroupBox
              Left = 8
              Top = 89
              Width = 137
              Height = 35
              Caption = 'Forma de Cobrança'
              TabOrder = 4
              object RbBancaria: TRadioButton
                Left = 8
                Top = 16
                Width = 105
                Height = 17
                Caption = 'Bancária'
                Checked = True
                TabOrder = 0
                TabStop = True
              end
            end
            object GroupBox8: TGroupBox
              Left = 154
              Top = 88
              Width = 143
              Height = 35
              Caption = 'Situação da Contribuição'
              TabOrder = 5
              object RbNaoEnviado: TRadioButton
                Left = 8
                Top = 16
                Width = 113
                Height = 17
                Caption = 'Não Enviado'
                Checked = True
                TabOrder = 0
                TabStop = True
              end
            end
            object GroupBox9: TGroupBox
              Left = 8
              Top = 123
              Width = 137
              Height = 35
              Caption = 'Motivo'
              TabOrder = 6
              object RbMotivo: TRadioButton
                Left = 8
                Top = 16
                Width = 121
                Height = 17
                Caption = 'Contribuição Portada'
                Checked = True
                TabOrder = 0
                TabStop = True
              end
            end
            object GroupBox10: TGroupBox
              Left = 154
              Top = 123
              Width = 143
              Height = 35
              Caption = 'Forma de Cobrança'
              TabOrder = 7
              object RbCodForma: TRadioButton
                Left = 8
                Top = 16
                Width = 105
                Height = 17
                Caption = 'CEF - On Line'
                Checked = True
                TabOrder = 0
                TabStop = True
              end
            end
            object edtdataprevisao: TEdit
              Left = 160
              Top = 65
              Width = 137
              Height = 21
              Enabled = False
              TabOrder = 8
            end
            object rgDevolucao: TRadioGroup
              Left = 306
              Top = 1
              Width = 247
              Height = 50
              Caption = 'Tipo'
              Columns = 2
              ItemIndex = 0
              Items.Strings = (
                'Cobrança Normal'
                'Devolução')
              TabOrder = 2
              OnClick = rgDevolucaoClick
            end
          end
        end
        object tbsLog: TTabSheet
          Caption = 'Log'
          ImageIndex = 1
          object mmoLog: TMemo
            Left = 0
            Top = 0
            Width = 1149
            Height = 158
            Align = alClient
            ReadOnly = True
            TabOrder = 0
          end
        end
      end
      inherited Dock974: TDock97 [3]
        Left = 1166
        Height = 243
        FixAlign = True
        inherited tb97Detalhe: TToolbar97
          Visible = False
        end
      end
      inherited Dock973: TDock97 [4]
        Width = 1252
        inherited tb97BotoesDetalhe: TToolbar97
          inherited sbtnInsDet: TToolbarButton97
            Enabled = False
          end
          inherited sbtnAltDet: TToolbarButton97
            Enabled = False
          end
          inherited sbtnExcluiDet: TToolbarButton97
            Enabled = False
          end
        end
      end
      object edtImportaArquivo: TEdit
        Left = 113
        Top = 252
        Width = 177
        Height = 21
        CharCase = ecUpperCase
        Enabled = False
        MaxLength = 200
        TabOrder = 3
      end
    end
  end
  inherited Dock972: TDock97
    Width = 1262
    inherited Toolbar971: TToolbar97
      inherited sbtnAlterar: TToolbarButton97
        Caption = 'Alterar'
      end
    end
  end
  inherited Dock971: TDock97
    Top = 615
    Width = 1262
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 264
    Top = 10
    TargetsData = (
      1
      2
      (
        'TRealEdit'
        'Text'
        0)
      (
        'TMemo'
        'Text'
        0))
  end
  inherited dsDet: TwwDataSource
    DataSet = QryDet
    Left = 547
    Top = 82
  end
  inherited ds: TwwDataSource
    Left = 434
    Top = 10
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'UPDATE PORTABILIDADEPREV SET NOME = :NOME'
      '                            ,CNPJ = :CNPJ'
      '                            ,TIPO = :TIPO'
      '                            ,CNPBSUSEP = :CNPBSUSEP'
      '                            ,OPCAOIR = :OPCAOIR'
      '                            ,DATARECEBIMENTO = :DATARECEBIMENTO'
      '                            ,VINCANO = :VINCANO'
      '                            ,VINCMES = :VINCMES'
      '                            ,TEMPOMESES = :TEMPOMESES'
      '                            ,IDPLANOPREV = :IDPLANOPREV'
      '                            ,IDPESSOA = :IDPESSOA'
      '                            ,IDPESSJUR = :IDPESSJUR'
      'WHERE IDPORTABILIDADE = :IDPORTABILIDADE')
    InsertSQL.Strings = (
      
        'INSERT INTO PORTABILIDADEPREV (IDPORTABILIDADE,NOME,CNPJ,TIPO,CN' +
        'PBSUSEP,OPCAOIR,DATARECEBIMENTO,VINCANO,VINCMES,TEMPOMESES,IDPLA' +
        'NOPREV,IDPESSOA,IDPESSJUR)'
      
        'VALUES(SEQPORTABILIDADEPREV.NEXTVAL,:NOME,:CNPJ,:TIPO,:CNPBSUSEP' +
        ',:OPCAOIR,:DATARECEBIMENTO,:VINCANO,:VINCMES,:TEMPOMESES,:IDPLAN' +
        'OPREV,:IDPESSOA,:IDPESSJUR)')
    DeleteSQL.Strings = (
      
        'DELETE FROM PORTABILIDADEPREV WHERE IDPORTABILIDADE = :IDPORTABI' +
        'LIDADE')
    Left = 402
    Top = 10
  end
  inherited MontaSelect: TMontaSelect
    Caption = ''
    Colunas.Strings = (
      'TRIM(DP.MATRICULA)'
      'TRIM(C.NOME)'
      'TRIM(P.NOME)'
      'TRIM(PP.INSCRICAONUMERO)'
      'TRIM(PL.NOME)'
      'TRIM(pt.nome)')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Matricula'
      'Contribuição'
      'Participante'
      'Inscrição Nº'
      'Plano Previdenciário'
      'Patrocinadora')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'pessoa pt'
      'pessoa p'
      'depentit dp'
      'partprevplan pp'
      'contribuicao c'
      'contribprevpartp cpp'
      'planprev pl')
    CamposChave.Strings = (
      'TRIM(P.NOME)'
      'TRIM(DP.MATRICULA)'
      'TRIM(PP.INSCRICAONUMERO)'
      'TRIM(pt.nome)'
      'TRIM(PL.NOME)'
      'TRIM(C.NOME)'
      'CPP.IDCONTRIBUICAO'
      'CPP.IDPESSOA'
      'CPP.IDPESSJUR'
      'CPP.IDPLANOPREV'
      'C.TIPOPORTABILIDADE'
      'pp.idsitpart'
      'cpp.datainicio'
      'CPP.datafinal')
    Filtro.Strings = (
      '(cpp.idpessjur = pp.idpessjur)'
      '(cpp.idplanoprev = pp.idplanoprev)'
      '(cpp.idpessoa = pp.idpessoa)'
      '(cpp.seqproposta = pp.seqproposta)'
      '(c.idcontribuicao = cpp.idcontribuicao)'
      '(pt.idpessoa = cpp.idpessjur)'
      '(p.idpessoa = cpp.idpessoa)'
      '(pl.idplanoprev = cpp.idplanoprev)'
      '(dp.idpessoa = pp.idpessoa)'
      
        '(cpp.idpessjur IN (SELECT idpessoa FROM patro WHERE idfundacao =' +
        ' 1))'
      '(c.tipoportabilidade is not null)')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '60'
      '10'
      '10'
      '60'
      '1')
    OperComparador.Strings = (
      '0'
      '1'
      '1'
      '0'
      '0'
      '0')
    LookupSQL.Strings = (
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
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 483
    Top = 10
  end
  inherited ImlPadrao: TImageList
    Left = 313
    Top = 10
  end
  inherited CmeCadastro: TCmEventosCadastro
    RepetirInsert = False
    DataSource = nil
    OpenDsAutomatico = True
    Left = 516
    Top = 10
  end
  inherited qry: TwwQuery
    AfterScroll = qryAfterScroll
    SQL.Strings = (
      'select * from portabilidadeprev'
      'where idportabilidade = :idportabilidade')
    UpdateObject = nil
    Left = 369
    Top = 10
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idportabilidade'
        ParamType = ptUnknown
      end>
  end
  inherited CmeDetalhe: TCmEventosCadastro
    RepetirInsert = False
    Left = 588
    Top = 10
  end
  object QryPortabilidade: TQuery
    AfterScroll = QryPortabilidadeAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      ' select'
      ' idportabilidade,nome,'
      ''
      
        ' substr(cnpj,1,2)||'#39'.'#39'||substr(cnpj,3,3)||'#39'.'#39'||substr(cnpj,6,3)|' +
        '|'#39'.'#39'||substr(cnpj,9,4)||'#39'-'#39'||substr(cnpj,13,2) CNPJ'
      ''
      ' ,tipo,decode(tipo,'#39'A'#39','#39'Aberta'#39','#39'F'#39','#39'Fechada'#39')DescTipo'
      
        ' ,cnpbsusep,opcaoir,decode(opcaoir,'#39'R'#39','#39'Regressivo'#39','#39'P'#39','#39'Progres' +
        'sivo'#39')DescOpcaoIR '
      
        ' ,datarecebimento,dataopcaoir,vincano,vincmes,tempomeses,idplano' +
        'prev,idpessoa,idpessjur '
      ' from portabilidadeprev '
      'where idportabilidade = -1'
      ' ')
    UpdateObject = UpdPortabilidade
    Left = 197
    Top = 240
  end
  object DsPortabilidade: TDataSource
    DataSet = QryPortabilidade
    Left = 261
    Top = 224
  end
  object UpdPortabilidade: TUpdateSQL
    ModifySQL.Strings = (
      'UPDATE PORTABILIDADEPREV SET NOME = :NOME'
      '                            ,CNPJ = :CNPJ'
      '                            ,TIPO = :TIPO'
      '                            ,CNPBSUSEP = :CNPBSUSEP'
      '                            ,OPCAOIR = :OPCAOIR'
      '                            ,DATARECEBIMENTO = :DATARECEBIMENTO'
      '                            ,VINCANO = :VINCANO'
      '                            ,VINCMES = :VINCMES'
      '                            ,TEMPOMESES = :TEMPOMESES'
      '                            ,IDPLANOPREV = :IDPLANOPREV'
      '                            ,IDPESSOA = :IDPESSOA'
      '                            ,IDPESSJUR = :IDPESSJUR'
      'WHERE IDPORTABILIDADE = :IDPORTABILIDADE')
    InsertSQL.Strings = (
      
        'INSERT INTO PORTABILIDADEPREV (IDPORTABILIDADE,NOME,CNPJ,TIPO,CN' +
        'PBSUSEP,OPCAOIR,DATARECEBIMENTO,VINCANO,VINCMES,TEMPOMESES,IDPLA' +
        'NOPREV,IDPESSOA,IDPESSJUR)'
      
        'VALUES(SEQPORTABILIDADEPREV.NEXTVAL,:NOME,:CNPJ,:TIPO,:CNPBSUSEP' +
        ',:OPCAOIR,:DATARECEBIMENTO,:VINCANO,:VINCMES,:TEMPOMESES,:IDPLAN' +
        'OPREV,:IDPESSOA,:IDPESSJUR)')
    DeleteSQL.Strings = (
      
        'DELETE FROM PORTABILIDADEPREV WHERE IDPORTABILIDADE = :IDPORTABI' +
        'LIDADE')
    Left = 325
    Top = 240
  end
  object QryDet: TQuery
    AfterOpen = QryDetAfterOpen
    AfterScroll = QryDetAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT HST.mesreferencia,'
      '       '
      '       mescobranca,'
      '       '
      '       flgcalcreserva,'
      ''
      '       flgdescfolha,'
      '       '
      '       Sum(valorrecebido) as valorrecebido,'
      '       '
      
        '       SUM(decode(valorparareserva, null, valorrecebido, valorpa' +
        'rareserva)) valorparareserva,'
      ''
      '       sum(valoresperado) as valoresperado,'
      '       '
      '       dataprevisaorece,'
      '       '
      '       datarecebimento,'
      ''
      '       idportabilidade,'
      '       '
      '       sitrecebimento,'
      '       '
      
        '       decode(sitrecebimento, 0, '#39'Não Enviada'#39', '#39#39') DescSitReceb' +
        'imento,'
      '       '
      '       idmotivo,'
      '       '
      
        '       decode(idmotivo, 3054, '#39'Contribuição Portada'#39', '#39#39') descMo' +
        'tivo,'
      '       '
      '       codportforma,'
      ''
      '       numRecebimento,'
      ''
      '       (select descricao'
      '        '
      '          from PORTADORFORMA'
      ''
      '         where codportforma = hst.codportforma) DescPortForma,'
      ''
      '       CODDOCUMENTOPREV,'
      '       flgdevolucao'
      ''
      '  FROM hstcontribprev hst'
      ''
      ' where idpessoa = :idpessoa'
      '   and idpessjur = :idpessjur'
      '   and idplanoprev = :idplanoprev'
      '   and idportabilidade = :idportabilidade'
      ''
      ' Group by mesreferencia,'
      '          valorparareserva,'
      '          idmotivo,'
      '          codportforma,'
      '          mescobranca,'
      '          flgcalcreserva,'
      '          flgdescfolha,'
      '          dataprevisaorece,'
      '          datarecebimento,'
      '          idportabilidade,'
      '          sitrecebimento,'
      '          decode(sitrecebimento, 0, '#39'Não Enviada'#39', '#39#39'),'
      '          idmotivo,'
      '          decode(idmotivo, 3054, '#39'Contribuição Portada'#39', '#39#39'),'
      '          codportforma,'
      '          numRecebimento,'
      '          CODDOCUMENTOPREV,'
      '       flgdevolucao'
      ''
      ' order by mesreferencia'
      ''
      ''
      ''
      ''
      ''
      ' '
      ' ')
    Left = 361
    Top = 296
    ParamData = <
      item
        DataType = ftFloat
        Name = 'idpessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'idpessjur'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'idplanoprev'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'idportabilidade'
        ParamType = ptUnknown
      end>
  end
  object QryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 397
    Top = 296
  end
  object QryAux1: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 445
    Top = 296
  end
  object QryMesEntreData: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select trunc((tmp2.qtdetotalmeses)/ 12 ) qtdeanos,'
      
        '       tmp2.qtdetotalmeses - (trunc(tmp2.qtdetotalmeses / 12 ) *' +
        ' 12) meses'
      'from('
      
        '    select ((tmp.M2+12*(tmp.A2-1))-(tmp.M1+12*(tmp.A1-1))) qtdet' +
        'otalmeses'
      '    from ('
      
        '           select to_number(to_char(to_date(:data1),'#39'mm'#39'))   as ' +
        'M1'
      
        '                    , to_number(to_char(to_date(:data2),'#39'mm'#39'))  ' +
        ' as M2'
      
        '                    , to_number(to_char(to_date(:data1),'#39'rrrr'#39'))' +
        ' as A1'
      
        '                    , to_number(to_char(to_date(:data2),'#39'rrrr'#39'))' +
        ' as A2'
      '          from   dual'
      '          ) tmp'
      '     ) tmp2')
    ValidateWithMask = True
    Left = 1061
    Top = 56
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'data1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'data2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'data1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'data2'
        ParamType = ptUnknown
      end>
    object QryMesEntreDataqtdeanos: TFloatField
      FieldName = 'qtdeanos'
    end
    object QryMesEntreDatameses: TFloatField
      FieldName = 'meses'
    end
  end
  object MontaEntidadeOrigem: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'ENTIDADEORIGEM.NOME'
      'ENTIDADEORIGEM.CNPJ'
      'ENTIDADEORIGEM.TIPO'
      'ENTIDADEORIGEM.CNPBSUSEP')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Entidade de Origem'
      'CNPJ'
      'Tipo'
      'CNPB/SUSEP')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'CM.ENTIDADEORIGEM')
    CamposChave.Strings = (
      'ENTIDADEORIGEM.IDENTIDADEORIGEM'
      'ENTIDADEORIGEM.NOME'
      'ENTIDADEORIGEM.CNPJ'
      'ENTIDADEORIGEM.TIPO'
      'ENTIDADEORIGEM.CNPBSUSEP')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '40'
      '17'
      '9'
      '23')
    OperComparador.Strings = (
      '0'
      '1'
      '1'
      '0')
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
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      '')
    Left = 844
    Top = 248
  end
  object Dialog: TOpenDialog
    Title = 'Arquivo de Entrada'
    Left = 332
    Top = 557
  end
end
