inherited frmRecebeContribuicaoNovo: TfrmRecebeContribuicaoNovo
  Left = 361
  Top = 130
  HelpContext = 160045
  Caption = 'Recebimento de Contribuições via Folha'
  ClientHeight = 481
  ClientWidth = 820
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Top = 81
    Width = 820
    Height = 361
    object Label1: TLabel
      Left = 8
      Top = 96
      Width = 188
      Height = 13
      Caption = 'Integrar com Contabilidade ? Sim'
    end
    object pgctrlOpcoes: TPageControl
      Left = 1
      Top = 1
      Width = 818
      Height = 359
      ActivePage = tbsArqRetorno
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnChange = pgctrlOpcoesChange
      object tbsOpcoes: TTabSheet
        Caption = 'Opções Básicas'
        object pnlTabSheet1: TPanel
          Left = 0
          Top = 0
          Width = 810
          Height = 331
          Align = alClient
          BevelOuter = bvLowered
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object Panel1: TPanel
            Left = 1
            Top = 1
            Width = 158
            Height = 329
            Align = alLeft
            TabOrder = 0
            object rgrpPatro: TRadioGroup
              Left = 8
              Top = 10
              Width = 142
              Height = 68
              Caption = 'Patrocinadoras'
              TabOrder = 0
              OnClick = rgrpPatroClick
            end
            object rgrpPlano: TRadioGroup
              Left = 8
              Top = 96
              Width = 142
              Height = 88
              Caption = 'Planos Previdenciários'
              TabOrder = 1
              OnClick = rgrpPlanoClick
            end
          end
          object GroupBox5: TGroupBox
            Left = 159
            Top = 1
            Width = 650
            Height = 329
            Align = alClient
            Caption = ' Escolher Contribuição '
            TabOrder = 1
            object lstContrib: TListBox
              Left = 2
              Top = 15
              Width = 305
              Height = 312
              Align = alLeft
              ItemHeight = 13
              Sorted = True
              TabOrder = 0
            end
            object Panel3: TPanel
              Left = 307
              Top = 15
              Width = 31
              Height = 312
              Align = alLeft
              BevelOuter = bvNone
              TabOrder = 1
              object sbtnDesUmaContrib: TSpeedButton
                Left = 3
                Top = 68
                Width = 25
                Height = 25
                Hint = 'Associar rubrica selecionada'
                Caption = '<'
                NumGlyphs = 2
                ParentShowHint = False
                ShowHint = True
                OnClick = sbtnDesUmaContribClick
              end
              object sbtnDesTodasContrib: TSpeedButton
                Left = 3
                Top = 97
                Width = 25
                Height = 25
                Hint = 'Associar todas as rubricas'
                Caption = '<<'
                NumGlyphs = 2
                ParentShowHint = False
                ShowHint = True
                OnClick = sbtnDesTodasContribClick
              end
              object sbtnSelUmaContrib: TSpeedButton
                Left = 3
                Top = 127
                Width = 25
                Height = 25
                Hint = 'Desassociar rubrica selecionada'
                Caption = '>'
                NumGlyphs = 2
                ParentShowHint = False
                ShowHint = True
                OnClick = sbtnSelUmaContribClick
              end
              object sbtnSelTodasContrib: TSpeedButton
                Left = 3
                Top = 156
                Width = 25
                Height = 25
                Hint = 'Desassociar todas as rubricas'
                Caption = '>>'
                NumGlyphs = 2
                ParentShowHint = False
                ShowHint = True
                OnClick = sbtnSelTodasContribClick
              end
            end
            object lstContribSel: TListBox
              Left = 338
              Top = 15
              Width = 310
              Height = 312
              Align = alClient
              ItemHeight = 13
              Sorted = True
              TabOrder = 2
            end
          end
        end
      end
      object tbsArqRetorno: TTabSheet
        Caption = 'Arquivo de Retorno'
        ImageIndex = 1
        object GroupBox6: TGroupBox
          Left = 4
          Top = 0
          Width = 353
          Height = 39
          Caption = ' Posicionar '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object Label5: TLabel
            Left = 14
            Top = 19
            Width = 95
            Height = 13
            Caption = 'Numrecebimento'
          end
          object edtNumReceb: TEdit
            Left = 114
            Top = 12
            Width = 200
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object btnNumReceb: TBitBtn
            Left = 320
            Top = 8
            Width = 25
            Height = 25
            Default = True
            ModalResult = 1
            TabOrder = 1
            OnClick = btnNumRecebClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              8888888888FFFFF8888888888000008888888888F777778FF888888002222200
              88888887788888778F88887222222222088888788888888878F887A228822222
              208887F88FFF888887F887A2FFF8222220888788777FF888878F7A22FFFF8222
              22087F887777FF88887F7A22FFFFF82222087F8877777FF8887F7A22FF8FFF82
              22087F8877F777FF887F7A22FF82FFF822087F8877F8777F887F7A22FF222FF8
              220878F87788877FF87887A2222222FF208887F88888887787F887A222222222
              2088878F888888888788887AA222222208888878FF88888F788888877AAAAA77
              8888888778FFFF77888888888777778888888888877777888888}
            NumGlyphs = 2
          end
        end
        object Panel4: TPanel
          Left = 0
          Top = 296
          Width = 810
          Height = 35
          Align = alBottom
          TabOrder = 1
          object Label6: TLabel
            Left = 659
            Top = 12
            Width = 104
            Height = 13
            Caption = 'Total de registros:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblTotReg: TLabel
            Left = 764
            Top = 12
            Width = 46
            Height = 13
            Caption = 'lblTotReg'
          end
          object lblTotRejeitado: TLabel
            Left = 528
            Top = 12
            Width = 71
            Height = 13
            Caption = 'lblTotRejeitado'
          end
          object Label9: TLabel
            Left = 401
            Top = 12
            Width = 125
            Height = 13
            Caption = 'Valor Total Rejeitado:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object btnIncluir: TBitBtn
            Left = 6
            Top = 4
            Width = 88
            Height = 28
            Caption = '&Incluir'
            Default = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ModalResult = 1
            ParentFont = False
            TabOrder = 0
            OnClick = btnIncluirClick
            Glyph.Data = {
              36040000424D3604000000000000360000002800000010000000100000000100
              2000000000000004000000000000000000000000000000000000FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000FFFF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000FF
              FF00FF00FF00FF00FF00FF00FF00FF00FF0000FFFF0000FFFF00848484008484
              8400FF00FF00FF00FF00FF00FF00FF00FF0000FFFF00FF00FF00FF00FF00FF00
              FF0000FFFF0000FFFF00FF00FF00FF00FF000000000000000000FFFFFF000000
              0000FF00FF00FF00FF0000FFFF0000FFFF00FF00FF00FF00FF00FF00FF00FF00
              FF0000FFFF0000FFFF000000000000000000FFFFFF00FFFFFF00FFFFFF000000
              000000FFFF0000FFFF0000FFFF0000FFFF00FF00FF00FF00FF00FF00FF00FF00
              FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF000000000000FFFF0000FFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFF
              FF000000000000FFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF0084848400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFF
              FF00FFFFFF000000000000FFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF0000FFFF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF00
              0000FFFFFF000000000000FFFF0000FFFF00FF00FF00FF00FF0000FFFF0000FF
              FF0000FFFF0084848400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFF
              FF00FFFFFF00FFFFFF000000000000FFFF0000FFFF0000FFFF00FF00FF00FF00
              FF0000FFFF0000FFFF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FF000000FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF0000FFFF0084848400FFFFFF00FFFFFF00FF000000FF000000FF00
              0000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00
              FF00FF00FF0000FFFF0000FFFF0084848400FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF008484840084848400FF00FF00FF00FF00FF00FF00FF00
              FF0000FFFF0000FFFF0000FFFF0000FFFF0084848400FFFFFF00FFFFFF00FFFF
              FF00848484008484840000FFFF0000FFFF00FF00FF00FF00FF00FF00FF00FF00
              FF0000FFFF0000FFFF00FF00FF00FF00FF0000FFFF0084848400848484008484
              8400FF00FF00FF00FF0000FFFF0000FFFF00FF00FF00FF00FF00FF00FF0000FF
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000FFFF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF0000FFFF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000FFFF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
          end
          object btnExcluir: TBitBtn
            Left = 102
            Top = 4
            Width = 88
            Height = 28
            Caption = '&Excluir'
            Default = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ModalResult = 1
            ParentFont = False
            TabOrder = 1
            OnClick = btnExcluirClick
            Glyph.Data = {
              36040000424D3604000000000000360000002800000010000000100000000100
              2000000000000004000000000000000000000000000000000000FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF008484
              840084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000FFFF
              FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF000000000000000000FFFFFF00FFFFFF00FFFF
              FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF00
              0000FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF000000840000008400000084000000840000008400FF000000FF000000FFFF
              FF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00FF000000
              84000000FF000000FF000000FF000000FF000000FF0000008400FFFFFF00FFFF
              FF00FF000000FFFFFF0000000000FF00FF00FF00FF00FF00FF000000FF000000
              FF000000FF000000FF000000FF000000FF000000FF000000FF0000008400FF00
              0000FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF000000FF000000
              FF00FF00FF00FFFFFF000000FF00FFFFFF00FFFFFF000000FF0000008400FFFF
              FF00FFFFFF00FF000000FFFFFF00FFFFFF0000000000FF00FF000000FF000000
              FF000000FF00FF00FF00FFFFFF00FFFFFF000000FF000000FF0000008400FF00
              0000FF000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000FF000000
              FF000000FF00FFFFFF00FFFFFF00FF00FF000000FF000000FF0000008400FFFF
              FF00FFFFFF00FFFFFF00FFFFFF008484840084848400FF00FF000000FF000000
              FF00FF00FF00FFFFFF000000FF00FFFFFF00FFFFFF000000FF0000008400FFFF
              FF00FFFFFF008484840084848400FF00FF00FF00FF00FF00FF00FF00FF000000
              FF000000FF000000FF000000FF000000FF000000FF0000008400848484008484
              840084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF000000FF000000FF000000FF000000FF000000FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
          end
        end
        object gridArqRet: TwwDBGrid
          Left = 0
          Top = 47
          Width = 810
          Height = 249
          ControlType.Strings = (
            'SELECIONA;CheckBox;S;N')
          Selected.Strings = (
            'SELECIONA'#9'1'#9'Seleciona'#9'F'
            'NUMRECEBIMENTO'#9'10'#9'NumRecebimento'#9'F'
            'MATRICULA'#9'15'#9'Matrícula'#9'F'
            'NOME'#9'40'#9'Nome'#9'F'
            'MESREFERENCIA'#9'7'#9'Mês ~Referência'#9'F'
            'MESCOBRANCA'#9'7'#9'Mês ~Cobrança'#9'F'
            'VALORESPERADO'#9'10'#9'Valor ~Esperado'#9'F'
            'ALTERADORES'#9'10'#9'Alteradores'#9'F'
            'VALOR_TOTAL'#9'10'#9'Total ~Esperado'#9'F'
            'CONTRIBUICAO'#9'40'#9'Contribuição'#9'F'
            'SITUACAO'#9'20'#9'Situação'#9'F'
            'PATRONOME'#9'15'#9'Patrocionadora'#9'F'
            'PLANONOME'#9'15'#9'Plano ~Previdenciário'#9'F'
            'OBSERVACOES'#9'60'#9'Observação'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alBottom
          DataSource = dsArqRetorno
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgWordWrap]
          ParentFont = False
          TabOrder = 2
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 2
          TitleButtons = True
          UseTFields = False
          OnTitleButtonClick = gridArqRetTitleButtonClick
          IndicatorColor = icBlack
          OnCalcTitleImage = gridArqRetCalcTitleImage
          TitleImageList = imgTitulosGrids
        end
        object btnMarcaTodas: TBitBtn
          Left = 754
          Top = 18
          Width = 23
          Height = 23
          Hint = 'Seleciona todos os Planos'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          OnClick = btnMarcaTodasClick
          Glyph.Data = {
            D6000000424DD60000000000000076000000280000000C0000000C0000000100
            0400000000006000000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888848888888
            0000888224888888000088222248888800008822822488880000882848224888
            0000888224822488000088222248228800008822822482880000882888224888
            0000888888822488000088888888228800008888888882880000}
        end
        object btnInverte: TBitBtn
          Left = 778
          Top = 18
          Width = 23
          Height = 23
          Hint = 'Inverte a Seleção de Planos'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
          OnClick = btnInverteClick
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            0400000000008000000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            8888888888488888888888888844888888888888444448888888888444444488
            1888884444444888118884448844888881188448884888888118844888888188
            8118844888881188111888448881111111888884881111111888888888811111
            8888888888881188888888888888818888888888888888888888}
        end
      end
      object tbsValorRec: TTabSheet
        Caption = 'Valor a Receber'
        ImageIndex = 4
        object gridValorRec: TwwDBGrid
          Left = 0
          Top = 0
          Width = 810
          Height = 331
          Selected.Strings = (
            'PAGADOR'#9'15'#9'Pagador'#9'F'
            'VALORESPERADO'#9'15'#9'Valor Esperado'#9'F'
            'ALTERA'#9'15'#9'Alteradores'#9'F'
            'TOTAL'#9'15'#9'Total Esperado'#9'F'
            'PLANONOME'#9'25'#9'Plano'#9'F'
            'PATRONOME'#9'25'#9'Patro'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsValReceber
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgWordWrap]
          ParentFont = False
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
      end
      object tbsResultado: TTabSheet
        Caption = 'Resultado'
        object pnlTabSheet4: TPanel
          Left = 0
          Top = 0
          Width = 810
          Height = 331
          Align = alClient
          BevelOuter = bvLowered
          Caption = 'pnlTabSheet4'
          TabOrder = 0
          object bbtnSalvar: TBitBtn
            Left = 645
            Top = 13
            Width = 91
            Height = 33
            Caption = 'S&alvar'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            OnClick = bbtnSalvarClick
            Glyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              0400000000008000000000000000000000001000000010000000000000000000
              BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
              7777770000000000007770330770000330777033077000033077703307700003
              30777033000000033077703333333333307770330000000330777030FFFFFFF0
              30777030FCCCCFF030777030FFCCCFF030777037FCCCCFF000777077CCCFCFF0
              8077777CCC777700007777CCC77777777777777C777777777777}
          end
          object memResult: TMemo
            Left = 1
            Top = 1
            Width = 624
            Height = 329
            Align = alLeft
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            ScrollBars = ssBoth
            TabOrder = 1
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 442
    Width = 820
    inherited tb97Fundo: TToolbar97
      Left = 430
      DockPos = 430
      inherited sep1: TToolbarSep97
        Left = 159
      end
      inherited sep3: TToolbarSep97
        Left = 162
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 81
        Width = 78
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 261
      DockPos = 261
      inherited bbtnConfirmar: TBitBtn
        Hint = 'Imprimir Demonstrativo de Recebimento'
        Caption = '&Imprimir'
        ModalResult = 0
        ParentShowHint = False
        ShowHint = True
        OnClick = bbtnConfirmarClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
          00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
          8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
          8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
          8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
          03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
          03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
          33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
          33333337FFFF7733333333300000033333333337777773333333}
      end
      inherited bbtnCancelar: TBitBtn
        Visible = False
      end
    end
  end
  object Panel2: TPanel [2]
    Left = 0
    Top = 0
    Width = 820
    Height = 81
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object grpMesAnoRef: TGroupBox
      Left = 8
      Top = 13
      Width = 201
      Height = 53
      Caption = ' Mês/Ano de Cobrança (Competência) '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnExit = grpMesAnoRefExit
      object cmbMesCob: TComboBox
        Left = 8
        Top = 24
        Width = 113
        Height = 21
        Style = csDropDownList
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemHeight = 13
        ParentFont = False
        TabOrder = 0
        OnChange = cmbMesCobChange
        Items.Strings = (
          'janeiro'
          'fevereiro'
          'março'
          'abril'
          'maio'
          'junho'
          'julho'
          'agosto'
          'setembro '
          'outubro'
          'novembro'
          'dezembro')
      end
      object spedAnoCob: TSpinEdit
        Left = 120
        Top = 24
        Width = 65
        Height = 22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 4
        MaxValue = 0
        MinValue = 0
        ParentFont = False
        TabOrder = 1
        Value = 1998
        OnChange = spedAnoCobChange
      end
    end
    object bbtnReceber: TBitBtn
      Left = 655
      Top = 4
      Width = 91
      Height = 33
      Caption = '&Receber'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = bbtnReceberClick
      Glyph.Data = {
        06010000424D060100000000000076000000280000000B000000120000000100
        0400000000009000000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333333A
        000033833333333F00003088333333380000300883333337000030A088333338
        000030AA088333300000307A70883338000030AAAA08833F000030A7A7A08837
        000030AAAAAA03300000307A7A703338000030AAAA033338000030A7A0333330
        000030AA0333333800003070333333380000300333333338000030333333333F
        00003333333333300000}
    end
    object GroupBox3: TGroupBox
      Left = 465
      Top = 13
      Width = 137
      Height = 53
      Caption = ' Data de Recebimento '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      object dtRecebimento: TCMDateTimePicker
        Left = 16
        Top = 24
        Width = 105
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
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ShowButton = True
        TabOrder = 0
        UnboundDataType = wwDTEdtDate
        OnChange = dtRecebimentoChange
      end
    end
    object bbtnDesfazer: TBitBtn
      Left = 655
      Top = 41
      Width = 91
      Height = 33
      Caption = '&Desfazer'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = bbtnDesfazerClick
      Glyph.Data = {
        06010000424D060100000000000076000000280000000B000000120000000100
        0400000000009000000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333330
        0000333333338330000033333338803000003333338800300000333338809030
        0000333388099030000033388079703000003388099990300000388097979030
        0000330999999030000033307979703000003333099990300000333330979030
        0000333333099030000033333330703000003333333300300000333333333030
        00003333333333300000}
    end
    object rgrpTipoFolha: TRadioGroup
      Left = 267
      Top = 13
      Width = 153
      Height = 53
      Caption = ' Tipo de Folha '
      ItemIndex = 0
      Items.Strings = (
        'Folha da Patrocinadora'
        'Folha de Benefícios')
      TabOrder = 4
      OnClick = rgrpTipoFolhaClick
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 1027
    Top = 65499
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object SaveDlg: TSaveDialog
    DefaultExt = '.txt'
    Filter = 'Arquivos texto|*.txt|Todos os arquivos|*.*'
    InitialDir = 'c:\'
    Title = 'Salvar cálculo de contribuições'
    Left = 332
    Top = 281
  end
  object qryPatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT P.IDPESSOA, P.NOME, PT.FLGANO13, PT.IDRUBSALPARTICIP, PT.' +
        'FLGGERACAR'
      'FROM   PESSOA P, PATRO PT'
      'WHERE  PT.IDPESSOA = P.IDPESSOA'
      'AND PT.FLGGERACAR = 1'
      'ORDER BY P.NOME'
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 228
    Top = 331
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 228
    Top = 280
  end
  object qryPlano: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT PP.IDPLANOPREV, PP.NOME'
      'FROM   PLANPREV PP, PLANPREVPATRO PPP'
      'WHERE  PP.IDPLANOPREV = PPP.IDPLANOPREV '
      'AND    PPP.IDPESSJUR = :pIDPESSJUR'
      'AND    PPP.FLGATIVO  = 1'
      'ORDER  BY PP.NOME')
    ValidateWithMask = True
    Left = 541
    Top = 210
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pIDPESSJUR'
        ParamType = ptUnknown
      end>
  end
  object qryContrib: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT C.IDCONTRIBUICAO, C.NOME'
      '  FROM CONTRIBUICAO C'
      'ORDER BY C.NOME   ')
    ValidateWithMask = True
    Left = 653
    Top = 178
  end
  object qryArqRetorno: TwwQuery
    AutoCalcFields = False
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '#39'N'#39' SELECIONA,'
      '       R.NUMRECEBIMENTO,'
      '       DE.MATRICULA,'
      '       DE.NOME,'
      '       H.MESCOBRANCA,'
      '       H.MESREFERENCIA,'
      '       H.VALORESPERADO, /*Alteradores,*/ /*Total Esperado,*/'
      
        '       NVL((SELECT SUM(DECODE(HA.FLGTIPO, '#39'A'#39', HA.VALOR, -HA.VAL' +
        'OR)) ALTERADOR'
      '             FROM HSTATRASOCONTRIB HA'
      '            WHERE HA.NUMRECEBIMENTO = H.NUMRECEBIMENTO'
      '              AND HA.MESREFERENCIA = H.MESREFERENCIA'
      '              AND HA.MESCOBRANCA = H.MESCOBRANCA'
      '              AND HA.IDMOTIVO = H.IDMOTIVO),'
      '           0) ALTERADORES,'
      '       H.VALORESPERADO +'
      
        '       NVL((SELECT SUM(DECODE(HA.FLGTIPO, '#39'A'#39', HA.VALOR, -HA.VAL' +
        'OR)) ALTERADOR'
      '             FROM HSTATRASOCONTRIB HA'
      '            WHERE HA.NUMRECEBIMENTO = H.NUMRECEBIMENTO'
      '              AND HA.MESREFERENCIA = H.MESREFERENCIA'
      '              AND HA.MESCOBRANCA = H.MESCOBRANCA'
      '              AND HA.IDMOTIVO = H.IDMOTIVO),'
      '           0) VALOR_TOTAL,'
      '       C.NOME AS CONTRIBUICAO,'
      '       DECODE(H.FLGDEVOLUCAO, 0, '#39'Enviada e não recebida'#39','
      
        '                                 '#39'Enviada e não efetivamente pag' +
        'a'#39') AS SITRECEBIMENTO,'
      '       PATRO.NOME AS PATRONOME,'
      '       H.IDPLANOPREV,'
      '       PLANO.NOME AS PLANONOME,'
      '       H.IDPESSJUR,'
      '       R.OBSERVACOES,'
      '       H.FLGDEVOLUCAO'
      '  FROM RETORNOHSTCONTRIBPATRO R'
      '  JOIN HSTCONTRIBPREV H'
      '    ON H.NUMRECEBIMENTO = R.NUMRECEBIMENTO'
      '  JOIN (SELECT P.NOME, D.IDTITULAR, D.IDPESSOA, D.MATRICULA'
      '          FROM DEPENTIT D'
      '          JOIN PESSOA P ON P.IDPESSOA = D.IDPESSOA) DE'
      '    ON DE.IDTITULAR = H.IDTITULAR'
      '   AND DE.IDPESSOA = H.IDPESSOA'
      '  JOIN CONTRIBUICAO C'
      '    ON C.IDCONTRIBUICAO = H.IDCONTRIBUICAO'
      '  JOIN (SELECT P.IDPESSOA, P.NOME'
      '          FROM PESSOA P, PATRO PT'
      '         WHERE PT.IDPESSOA = P.IDPESSOA'
      '           AND PT.IDFUNDACAO = 1) PATRO'
      '    ON H.IDPESSJUR = PATRO.IDPESSOA'
      '  JOIN PLANPREV PLANO'
      '    ON H.IDPLANOPREV = PLANO.IDPLANOPREV'
      ' WHERE H.SITRECEBIMENTO = 1'
      '   AND H.MESCOBRANCA = :MESCOBRANÇA'
      '   AND H.IDCONTRIBUICAO IN (:IDCONTRIBUIÇÃO)'
      '   AND H.IDPESSJUR = :IDPESSJUR'
      ''
      ' '
      ' '
      ' ')
    ControlType.Strings = (
      'SELECIONA;CheckBox;S;N')
    ValidateWithMask = True
    Left = 757
    Top = 354
    ParamData = <
      item
        DataType = ftString
        Name = 'MESCOBRANÇA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDCONTRIBUIÇÃO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end>
  end
  object dsArqRetorno: TDataSource
    DataSet = cdsArqRetorno
    Left = 757
    Top = 378
  end
  object msIncluiContrib: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'D.MATRICULA'
      'P.NOME'
      'H.NUMRECEBIMENTO'
      'H.VALORESPERADO'
      'C.NOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'N'
      'C')
    Descricao.Strings = (
      'Matrícula'
      'Nome'
      'NumRecebimento'
      'Valor Esperado'
      'Contribuição')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'HSTCONTRIBPREV H'
      'DEPENTIT D'
      'PESSOA P'
      'CONTRIBUICAO C')
    CamposChave.Strings = (
      'H.NUMRECEBIMENTO'
      'D.IDTITULAR'
      'D.IDPESSOA')
    Filtro.Strings = (
      'D.IDTITULAR = H.IDTITULAR'
      'D.IDPESSOA = H.IDPESSOA '
      'P.IDPESSOA = D.IDPESSOA'
      'C.IDCONTRIBUICAO = H.IDCONTRIBUICAO')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '15'
      '60'
      '20'
      '10'
      '10')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    ApenasLetraENum.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    ComparaMaiuscula.Strings = (
      'S'
      'N'
      'N'
      ''
      '')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    BeforeOpenCds = msIncluiContribBeforeOpenCds
    LookupSQL.Strings = (
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
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      ''
      '')
    Left = 768
    Top = 40
  end
  object cdsArqRetorno: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'ascNUMRECEBIMENTO'
        Fields = 'NUMRECEBIMENTO'
      end
      item
        Name = 'descNUMRECEBIMENTO'
        Fields = 'NUMRECEBIMENTO'
        Options = [ixDescending]
      end
      item
        Name = 'ascMATRICULA'
        Fields = 'MATRICULA'
      end
      item
        Name = 'descMATRICULA'
        Fields = 'MATRICULA'
        Options = [ixDescending]
      end
      item
        Name = 'ascNOME'
        Fields = 'NOME'
      end
      item
        Name = 'descNOME'
        Fields = 'NOME'
        Options = [ixDescending]
      end
      item
        Name = 'ascMESREFERENCIA'
        Fields = 'MESREFERENCIA'
      end
      item
        Name = 'descMESREFERENCIA'
        Fields = 'MESREFERENCIA'
        Options = [ixDescending]
      end>
    Params = <>
    ProviderName = 'dspArqRetorno'
    StoreDefs = True
    AfterOpen = cdsArqRetornoAfterOpen
    Left = 757
    Top = 274
  end
  object sqlArqRetorno: TCMSqlParams
    SQL.Strings = (
      'SELECT '#39'N'#39' SELECIONA,'
      '       R.NUMRECEBIMENTO,'
      '       DE.MATRICULA,'
      '       DE.NOME,'
      '       H.MESCOBRANCA,'
      '       H.MESREFERENCIA,'
      '       H.VALORESPERADO, /*Alteradores,*/ /*Total Esperado,*/'
      
        '       NVL((SELECT SUM(DECODE(HA.FLGTIPO, '#39'A'#39', HA.VALOR, -HA.VAL' +
        'OR)) ALTERADOR'
      '             FROM HSTATRASOCONTRIB HA'
      '            WHERE HA.NUMRECEBIMENTO = H.NUMRECEBIMENTO'
      '              AND HA.MESREFERENCIA = H.MESREFERENCIA'
      '              AND HA.MESCOBRANCA = H.MESCOBRANCA'
      '              AND HA.IDMOTIVO = H.IDMOTIVO),'
      '           0) ALTERADORES,'
      '       H.VALORESPERADO +'
      
        '       NVL((SELECT SUM(DECODE(HA.FLGTIPO, '#39'A'#39', HA.VALOR, -HA.VAL' +
        'OR)) ALTERADOR'
      '             FROM HSTATRASOCONTRIB HA'
      '            WHERE HA.NUMRECEBIMENTO = H.NUMRECEBIMENTO'
      '              AND HA.MESREFERENCIA = H.MESREFERENCIA'
      '              AND HA.MESCOBRANCA = H.MESCOBRANCA'
      '              AND HA.IDMOTIVO = H.IDMOTIVO),'
      '           0) VALOR_TOTAL,'
      '       C.NOME AS CONTRIBUICAO,'
      '       DECODE(H.FLGDEVOLUCAO, 0, '#39'Enviada e não recebida'#39','
      
        '                                 '#39'Enviada e não efetivamente pag' +
        'a'#39') AS SITRECEBIMENTO,'
      '       PATRO.NOME AS PATRONOME,'
      '       H.IDPLANOPREV,'
      '       PLANO.NOME AS PLANONOME,'
      '       H.IDPESSJUR,'
      '       R.OBSERVACOES,'
      '       H.FLGDEVOLUCAO'
      '  FROM RETORNOHSTCONTRIBPATRO R'
      '  JOIN HSTCONTRIBPREV H'
      '    ON H.NUMRECEBIMENTO = R.NUMRECEBIMENTO'
      '  JOIN (SELECT P.NOME, D.IDTITULAR, D.IDPESSOA, D.MATRICULA'
      '          FROM DEPENTIT D'
      '          JOIN PESSOA P ON P.IDPESSOA = D.IDPESSOA) DE'
      '    ON DE.IDTITULAR = H.IDTITULAR'
      '   AND DE.IDPESSOA = H.IDPESSOA'
      '  JOIN CONTRIBUICAO C'
      '    ON C.IDCONTRIBUICAO = H.IDCONTRIBUICAO'
      '  JOIN (SELECT P.IDPESSOA, P.NOME'
      '          FROM PESSOA P, PATRO PT'
      '         WHERE PT.IDPESSOA = P.IDPESSOA'
      '           AND PT.IDFUNDACAO = 1) PATRO'
      '    ON H.IDPESSJUR = PATRO.IDPESSOA'
      '  JOIN PLANPREV PLANO'
      '    ON H.IDPLANOPREV = PLANO.IDPLANOPREV'
      ' WHERE H.SITRECEBIMENTO = 1'
      '   AND H.MESCOBRANCA = :MESCOBRANÇA'
      '   AND H.IDCONTRIBUICAO IN (:IDCONTRIBUIÇÃO)'
      '   AND H.IDPESSJUR = :IDPESSJUR'
      ' ')
    ClientDataSet = cdsArqRetorno
    Left = 760
    Top = 216
  end
  object dspArqRetorno: TDataSetProvider
    DataSet = qryArqRetorno
    Constraints = True
    Left = 757
    Top = 298
  end
  object qryUpdArqRet: TwwQuery
    AutoCalcFields = False
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '#39'N'#39' SELECIONA,'
      '       R.NUMRECEBIMENTO,'
      '       DE.MATRICULA,'
      '       DE.NOME,'
      '       H.MESCOBRANCA,'
      '       H.MESREFERENCIA,'
      '       H.VALORESPERADO, /*Alteradores,*/ /*Total Esperado,*/'
      
        '       NVL((SELECT SUM(DECODE(HA.FLGTIPO, '#39'A'#39', HA.VALOR, -HA.VAL' +
        'OR)) ALTERADOR'
      '             FROM HSTATRASOCONTRIB HA'
      '            WHERE HA.NUMRECEBIMENTO = H.NUMRECEBIMENTO'
      '              AND HA.MESREFERENCIA = H.MESREFERENCIA'
      '              AND HA.MESCOBRANCA = H.MESCOBRANCA'
      '              AND HA.IDMOTIVO = H.IDMOTIVO),'
      '           0) ALTERADORES,'
      '       H.VALORESPERADO +'
      
        '       NVL((SELECT SUM(DECODE(HA.FLGTIPO, '#39'A'#39', HA.VALOR, -HA.VAL' +
        'OR)) ALTERADOR'
      '             FROM HSTATRASOCONTRIB HA'
      '            WHERE HA.NUMRECEBIMENTO = H.NUMRECEBIMENTO'
      '              AND HA.MESREFERENCIA = H.MESREFERENCIA'
      '              AND HA.MESCOBRANCA = H.MESCOBRANCA'
      '              AND HA.IDMOTIVO = H.IDMOTIVO),'
      '           0) VALOR_TOTAL,'
      '       C.NOME AS CONTRIBUICAO,'
      '       DECODE(H.FLGDEVOLUCAO, 0, '#39'Enviada e não recebida'#39','
      
        '                                 '#39'Enviada e não efetivamente pag' +
        'a'#39') AS SITRECEBIMENTO,'
      '       PATRO.NOME AS PATRONOME,'
      '       H.IDPLANOPREV,'
      '       PLANO.NOME AS PLANONOME,'
      '       H.IDPESSJUR,'
      '       R.OBSERVACOES'
      '  FROM RETORNOHSTCONTRIBPATRO R'
      '  JOIN HSTCONTRIBPREV H'
      '    ON H.NUMRECEBIMENTO = R.NUMRECEBIMENTO'
      '  JOIN (SELECT P.NOME, D.IDTITULAR, D.IDPESSOA, D.MATRICULA'
      '          FROM DEPENTIT D'
      '          JOIN PESSOA P ON P.IDPESSOA = D.IDPESSOA) DE'
      '    ON DE.IDTITULAR = H.IDTITULAR'
      '   AND DE.IDPESSOA = H.IDPESSOA'
      '  JOIN CONTRIBUICAO C'
      '    ON C.IDCONTRIBUICAO = H.IDCONTRIBUICAO'
      '  JOIN (SELECT P.IDPESSOA, P.NOME'
      '          FROM PESSOA P, PATRO PT'
      '         WHERE PT.IDPESSOA = P.IDPESSOA'
      '           AND PT.IDFUNDACAO = 1) PATRO'
      '    ON H.IDPESSJUR = PATRO.IDPESSOA'
      '  JOIN PLANPREV PLANO'
      '    ON H.IDPLANOPREV = PLANO.IDPLANOPREV'
      ' WHERE H.SITRECEBIMENTO = 1'
      '   AND H.MESCOBRANCA = :MESCOBRANÇA'
      '   AND H.IDCONTRIBUICAO IN (:IDCONTRIBUIÇÃO)'
      '   AND H.IDPESSJUR = :IDPESSJUR'
      ''
      ' '
      ' ')
    ControlType.Strings = (
      'SELECIONA;CheckBox;S;N')
    ValidateWithMask = True
    Left = 653
    Top = 378
    ParamData = <
      item
        DataType = ftString
        Name = 'MESCOBRANÇA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDCONTRIBUIÇÃO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end>
  end
  object rpArqRetorno: TppReport
    AutoStop = False
    DataPipeline = ppArqRetorno
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Arquivo de Retorno da Patrocinadora'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 4500
    PrinterSetup.mmMarginLeft = 4500
    PrinterSetup.mmMarginRight = 4500
    PrinterSetup.mmMarginTop = 4500
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Units = utMillimeters
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    PreviewFormSettings.WindowState = wsMaximized
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 432
    Top = 88
    Version = '7.04'
    mmColumnWidth = 0
    DataPipelineName = 'ppArqRetorno'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 28310
      mmPrintPosition = 0
      object ppImage2: TppImage
        UserName = 'Image2'
        DirectDraw = True
        MaintainAspectRatio = False
        Stretch = True
        Picture.Data = {
          07544269746D6170D6A90000424DD6A90000000000003604000028000000C800
          0000D40000000100080000000000A0A50000232E0000232E0000000100000000
          00006A4F4D006B504E006B514F006C514F006D5351006D5250006F5453006F55
          53006E5452006F555400705654007157550072585600735A5800745B5900745B
          5A00765D5B00775E5D00765D5C00785F5E0079615F0078605E007B6361007A62
          60007B6462007C6463007E6765007E6665007D6564007F6866002DA0D5002FA0
          D50030A1D50034A3D60036A4D6003AA5D70039A5D7003CA6D7003EA7D80041A9
          D80041A8D80043A9D90047ABDA004AADDA004DAEDB004FAFDB0057B3DD0055B2
          DC0053B0DC005DB5DE005EB6DE005FB6DF0058B3DD0060B7DF0064B8DF0062B8
          DF0066B9E00069BBE0006BBCE1006DBCE1006EBDE10072BFE20077C1E30074C0
          E3007EC4E5007AC3E40080696700826B6900836C6A00836D6B00826C6A00846E
          6D0086706E0085706E0087716F0088727100897473008B7674008A7574008C77
          76008C7876008D7877008F7B79008D797700927E7D00907C7A0093807F009480
          7F0095828100978583009987850098868400998685009B8887009C8B89009E8C
          8B009F8E8D00A08F8E00A1908F00A2929100A5959300A4949300A7979500A493
          9200A8989700A9999800AA9B9A00A99A9900AB9C9B00AD9E9D00AEA09F00AEA0
          9E00AFA1A000B0A2A100B2A4A300B3A5A400B4A6A500B4A7A600B5A7A600B5A8
          A700B6A9A800B7AAA900B7ABAA00B8ABAA00B9ACAB00BAAEAD00BCB0AF00BEB2
          B100BFB4B30081C5E50084C7E50086C8E6008BCAE70089C9E7008ECBE70096CF
          E90097CFE90095CEE9009AD1EA009ED3EB00A1D4EC00A6D6EC00A9D7ED00AEDA
          EE00ADD9EE00AAD8ED00B2DBEF00B6DEF000B9DFF000C2B7B700C2B7B600C1B5
          B500C3B8B700C3B9B800C5BAB900C5BBBA00C6BBBB00C4B9B900C6BCBB00C8BE
          BD00C8BEBE00CBC2C100CBC2C200CCC3C200CCC3C300CFC6C500CFC7C600CFC6
          C600CDC4C300D0C8C700D1C9C800D2CACA00D3CBCA00D2CAC900D4CDCC00D4CC
          CC00D5CECD00D6CFCF00D7D0D000D8D1D100DAD3D300D9D3D200DCD6D500DBD5
          D500DED8D700DFD9D900DFDAD900C6E5F300CCE7F400CEE8F400D2EAF500D7EC
          F600D4EBF500DBEEF700DBEFF700D9EDF700DDEFF800DEF0F800E0DBDA00E1DC
          DB00E2DDDD00E4E0DF00E7E3E200E6E2E200E6E1E100E8E4E300E9E4E400EAE6
          E600EBE7E700E9E6E500EBE8E800ECE8E800EEEBEB00EFECEC00E6F3F900E7F4
          FA00E7F4F900E3F2F800EAF5FA00EDF7FB00EDF6FB00EEF7FB00F0EDED00F1EF
          EE00F2EFEF00F2F0F000F3F1F100F4F2F200F6F5F500F7F6F500F7F6F600F5F4
          F400F3F9FC00F1F8FC00F5FAFC00F6FBFD00F4F9FC00F9F7F700F8F7F700F9F8
          F800FAF9F900FBFAFA00F8FBFD00F9FCFD00F8FCFD00FBFDFE00FCFBFB00FCFC
          FC00FDFCFC00FDFDFD00FDFEFE00FEFDFD00FEFEFE00FFFFFF00FCFDFE00FCFC
          FB00FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFCE1B097726A666C7499B4E6FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDF8C99F786C686C779FCCFBFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFD564444444444444444A4FDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDE37E4B0200000000000000000004559EEFFDFDFDFDFDFD
          FDFDFDFD524444444444444449F6FDFDFDFDFDFDFDFD6C4444444444444444B6
          FDFDFDFDFDFDFDFDFDFCC665100000000000000000001671D5FDFDFDFDFDFDFD
          FDFDEF4644444444444444444444444444444444444444444444A5FDFDFDEE44
          4444444444444444C9FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD1A000000000000000095FDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF87D0D0000000000000000000000000000
          0018A5FDFDFDFDFDFDFDFDFD140000000000000004F6FDFDFDFDFDFDFDB20000
          00000000000000AEFDFDFDFDFDFDFDFDD15B0000000000000000000000000000
          0A7CF9FDFDFDFDFDFDFDED000000000000000000000000000000000000000000
          00009AFDFDFDE5000000000000000000BAFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD1A0000000000
          00000095FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDE6540000000000000000
          00000000000000000000006EFCFDFDFDFDFDFDFD140000000000000004F6FDFD
          FDFDFDFDEE1C000000000000000000AEFDFDFDFDFDFDFC9E0A00000000000000
          0000000000000000000059E6FDFDFDFDFDFDED00000000000000000000000000
          000000000000000000009AFDFDFDE5000000000000000000BAFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFD1A000000000000000095FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF95800
          00000000000000000000000000000000000000007CFDFDFDFDFDFDFD14000000
          0000000004F6FDFDFDFDFDFD6C00000000000000000000AEFDFDFDFDFDFD7D01
          0000000000000000000000000000000000000054F1FDFDFDFDFDED0000000000
          0000000000000000000000000000000000009AFDFDFDE5000000000000000000
          BAFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFD1A000000000000000095FDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFD980000000000000000000000000000000000000000000005CCFDFD
          FDFDFDFD140000000000000004F6FDFDFDFDFDB80200000000000000000000AE
          FDFDFDFDFDA3000000000000000000000000000000000000000000006CFDFDFD
          FDFDED00000000000000000000000000000000000000000000009AFDFDFDE500
          0000000000000000BAFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD1A000000000000000095FDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDF617000000000000000000000000000000000000
          00000000005EFDFDFDFDFDFD140000000000000004F6FDFDFDFDF14500000000
          00000000000000AEFDFDFDFDD40C000000000000000000000000000000000000
          0000000001C6FDFDFDFDED000000000000000000000000000000000000000000
          00009AFDFDFDE5000000000000000000BAFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD1A0000000000
          00000095FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDAC0000000000000000000258
          747C704C00000000000000000004E3FDFDFDFDFD140000000000000004F6FDFD
          FDFD74000000000000000000000000AEFDFDFDFD60000000000000000000085F
          809F7B4800000000000000000057FDFDFDFDED0000000000000000001D484848
          48484848484848484848A9FDFDFDE5000000000000000000BAFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFD1A000000000000000095FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD66000000
          000000000004B1FDFDFDFDFC7C000000000000000000A1FDFDFDFDFD14000000
          0000000004F6FDFDFDC904000000000000000000000000AEFDFDFDD202000000
          000000000042CDFDFDFDFDF970000000000000000001CFFDFDFDED0000000000
          00000000B6FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDE5000000000000000000
          BAFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFD1A000000000000000095FDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFD4B000000000000000066FDFDFDFDFDFDFB4600000000000000006CFD
          FDFDFDFD140000000000000004F6FDFDF74C00000000000000000000000000AE
          FDFDFD78000000000000000008CDFDFDFDFDFDFDFC4D00000000000000007EFD
          FDFDED000000000000000000B6FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDE500
          0000000000000000BAFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD1A000000000000000095FDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFC0C0000000000000000A9FDFDFDFDFDFDFD6D0000
          00000000000057FDFDFDFDFD140000000000000004F7FDFD7D00000000000000
          00000000000000AEFDFDFD4E000000000000000065FDFDFDFDFDFDFDFDA80000
          0000000000005BFDFDFDED000000000000000000B6FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDE5000000000000000000BAFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD1A0000000000
          00000005070707070707070707A4FDFDFDFDFDE4000000000000000000C8FDFD
          FDFDFDFDFD97000000000000000047FDFDFDFDFD14000000000000000DFCFDD1
          070000000000000000000000000000AEFDFDF0040000000000000000AEFDFDFD
          FDFDFDFDFDE300000000000000001BFDFDFDED000000000000000000B6FDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDE50000000000000000000807070707070707
          0707CEFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFD1A000000000000000000000000000000000000A1FDFDFDFDFDDE00000000
          0000000000CBFDFDFDFDFDFDFD9A000000000000000019FDFDFDFDFD14000000
          0000000014FDFB55000000000000000000000000000000AEFDFDCB0000000000
          00000000E1FDFDFDFDFDFDFDFDFCCFCFCFCFCFCFCFCFD0FCFDFDED0000000000
          000000000C0E0E0E0E0E0E0E0E0E0E58FDFDFDFDFDFDE5000000000000000000
          00000000000000000000CDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFD1A000000000000000000000000000000000000A1FDFD
          FDFDFDD4000000000000000000CAFDFDFDFDFDFDFD9C000000000000000016FD
          FDFDFDFD140000000000000042FD9800000000000000000000000000000000AE
          FDFDB000000000000000000AF9FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDED000000000000000000000000000000000000000051FDFDFDFDFDFDE500
          000000000000000000000000000000000000CDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD1A00000000000000000000000000
          0000000000A1FDFDFDFDFDD4000000000000000000CAFDFDFDFDFDFDFD9C0000
          00000000000016FDFDFDFDFD14000000000000004AD40C000000000000005300
          00000000000000AEFDFDA1000000000000000011FDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDED000000000000000000000000000000000000000051
          FDFDFDFDFDFDE500000000000000000000000000000000000000CDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD1A0000000000
          00000000000000000000000000A1FDFDFDFDFDD4000000000000000000CAFDFD
          FDFDFDFDFD9C000000000000000016FDFDFDFDFD140000000000000051590000
          000000000053980000000000000000AEFDFDA0000000000000000011FDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDED00000000000000000000000000
          0000000000000051FDFDFDFDFDFDE50000000000000000000000000000000000
          0000CDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFD1A000000000000000000000000000000000000A1FDFDFDFDFDD400000000
          0000000000CAFDFDFDFDFDFDFD9C000000000000000016FDFDFDFDFD14000000
          000000000B0000000000000008CA7E0000000000000000AEFDFDA60000000000
          0000000BFBFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDED0000000000
          00000000000000000000000000000051FDFDFDFDFDFDE5000000000000000000
          00000000000000000000CDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFD1A0000000000000000485A5A5A5A5A5A5A5A5AB6FDFD
          FDFDFDD4000000000000000000CAFDFDFDFDFDFDFD9C000000000000000016FD
          FDFDFDFD140000000000000000000000000000007CFD780000000000000000AE
          FDFDB8000000000000000000E2FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDED000000000000000000000000000000000000000051FDFDFDFDFDFDE500
          0000000000000000525A5A5A5A5A5A5A5A5ADEFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD1A000000000000000095FDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDD4000000000000000000CAFDFDFDFDFDFDFD9C0000
          00000000000016FDFDFDFDFD1400000000000000000000000000004AF6FD7000
          00000000000000AEFDFDE2000000000000000000B3FDFDFDFDFDFDFDFDEE6F6E
          6E6E6E6E6E6E9BFDFDFDED0000000000000000004E565656565656565656566D
          FDFDFDFDFDFDE5000000000000000000BAFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD1A0000000000
          00000095FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDD4000000000000000000CAFDFD
          FDFDFDFDFD9C000000000000000016FDFDFDFDFD140000000000000000000000
          000005C8FDFD690000000000000000AEFDFDFD1D00000000000000006DFDFDFD
          FDFDFDFDFDC7000000000000000064FDFDFDED000000000000000000B6FDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDE5000000000000000000BAFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFD1A000000000000000095FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDD400000000
          0000000000CAFDFDFDFDFDFDFD9C000000000000000016FDFDFDFDFD14000000
          0000000000000000000071FDFDFD640000000000000000AEFDFDFD6B00000000
          0000000012EEFDFDFDFDFDFDFD7900000000000000009AFDFDFDED0000000000
          00000000B6FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDE5000000000000000000
          BAFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFD1A000000000000000095FDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDD4000000000000000000CAFDFDFDFDFDFDFD9C000000000000000016FD
          FDFDFDFD1400000000000000000000000043F0FDFDFD640000000000000000AE
          FDFDFDB90000000000000000006DFDFDFDFDFDFDDE110000000000000001D4FD
          FDFDED000000000000000000B6FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDE500
          0000000000000000BAFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD1A000000000000000066A6A6A6A6
          A6A6A6A6A6A6A6AAFCFDFDD4000000000000000000CAFDFDFDFDFDFDFD9C0000
          00000000000016FDFDFDFDFD14000000000000000000000001B7FDFDFDFD6400
          00000000000000AEFDFDFDFD530000000000000000006ADFFCFDE49915000000
          000000000054FDFDFDFDED0000000000000000007AA6A6A6A6A6A6A6A6A6A6A6
          A6B2FDFDFDFDE50000000000000000007DA6A6A6A6A6A6A6A6A6A6A6B4FDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD1A0000000000
          00000000000000000000000000000007F9FDFDD4000000000000000000CAFDFD
          FDFDFDFDFD9C000000000000000016FDFDFDFDFD140000000000000000000000
          69FDFDFDFDFD640000000000000000AEFDFDFDFDC60200000000000000000003
          181B0400000000000000000000B1FDFDFDFDED00000000000000000000000000
          00000000000000000045FDFDFDFDE50000000000000000000000000000000000
          000000004DFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFD1A000000000000000000000000000000000000000007F9FDFDD400000000
          0000000000CAFDFDFDFDFDFDFD9C000000000000000016FDFDFDFDFD14000000
          0000000000000019E4FDFDFDFDFD640000000000000000AEFDFDFDFDFD710000
          000000000000000000000000000000000000000059FCFDFDFDFDED0000000000
          000000000000000000000000000000000045FDFDFDFDE5000000000000000000
          0000000000000000000000004DFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFD1A000000000000000000000000000000000000000007
          F9FDFDD4000000000000000000CAFDFDFDFDFDFDFD9C000000000000000016FD
          FDFDFDFD1400000000000000000000AEFDFDFDFDFDFD640000000000000000AE
          FDFDFDFDFDF758000000000000000000000000000000000000000013DEFDFDFD
          FDFDED0000000000000000000000000000000000000000000045FDFDFDFDE500
          00000000000000000000000000000000000000004DFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD1A00000000000000000000000000
          0000000000000007F9FDFDD4000000000000000000CAFDFDFDFDFDFDFD9C0000
          00000000000016FDFDFDFDFD1400000000000000000062FCFDFDFDFDFDFD6400
          00000000000000AEFDFDFDFDFDFDF05800000000000000000000000000000000
          00000AB9FDFDFDFDFDFDED000000000000000000000000000000000000000000
          0045FDFDFDFDE50000000000000000000000000000000000000000004DFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD1A0000000000
          00000000000000000000000000000007F9FDFDD4000000000000000000CAFDFD
          FDFDFDFDFD9C000000000000000016FDFDFDFDFD14000000000000000011E2FD
          FDFDFDFDFDFD640000000000000000AEFDFDFDFDFDFDFDF77305000000000000
          00000000000000000016B8FDFDFDFDFDFDFDED00000000000000000000000000
          00000000000000000045FDFDFDFDE50000000000000000000000000000000000
          000000004DFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFD1A000000000000000000000000000000000000000007F9FDFDD400000000
          0000000000CAFDFDFDFDFDFDFD9C000000000000000016FDFDFDFDFD14000000
          0000000000A8FDFDFDFDFDFDFDFD640000000000000000AEFDFDFDFDFDFDFDFD
          FDCB600400000000000000000000001377E6FDFDFDFDFDFDFDFDED0000000000
          000000000000000000000000000000000045FDFDFDFDE5000000000000000000
          0000000000000000000000004DFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDACA3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A5
          FCFDFDEFA3A3A3A3A3A3A3A3A3E5FDFDFDFDFDFDFDD0A3A3A3A3A3A3A3A3ABFD
          FDFDFDFDA9A3A3A3A3A3A3A3ADFCFDFDFDFDFDFDFDFDC6A3A3A3A3A3A3A3A3DF
          FDFDFDFDFDFDFDFDFDFDFDDF965A1907050911475A78B4F7FDFDFDFDFDFDFDFD
          FDFDF7A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3B0FDFDFDFDFFA4
          A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3B3FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFCF8F6F9FCFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDE8DB
          DBDBDBDBDBDBDBDDFCFCDBDBDBDBDBDBDBDBDBE8FDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFCE1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1F6FDFD
          FDEEE1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E7FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDDDDBDBDBDBDBDBDBDBE8FDF5DBDBDBDBDBDBDBDBDB
          EBFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF90700000000000000000000000000
          0000000000ABFDFDFD7400000000000000000000000000000000000050FDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E
          1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E
          1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF9070000000000
          00000000000000000000000000ABFDFDFD750000000000000000000000000000
          0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E
          1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21
          FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDF907000000000000000000000000000000000000ABFDFDFD75000000000000
          00000000000000000000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E
          1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDF907000000000000000000000000000000000000ABFDFD
          FD7500000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E
          87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF90700000000000000000000000000
          0000000000ABFDFDFD7500000000000000000000000000000000000050FDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E
          1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E
          1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF9070000000000
          00000000000000000000000000ABFDFDFD750000000000000000000000000000
          0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E
          1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21
          FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDF907000000000000000000000000000000000000ABFDFDFD75000000000000
          00000000000000000000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E
          1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDF907000000000000000000000000000000000000ABFDFD
          FD7500000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E
          87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF90700000000000000000000000000
          0000000000ABFDFDFD7500000000000000000000000000000000000050FDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E
          1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E
          1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF9070000000000
          00000000000000000000000000ABFDFDFD750000000000000000000000000000
          0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E
          1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21
          FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDF907000000000000000000000000000000000000ABFDFDFD75000000000000
          00000000000000000000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E
          1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDF907000000000000000000000000000000000000ABFDFD
          FD7500000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E
          87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF90700000000000000000000000000
          0000000000ABFDFDFD7500000000000000000000000000000000000050FDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E
          1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E
          1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF9070000000000
          00000000000000000000000000ABFDFDFD750000000000000000000000000000
          0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E
          1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21
          FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDF907000000000000000000000000000000000000ABFDFDFD75000000000000
          00000000000000000000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E
          1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDF907000000000000000000000000000000000000ABFDFD
          FD7500000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E
          87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF90700000000000000000000000000
          0000000000ABFDFDFD7500000000000000000000000000000000000050FDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E
          1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E
          1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF9070000000000
          00000000000000000000000000ABFDFDFD750000000000000000000000000000
          0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E
          1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21
          FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDF907000000000000000000000000000000000000ABFDFDFD75000000000000
          00000000000000000000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E
          1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDF907000000000000000000000000000000000000ABFDFD
          FD7500000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E
          87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF90700000000000000000000000000
          0000000000ABFDFDFD7500000000000000000000000000000000000050FDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E
          1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E
          1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF9070000000000
          00000000000000000000000000ABFDFDFD750000000000000000000000000000
          0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E
          1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21
          FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDF907000000000000000000000000000000000000ABFDFDFD75000000000000
          00000000000000000000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E
          1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDF907000000000000000000000000000000000000ABFDFD
          FD7500000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E
          87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF90700000000000000000000000000
          0000000000ABFDFDFD7500000000000000000000000000000000000050FDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E
          1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E
          1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF9070000000000
          00000000000000000000000000ABFDFDFD750000000000000000000000000000
          0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E
          1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21
          FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDF907000000000000000000000000000000000000ABFDFDFD75000000000000
          00000000000000000000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E
          1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDF907000000000000000000000000000000000000ABFDFD
          FD7500000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E
          87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF90700000000000000000000000000
          0000000000ABFDFDFD7500000000000000000000000000000000000050FDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E
          1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E
          1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF9070000000000
          00000000000000000000000000ABFDFDFD750000000000000000000000000000
          0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E
          1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21
          FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDF907000000000000000000000000000000000000ABFDFDFD75000000000000
          00000000000000000000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E
          1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDF907000000000000000000000000000000000000ABFDFD
          FD7500000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E
          87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF90700000000000000000000000000
          0000000000ABFDFDFD7500000000000000000000000000000000000050FDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E
          1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E
          1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF9070000000000
          00000000000000000000000000ABFDFDFD750000000000000000000000000000
          0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E
          1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21
          FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDF907000000000000000000000000000000000000ABFDFDFD75000000000000
          00000000000000000000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E
          1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDF907000000000000000000000000000000000000ABFDFD
          FD7500000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E
          87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF90700000000000000000000000000
          0000000000ABFDFDFD7500000000000000000000000000000000000050FDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E
          1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E
          1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF9070000000000
          00000000000000000000000000ABFDFDFD750000000000000000000000000000
          0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E
          1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21
          FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDF907000000000000000000000000000000000000ABFDFDFD75000000000000
          00000000000000000000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E
          1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDF907000000000000000000000000000000000000ABFDFD
          FD7500000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E
          87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF90700000000000000000000000000
          0000000000ABFDFDFD7500000000000000000000000000000000000050FDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E
          1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E
          1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF9070000000000
          00000000000000000000000000ABFDFDFD750000000000000000000000000000
          0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E
          1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21
          FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDF907000000000000000000000000000000000000ABFDFDFD75000000000000
          00000000000000000000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E
          1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDF907000000000000000000000000000000000000ABFDFD
          FD7500000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E
          87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF90700000000000000000000000000
          0000000000ABFDFDFD7500000000000000000000000000000000000050FDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E
          1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E
          1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF9070000000000
          00000000000000000000000000ABFDFDFD750000000000000000000000000000
          0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E
          1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21
          FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDF907000000000000000000000000000000000000ABFDFDFD75000000000000
          00000000000000000000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E
          1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDF907000000000000000000000000000000000000ABFDFD
          FD7500000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E
          87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF90700000000000000000000000000
          0000000000ABFDFDFD7500000000000000000000000000000000000050FDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E
          1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFD361E1E1E1E1E1E1E1E22FCFA221E1E1E1E1E
          1E1E1E36FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF9070000000000
          00000000000000000000000000ABFDFDFD750000000000000000000000000000
          0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFA231E1E1E1E
          1E1E1E1E35FDC41E1E1E1E1E1E1E1E1E86FDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDEA231E1E1E1E1E1E1E1E2D
          FCFC2D1E1E1E1E1E1E1E1E23EAFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDF907000000000000000000000000000000000000ABFDFDFD75000000000000
          00000000000000000000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDC01E1E1E1E1E1E1E1E1E41FDEC1F1E1E1E1E1E1E1E1E2EFCFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFC851E1E
          1E1E1E1E1E1E1E82FDFD821E1E1E1E1E1E1E1E1E85FCFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDF907000000000000000000000000000000000000ABFDFD
          FD7500000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDF5351E1E1E1E1E1E1E1E1E8FFDFC341E1E1E1E1E1E1E1E
          1E92FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDEB841E1E1E1E1E1E1E1E1E1EBEFDFDC01E1E1E1E1E1E1E1E1E1E84EBFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF90700000000000000000000000000
          0000000000ABFDFDFD7500000000000000000000000000000000000050FDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDDA391E1E1E1E1E1E1E1E1E24E8FDFD8E
          1E1E1E1E1E1E1E1E1E208DFEFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFC413E3E3E3E3E
          3E3E3E3E3E3E3E3E3E3E3C251E1E1E1E1E1E1E1E1E1E3BFCFDFDFC3B1E1E1E1E
          1E1E1E1E1E1E253B3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E41FDF9070000000000
          00000000000000000000000000ABFDFDFD750000000000000000000000000000
          0000000050FDD83E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E38211E1E1E1E1E1E1E
          1E1E1E8AFDFDFDF22B1E1E1E1E1E1E1E1E1E1E2A3D3E3E3E3E3E3E3E3E3E3E3E
          3E3E3E3E88FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFC211E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E26D7FD
          FDFDFDD6261E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E21
          FDF907000000000000000000000000000000000000ABFDFDFD75000000000000
          00000000000000000000000050FDC21E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E
          1E1E1E1E1E1E1E1E1E1E2EF3FDFDFDFDBC201E1E1E1E1E1E1E1E1E1E1E1E1E1E
          1E1E1E1E1E1E1E1E1E1E1E1E32FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFC211E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E
          1E1E1E1E22BDFDFDFDFDFDFDBD221E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E
          1E1E1E1E1E1E1E21FDF907000000000000000000000000000000000000ABFDFD
          FD7500000000000000000000000000000000000050FDC21E1E1E1E1E1E1E1E1E
          1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E2AD7FDFDFDFDFDFD901F1E1E1E1E1E
          1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E32FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFC211E1E1E1E1E1E1E1E1E1E1E1E1E
          1E1E1E1E1E1E1E1E1E1E1E29BEFDFDFDFDFDFDFDFDBE291E1E1E1E1E1E1E1E1E
          1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E21FDF90700000000000000000000000000
          0000000000ABFDFDFD7500000000000000000000000000000000000050FDC21E
          1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E2ED7FDFDFDFDFDFD
          FDFD93211E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E32FDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFC211E1E1E1E1E
          1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E2040DDFDFDFDFDFDFDFDFDFDFDDB40
          201E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E21FDF9070000000000
          00000000000000000000000000ABFDFDFD750000000000000000000000000000
          0000000050FDC21E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E2487
          F3FDFDFDFDFDFDFDFDFDFDC4391E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E
          1E1E1E1E32FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFC3731313131313131313131313131313131313131353D8CD6FDFDFDFDFDFD
          FDFDFDFDFDFDFDFDD68C3D333131313131313131313131313131313131313136
          FDF907000000000000000000000000000000000000ABFDFDFD75000000000000
          00000000000000000000000050FDD93131313131313131313131313131313131
          31313135418FE9FDFDFDFDFDFDFDFDFDFDFDFDFDFCC3873A3231313131313131
          31313131313131313131313182FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDF907000000000000000000000000000000000000ABFDFD
          FD7500000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF90700000000000000000000000000
          0000000000ABFDFDFD7500000000000000000000000000000000000050FDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF9070000000000
          00000000000000000000000000ABFDFDFD750000000000000000000000000000
          0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDF907000000000000000000000000000000000000ABFDFDFD75000000000000
          00000000000000000000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDF907000000000000000000000000000000000000ABFDFD
          FD7500000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDC4842F23232F84C5FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF90700000000000000000000000000
          0000000000ABFDFDFD7500000000000000000000000000000000000050FDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDBC402C222631
          8ADCFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF3851F1E1E1E1E1E1E1F84F3FD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF9070000000000
          00000000000000000000000000ABFDFDFD750000000000000000000000000000
          0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          DB3A1E1E1E1E1E1E1E248EFCFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF3381E1E1E1E
          1E1E1E1E1E1E38F4FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDF907000000000000000000000000000000000000ABFDFDFD75000000000000
          00000000000000000000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDDA2B1E1E1E1E1E1E1E1E1E1E84FCFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFD831E1E1E1E1E1E1E1E1E1E1E1E82FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDF907000000000000000000000000000000000000ABFDFD
          FD7500000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFE311E1E1E1E1E1E1E1E1E1E1E1E8FFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDBF1E1E1E1E1E1E1E1E1E1E1E1E1E1EBFFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF90700000000000000000000000000
          0000000000ABFDFDFD7500000000000000000000000000000000000050FDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD8F1E1E1E1E1E1E1E1E1E
          1E1E1E1E25E8FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD811E1E1E1E1E1E1E1E1E1E1E1E1E1E
          81FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF9070000000000
          00000000000000000000000000ABFDFDFD750000000000000000000000000000
          0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFC2F1E
          1E1E1E1E1E1E1E1E1E1E1E1E1E91FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFC2A1E1E1E1E1E1E
          1E1E1E1E1E1E1E1E2AFCFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDF907000000000000000000000000000000000000ABFDFDFD75000000000000
          00000000000000000000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDDC1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E3DFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          F2201E1E1E1E1E1E1E1E1E1E1E1E1E1E20F3FDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDF907000000000000000000000000000000000000ABFDFD
          FD7500000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDBE1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E2FFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDEB1F1E1E1E1E1E1E1E1E1E1E1E1E1E1E1EEBFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF90700000000000000000000000000
          0000000000ABFDFDFD7500000000000000000000000000000000000050FDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDBD1E1E1E1E1E1E1E1E1E1E
          1E1E1E1E1E30FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFC281E1E1E1E1E1E1E1E1E1E1E1E1E1E
          28FCFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF9070000000000
          00000000000000000000000000ABFDFDFD750000000000000000000000000000
          0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDD71E1E
          1E1E1E1E1E1E1E1E1E1E1E1E1E39FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3F1E1E1E1E1E1E
          1E1E1E1E1E1E1E1E3FFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDF907000000000000000000000000000000000000ABFDFDFD75000000000000
          00000000000000000000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFC2B1E1E1E1E1E1E1E1E1E1E1E1E1E1E8BFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDBB1E1E1E1E1E1E1E1E1E1E1E1E1E1EBBFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDF907000000000000000000000000000000000000ABFDFD
          FD7500000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFD8A1E1E1E1E1E1E1E1E1E1E1E1E1E21DAFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFC391E1E1E1E1E1E1E1E1E1E1E1E3AFCFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF90700000000000000000000000000
          0000000000ABFDFDFD7500000000000000000000000000000000000050FDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDEA2A1E1E1E1E1E1E1E1E
          1E1E1E1E89FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDDC2C1E1E1E1E1E1E1E1E1E1E2CDC
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF9070000000000
          00000000000000000000000000ABFDFDFD750000000000000000000000000000
          0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDBF
          231E1E1E1E1E1E1E1E1E1E39F5FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDDC361E1E1E
          1E1E1E1E1E36DCFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDF907000000000000000000000000000000000000ABFDFDFD75000000000000
          00000000000000000000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDC32C1E1E1E1E1E1E1E1E81F2FDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFA9436211E1E213894FAFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDF907000000000000000000000000000000000000ABFDFD
          FD7500000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF48D2E1F1E1E233DBDFCFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF3D7D7F3FDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF90700000000000000000000000000
          0000000000ABFDFDFD7500000000000000000000000000000000000050FDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFCEAD6DAFE
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF9070000000000
          00000000000000000000000000ABFDFDFD750000000000000000000000000000
          0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDF907000000000000000000000000000000000000ABFDFDFD75000000000000
          00000000000000000000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDF907000000000000000000000000000000000000ABFDFD
          FD7500000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF90700000000000000000000000000
          0000000000ABFDFDFD7500000000000000000000000000000000000050FDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF9070000000000
          00000000000000000000000000ABFDFDFD750000000000000000000000000000
          0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDF907000000000000000000000000000000000000ABFDFDFD75000000000000
          00000000000000000000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDF907000000000000000000000000000000000000ABFDFD
          FD7700000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDE60000000000000000000000000000
          0000000000B1FDFDFD7B00000000000000000000000000000000000043FCFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDB3000000000000
          00000000000000000000000000C9FDFDFD9E0000000000000000000000000000
          0000000003E3FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FD6500000000000000000000000000000000000005EFFDFDFDB9000000000000
          0000000000000000000000000096FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDCD040000000000000000000000000000000000004CFDFDFD
          FDF00700000000000000000000000000000000000018EEFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF14D000000000000000000000000000000
          0000000074FDFDFDFDFD580000000000000000000000000000000000000066FC
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF15E0000000000000000
          000000000000000000000001CEFDFDFDFDFDA100000000000000000000000000
          0000000000000079FCFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDD35200
          0000000000000000000000000000000000000056FDFDFDFDFDFDF11500000000
          0000000000000000000000000000000063E4FDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDF7C76A0A000000000000000000000000000000000000000000B7FDFDFDFD
          FDFDFD7F0000000000000000000000000000000000000000001179D1F9FDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFC1C14141414141414141414141414
          1414141414141414141414141414141414141414141414141414141414141414
          1414141414141414141509000000000000000000000000000000000000000000
          00005DFDFDFDFDFDFDFDFDF14200000000000000000000000000000000000000
          000000000C151414141414141414141414141414141414141414141414141414
          141414141414141414141414141414141414141414141414141414145BFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFC060000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000DD5FDFDFDFDFDFDFDFDFDB40100000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFC060000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000A5FDFDFDFDFDFDFDFDFDFDFD710000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFC06000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000073FDFDFDFDFDFDFD
          FDFDFDFDFDF85800000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFC0600000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000064
          FCFDFDFDFDFDFDFDFDFDFDFDFDFDEE5100000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000050FDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFC060000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000069F9FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDE45400000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFC060000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000037EFCFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          F164000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFC06000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000001DB6FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFCA00E0000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFC0600000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000B76EFFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDDF670500000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000050FDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFC060000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000000000001C
          78E2FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDCF6A0F
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFC441A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A
          1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A
          1A1A424C5E7DC7FBFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDF1B373594A1D1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A
          1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A
          1A1A1A1A1A1A1A1A1A1A1A1A5EFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDE7B3967671799BB8F0FDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDEF9D5203000000000000000A5CAAF8FD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF6801200000000000000
          00000000000043AAFCFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDD04E00
          000000000000000000000000000000005FE7FDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDB40F0000000000000000000000000000000000000046D3FDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDB40700000000000000000000000000000000000000
          000017D2FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDCD0E000000000000000000000000
          000000000000000000000043E6FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF1480000000000
          000000000000000000000000000000000000000061FCFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FD7C000000000000000000000000000000000000000000000000000000B1FDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDE30D00000000000000000000000000000000000000000000
          00000000004BFCFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD7D000000000000000000000000000000
          0000000000000000000000000000B5FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFC4700000000000000
          0000000000000000000000000000000000000000000063FDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDD3
          00000000000000000000000000000000000000000000000000000000000011F9
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDA1000000000000000000000000000000000000000000000000
          00000000000000D1FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFD7300000000000000000000000000000000
          000000000000000000000000000000AAFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD650000000000000000
          000000000000000000000000000000000000000000000095FDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD60
          000000000000000000000000000000000000000000000000000000000000007F
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFD67000000000000000000000000000000000000000000000000
          0000000000000096FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFD7100000000000000000000000000000000
          000000000000000000000000000000A9FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDA00000000000000000
          0000000000000000000000000000000000000000000000CBFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDCE
          0000000000000000000000000000000000000000000000000000000000000EF8
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFC420000000000000000000000000000000000000000000000
          0000000000005FFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD77000000000000000000000000000000
          0000000000000000000000000000AFFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDE009000000000000
          00000000000000000000000000000000000000000046F9FDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FD72000000000000000000000000000000000000000000000000000000A9FDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDEE42000000000000000000000000000000000000000000
          000000005BFCFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDC707000000000000000000000000
          00000000000000000000001CE2FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDA703000000
          0000000000000000000000000000000000000ECBFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDA7070000000000000000000000000000000000000014C8FDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDC7420000000000000000000000000000000000
          55DEFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDED720A00000000000000
          0000000000001598F9FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          E079430000000000000000014F98EFFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFCD3A27569656A7BAAE0FCFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFD}
        mmHeight = 17000
        mmLeft = 1058
        mmTop = 1058
        mmWidth = 14000
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        AutoSize = False
        Caption = 'FUNDAÇÃO DOS ECONOMIÁRIOS FEDERAIS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 6085
        mmLeft = 0
        mmTop = 1058
        mmWidth = 201084
        BandType = 0
      end
      object ppLabel28: TppLabel
        UserName = 'Label28'
        AutoSize = False
        Caption = 
          'SCN, Quadra 2, Bloco A Edifício Corporate Financial Center 12 e ' +
          '13 Andares'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 0
        mmTop = 6879
        mmWidth = 201084
        BandType = 0
      end
      object ppLabel37: TppLabel
        UserName = 'Label37'
        AutoSize = False
        Caption = 'Brasília  DF CEP 70.712-900 - (061)3329-1700 - www.funcef.com.br'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 0
        mmTop = 10054
        mmWidth = 201084
        BandType = 0
      end
      object ppLabel41: TppLabel
        UserName = 'Label41'
        AutoSize = False
        Caption = 'CNPJ: 00.436.923/0001-90'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 0
        mmTop = 13758
        mmWidth = 201084
        BandType = 0
      end
      object lbl_Titulo: TppLabel
        UserName = 'lbl_Titulo'
        AutoSize = False
        Caption = 'ARQUIVO DE RETORNO DA PATROCIONADORA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4191
        mmLeft = 0
        mmTop = 21167
        mmWidth = 201085
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'lbl_dataconce1'
        Caption = 'Emissão: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2582
        mmLeft = 165894
        mmTop = 24871
        mmWidth = 10033
        BandType = 0
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2582
        mmLeft = 175948
        mmTop = 24871
        mmWidth = 19812
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 27517
        mmWidth = 201085
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3704
      mmPrintPosition = 0
      object ppDBText89: TppDBText
        UserName = 'DBText89'
        DataField = 'NUMRECEBIMENTO'
        DataPipeline = ppArqRetorno
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppArqRetorno'
        mmHeight = 2910
        mmLeft = 529
        mmTop = 794
        mmWidth = 24871
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'MESREFERENCIA'
        DataPipeline = ppArqRetorno
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppArqRetorno'
        mmHeight = 2910
        mmLeft = 27517
        mmTop = 794
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'VALORESPERADO'
        DataPipeline = ppArqRetorno
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppArqRetorno'
        mmHeight = 2910
        mmLeft = 45508
        mmTop = 794
        mmWidth = 12965
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'ALTERADORES'
        DataPipeline = ppArqRetorno
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppArqRetorno'
        mmHeight = 2910
        mmLeft = 63236
        mmTop = 794
        mmWidth = 14288
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText101'
        DataField = 'VALOR_TOTAL'
        DataPipeline = ppArqRetorno
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppArqRetorno'
        mmHeight = 2910
        mmLeft = 83079
        mmTop = 794
        mmWidth = 12700
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'CONTRIBUICAO'
        DataPipeline = ppArqRetorno
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppArqRetorno'
        mmHeight = 2910
        mmLeft = 100806
        mmTop = 794
        mmWidth = 62706
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        DataField = 'SITUACAO'
        DataPipeline = ppArqRetorno
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppArqRetorno'
        mmHeight = 2910
        mmLeft = 166688
        mmTop = 794
        mmWidth = 33073
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 3440
      mmPrintPosition = 0
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'FUNCEF/DIBEN/GEPAB'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2646
        mmLeft = 0
        mmTop = 794
        mmWidth = 200555
        BandType = 8
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2582
        mmLeft = 182298
        mmTop = 794
        mmWidth = 13589
        BandType = 8
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        ShiftWithParent = True
        Weight = 0.75
        mmHeight = 1323
        mmLeft = 0
        mmTop = 265
        mmWidth = 201085
        BandType = 8
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'PATRONOME'
      DataPipeline = ppArqRetorno
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppArqRetorno'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 23813
        mmPrintPosition = 0
        object ppLabel52: TppLabel
          UserName = 'Label52'
          Caption = 'Patrocinadora:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3387
          mmLeft = 1058
          mmTop = 1323
          mmWidth = 21167
          BandType = 3
          GroupNo = 0
        end
        object ppDBText7: TppDBText
          UserName = 'DBText7'
          AutoSize = True
          DataField = 'PATRONOME'
          DataPipeline = ppArqRetorno
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppArqRetorno'
          mmHeight = 3260
          mmLeft = 23283
          mmTop = 1323
          mmWidth = 17822
          BandType = 3
          GroupNo = 0
        end
        object ppLabel10: TppLabel
          UserName = 'Label10'
          Caption = 'NumRecebimento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3387
          mmLeft = 529
          mmTop = 17727
          mmWidth = 24088
          BandType = 3
          GroupNo = 0
        end
        object ppLine9: TppLine
          UserName = 'Line9'
          Weight = 0.75
          mmHeight = 265
          mmLeft = 0
          mmTop = 15081
          mmWidth = 201085
          BandType = 3
          GroupNo = 0
        end
        object ppDBText5: TppDBText
          UserName = 'DBText5'
          AutoSize = True
          DataField = 'PLANONOME'
          DataPipeline = ppArqRetorno
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppArqRetorno'
          mmHeight = 3260
          mmLeft = 32808
          mmTop = 5292
          mmWidth = 18076
          BandType = 3
          GroupNo = 0
        end
        object ppLabel11: TppLabel
          UserName = 'Label11'
          Caption = 'Plano Previdenciário:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3387
          mmLeft = 1058
          mmTop = 5292
          mmWidth = 30956
          BandType = 3
          GroupNo = 0
        end
        object ppLabel13: TppLabel
          UserName = 'Label13'
          AutoSize = False
          Caption = 'Mês Referência'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          WordWrap = True
          mmHeight = 7673
          mmLeft = 27517
          mmTop = 15610
          mmWidth = 16140
          BandType = 3
          GroupNo = 0
        end
        object ppLabel14: TppLabel
          UserName = 'Label14'
          AutoSize = False
          Caption = 'Valor Esperado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          WordWrap = True
          mmHeight = 7673
          mmLeft = 45244
          mmTop = 15610
          mmWidth = 16140
          BandType = 3
          GroupNo = 0
        end
        object ppLabel15: TppLabel
          UserName = 'Label15'
          AutoSize = False
          Caption = 'Alteradores'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          WordWrap = True
          mmHeight = 7673
          mmLeft = 62971
          mmTop = 15610
          mmWidth = 18256
          BandType = 3
          GroupNo = 0
        end
        object ppLabel17: TppLabel
          UserName = 'Label17'
          AutoSize = False
          Caption = 'Total Esperado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          WordWrap = True
          mmHeight = 7673
          mmLeft = 83344
          mmTop = 15610
          mmWidth = 15081
          BandType = 3
          GroupNo = 0
        end
        object ppLabel18: TppLabel
          UserName = 'Label18'
          AutoSize = False
          Caption = 'Contribuição'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          WordWrap = True
          mmHeight = 3387
          mmLeft = 100806
          mmTop = 17727
          mmWidth = 62706
          BandType = 3
          GroupNo = 0
        end
        object ppLabel19: TppLabel
          UserName = 'Label19'
          AutoSize = False
          Caption = 'Situação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          WordWrap = True
          mmHeight = 3387
          mmLeft = 166688
          mmTop = 17727
          mmWidth = 33073
          BandType = 3
          GroupNo = 0
        end
        object ppLine3: TppLine
          UserName = 'Line3'
          Weight = 0.75
          mmHeight = 265
          mmLeft = 265
          mmTop = 23548
          mmWidth = 201085
          BandType = 3
          GroupNo = 0
        end
        object ppLabel1: TppLabel
          UserName = 'Label1'
          Caption = 'Mês Cobrança:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3387
          mmLeft = 1058
          mmTop = 9525
          mmWidth = 22225
          BandType = 3
          GroupNo = 0
        end
        object ppDBText1: TppDBText
          UserName = 'DBText1'
          AutoSize = True
          DataField = 'MESCOBRANCA'
          DataPipeline = ppArqRetorno
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppArqRetorno'
          mmHeight = 3260
          mmLeft = 24342
          mmTop = 9525
          mmWidth = 22183
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object ppArqRetorno: TppBDEPipeline
    DataSource = dsRetornoImp
    UserName = 'ArqRetorno'
    Left = 432
    Top = 128
    object ppArqRetornoppField1: TppField
      FieldAlias = 'SELECIONA'
      FieldName = 'SELECIONA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppArqRetornoppField2: TppField
      FieldAlias = 'NUMRECEBIMENTO'
      FieldName = 'NUMRECEBIMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppArqRetornoppField3: TppField
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppArqRetornoppField4: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppArqRetornoppField5: TppField
      FieldAlias = 'MESCOBRANCA'
      FieldName = 'MESCOBRANCA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppArqRetornoppField6: TppField
      FieldAlias = 'MESREFERENCIA'
      FieldName = 'MESREFERENCIA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppArqRetornoppField7: TppField
      FieldAlias = 'VALORESPERADO'
      FieldName = 'VALORESPERADO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppArqRetornoppField8: TppField
      FieldAlias = 'ALTERADORES'
      FieldName = 'ALTERADORES'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppArqRetornoppField9: TppField
      FieldAlias = 'VALOR_TOTAL'
      FieldName = 'VALOR_TOTAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppArqRetornoppField10: TppField
      FieldAlias = 'CONTRIBUICAO'
      FieldName = 'CONTRIBUICAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppArqRetornoppField11: TppField
      FieldAlias = 'SITRECEBIMENTO'
      FieldName = 'SITRECEBIMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppArqRetornoppField12: TppField
      FieldAlias = 'PATRONOME'
      FieldName = 'PATRONOME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object ppArqRetornoppField13: TppField
      FieldAlias = 'IDPLANOPREV'
      FieldName = 'IDPLANOPREV'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object ppArqRetornoppField14: TppField
      FieldAlias = 'PLANONOME'
      FieldName = 'PLANONOME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object ppArqRetornoppField15: TppField
      FieldAlias = 'IDPESSJUR'
      FieldName = 'IDPESSJUR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object ppArqRetornoppField16: TppField
      FieldAlias = 'OBSERVACOES'
      FieldName = 'OBSERVACOES'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
  end
  object qryValReceber: TwwQuery
    AfterOpen = qryValReceberAfterOpen
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT SUM(DECODE(HST.FLGDEVOLUCAO,'
      '                  0,'
      '                  HST.VALORESPERADO,'
      '                  -HST.VALORESPERADO)) VALORESPERADO,'
      '       SUM(NVL((SELECT DECODE(HST.FLGDEVOLUCAO,'
      '                             0,'
      
        '                             (DECODE(HA.FLGTIPO, '#39'A'#39', HA.VALOR, ' +
        '-HA.VALOR)),'
      
        '                             (DECODE(HA.FLGTIPO, '#39'A'#39', HA.VALOR, ' +
        '-HA.VALOR))) ALTERADOR'
      '                 FROM HSTATRASOCONTRIB HA'
      '                WHERE HA.NUMRECEBIMENTO = HST.NUMRECEBIMENTO'
      '                  AND HA.MESREFERENCIA = HST.MESREFERENCIA'
      '                  AND HA.MESCOBRANCA = HST.MESCOBRANCA'
      '                  AND HA.IDMOTIVO = HST.IDMOTIVO),'
      '               0)) ALTERA,'
      '       SUM(DECODE(HST.FLGDEVOLUCAO,'
      '                  0,'
      '                  HST.VALORESPERADO,'
      '                  -HST.VALORESPERADO)) +'
      '       SUM(NVL((SELECT DECODE(HST.FLGDEVOLUCAO,'
      '                             0,'
      
        '                             (DECODE(HA.FLGTIPO, '#39'A'#39', HA.VALOR, ' +
        '-HA.VALOR)),'
      
        '                             (DECODE(HA.FLGTIPO, '#39'A'#39', HA.VALOR, ' +
        '-HA.VALOR))) ALTERADOR'
      '                 FROM HSTATRASOCONTRIB HA'
      '                WHERE HA.NUMRECEBIMENTO = HST.NUMRECEBIMENTO'
      '                  AND HA.MESREFERENCIA = HST.MESREFERENCIA'
      '                  AND HA.MESCOBRANCA = HST.MESCOBRANCA'
      '                  AND HA.IDMOTIVO = HST.IDMOTIVO),'
      '               0)) TOTAL'
      '  FROM HSTCONTRIBPREV HST'
      '  JOIN DEPENTIT DE'
      '    ON DE.IDPESSOA = HST.IDPESSOA'
      '   AND DE.IDTITULAR = HST.IDTITULAR'
      '  JOIN CONTPREV C'
      '    ON C.IDPLANOPREV = HST.IDPLANOPREV'
      '   AND C.IDCONTRIBUICAO = HST.IDCONTRIBUICAO'
      '  JOIN CONTPLANPATRO CP'
      '    ON CP.IDCONTRIBUICAO = HST.IDCONTRIBUICAO'
      '   AND CP.IDPLANOPREV = HST.IDPLANOPREV'
      '   AND CP.IDPESSJUR = HST.IDPESSJUR'
      ' WHERE HST.MESCOBRANCA = :MESCOBRANCA'
      '   AND HST.IDPLANOPREV = :IDPLANOPREV'
      '   AND HST.IDPESSJUR   = :IDPESSJUR'
      '   AND HST.DATAPREVISAORECE = :DATARECEBIMENTO'
      
        '   AND ((HST.SITRECEBIMENTO IN (1) AND NVL(HST.VALORRECEBIDO, 0)' +
        ' = 0 AND'
      
        '       HST.DATARECEBIMENTO IS NULL AND HST.CODDOCUMENTOPREV IS N' +
        'ULL AND'
      '       C.FLGPAGADOR = '#39'P'#39') OR'
      
        '       (HST.SITRECEBIMENTO IN (2, 3) AND HST.DATARECEBIMENTO IS ' +
        'NOT NULL AND'
      
        '       HST.VALORRECEBIDO IS NOT NULL AND HST.CODDOCUMENTOPREV IS' +
        ' NULL AND'
      '       HST.FOLHAORIGEM <> '#39'B'#39' AND HST.FLGDESCFOLHA = 1))'
      '   AND NOT EXISTS (SELECT 1'
      '                     FROM RETORNOHSTCONTRIBPATRO R'
      
        '                    WHERE R.NUMRECEBIMENTO = HST.NUMRECEBIMENTO)' +
        ' ')
    ValidateWithMask = True
    Left = 541
    Top = 298
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'MESCOBRANCA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATARECEBIMENTO'
        ParamType = ptUnknown
      end>
  end
  object dsValReceber: TDataSource
    DataSet = qryValReceber
    Left = 544
    Top = 328
  end
  object dsRetornoImp: TDataSource
    DataSet = qryRetornoImp
    Left = 437
    Top = 170
  end
  object qryRetornoImp: TwwQuery
    AutoCalcFields = False
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '#39'N'#39' SELECIONA,'
      '       R.NUMRECEBIMENTO,'
      '       DE.MATRICULA,'
      '       DE.NOME,'
      '       H.MESCOBRANCA,'
      '       H.MESREFERENCIA,'
      '       H.VALORESPERADO, /*Alteradores,*/ /*Total Esperado,*/'
      
        '       NVL((SELECT SUM(DECODE(HA.FLGTIPO, '#39'A'#39', HA.VALOR, -HA.VAL' +
        'OR)) ALTERADOR'
      '             FROM HSTATRASOCONTRIB HA'
      '            WHERE HA.NUMRECEBIMENTO = H.NUMRECEBIMENTO'
      '              AND HA.MESREFERENCIA = H.MESREFERENCIA'
      '              AND HA.MESCOBRANCA = H.MESCOBRANCA'
      '              AND HA.IDMOTIVO = H.IDMOTIVO),'
      '           0) ALTERADORES,'
      '       H.VALORESPERADO +'
      
        '       NVL((SELECT SUM(DECODE(HA.FLGTIPO, '#39'A'#39', HA.VALOR, -HA.VAL' +
        'OR)) ALTERADOR'
      '             FROM HSTATRASOCONTRIB HA'
      '            WHERE HA.NUMRECEBIMENTO = H.NUMRECEBIMENTO'
      '              AND HA.MESREFERENCIA = H.MESREFERENCIA'
      '              AND HA.MESCOBRANCA = H.MESCOBRANCA'
      '              AND HA.IDMOTIVO = H.IDMOTIVO),'
      '           0) VALOR_TOTAL,'
      '       C.NOME AS CONTRIBUICAO,'
      '       DECODE(H.FLGDEVOLUCAO, 0, '#39'Enviada e não recebida'#39','
      
        '                                 '#39'Enviada e não efetivamente pag' +
        'a'#39') AS SITRECEBIMENTO,'
      '       PATRO.NOME AS PATRONOME,'
      '       H.IDPLANOPREV,'
      '       PLANO.NOME AS PLANONOME,'
      '       H.IDPESSJUR,'
      '       R.OBSERVACOES'
      '  FROM RETORNOHSTCONTRIBPATRO R'
      '  JOIN HSTCONTRIBPREV H'
      '    ON H.NUMRECEBIMENTO = R.NUMRECEBIMENTO'
      '  JOIN (SELECT P.NOME, D.IDTITULAR, D.IDPESSOA, D.MATRICULA'
      '          FROM DEPENTIT D'
      '          JOIN PESSOA P ON P.IDPESSOA = D.IDPESSOA) DE'
      '    ON DE.IDTITULAR = H.IDTITULAR'
      '   AND DE.IDPESSOA = H.IDPESSOA'
      '  JOIN CONTRIBUICAO C'
      '    ON C.IDCONTRIBUICAO = H.IDCONTRIBUICAO'
      '  JOIN (SELECT P.IDPESSOA, P.NOME'
      '          FROM PESSOA P, PATRO PT'
      '         WHERE PT.IDPESSOA = P.IDPESSOA'
      '           AND PT.IDFUNDACAO = 1) PATRO'
      '    ON H.IDPESSJUR = PATRO.IDPESSOA'
      '  JOIN PLANPREV PLANO'
      '    ON H.IDPLANOPREV = PLANO.IDPLANOPREV'
      ' WHERE H.SITRECEBIMENTO = 1'
      '   AND H.MESCOBRANCA = :MESCOBRANÇA'
      '   AND H.IDCONTRIBUICAO IN (:IDCONTRIBUIÇÃO)'
      '   AND H.IDPESSJUR = :IDPESSJUR'
      ''
      ' '
      ' ')
    ControlType.Strings = (
      'SELECIONA;CheckBox;S;N')
    ValidateWithMask = True
    Left = 437
    Top = 218
    ParamData = <
      item
        DataType = ftString
        Name = 'MESCOBRANÇA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDCONTRIBUIÇÃO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end>
  end
  object imgTitulosGrids: TImageList
    Left = 601
    Top = 73
    Bitmap = {
      494C010107000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
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
      000000000000000000000000000000000000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C00000000000C6C3C600C6C3C600C6C3C600C0C0
      C000800000008000000080000000800000008000000080000000800000008000
      000080000000C0C0C000C0C0C000C0C0C0000000000000FF000000FF00000000
      00000000000000FF000000FF0000000000000000000000FF000000FF00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C0000000000000000000C6C3C600C6C3C600C6C3C600C6C3
      C60080000000C6C3C60080000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00800000008000000080000000C0C0C00000FF000000FF00000000000000FF
      000000FF0000000000000000000000FF00000000000000FF0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C00000000000000000000000
      000000000000000000000000000000000000C6C3C600C6C3C600C6C3C600C6C3
      C60080000000C6C3C60080000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0080000000FFFFFF008000000080000000000000000000000000FF000000FF
      000000000000C0C0C00000000000000000000000000000000000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000000000000000000000FFFF00C0C0
      C000000000000000000000000000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C00080000000C0C0C00080000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0080000000FFFFFF0080000000FFFFFF008080800000000000000000000000
      0000C0C0C00000000000C0C0C000000000008080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C0C0C000C0C0C00000FF
      FF00C0C0C0000000000000000000C0C0C000C0C0C000C0C0C00000FFFF00C0C0
      C000800000008000000080000000800000008000000080000000800000008000
      000080000000FFFFFF0080000000FFFFFF00000000000000000000000000C0C0
      C000000000000000000000000000000000000000000080808000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C0C0C000C0C0C0000000
      0000FFFFFF00FFFFFF00FFFFFF0000000000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C00000000000C0C0C000C0C0C000C0C0C00000FFFF0000FF
      FF0080000000FFFFFF008000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0080000000FFFFFF0080000000FFFFFF000000000080808000000000000000
      0000C0C0C00000000000C0C0C00000000000C0C0C00000000000008000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000FF0000000000
      0000FFFFFF0000000000FFFFFF0000000000C0C0C00000FFFF00C0C0C000C0C0
      C00000FFFF00C0C0C00000000000C0C0C000C0C0C000C0C0C00000FFFF0000FF
      FF00800000008000000080000000800000008000000080000000800000008000
      0000800000008000000080000000FFFFFF000000000000000000000000000000
      000000000000C0C0C00000000000C0C0C0000000000000000000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C0C0C000C0C0C0000000
      0000FFFFFF00FFFFFF00FFFFFF00000000000000000000FFFF0000FFFF00C0C0
      C00000FFFF000000000000000000C0C0C000C0C0C000C0C0C00000FFFF0000FF
      FF0000FFFF0000FFFF0080000000FFFFFF008000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0080000000FFFFFF000000000000000000000000000000
      0000C0C0C00000000000C0C0C00000000000C0C0C00000000000008000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000FF0000000000
      0000FFFFFF0000000000FFFFFF00000000000000000000000000C0C0C000C0C0
      C0000000000000000000C0C0C000C0C0C000C0C0C000C0C0C00000FFFF0000FF
      FF00C0C0C000C0C0C00080000000800000008000000080000000800000008000
      0000800000008000000080000000800000000000000000000000000000000000
      000000000000C0C0C00000000000C0C0C00000000000C0C0C000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C0C0C000C0C0C0000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      00000000000000000000C0C0C000C0C0C000C0C0C000C0C0C00000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0080000000FFFFFF008000000000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF000000000000000000000000000000
      00000000000000000000C0C0C000FF000000C0C0C00000000000008000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000FF0000000000
      0000FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000FFFFFF000000
      0000FFFFFF0000000000C0C0C000C0C0C000808000008080000000FFFF0000FF
      FF00C0C0C000C0C0C000C0C0C00000FFFF008000000080000000800000008000
      0000800000008000000080000000800000000000000000000000000000000000
      000000000000C0C0C00000000000000000000000000080808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C0C0C000C0C0C0000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000C0C0C000C0C0C00080800000808000008080000000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00C0C0C000C6C3
      C600C6C3C600C6C3C600C6C3C600C6C3C6000000000000000000000000008080
      8000C0C0C00000000000C0C0C000000000000000000080808000000000000000
      0000000000000000000000000000C0C0C0000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080000000800000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C0C0C000C0C0C0008000000080800000808000008080
      000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00C6C3
      C600C6C3C600C6C3C600C6C3C600C6C3C6000000000000000000000000000000
      0000000000008080800000000000000000008080800000000000000000000000
      00000000000000000000C0C0C000C0C0C0000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000FF0000008000
      0000C0C0C000FF000000C0C0C000FF000000C0C0C000FF000000C0C0C000FF00
      0000C0C0C00000000000C0C0C000C0C0C000FF00000080000000808000008080
      000080800000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C6C3
      C600C6C3C600C6C3C600C6C3C600C6C3C6000000000000000000000000000000
      0000000000000000000000000000000000008080800000000000000000000000
      000000000000C0C0C000C0C0C000C0C0C0000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000FF0000000000
      0000C0C0C000FF000000C0C0C000FF000000C0C0C000FF000000C0C0C000FF00
      0000C0C0C00000000000C0C0C000C0C0C000FF000000FF000000800000008080
      000080800000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C6C3
      C600C6C3C600C6C3C600C6C3C600C6C3C6000000000080808000000000000000
      0000000000000000000000000000000000008080800000000000000000000000
      0000C0C0C000C0C0C000C0C0C000C0C0C0000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C0C0C000C0C0C000FF000000FF000000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C6C3
      C600C6C3C600C6C3C600C6C3C600C6C3C600C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C0000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D6CEDE00393994002939
      73006B73A5005A6BA500293984006B73A5000000000000000000000000000000
      0000000000007373730000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B57B6B00844A
      3100C6ADA500E7E7DE00734A3900734231008463520000000000000000000000
      0000000000007373730000000000000000000000000000000000A59CBD004242
      9400A5A5C60000000000E7E7E7007373B5000000000000000000000000000000
      0000C6C6BD0000000000B5B5AD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000A563
      4A00E7DED60000000000CEBDAD0073423100DED6C60000000000000000000000
      0000C6C6BD0000000000B5B5AD00000000000000000000000000000000007B6B
      9C0039429400E7E7E70000000000CECEDE000000000000000000000000000000
      00004A4A4A000000000039393900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000AD73
      5A009C6B5200AD948400735239009C735A000000000000000000000000000000
      00004A4A4A00000000003939390000000000000000000000000000000000CECE
      D600524A94005A6BA5000000000000000000000000000000000000000000C6C6
      BD00000000000000000000000000B5B5AD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000AD7352009C6B520073523900000000000000000000000000000000007373
      7300A5A59C0000000000B5B5AD00636363000000000000000000E7E7E7000000
      0000948CBD0021318400ADB5CE00000000000000000000000000000000007373
      7300A5A59C0000000000B5B5AD00636363000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BD8C7300A55A4200BDA59400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000847BAD000000
      0000E7E7E7005A52940039428C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000E7DED600A56B4A00EFE7DE00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009484AD008C7B
      A5009C8CB5008C7BA5006B63A500A5A5C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      000000000000DED6CE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000D6CEDE00393994002939
      73006B73A5005A6BA500293984006B73A5000000000000000000000000000000
      00000000000000000000000000000000000000000000BD8C6B00945A3100CEB5
      AD00EFE7DE00945A390094523100946B52000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000A59CBD004242
      9400A5A5C60000000000E7E7E7007373B5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B56B4A00E7DE
      D60000000000D6BDB50094523100DED6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000007B6B
      9C0039429400E7E7E70000000000CECEDE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BD845A00B57B
      5200BD9C8400945A3900A57B5A00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CECE
      D600524A94005A6BA50000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E7CEBD00B56B
      4A00DED6CE0094523100D6BDB500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000847BAD000000
      0000E7E7E7005A52940039428C00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C67B
      5200B57B5200945A390000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009484AD008C7B
      A5009C8CB5008C7BA5006B63A500A5A5C6000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CE94
      7B00B56B4200C6AD9C0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000EFDE
      D600C6735A00EFE7DE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000008000000000000000001E0000
      000000000202000000000000047E0000000000008802000000000000851E0000
      000000008A02000000000000051E0000000000000A82000000000000041E0000
      000000000A300000000000000534000000000000027000000000000000700000
      00000000800000000000000000000000FFFFFFFFFFFF80FBFFFFFFFFC07BC4F1
      FFFFFFFFE471E2F1FFFFFFFFE0F1E3E0FFFFFFFFF1E0D1E0FEFFFFFFF1FBD1FB
      FC7F8003F1FBC0FBF83FC007FBFBFFFBF01FE00F80FB80FBE00FF01FC4FBC8FB
      C007F83FE2FBC1FB8003FC7FE3FBC1FBFFFFFEFFD1FBE3FBFFFFFFFFC0FBE3FB
      FFFFFFFFFFFFE3FBFFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
end
