inherited frmManutListaExecPrevia: TfrmManutListaExecPrevia
  Left = 353
  Top = 161
  Caption = 'Manutencao Listas de Execução da Previa'
  ClientHeight = 535
  ClientWidth = 905
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 905
    Height = 496
    object pnlGrid: TPanel
      Left = 1
      Top = 153
      Width = 903
      Height = 342
      Align = alClient
      TabOrder = 0
      object dbgdSubListas: TwwDBGrid
        Left = 1
        Top = 1
        Width = 901
        Height = 340
        Selected.Strings = (
          'IDSEQEXECPREVIA'#9'12'#9'Sequencial~Execução'
          'IDLISTAORIGEM'#9'10'#9'Lista~Origem'
          'NOME'#9'50'#9'Nome Lista'
          'IDLISTACLONE'#9'10'#9'Lista~Clone'
          'IDPREVIABENEF'#9'10'#9'Id Interno~Previa'
          'STATUS'#9'30'#9'Status')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = dsListaFilha
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        ParentFont = False
        PopupMenu = popSelLista
        TabOrder = 0
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 2
        TitleButtons = False
        IndicatorColor = icBlack
      end
    end
    object pnlFiltro: TPanel
      Left = 1
      Top = 1
      Width = 903
      Height = 152
      Align = alTop
      TabOrder = 1
      object gbFiltro: TGroupBox
        Left = 1
        Top = 1
        Width = 504
        Height = 150
        Align = alLeft
        Caption = '  Filtros  '
        TabOrder = 0
        object lblZero: TLabel
          Left = 34
          Top = 83
          Width = 336
          Height = 15
          Caption = 'Total para Processamento........................'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
        end
        object lblFalta: TLabel
          Left = 34
          Top = 98
          Width = 336
          Height = 15
          Caption = 'Total a Processar/Reprocessar...................'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
        end
        object lblFalha: TLabel
          Left = 34
          Top = 114
          Width = 336
          Height = 15
          Caption = 'Total Processado Parcial/Falha..................'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
        end
        object lblFinalizado: TLabel
          Left = 34
          Top = 129
          Width = 336
          Height = 15
          Caption = 'Total Finalizado................................'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
        end
        object dbZero: TDBText
          Left = 375
          Top = 83
          Width = 58
          Height = 17
          Alignment = taRightJustify
          DataField = 'ZERO'
          DataSource = dsListaOri
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbFalta: TDBText
          Left = 375
          Top = 98
          Width = 58
          Height = 17
          Alignment = taRightJustify
          DataField = 'FALTA'
          DataSource = dsListaOri
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbFalha: TDBText
          Left = 375
          Top = 114
          Width = 58
          Height = 17
          Alignment = taRightJustify
          DataField = 'FALHA'
          DataSource = dsListaOri
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbFinal: TDBText
          Left = 375
          Top = 129
          Width = 58
          Height = 17
          Alignment = taRightJustify
          DataField = 'FINAL'
          DataSource = dsListaOri
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbLista: TDBText
          Left = 12
          Top = 65
          Width = 469
          Height = 17
          DataField = 'LISTA'
          DataSource = dsListaOri
        end
        object gbSeqExec: TGroupBox
          Left = 10
          Top = 16
          Width = 183
          Height = 45
          Caption = ' Sequencial de Execução '
          TabOrder = 0
          object edSeqExec: TEdit
            Left = 16
            Top = 18
            Width = 120
            Height = 21
            TabOrder = 0
            OnKeyPress = edSeqExecKeyPress
          end
          object btnCarrega: TBitBtn
            Left = 145
            Top = 18
            Width = 23
            Height = 20
            TabOrder = 1
            OnClick = btnCarregaClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              8888888888888888888888888888888888888888888888888888888188888888
              88888887F88888888888888118888888888888877F8888888888888111888888
              8888888777F888888888888811100008888888887777777888888888810E8E80
              88888888877888878888888880E8E8E80888888887F8888878888888808E8E8E
              0888888887F888887888888880E8E8E80888888887F8888878888888808E8E8E
              08888888878F8888788888888808E8E0888888888878FFF78888888888800008
              8888888888877778888888888888888888888888888888888888888888888888
              8888888888888888888888888888888888888888888888888888}
            NumGlyphs = 2
          end
        end
        object ckAuto: TCheckBox
          Left = 211
          Top = 32
          Width = 145
          Height = 17
          Caption = 'Processar automatico'
          Checked = True
          State = cbChecked
          TabOrder = 1
        end
        object edQtde: TEdit
          Left = 358
          Top = 30
          Width = 49
          Height = 21
          TabOrder = 2
          Text = '2'
        end
      end
      object GroupBox2: TGroupBox
        Left = 505
        Top = 1
        Width = 397
        Height = 150
        Align = alClient
        Caption = ' Listas para Manutenção '
        TabOrder = 1
        object Label1: TLabel
          Left = 7
          Top = 32
          Width = 283
          Height = 13
          Caption = 'Informe lista clone inicial para (re)processamento:'
        end
        object Label2: TLabel
          Left = 7
          Top = 58
          Width = 257
          Height = 13
          Caption = 'Informe lista clone final (parametro opcional):'
        end
        object Label3: TLabel
          Left = 8
          Top = 96
          Width = 375
          Height = 35
          AutoSize = False
          Caption = 
            '(se não for informada uma lista Final, todas as listas maiores q' +
            'ue a Inicial terão o Status alterado para 0 - Para Processamento' +
            ')'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          WordWrap = True
        end
        object edListaIni: TEdit
          Left = 294
          Top = 26
          Width = 81
          Height = 21
          TabOrder = 0
          OnKeyPress = edListaIniKeyPress
        end
        object edListaFim: TEdit
          Left = 294
          Top = 52
          Width = 81
          Height = 21
          TabOrder = 1
          OnKeyPress = edListaFimKeyPress
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 496
    Width = 905
    inherited tb97Fundo: TToolbar97
      Left = 607
      DockPos = 607
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 438
      DockPos = 438
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 947
    Top = 51
    TargetsData = (
      1
      1
      (
        ''
        'Filter'
        0))
  end
  object qryListaOri: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT LF.IDLISTA ||'#39' - '#39'|| LF.NOME AS LISTA,'
      '       PC.ZERO, PC.FALTA, PC.FALHA, PC.FINAL, LF.IDLISTA'
      '  FROM LISTAFOLHABENEF LF'
      '  JOIN (SELECT P.IDSEQEXECPREVIA, P.IDLISTAORIGEM, '
      '               SUM(DECODE(P.FLGPROCESSADO, 0, 1, 0)) AS ZERO,'
      
        '               SUM(DECODE(P.FLGPROCESSADO, 0, 1, 3, 1, 0)) AS FA' +
        'LTA,'
      '               SUM(DECODE(P.FLGPROCESSADO, 1, 1, 0)) AS FALHA,'
      
        '               SUM(DECODE(P.FLGPROCESSADO, 2, 1, 0)) AS FINAL   ' +
        '            '
      '          FROM PREVIA_CONTROLE P'
      '         WHERE P.IDSEQEXECPREVIA = :IDSEQEXEC'
      '          GROUP BY P.IDSEQEXECPREVIA, P.IDLISTAORIGEM'
      '       ) PC'
      '    ON PC.IDLISTAORIGEM = LF.IDLISTA '
      'ORDER BY LF.IDLISTA'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 242
    Top = 154
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDSEQEXEC'
        ParamType = ptUnknown
      end>
  end
  object dsListaOri: TDataSource
    DataSet = qryListaOri
    Left = 200
    Top = 152
  end
  object dsListaFilha: TDataSource
    DataSet = qryListaFilha
    Left = 81
    Top = 205
  end
  object qryListaFilha: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 80
    Top = 256
  end
  object qryAlt: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 440
    Top = 224
  end
  object popSelLista: TPopupMenu
    Left = 145
    Top = 285
    object Inicial1: TMenuItem
      Caption = 'Inicial'
      OnClick = Inicial1Click
    end
    object Final1: TMenuItem
      Caption = 'Final'
      OnClick = Final1Click
    end
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 352
    Top = 224
  end
end
