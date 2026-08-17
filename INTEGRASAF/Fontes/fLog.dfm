inherited FrmLog: TFrmLog
  Left = 260
  Top = 127
  Caption = 'Log de Operações'
  ClientHeight = 400
  ClientWidth = 676
  WindowState = wsMaximized
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 676
    Height = 361
    object ReLog: TRichEdit
      Left = 5
      Top = 5
      Width = 666
      Height = 351
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      HideScrollBars = False
      ParentFont = False
      PlainText = True
      ReadOnly = True
      ScrollBars = ssBoth
      TabOrder = 0
    end
  end
  inherited Dock971: TDock97
    Top = 361
    Width = 676
    Visible = False
  end
  inherited ivTradutor: TIvExtendedTranslator
    Top = 115
  end
end
