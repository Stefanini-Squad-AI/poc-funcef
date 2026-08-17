inherited frmParamVariavelMensal: TfrmParamVariavelMensal
  Left = 91
  Top = 75
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsToolWindow
  Caption = 'Relação de Rubricas Selecionadas por Empregado'
  ClientHeight = 459
  ClientWidth = 635
  Font.Style = []
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 635
    Height = 420
    BorderWidth = 2
    object gbxEstab: TGroupBox
      Left = 9
      Top = 5
      Width = 390
      Height = 46
      Caption = 'Estabelecimento'
      TabOrder = 0
      object dblkcbEstab: TwwDBLookupCombo
        Left = 8
        Top = 16
        Width = 378
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'60'#9'Estabelecimento')
        LookupTable = qryEstab
        LookupField = 'IDPESSOA'
        Style = csDropDownList
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        OnChange = dblkcbEstabChange
      end
    end
    object gbxOrdem: TGroupBox
      Left = 410
      Top = 5
      Width = 209
      Height = 46
      Caption = 'Ordem de Impressão'
      TabOrder = 1
      object cmbOrderBy: TComboBox
        Left = 7
        Top = 16
        Width = 195
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
        Items.Strings = (
          'Nome'
          'Matrícula'
          'Cargo, Nome'
          'Cargo, Matrícula'
          'Centro de Custo, Nome'
          'Centro de Custo, Matrícula')
      end
    end
    object gbxTitulo: TGroupBox
      Left = 9
      Top = 53
      Width = 610
      Height = 46
      Caption = 'Título do Relatório'
      TabOrder = 2
      object edTitulo: TEdit
        Left = 8
        Top = 16
        Width = 590
        Height = 21
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
      end
    end
    object gbxAnoMesRef: TGroupBox
      Left = 9
      Top = 101
      Width = 168
      Height = 46
      Caption = 'Mês e Ano de Referência'
      TabOrder = 3
      object cmbMes: TComboBox
        Left = 8
        Top = 16
        Width = 100
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
        Left = 112
        Top = 16
        Width = 50
        Height = 22
        MaxLength = 4
        MaxValue = 3000
        MinValue = 1900
        ParentShowHint = False
        ShowHint = False
        TabOrder = 1
        Value = 1900
        OnChange = dblkcbEstabChange
      end
    end
    object pgctrlPaginas: TPageControl
      Left = 9
      Top = 150
      Width = 615
      Height = 261
      ActivePage = tbshRubricas
      HotTrack = True
      TabOrder = 4
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
          Width = 605
          Height = 190
          ActivePage = tbshColuna1
          HotTrack = True
          TabOrder = 0
          OnChange = pgctrlPaginas2Change
          object tbshColuna1: TTabSheet
            Caption = '1º Coluna'
            object chklstRubrica1: TCheckListBox
              Left = 1
              Top = 2
              Width = 460
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
            object chklstRubrica2: TCheckListBox
              Left = 1
              Top = 2
              Width = 460
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
            object chklstRubrica3: TCheckListBox
              Left = 1
              Top = 2
              Width = 460
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
            object chklstRubrica4: TCheckListBox
              Left = 1
              Top = 2
              Width = 460
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
            object chklstRubrica5: TCheckListBox
              Left = 1
              Top = 2
              Width = 460
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
            object chklstRubrica6: TCheckListBox
              Left = 1
              Top = 2
              Width = 460
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
            object chklstRubrica7: TCheckListBox
              Left = 1
              Top = 2
              Width = 460
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
            object chklstRubrica8: TCheckListBox
              Left = 1
              Top = 2
              Width = 460
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
          Left = 474
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
          Left = 474
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
          Left = 474
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
          Width = 490
          Height = 21
          Hint = 
            'Digite aqui o código das Rubricas a procurar separados por vírgu' +
            'la'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
        end
        object sbtnMarcarRub: TBitBtn
          Left = 503
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
      object tbshTipoEmpr: TTabSheet
        Caption = 'Tipos / Situações de Empregados'
        object gbxTipContra: TGroupBox
          Left = 128
          Top = 34
          Width = 213
          Height = 151
          Caption = 'Tipo de Contrato'
          ParentShowHint = False
          ShowHint = False
          TabOrder = 0
          OnExit = gbxTipContraExit
          object cbxEfetivos: TCheckBox
            Left = 9
            Top = 23
            Width = 64
            Height = 13
            Caption = 'Efetivos'
            Checked = True
            ParentShowHint = False
            ShowHint = False
            State = cbChecked
            TabOrder = 0
          end
          object cbxEspeciais: TCheckBox
            Left = 9
            Top = 57
            Width = 90
            Height = 13
            Caption = 'Efet. Especiais'
            Checked = True
            ParentShowHint = False
            ShowHint = False
            State = cbChecked
            TabOrder = 1
          end
          object cbxTemporarios: TCheckBox
            Left = 9
            Top = 90
            Width = 85
            Height = 13
            Caption = 'Temporários'
            ParentShowHint = False
            ShowHint = False
            TabOrder = 2
          end
          object cbxEstagiarios: TCheckBox
            Left = 9
            Top = 123
            Width = 74
            Height = 13
            Caption = 'Estagiários'
            Checked = True
            ParentShowHint = False
            ShowHint = False
            State = cbChecked
            TabOrder = 3
          end
          object cbxTerceiros: TCheckBox
            Left = 106
            Top = 23
            Width = 66
            Height = 13
            Caption = 'Terceiros'
            ParentShowHint = False
            ShowHint = False
            TabOrder = 4
          end
          object cbxPropDirSemVinc: TCheckBox
            Left = 106
            Top = 57
            Width = 97
            Height = 13
            Caption = 'Prop/Dir s/ Vinc'
            ParentShowHint = False
            ShowHint = False
            TabOrder = 5
          end
          object cbxAutonomos: TCheckBox
            Left = 106
            Top = 90
            Width = 75
            Height = 13
            Caption = 'Autônomos'
            ParentShowHint = False
            ShowHint = False
            TabOrder = 6
          end
        end
        object gbxSituacao: TGroupBox
          Left = 368
          Top = 34
          Width = 111
          Height = 151
          Caption = 'Situação Funcional'
          ParentShowHint = False
          ShowHint = False
          TabOrder = 1
          OnExit = gbxSituacaoExit
          object cbxAtivos: TCheckBox
            Left = 17
            Top = 35
            Width = 52
            Height = 13
            Caption = 'Ativos'
            Checked = True
            ParentShowHint = False
            ShowHint = False
            State = cbChecked
            TabOrder = 0
          end
          object cbxAfastados: TCheckBox
            Left = 17
            Top = 70
            Width = 69
            Height = 13
            Caption = 'Afastados'
            Checked = True
            ParentShowHint = False
            ShowHint = False
            State = cbChecked
            TabOrder = 1
          end
          object cbxDemitidos: TCheckBox
            Left = 17
            Top = 106
            Width = 69
            Height = 13
            Caption = 'Demititos'
            ParentShowHint = False
            ShowHint = False
            TabOrder = 2
          end
        end
      end
      object tbshCCusto: TTabSheet
        Caption = '&Centros de Custo'
        ImageIndex = 2
        object chklstCCusto: TCheckListBox
          Left = 1
          Top = 3
          Width = 476
          Height = 224
          OnClickCheck = chklstCCustoClickCheck
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 13
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          Style = lbOwnerDrawFixed
          TabOrder = 0
          OnKeyDown = chklstCCustoKeyDown
        end
        object spbtSelecao: TBitBtn
          Left = 484
          Top = 75
          Width = 120
          Height = 40
          Caption = 'Seleciona Todos'
          TabOrder = 1
          TabStop = False
          OnClick = spbtSelecaoClick
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
        object spbtInvSelecao: TBitBtn
          Left = 484
          Top = 117
          Width = 120
          Height = 40
          Caption = 'Inverte Seleção'
          TabOrder = 2
          TabStop = False
          OnClick = spbtInvSelecaoClick
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
      end
    end
    object rgTipoRel: TRadioGroup
      Left = 353
      Top = 101
      Width = 265
      Height = 46
      Caption = 'Tipo de Relatório'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Normal Analítico'
        'Comparativo Analítico'
        'Normal Sintético'
        'Comparativo Sintético')
      TabOrder = 5
      OnClick = rgTipoRelClick
    end
    object gbxAnoMesRef2: TGroupBox
      Left = 181
      Top = 101
      Width = 168
      Height = 46
      Caption = 'Mês e Ano Base Comparativa'
      TabOrder = 6
      Visible = False
      object cmbMes2: TComboBox
        Left = 8
        Top = 16
        Width = 100
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
      object speAno2: TSpinEdit
        Left = 112
        Top = 16
        Width = 50
        Height = 22
        MaxLength = 4
        MaxValue = 3000
        MinValue = 1900
        ParentShowHint = False
        ShowHint = False
        TabOrder = 1
        Value = 1900
        OnChange = dblkcbEstabChange
      end
    end
  end
  inherited Dock971: TDock97
    Top = 420
    Width = 635
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
  object qryEstab: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  PJ.IDPESSOA, PJ.NOME'
      'FROM'
      '  PESSOA PJ, FILIALPESSOA FP'
      'WHERE'
      ''
      '  (PJ.IDGRUPO        = :EMPRESA) AND'
      '  (FP.IDFILIALPESSOA = PJ.IDPESSOA)')
    ValidateWithMask = True
    Left = 72
    Top = 206
    ParamData = <
      item
        DataType = ftInteger
        Name = 'EMPRESA'
        ParamType = ptUnknown
      end>
  end
end
