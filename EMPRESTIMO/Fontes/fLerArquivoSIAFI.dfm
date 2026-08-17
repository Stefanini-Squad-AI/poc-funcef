inherited frmLerArquivoSIAFI: TfrmLerArquivoSIAFI
  Caption = 'Leitura do Arquivo Gerado Pelo SIAFI'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    object Label1: TLabel
      Left = 16
      Top = 5
      Width = 98
      Height = 13
      Caption = 'Nome do Arquivo'
    end
    object SpeedButton1: TSpeedButton
      Left = 489
      Top = 21
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
      Top = 21
      Width = 473
      Height = 21
      TabOrder = 0
    end
    object memResult: TwwDBRichEdit
      Left = 16
      Top = 48
      Width = 473
      Height = 183
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
    inherited tb97Fundo: TToolbar97
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 230101
        ClickHelpContext = 230101
      end
    end
    inherited TB97oKCancelar: TToolbar97
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 747
    Top = 11
    TargetsData = (
      1
      1
      (
        'TwwDBRichEdit'
        'Text'
        0))
  end
  object qryDeletaHistorico: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM EPHISTSIAFI'
      'WHERE'
      '   DATAATUALIZA IS NULL')
    ValidateWithMask = True
    Left = 64
    Top = 72
  end
  object SaveDialog: TSaveDialog
    DefaultExt = 'txt'
    FileName = 'Import*.txt'
    Filter = 'Arquivo Texto|Import*.txt'
    Left = 432
    Top = 152
  end
  object OpenDialog: TOpenDialog
    DefaultExt = 'txt'
    FileName = 'SIAFI*.TXT'
    Filter = 'Arquivos SIAFI|Siaf*.txt'
    Left = 456
    Top = 64
  end
  object ppmMemResult: TPopupMenu
    Left = 344
    Top = 160
    object Imprimir: TMenuItem
      Caption = 'Imprimir'
      OnClick = ImprimirClick
    end
    object Salvar: TMenuItem
      Caption = 'Salvar'
      OnClick = SalvarClick
    end
  end
  object qryDeletaRegistro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM EPHISTSIAFI'
      'WHERE'
      '    IDPESSOA   = :PIDPESSOA'
      'AND NUMPARCELA = :PNUMPARCELA'
      'AND COBRANCA   = :PCOBRANCA'
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 64
    Top = 144
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PNUMPARCELA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PCOBRANCA'
        ParamType = ptUnknown
      end>
  end
  object qryBuscaMatricula: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   DEP.IDPESSOA'
      'FROM'
      '   DEPENTIT     DEP,'
      '   ELEGPATRO    ELP,'
      '   PARTPREVPLAN PPP,'
      '   PLANPREV     PLP,'
      '   SITPART      SIP,'
      '   SITPLANOPREV SPP'
      'WHERE'
      '   ( ELP.IDPESSJUR       = PPP.IDPESSJUR ) AND'
      '   ( ELP.IDPESSOA        = PPP.IDPESSOA )'
      '   AND DEP.MATRICULA     =:PIDMATRICULA'
      '   AND PPP.INSCRICAODATA = ('
      '                           SELECT'
      '                              MAX(B.INSCRICAODATA)'
      '                           FROM'
      '                              PARTPREVPLAN B'
      '                           WHERE'
      '                              B.IDPESSOA  = PPP.IDPESSOA'
      '                           ) AND'
      '   ( ELP.IDPESSOA        = DEP.IDTITULAR(+) ) AND'
      '   ( PPP.IDPLANOPREV     = PLP.IDPLANOPREV(+) ) AND'
      '   ( PPP.IDSITPART       = SIP.IDSITPART(+) ) AND'
      '   ( PPP.IDSITPLANOPREV  = SPP.IDSITPLANOPREV(+) )')
    ValidateWithMask = True
    Left = 184
    Top = 64
    ParamData = <
      item
        DataType = ftString
        Name = 'PIDMATRICULA'
        ParamType = ptInput
      end>
    object qryBuscaMatriculaIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
  end
  object qryBuscaHistorico: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    DATAATUALIZA'
      'FROM '
      '    EPHISTSIAFI'
      'WHERE'
      '    IDPESSOA   = :PIDPESSOA'
      'AND NUMPARCELA = :PNUMPARCELA'
      'AND COBRANCA   = :PCOBRANCA'
      ''
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 184
    Top = 120
    ParamData = <
      item
        DataType = ftString
        Name = 'PIDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PNUMPARCELA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PCOBRANCA'
        ParamType = ptInput
      end>
    object qryBuscaHistoricoDATAATUALIZA: TDateTimeField
      FieldName = 'DATAATUALIZA'
      Origin = 'BASEDADOS.EPHISTSIAFI.DATAATUALIZA'
    end
  end
  object qryInsertHistorico: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO EPHISTSIAFI'
      '('
      '  IDPESSOA,'
      '  NUMPARCELA,'
      '  COBRANCA,'
      '  REFERENCIA,'
      '  DATAVENCTO,'
      '  VLRPARCELA,'
      '  MULTAEP,'
      '  JUROSEP,'
      '  CORRECAOEP,'
      '  SALDODEVEP,'
      '  SEGUROEP,'
      '  MULTASEGEP,'
      '  JUROSSEGEP,'
      '  CORRECAOSEGEP,'
      '  DESCONTOEP,'
      '  MULTAQUIT,'
      '  JUROSQUIT,'
      '  CORRECAOQUIT,'
      '  SALDODEVQUIT,'
      '  SEGUROQUIT,'
      '  MULTASEGQUIT,'
      '  JUROSSEGQUIT,'
      '  CORRECAOSEGQUIT,'
      '  DESCONTOQUIT,'
      '  NOMEARQUIVO'
      ')'
      'VALUES'
      '('
      '  :PIDPESSOA,'
      '  :PNUMPARCELA,'
      '  :PCOBRANCA,'
      '  :PREFERENCIA,'
      '  :PDATAVENCTO,'
      '  :PVLRPARCELA,'
      '  :PMULTAEP,'
      '  :PJUROSEP,'
      '  :PCORRECAOEP,'
      '  :PSALDODEVEP,'
      '  :PSEGUROEP,'
      '  :PMULTASEGEP,'
      '  :PJUROSSEGEP,'
      '  :PCORRECAOSEGEP,'
      '  :PDESCONTOEP,'
      '  :PMULTAQUIT,'
      '  :PJUROSQUIT,'
      '  :PCORRECAOQUIT,'
      '  :PSALDODEVQUIT,'
      '  :PSEGUROQUIT,'
      '  :PMULTASEGQUIT,'
      '  :PJUROSSEGQUIT,'
      '  :PCORRECAOSEGQUIT,'
      '  :PDESCONTOQUIT,'
      '  :PNOMEARQUIVO'
      ')'
      ''
      ''
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 296
    Top = 64
    ParamData = <
      item
        DataType = ftString
        Name = 'PIDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PNUMPARCELA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PREFERENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PDATAVENCTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PVLRPARCELA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PMULTAEP'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PJUROSEP'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PCORRECAOEP'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PSALDODEVEP'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PSEGUROEP'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PMULTASEGEP'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PJUROSSEGEP'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PCORRECAOSEGEP'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PDESCONTOEP'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PMULTAQUIT'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PJUROSQUIT'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PCORRECAOQUIT'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PSALDODEVQUIT'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PSEGUROQUIT'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PMULTASEGQUIT'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PJUROSSEGQUIT'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PCORRECAOSEGQUIT'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PDESCONTOQUIT'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PNOMEARQUIVO'
        ParamType = ptInput
      end>
    object DateTimeField1: TDateTimeField
      FieldName = 'DATAATUALIZA'
      Origin = 'BASEDADOS.EPHISTSIAFI.DATAATUALIZA'
    end
  end
  object qryContaRegistros: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT COUNT(*) AS TOTAL_REGISTROS FROM EPHISTSIAFI')
    ValidateWithMask = True
    Left = 184
    Top = 176
    object qryContaRegistrosTOTAL_REGISTROS: TFloatField
      FieldName = 'TOTAL_REGISTROS'
    end
  end
end
