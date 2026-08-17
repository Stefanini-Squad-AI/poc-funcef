inherited frmCadRegra: TfrmCadRegra
  Left = 505
  Top = 88
  Width = 760
  Height = 481
  HelpContext = 450014
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  BorderStyle = bsSizeable
  Caption = 'Cadastro de Regras'
  Position = poDesigned
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 744
    Height = 357
    object Splitter1: TSplitter [0]
      Left = 1
      Top = 151
      Width = 742
      Height = 5
      Cursor = crVSplit
      Align = alTop
      Beveled = True
      ResizeStyle = rsLine
    end
    inherited pnlMestre: TPanel
      Width = 742
      Height = 150
      object nbkPassos: TNotebook
        Left = 0
        Top = 0
        Width = 742
        Height = 150
        Align = alClient
        Ctl3D = True
        ParentCtl3D = False
        TabOrder = 0
        object TPage
          Left = 0
          Top = 0
          Caption = 'Cadastro'
          object Label1: TLabel
            Left = 3
            Top = 2
            Width = 44
            Height = 13
            Caption = 'Número'
          end
          object Label2: TLabel
            Left = 3
            Top = 40
            Width = 89
            Height = 13
            Caption = 'Nome da Regra'
          end
          object Label3: TLabel
            Left = 3
            Top = 75
            Width = 82
            Height = 13
            Caption = 'Tipo de Regra'
          end
          object Label4: TLabel
            Left = 330
            Top = 2
            Width = 114
            Height = 13
            Caption = 'Descrição da Regra'
          end
          object dedIdRegra: TwwDBEdit
            Left = 3
            Top = 16
            Width = 97
            Height = 21
            DataField = 'IDREGRA'
            DataSource = ds
            ReadOnly = True
            TabOrder = 0
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
            OnChange = dedIdRegraChange
          end
          object dedNome: TwwDBEdit
            Left = 3
            Top = 53
            Width = 318
            Height = 21
            DataField = 'NOMEREGRA'
            DataSource = ds
            TabOrder = 1
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
            OnEnter = dedNomeEnter
          end
          object dedDescricao: TDBMemo
            Left = 330
            Top = 16
            Width = 449
            Height = 128
            DataField = 'DESCRICAOREGRA'
            DataSource = ds
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 3
          end
          object dedTipoRegra: TwwDBLookupCombo
            Left = 3
            Top = 90
            Width = 317
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCREGRA'#9'60'#9'Tipo de Regra')
            DataField = 'IDTIPOREGRA'
            DataSource = ds
            LookupTable = QryTipoRegra
            LookupField = 'IDTIPOREGRA'
            Options = [loTitles]
            TabOrder = 2
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
            OnExit = dedTipoRegraExit
          end
          object dbrgpPublicada: TDBRadioGroup
            Left = 3
            Top = 111
            Width = 317
            Height = 33
            Columns = 2
            DataField = 'PUBLICADA'
            DataSource = ds
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            Items.Strings = (
              'Publicada'
              'Não Publicada')
            ParentFont = False
            TabOrder = 4
            Values.Strings = (
              '1'
              '0')
            OnChange = dbrgpPublicadaChange
          end
        end
        object TPage
          Left = 0
          Top = 0
          Caption = 'Grid'
          object wwDBGrid1: TwwDBGrid
            Left = 0
            Top = 0
            Width = 658
            Height = 150
            Selected.Strings = (
              'IDALGORITMODAREG'#9'9'#9'Passos'
              'DESCRICAOALGORIT'#9'120'#9'Descrição do Algoritmo'
              'FORMULA1'#9'14'#9'Número da Formula'
              'IDCAMPO'#9'12'#9'Campo (1)'
              'IDCAMPO2'#9'12'#9'Campo (2) / Regra'
              'TIPOALGORITMO'#9'13'#9'Tipo de Algoritmo'
              'TIPOCAMPO1'#9'13'#9'Tipo de Campo (1)'
              'TIPOCAMPO2'#9'13'#9'Tipo de Campo (2)'
              'VALOR'#9'60'#9'Valor Constante')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsDet
            Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
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
          object Panel2: TPanel
            Left = 658
            Top = 0
            Width = 84
            Height = 150
            Align = alRight
            TabOrder = 1
            object bbtnfechar: TBitBtn
              Left = 6
              Top = 6
              Width = 70
              Height = 27
              Hint = 'Visualizar passos da regra'
              Cancel = True
              Caption = '&Fechar'
              TabOrder = 0
              OnClick = bbtnfecharClick
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                33033333333333333F7F3333333333333000333333333333F777333333333333
                000333333333333F777333333333333000333333333333F77733333333333300
                033333333FFF3F777333333700073B703333333F7773F77733333307777700B3
                333333773337777333333078F8F87033333337F3333337F33333778F8F8F8773
                333337333333373F333307F8F8F8F70333337F33FFFFF37F3333078999998703
                33337F377777337F333307F8F8F8F703333373F3333333733333778F8F8F8773
                333337F3333337F333333078F8F870333333373FF333F7333333330777770333
                333333773FF77333333333370007333333333333777333333333}
              NumGlyphs = 2
              Spacing = 0
            end
          end
        end
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 156
      Width = 742
      Height = 200
      detdbGrids.Strings = (
        'dbgrdDet'
        'pnlControlesDet'
        'panAtribVal'
        'panCompara'
        'panParar'
        'panMensagem'
        'panAtribRegra'
        'panImput'
        'panGoto'
        'panDemonst'
        '')
      inherited pgctrlDetalhe: TPageControl
        Width = 644
        Height = 141
        inherited tbsDet: TTabSheet
          object panDemonst: TPanel [0]
            Left = 0
            Top = 0
            Width = 636
            Height = 113
            Align = alClient
            TabOrder = 8
            Visible = False
            object Label19: TLabel
              Left = 6
              Top = 14
              Width = 71
              Height = 13
              Caption = 'Nº do Passo'
            end
            object Label25: TLabel
              Left = 97
              Top = 14
              Width = 62
              Height = 13
              Caption = 'Descricao:'
            end
            object Label40: TLabel
              Left = 465
              Top = 14
              Width = 34
              Height = 13
              Caption = 'Valor:'
            end
            object sbtnFormulasValoresDemonst: TSpeedButton
              Left = 618
              Top = 29
              Width = 25
              Height = 25
              Hint = 'Exibir valores e fórmulas'
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333033333
                33333333373F33333333333330B03333333333337F7F33333333333330F03333
                333333337F7FF3333333333330B00333333333337F773FF33333333330F0F003
                333333337F7F773F3333333330B0B0B0333333337F7F7F7F3333333300F0F0F0
                333333377F73737F33333330B0BFBFB03333337F7F33337F33333330F0FBFBF0
                3333337F7333337F33333330BFBFBFB033333373F3333373333333330BFBFB03
                33333337FFFFF7FF3333333300000000333333377777777F333333330EEEEEE0
                33333337FFFFFF7FF3333333000000000333333777777777F33333330000000B
                03333337777777F7F33333330000000003333337777777773333}
              NumGlyphs = 2
              ParentShowHint = False
              ShowHint = True
              OnClick = sbtnFormulasValoresDemonstClick
            end
            object Label41: TLabel
              Left = 98
              Top = 56
              Width = 71
              Height = 13
              Caption = 'Formatação:'
            end
            object lbldec: TLabel
              Left = 280
              Top = 56
              Width = 56
              Height = 13
              Caption = 'Decimais:'
            end
            object edValorDetalhe: TEdit
              Left = 464
              Top = 32
              Width = 153
              Height = 21
              TabOrder = 2
              OnChange = edtValorDemonstChange
              OnExit = edValorDetalheExit
            end
            object cmbdecimais: TComboBox
              Left = 280
              Top = 71
              Width = 92
              Height = 22
              Style = csOwnerDrawFixed
              ItemHeight = 16
              TabOrder = 5
              OnChange = CmbFormatChange
              Items.Strings = (
                ''
                '2'
                '3'
                '4'
                '5'
                '6'
                '7'
                '8'
                '9'
                '10'
                '11'
                '12')
            end
            object cmbformatOld: TComboBox
              Left = 544
              Top = 103
              Width = 84
              Height = 22
              Style = csOwnerDrawFixed
              ItemHeight = 16
              TabOrder = 6
              Visible = False
              Items.Strings = (
                'Moeda'
                'Outros')
            end
            object edtPassoDemonst: TEdit
              Left = 6
              Top = 32
              Width = 76
              Height = 21
              TabOrder = 0
              OnChange = edtPassoDemonstChange
            end
            object edtValorDemonst: TEdit
              Left = 96
              Top = 32
              Width = 361
              Height = 21
              MaxLength = 60
              TabOrder = 1
              OnChange = edtValorDemonstChange
            end
            object CmbFormat: TwwDBComboBox
              Left = 98
              Top = 72
              Width = 169
              Height = 21
              ShowButton = True
              Style = csDropDown
              MapList = False
              AllowClearKey = True
              DropDownCount = 8
              ItemHeight = 0
              Items.Strings = (
                'Moeda'
                'Outros')
              Sorted = False
              TabOrder = 4
              UnboundDataType = wwDefault
              OnChange = CmbFormatChange
            end
            object ChBxValConst: TCheckBox
              Left = 465
              Top = 56
              Width = 118
              Height = 17
              Caption = 'Valor Constante'
              TabOrder = 3
              OnClick = ChBxValConstClick
            end
          end
          object panGoto: TPanel [1]
            Left = 0
            Top = 0
            Width = 636
            Height = 113
            Align = alClient
            TabOrder = 7
            Visible = False
            object Label38: TLabel
              Left = 6
              Top = 30
              Width = 71
              Height = 13
              Caption = 'Nº do Passo'
            end
            object Label39: TLabel
              Left = 133
              Top = 32
              Width = 97
              Height = 13
              Caption = 'Vá para o passo:'
            end
            object edtPassoGoto: TEdit
              Left = 6
              Top = 48
              Width = 76
              Height = 21
              TabOrder = 0
              OnChange = edtPassoGotoChange
            end
            object dedCmbGotoPasso: TComboBox
              Left = 134
              Top = 48
              Width = 105
              Height = 21
              ItemHeight = 13
              TabOrder = 1
              OnChange = dedCmbGotoPassoChange
            end
          end
          object panImput: TPanel [2]
            Left = 0
            Top = 0
            Width = 636
            Height = 113
            Align = alClient
            TabOrder = 6
            Visible = False
            object Label30: TLabel
              Left = 6
              Top = 30
              Width = 71
              Height = 13
              Caption = 'Nº do Passo'
            end
            object Label27: TLabel
              Left = 87
              Top = 30
              Width = 101
              Height = 13
              Caption = 'Nome da Variável'
            end
            object SbtnImput: TSpeedButton
              Left = 245
              Top = 45
              Width = 25
              Height = 25
              Hint = 'Exibir valores e fórmulas'
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333033333
                33333333373F33333333333330B03333333333337F7F33333333333330F03333
                333333337F7FF3333333333330B00333333333337F773FF33333333330F0F003
                333333337F7F773F3333333330B0B0B0333333337F7F7F7F3333333300F0F0F0
                333333377F73737F33333330B0BFBFB03333337F7F33337F33333330F0FBFBF0
                3333337F7333337F33333330BFBFBFB033333373F3333373333333330BFBFB03
                33333337FFFFF7FF3333333300000000333333377777777F333333330EEEEEE0
                33333337FFFFFF7FF3333333000000000333333777777777F33333330000000B
                03333337777777F7F33333330000000003333337777777773333}
              NumGlyphs = 2
              ParentShowHint = False
              ShowHint = True
              OnClick = SbtnImputClick
            end
            object Label28: TLabel
              Left = 270
              Top = 33
              Width = 235
              Height = 13
              Caption = 'Texto a ser mostrado na entrada do valor'
            end
            object edVarInput: TEdit
              Left = 88
              Top = 48
              Width = 155
              Height = 21
              TabOrder = 0
              OnChange = EdtTextoImputarChange
            end
            object edtPassoInput: TEdit
              Left = 6
              Top = 48
              Width = 76
              Height = 21
              TabOrder = 1
              OnChange = edtPassoInputChange
            end
            object EdtTextoImputar: TEdit
              Left = 272
              Top = 48
              Width = 369
              Height = 21
              MaxLength = 60
              TabOrder = 2
              OnChange = EdtTextoImputarChange
            end
          end
          object panAtribRegra: TPanel [3]
            Left = 0
            Top = 0
            Width = 636
            Height = 113
            Align = alClient
            TabOrder = 5
            Visible = False
            object Label13: TLabel
              Left = 6
              Top = 30
              Width = 71
              Height = 13
              Caption = 'Nº do Passo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label14: TLabel
              Left = 89
              Top = 30
              Width = 51
              Height = 13
              Caption = 'Variável:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object sbtnBscVariavel: TSpeedButton
              Left = 308
              Top = 48
              Width = 25
              Height = 22
              Hint = 'Exibir valores e fórmulas'
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333033333
                33333333373F33333333333330B03333333333337F7F33333333333330F03333
                333333337F7FF3333333333330B00333333333337F773FF33333333330F0F003
                333333337F7F773F3333333330B0B0B0333333337F7F7F7F3333333300F0F0F0
                333333377F73737F33333330B0BFBFB03333337F7F33337F33333330F0FBFBF0
                3333337F7333337F33333330BFBFBFB033333373F3333373333333330BFBFB03
                33333337FFFFF7FF3333333300000000333333377777777F333333330EEEEEE0
                33333337FFFFFF7FF3333333000000000333333777777777F33333330000000B
                03333337777777F7F33333330000000003333337777777773333}
              NumGlyphs = 2
              ParentShowHint = False
              ShowHint = True
              OnClick = sbtnBscVariavelClick
            end
            object Label16: TLabel
              Left = 338
              Top = 44
              Width = 11
              Height = 23
              Caption = '='
              Color = clBtnFace
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindow
              Font.Height = -19
              Font.Name = 'Bookman Old Style'
              Font.Style = [fsItalic]
              ParentColor = False
              ParentFont = False
            end
            object Label15: TLabel
              Left = 360
              Top = 33
              Width = 39
              Height = 13
              Caption = 'Regra:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object sbtnBscRegra: TSpeedButton
              Left = 617
              Top = 45
              Width = 25
              Height = 25
              Hint = 'Exibir valores e fórmulas'
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333033333
                33333333373F33333333333330B03333333333337F7F33333333333330F03333
                333333337F7FF3333333333330B00333333333337F773FF33333333330F0F003
                333333337F7F773F3333333330B0B0B0333333337F7F7F7F3333333300F0F0F0
                333333377F73737F33333330B0BFBFB03333337F7F33337F33333330F0FBFBF0
                3333337F7333337F33333330BFBFBFB033333373F3333373333333330BFBFB03
                33333337FFFFF7FF3333333300000000333333377777777F333333330EEEEEE0
                33333337FFFFFF7FF3333333000000000333333777777777F33333330000000B
                03333337777777F7F33333330000000003333337777777773333}
              NumGlyphs = 2
              ParentShowHint = False
              ShowHint = True
              OnClick = sbtnBscRegraClick
            end
            object SpeedButton2: TSpeedButton
              Left = 355
              Top = 72
              Width = 19
              Height = 18
              Caption = '...'
              OnClick = SpeedButton2Click
            end
            object Label5: TLabel
              Left = 378
              Top = 76
              Width = 99
              Height = 13
              Caption = 'Dados para regra'
            end
            object edvariavel: TEdit
              Left = 87
              Top = 48
              Width = 218
              Height = 21
              ReadOnly = True
              TabOrder = 0
              OnChange = edvariavelChange
            end
            object edregra: TEdit
              Left = 355
              Top = 48
              Width = 260
              Height = 21
              ReadOnly = True
              TabOrder = 1
              OnChange = edvariavelChange
            end
            object edtPassoRegra: TEdit
              Left = 6
              Top = 48
              Width = 76
              Height = 21
              TabOrder = 2
              OnChange = edtPassoRegraChange
            end
          end
          object panMensagem: TPanel [4]
            Left = 0
            Top = 0
            Width = 636
            Height = 113
            Align = alClient
            TabOrder = 4
            Visible = False
            object Label6: TLabel
              Left = 6
              Top = 30
              Width = 71
              Height = 13
              Caption = 'Nº do Passo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label7: TLabel
              Left = 89
              Top = 30
              Width = 65
              Height = 13
              Caption = 'Mensagem:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label9: TLabel
              Left = 456
              Top = 32
              Width = 51
              Height = 13
              Caption = 'Variável:'
            end
            object SbtnMensagem: TSpeedButton
              Left = 619
              Top = 44
              Width = 25
              Height = 25
              Hint = 'Exibir valores e fórmulas'
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333033333
                33333333373F33333333333330B03333333333337F7F33333333333330F03333
                333333337F7FF3333333333330B00333333333337F773FF33333333330F0F003
                333333337F7F773F3333333330B0B0B0333333337F7F7F7F3333333300F0F0F0
                333333377F73737F33333330B0BFBFB03333337F7F33337F33333330F0FBFBF0
                3333337F7333337F33333330BFBFBFB033333373F3333373333333330BFBFB03
                33333337FFFFF7FF3333333300000000333333377777777F333333330EEEEEE0
                33333337FFFFFF7FF3333333000000000333333777777777F33333330000000B
                03333337777777F7F33333330000000003333337777777773333}
              NumGlyphs = 2
              ParentShowHint = False
              ShowHint = True
              OnClick = SbtnMensagemClick
            end
            object edvalormsg: TEdit
              Left = 456
              Top = 48
              Width = 161
              Height = 21
              TabOrder = 0
              OnChange = edtValorChange
            end
            object edtPassoMens: TEdit
              Left = 6
              Top = 48
              Width = 76
              Height = 21
              TabOrder = 1
              OnChange = edtPassoMensChange
            end
            object edtValor: TEdit
              Left = 88
              Top = 48
              Width = 361
              Height = 21
              MaxLength = 60
              TabOrder = 2
              OnChange = edtValorChange
            end
          end
          object panAtribVal: TPanel [5]
            Left = 0
            Top = 0
            Width = 636
            Height = 113
            Align = alClient
            TabOrder = 1
            Visible = False
            object Label32: TLabel
              Left = 6
              Top = 30
              Width = 71
              Height = 13
              Caption = 'Nº do Passo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label33: TLabel
              Left = 89
              Top = 30
              Width = 83
              Height = 13
              Caption = 'Operando nº 1'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object sbtnBscVariavelVar: TSpeedButton
              Left = 313
              Top = 45
              Width = 25
              Height = 25
              Hint = 'Exibir valores e fórmulas'
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333033333
                33333333373F33333333333330B03333333333337F7F33333333333330F03333
                333333337F7FF3333333333330B00333333333337F773FF33333333330F0F003
                333333337F7F773F3333333330B0B0B0333333337F7F7F7F3333333300F0F0F0
                333333377F73737F33333330B0BFBFB03333337F7F33337F33333330F0FBFBF0
                3333337F7333337F33333330BFBFBFB033333373F3333373333333330BFBFB03
                33333337FFFFF7FF3333333300000000333333377777777F333333330EEEEEE0
                33333337FFFFFF7FF3333333000000000333333777777777F33333330000000B
                03333337777777F7F33333330000000003333337777777773333}
              NumGlyphs = 2
              ParentShowHint = False
              ShowHint = True
              OnClick = sbtnBscVariavelVarClick
            end
            object Label35: TLabel
              Left = 342
              Top = 44
              Width = 11
              Height = 23
              Caption = '='
              Color = clBtnFace
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindow
              Font.Height = -19
              Font.Name = 'Bookman Old Style'
              Font.Style = [fsItalic]
              ParentColor = False
              ParentFont = False
            end
            object Label34: TLabel
              Left = 360
              Top = 30
              Width = 83
              Height = 13
              Caption = 'Operando nº 2'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object sbtnBscCampoFormula: TSpeedButton
              Left = 617
              Top = 45
              Width = 25
              Height = 25
              Hint = 'Exibir valores e fórmulas'
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333033333
                33333333373F33333333333330B03333333333337F7F33333333333330F03333
                333333337F7FF3333333333330B00333333333337F773FF33333333330F0F003
                333333337F7F773F3333333330B0B0B0333333337F7F7F7F3333333300F0F0F0
                333333377F73737F33333330B0BFBFB03333337F7F33337F33333330F0FBFBF0
                3333337F7333337F33333330BFBFBFB033333373F3333373333333330BFBFB03
                33333337FFFFF7FF3333333300000000333333377777777F333333330EEEEEE0
                33333337FFFFFF7FF3333333000000000333333777777777F33333330000000B
                03333337777777F7F33333330000000003333337777777773333}
              NumGlyphs = 2
              ParentShowHint = False
              ShowHint = True
              OnClick = sbtnBscCampoFormulaClick
            end
            object edVar1: TEdit
              Left = 87
              Top = 48
              Width = 223
              Height = 21
              ReadOnly = True
              TabOrder = 0
              OnChange = edVar1Change
            end
            object edValor5: TEdit
              Left = 359
              Top = 48
              Width = 256
              Height = 21
              TabOrder = 1
              OnChange = edValor5Change
              OnExit = edValor5Change
            end
            object chkvalor: TCheckBox
              Left = 363
              Top = 72
              Width = 118
              Height = 17
              Caption = 'Valor Constante'
              TabOrder = 2
              OnClick = edValor5Change
            end
            object edtPassoVar: TEdit
              Left = 7
              Top = 48
              Width = 76
              Height = 21
              TabOrder = 3
              OnChange = edtPassoVarChange
            end
          end
          inherited dbgrdDet: TwwDBGrid
            Width = 636
            Height = 113
            Selected.Strings = (
              'IDALGORITMODAREG'#9'9'#9'Passos'
              'DESCRICAOALGORIT'#9'120'#9'Descrição do Algoritmo'
              'FORMULA1'#9'14'#9'Número da Formula'
              'IDCAMPO'#9'12'#9'Campo (1)'
              'IDCAMPO2'#9'12'#9'Campo (2) / Regra'
              'TIPOALGORITMO'#9'13'#9'Tipo de Algoritmo'
              'TIPOCAMPO1'#9'13'#9'Tipo de Campo (1)'
              'TIPOCAMPO2'#9'13'#9'Tipo de Campo (2)'
              'VALOR'#9'60'#9'Valor Constante'
              'EXPRESSAOFORMULA'#9'200'#9'Expressão da Formula')
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            TabOrder = 9
          end
          inherited pnlControlesDet: TPanel
            Width = 636
            Height = 113
            Visible = False
          end
          object panParar: TPanel
            Left = 0
            Top = 0
            Width = 636
            Height = 113
            Align = alClient
            TabOrder = 3
            Visible = False
            object Label17: TLabel
              Left = 9
              Top = 30
              Width = 71
              Height = 13
              Caption = 'Nº do Passo'
            end
            object chkerro: TCheckBox
              Left = 147
              Top = 48
              Width = 169
              Height = 17
              Caption = 'Enviar mensagem de erro'
              TabOrder = 0
              OnClick = chkerroClick
            end
            object edtParar: TEdit
              Left = 9
              Top = 46
              Width = 76
              Height = 21
              TabOrder = 1
              OnChange = edtPararChange
            end
          end
          object panCompara: TPanel
            Left = 0
            Top = 0
            Width = 636
            Height = 113
            Align = alClient
            TabOrder = 2
            Visible = False
            object Label18: TLabel
              Left = 6
              Top = 20
              Width = 71
              Height = 13
              Caption = 'Nº do Passo'
            end
            object Panel3: TPanel
              Left = 82
              Top = 14
              Width = 560
              Height = 106
              BevelOuter = bvLowered
              TabOrder = 0
              object Label20: TLabel
                Left = 4
                Top = 7
                Width = 67
                Height = 13
                Caption = 'Compare se'
              end
              object Label21: TLabel
                Left = 4
                Top = 38
                Width = 8
                Height = 13
                Caption = 'é'
              end
              object lblComp: TLabel
                Left = 63
                Top = 38
                Width = 8
                Height = 13
                Caption = 'a'
              end
              object Label23: TLabel
                Left = 89
                Top = 62
                Width = 153
                Height = 13
                Caption = 'Se sim, vá para o passo nº'
              end
              object Label24: TLabel
                Left = 89
                Top = 86
                Width = 156
                Height = 13
                Caption = 'Se não, vá para o passo nº'
              end
              object sbtnEd1: TSpeedButton
                Left = 501
                Top = 8
                Width = 25
                Height = 20
                Hint = 'Exibir valores e fórmulas'
                Glyph.Data = {
                  76010000424D7601000000000000760000002800000020000000100000000100
                  0400000000000001000000000000000000001000000010000000000000000000
                  800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333033333
                  33333333373F33333333333330B03333333333337F7F33333333333330F03333
                  333333337F7FF3333333333330B00333333333337F773FF33333333330F0F003
                  333333337F7F773F3333333330B0B0B0333333337F7F7F7F3333333300F0F0F0
                  333333377F73737F33333330B0BFBFB03333337F7F33337F33333330F0FBFBF0
                  3333337F7333337F33333330BFBFBFB033333373F3333373333333330BFBFB03
                  33333337FFFFF7FF3333333300000000333333377777777F333333330EEEEEE0
                  33333337FFFFFF7FF3333333000000000333333777777777F33333330000000B
                  03333337777777F7F33333330000000003333337777777773333}
                NumGlyphs = 2
                ParentShowHint = False
                ShowHint = True
                OnClick = sbtnEd1Click
              end
              object sbtnEd2: TSpeedButton
                Left = 501
                Top = 29
                Width = 25
                Height = 22
                Hint = 'Exibir valores e fórmulas'
                Glyph.Data = {
                  76010000424D7601000000000000760000002800000020000000100000000100
                  0400000000000001000000000000000000001000000010000000000000000000
                  800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333033333
                  33333333373F33333333333330B03333333333337F7F33333333333330F03333
                  333333337F7FF3333333333330B00333333333337F773FF33333333330F0F003
                  333333337F7F773F3333333330B0B0B0333333337F7F7F7F3333333300F0F0F0
                  333333377F73737F33333330B0BFBFB03333337F7F33337F33333330F0FBFBF0
                  3333337F7333337F33333330BFBFBFB033333373F3333373333333330BFBFB03
                  33333337FFFFF7FF3333333300000000333333377777777F333333330EEEEEE0
                  33333337FFFFFF7FF3333333000000000333333777777777F33333330000000B
                  03333337777777F7F33333330000000003333337777777773333}
                NumGlyphs = 2
                ParentShowHint = False
                ShowHint = True
                OnClick = sbtnEd2Click
              end
              object SbtnListaValores: TSpeedButton
                Left = 530
                Top = 29
                Width = 25
                Height = 22
                Hint = 'Listas os Valores possíveis do Campo'
                Glyph.Data = {
                  9E020000424D9E0200000000000036000000280000000E0000000E0000000100
                  1800000000006802000000000000000000000000000000000000BFBFBFBFBFBF
                  BFBFBFBFBFBF0000000000000000000000000000000000000000000000000000
                  000000000000BFBFBFBFBFBFBFBFBFBFBFBF000000FFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFF0000000000BFBFBFBFBFBFBFBFBFBFBFBF0000
                  00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000BFBF
                  BFBFBFBFBFBFBFBFBFBF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFF00000000007F0000BFBFBFBFBFBFBFBFBF000000FFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000007F00007F0000BFBFBFBF
                  BFBF000000FFFFFF00007F00007F00007F00007F00007F00007FFFFFFF000000
                  00007F00007F00007F0000BFBFBF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFF00000000007F00007F0000BFBFBFBFBFBF000000FFFFFF
                  00007F00007F00007F00007F00007F00007FFFFFFF00000000007F0000BFBFBF
                  BFBFBFBFBFBF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FF0000000000BFBFBFBFBFBFBFBFBFBFBFBF000000FFFFFFFFFFFFFFFFFFFFFF
                  FF0000000000000000000000000000000000BFBFBFBFBFBFBFBFBFBFBFBF0000
                  00FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF000000BFBFBF0000BFBF
                  BFBFBFBFBFBFBFBFBFBF000000FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF00
                  0000BFBFBFBFBFBF0000BFBFBFBFBFBFBFBFBFBFBFBF000000FFFFFFFFFFFFFF
                  FFFFFFFFFF000000000000BFBFBFBFBFBFBFBFBF0000BFBFBFBFBFBFBFBFBFBF
                  BFBF000000000000000000000000000000000000BFBFBFBFBFBFBFBFBFBFBFBF
                  0000}
                ParentShowHint = False
                ShowHint = True
                Visible = False
                OnClick = SbtnListaValoresClick
              end
              object edComp1: TEdit
                Left = 88
                Top = 7
                Width = 408
                Height = 21
                TabOrder = 0
                OnChange = edComp1Change
                OnExit = edComp1Exit
              end
              object edComp2: TEdit
                Left = 88
                Top = 30
                Width = 408
                Height = 21
                TabOrder = 2
                OnChange = edComp1Change
                OnExit = edComp2Exit
              end
              object cmbCorrelacao: TComboBox
                Left = 15
                Top = 30
                Width = 46
                Height = 21
                ItemHeight = 13
                TabOrder = 1
                OnChange = cmbCorrelacaoChange
                Items.Strings = (
                  '='
                  '>'
                  '<'
                  '>='
                  '<='
                  '<>'
                  'Em')
              end
              object edtTrue: TComboBox
                Left = 248
                Top = 55
                Width = 75
                Height = 21
                ItemHeight = 13
                TabOrder = 3
                OnChange = edComp1Change
                OnExit = edtTrueExit
              end
              object edtFalse: TComboBox
                Left = 248
                Top = 79
                Width = 75
                Height = 21
                ItemHeight = 13
                TabOrder = 4
                OnChange = edComp1Change
                OnExit = edtFalseExit
              end
              object chkbVlrConst: TCheckBox
                Left = 376
                Top = 56
                Width = 118
                Height = 17
                Caption = 'Valor Constante'
                TabOrder = 5
                OnClick = chkbVlrConstClick
                OnExit = chkbVlrConstClick
              end
            end
            object edtPassoCompara: TEdit
              Left = 6
              Top = 35
              Width = 72
              Height = 21
              TabOrder = 1
              OnChange = edtPassoComparaChange
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 734
        object lblalgoritmo: TLabel [0]
          Left = 108
          Top = 10
          Width = 131
          Height = 15
          Align = alLeft
          Caption = 'Atribuir à uma Variável '
          Color = clBtnFace
          Font.Charset = ANSI_CHARSET
          Font.Color = clMaroon
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Visible = False
        end
        inherited tb97BotoesDetalhe: TToolbar97
          object SbtnRenum: TSpeedButton
            Left = 75
            Top = 0
            Width = 25
            Height = 25
            Hint = 'Renumerar os passos e as chamadas a passos da regra'
            AllowAllUp = True
            GroupIndex = 1
            Caption = 'RNº'
            Flat = True
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Arial Narrow'
            Font.Style = [fsBold]
            Layout = blGlyphTop
            NumGlyphs = 2
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            Spacing = 0
            OnClick = SbtnRenumClick
          end
        end
      end
      inherited Dock974: TDock97
        Left = 648
        Height = 141
        inherited tb97Detalhe: TToolbar97
          inherited bbtnVoltarDet: TBitBtn
            Enabled = False
          end
          object bbtnpassos: TBitBtn
            Left = 0
            Top = 81
            Width = 85
            Height = 27
            Hint = 'Visualizar passos da regra'
            Cancel = True
            Caption = '&Passos'
            TabOrder = 3
            OnClick = bbtnpassosClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              33033333333333333F7F3333333333333000333333333333F777333333333333
              000333333333333F777333333333333000333333333333F77733333333333300
              033333333FFF3F777333333700073B703333333F7773F77733333307777700B3
              33333377333777733333307F8F8F7033333337F333F337F3333377F8F9F8F773
              3333373337F3373F3333078F898F870333337F33F7FFF37F333307F99999F703
              33337F377777337F3333078F898F8703333373F337F33373333377F8F9F8F773
              333337F3373337F33333307F8F8F70333333373FF333F7333333330777770333
              333333773FF77333333333370007333333333333777333333333}
            NumGlyphs = 2
            Spacing = 0
          end
        end
        object lstId: TListBox
          Left = 6
          Top = 118
          Width = 19
          Height = 25
          ItemHeight = 13
          TabOrder = 1
          Visible = False
        end
        object lstT: TListBox
          Left = 41
          Top = 118
          Width = 19
          Height = 25
          ItemHeight = 13
          TabOrder = 2
          Visible = False
        end
        object lstF: TListBox
          Left = 23
          Top = 118
          Width = 19
          Height = 25
          ItemHeight = 13
          TabOrder = 3
          Visible = False
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 744
    object Toolbar972: TToolbar97
      Left = 244
      Top = 0
      Caption = '`'
      CloseButton = False
      DefaultDock = Dock972
      DockPos = 244
      TabOrder = 1
      object sbtnCopiar: TToolbarButton97
        Left = 60
        Top = 0
        Width = 60
        Height = 41
        Hint = 'Procura de formulas, campos, variaveis'
        AllowAllUp = True
        GroupIndex = 1
        Caption = '&Copiar'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555000000
          000055555F77777777775555000FFFFFFFF0555F777F5FFFF55755000F0F0000
          FFF05F777F7F77775557000F0F0FFFFFFFF0777F7F7F5FFFFFF70F0F0F0F0000
          00F07F7F7F7F777777570F0F0F0FFFFFFFF07F7F7F7F5FFFFFF70F0F0F0F0000
          00F07F7F7F7F777777570F0F0F0FFFFFFFF07F7F7F7F5FFF55570F0F0F0F000F
          FFF07F7F7F7F77755FF70F0F0F0FFFFF00007F7F7F7F5FF577770F0F0F0F00FF
          0F057F7F7F7F77557F750F0F0F0FFFFF00557F7F7F7FFFFF77550F0F0F000000
          05557F7F7F77777775550F0F0000000555557F7F7777777555550F0000000555
          55557F7777777555555500000005555555557777777555555555}
        Layout = blGlyphTop
        NumGlyphs = 2
        Opaque = False
        Spacing = 0
        OnClick = sbtnCopiarClick
      end
      object sbtnGeral: TToolbarButton97
        Left = 0
        Top = 0
        Width = 60
        Height = 41
        Hint = 'Procura de formulas, campos, variaveis'
        AllowAllUp = True
        GroupIndex = 1
        Caption = '&Formulas'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333CCCCC33
          33333FFFF77777FFFFFFCCCCCC808CCCCCC3777777F7F777777F008888070888
          8003777777777777777F0F0770F7F0770F0373F33337F333337370FFFFF7FFFF
          F07337F33337F33337F370FFFB99FBFFF07337F33377F33337F330FFBF99BFBF
          F033373F337733333733370BFBF7FBFB0733337F333FF3337F33370FBF98BFBF
          0733337F3377FF337F333B0BFB990BFB03333373FF777FFF73333FB000B99000
          B33333377737777733333BFBFBFB99FBF33333333FF377F333333FBF99BF99BF
          B333333377F377F3333333FB99FB99FB3333333377FF77333333333FB9999FB3
          333333333777733333333333FBFBFB3333333333333333333333}
        Layout = blGlyphTop
        NumGlyphs = 2
        Opaque = False
        Spacing = 0
        OnClick = sbtnGeralClick
      end
    end
  end
  inherited Dock971: TDock97
    Top = 404
    Width = 744
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  inherited dsDet: TwwDataSource
    DataSet = QryDet
    Left = 466
    Top = 232
  end
  inherited ds: TwwDataSource
    Left = 437
    Top = 104
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update REGRA'
      'set'
      '  NOMEREGRA = :NOMEREGRA,'
      '  IDTIPOREGRA = :IDTIPOREGRA,'
      '  DESCRICAOREGRA = :DESCRICAOREGRA,'
      '  PUBLICADA = :PUBLICADA'
      'where'
      '  IDREGRA = :OLD_IDREGRA')
    InsertSQL.Strings = (
      'insert into REGRA'
      '  (IDREGRA, NOMEREGRA, IDTIPOREGRA, DESCRICAOREGRA, PUBLICADA)'
      'values'
      
        '  (:IDREGRA, :NOMEREGRA, :IDTIPOREGRA, :DESCRICAOREGRA, :PUBLICA' +
        'DA)')
    DeleteSQL.Strings = (
      'delete from REGRA'
      'where'
      '  IDREGRA = :OLD_IDREGRA')
    Left = 377
    Top = 104
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'REGRA.IDREGRA'
      'REGRA.NOMEREGRA'
      'TIPOREGRA.DESCREGRA')
    TipodeDado.Strings = (
      'N'
      'C'
      'C')
    Descricao.Strings = (
      'Número da Regra'
      'Nome da Regra'
      'Tipo da Regra')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'REGRA'
      'TIPOREGRA'
      'GRUPOREGRAUSUARIO')
    CamposChave.Strings = (
      'REGRA.IDREGRA'
      'TIPOREGRA.IDGRUPOREGRA'
      'TIPOREGRA.IDTIPOREGRA')
    Filtro.Strings = (
      'REGRA.IDTIPOREGRA = TIPOREGRA.IDTIPOREGRA'
      
        '( TIPOREGRA.IDGRUPOREGRA = GRUPOREGRAUSUARIO.IDGRUPOREGRA OR TIP' +
        'OREGRA.IDTIPOREGRA  = GRUPOREGRAUSUARIO.IDTIPOREGRA )'
      'GRUPOREGRAUSUARIO.FLGPROCURAR = 1')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '60'
      '60')
    UsaDistinct = True
    ExibePergunta = False
    Left = 687
    Top = 16
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 670
    Top = 74
  end
  inherited qry: TwwQuery
    Tag = 5
    SQL.Strings = (
      'SELECT'
      
        '        IDREGRA, NOMEREGRA, IDTIPOREGRA, DESCRICAOREGRA, PUBLICA' +
        'DA'
      'FROM'
      '        REGRA'
      'WHERE'
      '        IDREGRA = :ID')
    Left = 408
    Top = 104
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptUnknown
      end>
  end
  inherited CmeDetalhe: TCmEventosCadastro
    OnOpenDataSet = CmeDetalheOpenDataSet
    Left = 704
    Top = 74
  end
  object QryDet: TwwQuery
    Tag = 5
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '  A.IDREGRA,  A.IDCAMPO, A.FORMULA1,      A.CORRELACAO,       A.' +
        'FORMATACAO,'
      
        '  A.IDCAMPO2, A.VALOR,   A.TIPOALGORITMO, A.DESCRICAOALGORIT, A.' +
        'FORMULA2,'
      
        '  A.ALGORSUBSEQTRUE,     A.TIPOCAMPO1,    A.IDALGORITMODAREG, A.' +
        'TIPOCAMPO2,'
      '  A.ALGORSUBSEQFALSE,    F1.EXPRESSAOFORMULA'
      'FROM'
      '  ALGREGRA A, FORMULA F1'
      'WHERE'
      '  IDREGRA    = :ID  AND'
      #9' A.FORMULA1 = F1.IDFORMULA(+)'
      'ORDER BY'
      '  A.IDALGORITMODAREG'
      ' ')
    UpdateObject = updDet
    ValidateWithMask = True
    Left = 437
    Top = 232
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptUnknown
      end>
    object QryDetIDALGORITMODAREG: TFloatField
      DisplayLabel = 'Passos'
      DisplayWidth = 9
      FieldName = 'IDALGORITMODAREG'
      Origin = 'ALGREGRA.IDALGORITMODAREG'
    end
    object QryDetDESCRICAOALGORIT: TStringField
      DisplayLabel = 'Descrição do Algoritmo'
      DisplayWidth = 120
      FieldName = 'DESCRICAOALGORIT'
      Origin = 'ALGREGRA.DESCRICAOALGORIT'
      Size = 120
    end
    object QryDetFORMULA1: TFloatField
      DisplayLabel = 'Número da Formula'
      DisplayWidth = 14
      FieldName = 'FORMULA1'
      Origin = 'ALGREGRA.FORMULA1'
    end
    object QryDetIDCAMPO: TStringField
      DisplayLabel = 'Campo (1)'
      DisplayWidth = 12
      FieldName = 'IDCAMPO'
      Origin = 'ALGREGRA.IDCAMPO'
      Size = 12
    end
    object QryDetIDCAMPO2: TStringField
      DisplayLabel = 'Campo (2) / Regra'
      DisplayWidth = 12
      FieldName = 'IDCAMPO2'
      Origin = 'ALGREGRA.IDCAMPO2'
      Size = 12
    end
    object QryDetTIPOALGORITMO: TFloatField
      DisplayLabel = 'Tipo de Algoritmo'
      DisplayWidth = 13
      FieldName = 'TIPOALGORITMO'
      Origin = 'ALGREGRA.TIPOALGORITMO'
    end
    object QryDetTIPOCAMPO1: TFloatField
      DisplayLabel = 'Tipo de Campo (1)'
      DisplayWidth = 13
      FieldName = 'TIPOCAMPO1'
      Origin = 'ALGREGRA.TIPOCAMPO1'
    end
    object QryDetTIPOCAMPO2: TFloatField
      DisplayLabel = 'Tipo de Campo (2)'
      DisplayWidth = 13
      FieldName = 'TIPOCAMPO2'
      Origin = 'ALGREGRA.TIPOCAMPO2'
    end
    object QryDetVALOR: TStringField
      DisplayLabel = 'Valor Constante'
      DisplayWidth = 60
      FieldName = 'VALOR'
      Origin = 'ALGREGRA.VALOR'
      Size = 60
    end
    object QryDetEXPRESSAOFORMULA: TStringField
      DisplayLabel = 'Expressão da Formula'
      DisplayWidth = 200
      FieldName = 'EXPRESSAOFORMULA'
      Size = 255
    end
    object QryDetIDREGRA: TFloatField
      FieldName = 'IDREGRA'
      Origin = 'ALGREGRA.IDREGRA'
      Visible = False
    end
    object QryDetCORRELACAO: TStringField
      FieldName = 'CORRELACAO'
      Origin = 'ALGREGRA.CORRELACAO'
      Visible = False
      Size = 2
    end
    object QryDetFORMULA2: TFloatField
      FieldName = 'FORMULA2'
      Origin = 'ALGREGRA.FORMULA2'
      Visible = False
    end
    object QryDetALGORSUBSEQTRUE: TFloatField
      FieldName = 'ALGORSUBSEQTRUE'
      Origin = 'ALGREGRA.ALGORSUBSEQTRUE'
      Visible = False
    end
    object QryDetALGORSUBSEQFALSE: TFloatField
      FieldName = 'ALGORSUBSEQFALSE'
      Origin = 'ALGREGRA.ALGORSUBSEQFALSE'
      Visible = False
    end
    object QryDetFORMATACAO: TFloatField
      FieldName = 'FORMATACAO'
      Origin = 'ALGREGRA.FORMATACAO'
      Visible = False
    end
  end
  object updDet: TUpdateSQL
    ModifySQL.Strings = (
      'update ALGREGRA'
      'set'
      '  IDALGORITMODAREG = :IDALGORITMODAREG,'
      '  IDCAMPO = :IDCAMPO,'
      '  FORMULA1 = :FORMULA1,'
      '  CORRELACAO = :CORRELACAO,'
      '  FORMULA2 = :FORMULA2,'
      '  IDCAMPO2 = :IDCAMPO2,'
      '  VALOR = :VALOR,'
      '  TIPOALGORITMO = :TIPOALGORITMO,'
      '  DESCRICAOALGORIT = :DESCRICAOALGORIT,'
      '  ALGORSUBSEQTRUE = :ALGORSUBSEQTRUE,'
      '  ALGORSUBSEQFALSE = :ALGORSUBSEQFALSE,'
      '  TIPOCAMPO1 = :TIPOCAMPO1,'
      '  TIPOCAMPO2 = :TIPOCAMPO2,'
      '  FORMATACAO = :FORMATACAO'
      'where'
      '  IDREGRA = :OLD_IDREGRA and'
      '  IDALGORITMODAREG = :OLD_IDALGORITMODAREG')
    InsertSQL.Strings = (
      'insert into ALGREGRA'
      '  (IDREGRA, IDALGORITMODAREG, IDCAMPO, FORMULA1, CORRELACAO, '
      'FORMULA2, '
      '   IDCAMPO2, VALOR, TIPOALGORITMO, DESCRICAOALGORIT, '
      'ALGORSUBSEQTRUE, ALGORSUBSEQFALSE, '
      '   TIPOCAMPO1, TIPOCAMPO2, FORMATACAO)'
      'values'
      
        '  (:IDREGRA, :IDALGORITMODAREG, :IDCAMPO, :FORMULA1, :CORRELACAO' +
        ', '
      ':FORMULA2, '
      '   :IDCAMPO2, :VALOR, :TIPOALGORITMO, :DESCRICAOALGORIT, '
      ':ALGORSUBSEQTRUE, '
      '   :ALGORSUBSEQFALSE, :TIPOCAMPO1, :TIPOCAMPO2, :FORMATACAO)')
    DeleteSQL.Strings = (
      'delete from ALGREGRA'
      'where'
      '  IDREGRA = :OLD_IDREGRA and'
      '  IDALGORITMODAREG = :OLD_IDALGORITMODAREG')
    Left = 497
    Top = 232
  end
  object QryTipoRegra: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      IDTIPOREGRA, DESCREGRA, IDGRUPOREGRA'
      'FROM'
      '    TIPOREGRA'
      'ORDER BY'
      '      DESCREGRA')
    ValidateWithMask = True
    Left = 568
    Top = 156
  end
  object QryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 477
    Top = 156
  end
  object msGeral: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Selecionando regras com suas formulas'
    Colunas.Strings = (
      'REGRA.IDREGRA'
      'ALGREGRA.IDALGORITMODAREG'
      'REGRA.NOMEREGRA'
      'ALGREGRA.DESCRICAOALGORIT'
      'FORMULA.IDFORMULA'
      'FORMULA.DESCRICAOFORMULA'
      'FORMULA.EXPRESSAOREAL'
      'TIPOREGRA.DESCREGRA')
    TipodeDado.Strings = (
      'N'
      'N'
      'C'
      'C'
      'N'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Número da Regra'
      'Passos da Regra'
      'Nome da Regra'
      'Descrição dos Passos'
      'Número da Formula'
      'Descrição da Formula'
      'Expressão Real'
      'Tipo de Regra')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'REGRA'
      'FORMULA'
      'ALGREGRA'
      'TIPOREGRA'
      'GRUPOREGRAUSUARIO')
    CamposChave.Strings = (
      'REGRA.IDREGRA'
      'ALGREGRA.IDALGORITMODAREG'
      'TIPOREGRA.IDGRUPOREGRA'
      'TIPOREGRA.IDTIPOREGRA')
    Filtro.Strings = (
      'ALGREGRA.IDREGRA = REGRA.IDREGRA'
      'ALGREGRA.FORMULA1 = FORMULA.IDFORMULA'
      'GRUPOREGRAUSUARIO.FLGPROCURAR = 1'
      
        '( TIPOREGRA.IDGRUPOREGRA = GRUPOREGRAUSUARIO.IDGRUPOREGRA OR TIP' +
        'OREGRA.IDTIPOREGRA  = GRUPOREGRAUSUARIO.IDTIPOREGRA )'
      'REGRA.IDTIPOREGRA = TIPOREGRA.IDTIPOREGRA')
    Mascaras.Strings = (
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
      '10'
      '60'
      '120'
      '10'
      '60'
      '255'
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = True
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 656
    Top = 17
  end
  object QryParam: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      FLGCAMPO, FLGVARIAVEL'
      'FROM'
      '    PARAMREGRA')
    ValidateWithMask = True
    Left = 537
    Top = 156
  end
  object QryPermissao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDGRUPOREGRA, IDUSUARIO, FLGINSERIR, FLGALTERAR,'
      '  FLGEXCLUIR, FLGPROCURAR'
      'FROM'
      '  GRUPOREGRAUSUARIO'
      'WHERE'
      '  (IDGRUPOREGRA = :GRUPO OR IDTIPOREGRA  = :TIPO ) AND'
      '  (IDUSUARIO = :USUARIO)'
      ''
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 507
    Top = 156
    ParamData = <
      item
        DataType = ftInteger
        Name = 'GRUPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'TIPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'USUARIO'
        ParamType = ptUnknown
      end>
  end
end
