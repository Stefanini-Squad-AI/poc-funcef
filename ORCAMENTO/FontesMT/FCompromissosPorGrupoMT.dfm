inherited FrmCompromissosPorGrupoMT: TFrmCompromissosPorGrupoMT
  Left = 265
  Top = 99
  HelpContext = 520051
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  Caption = 'Compromisso Orçamentário - Especial'
  ClientHeight = 465
  ClientWidth = 704
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 704
    Height = 151
    Align = alTop
    object Label1: TLabel
      Left = 5
      Top = 8
      Width = 112
      Height = 13
      Caption = 'Grupo orçamentário'
    end
    object btBuscGrupo: TSpeedButton
      Left = 173
      Top = 22
      Width = 35
      Height = 24
      Hint = 'Procurar por um grupo de contas orçamentárias'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
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
      OnClick = btBuscGrupoClick
    end
    object Label4: TLabel
      Left = 213
      Top = 52
      Width = 80
      Height = 13
      Caption = 'Patrocinadora'
    end
    object Label3: TLabel
      Left = 5
      Top = 52
      Width = 118
      Height = 13
      Caption = 'Plano Previdenciário'
    end
    object Label20: TLabel
      Left = 420
      Top = 8
      Width = 46
      Height = 13
      Caption = 'Período'
    end
    object Label22: TLabel
      Left = 554
      Top = 8
      Width = 55
      Height = 13
      Caption = 'Exercício'
    end
    object Label5: TLabel
      Left = 900
      Top = 8
      Width = 79
      Height = 13
      Caption = 'Observações:'
    end
    object lbl2: TLabel
      Left = 623
      Top = 52
      Width = 98
      Height = 13
      Caption = 'Atividade Projeto'
    end
    object lbl3: TLabel
      Left = 5
      Top = 96
      Width = 54
      Height = 13
      Caption = 'Programa'
    end
    object lbl4: TLabel
      Left = 213
      Top = 96
      Width = 97
      Height = 13
      Caption = 'Tipo de Despesa'
    end
    object lblPlanoOrcamentario: TLabel
      Left = 213
      Top = 8
      Width = 112
      Height = 13
      Caption = 'Plano Orçamentário'
    end
    object lblCentroCusto: TLabel
      Left = 420
      Top = 52
      Width = 92
      Height = 13
      Caption = 'Centro de Custo'
    end
    object lblFornecedoresSubDespesas: TLabel
      Left = 420
      Top = 96
      Width = 165
      Height = 13
      Caption = 'Fornecedores/Sub-Despesas'
    end
    object btBuscForn: TSpeedButton
      Left = 573
      Top = 109
      Width = 35
      Height = 24
      Hint = 'Procurar por Fornecedores/Sub-Despesas'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
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
      OnClick = btBuscFornClick
    end
    object edtDescGrupo: TEdit
      Left = 5
      Top = 24
      Width = 166
      Height = 21
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 0
    end
    object cboPatro: TCMDBLookupCombo
      Left = 213
      Top = 68
      Width = 197
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'60'#9'Nome'#9'F')
      LookupTable = CdsPatro
      LookupField = 'IDPATRO'
      Options = [loTitles]
      Style = csDropDownList
      ParentShowHint = False
      ShowHint = False
      TabOrder = 4
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object cboPlanoPrevidenciario: TCMDBLookupCombo
      Left = 5
      Top = 68
      Width = 205
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'50'#9'Nome'#9'F')
      LookupTable = CdsPlano
      LookupField = 'IDPLANOPREV'
      Options = [loTitles]
      Style = csDropDownList
      ParentShowHint = False
      ShowHint = False
      TabOrder = 3
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object btSelContas: TBitBtn
      Left = 623
      Top = 104
      Width = 225
      Height = 33
      Hint = 'Seleciona as contas orçamentárias do grupo selecionado'
      Caption = 'Selecionar contas orçamentárias'
      TabOrder = 9
      OnClick = btSelContasClick
      Glyph.Data = {
        DA060000424DDA06000000000000360000002800000016000000190000000100
        180000000000A406000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFF
        FFFFFFFFFFFFFF837272684C4C999596FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7
        F7FBE6EAF5E5E9F4F8F8FBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        0000FFFFFFFFFFFFFFFFFF64585848333386827FEBEBF2EBEBF2F6F7FBDEE0ED
        A9B0D37286C24D77C84E86D77893CCBDC3DFF4F5FAFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF0000FFFFFFFFFFFFFFFFFF606161393938A9A59E7081B97081B96E89
        C74D87D71E69D4124DBA1243AE2068CF3899F553A3ED7B9ED3C3C6DDC3C6DDFF
        FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFF707171525352B0A9A680CAF280
        CAF277CFFF5ABDFF4FA7F5438ED8438BCE5186C56C95CA8CBBDC7DB9E279AEDC
        79AEDCFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFF8182827B7A7ABDB8B7
        A7E7F1A7E7F1B7FAFFB3EEFFB2EBFBA8E0F1AEDDEEB7D1E5D9DBE5E3DDDEA7AD
        B790AFC990AFC9FFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFF9191918787
        86A6A5A2B0B7D0B0B7D0A9B1D2B9C0D1D1D6DDD3D6DBE8E3E3EFEAEAFBF9F9FF
        FFFFEEE9E4C2C0C6C2C0C6FFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFE5
        E5E5DBDBDBEDEDECFFFFFFFFFFFFEBEAF1C4C0C6F1EDECFFFFFFFFFFFFFFFFFF
        FFFFFFF0F0F0FFFFFECFCECBCFCECBFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEED7D7D5FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2F2F2D3D0D1A49C9A7A80936B789F
        164CFFBF8577164CFF493328574238786861A39A96CAC6C5FFFFFFFFFFFFFFFF
        FFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFAFAFAAACCF1164CFF164CFF164C
        FF3784FFEEBF9EBF8577C4B0B53784FF5A50524D382E6B5A53928884A9A2A1FF
        FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFE8F0F63884FFDBBEA9FF
        DCAFFDE0B8FEECC8FDEBD5ECB081FFE1B9F8F1EA7CA7FF63718E4630265F4D45
        6F605DFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFCFCFCA9CCF54181F0
        FFDFB9FADDBAFDEECFFEF5E6ECC2A8F8C997FFE2C1FFF7EFFFFFFF7CA6FF80B3
        FF493A3252433DFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFF8F8F9439C
        F9439CF9FFECD3FFEEDBFFFBF6FFFEFDDD9F75FEDBAFFFECD7FFF8F1FFFDFCFF
        FFFF4E9CFF506D9052423BFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFDB
        E8F44092FAF8E0C8FFF2E2FFFBF6FFFEFEF2DCCCF5C899FFE9CCFFFBF7FFFEFE
        FFFFFFEDF5FF3091FF4D525F63534EFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
        FFFFFF9CC9F1439CF9FFF8F2FFFAF5FFF9F4FDF9F6EBC2A3FEDCAFFFF3E3FFFD
        FCFFFFFFFFFFFF8CC3FF5BACFF5A483F81746FFFFFFFFFFFFFFFFFFF0000FFFF
        FFFFFFFFFFFFFF439CF9E1C9B5FFF3E7FFF3E8FFFCF9F3EAE5EEC8A5FFE8C9FF
        F4E8FFFAF5FFFFFFF9FCFF3A9DFF7D8EA272635CA49C98FFFFFFFFFFFFFFFFFF
        0000FFFFFFFFFFFFFFFFFF439CF9FFEEDDFFFFFFFFFFFFCCDDFF9DBAFFB2BCD9
        F8EDDFFFFEFDFFFFFFFFFFFFA5D2FF52ADFE5B4941918782C6C1BFFFFFFFFFFF
        FFFFFFFF0000FFFFFFFFFFFFFFFFFF3695FF7FC5FFB7C7E1B9C9E2CCC7C6D8D5
        D4D2D8E6C7DDFEC3DEFFFFFFFFFFFFFF53B0FF90AAC280746FB4AFACE0DEDEFF
        FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFDBEBFBF0F0F1EBEBEBEEEDEDF3
        F2F2F8F7F7FBFBFBFCFBFBD9E9FAAAD4FF7FC5FF65C2FFA3A3A4B2AEADD7D6D5
        F2F1F1FFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFD
        FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEF2F7FB7FC5FFBEDBF1DDDCDCE2E1
        E1F1F1F1FBFBFBFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFBFBFBF8F8F8F9
        F9F9FCFCFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000}
    end
    object cboPeriodo: TComboBox
      Left = 420
      Top = 24
      Width = 89
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      TabOrder = 1
      Items.Strings = (
        'ANUAL'
        'Janeiro'
        'Fevereiro'
        'Março'
        'Abril'
        'Maio'
        'Junho'
        'Julho'
        'Agosto'
        'Setembro'
        'Outubro'
        'Novembro'
        'Dezembro')
    end
    object edtExercicio: TDBRealEdit
      Left = 554
      Top = 24
      Width = 57
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '0')
      TabOrder = 2
      WordWrap = False
      IntDigits = 4
      DecDigits = 0
      NumberFormat = iNumber
      Signal = False
    end
    object mmObs: TMemo
      Left = 900
      Top = 24
      Width = 186
      Height = 118
      MaxLength = 300
      ScrollBars = ssVertical
      TabOrder = 10
    end
    object cboAtividadeProjeto: TCMDBLookupCombo
      Left = 623
      Top = 68
      Width = 225
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'20'#9'Atividade de Projeto'#9'F'
        'UNIDNEGOC'#9'8'#9'Código'#9'F')
      LookupTable = cdsAtividadeProj
      LookupField = 'UNIDNEGOC'
      Options = [loColLines, loRowLines, loTitles]
      Style = csDropDownList
      ParentShowHint = False
      ShowHint = False
      TabOrder = 5
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object cboPrograma: TCMDBLookupCombo
      Left = 5
      Top = 112
      Width = 205
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'PROGRAMA'#9'20'#9'Programa'#9'F')
      LookupTable = cdsPrograma
      LookupField = 'IDPROGRAMAORCAMEN'
      Options = [loColLines, loRowLines, loTitles]
      Style = csDropDownList
      ParentShowHint = False
      ShowHint = False
      TabOrder = 6
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object cboTipoDespesa: TCMDBLookupCombo
      Left = 213
      Top = 112
      Width = 197
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'TIPODESPESA'#9'15'#9'Tipo Despesa'#9'F')
      LookupTable = cdsTipoDespesa
      LookupField = 'IDTIPO_DEPESAORCAMEN'
      Options = [loColLines, loRowLines, loTitles]
      Style = csDropDownList
      ParentShowHint = False
      ShowHint = False
      TabOrder = 7
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object edtFornecedoresSubDespesas: TEdit
      Left = 420
      Top = 112
      Width = 153
      Height = 21
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 8
    end
    object cboPlanoOrcamentario: TCMDBLookupCombo
      Left = 216
      Top = 24
      Width = 197
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOMEPLANOORC'#9'25'#9'Plano Orçamentário'#9'F'
        'ANO'#9'3'#9'Ano'#9'F')
      LookupTable = cdsPlanoOrc
      LookupField = 'IDPLANOORCAMEN'
      Options = [loColLines, loRowLines, loTitles]
      Style = csDropDownList
      ParentShowHint = False
      ShowHint = False
      TabOrder = 11
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
      OnChange = cboPlanoOrcamentarioChange
    end
    object cboCentroCusto: TCMDBLookupCombo
      Left = 420
      Top = 68
      Width = 191
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'20'#9'Centro de Custo'#9'F')
      LookupTable = cdsCCusto
      LookupField = 'CODCENTROCUSTO'
      Options = [loColLines, loRowLines, loTitles]
      Style = csDropDownList
      ParentShowHint = False
      ShowHint = False
      TabOrder = 12
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
  end
  inherited Dock972: TDock97
    Width = 704
    inherited Toolbar971: TToolbar97
      inherited sbtnAlterar: TToolbarButton97
        Enabled = False
        Visible = False
      end
      inherited sbtnProcurar: TToolbarButton97
        Left = 120
      end
      inherited sbtnApagar: TToolbarButton97
        Left = 322
        Enabled = False
        Visible = False
      end
      object btCancelar: TToolbarButton97
        Left = 180
        Top = 0
        Width = 142
        Height = 41
        AllowAllUp = True
        GroupIndex = 1
        Caption = 'Cancelar compromisso'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888000008888888888F777778FF888888009191900
          88888887788888778F88887991919191088888788888888878F8879919191919
          108887F888F888F887F887917F919F719088878887FF87FF878F7919FFF9FFF9
          19087F88777F7778887F79919FFFFF9191087F8887777788887F791919FFF919
          19087F8888777FF8887F79919FFFFF9191087F88877777FF887F7919FFF9FFF9
          190878F877787778887887917F919F71908887F88788878887F8879919191919
          1088878F88888888878888799191919108888878FF88888F7888888779999977
          8888888778FFFF77888888888777778888888888877777888888}
        GlyphMask.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888000008888888888F777778FF888888009191900
          88888887788888778F88887991919191088888788888888878F8879919191919
          108887F888F888F887F887917F919F719088878887FF87FF878F7919FFF9FFF9
          19087F88777F7778887F79919FFFFF9191087F8887777788887F791919FFF919
          19087F8888777FF8887F79919FFFFF9191087F88877777FF887F7919FFF9FFF9
          190878F877787778887887917F919F71908887F88788878887F8879919191919
          1088878F88888888878888799191919108888878FF88888F7888888779999977
          8888888778FFFF77888888888777778888888888877777888888}
        Layout = blGlyphTop
        NumGlyphs = 2
        Opaque = False
        Spacing = 0
        OnClick = btCancelarClick
      end
    end
  end
  inherited Dock971: TDock97
    Top = 426
    Width = 704
    inherited tb97Fundo: TToolbar97
      Left = 367
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 520051
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  object PageControl: TPageControl [3]
    Left = 0
    Top = 230
    Width = 704
    Height = 196
    ActivePage = tbsCompSemReserv
    Align = alClient
    HotTrack = True
    Images = ImageList
    Style = tsFlatButtons
    TabHeight = 28
    TabOrder = 3
    OnChange = PageControlChange
    object tbsCompSemReserv: TTabSheet
      Caption = 'Compromissos sem reservas'
      object pnlBottom: TPanel
        Left = 0
        Top = 95
        Width = 696
        Height = 63
        Align = alBottom
        TabOrder = 0
        object Label6: TLabel
          Left = 16
          Top = 9
          Width = 106
          Height = 13
          Caption = 'Critério para rateio'
        end
        object Label7: TLabel
          Left = 296
          Top = 9
          Width = 124
          Height = 13
          Caption = 'Valor total para rateio'
        end
        object btCalcularRat: TSpeedButton
          Left = 440
          Top = 23
          Width = 95
          Height = 23
          Hint = 'Calcular critérios para rateio'
          Caption = 'Calcular'
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            0400000000008000000000000000000000001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
            77777777777777777777700000000000000766444444444444406E6666666666
            66406E60F0F0F067F0406E666666666666406E60F0F0F0F0F0406E6666666666
            66406E077777776666406E0FFFFFF76666406E000000006666406EEEEEEEEEEE
            EE60766666666666666777777777777777777777777777777777}
          OnClick = btCalcularRatClick
        end
        object Shape1: TShape
          Left = 750
          Top = 40
          Width = 27
          Height = -13
          Brush.Color = 14996162
        end
        object Label2: TLabel
          Left = 784
          Top = 27
          Width = 185
          Height = 13
          Caption = 'Conta Orçamentaria possui valor'
        end
        object cboRatCriter: TCMDBLookupCombo
          Left = 16
          Top = 25
          Width = 257
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'40'#9'Descrição'#9'F'
            'DESCTIPORAT'#9'19'#9'Tipo de Rateio'#9'F')
          LookupTable = CdsRatCriter
          LookupField = 'IDCRITERIORATORC'
          Options = [loTitles]
          Style = csDropDownList
          ParentShowHint = False
          ShowHint = False
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
        object edtVlrRateio: TDBRealEdit
          Left = 298
          Top = 25
          Width = 121
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '0')
          TabOrder = 1
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
        end
        object pnlDataReferencia: TPanel
          Left = 554
          Top = 9
          Width = 193
          Height = 39
          BevelOuter = bvNone
          TabOrder = 2
          Visible = False
          object lbl1: TLabel
            Left = 5
            Top = 1
            Width = 116
            Height = 13
            Caption = 'Data de Referência:'
          end
          object btn1: TButton
            Left = 119
            Top = 11
            Width = 57
            Height = 25
            Caption = 'Editar'
            TabOrder = 0
            OnClick = btn1Click
          end
          object dtp_Dt_Referencia: TCMDateTimePicker
            Left = 3
            Top = 17
            Width = 92
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
            DisplayFormat = 'dd/mm/yyyy'
          end
        end
      end
      object GridCompSemRes: TwwDBGrid
        Left = 0
        Top = 0
        Width = 696
        Height = 95
        ControlType.Strings = (
          'SELECIONADO;CheckBox;S;N'
          'OBSRESERVA;RichEdit;rcEditor'
          'VALIDAR;CheckBox;S;N')
        Selected.Strings = (
          'SELECIONADO'#9'4'#9' '
          'VALIDAR'#9'5'#9'Sel.'
          'IDOPERACAO'#9'10'#9'Operação'
          'NODOCUMENTO'#9'10'#9'Nº Documento'
          'IDOPERACAOAJUSTE'#9'10'#9'Operação~Ajuste'
          'DATAREFERENCIA'#9'13'#9'Data ~Referência'
          'NUMRESERVA'#9'10'#9'Número do ~Compromisso'
          'PERIODO'#9'7'#9'Período'
          'EXERCICIO'#9'8'#9'Exercício'
          'CENTROCUSTO'#9'20'#9'Centro de~Custo'
          'SUBDESPESA'#9'28'#9'Fornecedor / Sub-Despesa'
          'CENTRORESPON'#9'20'#9'Centro de~Responsabilidade'
          'PLANO'#9'20'#9'Plano'
          'PATRO'#9'20'#9'Patrocinadora'
          'ATIVIDADEPROJ'#9'20'#9'Atividade de Projeto'
          'PROGRAMA'#9'20'#9'Programa'
          'TIPODESPESA'#9'20'#9'Tipo Despesa'
          'DESCRESERVA'#9'10'#9'Status'
          'OBSRESERVA'#9'10'#9'Observações'
          'VALOR'#9'10'#9'Valor do~Compromisso'
          'USUARIO'#9'30'#9'Usuário ~Inclusão')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        OnRowChanged = GridCompSemResRowChanged
        FixedCols = 0
        ShowHorzScrollBar = True
        EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
        Align = alClient
        DataSource = ds
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgShowFooter]
        TabOrder = 1
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 2
        TitleButtons = True
        OnCalcCellColors = GridCompSemResCalcCellColors
        OnTitleButtonClick = GridCompSemResTitleButtonClick
        IndicatorColor = icBlack
        OnTopRowChanged = GridCompSemResTopRowChanged
        OnUpdateFooter = GridCompSemResUpdateFooter
      end
    end
    object tbsCompComReserv: TTabSheet
      Caption = 'Compromissos a partir de reservas'
      ImageIndex = 1
      object PgCompComReserva: TPageControl
        Left = 0
        Top = 0
        Width = 696
        Height = 158
        ActivePage = tbsReservas
        Align = alClient
        TabOrder = 0
        OnChange = PgCompComReservaChange
        object tbsCompComReserva: TTabSheet
          Caption = 'Relacionamentos do grupo'
          object GridGrupoComReserva: TwwDBGrid
            Left = 0
            Top = 0
            Width = 688
            Height = 130
            ControlType.Strings = (
              'DATAREFERENCIA;CustomEdit;'
              'OBSRESERVA;RichEdit;rcEditor'
              'VALIDAR;CheckBox;S;N')
            Selected.Strings = (
              'VALIDAR'#9'5'#9'Sel.'
              'IDOPERACAO'#9'10'#9'Operação'
              'DATAREFERENCIA'#9'13'#9'Data ~Referência'
              'NUMRESERVA'#9'10'#9'Numero ~Compromisso'
              'PERIODO'#9'7'#9'Período'
              'EXERCICIO'#9'8'#9'Exercício'
              'CENTROCUSTO'#9'20'#9'Centro de~Custo'
              'CENTRORESPON'#9'20'#9'Centro de~Responsabilidade'
              'PLANO'#9'20'#9'Plano'
              'PATRO'#9'20'#9'Patrocinadora'
              'ATIVIDADEPROJ'#9'20'#9'Atividade de Projeto'
              'PROGRAMA'#9'20'#9'Programa'
              'TIPODESPESA'#9'20'#9'Tipo Despesa'
              'DESCRESERVA'#9'10'#9'Status'
              'OBSRESERVA'#9'10'#9'Observações'
              'VALOR'#9'10'#9'Valor do~Compromisso'
              'USUARIO'#9'30'#9'Usuário ~Inclusão')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            OnRowChanged = GridCompSemResRowChanged
            FixedCols = 0
            ShowHorzScrollBar = True
            EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
            Align = alClient
            DataSource = ds
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgShowFooter]
            TabOrder = 0
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 2
            TitleButtons = True
            OnCalcCellColors = GridCompSemResCalcCellColors
            OnTitleButtonClick = GridCompSemResTitleButtonClick
            IndicatorColor = icBlack
            OnTopRowChanged = GridCompSemResTopRowChanged
            OnUpdateFooter = GridCompSemResUpdateFooter
          end
        end
        object tbsReservas: TTabSheet
          Caption = 'Reservas disponíveis'
          ImageIndex = 1
          object Splitter1: TSplitter
            Left = 241
            Top = 0
            Width = 5
            Height = 130
            Cursor = crHSplit
          end
          object Splitter2: TSplitter
            Left = 286
            Top = 0
            Width = 5
            Height = 130
            Cursor = crHSplit
          end
          object Panel1: TPanel
            Left = 0
            Top = 0
            Width = 241
            Height = 130
            Align = alLeft
            TabOrder = 0
            object Panel2: TPanel
              Left = 1
              Top = 1
              Width = 239
              Height = 26
              Align = alTop
              Caption = 'Reservas Relacionadas'
              Color = clNavy
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -15
              Font.Name = 'Arial'
              Font.Style = [fsBold, fsItalic]
              ParentFont = False
              TabOrder = 0
            end
            object GridResXComp: TwwDBGrid
              Left = 1
              Top = 27
              Width = 239
              Height = 102
              Selected.Strings = (
                'IDOPERACAO'#9'10'#9'Operação'
                'VLRRESERVA'#9'10'#9'Valor')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              Align = alClient
              DataSource = dsResxComp
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgShowFooter]
              TabOrder = 1
              TitleAlignment = taLeftJustify
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -9
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = [fsBold]
              TitleLines = 2
              TitleButtons = False
              OnCalcCellColors = GridCompSemResCalcCellColors
              IndicatorColor = icBlack
              OnTopRowChanged = GridCompSemResTopRowChanged
              OnUpdateFooter = wwDBGrid1UpdateFooter
            end
          end
          object pnlBotoes: TPanel
            Left = 246
            Top = 0
            Width = 40
            Height = 130
            Align = alLeft
            Enabled = False
            TabOrder = 1
            object btIncluir: TSpeedButton
              Left = 4
              Top = 55
              Width = 33
              Height = 27
              Cursor = crHandPoint
              Hint = 'Incluir reserva'
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                8888888888FFFFF8888888888000008888888888F777778FF888888006666600
                88888887788888778F88887666666666088888788888888878F887E666666666
                608887F888888F8887F887E66666F6666088878888887F88878F7E66666FF666
                66087F8888877F88887F7E6666FFF66666087F8888777F88887F7E666FFFF666
                66087F8887777F88887F7E6666FFF66666087F8888777F88887F7E66666FF666
                660878F888877F88887887E66666F666608887F88888788887F887E666666666
                6088878F888888888788887EE666666608888878FF88888F788888877EEEEE77
                8888888778FFFF77888888888777778888888888877777888888}
              NumGlyphs = 2
              ParentShowHint = False
              ShowHint = True
              OnClick = btIncluirClick
            end
            object btExcluir: TSpeedButton
              Left = 4
              Top = 87
              Width = 33
              Height = 27
              Cursor = crHandPoint
              Hint = 'Excluir reserva'
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                8888888888FFFFF8888888888000008888888888F777778FF888888006666600
                88888887788888778F88887666666666088888788888888878F887E666666666
                608887F8888F888887F887E666F66666608887888878F888878F7E6666FF6666
                66087F8888778F88887F7E6666FFF66666087F88887778F8887F7E6666FFFF66
                66087F8888777788887F7E6666FFF66666087F8888777888887F7E6666FF6666
                660878F888778888887887E666F66666608887F88878888887F887E666666666
                6088878F888888888788887EE666666608888878FF88888F788888877EEEEE77
                8888888778FFFF77888888888777778888888888877777888888}
              NumGlyphs = 2
              ParentShowHint = False
              ShowHint = True
              OnClick = btExcluirClick
            end
          end
          object Panel4: TPanel
            Left = 291
            Top = 0
            Width = 397
            Height = 130
            Align = alClient
            TabOrder = 2
            object Panel5: TPanel
              Left = 1
              Top = 1
              Width = 395
              Height = 26
              Align = alTop
              Caption = 'Reservas Disponíveis'
              Color = clNavy
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -15
              Font.Name = 'Arial'
              Font.Style = [fsBold, fsItalic]
              ParentFont = False
              TabOrder = 0
            end
            object wwDBGrid1: TwwDBGrid
              Left = 1
              Top = 27
              Width = 395
              Height = 102
              ControlType.Strings = (
                'OBSRESERVA;RichEdit;rcEditor')
              Selected.Strings = (
                'NUMRESERVA'#9'10'#9'Num~Reserva'#9'F'
                'IDOPERACAO'#9'10'#9'Operação'#9'F'
                'NOME'#9'10'#9'Plano'#9'F'
                'GRUPO'#9'20'#9'Grupo ~Orçamentário'#9'F'
                'PERIODO'#9'10'#9'Período'#9'F'
                'EXERCICIO'#9'10'#9'Exercício'#9'F'
                'VLRRESERVA'#9'10'#9'Valor'#9'F'
                'OBSRESERVA'#9'10'#9'Observações'#9'F')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              Align = alClient
              DataSource = dsResDisp
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgShowFooter]
              TabOrder = 1
              TitleAlignment = taLeftJustify
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -9
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = [fsBold]
              TitleLines = 2
              TitleButtons = True
              OnCalcCellColors = GridCompSemResCalcCellColors
              OnTitleButtonClick = wwDBGrid1TitleButtonClick
              IndicatorColor = icBlack
              OnTopRowChanged = GridCompSemResTopRowChanged
              OnUpdateFooter = wwDBGrid1UpdateFooter
            end
          end
        end
      end
    end
  end
  object pnlTotalContas: TPanel [4]
    Left = 0
    Top = 198
    Width = 704
    Height = 32
    Align = alTop
    Color = clNavy
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    TabOrder = 4
    object btInverteSel: TSpeedButton
      Left = 39
      Top = 5
      Width = 23
      Height = 22
      Cursor = crHandPoint
      Hint = 'Inverter seleção'
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888C888888888888888CC888888888888CCCCC8888888888CCCCCCC88
        988888CCCCCCC88899888CCC88CC888889988CC888C8888889988CC888888988
        89988CC888889988999888CC888999999988888C889999999888888888899999
        8888888888889988888888888888898888888888888888888888}
      ParentShowHint = False
      ShowHint = True
      OnClick = btInverteSelClick
    end
    object btMarcaTodos: TSpeedButton
      Left = 8
      Top = 5
      Width = 23
      Height = 22
      Cursor = crHandPoint
      Hint = 'Selecionar tudo'
      Glyph.Data = {
        D6000000424DD60000000000000076000000280000000C0000000C0000000100
        0400000000006000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888848888888
        0000888224888888000088222248888800008822822488880000882848224888
        0000888224822488000088222248228800008822822482880000882888224888
        0000888888822488000088888888228800008888888882880000}
      ParentShowHint = False
      ShowHint = True
      OnClick = btMarcaTodosClick
    end
  end
  object rcEditor: TwwDBRichEdit [5]
    Left = 1088
    Top = 96
    Width = 185
    Height = 89
    AutoURLDetect = False
    PrintJobName = 'Delphi 5'
    TabOrder = 5
    EditorCaption = 'Observações'
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
      7E0000007B5C727466315C616E73695C616E7369637067313235325C64656666
      305C6465666C616E67313034367B5C666F6E7474626C7B5C66305C666E696C20
      4D532053616E732053657269663B7D7D0D0A5C766965776B696E64345C756331
      5C706172645C625C66305C66733134207263456469746F725C7061720D0A7D0D
      0A00}
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 65522
    Top = 7
    TargetsData = (
      1
      5
      (
        'TDBRealEdit'
        'Text'
        0)
      (
        'TwwDBRichEdit'
        'Text'
        0)
      (
        'TMemo'
        'Text'
        0)
      (
        ''
        'EditorCaption'
        0)
      (
        'TRealEdit'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 442
    Top = 3
  end
  inherited ImlPadrao: TImageList
    Left = 65520
    Top = 65535
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyInsert = CmeCadastroApplyInsert
    ApplyDelete = CmeCadastroApplyDelete
    Left = 372
    Top = 3
  end
  inherited Cds: TCMClientDataSet
    AfterOpen = CdsAfterOpen
    BeforePost = CdsBeforePost
    Left = 472
    Top = 3
  end
  inherited MontaSelect: TMontaSelect
    Caption = ''
    Colunas.Strings = (
      'GRUPOORCAMEN.CODGRUPOORC'
      'GRUPOORCAMEN.NOMEGRUPOORCAMEN'
      'RESERVAORCAMEN.PERIODO'
      'RESERVAORCAMEN.EXERCICIO'
      'RESERVAORCAMEN.DATAREFERENCIA'
      'DECODE(RXC.IDCOMPROMISSO,'#39#39','#39'SEM RESERVA'#39','#39'COM RESERVA'#39')'
      
        'DECODE(RESERVAORCAMEN.FLGRESERVA,'#39'A'#39','#39'Aguardando'#39','#39'E'#39','#39'Efetivada' +
        #39','#39'C'#39','#39'Cancelada'#39','#39'U'#39','#39'Em Uso'#39')'
      'COMPROMISSOXAJUSTE.IDOPERACAOAJUSTE'
      'D.SUBDESPESA'
      'DOCUMENTO.NODOCUMENTO')
    TipodeDado.Strings = (
      'C'
      'C'
      'N'
      'N'
      'D'
      'C'
      'C'
      'N'
      'C'
      'N')
    Descricao.Strings = (
      'Código do Grupo'
      'Nome'
      'Período'
      'Exercício'
      'Data Referência'
      'Utiliza Reserva'
      'Status'
      'Operação Ajuste'
      'Sub-Despesa'
      'Nº Documento')
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
      'N')
    Tabelas.Strings = (
      'GRUPOORCAMEN'
      'CONTASORCAMEN'
      'RESERVAORCAMEN'
      'RESXCOMP RXC'
      'COMPROMISSOXAJUSTE'
      'SALDOORCADO S'
      'DESPESAORCAMENTARIA D'
      'RATEIODOCUM'
      'DOCUMENTO')
    CamposChave.Strings = (
      'GRUPOORCAMEN.IDGRUPOORCAMEN'
      'RESERVAORCAMEN.PERIODO'
      'RESERVAORCAMEN.EXERCICIO'
      'RESERVAORCAMEN.DATAREFERENCIA'
      'DECODE(RXC.IDCOMPROMISSO,'#39#39','#39'SR'#39','#39'CR'#39')'
      'RESERVAORCAMEN.FLGRESERVA'
      'GRUPOORCAMEN.CODGRUPOORC'
      'GRUPOORCAMEN.NOMEGRUPOORCAMEN'
      'RESERVAORCAMEN.OBSRESERVA'
      'NVL(D.IDDESPESAORC, -1)'
      'GRUPOORCAMEN.IDPLANOORCAMEN')
    Filtro.Strings = (
      'CONTASORCAMEN.IDGRUPOORCAMEN = GRUPOORCAMEN.IDGRUPOORCAMEN'
      'CONTASORCAMEN.IDPLANOORCAMEN = GRUPOORCAMEN.IDPLANOORCAMEN'
      'CONTASORCAMEN.IDCONTAORCAMEN = RESERVAORCAMEN.IDCONTAORCAMEN'
      'CONTASORCAMEN.IDPLANOORCAMEN = RESERVAORCAMEN.IDPLANOORCAMEN'
      'RESERVAORCAMEN.FLGRESCOMP = '#39'C'#39
      'RESERVAORCAMEN.IDRESERVAORCAMEN = RXC.IDCOMPROMISSO(+)'
      
        '( COMPROMISSOXAJUSTE.IDOPERACAOCOMPROMISSO(+)   =  RESERVAORCAME' +
        'N.IDOPERACAO )'
      'CONTASORCAMEN.IDCONTAORCAMEN = S.IDCONTAORCAMEN'
      'CONTASORCAMEN.IDPESSOA = S.IDPESSOA(+)'
      'CONTASORCAMEN.IDPLANOORCAMEN = S.IDPLANOORCAMEN(+)'
      'S.IDDESPESAORC = RATEIODOCUM.IDDESPESAORC '
      'D.IDDESPESAORC = S.IDDESPESAORC'
      
        'RESERVAORCAMEN.IDRESERVAORCAMEN = RATEIODOCUM.IDRESERVAORCAMEN(+' +
        ')'
      'DOCUMENTO.CODDOCUMENTO(+)  = RATEIODOCUM.CODDOCUMENTO')
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
      '')
    Larguras.Strings = (
      '10'
      '30'
      '10'
      '10'
      '18'
      '10'
      '30'
      '10'
      '60'
      '10')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    UsaDistinct = True
    MultiSelect = True
    BeforeOpenCds = MontaSelectBeforeOpenCds
    LookupSQL.Strings = (
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
    LookupCampoChave.Strings = (
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
    LookupCampoExibe.Strings = (
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
    Left = 408
    Top = 3
  end
  object CdsPlano: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 625
    Top = 5
  end
  object CdsPatro: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 665
    Top = 5
  end
  object CdsRatCriter: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 185
    Top = 289
  end
  object CdsResxComp: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterOpen = CdsResDispAfterOpen
    Left = 208
    Top = 374
  end
  object CdsResDisp: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterOpen = CdsResDispAfterOpen
    Left = 337
    Top = 318
  end
  object dsResxComp: TDataSource
    DataSet = CdsResxCompTotal
    Left = 160
    Top = 366
  end
  object dsResDisp: TDataSource
    DataSet = CdsResDispTotal
    Left = 401
    Top = 350
  end
  object ImageList: TImageList
    Left = 704
    Top = 5
    Bitmap = {
      494C010102000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
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
      0000000000000000000080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000080000080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000080000000800000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080808000FFFFFF00FF000000FF000000FF000000FF00
      0000FFFFFF000000000000000000000000000000000080808000808080008080
      800080808000008000000080000000800000FF000000FF000000FF000000FF00
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000080808000008000000080
      00000080000000800000008000000080000000800000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000000000000000
      0000000000000000000080808000FFFFFF00FF000000FF000000FF000000FF00
      0000FFFFFF000000000000000000000000000000000080808000008000000080
      0000008000000080000000800000008000000080000000800000FF000000FF00
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000080808000008000000080
      00000080000000800000008000000080000000800000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000FFFFFF00FF00
      0000FF000000FF00000080808000FFFFFF00FF000000FF000000FFFFFF000000
      0000000000000000000000000000000000000000000080808000008000000080
      0000FF000000008000000080000000800000FF000000FF000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000FFFFFF008080800000000000000000000000000080808000008000000080
      0000FFFFFF000080000000800000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000FFFFFF008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000FFFFFF00FF00
      0000FF000000FF00000080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000808080000000000000000000000000000000000080808000008000000080
      0000FF0000000080000080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0080808000808080008080800080808000808080008080
      8000000000000000000000000000000000000000000080808000008000000080
      0000FFFFFF00FFFFFF0080808000808080008080800080808000808080008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000FFFFFF00FF00
      0000FF000000FF000000FF000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000FFFFFF00FF00
      0000FF000000FF000000FF000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000808080008080
      8000808080008080800080808000808080008080800080808000000000000000
      0000000000000000000000000000000000000000000080808000808080008080
      8000808080008080800080808000808080008080800080808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFF00000000FC01FC0100000000
      FDFDF9FD00000000FC05F80500000000FC058005000000008005800500000000
      BC05800500000000800580050000000080018001000000008013801300000000
      8017801700000000800F800F0000000080BF80BF0000000080BF80BF00000000
      80BF80BF00000000803F803F0000000000000000000000000000000000000000
      000000000000}
  end
  object CdsResDispTotal: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterOpen = CdsResDispAfterOpen
    Left = 473
    Top = 318
  end
  object CdsResxCompTotal: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    AfterOpen = CdsResDispAfterOpen
    Left = 96
    Top = 342
  end
  object cdsPrograma: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 665
    Top = 369
  end
  object cdsAtividadeProj: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 673
    Top = 425
  end
  object cdsTipoDespesa: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 681
    Top = 481
  end
  object cdsPlanoOrc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 29
    Top = 413
  end
  object cdsCCusto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 85
    Top = 413
  end
  object msGrupo: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'G.CODGRUPOORC'
      'G.NOMEGRUPOORCAMEN'
      'P.NOMEPLANOORC'
      'P.ANO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'N')
    Descricao.Strings = (
      'Código do grupo'
      'Nome do grupo'
      'Plano Orçamentário'
      'Ano')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'GRUPOORCAMEN G'
      'CONTASORCAMEN C'
      'PLANOORCAMENTARIO P')
    CamposChave.Strings = (
      'G.IDGRUPOORCAMEN'
      'G.NOMEGRUPOORCAMEN'
      'G.CODGRUPOORC'
      'G.IDPLANOORCAMEN')
    Filtro.Strings = (
      'G.IDGRUPOORCAMEN = C.IDGRUPOORCAMEN'
      'G.IDPLANOORCAMEN = P.IDPLANOORCAMEN'
      'C.FLGATIVA = '#39'A'#39)
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '12'
      '40'
      '60'
      '10')
    OperComparador.Strings = (
      '-1'
      '-1'
      '0'
      '0')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = True
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
    Left = 537
    Top = 5
  end
  object msDespesa: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'P.NOME'
      'D.SUBDESPESA'
      'DECODE(D.NATUREZA, '#39'ND'#39', '#39'NOVA DEMANDA'#39', '#39'OPERACIONAL'#39')')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Fornecedor'
      'Sub-Despesa'
      'Natureza')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'DESPESAORCAMENTARIA D'
      'PESSOA P')
    CamposChave.Strings = (
      'D.IDDESPESAORC'
      'D.IDFORNECEDOR'
      'D.SUBDESPESA'
      'P.NOME')
    Filtro.Strings = (
      'D.IDFORNECEDOR = P.IDPESSOA(+)')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '30'
      '50'
      '15')
    OperComparador.Strings = (
      '0'
      '0'
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
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      '')
    Left = 608
    Top = 3
  end
end
