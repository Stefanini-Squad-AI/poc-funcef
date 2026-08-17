inherited frmCadNumeroProtoco: TfrmCadNumeroProtoco
  Left = 588
  Top = 185
  AutoSize = True
  Caption = 'Cadastrar Número de Protocolo'
  ClientHeight = 224
  ClientWidth = 483
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 483
    Height = 185
    object Label1: TLabel
      Left = 32
      Top = 20
      Width = 82
      Height = 13
      Caption = 'Demonstrativo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 312
      Top = 20
      Width = 23
      Height = 13
      Caption = 'Ano'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 32
      Top = 76
      Width = 120
      Height = 13
      Caption = 'Número de Protocolo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 32
      Top = 132
      Width = 82
      Height = 13
      Caption = 'Data do Envio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 119
      Top = 132
      Width = 82
      Height = 13
      Caption = 'Hora do Envio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 364
      Top = 20
      Width = 53
      Height = 13
      Caption = 'Semestre'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtDemonstrativo: TwwDBEdit
      Left = 32
      Top = 44
      Width = 265
      Height = 21
      MaxLength = 50
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object edtAno: TwwDBEdit
      Left = 312
      Top = 44
      Width = 49
      Height = 21
      MaxLength = 4
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
      OnChange = edtAnoChange
      OnKeyPress = edtAnoKeyPress
    end
    object edtNumeroProtocolo: TwwDBEdit
      Left = 32
      Top = 100
      Width = 265
      Height = 21
      MaxLength = 50
      TabOrder = 2
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
      OnKeyPress = edtNumeroProtocoloKeyPress
    end
    object edtDataEnvio: TwwDBEdit
      Left = 32
      Top = 156
      Width = 81
      Height = 21
      MaxLength = 10
      TabOrder = 3
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object edtHoraEnvio: TwwDBEdit
      Left = 117
      Top = 156
      Width = 60
      Height = 21
      MaxLength = 5
      TabOrder = 4
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object edtSemestre: TwwDBEdit
      Left = 364
      Top = 44
      Width = 39
      Height = 21
      MaxLength = 2
      TabOrder = 5
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
      OnChange = edtSemestreChange
      OnKeyPress = edtSemestreKeyPress
    end
  end
  inherited Dock971: TDock97
    Top = 185
    Width = 483
    inherited tb97Fundo: TToolbar97
      Left = 315
    end
    object bbtnCancelar: TBitBtn
      Left = 229
      Top = 1
      Width = 84
      Height = 34
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
      OnClick = bbtnCancelarClick
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
    object BitBtn1: TBitBtn
      Left = 143
      Top = 1
      Width = 84
      Height = 35
      Caption = 'OK'
      Default = True
      ModalResult = 1
      TabOrder = 2
      OnClick = BitBtn1Click
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
  inherited ivTradutor: TIvExtendedTranslator
    Left = 427
    Top = 19
    TargetsData = (
      1
      1
      (
        ''
        'Filter'
        0))
  end
  object qryRegistros: TwwQuery
    DatabaseName = 'BASEDADOS'
    ValidateWithMask = True
    Left = 424
    Top = 128
  end
  object qryUp: TwwQuery
    DatabaseName = 'BASEDADOS'
    ValidateWithMask = True
    Left = 424
    Top = 80
  end
  object qryDet: TwwQuery
    DatabaseName = 'BASEDADOS'
    ValidateWithMask = True
    Left = 312
    Top = 128
  end
end
