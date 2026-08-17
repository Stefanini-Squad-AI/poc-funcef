inherited frmPRelContratos: TfrmPRelContratos
  Left = 86
  Top = 183
  Caption = 'Impressao de Contratos'
  ClientHeight = 287
  ClientWidth = 628
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 628
    Height = 248
    inherited PageControl1: TPageControl
      Width = 618
      Height = 238
      ActivePage = TabSheet1
      inherited TabSheet2: TTabSheet
        inherited BitBtn1: TBitBtn
          Left = 179
          Top = 104
        end
        inherited BitBtn2: TBitBtn
          Left = 179
          Top = 36
        end
      end
      object TabSheet1: TTabSheet
        Caption = 'Critérios'
        object Label3: TLabel
          Left = 16
          Top = 8
          Width = 80
          Height = 13
          Caption = 'Patrocinadora'
        end
        object Label1: TLabel
          Left = 16
          Top = 48
          Width = 69
          Height = 13
          Caption = 'Participante'
        end
        object Label5: TLabel
          Left = 16
          Top = 90
          Width = 118
          Height = 13
          Caption = 'Plano Previdenciario'
        end
        object Label6: TLabel
          Left = 15
          Top = 130
          Width = 96
          Height = 13
          Caption = 'Tipo de Contrato'
        end
        object Label7: TLabel
          Left = 15
          Top = 170
          Width = 112
          Height = 13
          Caption = 'Tipo de Emprestimo'
        end
        object GroupBox2: TGroupBox
          Left = 329
          Top = 104
          Width = 281
          Height = 73
          Caption = 'Intervalo de Datas de Assinatura'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object Label4: TLabel
            Left = 132
            Top = 31
            Width = 8
            Height = 13
            Caption = 'a'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object deDtIni: TCMDateTimePicker
            Left = 16
            Top = 28
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
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ShowButton = True
            TabOrder = 0
          end
          object deDtFim: TCMDateTimePicker
            Left = 153
            Top = 28
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
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ShowButton = True
            TabOrder = 1
            OnExit = deDtFimExit
          end
        end
        object GroupBox1: TGroupBox
          Left = 329
          Top = 16
          Width = 281
          Height = 73
          Caption = 'Intervalo de Número de Contratos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          object Label2: TLabel
            Left = 128
            Top = 36
            Width = 15
            Height = 13
            Caption = 'ao'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object reCtrIni: TRealEdit
            Left = 16
            Top = 32
            Width = 105
            Height = 21
            Alignment = taRightJustify
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Lines.Strings = (
              '         0')
            ParentFont = False
            TabOrder = 0
            WordWrap = False
            IntDigits = 10
            DecDigits = 0
            NumberFormat = fFixed
            Signal = False
          end
          object reCtrFim: TRealEdit
            Left = 152
            Top = 32
            Width = 105
            Height = 21
            Alignment = taRightJustify
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Lines.Strings = (
              '         0')
            ParentFont = False
            TabOrder = 1
            WordWrap = False
            OnExit = reCtrFimExit
            IntDigits = 10
            DecDigits = 0
            NumberFormat = fFixed
            Signal = False
          end
        end
        object lkcmbPatro: TwwDBLookupCombo
          Left = 16
          Top = 22
          Width = 305
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'25'#9'Patrocinadora')
          LookupTable = qryPatro
          LookupField = 'NOME'
          Options = [loColLines, loRowLines, loTitles]
          TabOrder = 2
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = False
          ShowMatchText = True
        end
        object lkcmbdlgParticip: TwwDBLookupComboDlg
          Left = 16
          Top = 62
          Width = 305
          Height = 21
          GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
          GridColor = clWhite
          GridTitleAlignment = taLeftJustify
          Caption = 'Lookup'
          MaxWidth = 0
          MaxHeight = 209
          LookupTable = qryParticip
          LookupField = 'nome'
          TabOrder = 3
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = False
          ShowMatchText = True
          OnEnter = lkcmbdlgParticipEnter
        end
        object lkcmbPlano: TwwDBLookupCombo
          Left = 16
          Top = 104
          Width = 305
          Height = 21
          DropDownAlignment = taLeftJustify
          LookupTable = qryPlano
          LookupField = 'nome'
          Options = [loColLines, loRowLines, loTitles]
          TabOrder = 4
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = False
          ShowMatchText = True
          OnEnter = lkcmbPlanoEnter
        end
        object lkcmbTpContr: TwwDBLookupCombo
          Left = 16
          Top = 144
          Width = 305
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'TceDescricao'#9'40'#9'Descricao')
          LookupTable = qryTpContr
          LookupField = 'TceDescricao'
          Options = [loColLines, loRowLines, loTitles]
          TabOrder = 5
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = False
          ShowMatchText = True
        end
        object lkcmbTpEmptmo: TwwDBLookupCombo
          Left = 16
          Top = 184
          Width = 305
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCTIPOEMPTMO'#9'40'#9'Descricao')
          LookupTable = qryTpEmptmo
          LookupField = 'DESCTIPOEMPTMO'
          Options = [loColLines, loRowLines, loTitles]
          TabOrder = 6
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = False
          ShowMatchText = True
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 248
    Width = 628
    inherited tb97Fundo: TToolbar97
      Left = 292
      DockPos = 292
    end
    inherited TbBtnRel: TToolbar97
      inherited rbtnVisualizar: TBitBtn
        OnClick = rbtnVisualizarClick
      end
      inherited rbtnImprimir: TBitBtn
        OnClick = rbtnImprimirClick
      end
    end
  end
  inherited cdMestre: TColorDialog
    Left = 417
    Top = 180
  end
  inherited cdCabecalho: TColorDialog
    Left = 406
    Top = 149
  end
  object qryPatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select NOME, IDPESSOA'
      'From PESSOA'
      'Where FLGPATROCINADORA = 1'
      'Order by UPPER(NOME)')
    ValidateWithMask = True
    Left = 384
    Top = 72
  end
  object qryParticip: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 208
    Top = 80
  end
  object qryPlano: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 256
    Top = 120
  end
  object qryTpContr: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select IDTIPOCONTRATO, TceDescricao'
      'From TIPOCONTR'
      'ORDER BY UPPER(TceDescricao)')
    ValidateWithMask = True
    Left = 208
    Top = 160
  end
  object qryTpEmptmo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select IDTIPOEMPTMO, DESCTIPOEMPTMO'
      'From TIPOEMPTMO'
      'Order by UPPER(DESCTIPOEMPTMO)')
    ValidateWithMask = True
    Left = 272
    Top = 200
  end
end
