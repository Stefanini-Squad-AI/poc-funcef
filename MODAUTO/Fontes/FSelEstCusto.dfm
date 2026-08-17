inherited FRMSelEstCusto: TFRMSelEstCusto
  Left = 94
  Top = 128
  HelpContext = 4170031
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsToolWindow
  Caption = 'Estatística de Custos de RH'
  ClientHeight = 376
  ClientWidth = 611
  Font.Style = []
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 611
    Height = 337
    BorderWidth = 2
    object pgctrlPaginas: TPageControl
      Left = 4
      Top = 4
      Width = 603
      Height = 329
      ActivePage = tbshTipoEst
      Align = alClient
      HotTrack = True
      TabOrder = 0
      object tbshTipoEst: TTabSheet
        Caption = 'Tipo  de Estatística'
        object gbxValores: TGroupBox
          Left = 271
          Top = 70
          Width = 289
          Height = 190
          Caption = 'Faixas de Valores'
          TabOrder = 2
          Visible = False
          object Label4: TLabel
            Left = 33
            Top = 18
            Width = 34
            Height = 13
            Caption = 'Faixa 1'
          end
          object Label5: TLabel
            Left = 33
            Top = 39
            Width = 34
            Height = 13
            Caption = 'Faixa 2'
          end
          object Label6: TLabel
            Left = 33
            Top = 60
            Width = 34
            Height = 13
            Caption = 'Faixa 3'
          end
          object Label7: TLabel
            Left = 33
            Top = 81
            Width = 34
            Height = 13
            Caption = 'Faixa 4'
          end
          object Label8: TLabel
            Left = 33
            Top = 102
            Width = 34
            Height = 13
            Caption = 'Faixa 5'
          end
          object Label9: TLabel
            Left = 33
            Top = 123
            Width = 34
            Height = 13
            Caption = 'Faixa 6'
          end
          object Label10: TLabel
            Left = 33
            Top = 144
            Width = 34
            Height = 13
            Caption = 'Faixa 7'
          end
          object Label11: TLabel
            Left = 33
            Top = 165
            Width = 34
            Height = 13
            Caption = 'Faixa 8'
          end
          object ednMin1: TEditNum
            Left = 114
            Top = 18
            Width = 64
            Height = 21
            TabOrder = 0
            Text = 'ednMin1'
            IntDigits = 8
            Signal = False
            DecDigits = 0
            Numeric = True
          end
          object ednMax1: TEditNum
            Left = 195
            Top = 18
            Width = 64
            Height = 21
            TabOrder = 1
            Text = 'ednMax1'
            OnChange = ednMax1Change
            IntDigits = 8
            Signal = False
            DecDigits = 0
            Numeric = True
          end
          object ednMax2: TEditNum
            Left = 195
            Top = 39
            Width = 64
            Height = 21
            TabOrder = 3
            Text = 'ednMax2'
            IntDigits = 8
            Signal = False
            DecDigits = 0
            Numeric = True
          end
          object ednMin2: TEditNum
            Left = 114
            Top = 39
            Width = 64
            Height = 21
            TabOrder = 2
            Text = 'ednMin2'
            IntDigits = 8
            Signal = False
            DecDigits = 0
            Numeric = True
          end
          object ednMax3: TEditNum
            Left = 195
            Top = 60
            Width = 64
            Height = 21
            TabOrder = 5
            Text = 'ednMax3'
            IntDigits = 8
            Signal = False
            DecDigits = 0
            Numeric = True
          end
          object ednMin3: TEditNum
            Left = 114
            Top = 60
            Width = 64
            Height = 21
            TabOrder = 4
            Text = 'ednMin3'
            IntDigits = 8
            Signal = False
            DecDigits = 0
            Numeric = True
          end
          object ednMax4: TEditNum
            Left = 195
            Top = 81
            Width = 64
            Height = 21
            TabOrder = 7
            Text = 'ednMax4'
            IntDigits = 8
            Signal = False
            DecDigits = 0
            Numeric = True
          end
          object ednMin4: TEditNum
            Left = 114
            Top = 81
            Width = 64
            Height = 21
            TabOrder = 6
            Text = 'ednMin4'
            IntDigits = 8
            Signal = False
            DecDigits = 0
            Numeric = True
          end
          object ednMax5: TEditNum
            Left = 195
            Top = 102
            Width = 64
            Height = 21
            TabOrder = 9
            Text = 'ednMax5'
            IntDigits = 8
            Signal = False
            DecDigits = 0
            Numeric = True
          end
          object ednMin5: TEditNum
            Left = 114
            Top = 102
            Width = 64
            Height = 21
            TabOrder = 8
            Text = 'ednMin5'
            IntDigits = 8
            Signal = False
            DecDigits = 0
            Numeric = True
          end
          object ednMax6: TEditNum
            Left = 195
            Top = 123
            Width = 64
            Height = 21
            TabOrder = 11
            Text = 'ednMax6'
            IntDigits = 8
            Signal = False
            DecDigits = 0
            Numeric = True
          end
          object ednMin6: TEditNum
            Left = 114
            Top = 123
            Width = 64
            Height = 21
            TabOrder = 10
            Text = 'ednMin6'
            IntDigits = 8
            Signal = False
            DecDigits = 0
            Numeric = True
          end
          object ednMax7: TEditNum
            Left = 195
            Top = 144
            Width = 64
            Height = 21
            TabOrder = 13
            Text = 'ednMax7'
            IntDigits = 8
            Signal = False
            DecDigits = 0
            Numeric = True
          end
          object ednMin7: TEditNum
            Left = 114
            Top = 144
            Width = 64
            Height = 21
            TabOrder = 12
            Text = 'ednMin7'
            IntDigits = 8
            Signal = False
            DecDigits = 0
            Numeric = True
          end
          object ednMax8: TEditNum
            Left = 195
            Top = 165
            Width = 64
            Height = 21
            TabOrder = 15
            Text = 'ednMax8'
            IntDigits = 8
            Signal = False
            DecDigits = 0
            Numeric = True
          end
          object ednMin8: TEditNum
            Left = 114
            Top = 165
            Width = 64
            Height = 21
            TabOrder = 14
            Text = 'ednMin8'
            IntDigits = 8
            Signal = False
            DecDigits = 0
            Numeric = True
          end
        end
        object gbxAnoMesRef: TGroupBox
          Left = 174
          Top = 8
          Width = 242
          Height = 46
          Caption = 'Mês e Ano de Referência'
          TabOrder = 0
          object cmbMes: TComboBox
            Left = 8
            Top = 16
            Width = 150
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            ParentShowHint = False
            ShowHint = False
            TabOrder = 0
            Items.Strings = (
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
          object speAno: TSpinEdit
            Left = 168
            Top = 16
            Width = 60
            Height = 22
            MaxLength = 4
            MaxValue = 3000
            MinValue = 1900
            ParentShowHint = False
            ShowHint = False
            TabOrder = 1
            Value = 1900
          end
        end
        object rgTipoEst: TRadioGroup
          Left = 223
          Top = 70
          Width = 149
          Height = 190
          Caption = 'Tipo de Estatística'
          ItemIndex = 0
          Items.Strings = (
            'Sexo '
            'Tipo de Contrato'
            'Grupo Funcional'
            'Escolaridade '
            'Faixa Etária')
          TabOrder = 1
          OnClick = rgTipoEstClick
        end
      end
      object tbshRubricas: TTabSheet
        Caption = 'Rubrica(s) que Compõe(m)'
        object Label1: TLabel
          Left = 4
          Top = 192
          Width = 100
          Height = 13
          Caption = 'Procura por Rubricas'
        end
        object pgctrlPaginas2: TPageControl
          Left = 2
          Top = 0
          Width = 505
          Height = 190
          ActivePage = tbshColuna8
          HotTrack = True
          TabOrder = 0
          OnChange = pgctrlPaginas2Change
          object tbshColuna1: TTabSheet
            Caption = '1º Coluna'
            object chklstRubrica1: TColorCheckListBox
              Left = 1
              Top = 2
              Width = 360
              Height = 156
              OnClickCheck = chklstRubrica1ClickCheck
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ItemHeight = 13
              ParentFont = False
              Style = lbOwnerDrawFixed
              TabOrder = 0
              OnDrawItem = chklstRubrica1DrawItem
              OnKeyDown = chklstRubrica1KeyDown
            end
          end
          object tbshColuna2: TTabSheet
            Caption = '2º Coluna'
            object chklstRubrica2: TColorCheckListBox
              Left = 1
              Top = 2
              Width = 360
              Height = 156
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ItemHeight = 13
              ParentFont = False
              Style = lbOwnerDrawFixed
              TabOrder = 0
              OnClick = chklstRubrica1ClickCheck
              OnDrawItem = chklstRubrica1DrawItem
              OnKeyDown = chklstRubrica1KeyDown
            end
          end
          object tbshColuna3: TTabSheet
            Caption = '3º Coluna'
            object chklstRubrica3: TColorCheckListBox
              Left = 1
              Top = 2
              Width = 360
              Height = 156
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ItemHeight = 13
              ParentFont = False
              Style = lbOwnerDrawFixed
              TabOrder = 0
              OnClick = chklstRubrica1ClickCheck
              OnDrawItem = chklstRubrica1DrawItem
              OnKeyDown = chklstRubrica1KeyDown
            end
          end
          object tbshColuna4: TTabSheet
            Caption = '4ª Coluna'
            ImageIndex = 3
            object chklstRubrica4: TColorCheckListBox
              Left = 1
              Top = 2
              Width = 360
              Height = 156
              OnClickCheck = chklstRubrica1ClickCheck
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ItemHeight = 13
              ParentFont = False
              Style = lbOwnerDrawFixed
              TabOrder = 0
              OnDrawItem = chklstRubrica1DrawItem
              OnKeyDown = chklstRubrica1KeyDown
            end
          end
          object tbshColuna5: TTabSheet
            Caption = '5ª Coluna'
            ImageIndex = 4
            object chklstRubrica5: TColorCheckListBox
              Left = 1
              Top = 2
              Width = 360
              Height = 156
              OnClickCheck = chklstRubrica1ClickCheck
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ItemHeight = 13
              ParentFont = False
              Style = lbOwnerDrawFixed
              TabOrder = 0
              OnDrawItem = chklstRubrica1DrawItem
              OnKeyDown = chklstRubrica1KeyDown
            end
          end
          object tbshColuna6: TTabSheet
            Caption = '6ª Coluna'
            ImageIndex = 5
            object chklstRubrica6: TColorCheckListBox
              Left = 1
              Top = 2
              Width = 360
              Height = 156
              OnClickCheck = chklstRubrica1ClickCheck
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ItemHeight = 13
              ParentFont = False
              Style = lbOwnerDrawFixed
              TabOrder = 0
              OnDrawItem = chklstRubrica1DrawItem
              OnKeyDown = chklstRubrica1KeyDown
            end
          end
          object tbshColuna7: TTabSheet
            Caption = '7ª Coluna'
            ImageIndex = 6
            object chklstRubrica7: TColorCheckListBox
              Left = 1
              Top = 2
              Width = 360
              Height = 156
              OnClickCheck = chklstRubrica1ClickCheck
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ItemHeight = 13
              ParentFont = False
              Style = lbOwnerDrawFixed
              TabOrder = 0
              OnDrawItem = chklstRubrica1DrawItem
              OnKeyDown = chklstRubrica1KeyDown
            end
          end
          object tbshColuna8: TTabSheet
            Caption = '8ª Coluna'
            ImageIndex = 7
            object chklstRubrica8: TColorCheckListBox
              Left = 1
              Top = 2
              Width = 360
              Height = 156
              OnClickCheck = chklstRubrica1ClickCheck
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ItemHeight = 13
              ParentFont = False
              Style = lbOwnerDrawFixed
              TabOrder = 0
              OnDrawItem = chklstRubrica1DrawItem
              OnKeyDown = chklstRubrica1KeyDown
            end
          end
        end
        object bbtnSelTodos: TBitBtn
          Left = 374
          Top = 26
          Width = 129
          Height = 25
          Caption = '   Seleciona Todas'
          TabOrder = 1
          TabStop = False
          OnClick = bbtnSelTodosClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            3333333333333333333333333333333333333333333333333333333333300000
            0003333333388888888333333330FF9FFF0333333338FF7FFF8333333000F999
            FF0333333888F777FF83333330F099F99F03333338F877F77F83333000F09FFF
            9903333888F87FFF77833330F090FFFFF9933338F878FFFFF7733000F0900000
            00993888F8788888887730F090FFFFF9933338F878FFFFF7733330F090000000
            993338F87888888877333090FFFFF99333333878FFFFF7733333309000000099
            3333387888888877333330FFFFF99333333338FFFFF773333333300000009933
            3333388888887733333333333333333333333333333333333333}
          NumGlyphs = 2
          Spacing = 0
        end
        object bbtnInverteSel: TBitBtn
          Left = 374
          Top = 53
          Width = 129
          Height = 25
          Caption = '   Inverte Seleção'
          TabOrder = 2
          TabStop = False
          OnClick = bbtnInverteSelClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            3333333333333333333333333333000000003333333388888888333333330FFF
            FFF0333333338FFFFFF8333000330FFFFFF0333788338FFFFFF8333033330FFF
            FFF0333833338FFFFFF8330003330FFFFFF0337783338FFFFFF8333033330FFF
            FFF0333833338FFFFFF833333333000000003333333388888888000000003333
            333388888888333333330FF9FFF0333303338FF7FFF8333383330F999FF03330
            00338F777FF833387733099F99F033330333877F77F83333833309FFF9903300
            033387FFF778338873330FFFFF99333333338FFFFF7733333333000000099333
            3333888888877333333333333333333333333333333333333333}
          NumGlyphs = 2
          Spacing = 0
        end
        object gbxTituloColunas: TGroupBox
          Left = 374
          Top = 81
          Width = 129
          Height = 101
          Caption = 'Título da Coluna'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          object Label2: TLabel
            Left = 7
            Top = 19
            Width = 39
            Height = 13
            Caption = '1º Linha'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label3: TLabel
            Left = 6
            Top = 60
            Width = 39
            Height = 13
            Caption = '2º Linha'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object edTituloLinha1: TEdit
            Left = 7
            Top = 32
            Width = 115
            Height = 21
            Hint = 'Digite aqui a 1º linha do Título desta coluna'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            OnChange = edTituloLinha1Change
          end
          object edTituloLinha2: TEdit
            Left = 7
            Top = 73
            Width = 115
            Height = 21
            Hint = 'Digite aqui a 2º linha do Título desta coluna'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            OnChange = edTituloLinha1Change
          end
        end
        object edCodRubricas: TEdit
          Left = 4
          Top = 206
          Width = 390
          Height = 21
          Hint = 
            'Digite aqui o código das Rubricas a procurar separados por vírgu' +
            'la'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
        end
        object sbtnMarcarRub: TBitBtn
          Left = 403
          Top = 202
          Width = 103
          Height = 28
          Caption = '   &Marcar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 5
          OnClick = sbtnMarcarRubClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            88888888888888FF8888888888888778888888888888F77F8888888888800F08
            8888888888F7787F88888888800FFF0888888888F7788878F88888800FFFFFF0
            88888887788888F7F8888887FFFFFCF088888887FFF887878F888811111CCFFF
            08888877777F788F7F8881999991FFCF088887777777F87878F8998999991CFF
            F088778777777F88F78F99F899991FFCFF0877F877777F87887899FF89991CCF
            FFF077FF87777F7888F799F9F8891FFFF77877F7F8877F88F77899F99FF81FF7
            788877F77FF878F7788889999991777888888777777787788888889999988888
            8888887777788888888888888888888888888888888888888888}
          NumGlyphs = 2
          Spacing = 0
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 337
    Width = 611
    inherited tb97Fundo: TToolbar97
      Left = 326
      DockPos = 326
      inherited sep1: TToolbarSep97
        Left = 162
      end
      object ToolbarSep971: TToolbarSep97 [1]
        Left = 80
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      inherited bbtnSair: TBitBtn
        Left = 82
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 164
      end
      object bbtnConfirmar: TBitBtn
        Left = 0
        Top = 0
        Width = 80
        Height = 33
        Caption = '&OK'
        Default = True
        ModalResult = 1
        TabOrder = 2
        OnClick = bbtnConfirmarClick
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
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 119
    Top = 206
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qryVariavelMensal: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 89
    Top = 40
  end
end
