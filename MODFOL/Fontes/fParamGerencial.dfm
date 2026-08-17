inherited frmParamGerencial: TfrmParamGerencial
  Left = 144
  Top = 62
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsToolWindow
  Caption = 'Relatório Gerencial'
  ClientHeight = 478
  ClientWidth = 501
  Font.Style = []
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 501
    Height = 439
    BorderWidth = 2
    object pgctrGerencial: TPageControl
      Left = 4
      Top = 4
      Width = 493
      Height = 431
      ActivePage = tbshGeral
      Align = alClient
      TabOrder = 0
      object tbshGeral: TTabSheet
        Caption = '&Geral'
        object gbxEstab: TGroupBox
          Left = 3
          Top = -1
          Width = 221
          Height = 46
          Caption = 'Estabelecimento'
          TabOrder = 0
          object dblkcbEstab: TwwDBLookupCombo
            Left = 8
            Top = 16
            Width = 206
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
        object gbxSetor: TGroupBox
          Left = 229
          Top = -1
          Width = 252
          Height = 46
          Caption = 'Setor Responsável'
          TabOrder = 1
          object edSetor: TEdit
            Left = 8
            Top = 16
            Width = 236
            Height = 21
            TabOrder = 0
          end
        end
        object gbxAnoMesRef: TGroupBox
          Left = 3
          Top = 47
          Width = 264
          Height = 46
          Caption = 'Mês e Ano de Referência'
          TabOrder = 2
          object cmbMes: TComboBox
            Left = 8
            Top = 16
            Width = 145
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
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
            Left = 169
            Top = 16
            Width = 79
            Height = 22
            MaxLength = 4
            MaxValue = 3000
            MinValue = 1900
            TabOrder = 1
            Value = 1900
            OnChange = dblkcbEstabChange
          end
        end
        object gbxTipoPapel: TGroupBox
          Left = 272
          Top = 47
          Width = 209
          Height = 46
          Caption = 'Tipo de Papel'
          TabOrder = 3
          object cmbTipoPapel: TComboBox
            Left = 7
            Top = 16
            Width = 195
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 0
          end
        end
        object gbxOrdemImpr: TGroupBox
          Left = 3
          Top = 96
          Width = 478
          Height = 65
          Caption = 'Ordem de Impressão'
          TabOrder = 4
          object Label1: TLabel
            Left = 308
            Top = 19
            Width = 53
            Height = 13
            Caption = 'Relatório G'
          end
          object Label2: TLabel
            Left = 165
            Top = 19
            Width = 53
            Height = 13
            Caption = 'Relatório D'
          end
          object Label3: TLabel
            Left = 8
            Top = 19
            Width = 52
            Height = 13
            Caption = 'Relatório A'
          end
          object cmbOrdemRelEmprTempServ: TComboBox
            Left = 308
            Top = 34
            Width = 163
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 2
            Items.Strings = (
              'Tempo de Serviço - Cresc'
              'Tempo de Serviço - Decres'
              'Funcionário'
              'Matrícula')
          end
          object cmbOrdemDistribPessSal: TComboBox
            Left = 165
            Top = 34
            Width = 132
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 1
            Items.Strings = (
              'Quantidade - Cresc'
              'Quantidade - Decres'
              'Salário - Cresc'
              'Salário - Decres')
          end
          object cbmOrdermDemDespPessoal: TComboBox
            Left = 8
            Top = 34
            Width = 145
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 0
            Items.Strings = (
              'Código do C. de Custo'
              'Nome do C. de Custo')
          end
        end
        object gbxRubricas: TGroupBox
          Left = 3
          Top = 162
          Width = 478
          Height = 237
          Caption = 'Rubrica(s) que Compõe(m)'
          TabOrder = 5
          object Label4: TLabel
            Left = 8
            Top = 193
            Width = 100
            Height = 13
            Caption = 'Procura por Rubricas'
          end
          object Paginas: TPageControl
            Left = 4
            Top = 15
            Width = 469
            Height = 175
            ActivePage = tbshDistribGratifCCusto
            MultiLine = True
            TabOrder = 0
            OnChange = PaginasChange
            object tbshRemCCusto: TTabSheet
              Caption = 'Relação de Cargos c/ Remuneração por C. Custo'
              object chklstRubrica1: TCheckListBox
                Left = 1
                Top = 2
                Width = 458
                Height = 124
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
              end
            end
            object tbshDistribGratifCCusto: TTabSheet
              Caption = 'Distribuição de Gratificações por C. Custo'
              object chklstRubrica2: TCheckListBox
                Left = 1
                Top = 2
                Width = 458
                Height = 124
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
              end
            end
            object tbshTotFolha: TTabSheet
              Caption = 'Total da Folha'
              object chklstRubrica3: TCheckListBox
                Left = 1
                Top = 2
                Width = 458
                Height = 124
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
              end
            end
          end
          object edCodRubricas: TEdit
            Left = 8
            Top = 207
            Width = 352
            Height = 21
            Hint = 
              'Digite aqui o código das Rubricas a procurar separados por vírgu' +
              'la'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
          end
          object sbtnMarcarRub: TBitBtn
            Left = 366
            Top = 203
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
            TabOrder = 2
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
      object tbshDespPessoal: TTabSheet
        Caption = 'Despesas com Pessoal'
        object gbxTipoPag: TGroupBox
          Left = 3
          Top = -1
          Width = 478
          Height = 45
          Caption = 'Tipo de Pagamento'
          TabOrder = 0
          object dblkcbMotivo: TwwDBLookupCombo
            Left = 8
            Top = 15
            Width = 463
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'50'#9'Descrição')
            LookupTable = qryMotivo
            LookupField = 'IDMOTIVO'
            Style = csDropDownList
            TabOrder = 0
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = False
            OnChange = dblkcbEstabChange
          end
        end
        object gbxSituacoes: TGroupBox
          Left = 3
          Top = 46
          Width = 267
          Height = 83
          Caption = 'Considerar Situações de Licença'
          TabOrder = 1
          object chklstSituacoes: TCheckListBox
            Left = 8
            Top = 16
            Width = 251
            Height = 58
            OnClickCheck = chklstSituacoesClickCheck
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ItemHeight = 13
            Items.Strings = (
              'aaa1231231'
              'bbb12312321'
              'ccc1231231'
              'ddd123123123'
              'eee12323123')
            ParentFont = False
            Style = lbOwnerDrawFixed
            TabOrder = 0
            OnDrawItem = chklstRubrica1DrawItem
          end
        end
        object rgApanhaDataTrein: TRadioGroup
          Left = 277
          Top = 46
          Width = 204
          Height = 39
          Caption = 'Apanha despesas Treinamento no RH?'
          Columns = 2
          ItemIndex = 0
          Items.Strings = (
            'Sim'
            'Não')
          TabOrder = 2
          OnClick = rgApanhaDataTreinClick
        end
        object rgTipoDataTrein: TRadioGroup
          Left = 277
          Top = 88
          Width = 204
          Height = 41
          Caption = 'Considera a Data do Treinamento'
          Columns = 2
          ItemIndex = 0
          Items.Strings = (
            'Inicial'
            'Final')
          TabOrder = 3
        end
        object gbxComplementares: TGroupBox
          Left = 3
          Top = 131
          Width = 478
          Height = 130
          Caption = 'Informações Complementares'
          TabOrder = 4
          object sgrInfComplem: TStringGrid
            Left = 8
            Top = 14
            Width = 463
            Height = 107
            ColCount = 2
            DefaultColWidth = 60
            DefaultRowHeight = 20
            RowCount = 7
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
            TabOrder = 0
            OnKeyPress = sgrInfComplemKeyPress
          end
        end
        object gbxRubricas2: TGroupBox
          Left = 3
          Top = 263
          Width = 478
          Height = 136
          Caption = 'Rubrica(s) que Compõe(m)'
          TabOrder = 5
          object Label5: TLabel
            Left = 8
            Top = 92
            Width = 100
            Height = 13
            Caption = 'Procura por Rubricas'
          end
          object chklstRubrica4: TCheckListBox
            Left = 9
            Top = 15
            Width = 458
            Height = 74
            OnClickCheck = chklstRubrica4ClickCheck
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
          end
          object edCodRubricas2: TEdit
            Left = 8
            Top = 106
            Width = 352
            Height = 21
            Hint = 
              'Digite aqui o código das Rubricas a procurar separados por vírgu' +
              'la'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
          end
          object sbtnMarcarRub2: TBitBtn
            Left = 366
            Top = 102
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
            TabOrder = 2
            OnClick = sbtnMarcarRub2Click
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
  end
  inherited Dock971: TDock97
    Top = 439
    Width = 501
    inherited tb97Fundo: TToolbar97
      Left = 253
      DockPos = 331
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
    Left = 110
    Top = 433
    TargetsData = (
      1
      2
      (
        ''
        'Text'
        0)
      (
        ''
        'Cells'
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
    Left = 14
    Top = 433
    ParamData = <
      item
        DataType = ftInteger
        Name = 'EMPRESA'
        ParamType = ptUnknown
      end>
  end
  object qryMotivo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDMOTIVO,DESCRICAO '
      'FROM'
      '  MOTIVO '
      'WHERE'
      '  (GRUPOMOTIVO = '#39'F'#39')'
      'ORDER BY'
      '  UPPER(DESCRICAO)')
    ValidateWithMask = True
    Left = 60
    Top = 433
  end
end
