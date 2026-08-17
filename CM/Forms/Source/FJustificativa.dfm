object frmJustificativa: TfrmJustificativa
  Left = 605
  Top = 217
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsDialog
  Caption = 'Justificativa para não avaliação do Fornecedor'
  ClientHeight = 219
  ClientWidth = 429
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 180
    Width = 429
    Height = 39
    Align = alBottom
    TabOrder = 1
    object btnOK: TBitBtn
      Left = 175
      Top = 5
      Width = 81
      Height = 28
      Caption = 'OK'
      Default = True
      TabOrder = 0
      OnClick = btnOKClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
  end
  object gbrJustificativa: TGroupBox
    Left = 0
    Top = 0
    Width = 429
    Height = 180
    Align = alClient
    Caption = 'Justificativa'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object MemJustificativa: TMemo
      Left = 2
      Top = 15
      Width = 425
      Height = 163
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ScrollBars = ssBoth
      TabOrder = 0
    end
  end
  object qryJustificativa: TQuery
    DatabaseName = 'BASEDADOS'
    Left = 328
    Top = 40
  end
  object qrySeq: TQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      'SELECT CM.SEQAVAL.NEXTVAL SEQ FROM DUAL')
    Left = 208
    Top = 56
    object qrySeqSEQ: TFloatField
      FieldName = 'SEQ'
    end
  end
end
