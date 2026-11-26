inherited frmMsg: TfrmMsg
  Left = 294
  Top = 221
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'frmMsg'
  ClientHeight = 381
  ClientWidth = 669
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 669
    Height = 342
    object Memo: TMemo
      Left = 5
      Top = 5
      Width = 659
      Height = 332
      Align = alClient
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 0
    end
  end
  inherited Dock971: TDock97
    Top = 342
    Width = 669
    inherited tb97Fundo: TToolbar97
      inherited bbtnAjuda: TmaHelpBitBtn
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 3
    Top = 331
    TargetsData = (
      1
      1
      (
        'TMemo'
        'Text'
        0))
  end
end
