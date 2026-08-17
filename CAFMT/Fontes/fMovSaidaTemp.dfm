inherited frmMovSaidaTemp: TfrmMovSaidaTemp
  Left = 12
  Top = 114
  HelpContext = 70034
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Cadastro de Termos de Saída Temporária'
  ClientHeight = 425
  ClientWidth = 765
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel [0]
    Left = 360
    Top = 128
    Width = 69
    Height = 13
    Caption = 'Localização'
  end
  inherited pnlFundo: TPanel
    Width = 765
    Height = 339
    inherited pnlMestre: TPanel
      Width = 755
      Height = 116
      object Label34: TLabel
        Left = 272
        Top = 8
        Width = 44
        Height = 13
        Caption = 'Destino'
      end
      object Label4: TLabel
        Left = 16
        Top = 56
        Width = 74
        Height = 13
        Caption = 'Responsável'
      end
      object Termo: TLabel
        Left = 16
        Top = 8
        Width = 36
        Height = 13
        Caption = 'Termo'
      end
      object Label1: TLabel
        Left = 147
        Top = 8
        Width = 84
        Height = 13
        Caption = 'Data da Saída'
      end
      object Label5: TLabel
        Left = 583
        Top = 8
        Width = 39
        Height = 13
        Caption = 'Motivo'
      end
      object Label6: TLabel
        Left = 301
        Top = 56
        Width = 69
        Height = 13
        Caption = 'Observação'
      end
      object dbeLocalizacao: TwwDBEdit
        Left = 272
        Top = 24
        Width = 279
        Height = 21
        DataField = 'DESCLOCALIZACAO'
        DataSource = dsLocal
        TabOrder = 2
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object bbtnSelLocal: TBitBtn
        Left = 550
        Top = 24
        Width = 21
        Height = 21
        TabOrder = 0
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
        Left = 272
        Top = 72
        Width = 21
        Height = 21
        TabOrder = 1
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
      object dbeResponsavel: TwwDBEdit
        Left = 16
        Top = 72
        Width = 257
        Height = 21
        DataField = 'DESCRESPONSAVEL'
        DataSource = dsResp
        TabOrder = 3
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbeTermo: TwwDBEdit
        Left = 16
        Top = 24
        Width = 121
        Height = 21
        DataField = 'STPTERMO'
        DataSource = ds
        TabOrder = 4
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbeData: TCMDateTimePicker
        Left = 148
        Top = 24
        Width = 112
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        DataField = 'STPDATA'
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
        TabOrder = 5
      end
      object dbeObs: TDBMemo
        Left = 302
        Top = 72
        Width = 440
        Height = 41
        DataField = 'STPOBSERVACOES'
        DataSource = ds
        TabOrder = 6
      end
      object dbcmbSelMotivo: TwwDBLookupCombo
        Left = 584
        Top = 24
        Width = 158
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCTIPSAITEMP'#9'60'#9'Motivo para Saída Temporária')
        DataField = 'IDTIPOSAIDATEMP'
        DataSource = ds
        LookupTable = qrySelMotivo
        LookupField = 'IDTIPOSAIDATEMP'
        TabOrder = 7
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 121
      Width = 755
      Height = 213
      Tabs.Strings = (
        'Bens')
      inherited Dock973: TDock97 [0]
        Width = 747
        Background.Data = {
          760F0000424D760F0000000000007600000028000000800000003C0000000100
          040000000000000F000000000000000000001000000000000000000000008080
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          777777777777171717777777777777177771777777777777777077F7FF7FFFF7
          77F77F77F7F7F7F7F7F7F7F7F777777777771777177777777777777777777777
          777777777771717717777777777777777717777777777777777777777FFFFF7F
          7F7F77F7F7F7F7F7F7F7F7F77777777777777717177777777777777777777777
          77777777777777171777777777777777717777777777777777777777777FF7FF
          7F77777777F7F7FF7F7F77F77F77777777777777177777777777777777777777
          7777777777771771777777777777777771777777777777777777777777777FFF
          FF7F7777F7F7F7F7F7F77F777777777777777771717777777777777777777777
          777777777777771777777777777777777777777777777777777777777777777F
          F7F7F7F777F7F7F7F7F7F7F7F777777777777777177777777777777777777777
          7777777777777777777777777777777777777777777777777777777777777777
          FFFF7F7F7F7F7F7F7F7F777777777F7777777777777777777777777777777777
          7777777777777777777777777777777777777777777777777777777777777777
          7FF7F7F7F7F7F7FFFFF7F7F7F7F7777777777777717717177777777777777777
          7777777777777777777777777777777777777777777777777777777777777771
          77FFFFF7F7777F77F7F7F77F77777F7777777777777171777777777777777777
          7777777777777177777777777777777777777777777777777777777777777777
          777FFFFFF7F7F77F7F7FF7F7F77F777777777777777777177777777777777777
          7777777777777777771777777777777777777777777777777777777777777777
          7177FFFF7F7F77F7F7FF7FF7F7F7F77F77777777777171717777777777777777
          7777777777777717771777777777777777777777777777777777777777777777
          77777FFFFF7F7777F7F7FF7FF7F77F7777777777777777777777771777777777
          7777777777777771777777777777777777777777777777777777777777777777
          777777FFFF7F77F7F7F7F7F7F7F7F77F7F777777777771717771777177177777
          7777777777777777777777777777777777777777777777777777777777777777
          777777FFFFFF7F77F7F7F7FF7FF7F7F7777F7777777777771717717777777777
          7777777777777777177777777777777777777777777777777777777777777777
          7777777FFFF7F7F777F7F7F7F7F7F777F7777F77777777717771777777777777
          7777777777777777717777777777777777777777777777777777777777777777
          7777777F7FFF7F77F7F77F7FFF7F7F7F777F7777777777171717717777777F77
          7777777777777777777771777777777777777777777777777777777777777777
          7777777FFFF7F7777777F7F7F7F7F7F77F77F7777777777771771777777F7777
          F7F7777777777777771777777777177777777777777777777777777777777777
          77777177FFFFF7F777F77F7F7FF7F7F7F77F77F777777777171717177777F777
          777F7F7777777777777177177771717777777777777777777777777777777777
          77777777FFFF7F777777F7F7FF7F7F7F7F7F7F77777777777771717717777777
          77777F7F77777777777717771777777777777777777777777777777777777777
          777777177FFFF7F7F77F7F7FF7F7FF7F7F7F7F7F777777777717177177777777
          1777777777777777777771717717777177777777777777777777777777777777
          777777777FFFF7F77777777F7F7FF7F7F7F7F777F77777777771771717777771
          7777777777771777777777177771777777777777777777777777777777777777
          77777771777F7F7F77777F7F7F7F7F7F7F7F7F7F777777777777771717717717
          7777777777777777777771777777777777777777777777777777777777777777
          777777777777F7F7F7F77F7F7F7F7F7F7F7F7777777F77777777717717171717
          7777777777171777777717777777777777777777777777777777777777777777
          77777777777777F7F77777777F7F7F7F7F7F7F7F7F7777777777777777717777
          7777777777777177777771777777777777777777777777777777777777777777
          777777777777777F7F77777F7F7F7F7F7F7F7F777777F77F7777771777717777
          7777777777777777777771177777777777777777777777777777777777777777
          7177777777777777F7F7777777F77F7F7FF7F7F7F7F777777777777777717777
          7777777777777777777777777777777777777777777777777777777777777777
          7777777777777777777777777F77F7F7F7F7F7F77777F7777777777771777777
          7777777777777777777771717777777777777777777777777777777777777777
          777777177777771777777777777F7F7F7F7F7F7F7F7F777F7777777777717777
          7777777777777777777777171777777777777777777777777777777777777777
          71777777777777777777777777F7F7F7F7F7F7F7F7F77F777777777777177777
          7777777777777777777777177777777777777777777777777777777777777717
          77777777777777717777777777777F77F7F7F7F7F7F7F7777777777777777777
          77777777777777777777777777777777777F7777777777777777777777777171
          7171777777777777171777777777F77F7F7F7F7F7F7F7F777777777777777777
          771777777777777777777777777777777177F777777777777777777777777717
          171777177777777717771777777777F7F7F7F7FF7F7F77F77777777777777171
          7777777777777777777777777777777777777F77777777777777777777777777
          77717177777777777171717177777F77F7F7F7F7F7F7F77F7777777777777171
          7177777177777777777777777777777777777FF7F77771777777777777777777
          1717777777777777771777777777777F7F7F7F7F7F7F77F7F777777777777777
          7777777717777777777777777777777777777777777777777777777777777777
          717777777777777777777777717777F77F7F7F7F7F7F7F7F77F7777777777771
          7177777777777777777777777777777777771777777777777777777777777777
          77177777777777777777777777777777F7F77F7F7F7F7F7FF777F77777777717
          777777F777777777777777777777777777777777717177717777777777777777
          77177777777777777777777771777777777F77F7F7F7F7F777F7777777777777
          171777F7F7777777777777177777777777777777777777777777777777777777
          777777777777777777777777177177777F77F7F7F7F7F7F7F7F7F7F777777777
          7777777F77777777777777777777777777777777777777777777777777777777
          77777777777777777777777771777777777F77F7F7F7F7F7F7F77777F7777777
          7717777F77777777777777717177777777777777777777777777777777777777
          7777777777777777777777777717777777777F7F7F7F7F7F7777F7F777777777
          777777777F777777777777777717777777777777777777777777777777777777
          777777777777777777777777777777777777F7F7F7F7F7F7F7F7F77777777777
          7777777777777777777777771777777777777777777777777777777777777777
          77777777777777777777777777717771777777F7F77F7F7F7F7F77F777777777
          7777777777777777777777777717177777777771777777777777777777777777
          7777777777777777777777777777177777777F7F77F7F7F7F7F77F777F777777
          7777777777777177777777777777777777777717177777777777777777777777
          77777777777777777177777777717171777777777F7F7FF7F7F7F77F77777777
          7777777777717777777777777717177777777777777777777777777777777777
          777777777777777777177777777711717777777F7F7F7F7F7F77F7F7F7F77777
          777777777717171717777777777777777777777771777777777F777777777777
          777777777777777777777777777117117777777777F77F7F7F7F77F77777F777
          77777777171777777777777777777777777777777777777777F7F77777777777
          77777777777777777771777777771117177777777F77F7F7F777F7F7F7F77777
          7777777777171777777777777777777777777777777777777777777777777777
          777777777777777777777777777771777777777777F77F7F7F7F7F7F777F7777
          7777777717177777777777777777777777777777777777777777777777777777
          77777777777777777777777777777777777177777777F77F7F77F7F7F7F77F77
          7777777777171777777777777777777777777777777777777777777777777777
          7777777777777777777777777777777777177777777F7F7F7F7F7F7F777F7777
          77777777777777777F7F77777717777777777777777777777777777771777777
          7777777777777777777777777777777777717777777777F7F7F77F7F7F7F77F7
          77777777777777777F7F7F777777777777777777777777777777771777777777
          77777777177777777777777777771777777717777777F7F7F77F7F7F7F77F777
          777777777777777777FFF77F7777717777777777777777777777777777177777
          77777777777777777777777777771777777771777777777777F7F7F7F77F77F7
          77F7777777777777777777F77777777777777777777777777777777777777777
          77777777777777777777777777777777777777171777777F7F77F7F7F7F77F77
          F77777777777777777777777F7F7777777777777777777777777777777777777
          777777777717777777777777777777777777717777777777777F7F7F7F77F77F
          77F77777777F77777717777777F7777777777777777777777777777777777777
          77777777777177777777777777777777777777777177777777F7F7F77F7F77F7
          7F77F77777777F77777717777777777777777777777777777777777777777777
          7777777777771777777777777777777777777777777777777F77F7F7F777F777
          F77F777777777777771771777777771777777777777777777777777777777777
          777777777777777771777777777777777777777777177777777F7F7F7F7F77F7
          F7F7777777777777777717171777777777777777777777777777777777777777
          77777777777771777777777777777177777777777771777777777777F777F777
          7777777777777777777171717177771777777777777777777777777777777777
          77777777777777777777777777777777777777777777777777777F7F7F7F7777
          F77F77F777777777777771771717177777777777777777777777777777777777
          7777777777777777777777777777777777777777777177777777}
        inherited tb97BotoesDetalhe: TToolbar97
          inherited sbtnAltDet: TToolbarButton97
            Visible = False
          end
        end
      end
      inherited Dock974: TDock97 [1]
        Left = 661
        Height = 154
      end
      inherited pgctrlDetalhe: TPageControl [2]
        Width = 657
        Height = 154
        inherited tbsDet: TTabSheet
          Caption = 'Bens'
          inherited dbgrdDet: TwwDBGrid
            Width = 649
            Height = 126
            Selected.Strings = (
              'PLACA'#9'15'#9'Placa'
              'DESBEM'#9'73'#9'Descrição')
            Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            TitleAlignment = taCenter
          end
          inherited pnlControlesDet: TPanel
            Width = 649
            Height = 126
            BevelOuter = bvLowered
            object Label26: TLabel
              Left = 16
              Top = 8
              Width = 127
              Height = 13
              Caption = 'Placa de Tombamento'
            end
            object Label22: TLabel
              Left = 184
              Top = 8
              Width = 104
              Height = 13
              Caption = 'Descrição do Bem'
            end
            object Label7: TLabel
              Left = 16
              Top = 48
              Width = 51
              Height = 13
              Caption = 'Conjunto'
            end
            object Label8: TLabel
              Left = 16
              Top = 88
              Width = 69
              Height = 13
              Caption = 'Localização'
            end
            object Label17: TLabel
              Left = 320
              Top = 88
              Width = 74
              Height = 13
              Caption = 'Responsável'
            end
            object edPlaca: TEdit
              Left = 16
              Top = 24
              Width = 137
              Height = 21
              TabOrder = 0
              Text = 'edPlaca'
              OnExit = edPlacaExit
            end
            object bbtnSelBem: TBitBtn
              Left = 153
              Top = 24
              Width = 21
              Height = 21
              Caption = 'bbtnSelBem'
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
              Left = 184
              Top = 24
              Width = 457
              Height = 21
              DataField = 'DESBEM'
              DataSource = dsSelBem
              TabOrder = 2
            end
            object dbeConjunto: TwwDBEdit
              Left = 16
              Top = 64
              Width = 625
              Height = 21
              DataField = 'DESCCONJUNTO'
              DataSource = dsSelBem
              TabOrder = 3
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dbeLocal: TwwDBEdit
              Left = 16
              Top = 104
              Width = 295
              Height = 21
              DataField = 'DESCLOCALIZACAO'
              DataSource = dsSelBem
              TabOrder = 4
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dbeResp: TwwDBEdit
              Left = 320
              Top = 104
              Width = 321
              Height = 21
              DataField = 'NOMERESPONSAVEL'
              DataSource = dsSelBem
              TabOrder = 5
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
          end
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 765
  end
  inherited Dock971: TDock97
    Top = 386
    Width = 765
    inherited tb97Fundo: TToolbar97
      Left = 506
      DockPos = 506
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 70034
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 338
      DockPos = 338
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '     IDSAIDATEMPORARIA,'
      '     STPTERMO,'
      '     STPDATA,'
      '     IDTIPOSAIDATEMP,'
      '     IDPESSOA,'
      '     IDLOCALIZACAO,'
      '     IDRESPONSAVEL,'
      '     STPOBSERVACOES,'
      '     STPDATARETORNO'
      'FROM'
      '     SAIDATEMPORARIA'
      'WHERE'
      '    (IDSAIDATEMPORARIA = :PIDSAIDATEMP)'
      '')
    Left = 256
    Top = 0
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDSAIDATEMP'
        ParamType = ptUnknown
      end>
    object qryIDSAIDATEMPORARIA: TFloatField
      FieldName = 'IDSAIDATEMPORARIA'
      Origin = 'SAIDATEMPORARIA.IDSAIDATEMPORARIA'
    end
    object qrySTPTERMO: TFloatField
      FieldName = 'STPTERMO'
      Origin = 'SAIDATEMPORARIA.STPTERMO'
      EditFormat = '##########'
    end
    object qrySTPDATA: TDateTimeField
      FieldName = 'STPDATA'
      Origin = 'SAIDATEMPORARIA.STPDATA'
    end
    object qryIDTIPOSAIDATEMP: TFloatField
      FieldName = 'IDTIPOSAIDATEMP'
      Origin = 'SAIDATEMPORARIA.IDTIPOSAIDATEMP'
    end
    object qryIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'SAIDATEMPORARIA.IDPESSOA'
    end
    object qryIDLOCALIZACAO: TFloatField
      FieldName = 'IDLOCALIZACAO'
      Origin = 'SAIDATEMPORARIA.IDLOCALIZACAO'
    end
    object qryIDRESPONSAVEL: TFloatField
      FieldName = 'IDRESPONSAVEL'
      Origin = 'SAIDATEMPORARIA.IDRESPONSAVEL'
    end
    object qrySTPOBSERVACOES: TStringField
      FieldName = 'STPOBSERVACOES'
      Origin = 'SAIDATEMPORARIA.STPOBSERVACOES'
      Size = 120
    end
    object qrySTPDATARETORNO: TDateTimeField
      FieldName = 'STPDATARETORNO'
      Origin = 'SAIDATEMPORARIA.STPDATARETORNO'
    end
  end
  inherited dsDet: TwwDataSource
    DataSet = qryDet
    Left = 488
    Top = 0
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 27
    Top = 491
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update SAIDATEMPORARIA'
      'set'
      '  IDSAIDATEMPORARIA = :IDSAIDATEMPORARIA,'
      '  STPTERMO = :STPTERMO,'
      '  STPDATA = :STPDATA,'
      '  IDTIPOSAIDATEMP = :IDTIPOSAIDATEMP,'
      '  IDPESSOA = :IDPESSOA,'
      '  IDLOCALIZACAO = :IDLOCALIZACAO,'
      '  IDRESPONSAVEL = :IDRESPONSAVEL,'
      '  STPOBSERVACOES = :STPOBSERVACOES,'
      '  STPDATARETORNO = :STPDATARETORNO'
      'where'
      '  IDSAIDATEMPORARIA = :OLD_IDSAIDATEMPORARIA')
    InsertSQL.Strings = (
      'insert into SAIDATEMPORARIA'
      
        '  (IDSAIDATEMPORARIA, STPTERMO, STPDATA, IDTIPOSAIDATEMP, IDPESS' +
        'OA, IDLOCALIZACAO, '
      '   IDRESPONSAVEL, STPOBSERVACOES, STPDATARETORNO)'
      'values'
      
        '  (:IDSAIDATEMPORARIA, :STPTERMO, :STPDATA, :IDTIPOSAIDATEMP, :I' +
        'DPESSOA, '
      
        '   :IDLOCALIZACAO, :IDRESPONSAVEL, :STPOBSERVACOES, :STPDATARETO' +
        'RNO)')
    DeleteSQL.Strings = (
      'delete from SAIDATEMPORARIA'
      'where'
      '  IDSAIDATEMPORARIA = :OLD_IDSAIDATEMPORARIA')
    Left = 320
    Top = 0
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'SAIDATEMPORARIA.STPTERMO'
      'SAIDATEMPORARIA.STPDATA'
      'LOCALIZACAO.NOME'
      'PESSOA.NOME')
    TipodeDado.Strings = (
      'N'
      'D'
      'C'
      'C')
    Descricao.Strings = (
      'Termo de Saída'
      'Data da Saída'
      'Local'
      'Responsável')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'SAIDATEMPORARIA'
      'LOCALIZACAO'
      'PESSOA')
    CamposChave.Strings = (
      'SAIDATEMPORARIA.IDSAIDATEMPORARIA')
    Filtro.Strings = (
      'SAIDATEMPORARIA.IDLOCALIZACAO=LOCALIZACAO.IDLOCALIZACAO(+)'
      'SAIDATEMPORARIA.IDRESPONSAVEL=PESSOA.IDPESSOA(+)')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '10'
      '60'
      '60')
    Left = 384
    Top = 0
  end
  inherited ds: TwwDataSource
    Left = 288
    Top = 0
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 526
    Top = 114
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 408
    Top = 108
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
    Left = 392
    Top = 56
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
  object qryDet: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT S.IDSAIDATEMPORARIA,'
      '       S.IDBEM,'
      '       S.IDPESSOA,'
      '       S.STBCUSTO,'
      '       S.STBDATARETORNO,'
      '       B.PLACA,     '
      '       B.DESBEM'
      'FROM   SAIDATEMPBENS S, BEM B'
      'WHERE (S.IDSAIDATEMPORARIA = :PIDSAIDATEMP)'
      '  AND (S.IDBEM    = B.IDBEM)'
      '  AND (S.IDPESSOA = B.IDPESSOA)'
      '')
    UpdateObject = updDet
    ValidateWithMask = True
    Left = 448
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDSAIDATEMP'
        ParamType = ptUnknown
      end>
    object qryDetPLACA: TFloatField
      DisplayLabel = 'Placa'
      DisplayWidth = 15
      FieldName = 'PLACA'
      Origin = '"CM.BEM".PLACA'
    end
    object qryDetDESBEM: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 73
      FieldName = 'DESBEM'
      Origin = '"CM.BEM".DESBEM'
      Size = 200
    end
    object qryDetIDSAIDATEMPORARIA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDSAIDATEMPORARIA'
      Origin = 'SAIDATEMPBENS.IDSAIDATEMPORARIA'
      Visible = False
    end
    object qryDetIDBEM: TFloatField
      DisplayWidth = 10
      FieldName = 'IDBEM'
      Origin = 'SAIDATEMPBENS.IDBEM'
      Visible = False
    end
    object qryDetIDPESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      Origin = 'SAIDATEMPBENS.IDPESSOA'
      Visible = False
    end
    object qryDetSTBCUSTO: TFloatField
      DisplayWidth = 10
      FieldName = 'STBCUSTO'
      Origin = 'SAIDATEMPBENS.STBCUSTO'
      Visible = False
    end
    object qryDetSTBDATARETORNO: TDateTimeField
      DisplayWidth = 10
      FieldName = 'STBDATARETORNO'
      Origin = 'SAIDATEMPBENS.STBDATARETORNO'
      Visible = False
    end
  end
  object updDet: TUpdateSQL
    ModifySQL.Strings = (
      'update SAIDATEMPBENS'
      'set'
      '  IDSAIDATEMPORARIA = :IDSAIDATEMPORARIA,'
      '  IDBEM = :IDBEM,'
      '  IDPESSOA = :IDPESSOA,'
      '  STBCUSTO = :STBCUSTO,'
      '  STBDATARETORNO = :STBDATARETORNO'
      'where'
      '  IDSAIDATEMPORARIA = :OLD_IDSAIDATEMPORARIA and'
      '  IDBEM = :OLD_IDBEM and'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into SAIDATEMPBENS'
      '  (IDSAIDATEMPORARIA, IDBEM, IDPESSOA, STBCUSTO, STBDATARETORNO)'
      'values'
      
        '  (:IDSAIDATEMPORARIA, :IDBEM, :IDPESSOA, :STBCUSTO, :STBDATARET' +
        'ORNO)')
    DeleteSQL.Strings = (
      'delete from SAIDATEMPBENS'
      'where'
      '  IDSAIDATEMPORARIA = :OLD_IDSAIDATEMPORARIA and'
      '  IDBEM = :OLD_IDBEM and'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 528
  end
  object MSLocal: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
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
      '(LOCALIZACAO.IDEMPRESA = CENTCUST.IDEMPRESA(+))'
      'LOCALIZACAO.FLGLOCSAITEMP = 1')
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
    Left = 496
    Top = 56
  end
  object dsLocal: TwwDataSource
    AutoEdit = False
    DataSet = qryLocal
    Left = 443
    Top = 56
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
    Left = 96
    Top = 104
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
    Left = 144
    Top = 104
  end
  object MSResponsavel: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
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
    Left = 216
    Top = 105
  end
  object qrySelMotivo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDTIPOSAIDATEMP,'
      '       DESCTIPSAITEMP'
      'FROM TIPOSAIDATEMP'
      'ORDER BY DESCTIPSAITEMP'
      '')
    ValidateWithMask = True
    Left = 667
    Top = 66
    object qrySelMotivoDESCTIPSAITEMP: TStringField
      DisplayLabel = 'Motivo para Saída Temporária'
      DisplayWidth = 60
      FieldName = 'DESCTIPSAITEMP'
      Origin = 'TIPOSAIDATEMP.DESCTIPSAITEMP'
      Size = 60
    end
    object qrySelMotivoIDTIPOSAIDATEMP: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOSAIDATEMP'
      Origin = 'TIPOSAIDATEMP.IDTIPOSAIDATEMP'
      Visible = False
    end
  end
  object dsSelMotivo: TwwDataSource
    AutoEdit = False
    DataSet = qrySelMotivo
    Left = 667
    Top = 53
  end
  object qryPlaca: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDBEM'
      'FROM BEM'
      'WHERE (PLACA = :PPLACA)')
    ValidateWithMask = True
    Left = 96
    Top = 376
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
      '       BEM.PLACA, CONJUNTO.DESCCONJUNTO,'
      '       BEM.DESBEM, LOCALIZACAO.NOME AS DESCLOCALIZACAO,'
      '       PESSOA.NOME AS NOMERESPONSAVEL'
      'FROM BEM, CONJUNTO, LOCALIZACAO, PESSOA'
      'WHERE (BEM.IDPESSOA = :PIDPESSOA)'
      '  AND (BEM.IDBEM    = :PIDBEM)'
      '  AND ((BEM.BAIXATOTAL <> '#39'S'#39') OR (BEM.BAIXATOTAL IS NULL))'
      '  AND (BEM.IDCONJUNTO         = CONJUNTO.IDCONJUNTO)'
      '  AND (CONJUNTO.IDLOCALIZACAO = LOCALIZACAO.IDLOCALIZACAO(+))'
      '  AND (CONJUNTO.IDRESPONSAVEL = PESSOA.IDPESSOA(+))')
    ValidateWithMask = True
    Left = 168
    Top = 376
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
  end
  object dsSelBem: TwwDataSource
    AutoEdit = False
    DataSet = qrySelBem
    Left = 232
    Top = 376
  end
  object qryBensFora: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT COUNT(IDBEM) AS BENSNAORETORNADOS'
      'FROM SAIDATEMPBENS'
      'WHERE (IDSAIDATEMPORARIA = :PIDSAIDATEMP)'
      '  AND (STBDATARETORNO IS NULL)')
    ValidateWithMask = True
    Left = 627
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDSAIDATEMP'
        ParamType = ptUnknown
      end>
    object qryBensForaBENSNAORETORNADOS: TFloatField
      FieldName = 'BENSNAORETORNADOS'
      Origin = 'SAIDATEMPBENS.IDBEM'
    end
  end
end
