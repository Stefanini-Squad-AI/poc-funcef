inherited frmManutRubs: TfrmManutRubs
  Left = 192
  Top = 96
  HelpContext = 190003
  Caption = 'Manutenção de  RUBS'
  ClientHeight = 454
  ClientWidth = 780
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 780
    Height = 415
    object Splitter3: TSplitter
      Left = 331
      Top = 80
      Width = 5
      Height = 304
      Cursor = crHSplit
    end
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 778
      Height = 79
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object PnlBenefRubs: TPanel
        Left = 144
        Top = 2
        Width = 561
        Height = 79
        BevelOuter = bvNone
        TabOrder = 2
        Visible = False
        object Label39: TLabel
          Left = 212
          Top = 36
          Width = 80
          Height = 13
          Caption = 'Patrocinadora'
        end
        object Label11: TLabel
          Left = 11
          Top = 36
          Width = 156
          Height = 13
          Caption = 'Matrícula na Patrocinadora'
        end
        object Label7: TLabel
          Left = 11
          Top = 2
          Width = 192
          Height = 13
          Caption = 'Nome do Elegível ou Participante'
        end
        object Label8: TLabel
          Left = 423
          Top = 2
          Width = 24
          Height = 13
          Caption = 'CPF'
        end
        object edPatro: TEdit
          Left = 212
          Top = 50
          Width = 289
          Height = 21
          Color = clGray
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
        object edmat: TEdit
          Left = 11
          Top = 50
          Width = 194
          Height = 21
          Color = clGray
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
        object ednome: TEdit
          Left = 11
          Top = 15
          Width = 402
          Height = 21
          Color = clGray
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
        end
        object edcpf: TEdit
          Left = 423
          Top = 15
          Width = 77
          Height = 21
          Color = clGray
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
        end
      end
      object PnlDadosRubs: TPanel
        Left = 132
        Top = -1
        Width = 566
        Height = 79
        BevelOuter = bvNone
        TabOrder = 3
        Visible = False
        object GroupBox1: TGroupBox
          Left = 12
          Top = 4
          Width = 130
          Height = 69
          Caption = ' Núm da RUBS '
          TabOrder = 0
          object EdtRubIni: TRealEdit
            Left = 11
            Top = 16
            Width = 105
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '0')
            TabOrder = 0
            WordWrap = False
            IntDigits = 10
            DecDigits = 0
            NumberFormat = iNumber
            Signal = False
          end
          object EdtRubFin: TRealEdit
            Left = 11
            Top = 40
            Width = 105
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '0')
            TabOrder = 1
            WordWrap = False
            IntDigits = 10
            DecDigits = 0
            NumberFormat = iNumber
            Signal = False
          end
        end
        object GpbStatus: TGroupBox
          Left = 154
          Top = 4
          Width = 397
          Height = 70
          Caption = ' Status'
          TabOrder = 1
          object Cks1: TCheckBox
            Tag = 1
            Left = 13
            Top = 19
            Width = 65
            Height = 17
            Caption = '&Gerado'
            TabOrder = 0
            OnClick = Cks1Click
          end
          object Cks2: TCheckBox
            Tag = 2
            Left = 13
            Top = 42
            Width = 64
            Height = 17
            Caption = '&Emitido'
            TabOrder = 1
            OnClick = Cks1Click
          end
          object Cks3: TCheckBox
            Tag = 3
            Left = 97
            Top = 19
            Width = 78
            Height = 17
            Caption = '&Regerado'
            TabOrder = 2
            OnClick = Cks1Click
          end
          object Cks4: TCheckBox
            Tag = 4
            Left = 97
            Top = 42
            Width = 78
            Height = 17
            Caption = '&Reemitido'
            TabOrder = 3
            OnClick = Cks1Click
          end
          object Cks6: TCheckBox
            Tag = 6
            Left = 188
            Top = 42
            Width = 103
            Height = 17
            Caption = '&Carta Enviada'
            TabOrder = 4
            OnClick = Cks1Click
          end
          object Cks5: TCheckBox
            Tag = 5
            Left = 188
            Top = 19
            Width = 86
            Height = 17
            Caption = '&Cancelada'
            TabOrder = 5
            OnClick = Cks1Click
          end
          object Cks7: TCheckBox
            Tag = 7
            Left = 293
            Top = 19
            Width = 84
            Height = 17
            Caption = '&Encerrada'
            TabOrder = 6
            OnClick = Cks1Click
          end
        end
      end
      object Panel3: TPanel
        Left = 698
        Top = 0
        Width = 80
        Height = 79
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 0
        object BtnSeleciona: TBitBtn
          Left = 3
          Top = 12
          Width = 67
          Height = 57
          Caption = 'Seleciona'
          TabOrder = 0
          OnClick = BtnSelecionaClick
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
        end
      end
      object PnlDadosSel: TPanel
        Left = 0
        Top = 0
        Width = 141
        Height = 79
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 1
        object RgSelPor: TRadioGroup
          Left = 1
          Top = 3
          Width = 136
          Height = 69
          Caption = ' Seleciona Por '
          ItemIndex = 0
          Items.Strings = (
            '&Atendimento'
            '&RUBS'
            '&Recadastramento')
          TabOrder = 0
          OnClick = RgSelPorClick
        end
      end
    end
    object Panel6: TPanel
      Left = 1
      Top = 80
      Width = 330
      Height = 304
      Align = alLeft
      Caption = 'Panel6'
      TabOrder = 1
      object SplBenef: TSplitter
        Left = 1
        Top = 228
        Width = 328
        Height = 7
        Cursor = crVSplit
        Align = alBottom
      end
      object Panel4: TPanel
        Left = 1
        Top = 1
        Width = 328
        Height = 227
        Align = alClient
        BevelOuter = bvNone
        Caption = 'Panel4'
        TabOrder = 0
        object GrdRubPendente: TwwDBGrid
          Left = 0
          Top = 30
          Width = 328
          Height = 197
          Selected.Strings = (
            'IDRUBS'#9'10'#9'Num. RUBS'#9'F'
            'STATUS'#9'13'#9'Status'#9'F'
            'DATAMOV'#9'19'#9'Data do Movimento'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsRUBpendentes
          KeyOptions = []
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          ParentShowHint = False
          PopupMenu = PpmRubsPendentes
          ReadOnly = True
          ShowHint = True
          TabOrder = 0
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          OnMouseDown = GrdRubPendenteMouseDown
          IndicatorColor = icBlack
        end
        object Panel25: TPanel
          Left = 0
          Top = 0
          Width = 328
          Height = 30
          Align = alTop
          BevelInner = bvLowered
          BevelWidth = 2
          Caption = 'RUBS'
          Color = clGray
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          ParentFont = False
          TabOrder = 1
        end
      end
      object PnlBenf: TPanel
        Left = 1
        Top = 235
        Width = 328
        Height = 68
        Align = alBottom
        BevelOuter = bvNone
        Caption = 'PnlBenf'
        TabOrder = 1
        object Panel30: TPanel
          Left = 0
          Top = 0
          Width = 328
          Height = 25
          Align = alTop
          BevelInner = bvLowered
          Caption = 'Benefícios/Serviços'
          Color = clGray
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          ParentFont = False
          TabOrder = 0
        end
        object wwDBGrid4: TwwDBGrid
          Left = 0
          Top = 25
          Width = 328
          Height = 43
          Selected.Strings = (
            'NOME'#9'50'#9'Benefício\Serviço')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          ShowVertScrollBar = False
          Align = alClient
          DataSource = DsRubXBeneficio
          KeyOptions = []
          MultiSelectOptions = [msoAutoUnselect, msoShiftSelect]
          Options = [dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
          ReadOnly = True
          TabOrder = 1
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
      end
    end
    object Panel26: TPanel
      Left = 336
      Top = 80
      Width = 443
      Height = 304
      Align = alClient
      Caption = 'Panel26'
      TabOrder = 2
      object SplHist: TSplitter
        Left = 1
        Top = 196
        Width = 441
        Height = 5
        Cursor = crVSplit
        Align = alBottom
      end
      object PnlHist: TPanel
        Left = 1
        Top = 201
        Width = 441
        Height = 102
        Align = alBottom
        BevelOuter = bvNone
        Caption = 'PnlHist'
        TabOrder = 0
        object wwDBGrid6: TwwDBGrid
          Left = 0
          Top = 25
          Width = 441
          Height = 77
          Hint = 'Duplo Click exibe o conteúdo do histórico'
          ControlInfoInDataset = False
          Selected.Strings = (
            'IDRUBS'#9'9'#9'Num RUBS'#9'F'
            'STATUS'#9'22'#9'Descrição'#9'F'
            'HISTORICO'#9'15'#9'Histórico'#9'F'
            'TRGDTINCLUSAO'#9'10'#9'Data'#9'F')
          MemoAttributes = [mSizeable, mWordWrap, mGridShow]
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = DsHistRubs
          KeyOptions = []
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
          ParentShowHint = False
          ReadOnly = True
          ShowHint = True
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
        object Panel31: TPanel
          Left = 0
          Top = 0
          Width = 441
          Height = 25
          Align = alTop
          BevelInner = bvLowered
          Caption = 'Histórico de Movimentacão da RUBS'
          Color = clGray
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          ParentFont = False
          TabOrder = 1
        end
      end
      object Panel2: TPanel
        Left = 1
        Top = 1
        Width = 441
        Height = 195
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object Label1: TLabel
          Left = 5
          Top = 132
          Width = 27
          Height = 13
          Caption = 'Obs.'
        end
        object GrdDocRecebidos: TwwDBGrid
          Left = 0
          Top = 30
          Width = 441
          Height = 96
          Selected.Strings = (
            'FLGRECEBIDO'#9'7'#9'Recebido'
            'NOMEDOCUMENTO'#9'35'#9'Documento'
            'DATARECEB'#9'10'#9'Data')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alTop
          Color = clWhite
          DataSource = dsTipoDocRubPendentes
          KeyOptions = []
          MultiSelectOptions = [msoAutoUnselect, msoShiftSelect]
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgMultiSelect]
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
          OnCalcCellColors = GrdDocRecebidosCalcCellColors
          OnDblClick = GrdDocRecebidosDblClick
          IndicatorColor = icBlack
        end
        object Panel24: TPanel
          Left = 0
          Top = 0
          Width = 441
          Height = 30
          Align = alTop
          BevelInner = bvLowered
          BevelWidth = 2
          Caption = 'RUBS - Documentos'
          Color = clGray
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          ParentFont = False
          TabOrder = 1
        end
        object wwDBRichEditOBS: TwwDBRichEdit
          Left = 3
          Top = 148
          Width = 430
          Height = 37
          ScrollBars = ssVertical
          Anchors = [akLeft, akTop, akRight, akBottom]
          AutoURLDetect = False
          DataField = 'OBS'
          DataSource = dsTipoDocRubPendentes
          PrintJobName = 'Delphi 5'
          TabOrder = 2
          OnEnter = wwDBRichEditOBSEnter
          OnExit = wwDBRichEditOBSExit
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
            750000007B5C727466315C616E73695C616E7369637067313235325C64656666
            305C6465666C616E67313034367B5C666F6E7474626C7B5C66305C666E696C20
            4D532053616E732053657269663B7D7D0D0A5C766965776B696E64345C756331
            5C706172645C625C66305C667331345C7061720D0A7D0D0A00}
        end
      end
    end
    object PnlSelVisible: TPanel
      Left = 1
      Top = 384
      Width = 778
      Height = 30
      Align = alBottom
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 3
      object CkbBenf: TCheckBox
        Left = 45
        Top = 7
        Width = 208
        Height = 17
        Caption = 'Imprime Detalhe Com Benefícios'
        Checked = True
        State = cbChecked
        TabOrder = 0
        OnClick = CkbBenfClick
      end
      object CkbDoc: TCheckBox
        Left = 275
        Top = 7
        Width = 221
        Height = 17
        Caption = 'Imprime Detalhe Com Documentos'
        Checked = True
        State = cbChecked
        TabOrder = 1
        OnClick = CkbDocClick
      end
      object CkbHist: TCheckBox
        Left = 510
        Top = 7
        Width = 196
        Height = 17
        Caption = 'Imprime Detalhe Com Histórico'
        Checked = True
        State = cbChecked
        TabOrder = 2
        OnClick = CkbHistClick
      end
    end
  end
  inherited Dock971: TDock97
    Top = 415
    Width = 780
    inherited tb97Fundo: TToolbar97
      Left = 589
      DockPos = 589
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 1
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 340
      DockPos = 340
      inherited ToolbarSep971: TToolbarSep97
        Left = 161
      end
      inherited bbtnConfirmar: TBitBtn
        Left = 80
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Left = 164
        OnClick = bbtnCancelarClick
      end
      object BtnImprime: TBitBtn
        Left = 0
        Top = 0
        Width = 80
        Height = 33
        Caption = '&Imprime'
        TabOrder = 2
        OnClick = BtnImprimeClick
        Glyph.Data = {
          AA040000424DAA04000000000000360000002800000013000000130000000100
          18000000000074040000C40E0000C40E000000000000000000000000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FF0000FF0000FF0000FF0000FF0000FF0000FF0000000000FF0000FF0000FF00
          00FF0000FF0000FF0000FF0000FF0000000000000000000000FF0000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000000000FF0000FF0000FF0000FF0000
          FF0000FF000000000000C0C0C08080808080800000000000000000FF0000FF00
          00FF0000FF0000FF0000FF0000000000FF0000FF0000FF0000FF000000000000
          C0C0C0C0C0C00000000000000000008080808080800000000000000000FF0000
          FF0000FF0000FF0000000000FF0000FF000000000000C0C0C0C0C0C000000000
          0000C0C0C08080808080800000000000008080808080800000000000000000FF
          0000FF0000000000FF000000C0C0C0C0C0C0000000000000C0C0C0C0C0C0C0C0
          C08080808080808080808080800000000000008080808080800000000000FF00
          00000000FF808080000000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0808080
          8080808080808080808080808080800000000000000000000000FF0000000000
          FF000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0FFFFFF80808080808080
          80808080808080808080808080808080800000000000FF0000000000FF808080
          C0C0C0C0C0C0C0C0C0C0C0C0FFFFFFFFFFFFC0C0C0C0C0C0C0C0C08080808080
          808080808080808080808080800000000000FF0000000000FF808080C0C0C0C0
          C0C0FFFFFFFFFFFFC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0808080
          8080808080808080800000000000FF0000000000FF808080FFFFFFFFFFFFC0C0
          C0C0C0C0C0C0C00000FF0000FFC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C080
          80808080800000000000FF0000000000FF808080C0C0C0C0C0C0C0C0C000FF00
          00FF00C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0
          C00000000000FF0000000000FF0000FF808080808080FFFFFFC0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0FFFFFFFFFFFF000000C0C0C08080808080800000FF
          0000FF0000000000FF0000FF0000FF0000FF808080808080FFFFFFC0C0C08080
          80FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000FF0000FF0000FF0000FF00
          00000000FF0000FF0000FF0000FF0000FF0000FF808080808080808080FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000FF0000FF0000FF0000000000
          FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF808080808080FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000FF0000000000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF808080FFFFFFFFFF
          FFFFFFFF8080808080800000FF0000FF0000FF0000000000FF0000FF0000FF00
          00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF808080808080808080
          0000FF0000FF0000FF0000FF0000FF0000000000FF0000FF0000FF0000FF0000
          FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FF0000FF0000FF000000}
        Spacing = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 30
    Top = 206
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object PpmRubsPendentes: TPopupMenu
    Left = 94
    Top = 174
    object PpmEmite: TMenuItem
      Caption = '&Emite'
      object MnuEmiteSel: TMenuItem
        Tag = 1
        Caption = '&Selecionado'
        OnClick = MnuEmiteSelClick
      end
      object MnuEmiteAll: TMenuItem
        Tag = -1
        Caption = '&Todos'
        OnClick = MnuEmiteSelClick
      end
    end
    object PpmGera2via: TMenuItem
      Caption = '&Gera Segunda Via'
      object MnuGera2Sel: TMenuItem
        Tag = 2
        Caption = '&Selecionado'
        OnClick = MnuEmiteSelClick
      end
      object MnuGera2All: TMenuItem
        Tag = -2
        Caption = '&Todos'
        OnClick = MnuEmiteSelClick
      end
    end
    object PpmEmite2Via: TMenuItem
      Caption = '&Emite Segunda Via'
      object Selecionado2: TMenuItem
        Tag = 3
        Caption = '&Selecionado'
        Hint = 'MnuEmite2Sel'
        OnClick = MnuEmiteSelClick
      end
      object Todos2: TMenuItem
        Tag = -3
        Caption = '&Todos'
        Hint = 'MnuEmite2All'
        OnClick = MnuEmiteSelClick
      end
    end
    object TMenuItem
      Caption = '-'
    end
    object Encerra1: TMenuItem
      Caption = '&Encerra'
      object Selecionado1: TMenuItem
        Tag = 6
        Caption = '&Selecionado'
        OnClick = MnuEmiteSelClick
      end
      object Todos1: TMenuItem
        Tag = -6
        Caption = '&Todos'
        OnClick = MnuEmiteSelClick
      end
    end
    object PpmCancela: TMenuItem
      Caption = '&Cancela'
      object MnuCancelaSel: TMenuItem
        Tag = 4
        Caption = '&Selecionado'
        OnClick = MnuEmiteSelClick
      end
      object MnuCancelaAll: TMenuItem
        Tag = -4
        Caption = '&Todos'
        OnClick = MnuEmiteSelClick
      end
    end
    object Imprimir1: TMenuItem
      Caption = 'Imprimir RUBS'
      object Selecionada1: TMenuItem
        Caption = 'Selecionada (com status Gerada ou  Regerada)'
        OnClick = Selecionada1Click
      end
      object Todas1: TMenuItem
        Caption = 'Todas (com status Gerada ou  Regerada)'
        OnClick = Todas1Click
      end
    end
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'ATEND.NOMESOLICITANTE'
      'ELEGPATRO.MATRICULA'
      'PESSOA.NOME'
      'PLANPREV.NOME'
      'PARTPREVPLAN.INSCRICAONUMERO'
      'PESSOA.NUMDOCUMENTO'
      'PJ.NOME'
      'ATEND.CODATEND'
      'ATEND.COMPLCODATEND'
      'ATEND.IDATEND'
      'RUBS.IDRUBS'
      'TO_CHAR(ATEND.DATA,'#39'DD/MM/YYYY'#39')')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'N'
      'C'
      'C'
      'N'
      'N'
      'N'
      'N'
      'D')
    Descricao.Strings = (
      'Solicitante'
      'Matrícula'
      'Participante'
      'Plano'
      'Inscrição'
      'CPF'
      'Patrocinadora'
      'Código de Atendimento'
      'Complemento'
      'Id'
      'Num Rubs'
      'Data do Atendimento')
    SensivelACaixa.Strings = (
      'N'
      'S'
      'N'
      'N'
      'N'
      'S'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'ATEND'
      'PESSOA'
      'ELEGPATRO'
      'PARTPREVPLAN'
      'PLANPREV'
      'PESSOA PJ'
      'SITPART'
      'ASSUNTOXATEND'
      'RUBS')
    CamposChave.Strings = (
      'PESSOA.NOME'
      'PESSOA.NUMDOCUMENTO'
      'ELEGPATRO.MATRICULA'
      'PARTPREVPLAN.INSCRICAONUMERO'
      'PLANPREV.NOME'
      'PJ.NOME'
      'PJ.IDPESSOA'
      'ATEND.IDATEND'
      'PJ.IDPESSOA'
      'ATEND.IDTITULAR'
      'SITPART.DESCRICAO'
      'RUBS.IDRUBS'
      'ATEND.IDBENEFICIARIO')
    Filtro.Strings = (
      'PARTPREVPLAN.IDPESSOA(+) = ELEGPATRO.IDPESSOA'
      'PARTPREVPLAN.IDPESSJUR(+) = ELEGPATRO.IDPESSJUR'
      'PARTPREVPLAN.IDPLANOPREV = PLANPREV.IDPLANOPREV'
      'NVL(PARTPREVPLAN.FLGDESATIVADO, 0) = 0 '
      'ELEGPATRO.IDPESSOA = PESSOA.IDPESSOA'
      'ELEGPATRO.IDPESSJUR = PJ.IDPESSOA'
      'PESSOA.IDPESSOA = ATEND.IDTITULAR'
      'PARTPREVPLAN.IDSITPART = SITPART.IDSITPART(+)'
      '( RUBS.FLGSTATUS NOT IN ('#39'7'#39','#39'5'#39'))'
      '( RUBS.IDASSUNTOXATEND = ASSUNTOXATEND.IDASSUNTOXATEND)'
      '( ATEND.IDATEND = ASSUNTOXATEND.IDATEND ) ')
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
      '')
    Larguras.Strings = (
      '60'
      '13'
      '60'
      '50'
      '10'
      '18'
      '60'
      '10'
      '10'
      '10'
      '10'
      '10')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 32
    Top = 110
  end
  object qryTipoDocRubPendentes: TwwQuery
    CachedUpdates = True
    ObjectView = True
    DatabaseName = 'BaseDados'
    Filtered = True
    SQL.Strings = (
      'SELECT DISTINCT TD.NOMEDOCUMENTO,'
      '   TD.IDDOCUMENTO,'
      '   TP.FLGRECEBIDO,'
      '   TP.FLGRECEBIDO AS OLDFLGRECEBIDO,'
      '   TP.DATARECEB,    '
      '   TP.IDTIPODOCXRUB,'
      '   TP.IDRUBXBENEFICIO,'
      '   TP.OBS,'
      '   R.IDRUBS,'
      '   ATEND.IDBENEFICIARIO'
      ' FROM'
      '   TIPODOCXRUB TP,'
      '   DOCUMENTOS TD,'
      '   RUBXBENEFICIO RX,'
      '   RUBS R,'
      '   ATEND,'
      '   ASSUNTOXATEND ASSATEND'
      'WHERE '
      '      (TP.IDDOCUMENTO = TD.IDDOCUMENTO) AND '
      '      (RX.IDRUBXBENEFICIO = TP.IDRUBXBENEFICIO) AND '
      
        '      (R.IDRUBS = RX.IDRUBS) AND                                ' +
        '                    '
      '      ( R.IDASSUNTOXATEND = ASSATEND.IDASSUNTOXATEND(+)) AND'
      '      (ATEND.IDATEND(+) = ASSATEND.IDASSUNTOXATEND) ')
    UpdateObject = UpdTipoDocRubPendentes
    ControlType.Strings = (
      'FLGRECEBIDO;CheckBox;S;N')
    ValidateWithMask = True
    Left = 436
    Top = 158
    object qryTipoDocRubPendentesFLGRECEBIDO: TStringField
      DisplayLabel = 'Recebido'
      DisplayWidth = 7
      FieldName = 'FLGRECEBIDO'
      FixedChar = True
      Size = 1
    end
    object qryTipoDocRubPendentesNOMEDOCUMENTO: TStringField
      DisplayLabel = 'Documento'
      DisplayWidth = 35
      FieldName = 'NOMEDOCUMENTO'
      Size = 100
    end
    object qryTipoDocRubPendentesDATARECEB: TDateTimeField
      DisplayLabel = 'Data'
      DisplayWidth = 10
      FieldName = 'DATARECEB'
    end
    object qryTipoDocRubPendentesIDDOCUMENTO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDDOCUMENTO'
      Visible = False
    end
    object qryTipoDocRubPendentesOLDFLGRECEBIDO: TStringField
      DisplayWidth = 1
      FieldName = 'OLDFLGRECEBIDO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoDocRubPendentesIDTIPODOCXRUB: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPODOCXRUB'
      Visible = False
    end
    object qryTipoDocRubPendentesIDRUBXBENEFICIO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDRUBXBENEFICIO'
      Visible = False
    end
    object qryTipoDocRubPendentesIDRUBS: TFloatField
      DisplayWidth = 10
      FieldName = 'IDRUBS'
      Visible = False
    end
    object qryTipoDocRubPendentesIDBENEFICIARIO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDBENEFICIARIO'
      Visible = False
    end
    object qryTipoDocRubPendentesOBS: TStringField
      FieldName = 'OBS'
      Size = 60
    end
  end
  object qryRUBpendentes: TwwQuery
    CachedUpdates = True
    AfterScroll = qryRUBpendentesAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   R.IDRUBS,'
      ''
      '   DECODE(HL.FLGSTATUS,'#39'1'#39','#39'Gerada'#39','
      '   DECODE(HL.FLGSTATUS,'#39'2'#39','#39'Emitida'#39','
      '   DECODE(HL.FLGSTATUS,'#39'3'#39','#39'Regerada'#39','
      '   DECODE(HL.FLGSTATUS,'#39'4'#39','#39'Reemitida'#39','
      '   DECODE(HL.FLGSTATUS,'#39'5'#39','#39'Cancelada'#39','
      '   DECODE(HL.FLGSTATUS,'#39'6'#39','#39'Emissão de Carta'#39','
      '   DECODE(HL.FLGSTATUS,'#39'7'#39','#39'Encerrada'#39','
      '   DECODE(HL.FLGSTATUS,'#39'8'#39','#39'Etiqueta Emitida'#39','
      '   DECODE(HL.FLGSTATUS,'#39'9'#39','#39'Carta de Rosto Emitida'#39','
      '   DECODE(HL.FLGSTATUS,'#39'10'#39','#39'Termo Emitido'#39','
      '   DECODE(HL.FLGSTATUS,'#39'11'#39','#39'Documento Recebido'#39','
      '   '#39'Documento Pendente'#39'))))))))))) AS STATUS,'
      ''
      '   R.FLGSTATUS,'
      '   R.FLGSTATUS AS FLGOLDSTATUS,'
      '   R.IDCANCELAMENTO,'
      '   R.IDHISTBAIXA,'
      '   R.IDHISTLANCTO,'
      '   HL.DATAMOV'
      'FROM RUBS R, HISTMOVRUBS HL, RUBXBENEFICIO RX'
      ''
      'WHERE'
      '  R.IDRUBS = HL.IDRUBS        AND'
      '  R.FLGSTATUS = HL.FLGSTATUS  AND'
      '  R.IDRUBS = RX.IDRUBS'
      ''
      'UNION'
      ''
      'SELECT DISTINCT'
      '   R.IDRUBS,'
      ''
      '   DECODE(HL.FLGSTATUS,'#39'1'#39','#39'Gerada'#39','
      '   DECODE(HL.FLGSTATUS,'#39'2'#39','#39'Emitida'#39','
      '   DECODE(HL.FLGSTATUS,'#39'3'#39','#39'Regerada'#39','
      '   DECODE(HL.FLGSTATUS,'#39'4'#39','#39'Reemitida'#39','
      '   DECODE(HL.FLGSTATUS,'#39'5'#39','#39'Cancelada'#39','
      '   DECODE(HL.FLGSTATUS,'#39'6'#39','#39'Emissão de Carta'#39','
      '   DECODE(HL.FLGSTATUS,'#39'7'#39','#39'Encerrada'#39','
      '   DECODE(HL.FLGSTATUS,'#39'8'#39','#39'Etiqueta Emitida'#39','
      '   DECODE(HL.FLGSTATUS,'#39'9'#39','#39'Carta de Rosto Emitida'#39','
      '   DECODE(HL.FLGSTATUS,'#39'10'#39','#39'Termo Emitido'#39','
      '   DECODE(HL.FLGSTATUS,'#39'11'#39','#39'Documento Recebido'#39','
      '   '#39'Documento Pendente'#39'))))))))))) AS STATUS,'
      ''
      '   R.FLGSTATUS,'
      '   R.FLGSTATUS AS FLGOLDSTATUS,'
      '   R.IDCANCELAMENTO,'
      '   R.IDHISTBAIXA,'
      '   R.IDHISTLANCTO,'
      '   HL.DATAMOV'
      'FROM'
      '   RUBXBENEFICIO RX, RUBS R, HISTMOVRUBS HL,'
      '   TPCANCELAMENTO TP'
      'WHERE'
      '   (R.FLGSTATUS = HL.FLGSTATUS)  AND'
      '   (RX.idpessjur is null) AND'
      '   (RX.idplanoprev is null) AND'
      '   (RX.IDPESSOA = :IDTITULAR) AND'
      '   (R.IDRUBS = RX.IDRUBS)  AND'
      '   (R.IDRUBS = HL.IDRUBS(+)) AND'
      '   (R.IDCANCELAMENTO = TP.IDCANCELAMENTO(+))'
      'ORDER BY IDRUBS'
      ''
      ' ')
    UpdateObject = UpdRUBpendentes
    ValidateWithMask = True
    Left = 241
    Top = 174
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptInput
      end>
    object qryRUBpendentesIDRUBS: TFloatField
      DisplayLabel = 'Num. RUBS'
      DisplayWidth = 10
      FieldName = 'IDRUBS'
    end
    object qryRUBpendentesSTATUS: TStringField
      DisplayLabel = 'Status'
      DisplayWidth = 13
      FieldName = 'STATUS'
      Size = 13
    end
    object qryRUBpendentesDATAMOV: TDateTimeField
      DisplayLabel = 'Data do Movimento'
      DisplayWidth = 19
      FieldName = 'DATAMOV'
    end
    object qryRUBpendentesFLGSTATUS: TStringField
      DisplayWidth = 1
      FieldName = 'FLGSTATUS'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryRUBpendentesFLGOLDSTATUS: TStringField
      DisplayWidth = 1
      FieldName = 'FLGOLDSTATUS'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryRUBpendentesIDCANCELAMENTO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCANCELAMENTO'
      Visible = False
    end
    object qryRUBpendentesIDHISTBAIXA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDHISTBAIXA'
      Visible = False
    end
    object qryRUBpendentesIDHISTLANCTO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDHISTLANCTO'
      Visible = False
    end
  end
  object dsTipoDocRubPendentes: TwwDataSource
    DataSet = qryTipoDocRubPendentes
    Left = 500
    Top = 222
  end
  object dsRUBpendentes: TwwDataSource
    DataSet = qryRUBpendentes
    Left = 377
    Top = 294
  end
  object UpdRUBpendentes: TUpdateSQL
    ModifySQL.Strings = (
      'update RUBS'
      'set'
      '  FLGSTATUS = :FLGSTATUS'
      'where'
      '  IDRUBS = :OLD_IDRUBS')
    InsertSQL.Strings = (
      'insert into RUBS'
      '  (FLGSTATUS)'
      'values'
      '  (:FLGSTATUS)')
    DeleteSQL.Strings = (
      'delete from RUBS'
      'where'
      '  IDRUBS = :OLD_IDRUBS')
    Left = 217
    Top = 126
  end
  object UpdTipoDocRubPendentes: TUpdateSQL
    ModifySQL.Strings = (
      'update TIPODOCXRUB'
      'set'
      '  FLGRECEBIDO = :FLGRECEBIDO,'
      '  DATARECEB = :DATARECEB,'
      '  OBS = :OBS'
      'where'
      '  IDTIPODOCXRUB = :OLD_IDTIPODOCXRUB')
    InsertSQL.Strings = (
      'insert into TIPODOCXRUB'
      '  (FLGRECEBIDO, DATARECEB, OBS)'
      'values'
      '  (:FLGRECEBIDO, :DATARECEB, :OBS)')
    DeleteSQL.Strings = (
      'delete from TIPODOCXRUB'
      'where'
      '  IDTIPODOCXRUB = :OLD_IDTIPODOCXRUB')
    Left = 628
    Top = 238
  end
  object QryHistRubs: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsRUBpendentes
    SQL.Strings = (
      'SELECT'
      '   IDRUBS, HISTORICO, TRGDTINCLUSAO, IDHISTMOVRUBS,'
      '   DECODE(FLGSTATUS,'#39'1'#39','#39'Gerada'#39','
      '   DECODE(FLGSTATUS,'#39'2'#39','#39'Emitida'#39','
      '   DECODE(FLGSTATUS,'#39'3'#39','#39'Regerada'#39','
      '   DECODE(FLGSTATUS,'#39'4'#39','#39'Reemitida'#39','
      '   DECODE(FLGSTATUS,'#39'5'#39','#39'Cancelada'#39','
      '   DECODE(FLGSTATUS,'#39'6'#39','#39'Emissão de Carta'#39','
      '   DECODE(FLGSTATUS,'#39'7'#39','#39'Encerrada'#39','
      '   DECODE(FLGSTATUS,'#39'8'#39','#39'Etiqueta Emitida'#39','
      '   DECODE(FLGSTATUS,'#39'9'#39','#39'Carta de Rosto Emitida'#39','
      '   DECODE(FLGSTATUS,'#39'10'#39','#39'Termo Emitido'#39','
      '   DECODE(FLGSTATUS,'#39'11'#39','#39'Documento Recebido'#39','
      '   '#39'Documento Pendente'#39'))))))))))) AS STATUS'
      'FROM'
      '  HISTMOVRUBS'
      'WHERE'
      '  IDRUBS = :IDRUBS'
      'ORDER BY IDHISTMOVRUBS'
      ' ')
    ValidateWithMask = True
    Left = 631
    Top = 294
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDRUBS'
        ParamType = ptUnknown
      end>
    object QryHistRubsIDRUBS: TFloatField
      DisplayLabel = 'Num RUBS'
      DisplayWidth = 9
      FieldName = 'IDRUBS'
      Origin = '"CM.HISTMOVRUBS".IDRUBS'
    end
    object QryHistRubsSTATUS: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 22
      FieldName = 'STATUS'
      Size = 22
    end
    object QryHistRubsHISTORICO: TMemoField
      DisplayLabel = 'Histórico'
      DisplayWidth = 15
      FieldName = 'HISTORICO'
      Origin = '"CM.HISTMOVRUBS".HISTORICO'
      BlobType = ftMemo
      Size = 1000
    end
    object QryHistRubsTRGDTINCLUSAO: TDateTimeField
      DisplayLabel = 'Data'
      DisplayWidth = 10
      FieldName = 'TRGDTINCLUSAO'
      Origin = '"CM.HISTMOVRUBS".TRGDTINCLUSAO'
    end
    object QryHistRubsIDHISTMOVRUBS: TFloatField
      DisplayWidth = 10
      FieldName = 'IDHISTMOVRUBS'
      Visible = False
    end
  end
  object DsHistRubs: TwwDataSource
    DataSet = QryHistRubs
    Left = 447
    Top = 270
  end
  object qryRubXBeneficio: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsRUBpendentes
    SQL.Strings = (
      'SELECT'
      '   SE.NOME'
      'FROM'
      '   RUBXBENEFICIO RB, SERVICO SE'
      'WHERE'
      '   (RB.IDRUBS = :IDRUBS) AND'
      '   (RB.IDBENEFICIO = SE.IDSERVICOS)'
      ''
      'UNION'
      ''
      'SELECT'
      '   BE.NOME'
      'FROM'
      '   RUBXBENEFICIO RB, BENEFICIO BE'
      'WHERE'
      '   (RB.IDRUBS = :IDRUBS) AND'
      '   (RB.IDBENEFICIO = BE.IDBENEFICIO) AND'
      '   (BE.DESCRUB IS NOT NULL)'
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 396
    Top = 342
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDRUBS'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDRUBS'
        ParamType = ptUnknown
      end>
    object qryRubXBeneficioNOME: TStringField
      DisplayLabel = 'Benefício\Serviço'
      DisplayWidth = 50
      FieldName = 'NOME'
      Origin = '"CM.BENEFICIO".NOME'
      Size = 60
    end
  end
  object DsRubXBeneficio: TwwDataSource
    DataSet = qryRubXBeneficio
    Left = 636
    Top = 206
  end
  object ppRubs: TppBDEPipeline
    DataSource = dsRUBpendentes
    UserName = 'Rubs'
    Left = 287
    Top = 230
    object ppRubsppField1: TppField
      FieldAlias = 'IDRUBS'
      FieldName = 'IDRUBS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppRubsppField2: TppField
      FieldAlias = 'STATUS'
      FieldName = 'STATUS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppRubsppField3: TppField
      FieldAlias = 'DATAMOV'
      FieldName = 'DATAMOV'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppRubsppField4: TppField
      FieldAlias = 'FLGSTATUS'
      FieldName = 'FLGSTATUS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppRubsppField5: TppField
      FieldAlias = 'FLGOLDSTATUS'
      FieldName = 'FLGOLDSTATUS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppRubsppField6: TppField
      FieldAlias = 'IDCANCELAMENTO'
      FieldName = 'IDCANCELAMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppRubsppField7: TppField
      FieldAlias = 'IDHISTBAIXA'
      FieldName = 'IDHISTBAIXA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppRubsppField8: TppField
      FieldAlias = 'IDHISTLANCTO'
      FieldName = 'IDHISTLANCTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
  end
  object RptRubs: TppReport
    AutoStop = False
    DataPipeline = ppRubs
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Posição de RUBS'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 296863
    PrinterSetup.mmPaperWidth = 210079
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 244
    Top = 262
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppRubs'
    object HeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 17727
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'ppLabel1'
        Caption = 'Posição de RUBS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 81227
        mmTop = 8731
        mmWidth = 35983
        BandType = 0
      end
      object Line1: TppLine
        UserName = 'Line1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 16669
        mmWidth = 197379
        BandType = 0
      end
      object LblEmpresa: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'LblEmpresa'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 84138
        mmTop = 1588
        mmWidth = 29633
        BandType = 0
      end
    end
    object DetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object RptRubsDBText1: TppDBText
        UserName = 'RptRubsDBText1'
        AutoSize = True
        DataField = 'IDRUBS'
        DataPipeline = ppRubs
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppRubs'
        mmHeight = 3969
        mmLeft = 1852
        mmTop = 265
        mmWidth = 13494
        BandType = 4
      end
      object RptRubsDBText2: TppDBText
        UserName = 'RptRubsDBText2'
        AutoSize = True
        DataField = 'DATAMOV'
        DataPipeline = ppRubs
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppRubs'
        mmHeight = 3969
        mmLeft = 25135
        mmTop = 265
        mmWidth = 17727
        BandType = 4
      end
      object RptRubsDBText3: TppDBText
        UserName = 'RptRubsDBText3'
        AutoSize = True
        DataField = 'STATUS'
        DataPipeline = ppRubs
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppRubs'
        mmHeight = 3969
        mmLeft = 55033
        mmTop = 265
        mmWidth = 14023
        BandType = 4
      end
    end
    object FooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 22754
      mmPrintPosition = 0
      object Line2: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 529
        mmLeft = 0
        mmTop = 529
        mmWidth = 197379
        BandType = 8
      end
      object LblSistema: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'LblSistema'
        AutoSize = False
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 13758
        mmWidth = 197909
        BandType = 8
      end
      object Calc2: TppSystemVariable
        UserName = 'Calc2'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 7938
        mmWidth = 197380
        BandType = 8
      end
      object Calc1: TppSystemVariable
        UserName = 'Calc1'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 171715
        mmTop = 1588
        mmWidth = 26194
        BandType = 8
      end
    end
    object RptRubsGroup1: TppGroup
      BreakName = 'IDRUBS'
      DataPipeline = ppRubs
      OutlineSettings.CreateNode = True
      UserName = 'RptRubsGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppRubs'
      object RptRubsGroupHeaderBand1: TppGroupHeaderBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 4233
        mmPrintPosition = 0
        object RptRubsLabel1: TppLabel
          UserName = 'RptRubsLabel1'
          Caption = 'RUBS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 1852
          mmTop = 0
          mmWidth = 9525
          BandType = 3
          GroupNo = 0
        end
        object RptRubsLabel2: TppLabel
          UserName = 'RptRubsLabel2'
          Caption = 'Data Geração'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 25135
          mmTop = 0
          mmWidth = 23019
          BandType = 3
          GroupNo = 0
        end
        object RptRubsLabel3: TppLabel
          UserName = 'RptRubsLabel3'
          Caption = 'Status Atual'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 55033
          mmTop = 0
          mmWidth = 20108
          BandType = 3
          GroupNo = 0
        end
      end
      object RptRubsGroupFooterBand1: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 17463
        mmPrintPosition = 0
        object SubDocumentos: TppSubReport
          UserName = 'SubDocumentos'
          ExpandAll = False
          NewPrintJob = False
          OutlineSettings.CreateNode = True
          TraverseAllData = False
          DataPipelineName = 'PpDocs'
          mmHeight = 2117
          mmLeft = 0
          mmTop = 265
          mmWidth = 197379
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object RptRubsChildReport1: TppChildReport
            AutoStop = False
            DataPipeline = PpDocs
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'Posição de RUBS'
            PrinterSetup.PaperName = 'A4'
            PrinterSetup.PrinterName = 'Default'
            PrinterSetup.mmMarginBottom = 6350
            PrinterSetup.mmMarginLeft = 6350
            PrinterSetup.mmMarginRight = 6350
            PrinterSetup.mmMarginTop = 6350
            PrinterSetup.mmPaperHeight = 296863
            PrinterSetup.mmPaperWidth = 210079
            PrinterSetup.PaperSize = 9
            Left = 435
            Top = 272
            Version = '7.04'
            mmColumnWidth = 0
            DataPipelineName = 'PpDocs'
            object RptRubsChildReport1HeaderBand1: TppHeaderBand
              PrintHeight = phDynamic
              mmBottomOffset = 0
              mmHeight = 4763
              mmPrintPosition = 0
              object RptRubsChildReport1Label1: TppLabel
                UserName = 'RptRubsChildReport1Label1'
                Caption = 'Documento'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4233
                mmLeft = 25665
                mmTop = 529
                mmWidth = 19050
                BandType = 0
              end
              object RptRubsChildReport1Label2: TppLabel
                UserName = 'RptRubsChildReport1Label2'
                Caption = 'Data Recebimento'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4233
                mmLeft = 101336
                mmTop = 529
                mmWidth = 30956
                BandType = 0
              end
            end
            object RptRubsChildReport1DetailBand1: TppDetailBand
              PrintHeight = phDynamic
              mmBottomOffset = 0
              mmHeight = 4498
              mmPrintPosition = 0
              object RptRubsChildReport1DBText1: TppDBText
                UserName = 'RptRubsChildReport1DBText1'
                AutoSize = True
                DataField = 'NOMEDOCUMENTO'
                DataPipeline = PpDocs
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = []
                Transparent = True
                DataPipelineName = 'PpDocs'
                mmHeight = 3969
                mmLeft = 25665
                mmTop = 0
                mmWidth = 33867
                BandType = 4
              end
              object RptRubsChildReport1DBText2: TppDBText
                UserName = 'RptRubsChildReport1DBText2'
                AutoSize = True
                DataField = 'DATARECEB'
                DataPipeline = PpDocs
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = []
                Transparent = True
                DataPipelineName = 'PpDocs'
                mmHeight = 3969
                mmLeft = 101336
                mmTop = 0
                mmWidth = 21696
                BandType = 4
              end
            end
          end
        end
        object SubBeneficios: TppSubReport
          UserName = 'SubBeneficios'
          ExpandAll = False
          NewPrintJob = False
          OutlineSettings.CreateNode = True
          ShiftRelativeTo = SubDocumentos
          TraverseAllData = False
          DataPipelineName = 'Ppbenf'
          mmHeight = 2117
          mmLeft = 0
          mmTop = 3969
          mmWidth = 197379
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object RptRubsChildReport2: TppChildReport
            AutoStop = False
            DataPipeline = Ppbenf
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'Posição de RUBS'
            PrinterSetup.PaperName = 'A4'
            PrinterSetup.PrinterName = 'Default'
            PrinterSetup.mmMarginBottom = 6350
            PrinterSetup.mmMarginLeft = 6350
            PrinterSetup.mmMarginRight = 6350
            PrinterSetup.mmMarginTop = 6350
            PrinterSetup.mmPaperHeight = 296863
            PrinterSetup.mmPaperWidth = 210079
            PrinterSetup.PaperSize = 9
            Left = 455
            Top = 292
            Version = '7.04'
            mmColumnWidth = 0
            DataPipelineName = 'Ppbenf'
            object RptRubsChildReport2HeaderBand1: TppHeaderBand
              PrintHeight = phDynamic
              mmBottomOffset = 0
              mmHeight = 4233
              mmPrintPosition = 0
              object RptRubsChildReport2Label1: TppLabel
                UserName = 'RptRubsChildReport2Label1'
                Caption = 'Benefício\Serviço'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4233
                mmLeft = 25664
                mmTop = 0
                mmWidth = 29633
                BandType = 0
              end
            end
            object RptRubsChildReport2DetailBand1: TppDetailBand
              PrintHeight = phDynamic
              mmBottomOffset = 0
              mmHeight = 4233
              mmPrintPosition = 0
              object RptRubsChildReport2DBText1: TppDBText
                UserName = 'RptRubsChildReport2DBText1'
                AutoSize = True
                DataField = 'NOME'
                DataPipeline = Ppbenf
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = []
                Transparent = True
                DataPipelineName = 'Ppbenf'
                mmHeight = 3969
                mmLeft = 25665
                mmTop = 0
                mmWidth = 10583
                BandType = 4
              end
            end
          end
        end
        object SubHistorico: TppSubReport
          UserName = 'SubHistorico'
          ExpandAll = False
          NewPrintJob = False
          OutlineSettings.CreateNode = True
          ShiftRelativeTo = SubBeneficios
          TraverseAllData = False
          DataPipelineName = 'PpHistorico'
          mmHeight = 1588
          mmLeft = 0
          mmTop = 6615
          mmWidth = 197379
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object RptRubsChildReport3: TppChildReport
            AutoStop = False
            DataPipeline = PpHistorico
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'Posição de RUBS'
            PrinterSetup.PaperName = 'A4'
            PrinterSetup.PrinterName = 'Default'
            PrinterSetup.mmMarginBottom = 6350
            PrinterSetup.mmMarginLeft = 6350
            PrinterSetup.mmMarginRight = 6350
            PrinterSetup.mmMarginTop = 6350
            PrinterSetup.mmPaperHeight = 296863
            PrinterSetup.mmPaperWidth = 210079
            PrinterSetup.PaperSize = 9
            Left = 475
            Top = 312
            Version = '7.04'
            mmColumnWidth = 0
            DataPipelineName = 'PpHistorico'
            object RptRubsChildReport3HeaderBand1: TppHeaderBand
              mmBottomOffset = 0
              mmHeight = 4763
              mmPrintPosition = 0
              object RptRubsChildReport3Label1: TppLabel
                UserName = 'RptRubsChildReport3Label1'
                Caption = 'Data'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4233
                mmLeft = 25665
                mmTop = 265
                mmWidth = 7673
                BandType = 0
              end
              object RptRubsChildReport3Label2: TppLabel
                UserName = 'RptRubsChildReport3Label2'
                Caption = 'Histórico'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4233
                mmLeft = 64823
                mmTop = 265
                mmWidth = 14552
                BandType = 0
              end
            end
            object RptRubsChildReport3DetailBand1: TppDetailBand
              PrintHeight = phDynamic
              mmBottomOffset = 0
              mmHeight = 5556
              mmPrintPosition = 0
              object RptRubsChildReport3DBText1: TppDBText
                UserName = 'RptRubsChildReport3DBText1'
                AutoSize = True
                DataField = 'TRGDTINCLUSAO'
                DataPipeline = PpHistorico
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = []
                Transparent = True
                DataPipelineName = 'PpHistorico'
                mmHeight = 3969
                mmLeft = 25665
                mmTop = 1323
                mmWidth = 30427
                BandType = 4
              end
              object RptRubsChildReport3DBMemo1: TppDBMemo
                UserName = 'RptRubsChildReport3DBMemo1'
                CharWrap = True
                DataField = 'HISTORICO'
                DataPipeline = PpHistorico
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = []
                Stretch = True
                Transparent = True
                DataPipelineName = 'PpHistorico'
                mmHeight = 4233
                mmLeft = 64823
                mmTop = 794
                mmWidth = 127000
                BandType = 4
                mmBottomOffset = 0
                mmOverFlowOffset = 0
                mmStopPosition = 0
                mmLeading = 0
              end
            end
          end
        end
        object RptRubsRegion1: TppRegion
          UserName = 'RptRubsRegion1'
          Brush.Style = bsClear
          Caption = 'RptRubsRegion1'
          Pen.Style = psClear
          ShiftRelativeTo = SubHistorico
          Transparent = True
          mmHeight = 6085
          mmLeft = 0
          mmTop = 9525
          mmWidth = 197379
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object RptRubsLine1: TppLine
            UserName = 'RptRubsLine1'
            ParentWidth = True
            Weight = 0.75
            mmHeight = 2117
            mmLeft = 0
            mmTop = 12171
            mmWidth = 197379
            BandType = 5
            GroupNo = 0
          end
        end
      end
    end
  end
  object PpDocs: TppBDEPipeline
    DataSource = dsTipoDocRubPendentes
    UserName = 'PpDocs'
    Left = 546
    Top = 182
  end
  object PpHistorico: TppBDEPipeline
    DataSource = DsHistRubs
    UserName = 'PpHistorico'
    Left = 378
    Top = 134
  end
  object Ppbenf: TppBDEPipeline
    DataSource = DsRubXBeneficio
    UserName = 'Ppbenf'
    Left = 298
    Top = 158
  end
  object qryfiario: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select '
      '  idpessoa,'
      ' idtitular '
      'from   fiario'
      'where'
      '      idrubs = :idrubs')
    ValidateWithMask = True
    Left = 550
    Top = 328
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idrubs'
        ParamType = ptUnknown
      end>
    object qryfiarioIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.FIARIO.IDPESSOA'
    end
    object qryfiarioIDTITULAR: TFloatField
      FieldName = 'IDTITULAR'
      Origin = 'BASEDADOS.FIARIO.IDTITULAR'
    end
  end
  object qrygrupo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select *  from PARAMCENTRALAP')
    ValidateWithMask = True
    Left = 465
    Top = 332
    object qrygrupoIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.PARAMCENTRALAP.IDPESSOA'
    end
    object qrygrupoIDCARTAPADRAO: TFloatField
      FieldName = 'IDCARTAPADRAO'
      Origin = 'BASEDADOS.PARAMCENTRALAP.IDCARTAPADRAO'
    end
    object qrygrupoIDETIQPADRAO: TFloatField
      FieldName = 'IDETIQPADRAO'
      Origin = 'BASEDADOS.PARAMCENTRALAP.IDETIQPADRAO'
    end
    object qrygrupoIDTIPOATENDPADRAO: TFloatField
      FieldName = 'IDTIPOATENDPADRAO'
      Origin = 'BASEDADOS.PARAMCENTRALAP.IDTIPOATENDPADRAO'
    end
    object qrygrupoIDDOCRG: TFloatField
      FieldName = 'IDDOCRG'
      Origin = 'BASEDADOS.PARAMCENTRALAP.IDDOCRG'
    end
    object qrygrupoFLGCTRLPROTOCOLO: TFloatField
      FieldName = 'FLGCTRLPROTOCOLO'
      Origin = 'BASEDADOS.PARAMCENTRALAP.IDDOCRG'
    end
    object qrygrupoIDFIARIOENDINC: TFloatField
      FieldName = 'IDFIARIOENDINC'
      Origin = 'BASEDADOS.PARAMCENTRALAP.IDDOCRG'
    end
    object qrygrupoIDFIARIOENDALT: TFloatField
      FieldName = 'IDFIARIOENDALT'
      Origin = 'BASEDADOS.PARAMCENTRALAP.IDDOCRG'
    end
    object qrygrupoIDFIARIOENDEXC: TFloatField
      FieldName = 'IDFIARIOENDEXC'
      Origin = 'BASEDADOS.PARAMCENTRALAP.IDDOCRG'
    end
    object qrygrupoIDFIARIOCCINC: TFloatField
      FieldName = 'IDFIARIOCCINC'
      Origin = 'BASEDADOS.PARAMCENTRALAP.IDDOCRG'
    end
    object qrygrupoIDFIARIOCCALT: TFloatField
      FieldName = 'IDFIARIOCCALT'
      Origin = 'BASEDADOS.PARAMCENTRALAP.IDDOCRG'
    end
    object qrygrupoIDFIARIOCCEXC: TFloatField
      FieldName = 'IDFIARIOCCEXC'
      Origin = 'BASEDADOS.PARAMCENTRALAP.IDDOCRG'
    end
    object qrygrupoIDFIARIOTELINC: TFloatField
      FieldName = 'IDFIARIOTELINC'
      Origin = 'BASEDADOS.PARAMCENTRALAP.IDDOCRG'
    end
    object qrygrupoIDFIARIOTELALT: TFloatField
      FieldName = 'IDFIARIOTELALT'
      Origin = 'BASEDADOS.PARAMCENTRALAP.IDDOCRG'
    end
    object qrygrupoIDFIARIOTELEXC: TFloatField
      FieldName = 'IDFIARIOTELEXC'
      Origin = 'BASEDADOS.PARAMCENTRALAP.IDDOCRG'
    end
    object qrygrupoIDPROTOCOLORUB: TFloatField
      FieldName = 'IDPROTOCOLORUB'
      Origin = 'BASEDADOS.PARAMCENTRALAP.IDDOCRG'
    end
  end
  object QRYDELETECONTROLATERMO: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM CONTROLATERMO')
    ValidateWithMask = True
    Left = 160
    Top = 200
  end
  object MSParticipDepen: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Participante/Dependente'
    Colunas.Strings = (
      'VWPARTICIPDEPEN.MATRICULA'
      'VWPARTICIPDEPEN.NOME'
      'VWPARTICIPDEPEN.NUMDOCUMENTO'
      'PARTPREVPLAN.INSCRICAONUMERO'
      'PLANPREV.NOME'
      'PJ.NOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'N'
      'C'
      'C')
    Descricao.Strings = (
      'Matrícula'
      'Nome'
      'CPF'
      'Inscrição'
      'Plano'
      'Patrocinadora')
    SensivelACaixa.Strings = (
      'S'
      'N'
      'S'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'PESSOA PJ'
      'ELEGPATRO'
      'PLANPREV'
      'PARTPREVPLAN'
      'SITPART'
      'VWPARTICIPDEPEN'
      'RUBXBENEFICIO')
    CamposChave.Strings = (
      'PESSOA.NOME'
      'PESSOA.NUMDOCUMENTO'
      'ELEGPATRO.MATRICULA'
      'PARTPREVPLAN.INSCRICAONUMERO'
      'PLANPREV.NOME'
      'PJ.NOME'
      'PJ.IDPESSOA'
      'VWPARTICIPDEPEN.IDTITULAR'
      'SITPART.DESCRICAO'
      'VWPARTICIPDEPEN.IDPESSOA'
      'PLANPREV.IDPLANOPREV'
      'PARTPREVPLAN.SEQPROPOSTA')
    Filtro.Strings = (
      'VWPARTICIPDEPEN.IDTITULAR  = ELEGPATRO.IDPESSOA '
      'ELEGPATRO.IDPESSJUR          =  PJ.IDPESSOA(+)'
      'PARTPREVPLAN.IDPESSOA(+)     = ELEGPATRO.IDPESSOA'
      'PARTPREVPLAN.IDPESSJUR (+)   = ELEGPATRO.IDPESSJUR'
      'PARTPREVPLAN.IDPLANOPREV     = PLANPREV.IDPLANOPREV(+) '
      'PARTPREVPLAN.IDSITPART = SITPART.IDSITPART(+)'
      'VWPARTICIPDEPEN.IDTITULAR  = PESSOA.IDPESSOA'
      'VWPARTICIPDEPEN.IDPESSOA = RUBXBENEFICIO.IDPESSOA '
      'RUBXBENEFICIO.IDPESSJUR IS NULL'
      'RUBXBENEFICIO.IDPLANOPREV IS NULL')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '13'
      '60'
      '18'
      '10'
      '10'
      '50')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 69
    Top = 82
  end
  object qryBuscaRubs: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  R.IDRUBS,'
      '  HL.FLGSTATUS,'
      '  CC.IDREPORTS,'
      '  C.IDCONFIGRUBS,'
      '  C.DESCRUB,'
      '  C.NOMETXTRUB,'
      '  C.NOMEDOCRUB,'
      '  C.SEPARADORCOLUNAS,'
      '  C.NUMDIASCARTAAVISO,'
      '  C.FLGDELIMITALINHA,'
      '  C.IDCARTACOBRANCA'
      'FROM'
      '  CONFIGRUBS C,'
      '  RUBS R,'
      '  ASSUNTO A,'
      '  ASSUNTOXATEND AXA,'
      '  CARTACOBRANCA CC,'
      '  HISTMOVRUBS HL'
      'WHERE'
      '  R.IDRUBS = -1 AND'
      '  R.IDRUBS = HL.IDRUBS AND'
      '  R.IDASSUNTOXATEND = AXA.IDASSUNTOXATEND(+)  AND'
      '  A.IDASSUNTO = AXA.IDASSUNTO  AND'
      '  A.IDCONFIGRUBS =  C.IDCONFIGRUBS AND'
      '  C.IDCONFIGRUBS = A.IDCONFIGRUBS AND'
      '  CC.IDCARTACOBRANCA = C.IDCARTACOBRANCA'
      ''
      ' ')
    UpdateObject = UpdBuscaRubs
    ValidateWithMask = True
    Left = 294
    Top = 332
    object qryBuscaRubsIDRUBS: TFloatField
      FieldName = 'IDRUBS'
    end
    object qryBuscaRubsFLGSTATUS: TStringField
      FieldName = 'FLGSTATUS'
      Size = 2
    end
    object qryBuscaRubsIDREPORTS: TFloatField
      FieldName = 'IDREPORTS'
    end
    object qryBuscaRubsIDCONFIGRUBS: TFloatField
      FieldName = 'IDCONFIGRUBS'
    end
    object qryBuscaRubsDESCRUB: TStringField
      FieldName = 'DESCRUB'
      Size = 60
    end
    object qryBuscaRubsNOMETXTRUB: TStringField
      FieldName = 'NOMETXTRUB'
      Size = 60
    end
    object qryBuscaRubsNOMEDOCRUB: TStringField
      FieldName = 'NOMEDOCRUB'
      Size = 60
    end
    object qryBuscaRubsSEPARADORCOLUNAS: TStringField
      FieldName = 'SEPARADORCOLUNAS'
      FixedChar = True
      Size = 1
    end
    object qryBuscaRubsNUMDIASCARTAAVISO: TFloatField
      FieldName = 'NUMDIASCARTAAVISO'
    end
    object qryBuscaRubsFLGDELIMITALINHA: TStringField
      FieldName = 'FLGDELIMITALINHA'
      FixedChar = True
      Size = 1
    end
    object qryBuscaRubsIDCARTACOBRANCA: TFloatField
      FieldName = 'IDCARTACOBRANCA'
    end
  end
  object QryCamposRub: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = DsDados
    SQL.Strings = (
      'SELECT'
      '  D.CAMPODETALHE'
      'FROM'
      '  DETALHERUBS D'
      'WHERE'
      '  D.IDCONFIGRUBS = :IDCONFIGRUBS'
      '')
    ValidateWithMask = True
    Left = 39
    Top = 341
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDCONFIGRUBS'
        ParamType = ptUnknown
      end>
  end
  object QryDados: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '       RUBS.IDRUBS AS IDRUB,'
      '       A.IDATEND,'
      '       TO_CHAR(SYSDATE,'#39'DD'#39') AS DATA_DIA,'
      '       TO_CHAR(SYSDATE,'#39'MM'#39') AS DATA_MES,'
      '       TO_CHAR(SYSDATE,'#39'YYYY'#39') AS DATA_ANO,'
      '       P.IDPESSOA AS IDPARTICIPANTE,'
      '       P.NOME AS PARTICIPANTE,'
      '       P.NUMDOCUMENTO AS DOCUMENTO_PARTICIP,'
      '       X.LOGRADOURO AS ENDERECO,'
      '       X.NUMERO AS NUMERO,'
      '       X.COMPLEMENTO AS COMPLEMENTO,'
      '       EST.CODESTADO AS ESTADO,'
      '       X.BAIRRO,'
      '       CID.NOME AS CIDADE,'
      '       X.CEP,'
      '       TE.NUMERO AS TELEFONE_PARTICIP,'
      '       A.NOMESOLICITANTE,'
      '       A.LOGRADOURO AS ENDERECO_SOLICIT,'
      '       A.NUMEROSOLIC AS NUMERO_SOLICITANTE,'
      '       A.COMPLEMSOLIC AS COMPLEMENTO_SOLIC,'
      '       A.BAIRROSOLIC AS BAIRRO_SOLICITANTE,'
      '       A.CEPSOLIC AS CEP_SOLICITANTE,'
      '       A.CIDADESOLIC AS CIDADE_SOLICITANTE,'
      '       A.TELSOLICITANTE AS TEL_SOLICITANTE,'
      '       A.CODESTADOSOLIC  AS ESTADO_SOLICITANTE,'
      '       A.NUMDOCUMENTOCPF AS CPF_SOLICITANTE,'
      '       A.NUMDOCUMENTORG AS RG_SOLICITANTE,'
      '       A.EMAIL AS EMAIL_SOLICITANTE,'
      '       EL.MATRICULA ,'
      '       PP.INSCRICAONUMERO AS INSCRICAO,'
      '       PP.INSCRICAODATA AS DATAINSCRICAO,'
      '       EL.DATAADMISSAO AS ADMISSAO,'
      '       EL.IDPESSJUR AS IDPATROCINADORA,'
      '       PJ.NOME AS PATROCINADORA,'
      '       PL.IDPLANOPREV AS IDPLANO,'
      '       PL.NOME AS PLANO,'
      '       PF.NOMEPAI AS NOME_DO_PAI,'
      '       PF.NOMEMAE AS NOME_DA_MAE,'
      '       PF.DATAMORTE AS DATA_MORTE,'
      '       PF.DATANASC AS DATA_NASCIMENTO,'
      '       PF.SEXO,'
      '       PF.TIPOSANG AS TIPO_SANGUINIO,'
      '       PF.ESTCIVIL AS ESTADO_CIVIL,'
      '       PF.NUMDEPIRRF AS NUMERO_DEP_IRRF,'
      '       PF.NUMDEPSALF AS NUMERO_DEP_SALFAM,'
      '       PF.NUMDEPTOT AS NUMERO_DEPENDENTES,'
      '       PF.FLGISENTOIRRF AS ISENTO_IRRF ,'
      '       BAN.NUMBANCO  AS NUMERO_BANCO,'
      '       PB.NOME  AS NOME_BANCO,'
      '       AG.NUMAGENCIA  AS NUMERO_AGENCIA,'
      '       PA.NOME  AS NOME_AGENCIA,'
      '       CONT.CONTACORRENTE ,'
      '       PI.NOMENACIONALIDADE  AS NACIONALIDADE ,'
      '       PP.SALPARTICIPACAO  AS SAL_PARTICIPACAO,'
      '       CID.NOME AS  NOME_CIDADE,'
      '       DEPEN.DESCRICAO AS TIPO_DEPENDENTE,'
      '       ('
      '          SELECT'
      
        '             DECODE(BE.DESCRUB,NULL,BE.NOME,BE.DESCRUB) AS NOME_' +
        'BEN_SERV'
      '          FROM'
      '             RUBXBENEFICIO RB, BENEFICIO BE'
      '          WHERE'
      '             (RB.IDRUBS = RUBS.IDRUBS) AND'
      '             (RB.IDBENEFICIO = BE.IDBENEFICIO)'
      '          UNION'
      '          SELECT'
      '             SERV.NOME AS NOME_BEN_SERV'
      '          FROM'
      '             RUBXBENEFICIO RB, SERVICO SERV'
      '          WHERE'
      '             (RB.IDRUBS = RUBS.IDRUBS) AND'
      '             (RB.IDBENEFICIO = SERV.IDSERVICOS)'
      '       )  AS NOME_BEN_SERV'
      'FROM   PESSOA P,'
      '       PESSOA PJ,'
      '       ELEGPATRO EL,'
      '       PLANPREV PL,'
      '       PATRO PT,'
      '       PARTPREVPLAN PP,'
      '       PESSOAFISICA PF,'
      '       ENDPESS X,'
      '       CIDADES CID,'
      '       ESTADO EST,'
      '       ATEND A,'
      '       ASSUNTOXATEND AXA,'
      '       RUBS,'
      '       TELENDPESS TE,'
      '       BANCO BAN,'
      '       AGENCIABANCARIA AG,'
      '       CONTABANCARIA  CONT,'
      '       PESSOA  PB,'
      '       PESSOA  PA,'
      '       PAIS PI ,'
      '       DEPEN DEPEN,'
      '       DEPENTIT   DEPENTIT'
      'WHERE'
      '      (RUBS.IDRUBS =  :IDRUBS)'
      'AND   (TE.IDENDERECO(+) = X.IDENDERECO)'
      'AND   ( P.IDENDCORRESP = X.IDENDERECO(+))'
      'AND   (  X.IDCIDADES = CID.IDCIDADES(+)  )'
      'AND   (  EST.IDESTADO (+) = CID.IDESTADO)'
      'AND   (AXA.IDASSUNTOXATEND = RUBS.IDASSUNTOXATEND)'
      'AND   (PJ.IDPESSOA    = PT.IDPESSOA)'
      'AND   (PT.IDPESSOA    = EL.IDPESSJUR)'
      'AND   (P.IDPESSOA     = EL.IDPESSOA)'
      'AND   (P.IDPESSOA     = PF.IDPESSOA)'
      'AND   (PP.IDPESSJUR   = PT.IDPESSOA)'
      'AND   (PP.IDPESSOA    = P.IDPESSOA)'
      'AND   (PP.IDPLANOPREV = PL.IDPLANOPREV)'
      ''
      
        'and ((pp.FLGDESATIVADO = 1 AND pp.IDPESSOA NOT IN (SELECT PPP1.I' +
        'DPESSOA FROM PARTPREVPLAN PPP1 WHERE PPP1.IDPESSOA = pp.IDPESSOA' +
        ' AND PPP1.FLGDESATIVADO IN (0, NULL))) OR pp.FLGDESATIVADO IN (0' +
        ', NULL) )'
      ''
      'AND   (A.IDTITULAR = P.IDPESSOA)'
      'AND   (A.IDPESSJUR = PP.IDPESSJUR)'
      'AND   (A.IDATEND = AXA.IDATEND)'
      'AND   (EST.IDESTADO (+) = CID.IDESTADO)'
      'AND   (CONT.IDPESSOA (+) = P.IDPESSOA)'
      'AND   (CONT.FLGCONTAPREF  = 1 OR CONT.FLGCONTAPREF IS NULL)'
      'AND   (CONT.IDAGENCIA = AG.IDPESSOA(+))'
      'AND   (BAN.IDPESSOA(+) = AG.IDBANCO)'
      'AND   (PB.IDPESSOA(+) = AG.IDBANCO)'
      'AND   (PA.IDPESSOA(+) = AG.IDPESSOA)'
      'AND   (PI.IDPAIS(+) = PF.IDPAIS)'
      'AND   (DEPENTIT.IDPESSOA(+) = A.IDBENEFICIARIO)'
      'AND   (DEPEN.IDDEPENDENCIA(+) = DEPENTIT.IDDEPENDENCIA)'
      '')
    ValidateWithMask = True
    Left = 105
    Top = 357
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDRUBS'
        ParamType = ptInput
      end>
  end
  object DsDados: TwwDataSource
    DataSet = QryDados
    Left = 76
    Top = 397
  end
  object UpdBuscaRubs: TUpdateSQL
    ModifySQL.Strings = (
      'update HISTMOVRUBS'
      'set'
      '  FLGSTATUS = :FLGSTATUS'
      'where'
      '  IDRUBS = :OLD_IDRUBS and'
      '  FLGSTATUS = :OLD_FLGSTATUS')
    Left = 205
    Top = 336
  end
  object qryaux: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 174
    Top = 149
  end
  object ppDetalhe_Dependente_IRRF: TppBDEPipeline
    DataSource = DtmRubs.dsDetDependIRRF
    UserName = 'Detalhe_Dependente_IRRF'
    Left = 608
    Top = 202
  end
  object PpDados: TppBDEPipeline
    DataSource = DtmRubs.DsDados
    UserName = 'PpDados'
    Left = 576
    Top = 125
  end
  object ppdetalhe_documentos: TppBDEPipeline
    DataSource = DtmRubs.dsDetDocs
    UserName = 'detalhe_documentos'
    Left = 705
    Top = 112
  end
  object RptModelo: TppReport
    OnPrintingComplete = GravaEmissaoCarta
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.DatabaseSettings.DataPipeline = PpDados
    Template.FileName = 'C:\Teste.Txt'
    Template.Format = ftASCII
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    ModalPreview = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 451
    Top = 117
    Version = '7.04'
    mmColumnWidth = 197300
    object ppDetailBand2: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 19050
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 8731
        mmTop = 5292
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 51858
        mmTop = 5027
        mmWidth = 17198
        BandType = 4
      end
    end
  end
  object DsgnCM: TppDesigner
    Caption = 'Gerador de Relatórios e Gráficos'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Icon.Data = {
      0000010001002020100000000000E80200001600000028000000200000004000
      0000010004000000000080020000000000000000000000000000000000000000
      000000008000008000000080800080000000800080008080000080808000C0C0
      C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
      0000000000033333300003333330000000000000003BBBBBB3003BBBBBB30000
      00000000003BBBBBB3003BBBBBB30000000000000003BBBB3003BBBBBB300000
      000000000003BBBB3003BBBBB3000000000000000003BBBB3003BBBB30000000
      000000000003BBBBB33BBBBB30000000000000000003BBBBBBBBBBB300000000
      000000000003BBBBBBBBBBB300000000000000700003BBBB333BBBBB30000000
      000000800003BBBB3003BBBBB30000000000F8F00003BBBB3003BBBBB3000000
      008F8F800003BBBB3003BBBBB3000070F8F877F80003BBBB333BBBBBB300007F
      8F00F08F003BBBBBBBBBBBBB3000007800FFF048003BBBBBBBBBBBB300000000
      FFFFF08F8003333333333330000070FFFFCCF804F07000000000000000007FFF
      CCFFFF0F8F0000000000000000007FCCFFFCCF074807000000000000000078FF
      FCCFFFF08F80700000000000000007FCCFFFCCF044F8070000000000000007FF
      FFCCFFFF0F8F8000000000000000078FCCFFFCCF07F77000000000000000007F
      FFFCCFFFF07000000000000000000078FCCFFFCCFF0700000000000000000007
      FFFFCCFFFF80000000000000000000078FCCFFFF877000000000000000000000
      7FFFFF8770000000000000000000000007FF8770000000000000000000000000
      007770000000000000000000000000000000000000000000000000000000FFFE
      0781FFFC0300FFFC0300FFFE0601FFFE0603FFFE0607FFFE0007FFFE000FFFFE
      000FFFDE0007FF0E0603FC0E0603F00E0603C0060003C0040007C004000FC002
      001F0001FFFF0001FFFF0000FFFF00007FFF80003FFF80003FFF80007FFFC001
      FFFFC000FFFFE000FFFFE001FFFFF007FFFFF81FFFFFFC7FFFFFFFFFFFFF}
    Position = poScreenCenter
    Report = RptModelo
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    WindowState = wsMaximized
    Left = 510
    Top = 133
  end
  object ppDetalhe_Telefones: TppBDEPipeline
    DataSource = DtmRubs.dsDetTelefones
    UserName = 'Detalhe_Telefones'
    Left = 705
    Top = 159
  end
  object ppDetalhe_Dependente: TppBDEPipeline
    DataSource = DtmRubs.dtsDetDependentes
    UserName = 'Detalhe_Dependente'
    Left = 396
    Top = 233
  end
  object ppDetalhe_Beneficiario: TppBDEPipeline
    DataSource = DtmRubs.dtsDetBeneficiarios
    UserName = 'Detalhe_Beneficiario'
    Left = 500
    Top = 270
  end
end
