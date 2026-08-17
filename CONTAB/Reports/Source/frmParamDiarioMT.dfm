inherited frmRParamDiarioMT: TfrmRParamDiarioMT
  Left = 209
  Top = 37
  Caption = 'frmRParamDiarioMT'
  ClientHeight = 505
  ClientWidth = 449
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 449
    Height = 466
    object PageControl1: TPageControl
      Left = 24
      Top = 291
      Width = 401
      Height = 168
      ActivePage = TabSheet1
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = 'Configuração'
        object rdgLancamentos: TRadioGroup
          Left = 16
          Top = 4
          Width = 145
          Height = 93
          Caption = 'Processar lançamentos'
          ItemIndex = 1
          Items.Strings = (
            'Todos'
            'Integrados'
            'NÃO Integrados ')
          TabOrder = 0
        end
        object GroupBox1: TGroupBox
          Left = 176
          Top = 4
          Width = 201
          Height = 93
          Caption = 'Configuração'
          TabOrder = 1
          object Label13: TLabel
            Left = 16
            Top = 68
            Width = 61
            Height = 13
            Caption = 'Pág.Inicial'
          end
          object chkCorresp: TCheckBox
            Left = 12
            Top = 30
            Width = 173
            Height = 17
            Caption = 'Imprimir C.Correspondente'
            TabOrder = 1
          end
          object chkQuebra: TCheckBox
            Left = 12
            Top = 46
            Width = 184
            Height = 17
            Caption = 'Quebra página a cada dia'
            TabOrder = 2
          end
          object chkMascara: TCheckBox
            Left = 12
            Top = 14
            Width = 184
            Height = 17
            Caption = 'Imprimir com máscara'
            Checked = True
            State = cbChecked
            TabOrder = 0
          end
          object spnPagIni: TSpinEdit
            Left = 88
            Top = 64
            Width = 61
            Height = 22
            MaxValue = 50000
            MinValue = 1
            TabOrder = 3
            Value = 1
          end
        end
        object cbConsolidado: TCheckBox
          Left = 17
          Top = 102
          Width = 184
          Height = 17
          Caption = 'Imprimir o diário consolidado'
          TabOrder = 2
        end
        object cbPlanilZerada: TCheckBox
          Left = 201
          Top = 102
          Width = 184
          Height = 17
          Caption = 'Imprime Planilhas Zeradas'
          TabOrder = 3
        end
        object chkAtivProjSint: TCheckBox
          Left = 17
          Top = 120
          Width = 346
          Height = 17
          Caption = 'Imprime a Atividade/Projeto Sintética'
          TabOrder = 4
        end
      end
      object TabSheet3: TTabSheet
        Caption = 'Ordenação'
        object rdgOrdenacao: TRadioGroup
          Left = 16
          Top = 32
          Width = 361
          Height = 65
          ItemIndex = 0
          Items.Strings = (
            'Ordenado por Data + Planilha'
            'Ordenado por Data + Número do Documento')
          TabOrder = 0
        end
        object chkNumDoc: TCheckBox
          Left = 16
          Top = 8
          Width = 361
          Height = 17
          Caption = 'Imprimir o Número do Documento em vez da Sub-Conta?'
          TabOrder = 1
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Títulos e Sub-Títulos'
        object Label11: TLabel
          Left = 16
          Top = 8
          Width = 35
          Height = 13
          Caption = 'Título'
        end
        object Label12: TLabel
          Left = 16
          Top = 56
          Width = 61
          Height = 13
          Caption = 'Sub-Título'
        end
        object edtTitulo: TEdit
          Left = 16
          Top = 24
          Width = 361
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object edtSubTitulo: TEdit
          Left = 16
          Top = 72
          Width = 361
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
      end
      object tbsPlanoPatro: TTabSheet
        Caption = 'Plano e Patrocinadora'
        object pnlPlanPrev: TPanel
          Left = 11
          Top = 11
          Width = 370
          Height = 102
          BevelInner = bvRaised
          BevelOuter = bvLowered
          TabOrder = 0
          object Label15: TLabel
            Left = 16
            Top = 8
            Width = 118
            Height = 13
            Caption = 'Plano Previdenciário'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label16: TLabel
            Left = 16
            Top = 51
            Width = 80
            Height = 13
            Caption = 'Patrocinadora'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object dblcPlanoPrev: TwwDBLookupCombo
            Left = 16
            Top = 24
            Width = 345
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'50'#9'Nome')
            LookupField = 'IDPLANOPREV'
            Options = [loColLines]
            Style = csDropDownList
            DropDownWidth = 8
            ParentFont = False
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
          object dblcPatro: TwwDBLookupCombo
            Left = 16
            Top = 67
            Width = 345
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'60'#9'Nome')
            LookupField = 'IDPESSOA'
            Options = [loColLines]
            Style = csDropDownList
            DropDownWidth = 8
            ParentFont = False
            TabOrder = 1
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
        end
      end
    end
    object Panel1: TPanel
      Left = 24
      Top = 71
      Width = 401
      Height = 218
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 1
      object lblGrupo: TLabel
        Left = 16
        Top = 8
        Width = 72
        Height = 13
        Caption = 'Conta Inicial'
      end
      object Label1: TLabel
        Left = 208
        Top = 8
        Width = 65
        Height = 13
        Caption = 'Conta Final'
      end
      object Label5: TLabel
        Left = 16
        Top = 48
        Width = 130
        Height = 13
        Caption = 'Centro de Custo Inicial'
      end
      object Label7: TLabel
        Left = 208
        Top = 88
        Width = 100
        Height = 13
        Caption = 'Atividade/Projeto'
      end
      object Label6: TLabel
        Left = 16
        Top = 88
        Width = 60
        Height = 13
        Caption = 'Sub-Conta'
      end
      object Label2: TLabel
        Left = 16
        Top = 128
        Width = 106
        Height = 13
        Caption = 'Sistema de Origem'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 16
        Top = 168
        Width = 103
        Height = 13
        Caption = 'Tipo de Operação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label9: TLabel
        Left = 208
        Top = 128
        Width = 121
        Height = 13
        Caption = 'Cód.Histórico Padrão'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label10: TLabel
        Left = 208
        Top = 48
        Width = 123
        Height = 13
        Caption = 'Centro de Custo Final'
      end
      object Label14: TLabel
        Left = 228
        Top = 195
        Width = 162
        Height = 13
        Caption = 'MENOS o Tipo de Operação'
      end
      object mskContaIni: TMaskEdit
        Left = 16
        Top = 24
        Width = 153
        Height = 21
        TabOrder = 0
      end
      object btnContaIni: TBitBtn
        Left = 168
        Top = 24
        Width = 25
        Height = 21
        TabOrder = 1
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
          777777777777F88F7777777777700F077777777777F8878F77777777700FFF07
          77777777F8877787F77777700FFFFFF077777778877777F8F7777778FFFFFCF0
          77777F78F77FF8787F771778FFCCCFFF07778FF87F88877F8F7711778FFFFFCF
          077788FF8F77FF8787F711178FFCCCFFF077888F8FF88877F87F71110000FFFC
          FF07788888887FF877877710E7E706CFFFF077887777888777F8770E7E7E70FF
          F887778F777778F7F8877707E7E7E0F88777778F777778F88777770E7E7E7087
          7777778F7777788777777707E7E7E07777777787F7777877777777707E7E0777
          777777787FFF8777777777770000777777777777888877777777}
        NumGlyphs = 2
      end
      object mskContaFim: TMaskEdit
        Left = 208
        Top = 24
        Width = 153
        Height = 21
        TabOrder = 2
      end
      object btnContaFim: TBitBtn
        Left = 360
        Top = 24
        Width = 25
        Height = 21
        TabOrder = 3
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
          777777777777F88F7777777777700F077777777777F8878F77777777700FFF07
          77777777F8877787F77777700FFFFFF077777778877777F8F7777778FFFFFCF0
          77777F78F77FF8787F771778FFCCCFFF07778FF87F88877F8F7711778FFFFFCF
          077788FF8F77FF8787F711178FFCCCFFF077888F8FF88877F87F71110000FFFC
          FF07788888887FF877877710E7E706CFFFF077887777888777F8770E7E7E70FF
          F887778F777778F7F8877707E7E7E0F88777778F777778F88777770E7E7E7087
          7777778F7777788777777707E7E7E07777777787F7777877777777707E7E0777
          777777787FFF8777777777770000777777777777888877777777}
        NumGlyphs = 2
      end
      object mskCCustoIni: TMaskEdit
        Left = 16
        Top = 64
        Width = 153
        Height = 21
        TabOrder = 4
      end
      object mskAtivProj: TMaskEdit
        Left = 208
        Top = 104
        Width = 153
        Height = 21
        TabOrder = 10
      end
      object btnAtivProj: TBitBtn
        Left = 360
        Top = 104
        Width = 25
        Height = 21
        TabOrder = 11
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
          777777777777F88F7777777777700F077777777777F8878F77777777700FFF07
          77777777F8877787F77777700FFFFFF077777778877777F8F7777778FFFFFCF0
          77777F78F77FF8787F771778FFCCCFFF07778FF87F88877F8F7711778FFFFFCF
          077788FF8F77FF8787F711178FFCCCFFF077888F8FF88877F87F71110000FFFC
          FF07788888887FF877877710E7E706CFFFF077887777888777F8770E7E7E70FF
          F887778F777778F7F8877707E7E7E0F88777778F777778F88777770E7E7E7087
          7777778F7777788777777707E7E7E07777777787F7777877777777707E7E0777
          777777787FFF8777777777770000777777777777888877777777}
        NumGlyphs = 2
      end
      object btnCCustoIni: TBitBtn
        Left = 168
        Top = 64
        Width = 25
        Height = 21
        TabOrder = 5
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
          777777777777F88F7777777777700F077777777777F8878F77777777700FFF07
          77777777F8877787F77777700FFFFFF077777778877777F8F7777778FFFFFCF0
          77777F78F77FF8787F771778FFCCCFFF07778FF87F88877F8F7711778FFFFFCF
          077788FF8F77FF8787F711178FFCCCFFF077888F8FF88877F87F71110000FFFC
          FF07788888887FF877877710E7E706CFFFF077887777888777F8770E7E7E70FF
          F887778F777778F7F8877707E7E7E0F88777778F777778F88777770E7E7E7087
          7777778F7777788777777707E7E7E07777777787F7777877777777707E7E0777
          777777787FFF8777777777770000777777777777888877777777}
        NumGlyphs = 2
      end
      object mskSubConta: TMaskEdit
        Left = 16
        Top = 104
        Width = 153
        Height = 21
        TabOrder = 8
      end
      object btnSubConta: TBitBtn
        Left = 168
        Top = 104
        Width = 25
        Height = 21
        TabOrder = 9
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
          777777777777F88F7777777777700F077777777777F8878F77777777700FFF07
          77777777F8877787F77777700FFFFFF077777778877777F8F7777778FFFFFCF0
          77777F78F77FF8787F771778FFCCCFFF07778FF87F88877F8F7711778FFFFFCF
          077788FF8F77FF8787F711178FFCCCFFF077888F8FF88877F87F71110000FFFC
          FF07788888887FF877877710E7E706CFFFF077887777888777F8770E7E7E70FF
          F887778F777778F7F8877707E7E7E0F88777778F777778F88777770E7E7E7087
          7777778F7777788777777707E7E7E07777777787F7777877777777707E7E0777
          777777787FFF8777777777770000777777777777888877777777}
        NumGlyphs = 2
      end
      object dblkModulo: TwwDBLookupCombo
        Left = 16
        Top = 144
        Width = 177
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMEMODULO'#9'50'#9'Sistema de Origem')
        LookupField = 'IDMODULO'
        Style = csDropDownList
        DropDownWidth = 8
        ParentFont = False
        TabOrder = 12
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
      end
      object dblkTipoOper: TwwDBLookupCombo
        Left = 16
        Top = 184
        Width = 177
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'TIPDESCRICAO'#9'25'#9'Operação')
        LookupField = 'TIPCODIGO'
        Style = csDropDownList
        DropDownWidth = 8
        ParentFont = False
        TabOrder = 14
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
      end
      object dblkHist: TwwDBLookupCombo
        Left = 208
        Top = 144
        Width = 177
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'HITCODHIST'#9'4'#9'Cód.'
          'HITDESCR1'#9'200'#9'Descrição')
        LookupField = 'HITCODHIST'
        Options = [loColLines]
        Style = csDropDownList
        DropDownWidth = 360
        ParentFont = False
        TabOrder = 13
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
      end
      object mskCCustoFim: TMaskEdit
        Left = 208
        Top = 64
        Width = 153
        Height = 21
        TabOrder = 6
      end
      object btnCCustoFim: TBitBtn
        Left = 360
        Top = 64
        Width = 25
        Height = 21
        TabOrder = 7
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
          777777777777F88F7777777777700F077777777777F8878F77777777700FFF07
          77777777F8877787F77777700FFFFFF077777778877777F8F7777778FFFFFCF0
          77777F78F77FF8787F771778FFCCCFFF07778FF87F88877F8F7711778FFFFFCF
          077788FF8F77FF8787F711178FFCCCFFF077888F8FF88877F87F71110000FFFC
          FF07788888887FF877877710E7E706CFFFF077887777888777F8770E7E7E70FF
          F887778F777778F7F8877707E7E7E0F88777778F777778F88777770E7E7E7087
          7777778F7777788777777707E7E7E07777777787F7777877777777707E7E0777
          777777787FFF8777777777770000777777777777888877777777}
        NumGlyphs = 2
      end
      object chkTipoOper: TCheckBox
        Left = 208
        Top = 177
        Width = 181
        Height = 17
        Caption = 'Filtrar todos os Lançamentos'
        TabOrder = 15
      end
    end
    object grpDatas: TGroupBox
      Left = 24
      Top = 8
      Width = 401
      Height = 65
      TabOrder = 2
      object lblDataIni: TLabel
        Left = 288
        Top = 16
        Width = 59
        Height = 13
        Caption = 'Data Final'
      end
      object Label3: TLabel
        Left = 16
        Top = 16
        Width = 55
        Height = 13
        Caption = 'Exercício'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 176
        Top = 16
        Width = 66
        Height = 13
        Caption = 'Data Inicial'
      end
      object dteDataFim: TCMDateTimePicker
        Left = 288
        Top = 32
        Width = 97
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
      object dblkExercicio: TwwDBLookupCombo
        Left = 16
        Top = 32
        Width = 121
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'PEREXERCICIO'#9'10'#9'Exercício')
        DataField = 'PEREXERCI'
        LookupField = 'PEREXERCICIO'
        Style = csDropDownList
        ParentFont = False
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
      end
      object dteDataIni: TCMDateTimePicker
        Left = 176
        Top = 32
        Width = 97
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
  inherited Dock971: TDock97
    Top = 466
    Width = 449
    inherited tb97Fundo: TToolbar97
      Left = 279
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 112
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 56
    Top = 464
  end
  inherited Cmp_Padrao: TCmParamReport
    Left = 16
    Top = 464
  end
end
