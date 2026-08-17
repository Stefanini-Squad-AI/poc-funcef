inherited frmGeracaoContrato: TfrmGeracaoContrato
  Left = 176
  Top = 201
  HelpContext = 120003
  Caption = 'Geração Contrato'
  ClientHeight = 149
  ClientWidth = 351
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 351
    Height = 110
    object ProgressBarGeracao: TProgressBar
      Left = 16
      Top = 80
      Width = 321
      Height = 16
      Min = 0
      Max = 100
      TabOrder = 0
      Visible = False
    end
    object GroupBox1: TGroupBox
      Left = 56
      Top = 16
      Width = 233
      Height = 57
      TabOrder = 1
      object Label1: TLabel
        Left = 32
        Top = 28
        Width = 28
        Height = 13
        Caption = 'Data'
      end
      object deDataLanc: TCMDateTimePicker
        Left = 72
        Top = 24
        Width = 113
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
  inherited Dock971: TDock97
    Top = 110
    Width = 351
    inherited tb97Fundo: TToolbar97
      Left = 168
      DockPos = 168
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 120003
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 0
      DockPos = 0
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Top = 243
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object updParcela: TUpdateSQL
    ModifySQL.Strings = (
      'update PARCELAREALCONTR'
      'set'
      '  IDPARCELA = :IDPARCELA,'
      '  PLNCODIGO = :PLNCODIGO,'
      '  IDITEM = :IDITEM,'
      '  IDOBJETO = :IDOBJETO,'
      '  IDPESSOA = :IDPESSOA,'
      '  CODDOCUMENTO = :CODDOCUMENTO,'
      '  IDMEDICAO = :IDMEDICAO,'
      '  IDPARCELAMEDICAO = :IDPARCELAMEDICAO,'
      '  IDCONTRATO = :IDCONTRATO,'
      '  DATAVENCPARCELA = :DATAVENCPARCELA,'
      '  QTDEPARCELA = :QTDEPARCELA,'
      '  VALOROBJPARCELA = :VALOROBJPARCELA,'
      '  DATAREALPARCELA = :DATAREALPARCELA,'
      '  VLRMOEDACORRENTE = :VLRMOEDACORRENTE,'
      '  NUMNOTAFISCAL = :NUMNOTAFISCAL'
      'where'
      '  IDPARCELA = :OLD_IDPARCELA')
    InsertSQL.Strings = (
      'insert into PARCELAREALCONTR'
      
        '  (IDPARCELA, PLNCODIGO, IDITEM, IDOBJETO, IDPESSOA, CODDOCUMENT' +
        'O, IDMEDICAO, '
      
        '   IDPARCELAMEDICAO, IDCONTRATO, DATAVENCPARCELA, QTDEPARCELA, V' +
        'ALOROBJPARCELA, '
      '   DATAREALPARCELA, VLRMOEDACORRENTE, NUMNOTAFISCAL)'
      'values'
      
        '  (:IDPARCELA, :PLNCODIGO, :IDITEM, :IDOBJETO, :IDPESSOA, :CODDO' +
        'CUMENTO, '
      
        '   :IDMEDICAO, :IDPARCELAMEDICAO, :IDCONTRATO, :DATAVENCPARCELA,' +
        ' :QTDEPARCELA, '
      
        '   :VALOROBJPARCELA, :DATAREALPARCELA, :VLRMOEDACORRENTE, :NUMNO' +
        'TAFISCAL)')
    DeleteSQL.Strings = (
      'delete from PARCELAREALCONTR'
      'where'
      '  IDPARCELA = :OLD_IDPARCELA')
    Left = 297
    Top = 32
  end
  object qryParcela: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPARCELA, PLNCODIGO, IDITEM, IDOBJETO, IDPESSOA,'
      '       CODDOCUMENTO, IDMEDICAO, IDPARCELAMEDICAO, IDCONTRATO,'
      '       DATAVENCPARCELA, QTDEPARCELA, VALOROBJPARCELA,'
      '       DATAREALPARCELA,VLRMOEDACORRENTE, NUMNOTAFISCAL '
      'FROM PARCELAREALCONTR'
      'WHERE (1=2)')
    UpdateObject = updParcela
    ValidateWithMask = True
    Left = 297
    Top = 19
  end
  object dsParcela: TwwDataSource
    AutoEdit = False
    DataSet = qryParcela
    Left = 297
    Top = 6
  end
  object qryDadosCli: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT E.CODSUBCONTA,E.CONTACCLIENTE,'
      '       E.CODCENTROCUSTO,P.RAZAOSOCIAL'
      'FROM PESSOA P, EMPRESACLIENTE E'
      'WHERE (E.IDFORCLI = :IDFORCLI) AND'
      '      (E.IDPESSOA = :IDPESSOA) AND'
      '      (P.IDPESSOA = E.IDFORCLI)')
    ValidateWithMask = True
    Left = 215
    Top = 37
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFORCLI'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryDadosFor: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT E.CODSUBCONTA,E.CONTACFORN, '
      '       E.CODCENTROCUSTO,P.RAZAOSOCIAL'
      'FROM PESSOA P, EMPRESAFORN E'
      'WHERE (E.IDFORCLI = :IDFORCLI) AND'
      '      (E.IDPESSOA = :IDPESSOA) AND'
      '      (P.IDPESSOA = E.IDFORCLI)')
    ValidateWithMask = True
    Left = 215
    Top = 25
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFORCLI'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryAuxFuncao: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 215
    Top = 12
  end
  object qryRateioCC: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     CODCENTROCUSTO, IDEMPRESA, PERCRATEIOCONTR, IDPROGRAMA'
      'FROM RATEIOCENTROCUSTO'
      'WHERE'
      '    (IDCONTRATO = :IDCONTRATO) AND'
      '    (IDITEM     = :IDITEM) AND'
      '    (IDOBJETO   = :IDOBJETO)'
      '')
    ValidateWithMask = True
    Left = 215
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCONTRATO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDITEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDOBJETO'
        ParamType = ptUnknown
      end>
  end
  object qryDadosContrato: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   C.CODCONTRATOEMPR,'
      '   C.NOMECONTRATO,'
      '   C.IDCONTRATO,'
      '   C.CODCENTRORESPON,'
      '   C.UNIDNEGOC,'
      '   C.TIPOCONTRATO,'
      '   C.CODPORTFORMA,'
      '   C.IDFORCLI,'
      '   C.CODTIPDOC,'
      '   O.MOECODIGO,'
      '   O.IDITEM,'
      '   O.IDOBJETO,'
      '   O.DATAINICIOCOBR,'
      '   O.DATABASEITEM,'
      '   O.DATAULTGERACAO,'
      '   O.DATAULTVENC,'
      '   O.VALORTOTALOBJETO,'
      '   O.FREQUENCIA,'
      '   O.INTERVALO,'
      '   O.QTDEITEM,'
      '   O.VALORUNITARIOOBJETO,'
      '   O.OBSERVACAO,'
      '   OI.CODTIPRECDES,'
      '   OI.RECPAG,'
      '   OI.CODSUBCONTA,'
      '   OI.PLACONTA,'
      '   O.IDPATRO,'
      '   O.IDPLANOPREV,'
      '   O.IDPROGRAMA'
      'FROM'
      '   CONTRATOCONTR C,'
      '   OBJETOSXITEMCONTR O,'
      '   OBJETOXITEM OI,'
      '   ITEMCONTRATUAL I'
      'WHERE'
      '   (C.IDPESSOA = :IDPESSOA) AND'
      '   (C.FLGFIMCONTRATO = '#39'S'#39') AND'
      '   (I.TIPOCOBRANCA = '#39'PS'#39') AND'
      '   (C.IDCONTRATO = O.IDCONTRATO) AND'
      '   (O.IDOBJETO = OI.IDOBJETO) AND'
      '   (O.IDITEM = OI.IDITEM) AND'
      '   (O.IDITEM = I.IDITEM)  AND'
      '   (C.IDCONTRATO IN (SELECT IDCONTRATO '
      '                     FROM CONTRATOUSUARIO'
      '                     WHERE IDUSUARIO = :IDUSUARIO))'
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 216
    Top = 65524
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDUSUARIO'
        ParamType = ptUnknown
      end>
  end
  object qryAtuObjContr: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE OBJETOSXITEMCONTR'
      'SET'
      '   DATAULTGERACAO = :DATAULTGERACAO,'
      '   DATAULTVENC    = :DATAULTVENC'
      'WHERE'
      '   (IDCONTRATO = :IDCONTRATO) AND'
      '   (IDOBJETO   = :IDOBJETO) AND'
      '   (IDITEM     = :IDITEM) '
      '')
    ValidateWithMask = True
    Left = 216
    Top = 65511
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DATAULTGERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAULTVENC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCONTRATO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDOBJETO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDITEM'
        ParamType = ptUnknown
      end>
  end
  object qryParamContrato: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      'IDPARAMCONTRATO,'
      'FLGTIPODESEMB,'
      'DATAINI,'
      'DATAFIM,'
      'AVISO,'
      'FLGENGLOBA'
      'FROM PARAMCONTRATO')
    ValidateWithMask = True
    Left = 39
    Top = 24
  end
end
