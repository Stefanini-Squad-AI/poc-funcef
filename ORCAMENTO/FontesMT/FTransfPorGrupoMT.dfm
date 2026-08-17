inherited FrmTransfPorGrupoMT: TFrmTransfPorGrupoMT
  Left = 132
  Top = 32
  HelpContext = 520080
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  Caption = 'Transferência Orçamentária - Especial'
  ClientHeight = 555
  ClientWidth = 988
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Top = 448
    Width = 732
    Height = 19
    Align = alNone
  end
  inherited Dock972: TDock97
    Width = 988
    inherited Toolbar971: TToolbar97
      inherited sbtnAlterar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 516
    Width = 988
    inherited tb97Fundo: TToolbar97
      Left = 816
      DockPos = 899
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 520081
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 647
      DockPos = 726
    end
  end
  object Panel1: TPanel [3]
    Left = 0
    Top = 47
    Width = 988
    Height = 469
    Align = alClient
    TabOrder = 3
    object TGauge
      Left = 344
      Top = 160
      Width = 49
      Height = 257
      Progress = 0
    end
    object PageControl: TPageControl
      Left = 1
      Top = 1
      Width = 986
      Height = 467
      ActivePage = tbsDestino
      Align = alClient
      HotTrack = True
      Images = ImageList
      Style = tsFlatButtons
      TabHeight = 28
      TabOrder = 0
      object tbsOrigem: TTabSheet
        Caption = '1 - Grupo de origem'
        object pnlOrigem: TPanel
          Left = 0
          Top = 0
          Width = 978
          Height = 161
          Align = alTop
          Enabled = False
          TabOrder = 0
          object Label1: TLabel
            Left = 5
            Top = 8
            Width = 112
            Height = 13
            Caption = 'Grupo orçamentário'
          end
          object btBuscGrupoOrigem: TSpeedButton
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
            OnClick = btBuscGrupoOrigemClick
          end
          object Label4: TLabel
            Left = 216
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
            Left = 552
            Top = 8
            Width = 55
            Height = 13
            Caption = 'Exercício'
          end
          object Label5: TLabel
            Left = 216
            Top = 96
            Width = 97
            Height = 13
            Caption = 'Tipo de Despesa'
          end
          object Label9: TLabel
            Left = 623
            Top = 52
            Width = 98
            Height = 13
            Caption = 'Atividade Projeto'
          end
          object Label10: TLabel
            Left = 5
            Top = 96
            Width = 54
            Height = 13
            Caption = 'Programa'
          end
          object Label2: TLabel
            Left = 216
            Top = 8
            Width = 112
            Height = 13
            Caption = 'Plano Orçamentário'
          end
          object Label8: TLabel
            Left = 420
            Top = 52
            Width = 92
            Height = 13
            Caption = 'Centro de Custo'
          end
          object lblFornecedoresSubDespesasOrigem: TLabel
            Left = 420
            Top = 96
            Width = 165
            Height = 13
            Caption = 'Fornecedores/Sub-Despesas'
          end
          object btBuscFornOrigem: TSpeedButton
            Left = 577
            Top = 110
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
            OnClick = btBuscFornOrigemClick
          end
          object edtDescGrupoOrigem: TEdit
            Left = 5
            Top = 24
            Width = 166
            Height = 21
            Color = clBtnFace
            ReadOnly = True
            TabOrder = 0
          end
          object cboPatroOrigem: TCMDBLookupCombo
            Left = 216
            Top = 68
            Width = 197
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'30'#9'Descrição'#9'F')
            LookupTable = CdsPatroOrigem
            LookupField = 'IDPATRO'
            Options = [loTitles]
            Style = csDropDownList
            ParentShowHint = False
            ShowHint = False
            TabOrder = 5
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
          object btSelContasOrigem: TBitBtn
            Left = 623
            Top = 99
            Width = 232
            Height = 33
            Hint = 'Seleciona as contas orçamentárias do grupo selecionado'
            Caption = 'Selecionar contas orçamentárias'
            TabOrder = 11
            OnClick = btSelContasOrigemClick
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
          object edtExercicioOrigem: TDBRealEdit
            Left = 552
            Top = 24
            Width = 57
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '0')
            TabOrder = 3
            WordWrap = False
            IntDigits = 4
            DecDigits = 0
            NumberFormat = iNumber
            Signal = False
          end
          object cboPeriodoOrigem: TComboBox
            Left = 428
            Top = 24
            Width = 113
            Height = 22
            Style = csOwnerDrawFixed
            ItemHeight = 16
            TabOrder = 2
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
          object cboTipoDespOrigem: TCMDBLookupCombo
            Left = 216
            Top = 112
            Width = 197
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'TIPODESPESA'#9'30'#9'Despesa'#9'F')
            LookupTable = cdsTipoDespOrigem
            LookupField = 'IDTIPO_DEPESAORCAMEN'
            Options = [loTitles]
            Style = csDropDownList
            ParentShowHint = False
            ShowHint = False
            TabOrder = 9
            AutoDropDown = True
            ShowButton = True
            UseTFields = False
            AllowClearKey = True
            ShowMatchText = True
          end
          object cboAtivProjOrigem: TCMDBLookupCombo
            Left = 623
            Top = 68
            Width = 232
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'30'#9'Atividade'#9'T')
            LookupTable = cdsAtivProjOrigem
            LookupField = 'UNIDNEGOC'
            Options = [loTitles]
            Style = csDropDownList
            ParentShowHint = False
            ShowHint = False
            TabOrder = 7
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
          object cboProgOrigem: TCMDBLookupCombo
            Left = 5
            Top = 112
            Width = 205
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'PROGRAMA'#9'30'#9'Programa'#9'T')
            LookupTable = cdsProgOrigem
            LookupField = 'IDPROGRAMAORCAMEN'
            Options = [loTitles]
            Style = csDropDownList
            ParentShowHint = False
            ShowHint = False
            TabOrder = 8
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
          object cboPlanoPrevidenciarioOrigem: TCMDBLookupCombo
            Left = 5
            Top = 68
            Width = 205
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'30'#9'Descrição'#9'F')
            LookupTable = CdsPlanoOrigem
            LookupField = 'IDPLANOPREV'
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
          object edtFornecedoresSubDespesasOrigem: TEdit
            Left = 420
            Top = 112
            Width = 153
            Height = 21
            Color = clBtnFace
            ReadOnly = True
            TabOrder = 10
          end
          object cboPlanoOrcamentarioOrigem: TCMDBLookupCombo
            Left = 216
            Top = 24
            Width = 197
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOMEPLANOORC'#9'25'#9'Plano Orçamentário'#9'F'
              'ANO'#9'3'#9'Ano'#9'F')
            LookupTable = cdsPlanoOrcOrigem
            LookupField = 'IDPLANOORCAMEN'
            Options = [loColLines, loRowLines, loTitles]
            Style = csDropDownList
            ParentShowHint = False
            ShowHint = False
            TabOrder = 1
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
          object cboCentroCustoOrigem: TCMDBLookupCombo
            Left = 420
            Top = 68
            Width = 191
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'20'#9'Centro de Custo'#9'F')
            LookupTable = CdsCCustoOrigem
            LookupField = 'CODCENTROCUSTO'
            Options = [loTitles]
            Style = csDropDownList
            ParentShowHint = False
            ShowHint = False
            TabOrder = 6
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
            OnCloseUp = cboCentroCustoOrigemCloseUp
          end
        end
        object Panel4: TPanel
          Left = 0
          Top = 161
          Width = 978
          Height = 268
          Align = alClient
          TabOrder = 1
          object pnlTotalContasOrigem: TPanel
            Left = 1
            Top = 1
            Width = 976
            Height = 28
            Align = alTop
            Color = clNavy
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -16
            Font.Name = 'Arial'
            Font.Style = [fsBold, fsItalic]
            ParentFont = False
            TabOrder = 0
          end
          object GridOrigem: TwwDBGrid
            Left = 1
            Top = 29
            Width = 976
            Height = 238
            Selected.Strings = (
              'PERIODO'#9'5'#9'Período'
              'EXERCICIO'#9'9'#9'Exercício'
              'CENTROCUSTO'#9'25'#9'Centro de ~Custo'
              'CENTRORESPON'#9'25'#9'Centro de~Responsabilidade'
              'PLANO'#9'25'#9'Plano~Previdenciário'
              'PATRO'#9'15'#9'Patrocinadora'
              'ATIVPROJ'#9'15'#9'Atividade Projeto'
              'PROGRAMA'#9'9'#9'Programa'
              'TIPODESPESA'#9'15'#9'Tipo de Despesa'
              'SUBDESPESA'#9'15'#9'Fornecedor / Sub-despesas'
              'SALDODISP'#9'10'#9'Saldo~disponível')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsContasOrigem
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
            OnCalcCellColors = GridOrigemCalcCellColors
            IndicatorColor = icBlack
            OnTopRowChanged = GridOrigemTopRowChanged
            OnUpdateFooter = GridOrigemUpdateFooter
          end
        end
      end
      object tbsDestino: TTabSheet
        Caption = '2 - Grupo de destino'
        ImageIndex = 1
        object pnlDestino: TPanel
          Left = 0
          Top = 0
          Width = 978
          Height = 161
          Align = alTop
          Enabled = False
          TabOrder = 0
          object Label7: TLabel
            Left = 5
            Top = 8
            Width = 112
            Height = 13
            Caption = 'Grupo orçamentário'
          end
          object btBuscaGrupoDestino: TSpeedButton
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
            OnClick = btBuscaGrupoDestinoClick
          end
          object Label11: TLabel
            Left = 216
            Top = 52
            Width = 80
            Height = 13
            Caption = 'Patrocinadora'
          end
          object Label12: TLabel
            Left = 5
            Top = 52
            Width = 118
            Height = 13
            Caption = 'Plano Previdenciário'
          end
          object Label23: TLabel
            Left = 420
            Top = 8
            Width = 46
            Height = 13
            Caption = 'Período'
          end
          object Label24: TLabel
            Left = 552
            Top = 8
            Width = 55
            Height = 13
            Caption = 'Exercício'
          end
          object Label15: TLabel
            Left = 216
            Top = 96
            Width = 97
            Height = 13
            Caption = 'Tipo de Despesa'
          end
          object Label18: TLabel
            Left = 623
            Top = 52
            Width = 98
            Height = 13
            Caption = 'Atividade Projeto'
          end
          object Label26: TLabel
            Left = 5
            Top = 96
            Width = 54
            Height = 13
            Caption = 'Programa'
          end
          object lblPlanoOrcamentario: TLabel
            Left = 216
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
          object lblFornecedoresSubDespesasDestino: TLabel
            Left = 420
            Top = 96
            Width = 165
            Height = 13
            Caption = 'Fornecedores/Sub-Despesas'
          end
          object btBuscFornDestino: TSpeedButton
            Left = 577
            Top = 110
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
            OnClick = btBuscFornDestinoClick
          end
          object edtDescGrupoDestino: TEdit
            Left = 5
            Top = 24
            Width = 166
            Height = 21
            Color = clBtnFace
            ReadOnly = True
            TabOrder = 0
          end
          object cboPatroDestino: TCMDBLookupCombo
            Left = 216
            Top = 68
            Width = 197
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'30'#9'Descrição'#9'F')
            LookupTable = CdsPatroDestino
            LookupField = 'IDPATRO'
            Options = [loTitles]
            Style = csDropDownList
            ParentShowHint = False
            ShowHint = False
            TabOrder = 5
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
          object cboPlanoPrevidenciarioDestino: TCMDBLookupCombo
            Left = 5
            Top = 68
            Width = 205
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'30'#9'Descrição'#9'F')
            LookupTable = CdsPlanoDestino
            LookupField = 'IDPLANOPREV'
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
          object btSelContasDestino: TBitBtn
            Left = 623
            Top = 99
            Width = 232
            Height = 33
            Hint = 'Seleciona as contas orçamentárias do grupo selecionado'
            Caption = 'Selecionar contas orçamentárias'
            TabOrder = 11
            OnClick = btSelContasDestinoClick
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
          object edtExercicioDestino: TDBRealEdit
            Left = 552
            Top = 24
            Width = 57
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '0')
            TabOrder = 3
            WordWrap = False
            IntDigits = 4
            DecDigits = 0
            NumberFormat = iNumber
            Signal = False
          end
          object cboPeriodoDestino: TComboBox
            Left = 420
            Top = 24
            Width = 113
            Height = 22
            Style = csOwnerDrawFixed
            ItemHeight = 16
            TabOrder = 2
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
          object cboAtivProjDestino: TCMDBLookupCombo
            Left = 623
            Top = 68
            Width = 232
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'30'#9'Atividade'#9'T')
            LookupTable = cdsAtivProjDestino
            LookupField = 'UNIDNEGOC'
            Options = [loTitles]
            Style = csDropDownList
            ParentShowHint = False
            ShowHint = False
            TabOrder = 7
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
          object cboProgDestino: TCMDBLookupCombo
            Left = 5
            Top = 112
            Width = 205
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'PROGRAMA'#9'30'#9'Programa'#9'T')
            LookupTable = cdsProgDestino
            LookupField = 'IDPROGRAMAORCAMEN'
            Options = [loTitles]
            Style = csDropDownList
            ParentShowHint = False
            ShowHint = False
            TabOrder = 8
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
          object cboTipoDespDestino: TCMDBLookupCombo
            Left = 216
            Top = 112
            Width = 197
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'TIPODESPESA'#9'30'#9'Despesa'#9'F')
            LookupTable = cdsTipoDespDestino
            LookupField = 'IDTIPO_DEPESAORCAMEN'
            Options = [loTitles]
            Style = csDropDownList
            ParentShowHint = False
            ShowHint = False
            TabOrder = 9
            AutoDropDown = True
            ShowButton = True
            UseTFields = False
            AllowClearKey = True
            ShowMatchText = True
          end
          object edtFornecedoresSubDespesasDestino: TEdit
            Left = 420
            Top = 112
            Width = 153
            Height = 21
            Color = clBtnFace
            ReadOnly = True
            TabOrder = 10
          end
          object cboPlanoOrcamentarioDestino: TCMDBLookupCombo
            Left = 216
            Top = 24
            Width = 197
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOMEPLANOORC'#9'25'#9'Plano Orçamentário'#9'F'
              'ANO'#9'3'#9'Ano'#9'F')
            LookupTable = cdsPlanoOrcDestino
            LookupField = 'IDPLANOORCAMEN'
            Options = [loColLines, loRowLines, loTitles]
            Style = csDropDownList
            ParentShowHint = False
            ShowHint = False
            TabOrder = 1
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
          object cboCentroCustoDestino: TCMDBLookupCombo
            Left = 420
            Top = 68
            Width = 191
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'20'#9'Centro de Custo'#9'F')
            LookupTable = CdsCCustoDestino
            LookupField = 'CODCENTROCUSTO'
            Options = [loTitles]
            Style = csDropDownList
            ParentShowHint = False
            ShowHint = False
            TabOrder = 6
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
            OnCloseUp = cboCentroCustoDestinoCloseUp
          end
        end
        object Panel6: TPanel
          Left = 0
          Top = 161
          Width = 978
          Height = 268
          Align = alClient
          TabOrder = 1
          object pnlTotalContasDestino: TPanel
            Left = 1
            Top = 1
            Width = 976
            Height = 28
            Align = alTop
            Color = clNavy
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -16
            Font.Name = 'Arial'
            Font.Style = [fsBold, fsItalic]
            ParentFont = False
            TabOrder = 0
          end
          object GridDestino: TwwDBGrid
            Left = 1
            Top = 29
            Width = 976
            Height = 238
            Selected.Strings = (
              'PERIODO'#9'5'#9'Período'
              'EXERCICIO'#9'9'#9'Exercício'
              'CENTROCUSTO'#9'25'#9'Centro de ~Custo'
              'CENTRORESPON'#9'25'#9'Centro de~Responsabilidade'
              'PLANO'#9'25'#9'Plano~Previdenciário'
              'PATRO'#9'15'#9'Patrocinadora'
              'ATIVPROJ'#9'15'#9'Atividade Projeto'
              'PROGRAMA'#9'9'#9'Programa'
              'TIPODESPESA'#9'15'#9'Tipo de Despesa'
              'SUBDESPESA'#9'15'#9'Fornecedor / Sub-despesas'
              'SALDODISP'#9'10'#9'Saldo~disponível')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsContasDestino
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
            OnCalcCellColors = GridOrigemCalcCellColors
            IndicatorColor = icBlack
            OnTopRowChanged = GridOrigemTopRowChanged
            OnUpdateFooter = GridDestinoUpdateFooter
          end
        end
      end
      object tbsMontaTransf: TTabSheet
        Caption = '3 - Montagem da trânsferência'
        ImageIndex = 2
        OnShow = tbsMontaTransfShow
        object pnlMontaTransf: TPanel
          Left = 0
          Top = 0
          Width = 978
          Height = 185
          Align = alTop
          Enabled = False
          TabOrder = 0
          object Label17: TLabel
            Left = 16
            Top = 144
            Width = 89
            Height = 13
            Caption = 'Data referência'
          end
          object Label21: TLabel
            Left = 136
            Top = 144
            Width = 88
            Height = 13
            Caption = 'Valor da transf.'
          end
          object Label25: TLabel
            Left = 504
            Top = 8
            Width = 75
            Height = 13
            Caption = 'Observações'
          end
          object GroupBox1: TGroupBox
            Left = 16
            Top = 8
            Width = 233
            Height = 127
            Caption = ' Origem: '
            TabOrder = 0
            object Label13: TLabel
              Left = 16
              Top = 24
              Width = 92
              Height = 13
              Caption = 'Centro de Custo'
            end
            object lblPeriodoOrigem: TLabel
              Left = 16
              Top = 72
              Width = 46
              Height = 13
              Caption = 'Período'
            end
            object Label16: TLabel
              Left = 96
              Top = 72
              Width = 55
              Height = 13
              Caption = 'Exercício'
            end
            object cboTransfContaOrigem: TwwDBLookupCombo
              Left = 16
              Top = 40
              Width = 205
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'CENTROCUSTO'#9'15'#9'C.Custo'#9'F'
                'CENTRORESPON'#9'10'#9'C.Respon.'#9'F'
                'PERIODO'#9'5'#9'Período'#9'F'
                'EXERCICIO'#9'5'#9'Exercício'#9'F'
                'PLANO'#9'15'#9'Plano'#9'F'
                'PATRO'#9'15'#9'Patrocinadora'#9'F'
                'ATIVPROJ'#9'10'#9'Atividade~Projeto'
                'PROGRAMA'#9'10'#9'Programa'
                'TIPODESPESA'#9'10'#9'Tipo~Despesa'
                'SUBDESPESA'#9'10'#9'Fornecedor / Sub-despesas'
                'SALDODISP'#9'10'#9'Saldo'#9'F')
              LookupTable = CdsContasTransfOrigem
              LookupField = 'IDCONTAORCAMEN'
              Options = [loColLines, loTitles]
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
              OnCloseUp = cboTransfContaOrigemCloseUp
            end
            object edtPerTransfOrigem: TDBRealEdit
              Left = 16
              Top = 88
              Width = 47
              Height = 21
              Alignment = taRightJustify
              Color = clBtnFace
              Lines.Strings = (
                '0')
              ReadOnly = True
              TabOrder = 1
              WordWrap = False
              IntDigits = 2
              DecDigits = 0
              NumberFormat = iNumber
              Signal = False
            end
            object edtExercTransfOrigem: TDBRealEdit
              Left = 96
              Top = 88
              Width = 57
              Height = 21
              Alignment = taRightJustify
              Color = clBtnFace
              Lines.Strings = (
                '0')
              ReadOnly = True
              TabOrder = 2
              WordWrap = False
              IntDigits = 4
              DecDigits = 0
              NumberFormat = iNumber
              Signal = False
            end
          end
          object GroupBox2: TGroupBox
            Left = 256
            Top = 8
            Width = 233
            Height = 127
            Caption = ' Destino: '
            TabOrder = 1
            object Label14: TLabel
              Left = 16
              Top = 24
              Width = 92
              Height = 13
              Caption = 'Centro de Custo'
            end
            object lblPeriodoDestino: TLabel
              Left = 16
              Top = 72
              Width = 46
              Height = 13
              Caption = 'Período'
            end
            object Label19: TLabel
              Left = 96
              Top = 72
              Width = 55
              Height = 13
              Caption = 'Exercício'
            end
            object cboTransfContaDestino: TwwDBLookupCombo
              Left = 16
              Top = 40
              Width = 205
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'CENTROCUSTO'#9'15'#9'C.Custo'#9'F'
                'CENTRORESPON'#9'10'#9'C.Respon.'#9'F'
                'PERIODO'#9'5'#9'Período'#9'F'
                'EXERCICIO'#9'5'#9'Exercício'#9'F'
                'PLANO'#9'15'#9'Plano'#9'F'
                'PATRO'#9'15'#9'Patrocinadora'#9'F'
                'ATIVPROJ'#9'10'#9'Atividade~Projeto'
                'PROGRAMA'#9'10'#9'Programa'
                'TIPODESPESA'#9'8'#9'Tipo~Despesa'
                'SUBDESPESA'#9'10'#9'Fornecedor / Sub-despesas'
                'SALDODISP'#9'10'#9'Saldo'#9'F')
              LookupTable = CdsContasTransfDestino
              LookupField = 'IDCONTAORCAMEN'
              Options = [loColLines, loTitles]
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
              OnCloseUp = cboTransfContaDestinoCloseUp
            end
            object edtPerTransfDestino: TDBRealEdit
              Left = 16
              Top = 88
              Width = 47
              Height = 21
              Alignment = taRightJustify
              Color = clBtnFace
              Lines.Strings = (
                '0')
              ReadOnly = True
              TabOrder = 1
              WordWrap = False
              IntDigits = 2
              DecDigits = 0
              NumberFormat = iNumber
              Signal = False
            end
            object edtExercTransfDestino: TDBRealEdit
              Left = 96
              Top = 88
              Width = 57
              Height = 21
              Alignment = taRightJustify
              Color = clBtnFace
              Lines.Strings = (
                '0')
              ReadOnly = True
              TabOrder = 2
              WordWrap = False
              IntDigits = 4
              DecDigits = 0
              NumberFormat = iNumber
              Signal = False
            end
          end
          object edtDataReferencia: TCMDateTimePicker
            Left = 16
            Top = 160
            Width = 97
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            Color = clBtnFace
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
            ReadOnly = True
            ShowButton = True
            TabOrder = 2
          end
          object edtVlrSolicitado: TDBRealEdit
            Left = 136
            Top = 160
            Width = 97
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '0,00')
            TabOrder = 3
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
          object btIncluir: TBitBtn
            Left = 288
            Top = 156
            Width = 81
            Height = 25
            Caption = 'Incluir'
            TabOrder = 4
            OnClick = btIncluirClick
            Glyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              0400000000008000000000000000000000001000000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777000007
              777777770022222007777778222222222077778A222772222207778A222FF222
              220778A2222FF222222078A22FFFFFF7222078A22FFFFFF7222078A2222FF222
              222078A2222FF2222220778A222772222207778A2222222222077778AA222222
              2077777788AAAAA8877777777788888777777777777777777777}
          end
          object btExcluir: TBitBtn
            Left = 384
            Top = 156
            Width = 81
            Height = 25
            Caption = 'Excluir'
            TabOrder = 5
            OnClick = btExcluirClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              8888888888FFFFF8888888888000008888888888F777778FF888888009191900
              88888887788888778F88887991919191088888788888888878F8879919191919
              108887F888F888F887F88791719199719088878887FF87FF878F791919199199
              19087F88777F7778887F799FFFFFFFFF91087F8887777788887F791FFFFFFFFF
              19087F8888777FF8887F79919199199191087F88877777FF887F791991899189
              190878F8777877788878879179918971908887F88788878887F8879919191919
              1088878F88888888878888799191919108888878FF88888F7888888779999977
              8888888778FFFF77888888888777778888888888877777888888}
            NumGlyphs = 2
          end
          object mmObs: TMemo
            Left = 504
            Top = 24
            Width = 200
            Height = 110
            MaxLength = 255
            ScrollBars = ssVertical
            TabOrder = 6
          end
          object chkObs: TCheckBox
            Left = 504
            Top = 141
            Width = 201
            Height = 17
            Caption = 'Manter observações'
            TabOrder = 7
          end
        end
        object pnl_Bottom: TPanel
          Left = 0
          Top = 385
          Width = 978
          Height = 44
          Align = alBottom
          TabOrder = 1
          object Label6: TLabel
            Left = 9
            Top = 2
            Width = 269
            Height = 13
            Caption = 'Critério para rateio (conforme grupo de destino)'
          end
          object gProgresso: TGauge
            Left = 296
            Top = 19
            Width = 169
            Height = 20
            ForeColor = clNavy
            Progress = 0
            Visible = False
          end
          object lblTransferencia: TLabel
            Left = 296
            Top = 2
            Width = 5
            Height = 13
          end
          object cboRatCriter: TCMDBLookupCombo
            Left = 7
            Top = 19
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
        end
        object pnlGrid: TPanel
          Left = 0
          Top = 185
          Width = 978
          Height = 200
          Align = alClient
          TabOrder = 2
          object Panel3: TPanel
            Left = 1
            Top = 1
            Width = 976
            Height = 198
            Align = alClient
            TabOrder = 0
            object GridMontagem: TwwDBGrid
              Left = 1
              Top = 42
              Width = 974
              Height = 155
              Selected.Strings = (
                'IDOPERACAO'#9'10'#9'Operação'
                'NUMALTERACAO'#9'10'#9'Número~Reserva'
                'DATAREFERENCIA'#9'14'#9'Data~Referência'
                'GRUPOORIGEM'#9'20'#9'Grupo de ~Origem'
                'EXERCICIOORIGEM'#9'9'#9'Exercício~Origem'
                'PERIODOORIGEM'#9'10'#9'Período~Origem'
                'CENTRESPORIGEM'#9'20'#9'C.Respon.~Origem'
                'CENTCUSTORIGEM'#9'20'#9'C.Custo~Origem'
                'ATIVPROJORIGEM'#9'10'#9'Atividade~Projeto'
                'PLANOORIGEM'#9'20'#9'Plano~Previdenciário'
                'PATROORIGEM'#9'20'#9'Patrocinadora'
                'PROGRAMAORIGEM'#9'10'#9'Programa'
                'TIPODESPESAORIGEM'#9'10'#9'Tipo~Despesa'
                'SBORIGEM'#9'15'#9'Fornecedor / Sub-despesas'
                'VLRSOLICITADO'#9'14'#9'Valor~Solicitado'
                'OBSALTERORCAMEN'#9'18'#9'Observações')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              OnRowChanged = GridMontagemRowChanged
              FixedCols = 0
              ShowHorzScrollBar = True
              Align = alClient
              DataSource = ds
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgShowFooter]
              TabOrder = 0
              TitleAlignment = taLeftJustify
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -9
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = [fsBold]
              TitleLines = 2
              TitleButtons = False
              OnCalcCellColors = GridOrigemCalcCellColors
              IndicatorColor = icBlack
              OnTopRowChanged = GridOrigemTopRowChanged
              OnUpdateFooter = GridMontagemUpdateFooter
            end
            object Panel7: TPanel
              Left = 1
              Top = 1
              Width = 974
              Height = 41
              Align = alTop
              TabOrder = 1
              object pnlGridDestino: TPanel
                Left = 593
                Top = 1
                Width = 380
                Height = 39
                Align = alClient
                BevelInner = bvLowered
                BevelOuter = bvLowered
                Caption = 'Transferências entre contas - Destino'
                Color = clSilver
                Font.Charset = ANSI_CHARSET
                Font.Color = clWhite
                Font.Height = -16
                Font.Name = 'Arial'
                Font.Style = [fsBold, fsItalic]
                ParentFont = False
                TabOrder = 1
                OnClick = pnlGridDestinoClick
              end
              object pnlGridOrigem: TPanel
                Left = 1
                Top = 1
                Width = 592
                Height = 39
                Align = alLeft
                Caption = 'Transferências entre contas - Origem'
                Color = clNavy
                Font.Charset = ANSI_CHARSET
                Font.Color = clWhite
                Font.Height = -16
                Font.Name = 'Arial'
                Font.Style = [fsBold, fsItalic]
                ParentFont = False
                TabOrder = 0
                OnClick = pnlGridOrigemClick
              end
            end
          end
        end
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 282
    Top = 7
    TargetsData = (
      1
      3
      (
        'TDBRealEdit'
        'Text'
        0)
      (
        'TDBMemo'
        'Text'
        0)
      (
        'TMemo'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 502
    Top = 415
  end
  inherited ImlPadrao: TImageList
    Left = 384
    Top = 65535
  end
  inherited CmeCadastro: TCmEventosCadastro
    RepetirInsert = False
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyInsert = CmeCadastroApplyInsert
    ApplyDelete = CmeCadastroApplyDelete
    Left = 440
    Top = 65535
  end
  inherited Cds: TCMClientDataSet
    AfterOpen = CdsAfterOpen
    OnNewRecord = CdsNewRecord
    Left = 540
    Top = 415
  end
  inherited MontaSelect: TMontaSelect
    Caption = ''
    Colunas.Strings = (
      'NUMALTERACAO'
      'PERIODOORIGEM'
      'EXERCICIOORIGEM'
      'CODGRUPOORCORIGEM'
      'NOMEGRUPOORCAMENORIGEM'
      'PERIODODESTINO'
      'EXERCICIODESTINO'
      'CODGRUPOORCDESTINO'
      'NOMEGRUPOORCAMENDESTINO'
      'DATAREFERENCIA'
      'VLRSOLICITADO'
      'IDOPERACAO')
    TipodeDado.Strings = (
      'N'
      'N'
      'N'
      'C'
      'C'
      'N'
      'N'
      'C'
      'C'
      'D'
      'N'
      'C')
    Descricao.Strings = (
      'Num.Solic.'
      'Período Orig.'
      'Exerc.Origem'
      'Código Grupo Origem'
      'Nome Grupo Origem'
      'Período Dest.'
      'Exerc. Destino'
      'Código Grupo Destino'
      'Nome Grupo Destino'
      'Data Ref.'
      'Total Valor Solicitado'
      'Operação')
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
      'N')
    Tabelas.Strings = (
      'VWPLAN_ORCAMEN_TRANFS_CONS')
    CamposChave.Strings = (
      'DATAREFERENCIA'
      'IDOPERACAO'
      'CODGRUPOORCORIGEM'
      'NOMEGRUPOORCAMENORIGEM'
      'PERIODOORIGEM'
      'EXERCICIOORIGEM'
      'CODGRUPOORCDESTINO'
      'NOMEGRUPOORCAMENDESTINO'
      'PERIODODESTINO'
      'EXERCICIODESTINO'
      'IDDESPESAORCORIGEM'
      'IDDESPESAORCDESTINO'
      'IDPLANOORCAMEN')
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
      '#,##0.00;-#,##0.00'
      '')
    Larguras.Strings = (
      '10'
      '10'
      '10'
      '10'
      '100'
      '10'
      '10'
      '10'
      '100'
      '10'
      '10'
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
      '-1'
      '-1'
      '-1')
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
      ''
      ''
      '')
    Left = 504
    Top = 65535
  end
  object CdsPlanoOrigem: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 481
    Top = 281
  end
  object CdsPatroOrigem: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 401
    Top = 281
  end
  object CdsCCustoOrigem: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 214
    Top = 281
  end
  object CdsCResponOrigem: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 310
    Top = 281
  end
  object CdsContasOrigem: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterOpen = CdsContasOrigemAfterOpen
    Left = 696
    Top = 279
  end
  object CdsContasDestino: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterOpen = CdsContasDestinoAfterOpen
    Left = 696
    Top = 335
  end
  object dsContasOrigem: TDataSource
    DataSet = CdsContasOrigem
    Left = 440
    Top = 379
  end
  object dsContasDestino: TDataSource
    DataSet = CdsContasDestino
    Left = 560
    Top = 371
  end
  object CdsPatroDestino: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 398
    Top = 329
  end
  object CdsPlanoDestino: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 486
    Top = 329
  end
  object CdsCCustoDestino: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 214
    Top = 329
  end
  object CdsCResponDestino: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 310
    Top = 329
  end
  object CdsContasTransfOrigem: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterOpen = CdsContasOrigemAfterOpen
    Left = 589
    Top = 281
  end
  object CdsContasTransfDestino: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterOpen = CdsContasDestinoAfterOpen
    Left = 597
    Top = 329
  end
  object ImageList: TImageList
    Left = 576
    Top = 41
    Bitmap = {
      494C010103000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
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
      0000000000000000000000840000008400000084000000840000008400000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF00000084000000FF00000084000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400008400000084000000840000008400000084000000840000008400000084
      0000008400000000000000000000000000000000000000000000000000000000
      00000000000000000000FF000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      FF000000FF00000084000000FF00000084000000FF00000084000000FF000000
      84000000000000000000000000000000000000000000000000008484840000FF
      0000008400000084000000840000000000000000000000840000008400000084
      0000008400000084000000000000000000000000000000000000000000000000
      0000FF000000FF000000FF000000FF000000FF00000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000848484000000FF000000
      FF00000084000000FF00000084000000FF00000084000000FF00000084000000
      FF000000840000000000000000000000000000000000000000008484840000FF
      0000008400000084000000840000FFFFFF00FFFFFF0000840000008400000084
      000000840000008400000000000000000000000000000000000000000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000000000000000
      00000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000848484000000FF000000
      840084848400000084000000FF00000084000000FF000000FF00848484000000
      84000000FF00000000000000000000000000000000008484840000FF00000084
      0000008400000084000000840000FFFFFF00FFFFFF0000840000008400000084
      0000008400000084000000840000000000000000000000000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF00000000000000000000000000
      00000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000848484000000FF00000084000000
      FF00000084000000FF00000084000000FF000000FF00000084000000FF000000
      FF00000084000000FF000000000000000000000000008484840000FF00000084
      000000840000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      00000084000000840000008400000000000000000000FF000000FF000000FF00
      00000000000000000000FF000000FF0000000000000000000000000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000848484000000FF000000FF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000FF00000084000000000000000000000000008484840000FF00000084
      000000840000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      00000084000000840000008400000000000000000000FF000000FF0000000000
      00000000000000000000FF000000000000000000000000000000000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000848484000000FF0000008400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000084000000FF000000000000000000000000008484840000FF00000084
      0000008400000084000000840000FFFFFF00FFFFFF0000840000008400000084
      00000084000000840000008400000000000000000000FF000000FF0000000000
      000000000000000000000000000000000000000000000000FF00000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000848484000000FF000000FF000000
      84000000FF00000084000000FF000000FF00000084000000FF000000FF000000
      84000000FF00000084000000000000000000000000008484840000FF00000084
      0000008400000084000000840000FFFFFF00FFFFFF0000840000008400000084
      00000084000000840000008400000000000000000000FF000000FF0000000000
      0000000000000000000000000000000000000000FF000000FF00000000000000
      00000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000848484000000FF00000084000000
      FF000000FF0000008400000000000000FF000000FF0000008400000000000000
      FF00000084000000FF00000000000000000000000000000000008484840000FF
      0000008400000084000000840000000000000000000000840000008400000084
      0000008400000084000000000000000000000000000000000000FF000000FF00
      00000000000000000000000000000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000848484000000FF000000
      8400848484000000FF000000FF0000008400000000000000FF00848484000000
      84000000FF0000000000000000000000000000000000000000008484840000FF
      0000008400000084000000840000008400000084000000840000008400000084
      000000840000008400000000000000000000000000000000000000000000FF00
      000000000000000000000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000848484000000FF000000
      FF00000084000000FF00000084000000FF00000084000000FF00000084000000
      FF00000084000000000000000000000000000000000000000000000000008484
      840000FF000000FF000000840000008400000084000000840000008400000084
      0000008400000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      FF000000FF00000084000000FF00000084000000FF00000084000000FF000000
      8400000000000000000000000000000000000000000000000000000000000000
      0000848484008484840000FF000000FF000000FF000000FF000000FF00008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484000000FF000000FF000000FF000000FF000000FF00848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400848484008484840084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFFFC1FFFFF0000F83FF007FDFF0000
      E00FE003FCFF0000C007C181F07F00008003C001E037000080038000C0730000
      000180108CF90000000180109DF90000000180009FB90000000180009F310000
      0221C181CE0300008083C001EC0700008003E003FE0F0000C007F007FF3F0000
      E00FFC1FFFBF0000F83FFFFFFFFF000000000000000000000000000000000000
      000000000000}
  end
  object CdsRatCriter: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 345
    Top = 381
  end
  object cdsAtivProjOrigem: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 797
    Top = 283
  end
  object cdsProgOrigem: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 797
    Top = 331
  end
  object cdsTipoDespOrigem: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 797
    Top = 387
  end
  object cdsAtivProjDestino: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 901
    Top = 283
  end
  object cdsProgDestino: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 904
    Top = 336
  end
  object cdsTipoDespDestino: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 909
    Top = 387
  end
  object cdsPlanoOrcOrigem: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 57
    Top = 409
  end
  object cdsPlanoOrcDestino: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 57
    Top = 461
  end
  object msGrupoOrigem: TMontaSelect
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
      'G.IDPLANOORCAMEN'
      'C.FLGTRANSFORIGDIF')
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
    Left = 581
    Top = 1
  end
  object msDespesaOrigem: TMontaSelect
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
      'D.IDFORNECEDOR = P.IDPESSOA(+)'
      '( DECODE(D.FLGSTATUSDESPESA, '#39#39', '#39'A'#39', D.FLGSTATUSDESPESA)) = '#39'A'#39)
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
    Left = 784
    Top = 65535
  end
  object msGrupoDestino: TMontaSelect
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
      'G.IDPLANOORCAMEN'
      'C.FLGTRANSFORIGDIF')
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
    Left = 645
    Top = 1
  end
  object msDespesaDestino: TMontaSelect
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
      'D.IDFORNECEDOR = P.IDPESSOA(+)'
      '( DECODE(D.FLGSTATUSDESPESA, '#39#39', '#39'A'#39', D.FLGSTATUSDESPESA)) = '#39'A'#39)
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
    Left = 728
    Top = 65535
  end
end
