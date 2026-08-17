inherited frmAcertoRetroativo: TfrmAcertoRetroativo
  Left = -4
  Top = 71
  BorderIcons = []
  Caption = 'Acerto de Contribuições'
  ClientHeight = 480
  ClientWidth = 781
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 781
    Height = 441
    object PageControl1: TPageControl
      Left = 5
      Top = 5
      Width = 771
      Height = 431
      ActivePage = tbgrid
      Align = alClient
      TabOrder = 0
      TabStop = False
      object tbgrid: TTabSheet
        Caption = 'Contribuições'
        object stgridacerto: TStringGrid
          Left = 0
          Top = 0
          Width = 763
          Height = 403
          Hint = 'Clique com o botão da direita para funções de cálculo'
          Align = alClient
          ColCount = 4
          DefaultColWidth = 67
          DefaultRowHeight = 20
          FixedColor = 13224393
          FixedCols = 3
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing, goAlwaysShowEditor]
          ParentFont = False
          ParentShowHint = False
          PopupMenu = popupmenuop
          ShowHint = True
          TabOrder = 0
          OnKeyDown = stgridacertoKeyDown
          OnSelectCell = stgridacertoSelectCell
          ColWidths = (
            227
            74
            299
            114)
          RowHeights = (
            20
            20
            20
            21
            20)
        end
      end
      object tbtresult: TTabSheet
        Caption = 'Resultado'
        TabVisible = False
        object RichEdAdaptacao: TRichEdit
          Left = 276
          Top = 102
          Width = 185
          Height = 89
          Lines.Strings = (
            'RichEdAdaptacao')
          TabOrder = 3
          Visible = False
        end
        object BitBtn2: TBitBtn
          Left = 672
          Top = 41
          Width = 90
          Height = 35
          Caption = '&Imprimir'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnClick = BitBtn2Click
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
            0003377777777777777308888888888888807F33333333333337088888888888
            88807FFFFFFFFFFFFFF7000000000000000077777777777777770F8F8F8F8F8F
            8F807F333333333333F708F8F8F8F8F8F9F07F333333333337370F8F8F8F8F8F
            8F807FFFFFFFFFFFFFF7000000000000000077777777777777773330FFFFFFFF
            03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
            03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
            33333337F3F37F3733333330F08F0F0333333337F7337F7333333330FFFF0033
            33333337FFFF7733333333300000033333333337777773333333}
          NumGlyphs = 2
        end
        object BitBtn1: TBitBtn
          Left = 672
          Top = 1
          Width = 90
          Height = 35
          Caption = 'S&alvar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          OnClick = BitBtn1Click
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
        object memdemo: TMemo
          Left = 0
          Top = 0
          Width = 667
          Height = 0
          Align = alLeft
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          ScrollBars = ssVertical
          TabOrder = 2
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 441
    Width = 781
    inherited tb97Fundo: TToolbar97
      Left = 611
      DockPos = 611
      inherited bbtnSair: TBitBtn
        Caption = '&Terminar'
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 443
      DockPos = 443
      inherited bbtnConfirmar: TBitBtn
        Caption = '&Avançar'
        OnClick = bbtnConfirmarClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333333333333333333333333333333333333333333333
          3333333333333333333333333333333333333333333FF3333333333333003333
          3333333333773FF3333333333309003333333333337F773FF333333333099900
          33333FFFFF7F33773FF30000000999990033777777733333773F099999999999
          99007FFFFFFF33333F7700000009999900337777777F333F7733333333099900
          33333333337F3F77333333333309003333333333337F77333333333333003333
          3333333333773333333333333333333333333333333333333333333333333333
          3333333333333333333333333333333333333333333333333333}
        Kind = bkCustom
      end
      inherited bbtnCancelar: TBitBtn
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object popupmenuop: TPopupMenu
    Left = 320
    Top = 192
    object CalcularContribuio1: TMenuItem
      Caption = 'Calcular Todas as Contribuição'
      OnClick = CalcularContribuio1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object C1: TMenuItem
      Caption = 'Calcular Contribuição Marcada'
      OnClick = C1Click
    end
  end
  object SaveDlg: TSaveDialog
    DefaultExt = '.txt'
    Filter = 'Arquivos texto|*.txt|Todos os arquivos|*.*'
    InitialDir = 'c:\'
    Title = 'Salvar Resultado'
    Left = 678
    Top = 8
  end
  object qryaux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 201
    Top = 181
  end
end
CIPACAOCurrency	
