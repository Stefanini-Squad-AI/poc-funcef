inherited frmLerOpcoesContribInscricao: TfrmLerOpcoesContribInscricao
  Left = 248
  Top = 178
  Caption = 'Informe as Opções de Contribuição'
  ClientHeight = 263
  ClientWidth = 512
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 512
    Height = 224
    Font.Style = []
    ParentFont = False
    object lblNomeContrib: TLabel
      Left = 17
      Top = 18
      Width = 88
      Height = 16
      Caption = 'Contribuição'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblOp1: TLabel
      Left = 17
      Top = 59
      Width = 41
      Height = 13
      Caption = 'Opção 1'
    end
    object lblOp2: TLabel
      Left = 17
      Top = 107
      Width = 41
      Height = 13
      Caption = 'Opção 2'
    end
    object lblOp3: TLabel
      Left = 17
      Top = 155
      Width = 41
      Height = 13
      Caption = 'Opção 3'
    end
    object edOp1: TEditNum
      Left = 17
      Top = 74
      Width = 121
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnExit = edOp1Exit
      IntDigits = 12
      Signal = False
      DecDigits = 6
      Numeric = True
    end
    object edOp2: TEditNum
      Left = 17
      Top = 121
      Width = 121
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnExit = edOp2Exit
      IntDigits = 12
      Signal = False
      DecDigits = 6
      Numeric = True
    end
    object edOp3: TEditNum
      Left = 17
      Top = 169
      Width = 121
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnExit = edOp3Exit
      IntDigits = 12
      Signal = False
      DecDigits = 6
      Numeric = True
    end
  end
  inherited Dock971: TDock97
    Top = 224
    Width = 512
    inherited tb97Fundo: TToolbar97
      Left = 296
      DockPos = 296
      inherited sep3: TToolbarSep97
        Left = 160
      end
      inherited bbtnSair: TBitBtn
        Left = 80
        Visible = False
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 0
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 128
      DockPos = 128
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 410
    Top = 6
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
end
