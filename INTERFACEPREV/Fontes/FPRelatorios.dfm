inherited frmPRelatorios: TfrmPRelatorios
  Left = 193
  Top = 104
  Caption = 'Parâmetros relatórios'
  ClientHeight = 343
  ClientWidth = 562
  FormStyle = fsNormal
  Visible = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 562
    Height = 304
    inherited PageControl1: TPageControl
      Width = 552
      Height = 294
      ActivePage = TabSheet1
      ParentFont = False
      inherited TabSheet2: TTabSheet
        inherited BitBtn1: TBitBtn
          Left = 97
          Top = 70
        end
        inherited BitBtn2: TBitBtn
          Left = 97
          Top = 14
        end
      end
      object TabSheet1: TTabSheet
        Caption = 'Parâmetros'
        object Panel1: TPanel
          Left = 0
          Top = 0
          Width = 544
          Height = 266
          Align = alClient
          BevelOuter = bvLowered
          TabOrder = 0
          object Label4: TLabel
            Left = 7
            Top = 28
            Width = 86
            Height = 13
            Caption = 'Patrocinadoras'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label8: TLabel
            Left = 276
            Top = 28
            Width = 39
            Height = 13
            Caption = 'Planos'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object GroupBox2: TGroupBox
            Left = 7
            Top = 203
            Width = 260
            Height = 60
            TabOrder = 4
            object Label7: TLabel
              Left = 7
              Top = 24
              Width = 74
              Height = 13
              Caption = 'Mês de Ref.:'
            end
            object cmbMesRef: TComboBox
              Left = 82
              Top = 20
              Width = 110
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ItemHeight = 13
              ParentFont = False
              TabOrder = 0
              Items.Strings = (
                'JANEIRO'
                'FEVEREIRO'
                'MARÇO'
                'ABRIL'
                'MAIO'
                'JUNHO'
                'JULHO'
                'AGOSTO'
                'SETEMBRO'
                'OUTUBRO'
                'NOVEMBRO'
                'DEZEMBRO')
            end
            object speAnoRef: TwwDBSpinEdit
              Left = 202
              Top = 20
              Width = 50
              Height = 21
              Increment = 1
              Value = 1998
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 1
              UnboundDataType = wwDefault
            end
          end
          object GroupBox1: TGroupBox
            Left = 7
            Top = 203
            Width = 260
            Height = 60
            TabOrder = 3
            object Label1: TLabel
              Left = 8
              Top = 16
              Width = 89
              Height = 13
              Caption = 'Data referência'
            end
            object Label2: TLabel
              Left = 143
              Top = 16
              Width = 95
              Height = 13
              Caption = 'Data cot. moeda'
            end
            object DateEdit1: TCMDateTimePicker
              Left = 8
              Top = 29
              Width = 110
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
            object DateEdit2: TCMDateTimePicker
              Left = 143
              Top = 29
              Width = 110
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
          object StaticText3: TStaticText
            Left = 7
            Top = 1
            Width = 354
            Height = 26
            Caption = 'Opções de Patrocinadoras e Planos'
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -19
            Font.Name = 'Bookman Old Style'
            Font.Style = [fsBold, fsItalic]
            ParentColor = False
            ParentFont = False
            TabOrder = 2
          end
          object chklstPlano: TCheckListBox
            Left = 276
            Top = 42
            Width = 260
            Height = 162
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ItemHeight = 13
            ParentFont = False
            TabOrder = 1
          end
          object chklstPatro: TCheckListBox
            Left = 7
            Top = 42
            Width = 260
            Height = 162
            OnClickCheck = chklstPatroClickCheck
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ItemHeight = 13
            ParentFont = False
            TabOrder = 0
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 304
    Width = 562
    inherited tb97Fundo: TToolbar97
      Left = 231
      DockPos = 312
      inherited sep1: TToolbarSep97
        Left = 161
      end
      object ToolbarSep971: TToolbarSep97 [1]
        Left = 163
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      object ToolbarSep972: TToolbarSep97 [2]
        Left = 245
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      inherited bbtnSair: TBitBtn
        Left = 165
        TabOrder = 2
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 247
        TabOrder = 3
      end
      object bbtnConfirmar: TBitBtn
        Left = 0
        Top = 0
        Width = 80
        Height = 33
        Caption = '&OK'
        TabOrder = 0
        OnClick = bbtnConfirmarClick
        Kind = bkOK
        Spacing = 2
      end
      object bbtnCancelar: TBitBtn
        Left = 80
        Top = 0
        Width = 81
        Height = 33
        Caption = '&Cancelar'
        TabOrder = 1
        Kind = bkCancel
        Spacing = 2
      end
    end
    inherited rbtnImprimir: TBitBtn
      Left = 314
    end
    inherited rbtnVisualizar: TBitBtn
      Left = 230
    end
  end
  inherited cdMestre: TColorDialog
    Left = 399
    Top = 4
  end
  inherited cdCabecalho: TColorDialog
    Left = 431
    Top = 4
  end
  object qryPlano: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 496
    Top = 4
  end
  object qryPatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPESSOA,NOME'
      'FROM PESSOA'
      'WHERE FLGPATROCINADORA = 1'
      'ORDER BY UPPER(NOME)')
    ValidateWithMask = True
    Left = 464
    Top = 4
  end
end
