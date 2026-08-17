inherited frmGeraSaidaCadatral: TfrmGeraSaidaCadatral
  Left = 387
  Top = 193
  HelpContext = 180061
  Caption = 'Gera Saída Cadastral para Entidades'
  ClientHeight = 403
  ClientWidth = 617
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 617
    Height = 364
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 615
      Height = 57
      Align = alTop
      Caption = 'Panel1'
      TabOrder = 0
      object Panel3: TPanel
        Left = 1
        Top = 1
        Width = 187
        Height = 55
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 0
        object Label15: TLabel
          Left = 8
          Top = 10
          Width = 160
          Height = 13
          Caption = 'Mês/Ano de Processamento'
        end
        object cboMes: TComboBox
          Left = 8
          Top = 24
          Width = 113
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 0
          OnExit = cboMesExit
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
        object DBspnAno: TwwDBSpinEdit
          Left = 120
          Top = 24
          Width = 61
          Height = 21
          Increment = 1
          TabOrder = 1
          UnboundDataType = wwDefault
          OnExit = cboMesExit
        end
      end
      object Panel5: TPanel
        Left = 188
        Top = 1
        Width = 426
        Height = 55
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object Label3: TLabel
          Left = 0
          Top = 0
          Width = 426
          Height = 13
          Align = alTop
          Alignment = taCenter
          Caption = 'Versões de Pagamento'
        end
        inline molVersaoPagto: TmolVersaoPagto
          Top = 13
          Width = 426
          Height = 42
          Align = alClient
          inherited lstVersao: TCheckListBox
            Align = alClient
            OnClick = molVersaoPagtolstVersaoClick
          end
          inherited sqlVersaoPagto: TCMSqlParams
            Left = 80
            Top = 0
          end
          inherited cdsVersaoPagto: TCMClientDataSet
            Top = 0
          end
        end
      end
    end
    object Panel4: TPanel
      Left = 1
      Top = 223
      Width = 615
      Height = 140
      Align = alBottom
      TabOrder = 1
      object memResult: TMemo
        Left = 1
        Top = 52
        Width = 613
        Height = 87
        Align = alBottom
        ReadOnly = True
        TabOrder = 0
      end
      object GroupBox2: TGroupBox
        Left = 1
        Top = 1
        Width = 613
        Height = 46
        Align = alTop
        Caption = ' Caminho para geração dos arquivos '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object pnlLblDiretorio: TPanel
          Left = 11
          Top = 16
          Width = 542
          Height = 21
          BevelOuter = bvNone
          BorderStyle = bsSingle
          Color = clCaptionText
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object lblDiretorio: TLabel
            Left = 4
            Top = 2
            Width = 15
            Height = 13
            Caption = 'C:\'
          end
        end
        object btnEscolheDir: TBitBtn
          Left = 567
          Top = 16
          Width = 27
          Height = 21
          Hint = 'Seleciona a Pasta que será gravado os arquivos para banco'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnClick = btnEscolheDirClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00303333333333
            333337F3333333333333303333333333333337F33FFFFF3FF3FF303300000300
            300337FF77777F77377330000BBB0333333337777F337F33333330330BB00333
            333337F373F773333333303330033333333337F3377333333333303333333333
            333337F33FFFFF3FF3FF303300000300300337FF77777F77377330000BBB0333
            333337777F337F33333330330BB00333333337F373F773333333303330033333
            333337F3377333333333303333333333333337FFFF3FF3FFF333000003003000
            333377777F77377733330BBB0333333333337F337F33333333330BB003333333
            333373F773333333333330033333333333333773333333333333}
          NumGlyphs = 2
        end
      end
      object memSaida: TMemo
        Left = 520
        Top = 64
        Width = 81
        Height = 57
        TabOrder = 2
        Visible = False
      end
    end
    object pnlCodRub: TPanel
      Left = 1
      Top = 58
      Width = 615
      Height = 165
      Align = alClient
      TabOrder = 2
      object lblFavorecidos: TLabel
        Left = 1
        Top = 1
        Width = 613
        Height = 13
        Align = alTop
        Alignment = taCenter
        Caption = 'Favorecidos para Gerar Saída Cadastral'
      end
      object chkFavorecido: TCheckListBox
        Left = 1
        Top = 14
        Width = 613
        Height = 150
        Align = alClient
        ItemHeight = 13
        TabOrder = 0
      end
    end
  end
  inherited Dock971: TDock97
    Top = 364
    Width = 617
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 1035
    Top = 65499
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 573
    Top = 55
  end
  object pdirdlgPasta: TProcuraDirDlg
    Caption = 'Seleção de pasta'
    Directory = 
      'LANOPREV, DATAEFETIVADO '#39'                                       ' +
      '+ #1h'#1#0#0'{'#0#0#0#0#0#0#0'k'#0#0#0'      '#39'  FROM '#39'                             ' +
      '                                                        + #1à'#1#0#0 +
      '{'#0#0#0#0#0#0#0'k'#0#0#0'      '#39'    EVENTOSPREV '#39'                            ' +
      '    '
    Folder = foCustom
    ShowPath = False
    Title = 
      'Navegue na árvore de pastas e selecione o caminho desejado para ' +
      'gravação dos arquivos.'
    Left = 521
    Top = 50
  end
end
