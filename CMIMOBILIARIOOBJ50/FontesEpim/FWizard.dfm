inherited frmWizard: TfrmWizard
  Left = 71
  Top = 109
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = ''
  ClientHeight = 436
  ClientWidth = 644
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 644
    Height = 354
    object lblTitulo: TfcLabel
      Left = 16
      Top = 8
      Width = 305
      Height = 24
      Caption = 'Nome do Formulário [ página ]'
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -21
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TextOptions.Alignment = taLeftJustify
      TextOptions.Style = fclsRaised
      TextOptions.VAlignment = vaTop
    end
  end
  inherited Dock971: TDock97
    Top = 403
    Width = 644
    inherited tb97Fundo: TToolbar97
      Left = 421
    end
  end
  object Panel2: TPanel [2]
    Left = 0
    Top = 354
    Width = 644
    Height = 49
    Align = alBottom
    TabOrder = 2
    object lblProgress: TLabel
      Left = 16
      Top = 10
      Width = 75
      Height = 13
      Caption = 'Blá Blá Blá...'
      Visible = False
    end
    object lblContador: TLabel
      Left = 628
      Top = 10
      Width = 93
      Height = 13
      Alignment = taRightJustify
      Caption = '00000 de 00000'
      Visible = False
    end
    object ProgressBar: TProgressBar
      Left = 16
      Top = 24
      Width = 705
      Height = 16
      Min = 0
      Max = 100
      Step = 1
      TabOrder = 0
      Visible = False
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      2
      (
        'TRealEdit'
        'Text'
        0)
      (
        'TMemo'
        'Text'
        0))
  end
end
