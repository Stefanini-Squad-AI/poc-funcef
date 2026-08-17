inherited frmParamContratoBMF: TfrmParamContratoBMF
  Left = 280
  Top = 161
  HelpContext = 790143
  Caption = 'Parâmetros do Contrato de BM&F'
  ClientHeight = 299
  ClientWidth = 410
  PixelsPerInch = 96
  TextHeight = 13
  object Label12: TLabel [0]
    Left = 12
    Top = 10
    Width = 81
    Height = 13
    Caption = 'Data Vigência'
  end
  inherited pnlFundo: TPanel
    Width = 410
    Height = 213
    object GroupBox1: TGroupBox
      Left = 1
      Top = 52
      Width = 408
      Height = 160
      Align = alClient
      TabOrder = 1
      object Label1: TLabel
        Left = 8
        Top = 10
        Width = 100
        Height = 13
        Caption = 'Valor do Contrato'
      end
      object Label2: TLabel
        Left = 140
        Top = 10
        Width = 99
        Height = 13
        Caption = 'Peso do Contrato'
      end
      object Label3: TLabel
        Left = 8
        Top = 58
        Width = 82
        Height = 13
        Caption = '% TOB Normal'
      end
      object Label4: TLabel
        Left = 140
        Top = 58
        Width = 106
        Height = 13
        Caption = ' % TOB Day-Trade'
      end
      object Label5: TLabel
        Left = 272
        Top = 58
        Width = 80
        Height = 13
        Caption = 'Taxa Registro'
      end
      object Label6: TLabel
        Left = 8
        Top = 106
        Width = 77
        Height = 13
        Caption = '% Taxa Bolsa'
      end
      object Label7: TLabel
        Left = 140
        Top = 106
        Width = 99
        Height = 13
        Caption = 'TOB Mín. Normal'
      end
      object Label9: TLabel
        Left = 272
        Top = 106
        Width = 119
        Height = 13
        Caption = 'TOB Mín. Day-Trade'
      end
      object dbeTOBNormal: TDBRealEdit
        Left = 8
        Top = 74
        Width = 119
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 2
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'TOBN'
        DataSource = ds
      end
      object dbeTobDayTrade: TDBRealEdit
        Left = 140
        Top = 74
        Width = 119
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 3
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'TOBD'
        DataSource = ds
      end
      object dbeTaxaRegistro: TDBRealEdit
        Left = 272
        Top = 74
        Width = 119
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 4
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'TXREGISTRO'
        DataSource = ds
      end
      object dbeTaxaBolsa: TDBRealEdit
        Left = 8
        Top = 122
        Width = 119
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 5
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'TXBOLSA'
        DataSource = ds
      end
      object dbeTobMinNOrmal: TDBRealEdit
        Left = 140
        Top = 122
        Width = 119
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 6
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'TOBMINN'
        DataSource = ds
      end
      object dbeTobMinDaytrade: TDBRealEdit
        Left = 272
        Top = 122
        Width = 119
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 7
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'TOBMIND'
        DataSource = ds
      end
      object dbeValorContrato: TDBRealEdit
        Left = 8
        Top = 26
        Width = 119
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 0
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'VALORCONTRATO'
        DataSource = ds
      end
      object dbePesoContrato: TDBRealEdit
        Left = 138
        Top = 26
        Width = 119
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 1
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'PESOCONTRATO'
        DataSource = ds
      end
    end
    object GroupBox2: TGroupBox
      Left = 1
      Top = 1
      Width = 408
      Height = 51
      Align = alTop
      TabOrder = 0
      object Label8: TLabel
        Left = 8
        Top = 9
        Width = 150
        Height = 13
        Caption = 'Tipo de Contrato de BM&&F'
      end
      object Label14: TLabel
        Left = 272
        Top = 9
        Width = 81
        Height = 13
        Caption = 'Data Vigência'
      end
      object dblTipoContratoInvest: TwwDBLookupCombo
        Left = 8
        Top = 25
        Width = 249
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCTIPOCTINVEST'#9'60'#9'Tipo de Contrato BM&F')
        DataField = 'IDTIPOCONTRINVEST'
        DataSource = ds
        LookupTable = qryTipoContratoInvest
        LookupField = 'IDTIPOCONTRINVEST'
        Options = [loColLines, loRowLines, loTitles]
        Style = csDropDownList
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
      end
      object dbdVigencia: TCMDateTimePicker
        Left = 272
        Top = 25
        Width = 119
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        DataField = 'DATAVIGENCIA'
        DataSource = ds
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
        TabOrder = 1
      end
    end
  end
  inherited Dock972: TDock97
    Width = 410
  end
  inherited Dock971: TDock97
    Top = 260
    Width = 410
    inherited tb97Fundo: TToolbar97
      Left = 175
      DockPos = 175
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 6
      DockPos = 6
    end
  end
  inherited ds: TwwDataSource
    OnStateChange = dsStateChange
    Left = 309
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update PARAMCONTRATOBMF'
      'set'
      '  IDTIPOCONTRINVEST = :IDTIPOCONTRINVEST,'
      '  DATAVIGENCIA = :DATAVIGENCIA,'
      '  PESOCONTRATO = :PESOCONTRATO,'
      '  VALORCONTRATO = :VALORCONTRATO,'
      '  TOBN = :TOBN,'
      '  TOBD = :TOBD,'
      '  TXREGISTRO = :TXREGISTRO,'
      '  TXBOLSA = :TXBOLSA,'
      '  TOBMINN = :TOBMINN,'
      '  TOBMIND = :TOBMIND'
      'where'
      '  IDPARAMCONTBMF = :OLD_IDPARAMCONTBMF')
    InsertSQL.Strings = (
      'insert into PARAMCONTRATOBMF'
      
        '  (IDPARAMCONTBMF, IDTIPOCONTRINVEST, DATAVIGENCIA, PESOCONTRATO' +
        ', VALORCONTRATO, '
      '   TOBN, TOBD, TXREGISTRO, TXBOLSA, TOBMINN, TOBMIND)'
      'values'
      
        '  (:IDPARAMCONTBMF, :IDTIPOCONTRINVEST, :DATAVIGENCIA, :PESOCONT' +
        'RATO, :VALORCONTRATO, '
      '   :TOBN, :TOBD, :TXREGISTRO, :TXBOLSA, :TOBMINN, :TOBMIND)')
    DeleteSQL.Strings = (
      'delete from PARAMCONTRATOBMF'
      'where'
      '  IDPARAMCONTBMF = :OLD_IDPARAMCONTBMF')
    Left = 249
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'TIPOCONTRINVEST.DESCTIPOCTINVEST'
      'PARAMCONTRATOBMF.DATAVIGENCIA'
      'PARAMCONTRATOBMF.VALORCONTRATO'
      'PARAMCONTRATOBMF.PESOCONTRATO')
    TipodeDado.Strings = (
      'C'
      'D'
      'N'
      'N')
    Descricao.Strings = (
      'Tipo de Contrato BM&F'
      'Data Vigência'
      'Valor do Contrato'
      'Peso do Contrato')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PARAMCONTRATOBMF'
      'TIPOCONTRINVEST')
    CamposChave.Strings = (
      'PARAMCONTRATOBMF.IDPARAMCONTBMF')
    Filtro.Strings = (
      
        'PARAMCONTRATOBMF.IDTIPOCONTRINVEST = TIPOCONTRINVEST.IDTIPOCONTR' +
        'INVEST')
    Mascaras.Strings = (
      ''
      ''
      ',##0'
      ',##0')
    Larguras.Strings = (
      '60'
      '10'
      '10'
      '10')
    Left = 352
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 358
    Top = 58
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '     PA.IDPARAMCONTBMF,'
      '     PA.IDTIPOCONTRINVEST,'
      '     PA.DATAVIGENCIA,'
      '     PA.PESOCONTRATO,'
      '     PA.VALORCONTRATO,'
      '     PA.TOBN,'
      '     PA.TOBD,'
      '     PA.TXREGISTRO,'
      '     PA.TXBOLSA,'
      '     PA.TOBMINN,'
      '     PA.TOBMIND'
      'FROM'
      '     PARAMCONTRATOBMF PA,'
      '     TIPOCONTRINVEST TP'
      'WHERE'
      '     TP.IDTIPOINVEST = 8 AND'
      '      PA.IDPARAMCONTBMF = :P_IDPARAMCONTBMF')
    Left = 279
    ParamData = <
      item
        DataType = ftInteger
        Name = 'P_IDPARAMCONTBMF'
        ParamType = ptUnknown
      end>
    object qryIDPARAMCONTBMF: TFloatField
      FieldName = 'IDPARAMCONTBMF'
      Origin = 'PARAMCONTRATOBMF.IDPARAMCONTBMF'
    end
    object qryIDTIPOCONTRINVEST: TFloatField
      FieldName = 'IDTIPOCONTRINVEST'
      Origin = 'PARAMCONTRATOBMF.IDTIPOCONTRINVEST'
    end
    object qryDATAVIGENCIA: TDateTimeField
      FieldName = 'DATAVIGENCIA'
      Origin = 'PARAMCONTRATOBMF.DATAVIGENCIA'
    end
    object qryPESOCONTRATO: TFloatField
      FieldName = 'PESOCONTRATO'
      Origin = 'PARAMCONTRATOBMF.PESOCONTRATO'
    end
    object qryVALORCONTRATO: TFloatField
      FieldName = 'VALORCONTRATO'
      Origin = 'PARAMCONTRATOBMF.VALORCONTRATO'
    end
    object qryTOBN: TFloatField
      FieldName = 'TOBN'
      Origin = 'PARAMCONTRATOBMF.TOBN'
    end
    object qryTOBD: TFloatField
      FieldName = 'TOBD'
      Origin = 'PARAMCONTRATOBMF.TOBD'
    end
    object qryTXREGISTRO: TFloatField
      FieldName = 'TXREGISTRO'
      Origin = 'PARAMCONTRATOBMF.TXREGISTRO'
    end
    object qryTXBOLSA: TFloatField
      FieldName = 'TXBOLSA'
      Origin = 'PARAMCONTRATOBMF.TXBOLSA'
    end
    object qryTOBMINN: TFloatField
      FieldName = 'TOBMINN'
      Origin = 'PARAMCONTRATOBMF.TOBMINN'
    end
    object qryTOBMIND: TFloatField
      FieldName = 'TOBMIND'
      Origin = 'PARAMCONTRATOBMF.TOBMIND'
    end
  end
  object qryTipoContratoInvest: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDTIPOCONTRINVEST,'
      '  DESCTIPOCTINVEST'
      'FROM'
      '  TIPOCONTRINVEST'
      'WHERE'
      '  IDTIPOINVEST = 8'
      'ORDER BY'
      '  DESCTIPOCTINVEST       ')
    ValidateWithMask = True
    Left = 80
    Top = 55
    object qryTipoContratoInvestDESCTIPOCTINVEST: TStringField
      DisplayLabel = 'Tipo de Contrato BM&F'
      DisplayWidth = 60
      FieldName = 'DESCTIPOCTINVEST'
      Origin = 'TIPOCONTRINVEST.DESCTIPOCTINVEST'
      Size = 60
    end
    object qryTipoContratoInvestIDTIPOCONTRINVEST: TFloatField
      FieldName = 'IDTIPOCONTRINVEST'
      Origin = 'TIPOCONTRINVEST.IDTIPOCONTRINVEST'
      Visible = False
    end
  end
  object qryTipoTitulo: TwwQuery
    Tag = 5
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  CODTIPTITULO,'
      '  IDTIPOINVEST'
      'FROM'
      '  TIPOTITULO'
      'WHERE'
      '  (IDTIPOINVEST = 8) AND'
      '  (CODTIPTITULO = :sTipoTitulo)')
    ValidateWithMask = True
    Left = 80
    Top = 111
    ParamData = <
      item
        DataType = ftString
        Name = 'sTipoTitulo'
        ParamType = ptUnknown
      end>
    object qryTipoTituloCODTIPTITULO: TStringField
      FieldName = 'CODTIPTITULO'
      Origin = 'BASEDADOS.TIPOTITULO.CODTIPTITULO'
      Size = 5
    end
    object qryTipoTituloIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'BASEDADOS.TIPOTITULO.IDTIPOINVEST'
    end
  end
  object qryInsTipoTitulo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO CM.TIPOTITULO'
      '(CODTIPTITULO,IDTIPOINVEST)'
      'VALUES'
      '(:CODTIPTITULO,:IDTIPOINVEST)')
    ValidateWithMask = True
    Left = 77
    Top = 159
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODTIPTITULO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDTIPOINVEST'
        ParamType = ptUnknown
      end>
  end
end
