object fraMensagem: TfraMensagem
  Left = 0
  Top = 0
  Width = 454
  Height = 32
  TabOrder = 0
  object pnlProgresso: TPanel
    Left = 0
    Top = 0
    Width = 454
    Height = 32
    Align = alClient
    BevelOuter = bvLowered
    TabOrder = 0
    object pnlProgressoMensagem: TPanel
      Left = 1
      Top = 1
      Width = 195
      Height = 30
      Align = alLeft
      TabOrder = 0
      object lblProgressoMensagem: TfcLabel
        Left = 1
        Top = 1
        Width = 193
        Height = 28
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TextOptions.Alignment = taLeftJustify
        TextOptions.VAlignment = vaVCenter
        TextOptions.WordWrap = True
      end
    end
    object pnlProgressoBarra: TPanel
      Left = 196
      Top = 1
      Width = 257
      Height = 30
      Align = alClient
      TabOrder = 1
      object pgbProcesso: TProgressBar
        Left = 1
        Top = 1
        Width = 255
        Height = 28
        Align = alClient
        Min = 0
        Max = 100
        Step = 1
        TabOrder = 0
      end
    end
  end
end
