inherited frmCadWebInterface: TfrmCadWebInterface
  Left = 157
  Top = 78
  HelpContext = 4650001
  Caption = 'Cadastro de Interface'
  ClientHeight = 442
  ClientWidth = 508
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 508
    Height = 356
    object PageControl: TPageControl
      Left = 1
      Top = 33
      Width = 506
      Height = 322
      ActivePage = tabGerais
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object tabGerais: TTabSheet
        Caption = 'Configurações Gerais'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        object lblEMail: TLabel
          Left = 8
          Top = 51
          Width = 193
          Height = 13
          AutoSize = False
          Caption = 'E-Mail para Contato'
          FocusControl = dbedtEMail
        end
        object lblTimeOut: TLabel
          Left = 8
          Top = 190
          Width = 329
          Height = 13
          AutoSize = False
          Caption = 'Intervalo máximo de inatividade (TimeOut), em segundos'
        end
        object lblEndLogin: TLabel
          Left = 8
          Top = 96
          Width = 193
          Height = 13
          AutoSize = False
          Caption = 'Endereço da página de login:'
          FocusControl = dbedtEndLogin
        end
        object Label2: TLabel
          Left = 8
          Top = 8
          Width = 62
          Height = 13
          Caption = 'Descrição:'
          FocusControl = dbedtEMail
        end
        object Label3: TLabel
          Left = 8
          Top = 141
          Width = 101
          Height = 13
          AutoSize = False
          Caption = 'Diretório Físico:'
          FocusControl = dbedtEndLogin
        end
        object spbAbreDir: TSpeedButton
          Left = 459
          Top = 157
          Width = 23
          Height = 22
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
            5555555555555555555555555555555555555555555555555555555555555555
            555555555555555555555555555555555555555FFFFFFFFFF555550000000000
            55555577777777775F55500B8B8B8B8B05555775F555555575F550F0B8B8B8B8
            B05557F75F555555575F50BF0B8B8B8B8B0557F575FFFFFFFF7F50FBF0000000
            000557F557777777777550BFBFBFBFB0555557F555555557F55550FBFBFBFBF0
            555557F555555FF7555550BFBFBF00055555575F555577755555550BFBF05555
            55555575FFF75555555555700007555555555557777555555555555555555555
            5555555555555555555555555555555555555555555555555555}
          NumGlyphs = 2
          OnClick = btnDirClick
        end
        object dbedtEMail: TDBEdit
          Left = 8
          Top = 67
          Width = 473
          Height = 21
          DataField = 'EMAIL'
          DataSource = ds
          TabOrder = 1
        end
        object edtTimeOut: TEdit
          Left = 8
          Top = 206
          Width = 73
          Height = 21
          TabOrder = 4
          Text = '0'
          OnExit = edtTimeOutExit
          OnKeyPress = edtTimeOutKeyPress
        end
        object updTimeOut: TUpDown
          Left = 81
          Top = 206
          Width = 16
          Height = 21
          Associate = edtTimeOut
          Min = 0
          Max = 12000
          Position = 0
          TabOrder = 5
          Thousands = False
          Wrap = False
        end
        object dbedtEndLogin: TDBEdit
          Left = 8
          Top = 112
          Width = 473
          Height = 21
          DataField = 'ENDLOGIN'
          DataSource = ds
          TabOrder = 2
          OnExit = dbedtEndLoginExit
        end
        object dbedtNomeInterface: TwwDBEdit
          Left = 8
          Top = 24
          Width = 473
          Height = 21
          DataField = 'NOMEINTERFACE'
          DataSource = ds
          TabOrder = 0
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object DBCheckDemo: TDBCheckBox
          Left = 280
          Top = 237
          Width = 137
          Height = 17
          Caption = 'Demonstração'
          DataField = 'FLGDEMO'
          DataSource = ds
          TabOrder = 8
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object DBCheckUsaMenu: TDBCheckBox
          Left = 8
          Top = 237
          Width = 79
          Height = 17
          Caption = 'Usa Menu'
          DataField = 'FLGUSAMENU'
          DataSource = ds
          TabOrder = 6
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object DBCheckUsaLayers: TDBCheckBox
          Left = 8
          Top = 260
          Width = 85
          Height = 17
          Caption = 'Usa Layers'
          DataField = 'FLGUSALAYERS'
          DataSource = ds
          TabOrder = 7
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object DBCheckJanelaRelat: TDBCheckBox
          Left = 280
          Top = 259
          Width = 201
          Height = 17
          Caption = 'Abre nova janela para relatórios'
          DataField = 'FLGJANELARELAT'
          DataSource = ds
          TabOrder = 9
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object dbedDirFisico: TDBEdit
          Left = 8
          Top = 157
          Width = 452
          Height = 21
          DataField = 'DIRFISICO'
          DataSource = ds
          TabOrder = 3
          OnExit = dbedtEndLoginExit
        end
      end
      object tabMenu: TTabSheet
        Caption = 'Menu dinâmico'
        ImageIndex = 1
        object lblMenuAltura: TLabel
          Left = 7
          Top = 5
          Width = 131
          Height = 13
          Caption = 'Altura do item de menu'
          FocusControl = dbedtMenuAltura
        end
        object lblMenuLargura: TLabel
          Left = 335
          Top = 5
          Width = 141
          Height = 13
          Caption = 'Largura do item de menu'
          FocusControl = dbedtMenuLargura
        end
        object lblMenuTamFonte: TLabel
          Left = 7
          Top = 46
          Width = 107
          Height = 13
          Caption = 'Tamanho da Fonte'
          FocusControl = dbedtMenuTamFonte
        end
        object lblMenuPosX: TLabel
          Left = 7
          Top = 88
          Width = 110
          Height = 13
          Caption = 'Posição X do menu'
          FocusControl = dbedtMenuPosX
        end
        object lblMenuPosY: TLabel
          Left = 335
          Top = 88
          Width = 110
          Height = 13
          Caption = 'Posição Y do menu'
          FocusControl = dbedtMenuPosY
        end
        object lblMenuDistancia: TLabel
          Left = 335
          Top = 46
          Width = 127
          Height = 13
          Caption = 'Distância entre menus'
          FocusControl = dbedtMenuDistancia
        end
        object lblMenuNomeFonte: TLabel
          Left = 7
          Top = 132
          Width = 33
          Height = 13
          Caption = 'Fonte'
          FocusControl = dbedtMenuNomeFonte
        end
        object lblMenuCorFonte: TLabel
          Left = 7
          Top = 171
          Width = 176
          Height = 13
          Caption = 'Cor da fonte (não selecionado)'
          FocusControl = dbedtMenuCorFonte
        end
        object lblMenuCorFonteSel: TLabel
          Left = 330
          Top = 171
          Width = 151
          Height = 13
          Caption = 'Cor da fonte (selecionado)'
          FocusControl = dbedtMenuCorFonteSel
        end
        object lblMenuCorFundo: TLabel
          Left = 7
          Top = 217
          Width = 179
          Height = 13
          Caption = 'Cor do fundo (não selecionado)'
          FocusControl = dbedtMenuCorFundo
        end
        object lblMenuCorFundoSel: TLabel
          Left = 330
          Top = 217
          Width = 154
          Height = 13
          Caption = 'Cor do fundo (selecionado)'
          FocusControl = dbedtMenuCorFundoSel
        end
        object dbedtMenuAltura: TDBEdit
          Left = 7
          Top = 21
          Width = 145
          Height = 21
          DataField = 'MENUALTURA'
          DataSource = ds
          TabOrder = 0
        end
        object dbedtMenuLargura: TDBEdit
          Left = 335
          Top = 21
          Width = 145
          Height = 21
          DataField = 'MENULARGURA'
          DataSource = ds
          TabOrder = 1
        end
        object dbedtMenuTamFonte: TDBEdit
          Left = 7
          Top = 62
          Width = 145
          Height = 21
          DataField = 'MENUTAMFONTE'
          DataSource = ds
          TabOrder = 2
        end
        object dbedtMenuPosX: TDBEdit
          Left = 7
          Top = 104
          Width = 145
          Height = 21
          DataField = 'MENUPOSX'
          DataSource = ds
          TabOrder = 4
        end
        object dbedtMenuPosY: TDBEdit
          Left = 335
          Top = 104
          Width = 145
          Height = 21
          DataField = 'MENUPOSY'
          DataSource = ds
          TabOrder = 5
        end
        object dbedtMenuDistancia: TDBEdit
          Left = 335
          Top = 62
          Width = 145
          Height = 21
          DataField = 'MENUDISTANCIA'
          DataSource = ds
          TabOrder = 3
        end
        object dbedtMenuNomeFonte: TDBEdit
          Left = 7
          Top = 144
          Width = 473
          Height = 21
          DataField = 'MENUNOMEFONTE'
          DataSource = ds
          TabOrder = 6
        end
        object dbedtMenuCorFonte: TDBEdit
          Left = 7
          Top = 187
          Width = 124
          Height = 21
          DataField = 'MENUCORFONTE'
          DataSource = ds
          TabOrder = 7
          OnExit = dbedtMenuCorFonteExit
        end
        object dbedtMenuCorFonteSel: TDBEdit
          Left = 331
          Top = 187
          Width = 124
          Height = 21
          DataField = 'MENUCORFONTESEL'
          DataSource = ds
          TabOrder = 8
          OnExit = dbedtMenuCorFonteSelExit
        end
        object dbedtMenuCorFundo: TDBEdit
          Left = 7
          Top = 233
          Width = 124
          Height = 21
          DataField = 'MENUCORFUNDO'
          DataSource = ds
          TabOrder = 9
          OnExit = dbedtMenuCorFundoExit
        end
        object dbedtMenuCorFundoSel: TDBEdit
          Left = 331
          Top = 233
          Width = 124
          Height = 21
          DataField = 'MENUCORFUNDOSEL'
          DataSource = ds
          TabOrder = 10
          OnExit = dbedtMenuCorFundoSelExit
        end
        object btnPadrao: TButton
          Left = 171
          Top = 259
          Width = 144
          Height = 20
          Caption = 'Valores Padrão'
          TabOrder = 11
          OnClick = btnPadraoClick
        end
        object pnlMenuCorFonte: TPanel
          Left = 130
          Top = 187
          Width = 21
          Height = 21
          Color = clBlack
          TabOrder = 12
          OnClick = pnlMenuCorFonteClick
          OnMouseDown = pnlMenuCorFonteMouseDown
          OnMouseUp = pnlMenuCorFonteMouseUp
        end
        object pnlMenuCorFundo: TPanel
          Left = 130
          Top = 233
          Width = 21
          Height = 21
          Color = clBlack
          TabOrder = 14
          OnClick = pnlMenuCorFundoClick
          OnMouseDown = pnlMenuCorFundoMouseDown
          OnMouseUp = pnlMenuCorFundoMouseUp
        end
        object pnlMenuCorFonteSel: TPanel
          Left = 454
          Top = 188
          Width = 21
          Height = 21
          Color = clBlack
          TabOrder = 13
          OnClick = pnlMenuCorFonteSelClick
          OnMouseDown = pnlMenuCorFonteSelMouseDown
          OnMouseUp = pnlMenuCorFonteSelMouseUp
        end
        object pnlMenuCorFundoSel: TPanel
          Left = 454
          Top = 234
          Width = 21
          Height = 21
          Color = clBlack
          TabOrder = 15
          OnClick = pnlMenuCorFundoSelClick
          OnMouseDown = pnlMenuCorFundoSelMouseDown
          OnMouseUp = pnlMenuCorFundoSelMouseUp
        end
      end
    end
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 506
      Height = 32
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object Label1: TLabel
        Left = 11
        Top = 8
        Width = 97
        Height = 13
        Caption = 'Id. da Interface: '
      end
      object dbEdtIDWebInterface: TwwDBEdit
        Left = 110
        Top = 5
        Width = 121
        Height = 21
        Color = clBtnFace
        DataField = 'IDWEBINTERFACE'
        DataSource = ds
        ReadOnly = True
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
  end
  inherited Dock972: TDock97
    Width = 508
  end
  inherited Dock971: TDock97
    Top = 403
    Width = 508
    inherited tb97Fundo: TToolbar97
      Left = 336
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 167
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 378
    Top = 15
    TargetsData = (
      1
      1
      (
        ''
        'Lines'
        0))
  end
  inherited ds: TwwDataSource
    Left = 406
    Top = 65535
  end
  inherited ImlPadrao: TImageList
    Left = 256
    Top = 7
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    Left = 464
    Top = 7
  end
  inherited Cds: TCMClientDataSet
    ProviderName = 'DataSetProvider1'
    AfterInsert = CdsAfterInsert
    Left = 292
    Top = 7
    object CdsIDWEBINTERFACE: TFloatField
      FieldName = 'IDWEBINTERFACE'
    end
    object CdsNOMEINTERFACE: TStringField
      FieldName = 'NOMEINTERFACE'
      Size = 50
    end
    object CdsENDLOGIN: TStringField
      DisplayWidth = 255
      FieldName = 'ENDLOGIN'
      Size = 255
    end
    object CdsEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 50
    end
    object CdsTIMEOUT: TFloatField
      FieldName = 'TIMEOUT'
    end
    object CdsMENUALTURA: TFloatField
      FieldName = 'MENUALTURA'
    end
    object CdsMENULARGURA: TFloatField
      FieldName = 'MENULARGURA'
    end
    object CdsMENUTAMFONTE: TFloatField
      FieldName = 'MENUTAMFONTE'
    end
    object CdsMENUPOSX: TFloatField
      FieldName = 'MENUPOSX'
    end
    object CdsMENUPOSY: TFloatField
      FieldName = 'MENUPOSY'
    end
    object CdsMENUDISTANCIA: TFloatField
      FieldName = 'MENUDISTANCIA'
    end
    object CdsMENUNOMEFONTE: TStringField
      FieldName = 'MENUNOMEFONTE'
      Size = 50
    end
    object CdsMENUCORFONTE: TStringField
      FieldName = 'MENUCORFONTE'
    end
    object CdsMENUCORFONTESEL: TStringField
      FieldName = 'MENUCORFONTESEL'
    end
    object CdsMENUCORFUNDO: TStringField
      FieldName = 'MENUCORFUNDO'
    end
    object CdsMENUCORFUNDOSEL: TStringField
      FieldName = 'MENUCORFUNDOSEL'
    end
    object CdsFLGUSAMENU: TStringField
      FieldName = 'FLGUSAMENU'
      FixedChar = True
      Size = 1
    end
    object CdsFLGUSALAYERS: TStringField
      FieldName = 'FLGUSALAYERS'
      FixedChar = True
      Size = 1
    end
    object CdsFLGDEMO: TStringField
      FieldName = 'FLGDEMO'
      FixedChar = True
      Size = 1
    end
    object CdsFLGJANELARELAT: TStringField
      FieldName = 'FLGJANELARELAT'
      Size = 1
    end
    object CdsDIRFISICO: TStringField
      FieldName = 'DIRFISICO'
      Size = 255
    end
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'WEBINTERFACE.IDWEBINTERFACE'
      'WEBINTERFACE.NOMEINTERFACE'
      'WEBINTERFACE.ENDLOGIN')
    TipodeDado.Strings = (
      'N'
      'C'
      'C')
    Descricao.Strings = (
      'Id. da Interface'
      'Descrição'
      'Endereço da Página de Login')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'WEBINTERFACE')
    CamposChave.Strings = (
      'WEBINTERFACE.IDWEBINTERFACE')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '50'
      '100')
    Left = 344
    Top = 7
  end
  object dlgCor: TColorDialog
    Ctl3D = True
    Options = [cdFullOpen, cdPreventFullOpen, cdAnyColor]
    Left = 417
    Top = 53
  end
  object ProcuraDirDlg: TProcuraDirDlg
    Caption = 'Localizar o Diretório Físico'
    Options = [bfStatusText]
    ShowPath = True
    Title = 'Indique o diretório físico do Auto-Atendimento'
    OnSelectionChanged = ProcuraDirDlgSelectionChanged
    Left = 317
    Top = 68
  end
end
