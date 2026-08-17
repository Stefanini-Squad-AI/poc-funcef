inherited frmParamEtiquetas: TfrmParamEtiquetas
  Left = 123
  Top = 149
  BorderStyle = bsSizeToolWin
  Caption = 'Seleção para Emissão de Etiquetas'
  Font.Style = []
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    inherited pnSelecao: TPanel
      inherited PageControl1: TPageControl
        ActivePage = tbshConfigEtiq
        object tbshConfigEtiq: TTabSheet [0]
          Caption = 'Config. da Etiqueta'
          object rgTipoEtiq: TRadioGroup
            Left = 304
            Top = 20
            Width = 280
            Height = 129
            Caption = 'Tipo de Etiqueta'
            Columns = 2
            ItemIndex = 0
            Items.Strings = (
              'Endereço Postal'
              'Lotação e Cargo'
              'Cartão de Ponto'
              'Alterações Funcionais'
              'Férias')
            TabOrder = 0
            OnClick = rgTipoEtiqClick
          end
          object gbxTipoPapel: TGroupBox
            Left = 8
            Top = 186
            Width = 280
            Height = 44
            Caption = 'Tipo de Papel'
            TabOrder = 1
            object cmbTipoPapel: TComboBox
              Left = 8
              Top = 14
              Width = 265
              Height = 21
              Style = csDropDownList
              ItemHeight = 13
              TabOrder = 0
            end
          end
          object gbxConfigEtiq: TGroupBox
            Left = 8
            Top = 20
            Width = 280
            Height = 129
            Caption = 'Configuração da Etiqueta'
            TabOrder = 2
            object Label9: TLabel
              Left = 29
              Top = 79
              Width = 116
              Height = 13
              Caption = 'Margem ao Alto (em mm)'
            end
            object Label10: TLabel
              Left = 29
              Top = 108
              Width = 137
              Height = 13
              Caption = 'Margem à Esquerda (em mm)'
            end
            object Label11: TLabel
              Left = 29
              Top = 18
              Width = 137
              Height = 13
              Caption = 'Altura da Etiqueta (em linhas)'
            end
            object Label12: TLabel
              Left = 29
              Top = 48
              Width = 147
              Height = 13
              Caption = 'Quantidade de Carreiras (1 a 3)'
            end
            object spedAlt: TSpinEdit
              Left = 187
              Top = 15
              Width = 64
              Height = 22
              MaxValue = 10
              MinValue = 5
              TabOrder = 0
              Value = 5
            end
            object spedCarr: TSpinEdit
              Left = 187
              Top = 45
              Width = 64
              Height = 22
              MaxValue = 3
              MinValue = 1
              TabOrder = 1
              Value = 3
            end
            object spedMargAlto: TSpinEdit
              Left = 187
              Top = 75
              Width = 64
              Height = 22
              MaxValue = 100
              MinValue = 0
              TabOrder = 2
              Value = 0
            end
            object spedMargEsquerda: TSpinEdit
              Left = 187
              Top = 100
              Width = 64
              Height = 22
              MaxValue = 100
              MinValue = 0
              TabOrder = 3
              Value = 0
            end
          end
          object gbxIntervRef: TGroupBox
            Left = 302
            Top = 186
            Width = 280
            Height = 44
            Caption = 'Período de Ocorrência'
            TabOrder = 3
            Visible = False
            object Label13: TLabel
              Left = 141
              Top = 20
              Width = 15
              Height = 13
              Caption = 'até'
            end
            object Label14: TLabel
              Left = 27
              Top = 20
              Width = 14
              Height = 13
              Caption = 'De'
            end
            object dtedIni: TCMDateTimePicker
              Left = 47
              Top = 16
              Width = 87
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
            end
            object dtedFin: TCMDateTimePicker
              Left = 165
              Top = 16
              Width = 87
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
          end
        end
        inherited tsDadosFunc: TTabSheet
          inherited gbxTipContra: TGroupBox
            inherited cbxEfetivos: TCheckBox
              Width = 58
            end
            inherited cbxTemporarios: TCheckBox
              Width = 80
            end
            inherited cbxEstagiarios: TCheckBox
              Width = 72
            end
            inherited cbxCandidatos: TCheckBox
              Width = 74
            end
            inherited cbxTerceiros: TCheckBox
              Width = 65
            end
            inherited cbxAutonomos: TCheckBox
              Width = 74
            end
            inherited cbxProprietarios: TCheckBox
              Width = 104
            end
            inherited cbxEspeciais: TCheckBox
              Width = 106
            end
          end
          inherited gbxSalario: TGroupBox
            inherited Label4: TLabel
              Width = 6
            end
          end
          inherited gbxTempAdm: TGroupBox
            inherited Label1: TLabel
              Width = 6
            end
          end
          inherited gbxTempLot: TGroupBox
            inherited Label2: TLabel
              Width = 6
            end
          end
          inherited gbxTempCar: TGroupBox
            inherited Label3: TLabel
              Width = 6
            end
          end
          inherited gbxAdmissao: TGroupBox
            inherited Label7: TLabel
              Width = 14
            end
            inherited Label8: TLabel
              Width = 7
            end
          end
        end
        inherited tsDadosPess: TTabSheet
          inherited gbxIdade: TGroupBox
            inherited Label5: TLabel
              Width = 6
            end
          end
          inherited gbxCep: TGroupBox
            inherited Label6: TLabel
              Width = 6
            end
          end
          inherited GroupBox1: TGroupBox
            inherited Label42: TLabel
              Width = 41
            end
          end
        end
        inherited tbsDemit: TTabSheet
          inherited gbxDemitidos: TGroupBox
            inherited LabelDeData: TLabel
              Width = 14
            end
            inherited LabelAdata: TLabel
              Width = 7
            end
            inherited Label711: TLabel
              Width = 90
            end
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    inherited tb97Fundo: TToolbar97
      Left = 446
      DockPos = 453
      inherited sep1: TToolbarSep97
        Left = 162
        SizeHorz = 2
      end
      inherited sep3: TToolbarSep97
        SizeHorz = 2
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 82
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 199
      DockPos = 206
      inherited ToolbarSep971: TToolbarSep97
        Visible = False
      end
      inherited bbtnOutraVez: TBitBtn
        Enabled = False
      end
      inherited bbtnCancelar: TBitBtn
        Enabled = False
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Top = 267
  end
  inherited ds: TwwDataSource
    Top = 274
  end
  inherited tblCargo: TwwQuery
    Top = 277
  end
  inherited tblSindic: TwwQuery
    Top = 271
  end
  inherited tblProfis: TwwQuery
    Top = 276
  end
  inherited tblPessoal: TwwQuery
    Top = 278
  end
  inherited tblEstab: TwwQuery
    Top = 274
  end
  inherited tblLotacao: TwwQuery
    Top = 276
  end
  inherited qryGrauInstr: TwwQuery
    Top = 277
  end
  inherited qryRamo: TwwQuery
    Top = 273
  end
  inherited qryMotivo: TwwQuery
    Top = 277
  end
  inherited qryParamRH: TwwQuery
    Left = 77
    Top = 320
  end
end
