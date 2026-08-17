object frmProgresso_GeraCalc: TfrmProgresso_GeraCalc
  Left = 136
  Top = 239
  BorderStyle = bsNone
  Caption = 'frmProgresso_GeraCalc'
  ClientHeight = 129
  ClientWidth = 557
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlFundo: TPanel
    Left = 0
    Top = 0
    Width = 557
    Height = 129
    Align = alClient
    TabOrder = 0
    object lblTempoDecorr: TLabel
      Left = 467
      Top = 84
      Width = 77
      Height = 18
      AutoSize = False
      Caption = '00:00:00'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -15
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object gagTotal: TGauge
      Left = 8
      Top = 104
      Width = 540
      Height = 17
      Color = clBlack
      ForeColor = clNavy
      Font.Charset = ANSI_CHARSET
      Font.Color = clLime
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Progress = 50
    end
    object lblQtdeFunc: TLabel
      Left = 218
      Top = 84
      Width = 97
      Height = 18
      AutoSize = False
      Caption = 'Qtde: 0'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -15
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblPessoa: TLabel
      Left = 8
      Top = 65
      Width = 540
      Height = 18
      AutoSize = False
      Caption = 
        'Matr: 1234567890123  Nome: 1234567890123456789012345678901234567' +
        '890123456789'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object fclblTitulo: TfcLabel
      Left = 8
      Top = 1
      Width = 540
      Height = 33
      AutoSize = False
      Caption = 'Gerando Folha de Pagamento'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -27
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
      TextOptions.Alignment = taCenter
      TextOptions.LineSpacing = 1
      TextOptions.Shadow.Enabled = True
      TextOptions.Shadow.XOffset = 1
      TextOptions.Shadow.YOffset = 2
      TextOptions.VAlignment = vaTop
      Transparent = True
    end
    object Bevel11: TBevel
      Left = 8
      Top = 39
      Width = 540
      Height = 6
      Shape = bsTopLine
      Style = bsRaised
    end
    object lblProcesso: TLabel
      Left = 8
      Top = 44
      Width = 540
      Height = 18
      Alignment = taCenter
      AutoSize = False
      Caption = 'lblProcesso'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblHoraIni: TLabel
      Left = 25
      Top = 84
      Width = 177
      Height = 18
      AutoSize = False
      Caption = 'Hora de Início: hh:mm:ss'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -15
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label18: TLabel
      Left = 335
      Top = 84
      Width = 127
      Height = 18
      AutoSize = False
      Caption = 'Tempo Decorrido:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -15
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
end
