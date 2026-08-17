object Frm_CadEndereco_EnvioPeriodico: TFrm_CadEndereco_EnvioPeriodico
  Left = 355
  Top = 119
  BorderIcons = []
  BorderStyle = bsToolWindow
  Caption = 'Atualização de Endereço'
  ClientHeight = 193
  ClientWidth = 425
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 8
    Top = 8
    Width = 54
    Height = 13
    Caption = 'Logradouro'
    FocusControl = dbedtLOGRADOURO
  end
  object lbl2: TLabel
    Left = 248
    Top = 56
    Width = 27
    Height = 13
    Caption = 'Bairro'
    FocusControl = dbedtBAIRRO
  end
  object lbl3: TLabel
    Left = 8
    Top = 56
    Width = 33
    Height = 13
    Caption = 'Cidade'
    FocusControl = dbedtCIDADE
  end
  object lbl4: TLabel
    Left = 8
    Top = 104
    Width = 21
    Height = 13
    Caption = 'CEP'
    FocusControl = dbedtCEP
  end
  object lbl5: TLabel
    Left = 192
    Top = 56
    Width = 33
    Height = 13
    Caption = 'Estado'
    FocusControl = dbedtUF
  end
  object dbtxtIDPESSOA: TDBText
    Left = 136
    Top = 120
    Width = 113
    Height = 17
    DataField = 'IDPESSOA'
    DataSource = ds_Inco
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object dbtxtIDENDERECO: TDBText
    Left = 256
    Top = 120
    Width = 113
    Height = 17
    DataField = 'IDENDERECO'
    DataSource = ds_Inco
    Visible = False
  end
  object lbl6: TLabel
    Left = 136
    Top = 104
    Width = 50
    Height = 13
    Caption = 'Id Pessoa:'
    FocusControl = dbedtCEP
    Visible = False
  end
  object lbl7: TLabel
    Left = 256
    Top = 104
    Width = 61
    Height = 13
    Caption = 'Id Endereço:'
    FocusControl = dbedtCEP
    Visible = False
  end
  object dbedtLOGRADOURO: TDBEdit
    Left = 8
    Top = 24
    Width = 393
    Height = 21
    DataField = 'LOGRADOURO'
    DataSource = ds_Inco
    TabOrder = 0
  end
  object dbedtBAIRRO: TDBEdit
    Left = 248
    Top = 72
    Width = 153
    Height = 21
    DataField = 'BAIRRO'
    DataSource = ds_Inco
    TabOrder = 3
  end
  object dbedtCIDADE: TDBEdit
    Left = 8
    Top = 72
    Width = 177
    Height = 21
    DataField = 'CIDADE'
    DataSource = ds_Inco
    TabOrder = 1
  end
  object dbedtCEP: TDBEdit
    Left = 8
    Top = 120
    Width = 113
    Height = 21
    DataField = 'CEP'
    DataSource = ds_Inco
    TabOrder = 4
  end
  object dbedtUF: TDBEdit
    Left = 192
    Top = 72
    Width = 41
    Height = 21
    DataField = 'UF'
    DataSource = ds_Inco
    TabOrder = 2
  end
  object btnConfirmar: TBitBtn
    Left = 124
    Top = 156
    Width = 79
    Height = 33
    BiDiMode = bdLeftToRight
    Caption = '&OK'
    Default = True
    ModalResult = 1
    ParentBiDiMode = False
    TabOrder = 5
    OnClick = btnConfirmarClick
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
  object btnCancelar: TBitBtn
    Left = 206
    Top = 156
    Width = 79
    Height = 33
    Cancel = True
    Caption = '&Cancelar'
    ModalResult = 2
    TabOrder = 6
    OnClick = btnCancelarClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      0400000000000001000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
      8888888888FFFFF8888888888000008888888888F777778FF888888009191900
      88888887788888778F88887991919191088888788888888878F8879919191919
      108887F888F888F887F887917F919F719088878887FF87FF878F7919FFF9FFF9
      19087F88777F7778887F79919FFFFF9191087F8887777788887F791919FFF919
      19087F8888777FF8887F79919FFFFF9191087F88877777FF887F7919FFF9FFF9
      190878F877787778887887917F919F71908887F88788878887F8879919191919
      1088878F88888888878888799191919108888878FF88888F7888888779999977
      8888888778FFFF77888888888777778888888888877777888888}
    NumGlyphs = 2
  end
  object ds_Inco: TDataSource
    DataSet = frmEnvioPeriodico.cdsIncons
    Left = 352
    Top = 48
  end
end
