inherited frmEncerraExercicioMT: TfrmEncerraExercicioMT
  Left = 211
  Top = 194
  Caption = 'Encerramento do Exercício'
  ClientHeight = 303
  ClientWidth = 455
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 455
    Height = 264
    object Label3: TLabel
      Left = 24
      Top = 24
      Width = 55
      Height = 13
      Caption = 'Exercício'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 24
      Top = 111
      Width = 65
      Height = 13
      Caption = 'Mensagens'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtExercicio: TEdit
      Left = 24
      Top = 40
      Width = 89
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 0
    end
    object prbImportar: TProgressBar
      Left = 128
      Top = 40
      Width = 305
      Height = 21
      Min = 0
      Max = 100
      Step = 1
      TabOrder = 1
    end
    object cbSimulacao: TCheckBox
      Left = 24
      Top = 75
      Width = 409
      Height = 17
      Caption = 'Passar somente os saldos sem proceder o encerramento'
      TabOrder = 2
    end
    object mmStatus: TRichEdit
      Left = 24
      Top = 126
      Width = 409
      Height = 121
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 3
    end
    object Anim: TAnimate
      Left = 129
      Top = 39
      Width = 16
      Height = 16
      Active = False
      AutoSize = False
      CommonAVI = aviFindFile
      StopFrame = 8
      Visible = False
    end
  end
  inherited Dock971: TDock97
    Top = 264
    Width = 455
    inherited tb97Fundo: TToolbar97
      Left = 202
      DockPos = 288
      inherited sep1: TToolbarSep97
        Left = 166
      end
      object ToolbarSep971: TToolbarSep97 [1]
        Left = 80
        Top = 0
        Blank = True
        SizeHorz = 5
      end
      inherited bbtnSair: TBitBtn
        Left = 85
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 168
      end
      object btnEncerrar: TBitBtn
        Left = 0
        Top = 0
        Width = 80
        Height = 33
        Cancel = True
        Caption = '&Encerrar'
        TabOrder = 2
        OnClick = btnEncerrarClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888000008888888888F777778FF888888005555500
          88888887788888778F88887555555555088888788888888878F887D558855555
          508887F88FFF888887F887D5FFF8555550888788777FF888878F7D55FFFF8555
          55087F887777FF88887F7D55FFFFF85555087F8877777FF8887F7D55FF8FFF85
          55087F8877F777FF887F7D55FF85FFF855087F8877F8777F887F7D55FF555FF8
          550878F87788877FF87887D5555555FF508887F88888887787F887D555555555
          5088878F888888888788887DD555555508888878FF88888F788888877DDDDD77
          8888888778FFFF77888888888777778888888888877777888888}
        NumGlyphs = 2
        Spacing = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Top = 267
    TargetsData = (
      1
      1
      (
        'TRichEdit'
        'Text'
        0))
  end
end
