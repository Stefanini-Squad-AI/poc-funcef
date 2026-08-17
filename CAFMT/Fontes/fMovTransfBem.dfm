inherited frmMovTransfBem: TfrmMovTransfBem
  Left = 9
  Top = 102
  HelpContext = 70030
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Transferência de Bens entre Locais / Conjuntos / Grupos'
  ClientHeight = 430
  ClientWidth = 770
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 770
    Height = 396
    object PnlDetalhe: TPanel
      Left = 5
      Top = 208
      Width = 760
      Height = 184
      BevelOuter = bvLowered
      Enabled = False
      TabOrder = 1
      object Label4: TLabel
        Left = 392
        Top = 6
        Width = 69
        Height = 13
        Caption = 'Novo Grupo'
      end
      object Label3: TLabel
        Left = 20
        Top = 6
        Width = 85
        Height = 13
        Caption = 'Novo Conjunto'
      end
      object pnlTree: TPanel
        Left = 19
        Top = 48
        Width = 722
        Height = 124
        BevelInner = bvLowered
        BevelOuter = bvLowered
        Caption = 'pnlTree'
        TabOrder = 0
        object treeGrupos: TCMTreeView
          Left = 2
          Top = 2
          Width = 718
          Height = 120
          PodeNavegar = True
          DataSource = dsGrupos
          CampoChave = qryGruposCLASSE
          CampoDescricao = qryGruposNOME
          CampoTipo = qryGruposTIPO
          OnDblClick = treeGruposDblClick
          OnExit = treeGruposExit
          Align = alClient
          Visible = False
        end
      end
      object spdSelConjunto: TBitBtn
        Left = 357
        Top = 22
        Width = 21
        Height = 21
        TabOrder = 2
        OnClick = spdSelConjuntoClick
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
      object dbeConjuntoNovo: TwwDBEdit
        Left = 21
        Top = 22
        Width = 336
        Height = 21
        DataField = 'DESCCONJUNTO'
        DataSource = dsSelConjunto
        TabOrder = 3
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object edGrupoNovo: TMaskEdit
        Left = 393
        Top = 21
        Width = 327
        Height = 21
        TabOrder = 4
      end
      object sbtnGrupo: TBitBtn
        Left = 720
        Top = 21
        Width = 21
        Height = 21
        TabOrder = 5
        OnClick = sbtnGrupoClick
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
      object pnlTransfConj: TPanel
        Left = 4
        Top = 44
        Width = 749
        Height = 129
        BevelOuter = bvNone
        TabOrder = 1
        object Label5: TLabel
          Left = 16
          Top = 4
          Width = 69
          Height = 13
          Caption = 'Localização'
        end
        object Label6: TLabel
          Left = 389
          Top = 4
          Width = 74
          Height = 13
          Caption = 'Responsável'
        end
        object Label12: TLabel
          Left = 16
          Top = 44
          Width = 98
          Height = 13
          Caption = 'Rateio de Custos'
        end
        object dbgRateioN: TwwDBGrid
          Left = 16
          Top = 62
          Width = 721
          Height = 66
          Selected.Strings = (
            'CODCENTROCUSTO'#9'12'#9'Centro de Custo'
            'DESCCCUSTO'#9'51'#9'Descrição'
            'PARTICIPACAO'#9'12'#9'Participação (%)')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          DataSource = dsRateioN
          ReadOnly = True
          TabOrder = 0
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          IndicatorColor = icBlack
        end
        object dbeLocalNovo: TwwDBEdit
          Left = 16
          Top = 20
          Width = 338
          Height = 21
          DataField = 'DESCLOCALIZACAO'
          DataSource = dsLocal
          TabOrder = 1
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbeRespNovo: TwwDBEdit
          Left = 389
          Top = 20
          Width = 328
          Height = 21
          DataField = 'DESCRESPONSAVEL'
          DataSource = dsResp
          TabOrder = 2
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object bbtnSelLocal: TBitBtn
          Left = 354
          Top = 20
          Width = 21
          Height = 21
          TabOrder = 3
          OnClick = bbtnSelLocalClick
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
        object bbtnSelResp: TBitBtn
          Left = 717
          Top = 20
          Width = 21
          Height = 21
          TabOrder = 4
          OnClick = bbtnSelRespClick
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
      end
    end
    object pgctlTransf: TPageControl
      Left = 5
      Top = 5
      Width = 760
      Height = 205
      ActivePage = TabBem
      Align = alTop
      TabOrder = 0
      OnChanging = pgctlTransfChanging
      object TabSelBem: TTabSheet
        Caption = 'Seleção de Bens'
        object pnlSelBens: TPanel
          Left = 0
          Top = 0
          Width = 752
          Height = 177
          Align = alClient
          BevelOuter = bvLowered
          TabOrder = 0
          object Label8: TLabel
            Left = 149
            Top = 8
            Width = 136
            Height = 13
            Caption = 'Termo de Transferência'
          end
          object Label9: TLabel
            Left = 11
            Top = 8
            Width = 128
            Height = 13
            Caption = 'Data da Transferência'
          end
          object Label10: TLabel
            Left = 472
            Top = 8
            Width = 141
            Height = 13
            Caption = 'Responsável pelo Termo'
          end
          object Processo: TLabel
            Left = 296
            Top = 8
            Width = 53
            Height = 13
            Caption = 'Processo'
          end
          object Label11: TLabel
            Left = 11
            Top = 56
            Width = 109
            Height = 13
            Caption = 'Bens Selecionados'
          end
          object bbtnTermoTransf: TBitBtn
            Left = 264
            Top = 24
            Width = 21
            Height = 21
            TabOrder = 0
            OnClick = bbtnTermoTransfClick
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
          object edDataSel: TCMDateTimePicker
            Left = 11
            Top = 24
            Width = 128
            Height = 21
            Hint = 'Data Programada para Pagamento'
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
            ParentShowHint = False
            ShowHint = True
            ShowButton = True
            TabOrder = 1
            OnExit = edDataSelExit
          end
          object dbeSbxProcesso: TwwDBEdit
            Left = 296
            Top = 24
            Width = 169
            Height = 21
            DataField = 'SBXPROCESSO'
            DataSource = dsSelTermo
            TabOrder = 2
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbeRespConj: TwwDBEdit
            Left = 472
            Top = 24
            Width = 268
            Height = 21
            DataField = 'SBXNOMERESP'
            DataSource = dsSelTermo
            TabOrder = 3
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbeTermo: TwwDBEdit
            Left = 149
            Top = 24
            Width = 115
            Height = 21
            DataField = 'SBXTERMO'
            DataSource = dsSelTermo
            TabOrder = 4
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbgBalPatBem: TwwDBGrid
            Left = 1
            Top = 72
            Width = 750
            Height = 286
            Selected.Strings = (
              'PLACA'#9'12'#9'Placa'
              'DESBEM'#9'80'#9'Descrição do Bem'
              'DESCCONJATUAL'#9'80'#9'Conjunto Atual'
              'NOMELOCAATUAL'#9'60'#9'Localização Atual'
              'NOMERESPATUAL'#9'60'#9'Responsável Atual'
              'DESCGRUPATUAL'#9'60'#9'Grupo Contábil Atual'
              'DESCCONJNOVO'#9'80'#9'Novo Conjunto'
              'NOMELOCANOVO'#9'60'#9'Nova Localização'
              'NOMERESPNOVO'#9'60'#9'Novo Responsável'
              'DESCGRUPNOVO'#9'60'#9'Novo Grupo Contábil')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 1
            ShowHorzScrollBar = True
            DataSource = dsBensSelec
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            ParentFont = False
            ReadOnly = True
            TabOrder = 5
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
      object TabBem: TTabSheet
        Caption = 'Bem'
        object pnlMestre: TPanel
          Left = 0
          Top = 0
          Width = 752
          Height = 177
          Align = alClient
          BevelOuter = bvLowered
          TabOrder = 0
          object Data: TLabel
            Left = 16
            Top = 8
            Width = 128
            Height = 13
            Caption = 'Data da Transferência'
          end
          object Label22: TLabel
            Left = 368
            Top = 8
            Width = 104
            Height = 13
            Caption = 'Descrição do Bem'
          end
          object Label26: TLabel
            Left = 168
            Top = 8
            Width = 127
            Height = 13
            Caption = 'Placa de Tombamento'
          end
          object Label1: TLabel
            Left = 16
            Top = 48
            Width = 51
            Height = 13
            Caption = 'Conjunto'
          end
          object Label7: TLabel
            Left = 16
            Top = 88
            Width = 69
            Height = 13
            Caption = 'Localização'
          end
          object Label17: TLabel
            Left = 368
            Top = 88
            Width = 74
            Height = 13
            Caption = 'Responsável'
          end
          object Label2: TLabel
            Left = 16
            Top = 128
            Width = 35
            Height = 13
            Caption = 'Grupo'
          end
          object dbeDesBem: TDBMemo
            Left = 368
            Top = 24
            Width = 369
            Height = 62
            DataField = 'DESBEM'
            DataSource = dsSelBem
            TabOrder = 6
          end
          object edData: TCMDateTimePicker
            Left = 16
            Top = 24
            Width = 133
            Height = 21
            Hint = 'Data Programada para Pagamento'
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
            ParentShowHint = False
            ShowHint = True
            ShowButton = True
            TabOrder = 0
            OnExit = edDataExit
          end
          object spdPesquisa: TBitBtn
            Left = 339
            Top = 24
            Width = 21
            Height = 21
            TabOrder = 2
            OnClick = spdPesquisaClick
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
          object edPlaca: TEdit
            Left = 168
            Top = 24
            Width = 171
            Height = 21
            TabOrder = 1
            OnEnter = edPlacaEnter
            OnExit = edPlacaExit
          end
          object dbeConjunto: TwwDBEdit
            Left = 16
            Top = 64
            Width = 345
            Height = 21
            DataField = 'DESCCONJUNTO'
            DataSource = dsSelBem
            TabOrder = 3
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbeDescLocalizacao: TwwDBEdit
            Left = 16
            Top = 104
            Width = 345
            Height = 21
            DataField = 'DESCLOCALIZACAO'
            DataSource = dsSelBem
            TabOrder = 4
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbeNomeResp: TwwDBEdit
            Left = 368
            Top = 104
            Width = 369
            Height = 21
            DataField = 'NOMERESPONSAVEL'
            DataSource = dsSelBem
            TabOrder = 5
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbeDescGrupo: TwwDBEdit
            Left = 16
            Top = 144
            Width = 721
            Height = 21
            DataField = 'DESCGRUPO'
            DataSource = dsSelBem
            TabOrder = 7
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 396
    Width = 770
    Height = 34
    inherited tb97Fundo: TToolbar97
      Left = 566
      DockPos = 566
      inherited sep1: TToolbarSep97
        Left = 90
      end
      inherited sep3: TToolbarSep97
        Left = 183
      end
      inherited bbtnSair: TBitBtn
        Width = 90
        Height = 28
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 93
        Width = 90
        Height = 28
        HelpContext = 70030
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 379
      DockPos = 379
      inherited ToolbarSep971: TToolbarSep97
        Left = 90
      end
      inherited bbtnConfirmar: TBitBtn
        Width = 90
        Height = 28
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Left = 93
        Width = 90
        Height = 28
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Top = 459
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qryPlaca: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDBEM'
      'FROM BEM'
      'WHERE (PLACA = :PPLACA)')
    ValidateWithMask = True
    Left = 672
    Top = 104
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PPLACA'
        ParamType = ptUnknown
      end>
    object qryPlacaIDBEM: TFloatField
      FieldName = 'IDBEM'
      Origin = '"CM.BEM".IDBEM'
    end
  end
  object qrySelBem: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT BEM.IDPESSOA, BEM.IDBEM, BEM.IDCONJUNTO,'
      
        '       BEM.PLACA, CONJUNTO.DESCCONJUNTO, CONJUNTO.IDLOCALIZACAO,' +
        ' CONJUNTO.IDRESPONSAVEL,'
      '       BEM.DESBEM, LOCALIZACAO.NOME AS DESCLOCALIZACAO,'
      '       PESSOA.NOME AS NOMERESPONSAVEL,'
      '       BEM.IDCLASSEBEM, BEM.IDGRUPO, GRUPO.NOME AS DESCGRUPO'
      'FROM BEM, CONJUNTO, LOCALIZACAO, PESSOA, GRUPO'
      'WHERE (BEM.IDPESSOA = :PIDPESSOA)'
      '  AND (BEM.IDBEM    = :PIDBEM)'
      '  AND ((BEM.BAIXATOTAL <> '#39'S'#39') OR (BEM.BAIXATOTAL IS NULL))'
      '  AND (BEM.IDCONJUNTO         = CONJUNTO.IDCONJUNTO)'
      '  AND (CONJUNTO.IDLOCALIZACAO = LOCALIZACAO.IDLOCALIZACAO(+))'
      '  AND (CONJUNTO.IDRESPONSAVEL = PESSOA.IDPESSOA(+))'
      '  AND (BEM.IDGRUPO            = GRUPO.IDGRUPO(+))'
      '')
    ValidateWithMask = True
    Left = 560
    Top = 104
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end>
    object qrySelBemIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qrySelBemIDBEM: TFloatField
      FieldName = 'IDBEM'
    end
    object qrySelBemIDCONJUNTO: TFloatField
      FieldName = 'IDCONJUNTO'
    end
    object qrySelBemPLACA: TFloatField
      FieldName = 'PLACA'
    end
    object qrySelBemDESCCONJUNTO: TStringField
      FieldName = 'DESCCONJUNTO'
      Size = 200
    end
    object qrySelBemDESBEM: TStringField
      FieldName = 'DESBEM'
      Size = 200
    end
    object qrySelBemDESCLOCALIZACAO: TStringField
      FieldName = 'DESCLOCALIZACAO'
      Size = 60
    end
    object qrySelBemNOMERESPONSAVEL: TStringField
      FieldName = 'NOMERESPONSAVEL'
      Size = 60
    end
    object qrySelBemIDCLASSEBEM: TFloatField
      FieldName = 'IDCLASSEBEM'
    end
    object qrySelBemIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
    end
    object qrySelBemDESCGRUPO: TStringField
      FieldName = 'DESCGRUPO'
      Size = 60
    end
    object qrySelBemIDLOCALIZACAO: TFloatField
      FieldName = 'IDLOCALIZACAO'
    end
    object qrySelBemIDRESPONSAVEL: TFloatField
      FieldName = 'IDRESPONSAVEL'
    end
  end
  object qrySelConjunto: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT C.DESCCONJUNTO, C.IDCONJUNTO, C.IDLOCALIZACAO, C.IDRESPON' +
        'SAVEL,'
      
        '       L.NOME AS DESCLOCALIZACAO, P.NOME AS DESCRESPONSAVEL, C.I' +
        'DPESSOA'
      'FROM CONJUNTO C, LOCALIZACAO L, PESSOA P'
      'WHERE (C.IDCONJUNTO    = :PIDCONJUNTO)'
      '  AND (C.IDLOCALIZACAO = L.IDLOCALIZACAO(+))'
      '  AND (C.IDRESPONSAVEL = P.IDPESSOA(+))'
      'ORDER BY C.DESCCONJUNTO'
      '')
    ValidateWithMask = True
    Left = 455
    Top = 172
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONJUNTO'
        ParamType = ptUnknown
      end>
    object qrySelConjuntoDESCCONJUNTO: TStringField
      FieldName = 'DESCCONJUNTO'
      Size = 200
    end
    object qrySelConjuntoIDCONJUNTO: TFloatField
      FieldName = 'IDCONJUNTO'
    end
    object qrySelConjuntoIDLOCALIZACAO: TFloatField
      FieldName = 'IDLOCALIZACAO'
    end
    object qrySelConjuntoIDRESPONSAVEL: TFloatField
      FieldName = 'IDRESPONSAVEL'
    end
    object qrySelConjuntoDESCLOCALIZACAO: TStringField
      FieldName = 'DESCLOCALIZACAO'
      Size = 60
    end
    object qrySelConjuntoDESCRESPONSAVEL: TStringField
      FieldName = 'DESCRESPONSAVEL'
      Size = 60
    end
    object qrySelConjuntoIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
  end
  object MSConjunto: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Conjunto de Bens'
    Colunas.Strings = (
      'CONJUNTO.DESCCONJUNTO'
      'LOCALIZACAO.NOME'
      'PESSOA.NOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Descrição do Conjunto'
      'Descrição da Localização'
      'Nome do Responsável')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'CONJUNTO'
      'LOCALIZACAO'
      'PESSOA')
    CamposChave.Strings = (
      'CONJUNTO.IDCONJUNTO')
    Filtro.Strings = (
      'CONJUNTO.IDLOCALIZACAO = LOCALIZACAO.IDLOCALIZACAO(+)'
      'CONJUNTO.IDRESPONSAVEL = PESSOA.IDPESSOA(+)')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '200'
      '45'
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 376
    Top = 159
  end
  object qryRateioN: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT RD.CODCENTROCUSTO, CC.NOME AS DESCCCUSTO, RD.PARTICIPACAO'
      'FROM RATEIODEPRECIACAO RD,'
      '     CENTCUST CC'
      'WHERE (RD.IDEMPRESA  = :PIDPESSOA)'
      '  AND (RD.IDCONJUNTO = :PIDCONJUNTO)'
      '  AND (RD.CODCENTROCUSTO = CC.CODCENTROCUSTO)'
      '  AND (RD.IDEMPRESA      = CC.IDEMPRESA)'
      '')
    ValidateWithMask = True
    Left = 523
    Top = 172
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDCONJUNTO'
        ParamType = ptUnknown
      end>
    object qryRateioNCODCENTROCUSTO: TStringField
      DisplayLabel = 'Centro de Custo'
      DisplayWidth = 14
      FieldName = 'CODCENTROCUSTO'
      Size = 10
    end
    object qryRateioNDESCCCUSTO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 60
      FieldName = 'DESCCCUSTO'
      Size = 30
    end
    object qryRateioNPARTICIPACAO: TFloatField
      DisplayLabel = 'Participação (%)'
      DisplayWidth = 12
      FieldName = 'PARTICIPACAO'
    end
  end
  object dsRateioN: TwwDataSource
    AutoEdit = False
    DataSet = qryRateioN
    Left = 523
    Top = 159
  end
  object MSTermo: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Termo de Transferência'
    Colunas.Strings = (
      'SELBAIXA.SBXTERMO'
      'SELBAIXA.SBXPROCESSO'
      'SELBAIXA.SBXDATA'
      'PESSOA.NOME')
    TipodeDado.Strings = (
      'N'
      'C'
      'D'
      'C')
    Descricao.Strings = (
      'Termo de Transferência'
      'Processo'
      'Data da Seleção'
      'Responsável')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'SELBAIXA'
      'PESSOA')
    CamposChave.Strings = (
      'SELBAIXA.SBXTERMO'
      'SELBAIXA.IDSELBAIXA')
    Filtro.Strings = (
      'SELBAIXA.IDRESPONSAVEL=PESSOA.IDPESSOA(+)'
      'SELBAIXA.SBTIPOMOV = 1')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '80'
      '10'
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 248
    Top = 102
  end
  object qrySelTermo: TwwQuery
    CachedUpdates = True
    DatabaseName = 'Basedados'
    SQL.Strings = (
      'SELECT SB.IDSELBAIXA,'
      '       SB.SBXTERMO,'
      '       SB.SBXPROCESSO,'
      '       SB.SBXDATA,'
      '       P.NOME AS SBXNOMERESP,'
      '       SB.SBXFLGEXECUTADO,'
      '       SB.SBXDTAEXECUTADO,'
      '       SB.SBTIPOMOV'
      'FROM SELBAIXA SB,'
      '     PESSOA P'
      'WHERE (SB.IDSELBAIXA    = :PIDSELBAIXA)'
      '  AND (SB.IDRESPONSAVEL = P.IDPESSOA(+))')
    UpdateObject = updSelTermo
    ValidateWithMask = True
    Left = 104
    Top = 128
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PIDSELBAIXA'
        ParamType = ptUnknown
      end>
    object qrySelTermoIDSELBAIXA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDSELBAIXA'
    end
    object qrySelTermoSBXTERMO: TFloatField
      DisplayWidth = 10
      FieldName = 'SBXTERMO'
    end
    object qrySelTermoSBXPROCESSO: TStringField
      DisplayWidth = 80
      FieldName = 'SBXPROCESSO'
      Size = 80
    end
    object qrySelTermoSBXDATA: TDateTimeField
      DisplayWidth = 10
      FieldName = 'SBXDATA'
    end
    object qrySelTermoSBXNOMERESP: TStringField
      DisplayWidth = 60
      FieldName = 'SBXNOMERESP'
      Size = 60
    end
    object qrySelTermoSBXFLGEXECUTADO: TFloatField
      DisplayWidth = 10
      FieldName = 'SBXFLGEXECUTADO'
    end
    object qrySelTermoSBXDTAEXECUTADO: TDateTimeField
      DisplayWidth = 10
      FieldName = 'SBXDTAEXECUTADO'
    end
    object qrySelTermoSBTIPOMOV: TFloatField
      FieldName = 'SBTIPOMOV'
    end
  end
  object dsSelTermo: TwwDataSource
    AutoEdit = False
    DataSet = qrySelTermo
    Left = 104
    Top = 115
  end
  object updSelTermo: TUpdateSQL
    ModifySQL.Strings = (
      'update SELBAIXA'
      'set'
      '  SBXFLGEXECUTADO = :SBXFLGEXECUTADO,'
      '  SBXDTAEXECUTADO = :SBXDTAEXECUTADO'
      'where'
      '  IDSELBAIXA = :OLD_IDSELBAIXA')
    InsertSQL.Strings = (
      'insert into SELBAIXA'
      '  (SBXFLGEXECUTADO, SBXDTAEXECUTADO)'
      'values'
      '  (:SBXFLGEXECUTADO, :SBXDTAEXECUTADO)')
    DeleteSQL.Strings = (
      'delete from SELBAIXA'
      'where'
      '  IDSELBAIXA = :OLD_IDSELBAIXA')
    Left = 104
    Top = 102
  end
  object dsSelConjunto: TwwDataSource
    AutoEdit = False
    DataSet = qrySelConjunto
    Left = 455
    Top = 159
  end
  object dsSelBem: TwwDataSource
    AutoEdit = False
    DataSet = qrySelBem
    Left = 616
    Top = 104
  end
  object qryBensSelec: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT B.PLACA,'
      '       B.DESBEM,'
      '       CA.DESCCONJUNTO AS DESCCONJATUAL,'
      '       LA.NOME         AS NOMELOCAATUAL,'
      '       PA.NOME         AS NOMERESPATUAL,'
      '       GA.NOME         AS DESCGRUPATUAL,'
      '       CN.DESCCONJUNTO AS DESCCONJNOVO,'
      '       LN.NOME         AS NOMELOCANOVO,'
      '       PN.NOME         AS NOMERESPNOVO,'
      '       GN.NOME         AS DESCGRUPNOVO,'
      '       SBB.IDSELBAIXA,'
      '       SBB.IDBEM,'
      '       SBB.IDPESSOA,'
      '       SBB.IDCONJUNTO,'
      '       SBB.IDGRUPO,'
      '       SBB.IDLOCALIZACAO,'
      '       SBB.IDRESPONSAVEL'
      ''
      'FROM SELBAIXABENS SBB,'
      '     BEM B,'
      '     CONJUNTO CA,'
      '     GRUPO GA,'
      '     LOCALIZACAO LA,'
      '     PESSOA PA,'
      '     CONJUNTO CN,'
      '     GRUPO GN,'
      '     LOCALIZACAO LN,'
      '     PESSOA PN'
      ''
      'WHERE (SBB.IDSELBAIXA    = :PIDSELBAIXA)'
      '  AND ((B.BAIXATOTAL = '#39'N'#39') OR (B.BAIXATOTAL IS NULL)) '
      '  AND (SBB.IDBEM         = B.IDBEM)'
      '  AND (SBB.IDPESSOA      = B.IDPESSOA)'
      '  AND (B.IDCONJUNTO      = CA.IDCONJUNTO)'
      '  AND (CA.IDLOCALIZACAO  = LA.IDLOCALIZACAO)'
      '  AND (CA.IDPESSOA       = LA.IDPESSOA)'
      '  AND (CA.IDRESPONSAVEL  = PA.IDPESSOA)'
      '  AND (B.IDGRUPO         = GA.IDGRUPO)'
      '  AND (SBB.IDCONJUNTO    = CN.IDCONJUNTO)'
      '  AND (SBB.IDLOCALIZACAO = LN.IDLOCALIZACAO)'
      '  AND (CN.IDPESSOA       = LN.IDPESSOA)'
      '  AND (CN.IDRESPONSAVEL  = PN.IDPESSOA)'
      '  AND (SBB.IDGRUPO       = GN.IDGRUPO)'
      ''
      ' ')
    ValidateWithMask = True
    Left = 176
    Top = 120
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDSELBAIXA'
        ParamType = ptUnknown
      end>
    object qryBensSelecPLACA: TFloatField
      DisplayLabel = 'Placa'
      DisplayWidth = 12
      FieldName = 'PLACA'
      Origin = '"CM.BEM".PLACA'
    end
    object qryBensSelecDESBEM: TStringField
      DisplayLabel = 'Descrição do Bem'
      DisplayWidth = 80
      FieldName = 'DESBEM'
      Origin = '"CM.BEM".DESBEM'
      Size = 200
    end
    object qryBensSelecDESCCONJATUAL: TStringField
      DisplayLabel = 'Conjunto Atual'
      DisplayWidth = 80
      FieldName = 'DESCCONJATUAL'
      Origin = '"CM.CONJUNTO".DESCCONJUNTO'
      Size = 200
    end
    object qryBensSelecNOMELOCAATUAL: TStringField
      DisplayLabel = 'Localização Atual'
      DisplayWidth = 60
      FieldName = 'NOMELOCAATUAL'
      Origin = '"CM.LOCALIZACAO".NOME'
      Size = 60
    end
    object qryBensSelecNOMERESPATUAL: TStringField
      DisplayLabel = 'Responsável Atual'
      DisplayWidth = 60
      FieldName = 'NOMERESPATUAL'
      Origin = 'PESSOA.NOME'
      Size = 60
    end
    object qryBensSelecDESCGRUPATUAL: TStringField
      DisplayLabel = 'Grupo Contábil Atual'
      DisplayWidth = 60
      FieldName = 'DESCGRUPATUAL'
      Origin = 'GRUPO.NOME'
      Size = 60
    end
    object qryBensSelecDESCCONJNOVO: TStringField
      DisplayLabel = 'Novo Conjunto'
      DisplayWidth = 80
      FieldName = 'DESCCONJNOVO'
      Origin = '"CM.CONJUNTO".DESCCONJUNTO'
      Size = 200
    end
    object qryBensSelecNOMELOCANOVO: TStringField
      DisplayLabel = 'Nova Localização'
      DisplayWidth = 60
      FieldName = 'NOMELOCANOVO'
      Origin = '"CM.LOCALIZACAO".NOME'
      Size = 60
    end
    object qryBensSelecNOMERESPNOVO: TStringField
      DisplayLabel = 'Novo Responsável'
      DisplayWidth = 60
      FieldName = 'NOMERESPNOVO'
      Origin = 'PESSOA.NOME'
      Size = 60
    end
    object qryBensSelecDESCGRUPNOVO: TStringField
      DisplayLabel = 'Novo Grupo Contábil'
      DisplayWidth = 60
      FieldName = 'DESCGRUPNOVO'
      Origin = 'GRUPO.NOME'
      Size = 60
    end
    object qryBensSelecIDSELBAIXA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDSELBAIXA'
      Origin = '"CM.SELBAIXABENS".IDSELBAIXA'
      Visible = False
    end
    object qryBensSelecIDBEM: TFloatField
      DisplayWidth = 10
      FieldName = 'IDBEM'
      Origin = '"CM.SELBAIXABENS".IDBEM'
      Visible = False
    end
    object qryBensSelecIDPESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      Origin = '"CM.SELBAIXABENS".IDPESSOA'
      Visible = False
    end
    object qryBensSelecIDCONJUNTO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCONJUNTO'
      Origin = '"CM.SELBAIXABENS".IDCONJUNTO'
      Visible = False
    end
    object qryBensSelecIDGRUPO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDGRUPO'
      Origin = '"CM.SELBAIXABENS".IDGRUPO'
      Visible = False
    end
    object qryBensSelecIDLOCALIZACAO: TFloatField
      FieldName = 'IDLOCALIZACAO'
      Origin = '"CM.CONJUNTO".IDLOCALIZACAO'
    end
    object qryBensSelecIDRESPONSAVEL: TFloatField
      FieldName = 'IDRESPONSAVEL'
      Origin = '"CM.CONJUNTO".IDRESPONSAVEL'
    end
  end
  object dsBensSelec: TwwDataSource
    AutoEdit = False
    DataSet = qryBensSelec
    Left = 176
    Top = 106
  end
  object dsGrupos: TwwDataSource
    AutoEdit = False
    DataSet = qryGrupos
    Left = 583
    Top = 174
  end
  object qryGrupos: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDGRUPO,CLASSE,NOME,TIPO,STATUS,DEPRECIACAO,'
      '       DATAULTDEP,FLGIMOVEL'
      'FROM   GRUPO'
      'ORDER BY CLASSE'
      '')
    ValidateWithMask = True
    Left = 583
    Top = 160
    object qryGruposIDGRUPO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDGRUPO'
      Origin = 'GRUPO.IDGRUPO'
    end
    object qryGruposCLASSE: TStringField
      DisplayWidth = 15
      FieldName = 'CLASSE'
      Origin = 'GRUPO.CLASSE'
      Size = 15
    end
    object qryGruposNOME: TStringField
      DisplayWidth = 60
      FieldName = 'NOME'
      Origin = 'GRUPO.NOME'
      Size = 60
    end
    object qryGruposTIPO: TStringField
      DisplayWidth = 1
      FieldName = 'TIPO'
      Origin = 'GRUPO.TIPO'
      Size = 1
    end
    object qryGruposSTATUS: TStringField
      DisplayWidth = 1
      FieldName = 'STATUS'
      Origin = 'GRUPO.STATUS'
      Size = 1
    end
    object qryGruposDEPRECIACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'DEPRECIACAO'
      Origin = 'GRUPO.DEPRECIACAO'
    end
    object qryGruposDATAULTDEP: TDateTimeField
      DisplayWidth = 10
      FieldName = 'DATAULTDEP'
      Origin = 'GRUPO.DATAULTDEP'
    end
    object qryGruposFLGIMOVEL: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGIMOVEL'
      Origin = 'GRUPO.FLGIMOVEL'
    end
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 672
    Top = 160
  end
  object qryVerificaGrupo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT GXCC.IDGRUPO'
      'FROM CONJUNTO C,'
      '     LOCALIZACAO L,'
      '     GRUPOBEMXCC GXCC'
      'WHERE (C.IDCONJUNTO        = :PIDCONJUNTO)'
      '  AND (GXCC.IDGRUPO        = :PIDGRUPO)'
      '  AND (C.IDLOCALIZACAO     = L.IDLOCALIZACAO)'
      '  AND (L.CODCENTROCUSTO    = GXCC.CODCENTROCUSTO)'
      '  AND (L.IDEMPRESA         = GXCC.IDEMPRESA)'
      '')
    ValidateWithMask = True
    Left = 552
    Top = 224
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONJUNTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDGRUPO'
        ParamType = ptUnknown
      end>
    object qryVerificaGrupoIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
      Origin = 'GRUPOBEMXCC.IDGRUPO'
    end
  end
  object qryBuscaGrupo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT GXCC.IDGRUPO'
      'FROM CLASSEXGRUPO CXG,'
      '     GRUPOBEMXCC GXCC,'
      '     LOCALIZACAO L'
      'WHERE (CXG.IDCLASSEBEM = :PIDCLASSE)'
      '  AND (L.IDLOCALIZACAO = :PIDLOCAL)'
      '  AND (CXG.IDGRUPO         = GXCC.IDGRUPO)'
      '  AND (GXCC.CODCENTROCUSTO = L.CODCENTROCUSTO)'
      '')
    ValidateWithMask = True
    Left = 640
    Top = 224
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCLASSE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDLOCAL'
        ParamType = ptUnknown
      end>
    object qryBuscaGrupoIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
      Origin = 'GRUPOBEMXCC.IDGRUPO'
    end
  end
  object qryLocal: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT L.IDLOCALIZACAO, L.NOME AS DESCLOCALIZACAO,'
      '       L.IDRESPONSAVEL, R.NOME AS NOMERESPONSAVEL,'
      '       L.IDEMPRESA, L.CODCENTROCUSTO '
      'FROM   LOCALIZACAO L, PESSOA R'
      'WHERE  (L.IDLOCALIZACAO = :PIDLOCAL)'
      '  AND  (L.IDPESSOA      = :PIDEMPRESA)'
      '  AND  (L.IDRESPONSAVEL = R.IDPESSOA(+))'
      '')
    ValidateWithMask = True
    Left = 338
    Top = 323
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDLOCAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDEMPRESA'
        ParamType = ptUnknown
      end>
    object qryLocalIDLOCALIZACAO: TFloatField
      FieldName = 'IDLOCALIZACAO'
      Origin = 'LOCALIZACAO.IDLOCALIZACAO'
    end
    object qryLocalDESCLOCALIZACAO: TStringField
      FieldName = 'DESCLOCALIZACAO'
      Origin = 'LOCALIZACAO.NOME'
      Size = 60
    end
    object qryLocalIDRESPONSAVEL: TFloatField
      FieldName = 'IDRESPONSAVEL'
      Origin = 'LOCALIZACAO.IDRESPONSAVEL'
    end
    object qryLocalNOMERESPONSAVEL: TStringField
      FieldName = 'NOMERESPONSAVEL'
      Origin = '"CM.PESSOA".NOME'
      Size = 60
    end
    object qryLocalIDEMPRESA: TFloatField
      FieldName = 'IDEMPRESA'
      Origin = '"CM.LOCALIZACAO".IDEMPRESA'
    end
    object qryLocalCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      Origin = '"CM.LOCALIZACAO".CODCENTROCUSTO'
      Size = 10
    end
  end
  object dsLocal: TwwDataSource
    AutoEdit = False
    DataSet = qryLocal
    Left = 339
    Top = 311
  end
  object MSLocal: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Localização'
    Colunas.Strings = (
      'LOCALIZACAO.NOME'
      'PESSOA.NOME'
      'CENTCUST.CODCENTROCUSTO'
      'CENTCUST.NOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Localização'
      'Responsável'
      'Código do C Custo'
      'Nome do C Custo')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'LOCALIZACAO'
      'PESSOA'
      'CENTCUST')
    CamposChave.Strings = (
      'LOCALIZACAO.IDLOCALIZACAO'
      'LOCALIZACAO.IDPESSOA')
    Filtro.Strings = (
      '(LOCALIZACAO.IDRESPONSAVEL = PESSOA.IDPESSOA(+))'
      '(LOCALIZACAO.CODCENTROCUSTO = CENTCUST.CODCENTROCUSTO(+))'
      '(LOCALIZACAO.IDEMPRESA = CENTCUST.IDEMPRESA(+))')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '60'
      '60'
      '10'
      '30')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 284
    Top = 311
  end
  object qryResp: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT R.IDRESPONSAVEL, P.NOME AS DESCRESPONSAVEL'
      'FROM RESPONSAVEL R, PESSOA P'
      'WHERE (R.IDRESPONSAVEL = :PIDRESP)'
      '  AND (R.IDRESPONSAVEL = P.IDPESSOA(+))'
      'ORDER BY P.NOME')
    ValidateWithMask = True
    Left = 464
    Top = 327
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDRESP'
        ParamType = ptUnknown
      end>
    object qryRespIDRESPONSAVEL: TFloatField
      FieldName = 'IDRESPONSAVEL'
    end
    object qryRespDESCRESPONSAVEL: TStringField
      FieldName = 'DESCRESPONSAVEL'
      Size = 60
    end
  end
  object dsResp: TwwDataSource
    AutoEdit = False
    DataSet = qryResp
    Left = 464
    Top = 314
  end
  object MSResp: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Responsável'
    Colunas.Strings = (
      'PESSOA.NOME')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Nome do Responsável')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'RESPONSAVEL'
      'PESSOA')
    CamposChave.Strings = (
      'RESPONSAVEL.IDRESPONSAVEL')
    Filtro.Strings = (
      'RESPONSAVEL.FLGATIVOFIXO = 1'
      'RESPONSAVEL.IDRESPONSAVEL=PESSOA.IDPESSOA(+)')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 416
    Top = 313
  end
end
