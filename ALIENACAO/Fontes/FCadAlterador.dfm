inherited frmCadAlterador: TfrmCadAlterador
  Left = 437
  Top = 148
  HelpContext = 1350016
  Caption = 'Cadastro de Alteradores de Acréscimos e Descontos'
  ClientHeight = 397
  ClientWidth = 511
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Top = 181
    Width = 511
    Height = 177
    inherited dbGrd: TwwDBGrid [0]
      Width = 509
      Height = 175
      Selected.Strings = (
        'DATALANCTO'#9'10'#9'Data'
        'DESCRICAO'#9'24'#9'Alterador'
        'VALOR'#9'14'#9'Valor'
        'HISTORICOCOMPL'#9'60'#9'Histórico')
    end
    inherited pnlControles: TPanel [1]
      Width = 509
      Height = 175
      object Label7: TLabel
        Left = 120
        Top = 9
        Width = 56
        Height = 13
        Caption = 'Alterador '
      end
      object Label10: TLabel
        Left = 295
        Top = 52
        Width = 30
        Height = 13
        Caption = 'Valor'
      end
      object Label12: TLabel
        Left = 120
        Top = 52
        Width = 101
        Height = 13
        Caption = 'Data Lançamento'
      end
      object Label11: TLabel
        Left = 8
        Top = 96
        Width = 75
        Height = 13
        Caption = 'Observações'
      end
      object rdgAcreDesc: TRadioGroup
        Left = 8
        Top = 19
        Width = 97
        Height = 71
        Caption = 'Tipo'
        ItemIndex = 0
        Items.Strings = (
          'Acréscimo'
          'Desconto')
        TabOrder = 0
        OnClick = rdgAcreDescClick
      end
      object DBcboAlterador: TwwDBLookupCombo
        Left = 120
        Top = 25
        Width = 361
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'35'#9'DESCRICAO')
        LookupTable = dtmLookImobiliario.qryLookAlteradorXTipoImo
        LookupField = 'CODALTERADOR'
        Style = csDropDownList
        DropDownWidth = 8
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        UseTFields = False
        AllowClearKey = False
        OnCloseUp = DBcboAlteradorCloseUp
      end
      object chkContabiliza: TCheckBox
        Left = 9
        Top = 140
        Width = 329
        Height = 17
        Caption = 'NÃO Contabilizar valor do Alterador'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
      end
      object edtDataLancamento: TCMDateTimePicker
        Left = 120
        Top = 68
        Width = 125
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
      object edtVlrAlt: TDBRealEdit
        Left = 295
        Top = 68
        Width = 123
        Height = 21
        Alignment = taRightJustify
        DragKind = dkDock
        Lines.Strings = (
          '      0,00')
        TabOrder = 3
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = True
      end
      object edtObs: TEdit
        Left = 8
        Top = 112
        Width = 473
        Height = 21
        MaxLength = 60
        TabOrder = 4
      end
    end
  end
  inherited Dock972: TDock97
    Width = 511
    inherited Toolbar971: TToolbar97
      inherited sbtnAlterar: TToolbarButton97
        Width = 29
        Enabled = False
        Visible = False
      end
      inherited sbtnProcurar: TToolbarButton97
        Left = 149
      end
      inherited sbtnApagar: TToolbarButton97
        Left = 89
      end
    end
  end
  inherited Dock971: TDock97
    Top = 358
    Width = 511
    inherited tb97Fundo: TToolbar97
      Left = 339
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 170
    end
  end
  object Panel1: TPanel [3]
    Left = 0
    Top = 47
    Width = 511
    Height = 134
    Align = alTop
    BevelOuter = bvLowered
    Enabled = False
    TabOrder = 3
    object Label5: TLabel
      Left = 12
      Top = 6
      Width = 85
      Height = 13
      Caption = 'Nº do Contrato'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 120
      Top = 6
      Width = 103
      Height = 13
      Caption = 'Nome do Contrato'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 12
      Top = 46
      Width = 61
      Height = 13
      Caption = 'Comprador'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 12
      Top = 87
      Width = 44
      Height = 13
      Caption = 'Parcela'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 392
      Top = 46
      Width = 65
      Height = 13
      Caption = 'Documento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 88
      Top = 87
      Width = 91
      Height = 13
      Caption = 'Tipo de Parcela'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 275
      Top = 87
      Width = 67
      Height = 13
      Caption = 'Vencimento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 392
      Top = 87
      Width = 30
      Height = 13
      Caption = 'Valor'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtNumero: TwwDBEdit
      Left = 12
      Top = 21
      Width = 97
      Height = 21
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object edtNome: TwwDBEdit
      Left = 120
      Top = 21
      Width = 369
      Height = 21
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object edtComprador: TwwDBEdit
      Left = 12
      Top = 60
      Width = 369
      Height = 21
      TabOrder = 2
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object edtDocumento: TwwDBEdit
      Left = 392
      Top = 60
      Width = 97
      Height = 21
      TabOrder = 3
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object edtParcela: TwwDBEdit
      Left = 12
      Top = 102
      Width = 65
      Height = 21
      TabOrder = 4
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object edtTipo: TwwDBEdit
      Left = 88
      Top = 102
      Width = 169
      Height = 21
      TabOrder = 5
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object edtVencto: TCMDateTimePicker
      Left = 275
      Top = 102
      Width = 106
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
      TabOrder = 6
    end
    object edtValor: TDBRealEdit
      Left = 392
      Top = 102
      Width = 97
      Height = 21
      Alignment = taRightJustify
      DragKind = dkDock
      Lines.Strings = (
        '      0,00')
      TabOrder = 7
      WordWrap = False
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Top = 358
    TargetsData = (
      1
      1
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 403
    Top = 65534
  end
  inherited ImlPadrao: TImageList
    Left = 89
    Top = 358
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 348
    Top = 65534
  end
  inherited Cds: TCMClientDataSet
    ProviderName = 'dsp'
    Left = 300
    object CdsDATALANCTO: TDateTimeField
      Alignment = taCenter
      DisplayLabel = 'Data'
      DisplayWidth = 10
      FieldName = 'DATALANCTO'
    end
    object CdsDESCRICAO: TStringField
      DisplayLabel = 'Alterador'
      DisplayWidth = 24
      FieldName = 'DESCRICAO'
      Size = 35
    end
    object CdsVALOR: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 14
      FieldName = 'VALOR'
      DisplayFormat = '###,##0.00'
    end
    object CdsHISTORICOCOMPL: TStringField
      DisplayLabel = 'Histórico'
      DisplayWidth = 60
      FieldName = 'HISTORICOCOMPL'
      Size = 60
    end
    object CdsCODDOCUMENTO: TFloatField
      DisplayWidth = 10
      FieldName = 'CODDOCUMENTO'
      Visible = False
    end
    object CdsNUMLANCTO: TFloatField
      DisplayWidth = 10
      FieldName = 'NUMLANCTO'
      Visible = False
    end
    object CdsCODALTERADOR: TFloatField
      DisplayWidth = 10
      FieldName = 'CODALTERADOR'
      Visible = False
    end
    object CdsPLNCODIGO: TFloatField
      DisplayWidth = 10
      FieldName = 'PLNCODIGO'
      Visible = False
    end
    object CdsVALOROUTRAMOEDA: TFloatField
      DisplayWidth = 10
      FieldName = 'VALOROUTRAMOEDA'
      Visible = False
    end
    object CdsDEBCRE: TStringField
      DisplayWidth = 1
      FieldName = 'DEBCRE'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object CdsOPERACAO: TStringField
      DisplayWidth = 2
      FieldName = 'OPERACAO'
      Visible = False
      FixedChar = True
      Size = 2
    end
    object CdsNODOCUMENTO: TFloatField
      DisplayWidth = 10
      FieldName = 'NODOCUMENTO'
      Visible = False
    end
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'CI.CONNUMERO'
      'CI.CONNOME'
      'P.NOME'
      'CP.NUMPARCELAS'
      'PF.NUMPARCELA'
      'PF.DATAVENCIMENTO'
      'PF.CODDOCUMENTO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'N'
      'N'
      'D'
      'N')
    Descricao.Strings = (
      'Nr. do Contrato'
      'Descrição do Contrato'
      'Comprador'
      'Total de Parcelas'
      'Nr. da Parcela'
      'Vencimento'
      'Cod. Documento')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PARCFINANCIMOV PF'
      'CONDPAGIMOVEL CP'
      'CONTRATOIMOVEL CI'
      'PESSOA P')
    CamposChave.Strings = (
      'PF.CODDOCUMENTO'
      'CI.CONNUMERO'
      'CI.CONNOME'
      'P.NOME'
      'PF.CODDOCUMENTO'
      'PF.NUMPARCELA'
      'CP.NUMPARCELAS'
      'PF.FLGTIPOLANC'
      'PF.DATAVENCIMENTO'
      'PF.VLRPRESTACAO'
      'PF.VLRAMORTIZACAO'
      'CI.IDCONTRATOIMOVEL')
    Filtro.Strings = (
      'PF.IDCONDPAGIMOVEL = CP.IDCONDINICIAL'
      'CP.IDCONTRATOIMOVEL = CI.IDCONTRATOIMOVEL'
      'CI.IDLOCATARIO = P.IDPESSOA'
      'PF.CODDOCUMENTO IS NOT NULL')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '20'
      '60'
      '60'
      '10'
      '10'
      '18'
      '10')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    Left = 253
    Top = 65534
  end
  object qry: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   LD.CODDOCUMENTO, LD.NUMLANCTO,'
      '   LD.CODALTERADOR, LD.PLNCODIGO,'
      '   LD.DATALANCTO, LD.VALOR, LD.VALOROUTRAMOEDA,'
      '   LD.DEBCRE, LD.OPERACAO, LD.HISTORICOCOMPL,'
      ''
      '   A.DESCRICAO,'
      ''
      '   D.NODOCUMENTO'
      ''
      'FROM'
      '   LANCTODOCUM LD, TIPOALTERADOR A, DOCUMENTO D'
      ''
      'WHERE'
      '   ( LD.CODDOCUMENTO =:PCODDOCUMENTO )'
      '   AND ( RTRIM(LD.OPERACAO) = '#39'4'#39' )'
      '   AND ( LD.CODALTERADOR = A.CODALTERADOR )'
      '   AND ( LD.CODDOCUMENTO = D.CODDOCUMENTO )'
      ''
      'ORDER BY'
      '   LD.DATALANCTO, A.DESCRICAO'
      '')
    ValidateWithMask = True
    Left = 448
    Top = 65535
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PCODDOCUMENTO'
        ParamType = ptUnknown
      end>
  end
  object dsp: TDataSetProvider
    DataSet = qry
    Constraints = True
    Left = 448
    Top = 15
  end
  object dsTipoAlterador: TDataSource
    DataSet = qryTipoAlterador
    Left = 453
    Top = 236
  end
  object qryTipoAlterador: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT DISTINCT TP.CODTIPIMOVEL, TP.CODALTCMAL, TP.CODALTJRAL, T' +
        'P.CODALTMTAL'
      'FROM CONTRATOXIMOVEL CXI, IMOVEL I, TIPOIMOVEL TP'
      'WHERE CXI.IDIMOVEL         = I.IDIMOVEL'
      '  AND I.CODTIPIMOVEL       = TP.CODTIPIMOVEL'
      '  AND CXI.IDCONTRATOIMOVEL = :PIDCONTRATOIMOVEL')
    Left = 465
    Top = 246
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end>
    object qryTipoAlteradorCODTIPIMOVEL: TStringField
      FieldName = 'CODTIPIMOVEL'
      Origin = 'BASEDADOS.TIPOIMOVEL.CODTIPIMOVEL'
      Size = 5
    end
    object qryTipoAlteradorCODALTCMAL: TFloatField
      FieldName = 'CODALTCMAL'
      Origin = 'BASEDADOS.TIPOIMOVEL.CODALTCMAL'
    end
    object qryTipoAlteradorCODALTJRAL: TFloatField
      FieldName = 'CODALTJRAL'
      Origin = 'BASEDADOS.TIPOIMOVEL.CODALTJRAL'
    end
    object qryTipoAlteradorCODALTMTAL: TFloatField
      FieldName = 'CODALTMTAL'
      Origin = 'BASEDADOS.TIPOIMOVEL.CODALTMTAL'
    end
  end
end
