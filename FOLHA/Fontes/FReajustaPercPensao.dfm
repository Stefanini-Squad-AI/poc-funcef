inherited frmReajustaPercPensao: TfrmReajustaPercPensao
  Left = 59
  Top = 79
  HelpContext = 180006
  Caption = 'Atualização de Pensão Alimentícia para Benefíciários '
  ClientHeight = 429
  ClientWidth = 710
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 710
    Height = 390
    object grpMesRef: TGroupBox
      Left = 1
      Top = 1
      Width = 708
      Height = 60
      Align = alTop
      Caption = ' Mês e Ano de Cobrança'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object Label1: TLabel
        Left = 211
        Top = 29
        Width = 416
        Height = 13
        Caption = 
          'Quantidade de execuções deste processo  para o Mês/Ano de Cobran' +
          'ça selecionado : '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object cmbMes: TComboBox
        Left = 8
        Top = 25
        Width = 121
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemHeight = 13
        ParentFont = False
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
      object spnedAno: TSpinEdit
        Left = 138
        Top = 25
        Width = 63
        Height = 22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxValue = 0
        MinValue = 0
        ParentFont = False
        TabOrder = 1
        Value = 0
      end
      object pnlExecucoes: TPanel
        Left = 630
        Top = 25
        Width = 49
        Height = 21
        Alignment = taRightJustify
        BevelInner = bvLowered
        BevelOuter = bvLowered
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
      end
    end
    object pgcOpcoes: TPageControl
      Left = 1
      Top = 61
      Width = 708
      Height = 328
      ActivePage = tbsResultado
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Visible = False
      object tbsResultado: TTabSheet
        Caption = 'Resultado'
        object Panel6: TPanel
          Left = 594
          Top = 0
          Width = 106
          Height = 300
          Align = alRight
          TabOrder = 0
          object bbtnSavlar: TBitBtn
            Left = 4
            Top = 4
            Width = 100
            Height = 41
            Caption = 'S&alvar'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            OnClick = bbtnSavlarClick
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
        end
        object Panel7: TPanel
          Left = 0
          Top = 0
          Width = 594
          Height = 300
          Align = alClient
          Caption = 'Panel7'
          TabOrder = 1
          object PnlProgress: TPanel
            Left = 1
            Top = 186
            Width = 592
            Height = 113
            Align = alBottom
            BevelInner = bvRaised
            BorderStyle = bsSingle
            TabOrder = 0
            Visible = False
            object lblTitLote: TLabel
              Left = 4
              Top = 8
              Width = 710
              Height = 16
              Alignment = taCenter
              Anchors = [akLeft, akTop, akRight]
              AutoSize = False
              Caption = 'Processando os Cálculos'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -13
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Mensagem: TLabel
              Left = 6
              Top = 56
              Width = 407
              Height = 13
              AutoSize = False
              Caption = 'Mensagem'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object lblPatro: TLabel
              Left = 3
              Top = 29
              Width = 711
              Height = 13
              Alignment = taCenter
              Anchors = [akLeft, akTop, akRight]
              AutoSize = False
              Caption = 'Patrocinadora'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblContagem: TLabel
              Left = 6
              Top = 93
              Width = 704
              Height = 13
              Anchors = [akLeft, akTop, akRight]
              AutoSize = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object ProgressBar1: TProgressBar
              Left = 8
              Top = 76
              Width = 703
              Height = 13
              Anchors = [akLeft, akTop, akRight]
              Min = 0
              Max = 100
              Step = 1
              TabOrder = 0
            end
          end
          object memResult: TMemo
            Left = 1
            Top = 1
            Width = 592
            Height = 185
            Align = alClient
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            ScrollBars = ssVertical
            TabOrder = 1
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 390
    Width = 710
    inherited tb97Fundo: TToolbar97
      Left = 367
      inherited sep1: TToolbarSep97
        Left = 282
      end
      inherited sep3: TToolbarSep97
        Left = 198
      end
      inherited bbtnSair: TBitBtn
        Left = 117
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 201
      end
      object bbtnPreparo: TBitBtn
        Left = 0
        Top = 0
        Width = 117
        Height = 33
        Caption = '&Processar'
        TabOrder = 2
        OnClick = bbtnPreparoClick
        Kind = bkOK
        Spacing = 2
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited bbtnConfirmar: TBitBtn
        Visible = False
      end
      inherited bbtnCancelar: TBitBtn
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 675
    Top = 371
    TargetsData = (
      1
      1
      (
        'TMemo'
        'Text'
        0))
  end
  object SaveDlg: TSaveDialog
    DefaultExt = '.txt'
    Filter = 'Arquivos texto|*.txt|Todos os arquivos|*.*'
    InitialDir = 'c:\'
    Title = 'Salvar relatório do Envio de Benefícios'
    Left = 541
    Top = 284
  end
end
