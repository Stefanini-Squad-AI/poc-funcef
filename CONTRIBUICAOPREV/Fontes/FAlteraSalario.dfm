inherited FrmAlteraSalario: TFrmAlteraSalario
  Left = 621
  Top = 331
  BorderStyle = bsDialog
  Caption = 'Alterar Salário de Manutenção'
  ClientHeight = 151
  ClientWidth = 277
  Font.Height = -9
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  object lblMatricula: TLabel [0]
    Left = 87
    Top = 9
    Width = 108
    Height = 13
    Caption = 'Matrícula 1234567'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object GroupBox1: TGroupBox [1]
    Left = 15
    Top = 32
    Width = 249
    Height = 65
    TabOrder = 0
    object lblSalario: TLabel
      Left = 10
      Top = 17
      Width = 71
      Height = 26
      Caption = 'Salário de '#13'Manutenção'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtSalario: TRealEdit
      Left = 112
      Top = 20
      Width = 121
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '0,00')
      TabOrder = 0
      WordWrap = False
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fFixed
      Signal = False
    end
  end
  object btnAlteraSalario: TBitBtn [2]
    Left = 93
    Top = 104
    Width = 91
    Height = 33
    Caption = '&OK'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ModalResult = 1
    ParentFont = False
    TabOrder = 1
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      0400000000000001000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
      8888888888FFFFF8888888888000008888888888F777778FF888888002222200
      88888887788888778F88887222222222088888788888888878F887A228822222
      208887F88FFF888887F887A2FFF8222220888788777FF888878F7A22FFFF8222
      22087F887777FF88887F7A22FFFFF82222087F8877777FF8887F7A22FF8FFF82
      22087F8877F777FF887F7A22FF82FFF822087F8877F8777F887F7A22FF222FF8
      220878F87788877FF87887A2222222FF208887F88888887787F887A222222222
      2088878F888888888788887AA222222208888878FF88888F788888877AAAAA77
      8888888778FFFF77888888888777778888888888877777888888}
    NumGlyphs = 2
  end
end
