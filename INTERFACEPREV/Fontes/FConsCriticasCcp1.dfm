inherited frmConsCriticasCcp: TfrmConsCriticasCcp
  Left = 32
  Top = 7
  Caption = 'Consulta de Críticas na Importação de Dados Cadastrais'
  ClientHeight = 513
  ClientWidth = 742
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 742
    Height = 474
    object pnlOcorrencias: TPanel
      Left = 1
      Top = 99
      Width = 740
      Height = 374
      Align = alClient
      BevelOuter = bvNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object grpResumo: TGroupBox
        Left = 0
        Top = 0
        Width = 740
        Height = 374
        Align = alClient
        Caption = ' Resumo de Ocorrências '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -16
        Font.Name = 'Bookman Old Style'
        Font.Style = [fsItalic]
        ParentFont = False
        TabOrder = 0
        object Label7: TLabel
          Left = 2
          Top = 354
          Width = 736
          Height = 18
          Align = alBottom
          Alignment = taCenter
          Caption = 
            'Clique duas vezes sobre o Tipo de Ocorrência para visualizar seu' +
            ' detalhamento'
        end
        object dbgrdResumo: TwwDBGrid
          Left = 2
          Top = 20
          Width = 736
          Height = 334
          Selected.Strings = (
            'COUNT(1)'#9'10'#9'Quantidade'
            'DESCERRO'#9'65'#9'Descrição'
            'CODERRO'#9'14'#9'Código'
            'GRUPO'#9'21'#9'Grupo')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsResumo
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          ParentFont = False
          TabOrder = 0
          TitleAlignment = taLeftJustify
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clBlack
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          TitleLines = 1
          TitleButtons = False
          OnDblClick = dbgrdResumoDblClick
          IndicatorColor = icBlack
        end
      end
      object grpDet: TGroupBox
        Left = 0
        Top = 0
        Width = 740
        Height = 374
        Align = alClient
        Caption = ' Detalhamento da Ocorrência "xxxx" '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -16
        Font.Name = 'Bookman Old Style'
        Font.Style = [fsItalic]
        ParentFont = False
        TabOrder = 1
        object Panel3: TPanel
          Left = 682
          Top = 20
          Width = 56
          Height = 352
          Align = alRight
          BevelOuter = bvNone
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Bookman Old Style'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object btnaceitar: TSpeedButton
            Left = 7
            Top = 55
            Width = 45
            Height = 53
            Hint = 'Aceitar a atualizar modificações'
            Caption = 'Aceitar'
            Flat = True
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              3333333333333333333333333333333333333FFF333333333333000333333333
              3333777FFF3FFFFF33330B000300000333337F777F777773F333000E00BFBFB0
              3333777F773333F7F333000E0BFBF0003333777F7F3337773F33000E0FBFBFBF
              0333777F7F3333FF7FFF000E0BFBF0000003777F7F3337777773000E0FBFBFBF
              BFB0777F7F33FFFFFFF7000E0BF000000003777F7FF777777773000000BFB033
              33337777773FF733333333333300033333333333337773333333333333333333
              3333333333333333333333333333333333333333333333333333333333333333
              3333333333333333333333333333333333333333333333333333}
            Layout = blGlyphTop
            NumGlyphs = 2
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            OnClick = btnaceitarClick
          end
          object btnrejeitar: TSpeedButton
            Left = 7
            Top = 120
            Width = 45
            Height = 53
            Hint = 'ejeitar Modificações'
            Caption = 'Rejeitar'
            Flat = True
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              33333333333333333333333333333333333333333333333333FF333333333333
              3000333333FFFFF3F77733333000003000B033333777773777F733330BFBFB00
              E00033337FFF3377F7773333000FBFB0E000333377733337F7773330FBFBFBF0
              E00033F7FFFF3337F7773000000FBFB0E000377777733337F7770BFBFBFBFBF0
              E00073FFFFFFFF37F777300000000FB0E000377777777337F7773333330BFB00
              000033333373FF77777733333330003333333333333777333333333333333333
              3333333333333333333333333333333333333333333333333333333333333333
              3333333333333333333333333333333333333333333333333333}
            Layout = blGlyphTop
            NumGlyphs = 2
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            OnClick = btnrejeitarClick
          end
          object btndesfaz: TSpeedButton
            Left = 7
            Top = 185
            Width = 45
            Height = 53
            Hint = 'Desfazer Modificações'
            Caption = 'Desfazer'
            Flat = True
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000C40E0000C40E00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00339933333399
              9333333333333333333333993333339993333FFF333333333333009933339999
              3333777FFF3FFFFF33330B999900999933337F777F777773F3330099999F99B0
              3333777F773333F7F333000E999999003333777F7F3337773F33000E099999BF
              0333777F7F3333FF7FFF000E0B9999000003777F7F3337777773000E999999BF
              BFB0777F7F33FFFFFFF7000E999999000003777F7FF777777773000999BF9993
              33337777773FF733333333999900999333333333337773333333339993333999
              3333333333333333333333993333399933333333333333333333339933333399
              9933333333333333333333993333339999333333333333333333}
            Layout = blGlyphTop
            NumGlyphs = 2
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            OnClick = btndesfazClick
          end
          object sbtnVoltar: TSpeedButton
            Left = 7
            Top = 274
            Width = 45
            Height = 53
            Hint = 'Aceitar a atualizar modificações'
            Caption = 'Voltar'
            Flat = True
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Glyph.Data = {
              E6000000424DE60000000000000076000000280000000E0000000E0000000100
              0400000000007000000000000000000000001000000010000000000000000000
              BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
              DD00DDDDD4444DDDDD00DDD44444444DDD00DD444DDDD444DD00DD44DDDDDD44
              DD00D44DDDDDDDD44D00D44DDDDDDDD44D00D44DDDDDDDD44D00D44DDDDDDDD4
              4D00DD44DDDD4D44DD00DD44DDDD4444DD00DDDDDDDD444DDD00DDDDDDDD4444
              DD00DDDDDDDDDDDDDD00}
            Layout = blGlyphTop
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            OnClick = sbtnVoltarClick
          end
        end
        object Panel5: TPanel
          Left = 2
          Top = 20
          Width = 680
          Height = 352
          Align = alClient
          BevelOuter = bvNone
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          object dbgrddetalhe: TwwDBGrid
            Left = 0
            Top = 55
            Width = 680
            Height = 272
            Selected.Strings = (
              'CHAVE'#9'10'#9'Chave'
              'VALORCHAVE'#9'12'#9'Valor chave'
              'VALORNAFUNDACAO'#9'37'#9'Valor na Fundação'
              'VALORNOINTERFACE'#9'42'#9'Valor no Interface'
              'DTPROCESSADO'#9'18'#9'Data processamento')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsDet
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            MultiSelectOptions = [msoShiftSelect]
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgMultiSelect]
            ParentFont = False
            TabOrder = 0
            TitleAlignment = taLeftJustify
            TitleFont.Charset = ANSI_CHARSET
            TitleFont.Color = clBlack
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            TitleLines = 1
            TitleButtons = True
            OnCalcCellColors = dbgrddetalheCalcCellColors
            OnTitleButtonClick = dbgrddetalheTitleButtonClick
            IndicatorColor = icBlack
            object dbgrddetalhebtn: TwwIButton
              Left = 0
              Top = 0
              Width = 26
              Height = 24
              Hint = 'Selecionar todos'
              AllowAllUp = True
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                04000000000000010000120B0000120B00001000000000000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                333333333333333333333333333333333333333333333333FFF3333333333333
                00333333333333FF77F3333333333300903333333333FF773733333333330099
                0333333333FF77337F3333333300999903333333FF7733337333333700999990
                3333333777333337F3333333099999903333333373F333373333333330999903
                33333333F7F3337F33333333709999033333333F773FF3733333333709009033
                333333F7737737F3333333709073003333333F77377377F33333370907333733
                33333773773337333333309073333333333337F7733333333333370733333333
                3333377733333333333333333333333333333333333333333333}
              NumGlyphs = 2
              ParentShowHint = False
              ShowHint = True
              OnClick = dbgrddetalhebtnClick
            end
          end
          object Panel6: TPanel
            Left = 0
            Top = 0
            Width = 680
            Height = 55
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 1
            object rdgrpvis: TRadioGroup
              Left = 0
              Top = 0
              Width = 680
              Height = 55
              Align = alClient
              Caption = 'Visualizar '
              Columns = 2
              ItemIndex = 0
              Items.Strings = (
                'Todos'
                'Apenas Ainda não Processados'
                'Apenas Aceitos'
                'Apenas Rejeitados')
              TabOrder = 0
              OnClick = rdgrpvisClick
            end
          end
          object pnlcores: TPanel
            Left = 0
            Top = 327
            Width = 680
            Height = 25
            Align = alBottom
            BevelOuter = bvNone
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            object Shape2: TShape
              Left = 242
              Top = 6
              Width = 16
              Height = 12
              Brush.Color = clSilver
            end
            object Label1: TLabel
              Left = 263
              Top = 6
              Width = 116
              Height = 12
              AutoSize = False
              Caption = 'Aceito e Atualizado'
              WordWrap = True
            end
            object Shape4: TShape
              Left = 89
              Top = 6
              Width = 16
              Height = 12
              Brush.Color = clWindow
            end
            object Label4: TLabel
              Left = 110
              Top = 6
              Width = 124
              Height = 12
              AutoSize = False
              Caption = 'Ainda não processado'
              WordWrap = True
            end
            object Shape5: TShape
              Left = 392
              Top = 6
              Width = 16
              Height = 12
              Brush.Color = clMaroon
            end
            object Label5: TLabel
              Left = 413
              Top = 6
              Width = 113
              Height = 12
              AutoSize = False
              Caption = 'Rejeitado'
              WordWrap = True
            end
            object Label8: TLabel
              Left = 0
              Top = 0
              Width = 82
              Height = 25
              Align = alLeft
              Alignment = taCenter
              Caption = ' Legenda :'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -16
              Font.Name = 'Bookman Old Style'
              Font.Style = [fsItalic]
              ParentFont = False
            end
          end
        end
      end
    end
    object grpFiltro: TGroupBox
      Left = 1
      Top = 1
      Width = 740
      Height = 98
      Align = alTop
      Caption = ' Informações para Filtrar Ocorrências '
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -16
      Font.Name = 'Bookman Old Style'
      Font.Style = [fsItalic]
      ParentFont = False
      TabOrder = 0
      object Label2: TLabel
        Left = 12
        Top = 20
        Width = 80
        Height = 13
        Caption = 'Patrocinadora'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 307
        Top = 20
        Width = 24
        Height = 13
        Caption = 'Mês'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object SpeedButton2: TSpeedButton
        Left = 667
        Top = 1
        Width = 25
        Height = 25
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          333333333333333333333333333333333333333333333333FFF3333333333333
          00333333333333FF77F3333333333300903333333333FF773733333333330099
          0333333333FF77337F3333333300999903333333FF7733337333333700999990
          3333333777333337F3333333099999903333333373F333373333333330999903
          33333333F7F3337F33333333709999033333333F773FF3733333333709009033
          333333F7737737F3333333709073003333333F77377377F33333370907333733
          33333773773337333333309073333333333337F7733333333333370733333333
          3333377733333333333333333333333333333333333333333333}
        NumGlyphs = 2
        Visible = False
      end
      object SpeedButton1: TSpeedButton
        Left = 699
        Top = 1
        Width = 25
        Height = 25
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          333333333333333FFF3333333333333707333333333333F777F3333333333370
          9033333333F33F7737F33333373337090733333337F3F7737733333330037090
          73333333377F7737733333333090090733333333373773773333333309999073
          333333337F333773333333330999903333333333733337F33333333099999903
          33333337F3333F7FF33333309999900733333337333FF7773333330999900333
          3333337F3FF7733333333309900333333333337FF77333333333309003333333
          333337F773333333333330033333333333333773333333333333333333333333
          3333333333333333333333333333333333333333333333333333}
        NumGlyphs = 2
        Visible = False
      end
      object Label6: TLabel
        Left = 469
        Top = 20
        Width = 95
        Height = 13
        Caption = 'Grupo de Crítica'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label9: TLabel
        Left = 13
        Top = 58
        Width = 274
        Height = 13
        Caption = 'Categoria da Situação do Particip. na Fundação'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label10: TLabel
        Left = 308
        Top = 57
        Width = 136
        Height = 13
        Caption = 'Situação do funcionário'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dblkPatrocinadora: TwwDBLookupCombo
        Left = 12
        Top = 34
        Width = 293
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'60'#9'NOME')
        LookupTable = qryPatroCombo
        LookupField = 'IDPESSOA'
        Style = csDropDownList
        ParentFont = False
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnChange = dblkPatrocinadoraChange
      end
      object cmbMes: TwwDBComboBox
        Left = 307
        Top = 34
        Width = 160
        Height = 21
        ShowButton = True
        Style = csDropDown
        MapList = False
        AllowClearKey = True
        ShowMatchText = True
        DropDownCount = 8
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemHeight = 0
        ParentFont = False
        Sorted = False
        TabOrder = 1
        UnboundDataType = wwDefault
        OnCloseUp = cmbMesCloseUp
        OnExit = cmbMesExit
      end
      object cmbGrupo: TComboBox
        Left = 469
        Top = 33
        Width = 252
        Height = 21
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemHeight = 13
        ParentFont = False
        TabOrder = 2
        OnChange = cmbMesExit
        OnExit = cmbMesExit
        Items.Strings = (
          'C - Dados Cadastrais'
          'E - Endereços'
          'D - Dependentes'
          'O - Documentos'
          'V - Evolução Funcional'
          'N - Eventos'
          'L - Lotações'
          'T - Contatos'
          'R - Rubricas'
          'F -  Filiais'
          'A - Agências')
      end
      object dblkpcmbSitPartInterno: TwwDBLookupCombo
        Left = 12
        Top = 71
        Width = 293
        Height = 21
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'40'#9'Categoria de Situação'#9'F')
        LookupTable = qrySitPartInterno
        LookupField = 'FLGINTERNO'
        ParentFont = False
        TabOrder = 3
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        OnCloseUp = dblkpcmbSitPartInternoCloseUp
      end
      object cmbsitfunc: TwwDBLookupCombo
        Left = 307
        Top = 70
        Width = 293
        Height = 21
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'60'#9'DESCRICAO'#9'F')
        LookupTable = qrysitfunc
        LookupField = 'IDSITFUNC'
        ParentFont = False
        TabOrder = 4
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        OnCloseUp = dblkpcmbSitPartInternoCloseUp
      end
    end
  end
  inherited Dock971: TDock97
    Top = 474
    Width = 742
    inherited tb97Fundo: TToolbar97
      Left = 567
      DockPos = 589
      inherited sep1: TToolbarSep97
        Left = 84
      end
      inherited sep3: TToolbarSep97
        Left = 168
      end
      object ToolbarSep972: TToolbarSep97 [2]
        Left = 0
        Top = 0
        Blank = True
        SizeHorz = 3
      end
      inherited bbtnSair: TBitBtn
        Left = 3
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 87
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 315
      DockPos = 336
      inherited ToolbarSep971: TToolbarSep97
        Left = 164
      end
      object ToolbarSep973: TToolbarSep97 [1]
        Left = 80
        Top = 0
        Blank = True
        SizeHorz = 3
      end
      inherited bbtnConfirmar: TBitBtn
        Left = 83
        Enabled = False
        ModalResult = 0
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Left = 167
        Enabled = False
        ModalResult = 0
        OnClick = bbtnCancelarClick
      end
      object bbtnRel: TBitBtn
        Left = 0
        Top = 0
        Width = 80
        Height = 33
        Cancel = True
        Caption = '&Relatório'
        Enabled = False
        TabOrder = 2
        OnClick = bbtnRelClick
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
        NumGlyphs = 2
        Spacing = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 299
    Top = 155
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qryResumo: TwwQuery
    AfterScroll = qryResumoAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT COUNT(1),'
      'DECODE(CODERRO, 0, '#39'Participante não encontrado'#39','
      '             1, '#39'Agência Bancária não encontrada'#39','
      '             2, '#39'Banco não encontrado'#39','
      '             3, '#39'Nome do Participante alterado'#39','
      '             4, '#39'Data de Admissão alterada'#39','
      '             5, '#39'Data de Nascimento alterada'#39', '
      '             6, '#39'Documento alterado'#39', '
      '             7, '#39'Número de Dependentes para IR alterado'#39', '
      '             8, '#39'Cargo não encontrado'#39','
      '             9, '#39'Cargo alterado'#39', '
      '             10, '#39'Nivel não encontrado'#39', '
      '             11, '#39'Nivel alterado'#39', '
      '             12, '#39'Sexo alterado'#39', '
      '             13, '#39'Conta Corrente alterada'#39', '
      '             14, '#39'Erro ao alterar conta corrente'#39', '
      '             15, '#39'Erro ao alterar nome'#39','
      '             16, '#39'Erro ao alterar documento'#39','
      '             17, '#39'Erro ao alterar sexo'#39', '
      '             18, '#39'Erro ao alterar data de nascimento'#39', '
      '             19, '#39'Erro ao altarer data de admissão'#39', '
      '             20, '#39'Erro ao alterar n. dependentes IRRF'#39','
      '             21, '#39'Erro ao alterar cargo'#39','
      '             22, '#39'Erro ao alterar nivel'#39','
      
        '             23, '#39'Participante Assistido - dados não atualizados' +
        ' '#39', '
      
        '             24, '#39'Participante Mantido - dados não atualizados '#39 +
        ', '
      '             25, '#39'Endereço Inserido'#39', '
      '             26, '#39'Logradouro alterado'#39', '
      '             27, '#39'Bairro alterado'#39', '
      '             28, '#39'CEP alterado'#39', '
      '             29, '#39'UF do Endereço alterado'#39', '
      '             30, '#39'Número do Telefone alterado'#39', '
      '             31, '#39'Cidade do Endereço alterada'#39','
      '             32, '#39'Telefone Inserido'#39','
      '             33, '#39'Número da Carteira de Identidade alterado'#39', '
      '             34, '#39'UF da Carteira de Identidade alterada'#39', '
      
        '             35, '#39'Data de Expedição da Carteira de Identidade al' +
        'terada'#39','
      '             36, '#39'Nome do Pai alterado'#39', '
      '             37, '#39'Nome da Mãe alterado'#39','
      '             38, '#39'Código do Municipio de Naturalidade alterado'#39','
      '             39, '#39'Matrícula do Conjuge alterada '#39','
      '             40, '#39'Tempo de Serviço Total alterado '#39','
      '             41, '#39'Tempo de Serviço Não Creditado  alterado '#39','
      '             42, '#39'Documento de Identidade Inserido'#39','
      
        '             43, '#39'Dependente Inserido (não existia no cadastro)'#39 +
        ','
      '             44, '#39'Estado Civil  alterado '#39','
      '             45, '#39'Indicador para Salário de IR  alterado '#39','
      '             46, '#39'Indicador para Salário Família  alterado '#39','
      '             47, '#39'Indicador de Invalidez  alterado '#39','
      '             48, '#39'Data de Início do Dependente  alterada'#39','
      '             49, '#39'Grau de Dependência  alterado '#39','
      '             50, '#39'Indicador de Cargo de Diretor  alterado '#39','
      '             51, '#39'Tempo de Serviço Anterior alterado'#39','
      '             52, '#39'Tempo de Serviço Publico Anterior alterado'#39','
      '             53, '#39'Tempo de Serviço Privado Anterior alterado'#39','
      '             54, '#39'Tempo de Serviço Anterior Real alterado'#39','
      '             55, '#39'Filial do Empregado alterada'#39','
      '             56, '#39'Filial não encontrada'#39','
      '             57, '#39'Situação do Empregado alterada'#39','
      '             58, '#39'Vinculação Funcional do Empregado alterada'#39','
      '             59, '#39'Função Não Encontrada'#39','
      '             60, '#39'Função alterada'#39','
      '             61, '#39'Data de Demissão alterada'#39','
      '             62, '#39'Data de Readmissão alterada'#39','
      '             63, '#39'Data do Falecimento alterada'#39','
      
        '             64, '#39'Participante Cancelado - dados não atualizados' +
        ' '#39','
      '             65, '#39'Cidade do Endereço não encontrada '#39','
      '             66, '#39'Agência Bancária em Branco'#39','
      '             67, '#39'UF não encontrada na tabela de Estado'#39','
      '             68, '#39'Erro ao inserir novo dependente'#39','
      '             69, '#39'Novo Funcionario Cadastrado'#39','
      '             70, '#39'Centro de Custo do Empregado Alterado'#39','
      '             71, '#39'Salário Total na Empresa Alterado'#39','
      '             72, '#39'Matricula Alterada'#39','
      '             73, '#39'Email do Contato Alterado'#39','
      '             74, '#39'Cargo do Contato Alterado'#39','
      '             75, '#39'Setor do Contato Alterado'#39','
      '             76, '#39'Data Nascimento do Contato Alterado'#39','
      '             77, '#39'Obs do Contato Alterado'#39','
      '             78, '#39'Novo cargo inserido na evolução funcional'#39','
      '             79, '#39'Nova função inserida na evolução funcional'#39','
      '             80, '#39'Inserido Adicional compensatório'#39','
      '             81, '#39'Inserido adicional por tempo de serviço'#39','
      '             82, '#39'Inserido adicional noturno'#39','
      '             83, '#39'Inserido percentual por periculosidade'#39','
      '             84, '#39'Inserido percentual de insalubridade'#39','
      '             85, '#39'Data final do cargo atual alterada'#39','
      '             86, '#39'Data final da função atual alterada'#39','
      
        '             87, '#39'Data final do percentual por insalubridade alt' +
        'erado'#39','
      '             88, '#39'Percentual de insalubridade alterado'#39','
      '             89, '#39'Percentual por periculosidade alterado'#39','
      '             90, '#39'Data final do adicional noturno alterada'#39','
      '             91, '#39'Percentual do aicional noturno alterado'#39','
      '             92, '#39'Inserido pecentual de adicional noturno'#39','
      
        '             93, '#39'Data final d adicional por tempo de serviço al' +
        'terada'#39','
      '             94, '#39'Percentual por tempo de serviço alterado'#39','
      
        '             95, '#39'Data final do adicional compensatório alterada' +
        #39','
      
        '             96, '#39'Percental de adicional compensatório alterado'#39 +
        ','
      '             97, '#39'Situação na patrocinadora alterada'#39' ,'
      '             98, '#39'Valor da opção 1 da patrocinadora alterado'#39' ,'
      '             99, '#39'Valor da opção 2 da patrocinadora alterado'#39' ,'
      '             100, '#39'Valor da opção 3 da patrocinadora alterado'#39' ,'
      '             101, '#39'Valor da opção 4 da patrocinadora alterado'#39' ,'
      '             102, '#39'Valor da opção 5 da patrocinadora alterado'#39' ,'
      '             103, '#39'Valor da opção 6 da patrocinadora alterado'#39' ,'
      '             104, '#39'Evento previdenciário inserido'#39','
      '             105, '#39'Descrição da rubrica alterada'#39','
      
        '             106, '#39'Indicador (Provento/Desconto) da rubrica alte' +
        'rado'#39','
      
        '             107, '#39'Indicador (Atraso/Devolução/Normal) da rubric' +
        'a alterado'#39','
      '             108, '#39'Rubrica inserida'#39','
      '             109, '#39'Nome da filial alterado'#39','
      '             110, '#39'Tipo da filial (Capital/Interior) alterado'#39','
      '             111, '#39'CGC da filial alterado'#39','
      '             112, '#39'Sigla da filial alterada'#39','
      '             113, '#39'Filial inserida'#39','
      '             114, '#39'Noma da agência alterado'#39','
      '             115, '#39'Agência inserida'#39','
      '             116, '#39'Elegível inserido'#39','
      '             117, '#39'Erro ao inserir elegível'#39','
      '             118, '#39'e-mail alterado'#39','
      
        '             119, '#39'Dt. inicio do cargo informado menor que a do ' +
        'cargo atual '#39' ,'
      
        '             120, '#39'Dt. inicio da função infromada menor que a da' +
        ' função atual '#39','
      '             121, '#39'Data final da filial alterada '#39','
      '             122, '#39'DDD Alterado '#39
      '             ) AS DESCERRO,'
      'CODERRO, GRUPO'
      'FROM TABCRITICASCCP'
      'WHERE MESCOBRANCA = :mescobranca'
      'AND   IDPESSJUR   = :idpessjur'
      'AND   GRUPO       = :GRUPO'
      'GROUP BY DECODE(CODERRO, 0, '#39'Participante não encontrado'#39','
      '             1, '#39'Agência Bancária não encontrada'#39','
      '             2, '#39'Banco não encontrado'#39','
      '             3, '#39'Nome do Participante alterado'#39','
      '             4, '#39'Data de Admissão alterada'#39','
      '             5, '#39'Data de Nascimento alterada'#39', '
      '             6, '#39'Documento alterado'#39', '
      '             7, '#39'Número de Dependentes para IR alterado'#39', '
      '             8, '#39'Cargo não encontrado'#39', '
      '             9, '#39'Cargo alterado'#39', '
      '             10, '#39'Nivel não encontrado'#39', '
      '             11, '#39'Nivel alterado'#39', '
      '             12, '#39'Sexo alterado'#39', '
      '             13, '#39'Conta Corrente alterada'#39','
      '             14, '#39'Erro ao alterar conta corrente'#39', '
      '             15, '#39'Erro ao alterar nome'#39','
      '             16, '#39'Erro ao alterar Documento'#39','
      '             17, '#39'Erro ao alterar sexo'#39', '
      '             18, '#39'Erro ao alterar data de nascimento'#39', '
      '             19, '#39'Erro ao altarer data de admissão'#39','
      '             20, '#39'Erro ao alterar n. dependentes IRRF'#39','
      '             21, '#39'Erro ao alterar cargo'#39', '
      '             22, '#39'Erro ao alterar nivel'#39', '
      
        '             23, '#39'Participante Assistido - dados não atualizados' +
        ' '#39','
      
        '             24, '#39'Participante Mantido - dados não atualizados '#39 +
        ', '
      '             25, '#39'Endereço Inserido'#39','
      '             26, '#39'Logradouro alterado'#39','
      '             27, '#39'Bairro alterado'#39', '
      '             28, '#39'CEP alterado'#39', '
      '             29, '#39'UF do Endereço alterado'#39', '
      '             30, '#39'Número do Telefone alterado'#39','
      '             31, '#39'Cidade do Endereço alterada'#39', '
      '             32, '#39'Telefone Inserido'#39','
      '             33, '#39'Número da Carteira de Identidade alterado'#39', '
      '             34, '#39'UF da Carteira de Identidade alterada'#39','
      
        '             35, '#39'Data de Expedição da Carteira de Identidade al' +
        'terada'#39', '
      '             36, '#39'Nome do Pai alterado'#39','
      '             37, '#39'Nome da Mãe alterado'#39', '
      
        '             38, '#39'Código do Municipio de Naturalidade alterado'#39',' +
        ' '
      '             39, '#39'Matrícula do Conjuge alterada '#39','
      '             40, '#39'Tempo de Serviço Total alterado '#39', '
      '             41, '#39'Tempo de Serviço Não Creditado  alterado '#39', '
      '             42, '#39'Documento de Identidade Inserido'#39','
      
        '             43, '#39'Dependente Inserido (não existia no cadastro)'#39 +
        ', '
      '             44, '#39'Estado Civil  alterado '#39', '
      '             45, '#39'Indicador para Salário de IR  alterado '#39', '
      '             46, '#39'Indicador para Salário Família  alterado '#39','
      '             47, '#39'Indicador de Invalidez  alterado '#39','
      '             48, '#39'Data de Início do Dependente  alterada'#39', '
      '             49, '#39'Grau de Dependência  alterado '#39','
      '             50, '#39'Indicador de Cargo de Diretor  alterado '#39','
      '             51, '#39'Tempo de Serviço Anterior alterado'#39', '
      '             52, '#39'Tempo de Serviço Publico Anterior alterado'#39', '
      '             53, '#39'Tempo de Serviço Privado Anterior alterado'#39', '
      '             54, '#39'Tempo de Serviço Anterior Real alterado'#39', '
      '             55, '#39'Filial do Empregado alterada'#39','
      '             56, '#39'Filial não encontrada'#39', '
      '             57, '#39'Situação do Empregado alterada'#39','
      '             58, '#39'Vinculação Funcional do Empregado alterada'#39', '
      '             59, '#39'Função Não Encontrada'#39', '
      '             60, '#39'Função alterada'#39', '
      '             61, '#39'Data de Demissão alterada'#39','
      '             62, '#39'Data de Readmissão alterada'#39','
      '             63, '#39'Data do Falecimento alterada'#39','
      
        '             64, '#39'Participante Cancelado - dados não atualizados' +
        ' '#39','
      '             65, '#39'Cidade do Endereço não encontrada '#39','
      '             66, '#39'Agência Bancária em Branco'#39','
      '             68, '#39'Erro ao inserir novo dependente'#39','
      '             69, '#39'Novo Funcionario Cadastrado'#39','
      '             70, '#39'Centro de Custo do Empregado Alterado'#39','
      '             71, '#39'Salário Total na Empresa Alterado'#39','
      '             72, '#39'Matricula Alterada'#39','
      '             73, '#39'Email do Contato Alterado'#39','
      '             74, '#39'Cargo do Contato Alterado'#39','
      '             75, '#39'Setor do Contato Alterado'#39','
      '             76, '#39'Data Nascimento do Contato Alterado'#39','
      '             77, '#39'Obs do Contato Alterado'#39','
      '             78, '#39'Novo cargo inserido na evolução funcional'#39','
      '             79, '#39'Nova função inserida na evolução funcional'#39','
      '             80, '#39'Inserido Adicional compensatório'#39','
      '             81, '#39'Inserido adicional por tempo de serviço'#39','
      '             82, '#39'Inserido adicional noturno'#39','
      '             83, '#39'Inserido percentual por periculosidade'#39','
      '             84, '#39'Inserido percentual de insalubridade'#39','
      '             85, '#39'Data final do cargo atual alterada'#39','
      '             86, '#39'Data final da função atual alterada'#39','
      
        '             87, '#39'Data final do percentual por insalubridade alt' +
        'erado'#39','
      '             88, '#39'Percentual de insalubridade alterado'#39','
      '             89, '#39'Percentual por periculosidade alterado'#39','
      '             90, '#39'Data final do adicional noturno alterada'#39','
      '             91, '#39'Percentual do aicional noturno alterado'#39','
      '             92, '#39'Inserido pecentual de adicional noturno'#39','
      
        '             93, '#39'Data final d adicional por tempo de serviço al' +
        'terada'#39','
      '             94, '#39'Percentual por tempo de serviço alterado'#39','
      
        '             95, '#39'Data final do adicional compensatório alterada' +
        #39','
      
        '             96, '#39'Percental de adicional compensatório alterado'#39 +
        ','
      '             97, '#39'Situação do funcionário alterada'#39' ,'
      '             98, '#39'Valor da opção 1 da patrocinadora alterado'#39' ,'
      '             99, '#39'Valor da opção 2 da patrocinadora alterado'#39' ,'
      '             100, '#39'Valor da opção 3 da patrocinadora alterado'#39' ,'
      '             101, '#39'Valor da opção 4 da patrocinadora alterado'#39' ,'
      '             102, '#39'Valor da opção 5 da patrocinadora alterado'#39' ,'
      '             103, '#39'Valor da opção 6 da patrocinadora alterado'#39' ,'
      '             104, '#39'Evento previdenciário inserido'#39','
      '             105, '#39'Descrição da rubrica alterada'#39','
      
        '             106, '#39'Indicador (Provento/Desconto) da rubrica alte' +
        'rado'#39','
      
        '             107, '#39'Indicador (Atraso/Devolução/Normal) da rubric' +
        'a alterado'#39','
      '             108, '#39'Rubrica inserida'#39','
      '             109, '#39'Nome da filial alterado'#39','
      '             110, '#39'Tipo da filial (Capital/Interior) alterado'#39','
      '             111, '#39'CGC da filial alterado'#39','
      '             112, '#39'Sigla da filial alterada'#39','
      '             113, '#39'Filial inserida'#39','
      '             114, '#39'Noma da agência alterado'#39','
      '             115, '#39'Agência inserida'#39','
      '             116, '#39'Elegível inserido'#39','
      '             117, '#39'Erro ao inserir elegível'#39','
      '             118, '#39'e-mail alterado'#39','
      
        '             119, '#39'Dt. inicio do cargo informado menor que a do ' +
        'cargo atual '#39' ,'
      
        '             120, '#39'Dt. inicio da função infromada menor que a da' +
        ' função atual '#39
      '             121, '#39'Data final da filial alterada '#39','
      '             122, '#39'DDD Alterado '#39
      '              ),  CODERRO, GRUPO'
      'ORDER BY CODERRO'
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 237
    Top = 181
    ParamData = <
      item
        DataType = ftString
        Name = 'mescobranca'
        ParamType = ptUnknown
        Value = #39'200302'#39
      end
      item
        DataType = ftInteger
        Name = 'idpessjur'
        ParamType = ptUnknown
        Value = 91008
      end
      item
        DataType = ftString
        Name = 'GRUPO'
        ParamType = ptUnknown
        Value = #39'R'#39
      end>
  end
  object dsResumo: TwwDataSource
    AutoEdit = False
    DataSet = qryResumo
    Left = 269
    Top = 205
  end
  object qryDet: TwwQuery
    AfterScroll = qryDetAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT  DECODE(CHAVE,'#39'M'#39','#39'Matrícula'#39','#39'I'#39','#39'Inscrição'#39','#39'A'#39','#39'Num. A' +
        'gência'#39','#39'F'#39','#39'Num. Filial'#39','#39'R'#39','#39'Cod. Rubrica'#39') CHAVE,'
      '        VALORCHAVE ,'
      '        VALORNAFUNDACAO,'
      '        VALORNOINTERFACE,'
      '        FLGPROCESSADO, DTPROCESSADO,'
      
        '        DECODE( FLGPROCESSADO, '#39'1'#39', '#39'Aceito'#39','#39'2'#39','#39'Rejeitado'#39','#39'Nã' +
        'o processado'#39') STATUSPROC,'
      '        VALORCHAVEAUX NOME, CHAVE'
      'FROM    TABCRITICASCCP'
      'WHERE   MESCOBRANCA = '#39'200302'#39
      'AND     IDPESSJUR = '#39'91008'#39
      'ORDER BY VALORCHAVE'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 509
    Top = 111
  end
  object dsDet: TwwDataSource
    AutoEdit = False
    DataSet = qryDet
    Left = 469
    Top = 111
  end
  object qryPatroCombo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.IDPESSOA, P.NOME'
      'FROM   PESSOA P, PATRO PT'
      'WHERE  (PT.IDPESSOA = P.IDPESSOA) '
      'ORDER BY P.NOME'
      '')
    ValidateWithMask = True
    Left = 457
    Top = 236
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 558
    Top = 138
  end
  object qryMes: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT MESCOBRANCA'
      'FROM TABCRITICASCCP'
      'ORDER BY MESCOBRANCA DESC')
    ValidateWithMask = True
    Left = 387
    Top = 244
  end
  object qryupdate: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 558
    Top = 202
  end
  object qrySitPartInterno: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT '#39'AT'#39' AS FLGINTERNO, '#39'Ativo'#39'                        AS DES' +
        'CRICAO FROM DUAL UNION'
      
        'SELECT '#39'MA'#39' AS FLGINTERNO, '#39'Mantido'#39'                      AS DES' +
        'CRICAO FROM DUAL UNION'
      
        'SELECT '#39'MP'#39' AS FLGINTERNO, '#39'Mantido Parcial'#39'              AS DES' +
        'CRICAO FROM DUAL UNION'
      
        'SELECT '#39'MS'#39' AS FLGINTERNO, '#39'Manutenção de Saldo de Conta'#39' AS DES' +
        'CRICAO FROM DUAL UNION'
      
        'SELECT '#39'AS'#39' AS FLGINTERNO, '#39'Assistido'#39'                    AS DES' +
        'CRICAO FROM DUAL UNION'
      
        'SELECT '#39'CA'#39' AS FLGINTERNO, '#39'Cancelado'#39'                    AS DES' +
        'CRICAO FROM DUAL UNION'
      
        'SELECT '#39'AE'#39' AS FLGINTERNO, '#39'Ativo Especial'#39'               AS DES' +
        'CRICAO FROM DUAL UNION'
      
        'SELECT '#39'PN'#39' AS FLGINTERNO, '#39'Pendente'#39'                     AS DES' +
        'CRICAO FROM DUAL')
    ValidateWithMask = True
    Left = 294
    Top = 330
  end
  object qrysitfunc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM SITFUNC'
      'ORDER BY DESCRICAO')
    ValidateWithMask = True
    Left = 206
    Top = 314
  end
end
