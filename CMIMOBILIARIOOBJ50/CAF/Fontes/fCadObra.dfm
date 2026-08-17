inherited frmCadObra: TfrmCadObra
  Left = 134
  Top = 83
  HelpContext = 70043
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Cadastro de Obras'
  ClientHeight = 447
  ClientWidth = 763
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
    Width = 763
    Height = 361
    inherited pnlMestre: TPanel
      Width = 761
      Height = 140
      object Label1: TLabel
        Left = 16
        Top = 8
        Width = 107
        Height = 13
        Caption = 'Descrição da Obra'
      end
      object Label8: TLabel
        Left = 384
        Top = 48
        Width = 129
        Height = 13
        Caption = 'Grupo Contábil Padrão'
      end
      object Label18: TLabel
        Left = 384
        Top = 88
        Width = 100
        Height = 13
        Caption = 'SubConta Padrão'
      end
      object Label17: TLabel
        Left = 16
        Top = 88
        Width = 148
        Height = 13
        Caption = 'Atividade/ Projeto Padrão'
      end
      object Label2: TLabel
        Left = 384
        Top = 8
        Width = 83
        Height = 13
        Caption = 'Data de Início'
      end
      object edDescGrupo: TwwDBEdit
        Left = 384
        Top = 64
        Width = 337
        Height = 21
        DataField = 'NOME'
        DataSource = dsGrupo
        TabOrder = 4
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object bbtnSelGrupo: TBitBtn
        Left = 720
        Top = 64
        Width = 21
        Height = 21
        TabOrder = 1
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
      object edDescSubConta: TwwDBEdit
        Left = 384
        Top = 104
        Width = 337
        Height = 21
        DataField = 'NOMESUBCONTA'
        DataSource = dsSubConta
        TabOrder = 6
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object bbtnSelSubConta: TBitBtn
        Left = 720
        Top = 104
        Width = 21
        Height = 21
        TabOrder = 3
        OnClick = bbtnSelSubContaClick
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
      object edAtivProjeto: TwwDBEdit
        Left = 16
        Top = 104
        Width = 337
        Height = 21
        DataField = 'NOME'
        DataSource = dsAtivProj
        TabOrder = 5
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object bbtnSelAtivProjeto: TBitBtn
        Left = 352
        Top = 104
        Width = 21
        Height = 21
        TabOrder = 2
        OnClick = bbtnSelAtivProjetoClick
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
      object dbeDtaInicioObra: TCMDateTimePicker
        Left = 384
        Top = 24
        Width = 121
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        DataField = 'DTAINICIOOBRA'
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
        TabOrder = 7
      end
      object dbeDescObra: TwwDBRichEdit
        Left = 16
        Top = 24
        Width = 361
        Height = 60
        AutoURLDetect = False
        DataField = 'DESCCAFOBRA'
        DataSource = ds
        PrintJobName = 'Delphi 5'
        TabOrder = 0
        EditorCaption = 'Edit Rich Text'
        EditorPosition.Left = 0
        EditorPosition.Top = 0
        EditorPosition.Width = 0
        EditorPosition.Height = 0
        MeasurementUnits = muInches
        PrintMargins.Top = 1
        PrintMargins.Bottom = 1
        PrintMargins.Left = 1
        PrintMargins.Right = 1
        RichEditVersion = 2
        Data = {
          810000007B5C727466315C616E73695C616E7369637067313235325C64656666
          305C6465666C616E67313034367B5C666F6E7474626C7B5C66305C666E696C20
          4D532053616E732053657269663B7D7D0D0A5C766965776B696E64345C756331
          5C706172645C625C66305C6673313420646265446573634F6272615C7061720D
          0A7D0D0A00}
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 141
      Width = 761
      Height = 219
      Tabs.Strings = (
        'Rateio de Custos')
      inherited Dock973: TDock97 [0]
        Width = 753
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
        BackgroundTransparent = True
      end
      inherited Dock974: TDock97 [1]
        Left = 667
        Height = 160
      end
      inherited pgctrlDetalhe: TPageControl [2]
        Width = 663
        Height = 160
        inherited tbsDet: TTabSheet
          Caption = 'Rateio de Custos'
          inherited pnlControlesDet: TPanel [0]
            Width = 655
            Height = 132
            object Label13: TLabel
              Left = 16
              Top = 8
              Width = 92
              Height = 13
              Caption = 'Centro de Custo'
            end
            object Label14: TLabel
              Left = 16
              Top = 56
              Width = 62
              Height = 13
              Caption = 'Percentual'
            end
            object Label7: TLabel
              Left = 94
              Top = 77
              Width = 14
              Height = 16
              Caption = '%'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -13
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object dbeCentroCusto: TwwDBEdit
              Left = 16
              Top = 24
              Width = 233
              Height = 21
              DataField = 'CODEXTERNO'
              DataSource = dsSelCCusto
              TabOrder = 2
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object bbtnTreeCcusto: TBitBtn
              Left = 248
              Top = 24
              Width = 21
              Height = 21
              TabOrder = 0
              OnClick = bbtnTreeCcustoClick
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
            object dbeParticipacao: TDBRealEdit
              Left = 16
              Top = 72
              Width = 73
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              TabOrder = 1
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'PARTICIPACAO'
              DataSource = dsDet
            end
            object GroupBox1: TGroupBox
              Left = 280
              Top = 8
              Width = 281
              Height = 41
              Caption = 'Descrição do Centro de Custo'
              TabOrder = 4
              object lblCentroCusto: TLabel
                Left = 8
                Top = 16
                Width = 83
                Height = 13
                Caption = 'lblCentroCusto'
              end
            end
            object treeCentroCusto: TCMTreeView
              Left = 280
              Top = 8
              Width = 281
              Height = 113
              PodeNavegar = True
              DataSource = dsTreeCCusto
              CampoChave = qryTreeCCustoCODEXTERNO
              CampoDescricao = qryTreeCCustoNOME
              CampoTipo = qryTreeCCustoTIPO
              OnDblClick = treeCentroCustoDblClick
              OnExit = treeCentroCustoExit
              Visible = False
            end
          end
          inherited dbgrdDet: TwwDBGrid [1]
            Width = 655
            Height = 132
            Selected.Strings = (
              'CODEXTERNO'#9'10'#9'Centro de Custo'#9'F'
              'DESCCCUSTO'#9'62'#9'Descrição'#9'F'
              'PARTICIPACAO'#9'10'#9'Participação (%)'#9'F')
            Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            TitleAlignment = taCenter
          end
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 763
  end
  inherited Dock971: TDock97
    Top = 408
    Width = 763
    inherited tb97Fundo: TToolbar97
      Left = 579
      DockPos = 579
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 70043
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 410
      DockPos = 410
    end
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
  inherited dsDet: TwwDataSource
    DataSet = qryDet
    Left = 480
    Top = 0
  end
  inherited ds: TwwDataSource
    Left = 288
    Top = 0
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update CAFOBRA'
      'set'
      '  IDMODULO = :IDMODULO,'
      '  IDGRUPO = :IDGRUPO,'
      '  CODSUBCONTA = :CODSUBCONTA,'
      '  UNIDNEGOC = :UNIDNEGOC,'
      '  DESCCAFOBRA = :DESCCAFOBRA,'
      '  DTAINICIOOBRA = :DTAINICIOOBRA,'
      '  DTAENCERRAOBRA = :DTAENCERRAOBRA,'
      '  FLGOBRA = :FLGOBRA,'
      '  IDTIPOCUSTORECIMO = :IDTIPOCUSTORECIMO,'
      '  IDIMOVEL = :IDIMOVEL'
      'where'
      '  IDCAFOBRA = :OLD_IDCAFOBRA and'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into CAFOBRA'
      
        '  (IDCAFOBRA, IDPESSOA, IDMODULO, IDGRUPO, CODSUBCONTA, UNIDNEGO' +
        'C, DESCCAFOBRA, '
      
        '   DTAINICIOOBRA, DTAENCERRAOBRA, FLGOBRA, IDTIPOCUSTORECIMO, ID' +
        'IMOVEL)'
      'values'
      
        '  (:IDCAFOBRA, :IDPESSOA, :IDMODULO, :IDGRUPO, :CODSUBCONTA, :UN' +
        'IDNEGOC, '
      
        '   :DESCCAFOBRA, :DTAINICIOOBRA, :DTAENCERRAOBRA, :FLGOBRA, :IDT' +
        'IPOCUSTORECIMO, '
      '   :IDIMOVEL)')
    DeleteSQL.Strings = (
      'delete from CAFOBRA'
      'where'
      '  IDCAFOBRA = :OLD_IDCAFOBRA and'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 320
    Top = 0
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'CAFOBRA.DESCCAFOBRA'
      'CAFOBRA.DTAINICIOOBRA'
      'CAFOBRA.DTAENCERRAOBRA')
    TipodeDado.Strings = (
      'C'
      'D'
      'D')
    Descricao.Strings = (
      'Descrição'
      'Data de Inicio'
      'Data de Encerramento')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'CAFOBRA')
    CamposChave.Strings = (
      'CAFOBRA.IDCAFOBRA'
      'CAFOBRA.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '40'
      '18'
      '18')
    Left = 376
    Top = 0
  end
  inherited ImlPadrao: TImageList
    Left = 737
    Top = 466
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 600
    Top = 0
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT IDCAFOBRA,'
      '       IDPESSOA,'
      '       IDMODULO,   '
      '       IDGRUPO,'
      '       CODSUBCONTA,'
      '       UNIDNEGOC,'
      '       DESCCAFOBRA,'
      '       DTAINICIOOBRA,'
      '       DTAENCERRAOBRA,'
      '       FLGOBRA,'
      '       IDTIPOCUSTORECIMO,'
      '       IDIMOVEL'
      'FROM   CAFOBRA'
      'WHERE  (IDCAFOBRA = :PIDCAFOBRA)'
      ' '
      ' ')
    UpdateMode = upWhereKeyOnly
    Left = 256
    Top = 0
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCAFOBRA'
        ParamType = ptUnknown
      end>
    object qryIDCAFOBRA: TFloatField
      FieldName = 'IDCAFOBRA'
      Origin = 'BASEDADOS.CAFOBRA.IDCAFOBRA'
    end
    object qryIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.CAFOBRA.IDPESSOA'
    end
    object qryIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
      Origin = 'BASEDADOS.CAFOBRA.IDGRUPO'
    end
    object qryCODSUBCONTA: TFloatField
      FieldName = 'CODSUBCONTA'
      Origin = 'BASEDADOS.CAFOBRA.CODSUBCONTA'
    end
    object qryUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
      Origin = 'BASEDADOS.CAFOBRA.UNIDNEGOC'
    end
    object qryDESCCAFOBRA: TStringField
      FieldName = 'DESCCAFOBRA'
      Origin = 'BASEDADOS.CAFOBRA.DESCCAFOBRA'
      Size = 250
    end
    object qryDTAINICIOOBRA: TDateTimeField
      FieldName = 'DTAINICIOOBRA'
      Origin = 'BASEDADOS.CAFOBRA.DTAINICIOOBRA'
    end
    object qryDTAENCERRAOBRA: TDateTimeField
      FieldName = 'DTAENCERRAOBRA'
      Origin = 'BASEDADOS.CAFOBRA.DTAENCERRAOBRA'
    end
    object qryFLGOBRA: TFloatField
      FieldName = 'FLGOBRA'
      Origin = 'BASEDADOS.CAFOBRA.FLGOBRA'
    end
    object qryIDMODULO: TFloatField
      FieldName = 'IDMODULO'
    end
    object qryIDTIPOCUSTORECIMO: TFloatField
      FieldName = 'IDTIPOCUSTORECIMO'
      Origin = 'BASEDADOS.CAFOBRA.IDTIPOCUSTORECIMO'
    end
    object qryIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
      Origin = 'BASEDADOS.CAFOBRA.IDIMOVEL'
    end
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 680
    Top = 0
  end
  object qryDet: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT RO.IDCAFOBRA,RO.IDPESSOA,'
      '       RO.CODCENTROCUSTO,RO.IDEMPRESA,'
      '       RO.PARTICIPACAO, CC.CODEXTERNO,'
      '       CC.NOME AS DESCCCUSTO'
      'FROM   CAFOBRARATEIO RO, CENTCUST CC'
      'WHERE (RO.IDCAFOBRA      = :PIDCAFOBRA)'
      '  AND (RO.IDEMPRESA      = CC.IDEMPRESA)'
      '  AND (RO.CODCENTROCUSTO = CC.CODCENTROCUSTO)'
      ' ')
    UpdateObject = updDet
    ValidateWithMask = True
    Left = 440
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCAFOBRA'
        ParamType = ptUnknown
      end>
    object qryDetCODEXTERNO: TStringField
      DisplayLabel = 'Centro de Custo'
      DisplayWidth = 10
      FieldName = 'CODEXTERNO'
      Origin = 'BASEDADOS.CENTCUST.CODEXTERNO'
      FixedChar = True
      Size = 10
    end
    object qryDetDESCCCUSTO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 62
      FieldName = 'DESCCCUSTO'
      Origin = 'BASEDADOS.CENTCUST.NOME'
      Size = 30
    end
    object qryDetPARTICIPACAO: TFloatField
      DisplayLabel = 'Participação (%)'
      DisplayWidth = 10
      FieldName = 'PARTICIPACAO'
      Origin = 'BASEDADOS.CAFOBRARATEIO.PARTICIPACAO'
    end
    object qryDetCODCENTROCUSTO: TStringField
      DisplayLabel = 'Centro de Custo'
      DisplayWidth = 14
      FieldName = 'CODCENTROCUSTO'
      Origin = 'BASEDADOS.CAFOBRARATEIO.CODCENTROCUSTO'
      Visible = False
      FixedChar = True
      Size = 10
    end
    object qryDetIDCAFOBRA: TFloatField
      FieldName = 'IDCAFOBRA'
      Origin = 'BASEDADOS.CAFOBRARATEIO.IDCAFOBRA'
      Visible = False
    end
    object qryDetIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.CAFOBRARATEIO.IDPESSOA'
      Visible = False
    end
    object qryDetIDEMPRESA: TFloatField
      FieldName = 'IDEMPRESA'
      Origin = 'BASEDADOS.CAFOBRARATEIO.IDEMPRESA'
      Visible = False
    end
  end
  object updDet: TUpdateSQL
    ModifySQL.Strings = (
      'update CAFOBRARATEIO'
      'set'
      '  PARTICIPACAO = :PARTICIPACAO'
      'where'
      '  IDCAFOBRA = :OLD_IDCAFOBRA and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDEMPRESA = :OLD_IDEMPRESA and'
      '  CODCENTROCUSTO = :OLD_CODCENTROCUSTO')
    InsertSQL.Strings = (
      'insert into CAFOBRARATEIO'
      '  (IDCAFOBRA, IDPESSOA, IDEMPRESA, CODCENTROCUSTO, PARTICIPACAO)'
      'values'
      
        '  (:IDCAFOBRA, :IDPESSOA, :IDEMPRESA, :CODCENTROCUSTO, :PARTICIP' +
        'ACAO)')
    DeleteSQL.Strings = (
      'delete from CAFOBRARATEIO'
      'where'
      '  IDCAFOBRA = :OLD_IDCAFOBRA and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDEMPRESA = :OLD_IDEMPRESA and'
      '  CODCENTROCUSTO = :OLD_CODCENTROCUSTO')
    Left = 520
  end
  object qrySelCCusto: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODCENTROCUSTO, NOME, CODEXTERNO'
      'FROM  CENTCUST'
      'WHERE (IDEMPRESA      = :PIDEMPRESA)'
      '  AND (LTRIM(RTRIM(CODCENTROCUSTO)) = :PCODCENTROCUSTO)'
      '  AND (ATIVO          = '#39'S'#39')'
      '  AND (STATUSGRUPOCDC = '#39'A'#39')'
      '')
    ValidateWithMask = True
    Left = 400
    Top = 248
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDEMPRESA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PCODCENTROCUSTO'
        ParamType = ptUnknown
      end>
    object qrySelCCustoCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      Size = 10
    end
    object qrySelCCustoNOME: TStringField
      FieldName = 'NOME'
      Size = 30
    end
    object qrySelCCustoCODEXTERNO: TStringField
      FieldName = 'CODEXTERNO'
      FixedChar = True
      Size = 10
    end
  end
  object dsSelCCusto: TwwDataSource
    AutoEdit = False
    DataSet = qrySelCCusto
    Left = 400
    Top = 296
  end
  object qryParamGlobal: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT MASCARACC'
      'FROM   PARAMGLOBAL'
      'WHERE  (IDPESSOA = :PIDEMPRESA)')
    ValidateWithMask = True
    Left = 520
    Top = 248
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDEMPRESA'
        ParamType = ptUnknown
      end>
    object qryParamGlobalMASCARACC: TStringField
      FieldName = 'MASCARACC'
      Origin = 'PARAMGLOBAL.MASCARACC'
      Size = 18
    end
  end
  object qryTreeCCusto: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT IDEMPRESA, CODCENTROCUSTO, CODEXTERNO, NOME, STATUSGRUPOC' +
        'DC AS TIPO'
      'FROM  CENTCUST C, PARAMGLOBAL P'
      'WHERE (IDEMPRESA = :PIDEMPRESA)'
      '  AND (ATIVO     = '#39'S'#39')'
      '  AND P.IDPESSOA = C.IDEMPRESA'
      '  AND P.IDPLANCENTCUST = C.IDPLANCENTCUST'
      ' ORDER BY CODEXTERNO'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 328
    Top = 248
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDEMPRESA'
        ParamType = ptUnknown
      end>
    object qryTreeCCustoIDEMPRESA: TFloatField
      FieldName = 'IDEMPRESA'
    end
    object qryTreeCCustoCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      Size = 10
    end
    object qryTreeCCustoNOME: TStringField
      FieldName = 'NOME'
      Size = 30
    end
    object qryTreeCCustoTIPO: TStringField
      FieldName = 'TIPO'
      Size = 1
    end
    object qryTreeCCustoCODEXTERNO: TStringField
      FieldName = 'CODEXTERNO'
      Origin = 'BASEDADOS.CENTCUST.CODEXTERNO'
      FixedChar = True
      Size = 10
    end
  end
  object dsTreeCCusto: TwwDataSource
    AutoEdit = False
    DataSet = qryTreeCCusto
    Left = 328
    Top = 296
  end
  object MSSubConta: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'SubConta'
    Colunas.Strings = (
      'SUBCONTA.NOMESUBCONTA')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Descrição')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'SUBCONTA')
    CamposChave.Strings = (
      'SUBCONTA.CODSUBCONTA')
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
    Left = 672
    Top = 136
  end
  object MSAtivProjeto: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Atividade/Projeto'
    Colunas.Strings = (
      'UNIDNEGOCIO.NOME'
      'UNIDNEGOCIO.UNECODIGO')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Descrição'
      'Código')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'UNIDNEGOCIO')
    CamposChave.Strings = (
      'UNIDNEGOCIO.UNIDNEGOC')
    Filtro.Strings = (
      'UNETIPO = '#39'A'#39)
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '25'
      '10')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 264
    Top = 128
  end
  object dsAtivProj: TwwDataSource
    AutoEdit = False
    DataSet = qrySelAtivProj
    Left = 200
    Top = 128
  end
  object dsSubConta: TwwDataSource
    AutoEdit = False
    DataSet = qrySelSubConta
    Left = 600
    Top = 136
  end
  object dsGrupo: TwwDataSource
    AutoEdit = False
    DataSet = qrySelGrupo
    Left = 624
    Top = 88
  end
  object qrySelGrupo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT G.NOME, G.IDGRUPO, G.DEPRECIACAO, G.ULTIDBEM, G.CLASSE, G' +
        '.FLGSEMPLACA'
      'FROM  GRUPO G, PLANOGRUPO P'
      'WHERE (G.IDGRUPO = :PIDGRUPO)'
      '  AND (P.IDPESSOA = :PIDPESSOA)'
      '  AND (G.STATUS   = '#39'A'#39')'
      '  AND (G.TIPO     = '#39'A'#39')'
      '  AND (P.IDGRUPO  = G.IDGRUPO)'
      'ORDER BY G.CLASSE')
    ValidateWithMask = True
    Left = 560
    Top = 88
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDGRUPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
    object qrySelGrupoNOME: TStringField
      FieldName = 'NOME'
      Origin = 'GRUPO.NOME'
      Size = 60
    end
    object qrySelGrupoIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
      Origin = 'GRUPO.IDGRUPO'
    end
    object qrySelGrupoDEPRECIACAO: TFloatField
      FieldName = 'DEPRECIACAO'
      Origin = 'GRUPO.DEPRECIACAO'
    end
    object qrySelGrupoULTIDBEM: TFloatField
      FieldName = 'ULTIDBEM'
      Origin = 'GRUPO.ULTIDBEM'
    end
    object qrySelGrupoCLASSE: TStringField
      FieldName = 'CLASSE'
      Origin = 'GRUPO.CLASSE'
      Size = 15
    end
    object qrySelGrupoFLGSEMPLACA: TFloatField
      FieldName = 'FLGSEMPLACA'
      Origin = 'GRUPO.FLGSEMPLACA'
    end
  end
  object qrySelSubConta: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT NOMESUBCONTA, IDPESSOA,CODSUBCONTA'
      'FROM SUBCONTA'
      'WHERE (IDPESSOA    = :PIDPESSOA)'
      '  AND (CODSUBCONTA = :PSUBCONTA)')
    ValidateWithMask = True
    Left = 520
    Top = 136
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PSUBCONTA'
        ParamType = ptUnknown
      end>
    object qrySelSubContaNOMESUBCONTA: TStringField
      FieldName = 'NOMESUBCONTA'
      Origin = '"CM.SUBCONTA".NOMESUBCONTA'
      Size = 60
    end
    object qrySelSubContaIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = '"CM.SUBCONTA".IDPESSOA'
    end
    object qrySelSubContaCODSUBCONTA: TFloatField
      FieldName = 'CODSUBCONTA'
      Origin = '"CM.SUBCONTA".CODSUBCONTA'
    end
  end
  object qrySelAtivProj: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT NOME,UNIDNEGOC, IDPESSOA,UNECODIGO'
      'FROM UNIDNEGOCIO'
      'WHERE (IDPESSOA  =  :PIDPESSOA)'
      '  AND (UNIDNEGOC = :PIDATIVPROJETO)'
      '  AND (UNETIPO = '#39'A'#39')'
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 136
    Top = 128
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDATIVPROJETO'
        ParamType = ptUnknown
      end>
    object qrySelAtivProjNOME: TStringField
      DisplayLabel = 'Atividade/Projeto'
      DisplayWidth = 25
      FieldName = 'NOME'
      Origin = '"CM.UNIDNEGOCIO".NOME'
      Size = 25
    end
    object qrySelAtivProjUNECODIGO: TStringField
      DisplayLabel = 'Hierarquia'
      DisplayWidth = 10
      FieldName = 'UNECODIGO'
      Origin = '"CM.UNIDNEGOCIO".UNECODIGO'
      Size = 10
    end
    object qrySelAtivProjUNIDNEGOC: TFloatField
      DisplayWidth = 10
      FieldName = 'UNIDNEGOC'
      Origin = '"CM.UNIDNEGOCIO".UNIDNEGOC'
      Visible = False
    end
    object qrySelAtivProjIDPESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      Origin = '"CM.UNIDNEGOCIO".IDPESSOA'
      Visible = False
    end
  end
  object MSGrupos: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Grupo Contábil'
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
      'GRUPO')
    CamposChave.Strings = (
      'GRUPO.IDGRUPO')
    Filtro.Strings = (
      'GRUPO.TIPO = '#39'A'#39)
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
    Left = 680
    Top = 88
  end
  object qryObraLanc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDOBRALANC'
      'FROM CAFOBRALANC'
      'WHERE (IDCAFOBRA = :PIDCAFOBRA)'
      '  AND (IDPESSOA  = :PIDPESSOA)'
      '')
    ValidateWithMask = True
    Left = 208
    Top = 56
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCAFOBRA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
    object qryObraLancIDOBRALANC: TFloatField
      FieldName = 'IDOBRALANC'
      Origin = 'BASEDADOS.CAFOBRALANC.IDOBRALANC'
    end
  end
end
