inherited frmCadDiverge: TfrmCadDiverge
  Left = 210
  Top = 51
  Caption = 'Geração de Boleto de divergências'
  ClientHeight = 430
  ClientWidth = 513
  FormStyle = fsNormal
  Visible = False
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 513
    Height = 391
    object Label1: TLabel
      Left = 24
      Top = 61
      Width = 63
      Height = 13
      Caption = 'Valor Total'
    end
    object Label2: TLabel
      Left = 288
      Top = 61
      Width = 67
      Height = 13
      Caption = 'Vencimento'
    end
    object Label3: TLabel
      Left = 24
      Top = 12
      Width = 61
      Height = 13
      Caption = 'Comprador'
    end
    object Label26: TLabel
      Left = 24
      Top = 106
      Width = 111
      Height = 13
      Caption = 'Forma de Cobrança'
    end
    object Label4: TLabel
      Left = 160
      Top = 61
      Width = 87
      Height = 13
      Caption = 'Conciliação em'
    end
    object gbMensagem: TGroupBox
      Left = 15
      Top = 152
      Width = 481
      Height = 225
      Caption = 'Mensagem do Boleto'
      TabOrder = 5
      object Label32: TLabel
        Left = 15
        Top = 26
        Width = 47
        Height = 13
        Caption = 'Linha 1:'
      end
      object Label33: TLabel
        Left = 15
        Top = 47
        Width = 47
        Height = 13
        Caption = 'Linha 2:'
      end
      object Label34: TLabel
        Left = 15
        Top = 68
        Width = 47
        Height = 13
        Caption = 'Linha 3:'
      end
      object Label35: TLabel
        Left = 15
        Top = 89
        Width = 47
        Height = 13
        Caption = 'Linha 4:'
      end
      object Label36: TLabel
        Left = 15
        Top = 110
        Width = 47
        Height = 13
        Caption = 'Linha 5:'
      end
      object Label37: TLabel
        Left = 15
        Top = 131
        Width = 47
        Height = 13
        Caption = 'Linha 6:'
      end
      object Label38: TLabel
        Left = 15
        Top = 152
        Width = 47
        Height = 13
        Caption = 'Linha 7:'
      end
      object Label39: TLabel
        Left = 15
        Top = 173
        Width = 47
        Height = 13
        Caption = 'Linha 8:'
      end
      object Label40: TLabel
        Left = 15
        Top = 194
        Width = 47
        Height = 13
        Caption = 'Linha 9:'
      end
      object edtln9: TEdit
        Left = 72
        Top = 189
        Width = 400
        Height = 21
        MaxLength = 69
        TabOrder = 8
      end
      object edtln8: TEdit
        Left = 72
        Top = 168
        Width = 400
        Height = 21
        MaxLength = 69
        TabOrder = 7
      end
      object edtln7: TEdit
        Left = 72
        Top = 147
        Width = 400
        Height = 21
        MaxLength = 69
        TabOrder = 6
      end
      object edtln6: TEdit
        Left = 72
        Top = 126
        Width = 400
        Height = 21
        MaxLength = 69
        TabOrder = 5
      end
      object edtln5: TEdit
        Left = 72
        Top = 105
        Width = 400
        Height = 21
        MaxLength = 69
        TabOrder = 4
      end
      object edtln4: TEdit
        Left = 72
        Top = 84
        Width = 400
        Height = 21
        MaxLength = 69
        TabOrder = 3
      end
      object edtln3: TEdit
        Left = 72
        Top = 63
        Width = 400
        Height = 21
        MaxLength = 69
        TabOrder = 2
      end
      object edtln2: TEdit
        Left = 72
        Top = 42
        Width = 400
        Height = 21
        MaxLength = 69
        TabOrder = 1
      end
      object edtln1: TEdit
        Left = 72
        Top = 21
        Width = 400
        Height = 21
        MaxLength = 69
        TabOrder = 0
      end
    end
    object edDataVencto: TCMDateTimePicker
      Left = 288
      Top = 76
      Width = 114
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
      TabOrder = 3
    end
    object edVlrTotal: TRealEdit
      Left = 24
      Top = 76
      Width = 121
      Height = 21
      TabStop = False
      Alignment = taRightJustify
      Enabled = False
      Lines.Strings = (
        '      0,00')
      ReadOnly = True
      TabOrder = 1
      WordWrap = False
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
    end
    object edComprador: TEdit
      Left = 24
      Top = 28
      Width = 457
      Height = 21
      TabStop = False
      Enabled = False
      TabOrder = 0
      Text = 'edComprador'
    end
    object dbcboPortadorForma: TCMDBLookupCombo
      Left = 22
      Top = 120
      Width = 381
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'50'#9'DESCRICAO'#9'F')
      LookupTable = qryLookPortadorForma
      LookupField = 'CODPORTFORMA'
      Options = [loTitles]
      Style = csDropDownList
      TabOrder = 4
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object edtDataConcilia: TCMDateTimePicker
      Left = 160
      Top = 76
      Width = 114
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
      TabOrder = 2
    end
  end
  inherited Dock971: TDock97
    Top = 391
    Width = 513
    inherited tb97Fundo: TToolbar97
      Left = 341
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 172
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 11
    Top = 379
    TargetsData = (
      1
      3
      (
        'TDBRealEdit'
        'Text'
        0)
      (
        'TMemo'
        'Text'
        0)
      (
        'TRealEdit'
        'Text'
        0))
  end
  object qryLookPortadorForma: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    CODPORTFORMA,'
      '    DESCRICAO,'
      '    CODFORMA'
      'FROM'
      '    PORTADORFORMA'
      'WHERE'
      '    RECPAG = '#39'R'#39
      'AND NVL(FLGATIVO, '#39'S'#39') = '#39'S'#39
      'AND IDPESSOA =:EMPRESAPROP'
      'ORDER BY'
      '    DESCRICAO'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 415
    Top = 263
    ParamData = <
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end>
    object qryLookPortadorFormaDESCRICAO: TStringField
      DisplayWidth = 50
      FieldName = 'DESCRICAO'
      Origin = 'PORTADORFORMA.DESCRICAO'
      Size = 50
    end
    object qryLookPortadorFormaCODPORTFORMA: TFloatField
      DisplayWidth = 10
      FieldName = 'CODPORTFORMA'
      Origin = 'PORTADORFORMA.CODPORTFORMA'
      Visible = False
    end
    object qryLookPortadorFormaCODFORMA: TFloatField
      FieldName = 'CODFORMA'
      Origin = 'BASEDADOS.PORTADORFORMA.CODFORMA'
      Visible = False
    end
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 277
    Top = 189
  end
  object qryAlteradoresLanc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   LD.CODDOCUMENTO, LD.NUMLANCTO,'
      '   LD.CODALTERADOR, LD.PLNCODIGO,'
      '   LD.DATALANCTO, LD.VALOR, LD.VALOROUTRAMOEDA,'
      '   LD.DEBCRE, LD.OPERACAO, LD.HISTORICOCOMPL,'
      ''
      '   A.DESCRICAO'
      'FROM'
      '   LANCTODOCUM LD, TIPOALTERADOR A'
      'WHERE'
      '   ( LD.CODDOCUMENTO =:PCODDOCUMENTO )'
      '   AND ( LD.OPERACAO = '#39'4 '#39' )'
      '   AND ( LD.CODALTERADOR = A.CODALTERADOR )'
      'ORDER BY'
      '   LD.DATALANCTO, A.DESCRICAO'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 320
    Top = 258
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PCODDOCUMENTO'
        ParamType = ptUnknown
        Value = '0'
      end>
    object qryAlteradoresLancDESCRICAO: TStringField
      DisplayLabel = 'Tipo do Alterador'
      DisplayWidth = 18
      FieldName = 'DESCRICAO'
      Size = 35
    end
    object qryAlteradoresLancHISTORICOCOMPL: TStringField
      DisplayLabel = 'Histórico'
      DisplayWidth = 27
      FieldName = 'HISTORICOCOMPL'
      Size = 60
    end
    object qryAlteradoresLancVALOR: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 10
      FieldName = 'VALOR'
      DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
      EditFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
    end
    object qryAlteradoresLancDATALANCTO: TDateTimeField
      Alignment = taCenter
      DisplayLabel = 'Data'
      DisplayWidth = 10
      FieldName = 'DATALANCTO'
    end
    object qryAlteradoresLancCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
      Visible = False
    end
    object qryAlteradoresLancNUMLANCTO: TFloatField
      FieldName = 'NUMLANCTO'
      Visible = False
    end
    object qryAlteradoresLancCODALTERADOR: TFloatField
      FieldName = 'CODALTERADOR'
      Visible = False
    end
    object qryAlteradoresLancPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
      Visible = False
    end
    object qryAlteradoresLancVALOROUTRAMOEDA: TFloatField
      FieldName = 'VALOROUTRAMOEDA'
      Visible = False
    end
    object qryAlteradoresLancDEBCRE: TStringField
      FieldName = 'DEBCRE'
      Visible = False
      Size = 1
    end
    object qryAlteradoresLancOPERACAO: TStringField
      FieldName = 'OPERACAO'
      Visible = False
      Size = 2
    end
  end
  object qryDadosCliente: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    EST.IDPAIS,'
      '    CID.IDCIDADES,'
      '    EST.CODESTADO'
      'FROM'
      '    PESSOA  PES,'
      '    ENDPESS END,'
      '    CIDADES CID,'
      '    ESTADO  EST'
      'WHERE'
      '    PES.IDPESSOA      = :IDPESSOA          AND'
      '    END.IDENDERECO(+) = PES.IDENDCOMERCIAL AND'
      '    CID.IDCIDADES(+)  = END.IDCIDADES      AND'
      '    EST.IDESTADO(+)   = CID.IDESTADO'
      ''
      ' ')
    ValidateWithMask = True
    Left = 192
    Top = 267
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptInput
      end>
    object qryDadosClienteIDPAIS: TFloatField
      FieldName = 'IDPAIS'
    end
    object qryDadosClienteIDCIDADES: TFloatField
      FieldName = 'IDCIDADES'
    end
    object qryDadosClienteCODESTADO: TStringField
      FieldName = 'CODESTADO'
      FixedChar = True
      Size = 3
    end
  end
  object qryTipoContrato: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT FLGTIPOCONTRATO'
      'FROM CONTRATOIMOVEL'
      'WHERE IDCONTRATOIMOVEL = :PIDCONTRATOIMOVEL')
    ValidateWithMask = True
    Left = 384
    Top = 186
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOIMOVEL'
        ParamType = ptInput
      end>
    object qryTipoContratoFLGTIPOCONTRATO: TStringField
      FieldName = 'FLGTIPOCONTRATO'
      Origin = 'BASEDADOS.CONTRATOIMOVEL.FLGTIPOCONTRATO'
      FixedChar = True
      Size = 1
    end
  end
end
