inherited frmExecImportaReserva: TfrmExecImportaReserva
  Left = 319
  Top = 230
  HelpContext = 3360016
  Caption = 'Importação de Reservas da COATE'
  ClientHeight = 375
  ClientWidth = 575
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 575
    Height = 336
    inherited PagControle: TPageControl
      Width = 573
      Height = 334
      inherited tabSelecao: TTabSheet
        inherited lblTitulo: TfcLabel
          Left = 8
          Width = 357
          Align = alNone
          Caption = 'Importação de Reservas da COATE'
        end
        object Label2: TLabel
          Left = 8
          Top = 42
          Width = 174
          Height = 13
          Caption = 'Arquivo de reservas a importar'
        end
        object edtArqReserva: TEdit
          Left = 8
          Top = 56
          Width = 521
          Height = 21
          TabOrder = 0
        end
        object btnArquivo: TBitBtn
          Left = 529
          Top = 55
          Width = 26
          Height = 24
          TabOrder = 1
          OnClick = btnArquivoClick
          Glyph.Data = {
            4E010000424D4E01000000000000760000002800000012000000120000000100
            040000000000D800000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            8888880000008888888888888888880000008888888888888888880000008800
            00000000008888000000800B8B8B8B8B8B088800000080B0B8B8B8B8B8B08800
            000080F08B8B8B8B8B808800000080BF08B8B8B8B8B80800000080FBF000008B
            8B8B0800000080BFBFBFBF0000008800000080FBFBFBFBFBFB088800000080BF
            BFBFBFBFBF088800000080FBFBFBFBFBFB088800000080BFBFB0000000888800
            0000880000088888888888000000888888888888888888000000888888888888
            888888000000888888888888888888000000}
        end
        object Panel1: TPanel
          Left = 288
          Top = 88
          Width = 265
          Height = 49
          TabOrder = 2
          object Label15: TLabel
            Left = 16
            Top = 20
            Width = 128
            Height = 13
            Caption = 'Data de Referência:   '
          end
          object edtDataRef: TCMDateTimePicker
            Left = 144
            Top = 16
            Width = 105
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            Epoch = 1950
            ButtonGlyph.Data = {
              06050000424D06050000000000003604000028000000100000000D0000000100
              080000000000D000000000000000000000000001000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
              A6000020400000206000002080000020A0000020C0000020E000004000000040
              20000040400000406000004080000040A0000040C0000040E000006000000060
              20000060400000606000006080000060A0000060C0000060E000008000000080
              20000080400000806000008080000080A0000080C0000080E00000A0000000A0
              200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
              200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
              200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
              20004000400040006000400080004000A0004000C0004000E000402000004020
              20004020400040206000402080004020A0004020C0004020E000404000004040
              20004040400040406000404080004040A0004040C0004040E000406000004060
              20004060400040606000406080004060A0004060C0004060E000408000004080
              20004080400040806000408080004080A0004080C0004080E00040A0000040A0
              200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
              200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
              200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
              20008000400080006000800080008000A0008000C0008000E000802000008020
              20008020400080206000802080008020A0008020C0008020E000804000008040
              20008040400080406000804080008040A0008040C0008040E000806000008060
              20008060400080606000806080008060A0008060C0008060E000808000008080
              20008080400080806000808080008080A0008080C0008080E00080A0000080A0
              200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
              200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
              200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
              2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
              2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
              2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
              2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
              2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
              2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
              2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00010000000000
              000000000000000000FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF07A407
              A407A4F9A407A4FF00FFFF00FFA407A407A4F9A4F9A407FF00FFFF00FF07A407
              A407A4F9A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FF07A407
              A407A407A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FFFFFFFF
              FFFFFFFFFFFFFFFF00FFFF00FF04FC04FC04FCA4A4A4A4FF00FFFF00FFFC04FC
              04FC04A4A4A4A4FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF0000000000
              000000000000000000FF}
            ShowButton = True
            TabOrder = 0
          end
        end
      end
      inherited TabSheet1: TTabSheet
        inherited fcLabel1: TfcLabel
          Left = 8
          Width = 357
          Align = alNone
          Caption = 'Importação de Reservas da COATE'
        end
        object memResult: TMemo
          Left = 8
          Top = 58
          Width = 545
          Height = 103
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 1
          WordWrap = False
        end
        object memErro: TMemo
          Left = 8
          Top = 210
          Width = 545
          Height = 103
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          ScrollBars = ssBoth
          TabOrder = 3
          WordWrap = False
        end
        object Panel2: TPanel
          Left = 8
          Top = 184
          Width = 545
          Height = 27
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = 'Ocorrências'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
        end
        object Panel3: TPanel
          Left = 8
          Top = 32
          Width = 545
          Height = 27
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = 'Processados'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 336
    Width = 575
    inherited tb97Fundo: TToolbar97
      Left = 135
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      1
      (
        'TMemo'
        'Text'
        0))
  end
  object opdArqReserva: TOpenDialog
    DefaultExt = '*.txt'
    Filter = 'Arquivos de texto|*.txt|Todos os arquivos|*.*'
    InitialDir = 'c:\'
    Left = 437
    Top = 57
  end
  object qryDepentit: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT /*+INDEX(DEP XIE1DEPENTIT) */'
      '   DEP.IDPESSOA'
      'FROM'
      '   DEPENTIT DEP'
      'WHERE'
      '   DEP.MATRICULA =:PMATRICULA')
    ValidateWithMask = True
    Left = 40
    Top = 176
    ParamData = <
      item
        DataType = ftString
        Name = 'PMATRICULA'
        ParamType = ptInput
      end>
    object qryDepentitIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.DEPENTIT.IDPESSOA'
    end
  end
  object qryReserva: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   RSP.IDTIPORESERVA, RSP.IDPLANOPREV, RSP.IDPESSOA, RSP.IDPESSJ' +
        'UR, RSP.DATAREFERENCIASA,'
      
        '   RSP.SEQPROPOSTA, RSP.VALORRESERVA, RSP.PERCENTUALSAQUE, RSP.F' +
        'LGATIVO, RSP.DATADESATIV,'
      
        '   RSP.FLGINCONSISTENCIA, RSP.DATAULTALIM, RSP.DATAULTATUALIZA, ' +
        'RSP.IDPARTICIPANTE'
      'FROM'
      '   RESERVAPART RSP'
      'WHERE'
      '       RSP.IDPESSOA        =:PIDPESSOA'
      '   AND RSP.IDTIPORESERVA   =:PIDTIPORESERVA')
    ValidateWithMask = True
    Left = 128
    Top = 176
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPORESERVA'
        ParamType = ptInput
      end>
    object qryReservaIDTIPORESERVA: TFloatField
      FieldName = 'IDTIPORESERVA'
      Origin = 'BASEDADOS.RESERVAPART.IDTIPORESERVA'
    end
    object qryReservaIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Origin = 'BASEDADOS.RESERVAPART.IDPLANOPREV'
    end
    object qryReservaIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.RESERVAPART.IDPESSOA'
    end
    object qryReservaIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
      Origin = 'BASEDADOS.RESERVAPART.IDPESSJUR'
    end
    object qryReservaDATAREFERENCIASA: TDateTimeField
      FieldName = 'DATAREFERENCIASA'
      Origin = 'BASEDADOS.RESERVAPART.DATAREFERENCIASA'
    end
    object qryReservaSEQPROPOSTA: TFloatField
      FieldName = 'SEQPROPOSTA'
      Origin = 'BASEDADOS.RESERVAPART.SEQPROPOSTA'
    end
    object qryReservaVALORRESERVA: TFloatField
      FieldName = 'VALORRESERVA'
      Origin = 'BASEDADOS.RESERVAPART.VALORRESERVA'
    end
    object qryReservaPERCENTUALSAQUE: TFloatField
      FieldName = 'PERCENTUALSAQUE'
      Origin = 'BASEDADOS.RESERVAPART.PERCENTUALSAQUE'
    end
    object qryReservaFLGATIVO: TFloatField
      FieldName = 'FLGATIVO'
      Origin = 'BASEDADOS.RESERVAPART.FLGATIVO'
    end
    object qryReservaDATADESATIV: TDateTimeField
      FieldName = 'DATADESATIV'
      Origin = 'BASEDADOS.RESERVAPART.DATADESATIV'
    end
    object qryReservaFLGINCONSISTENCIA: TFloatField
      FieldName = 'FLGINCONSISTENCIA'
      Origin = 'BASEDADOS.RESERVAPART.FLGINCONSISTENCIA'
    end
    object qryReservaDATAULTALIM: TDateTimeField
      FieldName = 'DATAULTALIM'
      Origin = 'BASEDADOS.RESERVAPART.DATAULTALIM'
    end
    object qryReservaDATAULTATUALIZA: TDateTimeField
      FieldName = 'DATAULTATUALIZA'
      Origin = 'BASEDADOS.RESERVAPART.DATAULTATUALIZA'
    end
    object qryReservaIDPARTICIPANTE: TFloatField
      FieldName = 'IDPARTICIPANTE'
      Origin = 'BASEDADOS.RESERVAPART.IDPARTICIPANTE'
    end
  end
  object qryUpdateReserva: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE /*+INDEX(RSP XPKRESERVAPART) */'
      '   RESERVAPART RSP'
      'SET'
      '   RSP.VALORRESERVA        =:PVALORRESERVA,'
      '   RSP.DATAULTALIM         = SYSDATE'
      'WHERE'
      '       RSP.IDPESSOA        =:PIDPESSOA'
      '   AND RSP.IDTIPORESERVA   =:PIDTIPORESERVA'
      '   AND RSP.IDPESSJUR       =:PIDPESSJUR'
      '   AND RSP.IDPLANOPREV     =:PIDPLANOPREV')
    ValidateWithMask = True
    Left = 128
    Top = 164
    ParamData = <
      item
        DataType = ftCurrency
        Name = 'PVALORRESERVA'
        ParamType = ptInput
        Value = '100'
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptInput
        Value = 1
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPORESERVA'
        ParamType = ptInput
        Value = 1
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSJUR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPLANOPREV'
        ParamType = ptInput
      end>
  end
  object qryInsertMovReserva: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO HISTMOVRESERVA'
      '('
      'IDHISTRESERVA,'
      'IDTIPORESERVA,'
      'DATAALIMENTACAO,'
      'VLRREAL,'
      'VLRCOTAS,'
      'IDBENEFICIO,'
      'IDCONTRIBUICAO,'
      'IDEVENTOGERADOR,'
      'SALDOREAL,'
      'SALDOCOTAS,'
      'IDPLANOPREV,'
      'IDPESSOA,'
      'IDPESSJUR,'
      'FLGENTRADA,'
      'IDREGRACALCULO,'
      'PERCENTUAL,'
      'SEQPROPOSTA,'
      'IDPARTICIPANTE,'
      'SALDOREALCONT,'
      'VALORINDICE,'
      'MESREFERENCIA,'
      'DATAMOV,'
      'NUMRECEBIMENTO,'
      'FLGPROCEDENCIA'
      ')'
      'VALUES'
      '('
      'SEQHISTMOVRESERVA.NEXTVAL,'
      ':PIDTIPORESERVA,'
      ':PDATA,'
      ':PVALORREAL,'
      'NULL,'
      'NULL,'
      'NULL,'
      'NULL,'
      ':PSALDOREAL,'
      'NULL,'
      ':PIDPLANOPREV,'
      ':PIDPESSOA,'
      ':PIDPESSJUR,'
      ':PFLGENTRADA,'
      'NULL,'
      'NULL,'
      '1,'
      ':PIDPESSOA,'
      'NULL,'
      'NULL,'
      ':PMESREF,'
      ':PDATA,'
      'NULL,'
      'NULL'
      ')')
    ValidateWithMask = True
    Left = 128
    Top = 152
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDTIPORESERVA'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PDATA'
        ParamType = ptInput
      end
      item
        DataType = ftCurrency
        Name = 'PVALORREAL'
        ParamType = ptInput
      end
      item
        DataType = ftCurrency
        Name = 'PSALDOREAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPLANOPREV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSJUR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PFLGENTRADA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PMESREF'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PDATA'
        ParamType = ptInput
      end>
  end
end
