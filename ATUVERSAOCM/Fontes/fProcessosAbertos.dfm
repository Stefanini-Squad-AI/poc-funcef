object frmProcessosAbertos: TfrmProcessosAbertos
  Left = 639
  Top = 340
  BorderStyle = bsToolWindow
  Caption = 'Atualizador de Versões Planus'
  ClientHeight = 296
  ClientWidth = 334
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object mmProcAbertos: TMemo
    Left = 0
    Top = 25
    Width = 334
    Height = 240
    Align = alTop
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 334
    Height = 25
    Align = alTop
    Caption = 'Panel1'
    TabOrder = 1
    object Label1: TLabel
      Left = 0
      Top = 7
      Width = 217
      Height = 13
      Caption = 'Os aplicativos abaixo deverão ser finalizados!!'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
  end
  object btnContinuar: TButton
    Left = 0
    Top = 271
    Width = 166
    Height = 25
    Caption = 'Continuar'
    TabOrder = 2
    OnClick = btnContinuarClick
  end
  object btnCancelar: TButton
    Left = 167
    Top = 271
    Width = 166
    Height = 25
    Caption = 'Cancelar Atualização'
    TabOrder = 3
    OnClick = btnCancelarClick
  end
  object tmVerificaProcessos: TTimer
    Enabled = False
    Interval = 2000
    OnTimer = tmVerificaProcessosTimer
    Left = 8
    Top = 32
  end
end
