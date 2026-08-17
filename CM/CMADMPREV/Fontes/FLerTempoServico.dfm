inherited frmLerTempoServico: TfrmLerTempoServico
  Left = 250
  Top = 171
  Caption = 'Simulação de Benefício '
  ClientHeight = 152
  ClientWidth = 339
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 339
    Height = 113
    object Label1: TLabel
      Left = 24
      Top = 16
      Width = 263
      Height = 13
      Caption = 'Informe o Tempo de Serviço do Participante : '
    end
    object pnlTempoServTotal: TPanel
      Left = 40
      Top = 42
      Width = 224
      Height = 57
      BevelOuter = bvNone
      TabOrder = 0
      object Label12: TLabel
        Left = 5
        Top = 2
        Width = 121
        Height = 27
        AutoSize = False
        Caption = 'Tempo de Serviço Total Informado'
        WordWrap = True
      end
      object Label14: TLabel
        Left = 46
        Top = 39
        Width = 28
        Height = 13
        Caption = 'anos'
      end
      object Label15: TLabel
        Left = 115
        Top = 39
        Width = 36
        Height = 13
        Caption = 'meses'
      end
      object Label16: TLabel
        Left = 194
        Top = 39
        Width = 24
        Height = 13
        Caption = 'dias'
      end
      object edTempoServTotal: TEditNum
        Left = 5
        Top = 31
        Width = 38
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 10
        ParentFont = False
        TabOrder = 0
        IntDigits = 10
        Signal = False
        DecDigits = 0
        Numeric = False
      end
      object edTempoServMes: TEditNum
        Left = 75
        Top = 31
        Width = 38
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 10
        ParentFont = False
        TabOrder = 1
        IntDigits = 10
        Signal = False
        DecDigits = 0
        Numeric = False
      end
      object edTempoServDia: TEditNum
        Left = 153
        Top = 31
        Width = 38
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 10
        ParentFont = False
        TabOrder = 2
        IntDigits = 10
        Signal = False
        DecDigits = 0
        Numeric = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 113
    Width = 339
    inherited tb97Fundo: TToolbar97
      Left = 168
      DockPos = 168
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 0
      DockPos = 0
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 11
    Top = 235
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
end
Š
