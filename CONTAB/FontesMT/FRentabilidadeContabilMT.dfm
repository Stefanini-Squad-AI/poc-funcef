inherited FrmRentabilidadeContabilMT: TFrmRentabilidadeContabilMT
  Left = 365
  Top = 104
  HelpContext = 10121
  BorderIcons = [biSystemMenu, biMinimize, biHelp]
  Caption = 'Rentabilidade Contábil'
  ClientHeight = 608
  ClientWidth = 743
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 743
    Height = 569
    object grpDatas: TGroupBox
      Left = 1
      Top = 1
      Width = 741
      Height = 140
      Align = alTop
      TabOrder = 0
      object lblMes: TLabel
        Left = 166
        Top = 17
        Width = 96
        Height = 13
        AutoSize = False
        Caption = 'Período Inicial:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblExercicio: TLabel
        Left = 14
        Top = 17
        Width = 62
        Height = 13
        AutoSize = False
        Caption = 'Exercício:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblMesFinal: TLabel
        Left = 308
        Top = 17
        Width = 81
        Height = 13
        Caption = 'Período Final:'
      end
      object dblkPeriodo: TwwDBLookupCombo
        Left = 166
        Top = 32
        Width = 127
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'PERNOME'#9'25'#9'Descrição'#9'F')
        DataField = 'PEREXERCI'
        LookupTable = cdsPeriodo
        LookupField = 'PERNUMERO'
        Options = [loTitles]
        Style = csDropDownList
        DropDownWidth = 8
        Enabled = False
        ParentFont = False
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnCloseUp = dblkPeriodoCloseUp
      end
      object dblkExercicio: TwwDBLookupCombo
        Left = 14
        Top = 32
        Width = 100
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'PEREXERCICIO'#9'10'#9'Descrição'#9'F')
        LookupTable = cdsExercicio
        LookupField = 'PEREXERCICIO'
        Options = [loTitles]
        Style = csDropDownList
        DropDownWidth = 8
        ParentFont = False
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnCloseUp = dblkExercicioCloseUp
      end
      object dblkPeriodoFim: TwwDBLookupCombo
        Left = 308
        Top = 32
        Width = 127
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'PERNOME'#9'25'#9'Descrição'#9'F')
        DataField = 'PEREXERCI'
        LookupTable = cdsPeriodoFim
        LookupField = 'PERNUMERO'
        Options = [loTitles]
        Style = csDropDownList
        DropDownWidth = 8
        Enabled = False
        ParentFont = False
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnCloseUp = dblkPeriodoCloseUp
      end
      object chkDesconsidera: TCheckBox
        Left = 12
        Top = 76
        Width = 270
        Height = 17
        Caption = 'Desconsiderar o encerramento de resultado'
        TabOrder = 3
      end
      object GroupBox1: TGroupBox
        Left = 448
        Top = 8
        Width = 279
        Height = 121
        Caption = ' De-Para dos grupos '
        TabOrder = 4
        object Label1: TLabel
          Left = 5
          Top = 25
          Width = 33
          Height = 13
          Caption = 'Custo'
        end
        object Label2: TLabel
          Left = 5
          Top = 93
          Width = 38
          Height = 13
          Caption = 'Outros'
        end
        object lblPatrimonioSocial: TLabel
          Left = 5
          Top = 57
          Width = 99
          Height = 13
          Caption = 'Patrimônio Social'
        end
        object lblCoast: TLabel
          Left = 124
          Top = 24
          Width = 12
          Height = 13
          Caption = '->'
        end
        object lblPatriSocial: TLabel
          Left = 124
          Top = 56
          Width = 12
          Height = 13
          Caption = '->'
        end
        object lbloutros: TLabel
          Left = 124
          Top = 88
          Width = 12
          Height = 13
          Caption = '->'
        end
        object CbCusto: TwwDBComboBox
          Left = 148
          Top = 21
          Width = 121
          Height = 21
          ShowButton = True
          Style = csDropDownList
          MapList = True
          AllowClearKey = False
          DropDownCount = 8
          ItemHeight = 0
          Items.Strings = (
            
              'Nenhum'#9'                                     cCusto  : Char = '#39'X'#39 +
              ';'#13#10'                                     cOutros : Char = '#39'X'#39#13#10'X'
            'Ativo'#9'A'
            'Passivo'#9'P'
            'Receita'#9'R'
            'Despesa'#9'D')
          ItemIndex = 4
          Sorted = False
          TabOrder = 0
          UnboundDataType = wwDefault
        end
        object CbOutros: TwwDBComboBox
          Left = 148
          Top = 85
          Width = 121
          Height = 21
          ShowButton = True
          Style = csDropDownList
          MapList = True
          AllowClearKey = False
          DropDownCount = 8
          ItemHeight = 0
          Items.Strings = (
            'Nenhum'#9'X'
            'Ativo'#9'A'
            'Passivo'#9'P'
            'Receita'#9'R'
            'Despesa'#9'D')
          ItemIndex = 4
          Sorted = False
          TabOrder = 1
          UnboundDataType = wwDefault
        end
        object CbPatriSocial: TwwDBComboBox
          Left = 148
          Top = 53
          Width = 121
          Height = 21
          ShowButton = True
          Style = csDropDownList
          MapList = True
          AllowClearKey = False
          DropDownCount = 8
          ItemHeight = 0
          Items.Strings = (
            'Nenhum'#9'X'
            'Ativo'#9'A'
            'Passivo'#9'P'
            'Receita'#9'R'
            'Despesa'#9'D')
          ItemIndex = 2
          Sorted = False
          TabOrder = 2
          UnboundDataType = wwDefault
        end
      end
    end
    object pgcPatroPlanoResult: TPageControl
      Left = 1
      Top = 141
      Width = 741
      Height = 427
      ActivePage = tbsPlanoPatro
      Align = alClient
      TabOrder = 1
      OnChange = pgcPatroPlanoResultChange
      object tbsPlanoPatro: TTabSheet
        Caption = 'Patrocinadora e Plano'
        object grpPatro: TGroupBox
          Left = 0
          Top = 0
          Width = 427
          Height = 399
          Align = alClient
          Caption = 'Patrocinadora'
          TabOrder = 0
          object dbgrPatro: TwwDBGrid
            Left = 2
            Top = 15
            Width = 423
            Height = 382
            ControlType.Strings = (
              'MARCA;CheckBox;S;N')
            Selected.Strings = (
              'MARCA'#9'1'#9'Imp.'#9'F'
              'NOME'#9'60'#9'Patrocinadora'#9'F'
              'IDPESSOA'#9'10'#9'Código'#9'F')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsPatro
            TabOrder = 0
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            OnCalcCellColors = dbgrPatroCalcCellColors
            IndicatorColor = icBlack
            OnTopRowChanged = dbgrPatroTopRowChanged
          end
        end
        object grpPlanoPrev: TGroupBox
          Left = 427
          Top = 0
          Width = 306
          Height = 399
          Align = alRight
          Caption = 'Plano Previdenciário'
          TabOrder = 1
          object dbgrPlanoPrev: TwwDBGrid
            Left = 2
            Top = 15
            Width = 302
            Height = 382
            ControlType.Strings = (
              'MARCA;CheckBox;S;N')
            Selected.Strings = (
              'MARCA'#9'4'#9'Imp.'
              'NOME'#9'50'#9'Plano')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsPlanoPrev
            TabOrder = 0
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            OnCalcCellColors = dbgrPatroCalcCellColors
            IndicatorColor = icBlack
            OnTopRowChanged = dbgrPatroTopRowChanged
          end
        end
      end
      object tbsResult: TTabSheet
        Caption = 'Resultado'
        ImageIndex = 1
        TabVisible = False
        object grpResultados: TGroupBox
          Left = 0
          Top = 0
          Width = 733
          Height = 307
          Align = alClient
          Caption = 'Resultado da Conferência'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object dbgResult: TwwDBGrid
            Left = 2
            Top = 15
            Width = 729
            Height = 290
            Selected.Strings = (
              'DATA'#9'9'#9'Data'
              'ATIVO'#9'15'#9'Ativo'
              'PASSIVO'#9'15'#9'Passivo'
              'LIQUIDO'#9'15'#9'Liquido'
              'RECEITA'#9'15'#9'Receita'
              'DESPESA'#9'15'#9'Despesa'
              'MES'#9'15'#9'Mes'
              'DIA'#9'15'#9'Dia'
              'RENTDIA'#9'10'#9'Rent. Dia')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsResult
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            ParentFont = False
            TabOrder = 0
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clNavy
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            OnCalcCellColors = dbgrPatroCalcCellColors
            IndicatorColor = icBlack
            OnTopRowChanged = dbgrPatroTopRowChanged
          end
        end
      end
      object tbRentab: TTabSheet
        Caption = 'Rentabilidade Contabil'
        ImageIndex = 2
        object dbgridRentab: TwwDBGrid
          Left = 0
          Top = 0
          Width = 733
          Height = 399
          ControlType.Strings = (
            'MARCA;CheckBox;S;N')
          Selected.Strings = (
            'MARCA'#9'1'#9'Sel.'
            'DESCRICAO'#9'50'#9'Rentabilidade Contabil')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsSpcConsiste
          TabOrder = 0
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          OnCalcCellColors = dbgridRentabCalcCellColors
          IndicatorColor = icBlack
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 569
    Width = 743
    inherited tb97Fundo: TToolbar97
      Left = 438
      DockPos = 438
      inherited sep1: TToolbarSep97
        Left = 255
      end
      inherited sep3: TToolbarSep97
        Left = 171
      end
      inherited bbtnSair: TBitBtn
        Left = 90
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 174
      end
      object bbtnImprimir: TBitBtn
        Left = 0
        Top = 0
        Width = 90
        Height = 33
        Caption = ' &Visualizar'
        Enabled = False
        TabOrder = 2
        OnClick = bbtnImprimirClick
        Glyph.Data = {
          AA040000424DAA04000000000000360000002800000013000000130000000100
          18000000000074040000C40E0000C40E000000000000000000000000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FF0000FF0000FF0000FF0000FF0000FF0000FF0000000000FF0000FF0000FF00
          00FF0000FF0000FF0000FF0000FF0000000000000000000000FF0000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000000000FF0000FF0000FF0000FF0000
          FF0000FF000000000000C0C0C08080808080800000000000000000FF0000FF00
          00FF0000FF0000FF0000FF0000000000FF0000FF0000FF0000FF000000000000
          C0C0C0C0C0C00000000000000000008080808080800000000000000000FF0000
          FF0000FF0000FF0000000000FF0000FF000000000000C0C0C0C0C0C000000000
          0000C0C0C08080808080800000000000008080808080800000000000000000FF
          0000FF0000000000FF000000C0C0C0C0C0C0000000000000C0C0C0C0C0C0C0C0
          C08080808080808080808080800000000000008080808080800000000000FF00
          00000000FF808080000000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0808080
          8080808080808080808080808080800000000000000000000000FF0000000000
          FF000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0FFFFFF80808080808080
          80808080808080808080808080808080800000000000FF0000000000FF808080
          C0C0C0C0C0C0C0C0C0C0C0C0FFFFFFFFFFFFC0C0C0C0C0C0C0C0C08080808080
          808080808080808080808080800000000000FF0000000000FF808080C0C0C0C0
          C0C0FFFFFFFFFFFFC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0808080
          8080808080808080800000000000FF0000000000FF808080FFFFFFFFFFFFC0C0
          C0C0C0C0C0C0C00000FF0000FFC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C080
          80808080800000000000FF0000000000FF808080C0C0C0C0C0C0C0C0C000FF00
          00FF00C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0
          C00000000000FF0000000000FF0000FF808080808080FFFFFFC0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0FFFFFFFFFFFF000000C0C0C08080808080800000FF
          0000FF0000000000FF0000FF0000FF0000FF808080808080FFFFFFC0C0C08080
          80FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000FF0000FF0000FF0000FF00
          00000000FF0000FF0000FF0000FF0000FF0000FF808080808080808080FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000FF0000FF0000FF0000000000
          FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF808080808080FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000FF0000000000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF808080FFFFFFFFFF
          FFFFFFFF8080808080800000FF0000FF0000FF0000000000FF0000FF0000FF00
          00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF808080808080808080
          0000FF0000FF0000FF0000FF0000FF0000000000FF0000FF0000FF0000FF0000
          FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FF0000FF0000FF000000}
        Spacing = 2
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 268
      DockPos = 268
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
    object bbExportar: TBitBtn
      Left = 77
      Top = 2
      Width = 93
      Height = 33
      Hint = 'Exportação de Dados'
      Caption = ' &Exportar'
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = bbExportarClick
      Glyph.Data = {
        F2060000424DF20600000000000036040000280000001B000000190000000100
        080000000000BC02000000000000000000000001000000000000000000000000
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
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFF6F6F6F6F6
        F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F600FFF6F6F6F6F6F6F6F6F6
        F6F6F6F6F606F6F6F6F6F6F6F6F6F6F6F600FFF6F6F6F6F6F6F6F6F6F6F6F6F6
        F606F6F6F6F6F6F6F6F6F6F6F600FFF6F6F6F6F6F6F9F6F6F6F6F6F6F70606F7
        F7F7F7F7F6F6F6F6F600FFF6F6F6F6F6F6F9F9F9F9F6F6F70606060606060606
        06F6F6F6F600FFF6F6F6F6F9F9F9F9F9F6F6F70606060606060606060606F6F6
        F600FFF6F6F6F6F6F9F9F9F9F6F6FCFC0606060606060606060404F6F600FFF6
        F6F6F6F6F6F9F9F9F9F6F6FCFC04040404040404060404F6F600FFF6F6F6F6F6
        F6F9F6F6F6F6F6F6FC04F6F6F6F6F6F6040404F6F600FFF6F6F6F6F6F6F6F6F6
        F6F6F6F6F604F6F6F6F6F6F6060604F6F600FFF6F6F6F6F6F6F6F6F6F6F6F6F6
        F6F6F6F6F6F6F604060604F6F600FFF6F6F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7
        F6F604040604F6F6F600FFF6F6F7F6F6F6F6F6F6F6F6F7FCFCF7F6F7F6060404
        04F6F6F6F600FFF6F6F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F6060404F6F6F6F6
        F600FFF6F6F7F6F6F6F6F6F6F6F6F7FCFCF7F6F7F60604F6F6F6F6F6F600FFF6
        F6F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F606F6F9F9F9F6F6F600FFF6F6F7F6F6
        F6F6F6F6F6F6F7FCFCF7F6F7F6F6F9F9F6F9F9F6F600FFF6F6F7F7F7F7F7F7F7
        F7F7F7F7F7F7F7F7F6F6F6F6F6F9F9F6F600FFF6F6F7F6F6F6F6F6F6F6F6F7FC
        FCF7F6F7F6F6F6F6F9F9F6F6F600FFF6F6F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7
        F6F6F6F6F6F9F9F6F600FFF6F6F7FCFCFCFCFCFCFCFCFCFCFCFCFCF7F6F6F9F9
        F6F9F9F6F600FFF6F6F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F6F6F6F9F9F9F6F6
        F600FFF6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F600FFF6
        F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F600FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00}
      Spacing = 1
    end
    object bbtnInverte: TBitBtn
      Left = 8
      Top = 2
      Width = 54
      Height = 33
      Hint = 'Seleciona/Inverte a Seleção'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = bbtnInverteClick
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
    object btnExportar_Sintetico: TBitBtn
      Left = 174
      Top = 2
      Width = 93
      Height = 33
      Hint = 'Exportação de Dados'
      Caption = ' &Exportar'
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = btnExportar_SinteticoClick
      Glyph.Data = {
        F2060000424DF20600000000000036040000280000001B000000190000000100
        080000000000BC02000000000000000000000001000000000000000000000000
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
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFF6F6F6F6F6
        F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F600FFF6F6F6F6F6F6F6F6F6
        F6F6F6F6F606F6F6F6F6F6F6F6F6F6F6F600FFF6F6F6F6F6F6F6F6F6F6F6F6F6
        F606F6F6F6F6F6F6F6F6F6F6F600FFF6F6F6F6F6F6F9F6F6F6F6F6F6F70606F7
        F7F7F7F7F6F6F6F6F600FFF6F6F6F6F6F6F9F9F9F9F6F6F70606060606060606
        06F6F6F6F600FFF6F6F6F6F9F9F9F9F9F6F6F70606060606060606060606F6F6
        F600FFF6F6F6F6F6F9F9F9F9F6F6FCFC0606060606060606060404F6F600FFF6
        F6F6F6F6F6F9F9F9F9F6F6FCFC04040404040404060404F6F600FFF6F6F6F6F6
        F6F9F6F6F6F6F6F6FC04F6F6F6F6F6F6040404F6F600FFF6F6F6F6F6F6F6F6F6
        F6F6F6F6F604F6F6F6F6F6F6060604F6F600FFF6F6F6F6F6F6F6F6F6F6F6F6F6
        F6F6F6F6F6F6F604060604F6F600FFF6F6F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7
        F6F604040604F6F6F600FFF6F6F7F6F6F6F6F6F6F6F6F7FCFCF7F6F7F6060404
        04F6F6F6F600FFF6F6F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F6060404F6F6F6F6
        F600FFF6F6F7F6F6F6F6F6F6F6F6F7FCFCF7F6F7F60604F6F6F6F6F6F600FFF6
        F6F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F606F6F9F9F9F6F6F600FFF6F6F7F6F6
        F6F6F6F6F6F6F7FCFCF7F6F7F6F6F9F9F6F9F9F6F600FFF6F6F7F7F7F7F7F7F7
        F7F7F7F7F7F7F7F7F6F6F6F6F6F9F9F6F600FFF6F6F7F6F6F6F6F6F6F6F6F7FC
        FCF7F6F7F6F6F6F6F9F9F6F6F600FFF6F6F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7
        F6F6F6F6F6F9F9F6F600FFF6F6F7FCFCFCFCFCFCFCFCFCFCFCFCFCF7F6F6F9F9
        F6F9F9F6F600FFF6F6F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F6F6F6F9F9F9F6F6
        F600FFF6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F600FFF6
        F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F600FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00}
      Spacing = 1
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 204
    Top = 139
    TargetsData = (
      1
      1
      (
        ''
        'Items'
        0))
  end
  object CdsSpcConsiste: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterOpen = CdsSpcConsisteAfterOpen
    Left = 272
    Top = 80
  end
  object dsPlanoPrev: TDataSource
    DataSet = CdsPlanoPrev
    Left = 29
    Top = 377
  end
  object dsPatro: TDataSource
    DataSet = CdsPatro
    Left = 31
    Top = 245
  end
  object CdsResult: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'MARCA'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'IDSPCCONSISTE'
        DataType = ftFloat
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 50
      end>
    IndexDefs = <>
    IndexFieldNames = 'IDSPCCONSISTE;DATA'
    Params = <>
    StoreDefs = True
    AfterOpen = CdsResultAfterOpen
    Left = 225
    Top = 266
  end
  object dsResult: TwwDataSource
    DataSet = CdsResult
    Left = 225
    Top = 316
  end
  object cdsExercicio: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 89
    Top = 25
  end
  object cdsPeriodo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 273
    Top = 25
  end
  object cdsPeriodoFim: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 369
    Top = 25
  end
  object ppBDEPipeline1: TppBDEPipeline
    DataSource = dsResult
    UserName = 'BDEPipeline1'
    Left = 228
    Top = 212
    object ppBDEPipeline1ppField1: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppBDEPipeline1ppField2: TppField
      FieldAlias = 'IDSPCCONSISTE'
      FieldName = 'IDSPCCONSISTE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppBDEPipeline1ppField3: TppField
      FieldAlias = 'RENTPERIODO'
      FieldName = 'RENTPERIODO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppBDEPipeline1ppField4: TppField
      FieldAlias = 'DATA'
      FieldName = 'DATA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppBDEPipeline1ppField5: TppField
      FieldAlias = 'ATIVO'
      FieldName = 'ATIVO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppBDEPipeline1ppField6: TppField
      FieldAlias = 'PASSIVO'
      FieldName = 'PASSIVO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppBDEPipeline1ppField7: TppField
      FieldAlias = 'LIQUIDO'
      FieldName = 'LIQUIDO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppBDEPipeline1ppField8: TppField
      FieldAlias = 'RECEITA'
      FieldName = 'RECEITA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppBDEPipeline1ppField9: TppField
      FieldAlias = 'DESPESA'
      FieldName = 'DESPESA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppBDEPipeline1ppField10: TppField
      FieldAlias = 'MES'
      FieldName = 'MES'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppBDEPipeline1ppField11: TppField
      FieldAlias = 'DIA'
      FieldName = 'DIA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppBDEPipeline1ppField12: TppField
      FieldAlias = 'RENTDIA'
      FieldName = 'RENTDIA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object ppBDEPipeline1ppField13: TppField
      FieldAlias = 'RENTMENSAL'
      FieldName = 'RENTMENSAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object ppBDEPipeline1ppField14: TppField
      FieldAlias = 'PERNUMERO'
      FieldName = 'PERNUMERO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
  end
  object CdsFundacao: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 129
    Top = 269
    Data = {
      590000009619E0BD010000001800000001000100000003000000570006494D41
      47454D04004B0000000200075355425459504502004900070042696E61727900
      0557494454480200020001000100044C43494404000100090800000001}
  end
  object dsFundacao: TwwDataSource
    DataSet = CdsFundacao
    Left = 127
    Top = 321
  end
  object pplFundacao: TppBDEPipeline
    DataSource = dsFundacao
    UserName = 'lFundacao'
    Left = 128
    Top = 213
    object pplFundacaoppField1: TppField
      FieldAlias = 'IMAGEM'
      FieldName = 'IMAGEM'
      FieldLength = 1
      DataType = dtBLOB
      DisplayWidth = 10
      Position = 0
      Searchable = False
      Sortable = False
    end
  end
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = ppBDEPipeline1
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
    PrinterSetup.PaperSize = 9
    AllowPrintToArchive = True
    AllowPrintToFile = True
    BeforePrint = ppReport1BeforePrint
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 276
    Top = 152
    Version = '7.04'
    mmColumnWidth = 0
    DataPipelineName = 'ppBDEPipeline1'
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 45508
      mmPrintPosition = 0
      object ppLabel26: TppLabel
        UserName = 'Label2'
        AutoSize = False
        Caption = 'Exercício'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 2381
        mmTop = 26458
        mmWidth = 35454
        BandType = 0
      end
      object ppLabel29: TppLabel
        OnPrint = ppLabel29Print
        UserName = 'lblPExercicio1'
        AutoSize = False
        Caption = 'lblPExercicio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 40217
        mmTop = 26458
        mmWidth = 32808
        BandType = 0
      end
      object ppLabel30: TppLabel
        UserName = 'Label30'
        Caption = ':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 38365
        mmTop = 26458
        mmWidth = 1058
        BandType = 0
      end
      object ppLabel31: TppLabel
        UserName = 'Label31'
        AutoSize = False
        Caption = 'Período inicial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 2381
        mmTop = 31485
        mmWidth = 35454
        BandType = 0
      end
      object ppLabel32: TppLabel
        UserName = 'Label32'
        Caption = ':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 38365
        mmTop = 31485
        mmWidth = 1058
        BandType = 0
      end
      object ppLabel33: TppLabel
        OnPrint = ppLabel33Print
        UserName = 'Label33'
        AutoSize = False
        Caption = 'lblPeriodoInicial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 40217
        mmTop = 31485
        mmWidth = 32808
        BandType = 0
      end
      object ppLabel34: TppLabel
        UserName = 'Label34'
        AutoSize = False
        Caption = 'Patrocinadora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 2381
        mmTop = 36513
        mmWidth = 35454
        BandType = 0
      end
      object ppLabel35: TppLabel
        UserName = 'Label35'
        Caption = ':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 38365
        mmTop = 36513
        mmWidth = 1058
        BandType = 0
      end
      object lbPatro: TppLabel
        UserName = 'lblPPatrocinadora1'
        AutoSize = False
        Caption = 'lblPPatrocinadora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 40217
        mmTop = 36513
        mmWidth = 238919
        BandType = 0
      end
      object lbPlano: TppLabel
        UserName = 'lblPPlano1'
        AutoSize = False
        Caption = 'lblPPlano'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 40217
        mmTop = 41275
        mmWidth = 238919
        BandType = 0
      end
      object ppLabel38: TppLabel
        UserName = 'Label101'
        Caption = ':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 38365
        mmTop = 41275
        mmWidth = 1058
        BandType = 0
      end
      object ppLabel39: TppLabel
        UserName = 'Label39'
        AutoSize = False
        Caption = 'Plano de benefícios'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 2381
        mmTop = 41275
        mmWidth = 35453
        BandType = 0
      end
      object ppLabel40: TppLabel
        UserName = 'Label202'
        AutoSize = False
        Caption = 'Período final'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 92604
        mmTop = 31485
        mmWidth = 21960
        BandType = 0
      end
      object ppLabel41: TppLabel
        UserName = 'Label41'
        Caption = ':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 115359
        mmTop = 31485
        mmWidth = 1058
        BandType = 0
      end
      object ppLabel42: TppLabel
        OnPrint = ppLabel42Print
        UserName = 'lblPeriodoFinal1'
        AutoSize = False
        Caption = 'lblPeriodoFinal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 117475
        mmTop = 31221
        mmWidth = 32808
        BandType = 0
      end
      object ppLabel53: TppLabel
        UserName = 'Label53'
        AutoSize = False
        Caption = 'Rentabilidade Contábil'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 25665
        mmTop = 7938
        mmWidth = 250561
        BandType = 0
      end
      object ppDBImage2: TppDBImage
        UserName = 'DBImage2'
        MaintainAspectRatio = False
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = pplFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'pplFundacao'
        mmHeight = 15081
        mmLeft = 5292
        mmTop = 794
        mmWidth = 17463
        BandType = 0
      end
      object ppLabel54: TppLabel
        OnPrint = ppLabel54Print
        UserName = 'Label54'
        AutoSize = False
        Caption = 'Label54'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 25665
        mmTop = 2117
        mmWidth = 250561
        BandType = 0
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        Pen.Width = 2
        ParentWidth = True
        Weight = 1.5
        mmHeight = 2117
        mmLeft = 0
        mmTop = 20373
        mmWidth = 284300
        BandType = 0
      end
      object lbObs: TppLabel
        OnPrint = lbObsPrint
        UserName = 'Label6'
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 25665
        mmTop = 12700
        mmWidth = 175155
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3440
      mmPrintPosition = 0
      object shpCorZebra: TppShape
        OnPrint = shpCorZebraPrint
        UserName = 'shpCorZebra'
        Brush.Color = 14869218
        ParentWidth = True
        Pen.Style = psClear
        mmHeight = 3440
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 4
      end
      object lbVlrRentDia: TppDBText
        OnPrint = lbVlrRentDiaPrint
        UserName = 'lbVlrRentDia'
        DataField = 'RENTDIA'
        DataPipeline = ppBDEPipeline1
        DisplayFormat = '#0.00000;-#0.00000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEPipeline1'
        mmHeight = 3175
        mmLeft = 261673
        mmTop = 0
        mmWidth = 20638
        BandType = 4
      end
      object ppDBText17: TppDBText
        UserName = 'DBText17'
        DataField = 'ATIVO'
        DataPipeline = ppBDEPipeline1
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEPipeline1'
        mmHeight = 3175
        mmLeft = 22754
        mmTop = 0
        mmWidth = 32279
        BandType = 4
      end
      object ppDBText16: TppDBText
        UserName = 'DBText16'
        DataField = 'PASSIVO'
        DataPipeline = ppBDEPipeline1
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEPipeline1'
        mmHeight = 3175
        mmLeft = 56886
        mmTop = 0
        mmWidth = 32279
        BandType = 4
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        DataField = 'LIQUIDO'
        DataPipeline = ppBDEPipeline1
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEPipeline1'
        mmHeight = 3175
        mmLeft = 91281
        mmTop = 0
        mmWidth = 32279
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        DataField = 'RECEITA'
        DataPipeline = ppBDEPipeline1
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEPipeline1'
        mmHeight = 3175
        mmLeft = 124884
        mmTop = 0
        mmWidth = 32279
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        DataField = 'DESPESA'
        DataPipeline = ppBDEPipeline1
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEPipeline1'
        mmHeight = 3175
        mmLeft = 159279
        mmTop = 0
        mmWidth = 32279
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'DIA'
        DataPipeline = ppBDEPipeline1
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEPipeline1'
        mmHeight = 3175
        mmLeft = 227542
        mmTop = 0
        mmWidth = 32279
        BandType = 4
      end
      object ppDBText18: TppDBText
        UserName = 'DBText18'
        DataField = 'DATA'
        DataPipeline = ppBDEPipeline1
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDEPipeline1'
        mmHeight = 3175
        mmLeft = 2381
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'MES'
        DataPipeline = ppBDEPipeline1
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEPipeline1'
        mmHeight = 3175
        mmLeft = 193411
        mmTop = 0
        mmWidth = 32279
        BandType = 4
      end
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 8467
      mmPrintPosition = 0
      object ppLine2: TppLine
        UserName = 'Line2'
        Pen.Width = 2
        ParentWidth = True
        Position = lpBottom
        Weight = 1.5
        mmHeight = 1323
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 8
      end
      object lbSistema: TppLabel
        OnPrint = lbSistemaPrint
        UserName = 'lbSistema'
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 1852
        mmWidth = 54240
        BandType = 8
      end
      object ppSystemVariable3: TppSystemVariable
        UserName = 'SystemVariable3'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 133350
        mmTop = 2381
        mmWidth = 17463
        BandType = 8
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 258498
        mmTop = 2381
        mmWidth = 25929
        BandType = 8
      end
    end
    object ppSummaryBand2: TppSummaryBand
      NewPage = True
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 6085
      mmPrintPosition = 0
      object ppSubReport1: TppSubReport
        OnPrint = ppSubReport1Print
        UserName = 'SubReport1'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        DataPipelineName = 'dbPlREntab'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 265
        mmWidth = 284300
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = dbPlREntab
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Report'
          PrinterSetup.Orientation = poLandscape
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 210000
          PrinterSetup.mmPaperWidth = 297000
          PrinterSetup.PaperSize = 9
          Left = 368
          Top = 240
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'dbPlREntab'
          object ppTitleBand1: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 21696
            mmPrintPosition = 0
            object ppLabel5: TppLabel
              UserName = 'Label8'
              Caption = 'Líquido (A-P)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 4233
              mmLeft = 89959
              mmTop = 11113
              mmWidth = 21960
              BandType = 1
            end
            object ppLabel7: TppLabel
              UserName = 'Label10'
              Caption = 'Resultado do período'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 4191
              mmLeft = 114882
              mmTop = 11113
              mmWidth = 36195
              BandType = 1
            end
            object ppLabel8: TppLabel
              UserName = 'Label102'
              Caption = 'Rentabilidade de'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 4233
              mmLeft = 199496
              mmTop = 11113
              mmWidth = 28046
              BandType = 1
            end
            object ppLabel10: TppLabel
              UserName = 'Label11'
              Caption = 'Rentabilidade'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 5821
              mmTop = 11113
              mmWidth = 68792
              BandType = 1
            end
            object ppLine3: TppLine
              UserName = 'Line3'
              Pen.Width = 2
              ParentWidth = True
              Weight = 1.5
              mmHeight = 794
              mmLeft = 0
              mmTop = 21167
              mmWidth = 284300
              BandType = 1
            end
            object ppLabel9: TppLabel
              UserName = 'Label103'
              Caption = 'Rentabilidade por período'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 4191
              mmLeft = 235798
              mmTop = 11113
              mmWidth = 43603
              BandType = 1
            end
            object ppLabel14: TppLabel
              UserName = 'Label104'
              Caption = 'Resultado de'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 4191
              mmLeft = 163376
              mmTop = 11113
              mmWidth = 22098
              BandType = 1
            end
            object LblMesExtenso: TppLabel
              UserName = 'LblMesExtenso'
              Caption = 'Mês'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 4191
              mmLeft = 178574
              mmTop = 15610
              mmWidth = 6900
              BandType = 1
            end
            object ppLabel15: TppLabel
              UserName = 'LblMesExtenso1'
              Caption = 'Mês'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 4233
              mmLeft = 220663
              mmTop = 15610
              mmWidth = 6879
              BandType = 1
            end
          end
          object ppDetailBand2: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 5821
            mmPrintPosition = 0
            object ppDBText2: TppDBText
              UserName = 'DBText2'
              DataField = 'DESCRICAO'
              DataPipeline = dbPlREntab
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'dbPlREntab'
              mmHeight = 3969
              mmLeft = 5556
              mmTop = 794
              mmWidth = 69056
              BandType = 4
            end
            object ppDBText4: TppDBText
              UserName = 'DBText4'
              DataField = 'LIQUIDO'
              DataPipeline = dbPlREntab
              DisplayFormat = '#,##0.00;-#,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'dbPlREntab'
              mmHeight = 3969
              mmLeft = 75142
              mmTop = 794
              mmWidth = 36513
              BandType = 4
            end
            object ppDBText6: TppDBText
              UserName = 'DBText6'
              DataField = 'MES'
              DataPipeline = dbPlREntab
              DisplayFormat = '#,##0.00;-#,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'dbPlREntab'
              mmHeight = 3969
              mmLeft = 113771
              mmTop = 794
              mmWidth = 37306
              BandType = 4
            end
            object ppDBText7: TppDBText
              UserName = 'DBText7'
              DataField = 'RENTMENSAL'
              DataPipeline = dbPlREntab
              DisplayFormat = '#0.00000;-#0.00000'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'dbPlREntab'
              mmHeight = 3969
              mmLeft = 187855
              mmTop = 794
              mmWidth = 40746
              BandType = 4
            end
            object ppDBText8: TppDBText
              UserName = 'DBText8'
              DataField = 'RENTPERIODO'
              DataPipeline = dbPlREntab
              DisplayFormat = '#0.00000;-#0.00000'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'dbPlREntab'
              mmHeight = 3969
              mmLeft = 234421
              mmTop = 794
              mmWidth = 41010
              BandType = 4
            end
            object ppLabel11: TppLabel
              UserName = 'Label1'
              Caption = '%'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 275696
              mmTop = 794
              mmWidth = 3175
              BandType = 4
            end
            object ppLabel12: TppLabel
              UserName = 'Label2'
              Caption = '%'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 228865
              mmTop = 794
              mmWidth = 3175
              BandType = 4
            end
            object ppDBText10: TppDBText
              UserName = 'DBText10'
              DataField = 'ULT_MES'
              DataPipeline = dbPlREntab
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'dbPlREntab'
              mmHeight = 3969
              mmLeft = 152400
              mmTop = 794
              mmWidth = 33073
              BandType = 4
            end
          end
          object ppSummaryBand1: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
          object raCodeModule1: TraCodeModule
            ProgramStream = {00}
          end
        end
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'IDSPCCONSISTE'
      DataPipeline = ppBDEPipeline1
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppBDEPipeline1'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 9260
        mmPrintPosition = 0
        object ppLabel21: TppLabel
          UserName = 'Label1'
          AutoSize = False
          Caption = 'Rentabilidade contábil'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 2381
          mmTop = 529
          mmWidth = 35454
          BandType = 3
          GroupNo = 0
        end
        object ppDBText3: TppDBText
          UserName = 'DBText3'
          DataField = 'DESCRICAO'
          DataPipeline = ppBDEPipeline1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppBDEPipeline1'
          mmHeight = 4233
          mmLeft = 40217
          mmTop = 265
          mmWidth = 82286
          BandType = 3
          GroupNo = 0
        end
        object ppLabel27: TppLabel
          UserName = 'Label27'
          Caption = ':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3969
          mmLeft = 38365
          mmTop = 529
          mmWidth = 1058
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        AfterPrint = ppGroupFooterBand1AfterPrint
        mmBottomOffset = 0
        mmHeight = 20638
        mmPrintPosition = 0
        object ppLabel3: TppLabel
          UserName = 'Label7'
          AutoSize = False
          Caption = 'Rentabilidade do período'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 180975
          mmTop = 14288
          mmWidth = 44715
          BandType = 5
          GroupNo = 0
        end
        object ppLabel6: TppLabel
          UserName = 'Label12'
          AutoSize = False
          Caption = '%'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 278871
          mmTop = 14288
          mmWidth = 3704
          BandType = 5
          GroupNo = 0
        end
        object vAcumPeriodo: TppVariable
          UserName = 'vAcumPeriodo'
          AutoSize = False
          CalcOrder = 0
          DataType = dtDouble
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          Visible = False
          mmHeight = 3969
          mmLeft = 125942
          mmTop = 12171
          mmWidth = 34396
          BandType = 5
          GroupNo = 0
        end
        object dbRentPer: TppDBText
          OnPrint = dbRentPerPrint
          UserName = 'dbRentPer'
          DataField = 'RENTPERIODO'
          DataPipeline = ppBDEPipeline1
          DisplayFormat = '#0.00000;-#0.00000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppBDEPipeline1'
          mmHeight = 3969
          mmLeft = 233892
          mmTop = 14288
          mmWidth = 44450
          BandType = 5
          GroupNo = 0
        end
        object ppLabel13: TppLabel
          UserName = 'Label13'
          Caption = 'Total período'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4191
          mmLeft = 169863
          mmTop = 6350
          mmWidth = 22352
          BandType = 5
          GroupNo = 0
        end
        object ppLine6: TppLine
          UserName = 'Line6'
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 169863
          mmTop = 3704
          mmWidth = 114565
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'DIA'
          DataPipeline = ppBDEPipeline1
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppBDEPipeline1'
          mmHeight = 3969
          mmLeft = 193146
          mmTop = 6350
          mmWidth = 32544
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'PERNUMERO'
      DataPipeline = ppBDEPipeline1
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppBDEPipeline1'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 16140
        mmPrintPosition = 0
        object ppLabel2: TppLabel
          UserName = 'Label4'
          Caption = 'Período:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 2381
          mmTop = 529
          mmWidth = 14288
          BandType = 3
          GroupNo = 1
        end
        object ppDBText1: TppDBText
          UserName = 'DBText1'
          DataField = 'PERNUMERO'
          DataPipeline = ppBDEPipeline1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppBDEPipeline1'
          mmHeight = 4233
          mmLeft = 17992
          mmTop = 529
          mmWidth = 30692
          BandType = 3
          GroupNo = 1
        end
        object ppLabel43: TppLabel
          UserName = 'Label43'
          Caption = 'Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 2381
          mmTop = 10583
          mmWidth = 7673
          BandType = 3
          GroupNo = 1
        end
        object ppLabel44: TppLabel
          UserName = 'Label44'
          Caption = 'Ativo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 46302
          mmTop = 10583
          mmWidth = 8731
          BandType = 3
          GroupNo = 1
        end
        object ppLabel45: TppLabel
          UserName = 'Label45'
          Caption = 'Passivo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 75936
          mmTop = 10583
          mmWidth = 13229
          BandType = 3
          GroupNo = 1
        end
        object ppLabel46: TppLabel
          UserName = 'Label46'
          Caption = 'Líquido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 110861
          mmTop = 10583
          mmWidth = 12700
          BandType = 3
          GroupNo = 1
        end
        object ppLabel47: TppLabel
          UserName = 'Label47'
          Caption = 'Receita'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 144992
          mmTop = 10583
          mmWidth = 12435
          BandType = 3
          GroupNo = 1
        end
        object ppLabel48: TppLabel
          UserName = 'Label48'
          Caption = 'Despesa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 177007
          mmTop = 10583
          mmWidth = 14552
          BandType = 3
          GroupNo = 1
        end
        object ppLabel51: TppLabel
          UserName = 'Label51'
          Caption = 'Dia'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 254265
          mmTop = 10583
          mmWidth = 5556
          BandType = 3
          GroupNo = 1
        end
        object ppLabel49: TppLabel
          UserName = 'Label49'
          Caption = 'Mês'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 218811
          mmTop = 10583
          mmWidth = 6879
          BandType = 3
          GroupNo = 1
        end
        object ppLine1: TppLine
          UserName = 'Line1'
          Pen.Width = 2
          ParentWidth = True
          Position = lpBottom
          Weight = 1.5
          mmHeight = 1323
          mmLeft = 0
          mmTop = 14552
          mmWidth = 284300
          BandType = 3
          GroupNo = 1
        end
        object ppLabel50: TppLabel
          UserName = 'Label50'
          Caption = 'Rent. dia'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4191
          mmLeft = 266965
          mmTop = 10583
          mmWidth = 14859
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        AfterPrint = ppGroupFooterBand2AfterPrint
        mmBottomOffset = 0
        mmHeight = 13494
        mmPrintPosition = 0
        object ppLabel1: TppLabel
          UserName = 'Label3'
          Caption = 'Total mensal'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4191
          mmLeft = 169863
          mmTop = 5821
          mmWidth = 21548
          BandType = 5
          GroupNo = 1
        end
        object ppLabel4: TppLabel
          UserName = 'Label5'
          Caption = '%'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 278871
          mmTop = 6085
          mmWidth = 3704
          BandType = 5
          GroupNo = 1
        end
        object ppLine5: TppLine
          UserName = 'Line5'
          Pen.Width = 2
          ParentWidth = True
          Position = lpBottom
          Weight = 1.5
          mmHeight = 529
          mmLeft = 0
          mmTop = 0
          mmWidth = 284300
          BandType = 5
          GroupNo = 1
        end
        object vAcumMensal: TppVariable
          UserName = 'vAcumMensal'
          AutoSize = False
          CalcOrder = 0
          DataType = dtDouble
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          Visible = False
          mmHeight = 3969
          mmLeft = 125942
          mmTop = 6085
          mmWidth = 34925
          BandType = 5
          GroupNo = 1
        end
        object dbRentMensal: TppDBText
          UserName = 'dbRentMensal'
          DataField = 'RENTMENSAL'
          DataPipeline = ppBDEPipeline1
          DisplayFormat = '#0.00000;-#0.00000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppBDEPipeline1'
          mmHeight = 3969
          mmLeft = 233892
          mmTop = 6085
          mmWidth = 44450
          BandType = 5
          GroupNo = 1
        end
        object ppCalcAcumuladoMensal: TppDBCalc
          UserName = 'LblCalcAcumulaMes1'
          DataField = 'DIA'
          DataPipeline = ppBDEPipeline1
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppBDEPipeline1'
          mmHeight = 3969
          mmLeft = 194998
          mmTop = 6085
          mmWidth = 30692
          BandType = 5
          GroupNo = 1
        end
      end
    end
    object raCodeModule2: TraCodeModule
      ProgramStream = {00}
    end
    object ppParameterList1: TppParameterList
    end
  end
  object CdsPatro: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterOpen = cdsPlanoPrevAfterOpen
    Left = 29
    Top = 197
  end
  object CdsPlanoPrev: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterOpen = cdsPlanoPrevAfterOpen
    Left = 31
    Top = 319
  end
  object dsSpcConsiste: TDataSource
    DataSet = CdsSpcConsiste
    Left = 393
    Top = 81
  end
  object CMSqlParams1: TCMSqlParams
    SQL.Strings = (
      'SELECT   ('#39'N'#39') as Marca,        '
      '             S.IDSPCCONSISTE,  '
      '             S.DESCRICAO           '
      '    FROM     SPCCONSISTE S'
      '    WHERE    S.TIPOCONSISTE = '#39'TR'#39
      '    ORDER BY S.DESCRICAO       '
      '')
    Left = 185
    Top = 385
  end
  object dsRentab: TwwDataSource
    DataSet = cdsRentab
    Left = 343
    Top = 302
  end
  object dbPlREntab: TppBDEPipeline
    DataSource = dsRentab
    UserName = 'Rentab'
    Left = 338
    Top = 208
    object ppBDEPipeline2ppField1: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppBDEPipeline2ppField2: TppField
      FieldAlias = 'RENTPERIODO'
      FieldName = 'RENTPERIODO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppBDEPipeline2ppField3: TppField
      FieldAlias = 'LIQUIDO'
      FieldName = 'LIQUIDO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppBDEPipeline2ppField4: TppField
      FieldAlias = 'MES'
      FieldName = 'MES'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppBDEPipeline2ppField5: TppField
      FieldAlias = 'RENTMENSAL'
      FieldName = 'RENTMENSAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object dbPlREntabppField1: TppField
      FieldAlias = 'ULT_MES'
      FieldName = 'ULT_MES'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
  end
  object cdsRentab: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 342
    Top = 253
  end
  object CMSqlParams2: TCMSqlParams
    SQL.Strings = (
      'SELECT   ('#39'N'#39') as Marca,        '
      '             S.IDSPCCONSISTE,  '
      '             S.DESCRICAO           '
      '    FROM     SPCCONSISTE S'
      '    WHERE    S.TIPOCONSISTE = '#39'TR'#39
      '    ORDER BY S.DESCRICAO       '
      '')
    ClientDataSet = CdsResult
    Left = 305
    Top = 385
  end
  object QExport3Dialog1: TQExport3Dialog
    ShowPrintAfter = False
    DataSet = CdsResult
    AllowedExports = [aeCSV]
    CommonOptions = [coFields, coFormats, coColons, coCaptions]
    OptionsFileName = 'CFG_Rentabilidade_Analitica'
    SaveLoadButtons = True
    FileName = 'C:\PLANUS\TEMP\Rentabilidade_Analitica.csv'
    Header.Strings = (
      'FUNCEF - CONTABILIDADE - RENTABILIDADE CONTÁBIL')
    Footer.Strings = (
      'PLANUS - CONTABILIDADE')
    ExportEmpty = False
    RTFOptions.CaptionStyle.Font.Charset = DEFAULT_CHARSET
    RTFOptions.CaptionStyle.Font.Color = clBlack
    RTFOptions.CaptionStyle.Font.Height = -13
    RTFOptions.CaptionStyle.Font.Name = 'Arial'
    RTFOptions.CaptionStyle.Font.Style = [fsBold]
    RTFOptions.CaptionStyle.Alignment = talCenter
    RTFOptions.DataStyle.Font.Charset = DEFAULT_CHARSET
    RTFOptions.DataStyle.Font.Color = clBlack
    RTFOptions.DataStyle.Font.Height = -13
    RTFOptions.DataStyle.Font.Name = 'Arial'
    RTFOptions.DataStyle.Font.Style = []
    RTFOptions.FooterStyle.Font.Charset = DEFAULT_CHARSET
    RTFOptions.FooterStyle.Font.Color = clBlack
    RTFOptions.FooterStyle.Font.Height = -13
    RTFOptions.FooterStyle.Font.Name = 'Arial'
    RTFOptions.FooterStyle.Font.Style = []
    RTFOptions.HeaderStyle.Font.Charset = DEFAULT_CHARSET
    RTFOptions.HeaderStyle.Font.Color = clBlack
    RTFOptions.HeaderStyle.Font.Height = -13
    RTFOptions.HeaderStyle.Font.Name = 'Arial'
    RTFOptions.HeaderStyle.Font.Style = []
    RTFOptions.StripStyles = <>
    HTMLPageOptions.TextFont.Charset = DEFAULT_CHARSET
    HTMLPageOptions.TextFont.Color = clWhite
    HTMLPageOptions.TextFont.Height = -11
    HTMLPageOptions.TextFont.Name = 'Arial'
    HTMLPageOptions.TextFont.Style = []
    CSVOptions.Comma = ';'
    PDFOptions.PageOptions.MarginLeft = 1.17
    PDFOptions.PageOptions.MarginRight = 0.57
    PDFOptions.PageOptions.MarginTop = 0.78
    PDFOptions.PageOptions.MarginBottom = 0.78
    XLSOptions.PageFooter = 'Page &P of &N'
    XLSOptions.SheetTitle = 'Sheet 1'
    XLSOptions.CaptionFormat.Font.Style = [xfsBold]
    XLSOptions.HyperlinkFormat.Font.Color = clrBlue
    XLSOptions.HyperlinkFormat.Font.Underline = fulSingle
    XLSOptions.NoteFormat.Alignment.Horizontal = halLeft
    XLSOptions.NoteFormat.Alignment.Vertical = valTop
    XLSOptions.NoteFormat.Font.Size = 8
    XLSOptions.NoteFormat.Font.Style = [xfsBold]
    XLSOptions.NoteFormat.Font.Name = 'Tahoma'
    XLSOptions.FieldFormats = <>
    XLSOptions.StripStyles = <>
    XLSOptions.Hyperlinks = <>
    XLSOptions.Notes = <>
    XLSOptions.Charts = <>
    XLSOptions.Pictures = <>
    XLSOptions.Images = <>
    XLSOptions.Cells = <>
    XLSOptions.MergedCells = <>
    Left = 503
    Top = 213
  end
  object QExport3Dialog2: TQExport3Dialog
    ShowPrintAfter = False
    DataSet = cdsRentab
    AllowedExports = [aeCSV]
    CommonOptions = [coFields, coFormats, coColons, coCaptions]
    OptionsFileName = 'CFG_Rentabilidade_Sintetica'
    SaveLoadButtons = True
    FileName = 'C:\PLANUS\TEMP\Rentabilidade_Sintetica.csv'
    Header.Strings = (
      'FUNCEF - CONTABILIDADE - RENTABILIDADE CONTÁBIL')
    Footer.Strings = (
      'PLANUS - CONTABILIDADE')
    ExportEmpty = False
    RTFOptions.CaptionStyle.Font.Charset = DEFAULT_CHARSET
    RTFOptions.CaptionStyle.Font.Color = clBlack
    RTFOptions.CaptionStyle.Font.Height = -13
    RTFOptions.CaptionStyle.Font.Name = 'Arial'
    RTFOptions.CaptionStyle.Font.Style = [fsBold]
    RTFOptions.CaptionStyle.Alignment = talCenter
    RTFOptions.DataStyle.Font.Charset = DEFAULT_CHARSET
    RTFOptions.DataStyle.Font.Color = clBlack
    RTFOptions.DataStyle.Font.Height = -13
    RTFOptions.DataStyle.Font.Name = 'Arial'
    RTFOptions.DataStyle.Font.Style = []
    RTFOptions.FooterStyle.Font.Charset = DEFAULT_CHARSET
    RTFOptions.FooterStyle.Font.Color = clBlack
    RTFOptions.FooterStyle.Font.Height = -13
    RTFOptions.FooterStyle.Font.Name = 'Arial'
    RTFOptions.FooterStyle.Font.Style = []
    RTFOptions.HeaderStyle.Font.Charset = DEFAULT_CHARSET
    RTFOptions.HeaderStyle.Font.Color = clBlack
    RTFOptions.HeaderStyle.Font.Height = -13
    RTFOptions.HeaderStyle.Font.Name = 'Arial'
    RTFOptions.HeaderStyle.Font.Style = []
    RTFOptions.StripStyles = <>
    HTMLPageOptions.TextFont.Charset = DEFAULT_CHARSET
    HTMLPageOptions.TextFont.Color = clWhite
    HTMLPageOptions.TextFont.Height = -11
    HTMLPageOptions.TextFont.Name = 'Arial'
    HTMLPageOptions.TextFont.Style = []
    CSVOptions.Comma = ';'
    PDFOptions.PageOptions.MarginLeft = 1.17
    PDFOptions.PageOptions.MarginRight = 0.57
    PDFOptions.PageOptions.MarginTop = 0.78
    PDFOptions.PageOptions.MarginBottom = 0.78
    XLSOptions.PageFooter = 'Page &P of &N'
    XLSOptions.SheetTitle = 'Sheet 1'
    XLSOptions.CaptionFormat.Font.Style = [xfsBold]
    XLSOptions.HyperlinkFormat.Font.Color = clrBlue
    XLSOptions.HyperlinkFormat.Font.Underline = fulSingle
    XLSOptions.NoteFormat.Alignment.Horizontal = halLeft
    XLSOptions.NoteFormat.Alignment.Vertical = valTop
    XLSOptions.NoteFormat.Font.Size = 8
    XLSOptions.NoteFormat.Font.Style = [xfsBold]
    XLSOptions.NoteFormat.Font.Name = 'Tahoma'
    XLSOptions.FieldFormats = <>
    XLSOptions.StripStyles = <>
    XLSOptions.Hyperlinks = <>
    XLSOptions.Notes = <>
    XLSOptions.Charts = <>
    XLSOptions.Pictures = <>
    XLSOptions.Images = <>
    XLSOptions.Cells = <>
    XLSOptions.MergedCells = <>
    Left = 509
    Top = 273
  end
end
