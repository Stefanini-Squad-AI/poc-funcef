inherited frmMTMovSelTransf: TfrmMTMovSelTransf
  Left = 475
  Top = 248
  Caption = 'Seleção de Bens para Transferência'
  ClientHeight = 608
  ClientWidth = 767
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Top = 35
    Width = 767
    Height = 538
    inherited pnlMestre: TPanel
      Width = 765
      Height = 51
      BevelInner = bvRaised
      object Label1: TLabel
        Left = 16
        Top = 5
        Width = 36
        Height = 13
        Caption = 'Termo'
      end
      object Processo: TLabel
        Left = 144
        Top = 5
        Width = 53
        Height = 13
        Caption = 'Processo'
      end
      object Label2: TLabel
        Left = 344
        Top = 5
        Width = 85
        Height = 13
        Caption = 'Data do Termo'
      end
      object Label4: TLabel
        Left = 456
        Top = 5
        Width = 141
        Height = 13
        Caption = 'Responsável pelo Termo'
      end
      object dbeSbxTermo: TwwDBEdit
        Left = 16
        Top = 20
        Width = 121
        Height = 21
        DataField = 'SBXTERMO'
        DataSource = ds
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbeSbxProcesso: TwwDBEdit
        Left = 144
        Top = 20
        Width = 193
        Height = 21
        DataField = 'SBXPROCESSO'
        DataSource = ds
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbeSbxData: TCMDateTimePicker
        Left = 344
        Top = 20
        Width = 105
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        DataField = 'SBXDATA'
        DataSource = ds
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
      object dbeResponsavel: TwwDBEdit
        Left = 456
        Top = 20
        Width = 265
        Height = 21
        DataField = 'NOME'
        DataSource = dsResp
        TabOrder = 4
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object bbtnSelResp: TBitBtn
        Left = 721
        Top = 20
        Width = 21
        Height = 21
        TabOrder = 3
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
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 52
      Width = 765
      Tabs.Strings = (
        'Bens')
      inherited pgctrlDetalhe: TPageControl
        Width = 667
        inherited tbsDet: TTabSheet
          Caption = 'Bens'
          inherited pnlControlesDet: TPanel
            Top = 37
            Width = 659
            Height = 136
            object Label26: TLabel
              Left = 16
              Top = 16
              Width = 127
              Height = 13
              Caption = 'Placa de Tombamento'
            end
            object Label22: TLabel
              Left = 16
              Top = 64
              Width = 104
              Height = 13
              Caption = 'Descrição do Bem'
            end
            object edPlaca: TEdit
              Left = 16
              Top = 32
              Width = 137
              Height = 21
              TabOrder = 0
              Text = 'edPlaca'
              OnExit = edPlacaExit
            end
            object bbtnSelBem: TBitBtn
              Left = 152
              Top = 32
              Width = 21
              Height = 21
              TabOrder = 1
              OnClick = bbtnSelBemClick
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
              Margin = 0
              NumGlyphs = 2
            end
            object dbmDesBem: TDBMemo
              Left = 16
              Top = 80
              Width = 577
              Height = 21
              DataField = 'DESBEM'
              DataSource = dsSelBem
              TabOrder = 2
            end
          end
          inherited dbgrdDet: TwwDBGrid
            Top = 37
            Width = 659
            Height = 136
            ControlType.Strings = (
              'FLGENVIAR;CheckBox;1;0')
            Selected.Strings = (
              'FLGENVIAR'#9'8'#9'Seleção'
              'PLACA'#9'10'#9'Placa'
              'DESBEM'#9'90'#9'Descrição'#9'F')
            MultiSelectOptions = [msoAutoUnselect, msoShiftSelect]
            Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgMultiSelect]
            TitleAlignment = taCenter
          end
          object pnlSelecao: TPanel
            Left = 0
            Top = 0
            Width = 659
            Height = 37
            Align = alTop
            TabOrder = 2
            object btnInverte: TBitBtn
              Left = 6
              Top = 7
              Width = 131
              Height = 26
              Caption = '&Inverter Seleção'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
              OnClick = btnInverteClick
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                33333333FF33333333FF333993333333300033377F3333333777333993333333
                300033F77FFF3333377739999993333333333777777F3333333F399999933333
                33003777777333333377333993333333330033377F3333333377333993333333
                3333333773333333333F333333333333330033333333F33333773333333C3333
                330033333337FF3333773333333CC333333333FFFFF77FFF3FF33CCCCCCCCCC3
                993337777777777F77F33CCCCCCCCCC3993337777777777377333333333CC333
                333333333337733333FF3333333C333330003333333733333777333333333333
                3000333333333333377733333333333333333333333333333333}
              NumGlyphs = 2
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 757
        inherited tb97BotoesDetalhe: TToolbar97
          inherited sbtnInsDet: TToolbarButton97
            Flat = False
          end
          inherited sbtnAltDet: TToolbarButton97
            Flat = False
          end
          inherited sbtnExcluiDet: TToolbarButton97
            Flat = False
          end
        end
        object Toolbar972: TToolbar97
          Left = 79
          Top = 0
          Caption = 'tb97BotoesDetalhe'
          DockPos = 79
          TabOrder = 1
          object bbtnGeraDet: TBitBtn
            Left = 0
            Top = 0
            Width = 25
            Height = 25
            Hint = 'Carrega o grid com uma seleção de bens|'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            OnClick = bbtnGeraDetClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003FF0000000F0
              000033F77777773777773FFF0CCC0FF09990333F73F37337F33733FFF0C0FFF0
              99903333F7373337F337333FFF0FFFF0999033333F73FFF7FFF73333FFF000F0
              0000333333F77737777733333F07B70FFFFF3333337F337F33333333330BBB0F
              FFFF3FFFFF7F337F333300000307B70FFFFF77777F73FF733F330EEE033000FF
              0FFF7F337FF777337FF30EEE00033FF000FF7F33777F333777FF0EEE0E033300
              000F7FFF7F7FFF77777F00000E00000000007777737773777777330EEE0E0330
              00FF337FFF7F7F3777F33300000E033000FF337777737F3777F333330EEE0330
              00FF33337FFF7FF77733333300000000033F3333777777777333}
            NumGlyphs = 2
          end
          object bbtnLimpar: TBitBtn
            Left = 25
            Top = 0
            Width = 25
            Height = 25
            Hint = 'Limpa o grid|'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            OnClick = bbtnLimparClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              88888888888888FF8888888888888778888888888888F77F8888888888800F08
              8888888888F7787F88888888800FFF0888888888F7788878F88888800FFFFFF0
              88888887788888F7F8888887FFFFFCF088888887FFF887878F888811111CCFFF
              08888877777F788F7F8881999991FFCF088887777777F87878F8999999991CFF
              F088777777777F88F78F998F9FF91FFCFF0877FF78877F8788789998FF991CCF
              FFF0777F88777F7888F7999FF8991FFFF77877788F777F88F778998F9FF91FF7
              788877FF7FF778F7788889999991777888888777777787788888889999988888
              8888887777788888888888888888888888888888888888888888}
            NumGlyphs = 2
          end
        end
      end
      inherited Dock974: TDock97
        Left = 671
      end
    end
    object pnlRegNovos: TPanel
      Left = 1
      Top = 312
      Width = 765
      Height = 225
      Align = alBottom
      BevelInner = bvRaised
      BevelOuter = bvNone
      TabOrder = 2
      object Label5: TLabel
        Left = 11
        Top = 3
        Width = 84
        Height = 13
        Caption = 'Conjunto Atual'
      end
      object Label6: TLabel
        Left = 11
        Top = 123
        Width = 68
        Height = 13
        Caption = 'Grupo Atual'
      end
      object Label7: TLabel
        Left = 352
        Top = 3
        Width = 85
        Height = 13
        Caption = 'Novo Conjunto'
      end
      object Label8: TLabel
        Left = 352
        Top = 123
        Width = 69
        Height = 13
        Caption = 'Novo Grupo'
      end
      object Label9: TLabel
        Left = 11
        Top = 43
        Width = 102
        Height = 13
        Caption = 'Localização Atual'
      end
      object Label10: TLabel
        Left = 352
        Top = 43
        Width = 103
        Height = 13
        Caption = 'Nova Localização'
      end
      object Label11: TLabel
        Left = 11
        Top = 83
        Width = 107
        Height = 13
        Caption = 'Responsável Atual'
      end
      object Label12: TLabel
        Left = 352
        Top = 83
        Width = 108
        Height = 13
        Caption = 'Novo Responsável'
      end
      object dbeConjunto: TwwDBEdit
        Left = 11
        Top = 19
        Width = 329
        Height = 21
        DataField = 'DESCCONJUNTO'
        DataSource = dsDet
        TabOrder = 9
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object bbtnSelConjunto: TBitBtn
        Left = 645
        Top = 19
        Width = 20
        Height = 21
        TabOrder = 0
        OnClick = bbtnSelConjuntoClick
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
      object dbeGrupo: TwwDBEdit
        Left = 11
        Top = 139
        Width = 329
        Height = 21
        DataField = 'DESCGRUPO'
        DataSource = dsDet
        TabOrder = 12
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbeConjNovo: TwwDBEdit
        Left = 352
        Top = 19
        Width = 293
        Height = 21
        DataField = 'DESCCONJUNTO'
        DataSource = dsConjunto
        TabOrder = 4
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbeGrupoNovo: TwwDBEdit
        Left = 352
        Top = 139
        Width = 294
        Height = 21
        DataField = 'NOME'
        DataSource = dsGrupo
        TabOrder = 7
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object bbtnSelGrupo: TBitBtn
        Left = 646
        Top = 139
        Width = 21
        Height = 21
        TabOrder = 3
        OnClick = bbtnSelGrupoClick
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
      object Dock975: TDock97
        Left = 679
        Top = 1
        Width = 85
        Height = 223
        AllowDrag = False
        BoundLines = [blLeft]
        Position = dpRight
        object Toolbar973: TToolbar97
          Left = 0
          Top = 0
          Caption = 'tb97Detalhe'
          DockPos = 0
          TabOrder = 0
          object bbtnOkConjGrup: TBitBtn
            Left = 0
            Top = 0
            Width = 80
            Height = 27
            Caption = '&OK'
            TabOrder = 0
            OnClick = bbtnOkConjGrupClick
            Glyph.Data = {
              BE060000424DBE06000000000000360400002800000024000000120000000100
              0800000000008802000000000000000000000001000000010000000000000000
              80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
              A600000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00030303030303
              0303030303030303030303030303030303030303030303030303030303030303
              03030303030303030303030303030303030303030303FF030303030303030303
              03030303030303040403030303030303030303030303030303F8F8FF03030303
              03030303030303030303040202040303030303030303030303030303F80303F8
              FF030303030303030303030303040202020204030303030303030303030303F8
              03030303F8FF0303030303030303030304020202020202040303030303030303
              0303F8030303030303F8FF030303030303030304020202FA0202020204030303
              0303030303F8FF0303F8FF030303F8FF03030303030303020202FA03FA020202
              040303030303030303F8FF03F803F8FF0303F8FF03030303030303FA02FA0303
              03FA0202020403030303030303F8FFF8030303F8FF0303F8FF03030303030303
              FA0303030303FA0202020403030303030303F80303030303F8FF0303F8FF0303
              0303030303030303030303FA0202020403030303030303030303030303F8FF03
              03F8FF03030303030303030303030303FA020202040303030303030303030303
              0303F8FF0303F8FF03030303030303030303030303FA02020204030303030303
              03030303030303F8FF0303F8FF03030303030303030303030303FA0202020403
              030303030303030303030303F8FF0303F8FF03030303030303030303030303FA
              0202040303030303030303030303030303F8FF03F8FF03030303030303030303
              03030303FA0202030303030303030303030303030303F8FFF803030303030303
              030303030303030303FA0303030303030303030303030303030303F803030303
              0303030303030303030303030303030303030303030303030303030303030303
              0303}
            NumGlyphs = 2
          end
          object bbtnCancConjGrup: TBitBtn
            Left = 0
            Top = 27
            Width = 80
            Height = 27
            Cancel = True
            Caption = '&Cancelar'
            TabOrder = 1
            OnClick = bbtnCancConjGrupClick
            Glyph.Data = {
              BE060000424DBE06000000000000360400002800000024000000120000000100
              0800000000008802000000000000000000000001000000010000000000000000
              80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
              A600000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00030303030303
              0303030303030303030303030303030303030303030303030303030303030303
              0303F8F80303030303030303030303030303030303FF03030303030303030303
              0303030303F90101F80303030303F9F80303030303030303F8F8FF0303030303
              03FF03030303030303F9010101F8030303F90101F8030303030303F8FF03F8FF
              030303FFF8F8FF030303030303F901010101F803F901010101F80303030303F8
              FF0303F8FF03FFF80303F8FF030303030303F901010101F80101010101F80303
              030303F8FF030303F8FFF803030303F8FF030303030303F90101010101010101
              F803030303030303F8FF030303F803030303FFF80303030303030303F9010101
              010101F8030303030303030303F8FF030303030303FFF8030303030303030303
              030101010101F80303030303030303030303F8FF0303030303F8030303030303
              0303030303F901010101F8030303030303030303030303F8FF030303F8030303
              0303030303030303F90101010101F8030303030303030303030303F803030303
              F8FF030303030303030303F9010101F8010101F803030303030303030303F803
              03030303F8FF0303030303030303F9010101F803F9010101F803030303030303
              03F8030303F8FF0303F8FF03030303030303F90101F8030303F9010101F80303
              03030303F8FF0303F803F8FF0303F8FF03030303030303F9010303030303F901
              0101030303030303F8FFFFF8030303F8FF0303F8FF0303030303030303030303
              030303F901F903030303030303F8F80303030303F8FFFFFFF803030303030303
              03030303030303030303030303030303030303030303030303F8F8F803030303
              0303030303030303030303030303030303030303030303030303030303030303
              0303}
            NumGlyphs = 2
          end
        end
      end
      object dbeLocal: TwwDBEdit
        Left = 11
        Top = 59
        Width = 329
        Height = 21
        DataField = 'DESCLOCAL'
        DataSource = dsDet
        TabOrder = 10
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbeLocalNovo: TwwDBEdit
        Left = 352
        Top = 59
        Width = 293
        Height = 21
        DataField = 'NOME'
        DataSource = dsLocal
        TabOrder = 5
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object bbtnSelLocal: TBitBtn
        Left = 645
        Top = 59
        Width = 21
        Height = 21
        TabOrder = 1
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
      object dbeResp: TwwDBEdit
        Left = 11
        Top = 100
        Width = 329
        Height = 21
        DataField = 'NOMERESP'
        DataSource = dsDet
        TabOrder = 11
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbeRespNovo: TwwDBEdit
        Left = 352
        Top = 100
        Width = 293
        Height = 21
        DataField = 'NOME'
        DataSource = dsRespConj
        TabOrder = 6
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object bbtnSelRespConj: TBitBtn
        Left = 645
        Top = 100
        Width = 21
        Height = 21
        TabOrder = 2
        OnClick = bbtnSelRespConjClick
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
      object chkAplicaTodos: TCheckBox
        Left = 354
        Top = 168
        Width = 311
        Height = 17
        Caption = 'Aplicar alteração a todos os registros selecionados'
        TabOrder = 8
      end
    end
  end
  inherited Dock972: TDock97
    Width = 767
    Height = 35
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Width = 85
        Height = 29
        Layout = blGlyphLeft
        Spacing = 4
      end
      inherited sbtnAlterar: TToolbarButton97
        Left = 85
        Width = 85
        Height = 29
        Layout = blGlyphLeft
        Spacing = 4
      end
      inherited sbtnProcurar: TToolbarButton97
        Left = 255
        Width = 85
        Height = 29
        Layout = blGlyphLeft
        Spacing = 4
      end
      inherited sbtnApagar: TToolbarButton97
        Left = 170
        Width = 85
        Height = 29
        Layout = blGlyphLeft
        Spacing = 4
      end
    end
  end
  inherited Dock971: TDock97
    Top = 573
    Width = 767
    Height = 35
    inherited tb97Fundo: TToolbar97
      Left = 575
      DockPos = 575
      inherited sep1: TToolbarSep97
        Left = 173
      end
      inherited sep3: TToolbarSep97
        Left = 85
      end
      inherited bbtnSair: TBitBtn
        Width = 85
        Height = 29
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 88
        Width = 85
        Height = 29
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 398
      DockPos = 398
      inherited ToolbarSep971: TToolbarSep97
        Left = 85
      end
      inherited bbtnConfirmar: TBitBtn
        Width = 85
        Height = 29
      end
      inherited bbtnCancelar: TBitBtn
        Left = 88
        Width = 85
        Height = 29
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 746
    Top = 503
    TargetsData = (
      1
      1
      (
        'TDBMemo'
        'Text'
        0))
  end
  inherited ImlPadrao: TImageList [4]
    Left = 688
    Top = 503
  end
  inherited CmeCadastro: TCmEventosCadastro [5]
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 464
    Top = 65535
  end
  inherited MontaSelect: TMontaSelect [6]
    Caption = 'Selecione o Termo de Transferência'
    Colunas.Strings = (
      'SELBAIXA.SBXTERMO'
      'SELBAIXA.SBXPROCESSO'
      'SELBAIXA.SBXDATA'
      'PESSOA.NOME'
      'CONJUNTO.DESCCONJUNTO'
      'GRUPO.NOME')
    TipodeDado.Strings = (
      'N'
      'C'
      'D'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Termo de Transferência'
      'Processo'
      'Data da Seleção'
      'Responsável'
      'Conjunto'
      'Grupo')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'SELBAIXA'
      'PESSOA'
      'GRUPO'
      'CONJUNTO')
    CamposChave.Strings = (
      'SELBAIXA.IDSELBAIXA'
      'SELBAIXA.IDPESSOA')
    Filtro.Strings = (
      'SELBAIXA.SBTIPOMOV > 0'
      'SELBAIXA.IDCONJUNTO=CONJUNTO.IDCONJUNTO(+)'
      'SELBAIXA.IDPESSOA=CONJUNTO.IDPESSOA(+)'
      'SELBAIXA.IDRESPONSAVEL=PESSOA.IDPESSOA(+)'
      'SELBAIXA.IDGRUPO=GRUPO.IDGRUPO(+)')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '80'
      '10'
      '60'
      '200'
      '60')
    Left = 616
    Top = 0
  end
  inherited CmeDetalhe: TCmEventosCadastro [7]
    BeforeConfirma = CmeDetalheBeforeConfirma
    Left = 532
    Top = 65535
  end
  inherited ds: TwwDataSource [8]
    Left = 408
    Top = 0
  end
  inherited dsDet: TwwDataSource [9]
    DataSet = cdsDet
    Left = 173
    Top = 108
  end
  object dsResp: TwwDataSource [10]
    AutoEdit = False
    DataSet = cdsResp
    Left = 640
    Top = 77
  end
  object dsLocal: TwwDataSource [11]
    AutoEdit = False
    DataSet = cdsLocal
    Left = 464
    Top = 172
  end
  object dsConjunto: TwwDataSource [12]
    AutoEdit = False
    DataSet = cdsConjunto
    Left = 392
    Top = 171
  end
  object dsRespConj: TwwDataSource [13]
    AutoEdit = False
    DataSet = cdsRespConj
    Left = 535
    Top = 172
  end
  object dsGrupo: TwwDataSource [14]
    AutoEdit = False
    DataSet = cdsGrupo
    Left = 605
    Top = 171
  end
  inherited Cds: TCMClientDataSet [15]
    Left = 360
    Top = 0
  end
  object cdsDet: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 172
    Top = 95
  end
  object cdsResp: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 640
    Top = 62
  end
  object cdsGrupo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 605
    Top = 157
  end
  object cdsLocal: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 464
    Top = 158
  end
  object cdsConjunto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 392
    Top = 157
  end
  object cdsRespConj: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 536
    Top = 158
  end
  object dsSelBem: TwwDataSource
    AutoEdit = False
    DataSet = cdsSelBem
    Left = 240
    Top = 122
  end
  object cdsSelBem: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 240
    Top = 108
  end
  object sqlSelBem: TCMSqlParams
    SQL.Strings = (
      'SELECT BEM.IDPESSOA, BEM.IDBEM, BEM.IDCONJUNTO, BEM.IDCLASSEBEM,'
      '       BEM.PLACA, CONJUNTO.DESCCONJUNTO, BEM.IDGRUPO,'
      '       CONJUNTO.IDLOCALIZACAO, CONJUNTO.IDRESPONSAVEL,'
      '       BEM.DESBEM, LOCALIZACAO.NOME AS DESCLOCALIZACAO,'
      '       PESSOA.NOME AS NOMERESP, GRUPO.NOME AS DESCGRUPO,'
      '       BEM.FLGSAIDATEMP, BEM.BAIXATOTAL'
      'FROM BEM, CONJUNTO, LOCALIZACAO, PESSOA, GRUPO'
      'WHERE BEM.IDPESSOA = :IDPESSOA'
      '  AND BEM.IDBEM = :IDBEM'
      '  AND BEM.BAIXATOTAL <> '#39'S'#39
      '  AND BEM.FLGSAIDATEMP = 0'
      '  AND BEM.IDCONJUNTO = CONJUNTO.IDCONJUNTO'
      '  AND BEM.IDPESSOA = CONJUNTO.IDPESSOA'
      '  AND CONJUNTO.IDLOCALIZACAO = LOCALIZACAO.IDLOCALIZACAO'
      '  AND CONJUNTO.IDPESSOA = LOCALIZACAO.IDPESSOA'
      '  AND CONJUNTO.IDRESPONSAVEL = PESSOA.IDPESSOA'
      '  AND BEM.IDGRUPO = GRUPO.IDGRUPO'
      '')
    ClientDataSet = cdsSelBem
    Left = 240
    Top = 94
  end
  object MSBem: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Bem'
    Colunas.Strings = (
      'BEM.PLACA'
      'BEM.BAIXATOTAL'
      'BEM.DESBEM'
      'CONJUNTO.DESCCONJUNTO'
      'LOCALIZACAO.NOME'
      'PESSOARESP.NOME'
      'PESSOAFORN.NOME'
      'CLASSEDEBEM.DESCRICAO'
      'GRUPO.NOME'
      'BEM.IDNOTA'
      'BEM.DTAINCLUSAO'
      'BEM.VALHISTORICO'
      'BEM.DESBEM'
      'BEM.DESBEM'
      'BEM.NUMSERIE'
      'BEM.PUBAUTOR'
      'BEM.PUBEDITORA'
      'BEM.PUBANO'
      'BEM.CONTROLE')
    TipodeDado.Strings = (
      'N'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'D'
      'N'
      'C'
      'C'
      'C'
      'C'
      'C'
      'N'
      'C')
    Descricao.Strings = (
      'Nº de Tombamento'
      'Baixado'
      'Descrição'
      'Conjunto'
      'Localização'
      'Responsável'
      'Fornecedor'
      'Classe'
      'Grupo Contábil'
      'Documento Aquisição'
      'Data de Aquisição'
      'Valor de Aquisição'
      'Marca'
      'Modelo'
      'Nº de Série'
      'Autor'
      'Editora'
      'Ano Publicação'
      'Controle')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'BEM'
      'CONJUNTO'
      'GRUPO'
      'LOCALIZACAO'
      'CLASSEDEBEM'
      'PESSOA PESSOARESP'
      'PESSOA PESSOAFORN'
      'PLANOGRUPO')
    CamposChave.Strings = (
      'BEM.IDPESSOA'
      'BEM.IDBEM'
      'BEM.PLACA'
      'BEM.DESBEM'
      'CONJUNTO.IDLOCALIZACAO'
      'BEM.IDCONJUNTO')
    Filtro.Strings = (
      'BEM.IDCONJUNTO=CONJUNTO.IDCONJUNTO'
      'BEM.IDPESSOA=CONJUNTO.IDPESSOA'
      'CONJUNTO.IDLOCALIZACAO=LOCALIZACAO.IDLOCALIZACAO'
      'CONJUNTO.IDPESSOA=LOCALIZACAO.IDPESSOA'
      'CONJUNTO.IDRESPONSAVEL=PESSOARESP.IDPESSOA'
      'BEM.IDGRUPO=PLANOGRUPO.IDGRUPO'
      'PLANOGRUPO.IDGRUPO=GRUPO.IDGRUPO'
      'BEM.IDCLASSEBEM=CLASSEDEBEM.IDCLASSEBEM'
      'BEM.IDFORNSERV=PESSOAFORN.IDPESSOA(+)'
      '1=1')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '1'
      '80'
      '100'
      '60'
      '60'
      '60'
      '60'
      '60'
      '18'
      '10'
      '10'
      '40'
      '40'
      '20'
      '60'
      '60'
      '10'
      '1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 240
    Top = 80
  end
  object MSRespConj: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Selecione Responsável'
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
      'RESPONSAVEL.IDRESPONSAVEL=PESSOA.IDPESSOA')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 536
    Top = 144
  end
  object MSResp: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Responsável pelo Termo de Transferência'
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
    MultiSelect = False
    Left = 640
    Top = 48
  end
  object MSGrupo: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Selecione Grupo Contábil'
    Colunas.Strings = (
      'GRUPO.CLASSE'
      'GRUPO.NOME')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Código'
      'Descrição')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'GRUPO'
      'PLANOGRUPO')
    CamposChave.Strings = (
      'GRUPO.IDGRUPO'
      'PLANOGRUPO.IDPESSOA')
    Filtro.Strings = (
      'GRUPO.TIPO = '#39'A'#39
      'GRUPO.STATUS = '#39'A'#39
      'GRUPO.IDGRUPO=PLANOGRUPO.IDGRUPO')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '15'
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 605
    Top = 144
  end
  object MSConjunto: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Conjunto'
    Colunas.Strings = (
      'CONJUNTO.DESCCONJUNTO'
      'LOCALIZACAO.NOME'
      'PESSOA.NOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Conjunto'
      'Localização'
      'Responsável')
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
      'CONJUNTO.IDLOCALIZACAO = LOCALIZACAO.IDLOCALIZACAO'
      'CONJUNTO.IDPESSOA = LOCALIZACAO.IDPESSOA'
      'CONJUNTO.IDRESPONSAVEL = PESSOA.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '200'
      '60'
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 392
    Top = 144
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
      'LOCALIZACAO.IDRESPONSAVEL = PESSOA.IDPESSOA'
      'LOCALIZACAO.CODCENTROCUSTO = CENTCUST.CODCENTROCUSTO'
      'LOCALIZACAO.IDEMPRESA = CENTCUST.IDEMPRESA')
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
    MultiSelect = False
    Left = 464
    Top = 144
  end
  object sqlDet: TCMSqlParams
    SQL.Strings = (
      'SELECT SBB.IDSELBAIXA, SBB.IDBEM, SBB.IDPESSOA,'
      
        '       SBB.IDCONJATUAL, SBB.IDLOCALATUAL, SBB.IDRESPATUAL, SBB.I' +
        'DGRUPATUAL,'
      
        '       SBB.IDCONJUNTO, SBB.IDLOCALIZACAO, SBB.IDRESPONSAVEL, SBB' +
        '.IDGRUPO,'
      '       B.PLACA, B.DESBEM, C.DESCCONJUNTO,'
      '       G.NOME AS DESCGRUPO,'
      '       L.NOME AS DESCLOCAL, R.NOME AS NOMERESP,'
      '       B.IDCONJUNTO AS IDCONJUNTOATUAL,'
      '       B.IDGRUPO AS IDGRUPOATUAL,'
      '       C.IDLOCALIZACAO AS IDLOCALIZACAOATUAL,'
      '       C.IDRESPONSAVEL AS IDRESPONSAVELATUAL,'
      '       B.IDCLASSEBEM'
      'FROM SELBAIXABENS SBB,'
      '     BEM B, CONJUNTO C, GRUPO G, LOCALIZACAO L, PESSOA R'
      'WHERE SBB.IDSELBAIXA = :PIDSELBAIXA'
      '  AND SBB.IDPESSOA = :IDPESSOA'
      '  AND B.BAIXATOTAL = '#39'N'#39
      '  AND SBB.IDBEM = B.IDBEM'
      '  AND SBB.IDPESSOA = B.IDPESSOA'
      '  AND B.IDCONJUNTO = C.IDCONJUNTO'
      '  AND B.IDPESSOA = C.IDPESSOA'
      '  AND B.IDGRUPO = G.IDGRUPO'
      '  AND C.IDLOCALIZACAO = L.IDLOCALIZACAO'
      '  AND C.IDPESSOA = L.IDPESSOA'
      '  AND C.IDRESPONSAVEL = R.IDPESSOA'
      'ORDER BY B.PLACA'
      ''
      ' '
      ' '
      ' '
      ' ')
    Left = 172
    Top = 81
  end
  object cdsGrupoTaxaDep2: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 521
    Top = 342
  end
  object cdsGrupoTaxaDep1: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 521
    Top = 328
  end
end
