inherited frmCriticaCaixa: TfrmCriticaCaixa
  Left = 127
  Top = 159
  Caption = 'Recebimento de Arquivo de Crítica da Caixa'
  ClientHeight = 289
  ClientWidth = 513
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 513
    Height = 256
    object Label1: TLabel
      Left = 16
      Top = 10
      Width = 98
      Height = 13
      Caption = 'Nome do Arquivo'
    end
    object SpeedButton1: TSpeedButton
      Left = 489
      Top = 24
      Width = 23
      Height = 22
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
        333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
        0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
        07333337F3FF3FFF7F333330F00F000F07333337F77377737F333330FFFFFFFF
        07333FF7F3FFFF3F7FFFBBB0F0000F0F0BB37777F7777373777F3BB0FFFFFFFF
        0BBB3777F3FF3FFF77773330F00F000003333337F773777773333330FFFF0FF0
        33333337F3FF7F37F3333330F08F0F0B33333337F7737F77FF333330FFFF003B
        B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
        3BB33773333773333773B333333B3333333B7333333733333337}
      NumGlyphs = 2
      OnClick = SpeedButton1Click
    end
    object edtNomeArquivo: TEdit
      Left = 16
      Top = 24
      Width = 473
      Height = 21
      TabOrder = 0
    end
    object memResult: TwwDBRichEdit
      Left = 16
      Top = 56
      Width = 473
      Height = 183
      ScrollBars = ssVertical
      AutoURLDetect = False
      PopupMenu = ppmMemResult
      PrintJobName = 'Crítica de Processo'
      TabOrder = 1
      PopupOptions = []
      EditorCaption = 'Resultado do Processo'
      EditorPosition.Left = 0
      EditorPosition.Top = 0
      EditorPosition.Width = 0
      EditorPosition.Height = 0
      MeasurementUnits = muInches
      PrintMargins.Top = 1
      PrintMargins.Bottom = 1
      PrintMargins.Left = 1
      PrintMargins.Right = 1
      RichEditVersion = 2
      Data = {
        750000007B5C727466315C616E73695C616E7369637067313235325C64656666
        305C6465666C616E67313034367B5C666F6E7474626C7B5C66305C666E696C20
        4D532053616E732053657269663B7D7D0D0A5C766965776B696E64345C756331
        5C706172645C625C66305C667331345C7061720D0A7D0D0A00}
    end
  end
  inherited Dock971: TDock97
    Top = 256
    Width = 513
    inherited tb97Fundo: TToolbar97
      Left = 341
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 230101
        ClickHelpContext = 230101
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 161
      DockPos = 182
      inherited ToolbarSep971: TToolbarSep97
        Left = 91
      end
      inherited ToolbarSep974: TToolbarSep97
        Left = 174
      end
      inherited bbtnConfirmar: TBitBtn
        Width = 89
        Caption = '&Processar'
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Left = 93
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 339
    Top = 65488
    TargetsData = (
      1
      2
      (
        'TMemo'
        'Text'
        0)
      (
        'TwwDBRichEdit'
        'Text'
        0))
  end
  object OpenDialog: TOpenDialog
    Left = 368
    Top = 80
  end
  object ppmMemResult: TPopupMenu
    Left = 264
    Top = 120
    object Imprimir: TMenuItem
      Caption = 'Imprimir'
      OnClick = ImprimirClick
    end
    object Salvar: TMenuItem
      Caption = 'Salvar'
      OnClick = SalvarClick
    end
  end
  object SaveDialog: TSaveDialog
    Left = 416
    Top = 136
  end
  object qryTmpDesc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    TMP.MATRICULA,'
      '    TMP.IDDESCONTO,'
      '    TMP.IDPROVENTO'
      'FROM'
      '    TMPDESC      TMP'
      'WHERE'
      '    TMP.MATRICULA            = :PMATRICULA'
      'AND TMP.CODPROVDESC          = :PIDRUBRICA'
      'AND RTRIM(TMP.MESCOBRANCA)   = :PMESCOBRANCA'
      'AND TMP.IDEMPRESAPROP        = :PIDEMPRESAPROP'
      'AND TMP.IDMODULO             = 15'
      'AND TMP.SITENVIO             = '#39'0'#39
      ''
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 104
    Top = 128
    ParamData = <
      item
        DataType = ftString
        Name = 'PMATRICULA'
        ParamType = ptInput
        Value = #39'0261568'#39
      end
      item
        DataType = ftInteger
        Name = 'PIDRUBRICA'
        ParamType = ptInput
        Value = '1441'
      end
      item
        DataType = ftString
        Name = 'PMESCOBRANCA'
        ParamType = ptInput
        Value = #39'2003/04'#39
      end
      item
        DataType = ftInteger
        Name = 'PIDEMPRESAPROP'
        ParamType = ptInput
        Value = '1'
      end>
    object qryTmpDescMATRICULA: TStringField
      FieldName = 'MATRICULA'
      FixedChar = True
      Size = 13
    end
    object qryTmpDescIDDESCONTO: TFloatField
      FieldName = 'IDDESCONTO'
    end
    object qryTmpDescIDPROVENTO: TFloatField
      FieldName = 'IDPROVENTO'
    end
  end
  object qryUpdateTmpDesc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE TMPDESC'
      'SET    SITENVIO      = '#39'X'#39','
      '       VALORRECEBIDO = 0'
      'WHERE'
      '    IDPROVENTO             =:PIDRUBRICA'
      'AND RTRIM(MESCOBRANCA)     =:PMESCOBRANCA'
      'AND IDEMPRESAPROP          = :PIDEMPRESAPROP'
      'AND IDDESCONTO             =:PIDCONTRATOEMPTMO'
      'AND NUMPARCELAS - PARCELA  =:PARCELA'
      'AND IDMODULO               = 15')
    ValidateWithMask = True
    Left = 184
    Top = 176
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PIDRUBRICA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PMESCOBRANCA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PIDEMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PARCELA'
        ParamType = ptInput
      end>
  end
end
