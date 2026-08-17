inherited frmCadAmortizacao: TfrmCadAmortizacao
  Left = 432
  Top = 258
  HelpContext = 1350006
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  Caption = 'Lançamento de Amortização'
  ClientHeight = 350
  ClientWidth = 533
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Top = 145
    Width = 533
    Height = 166
    inherited dbGrd: TwwDBGrid [0]
      Width = 531
      Height = 164
      Selected.Strings = (
        'CAL_SALDOANT'#9'12'#9'Saldo ~Inicial'#9'F'
        'DATAVENCIMENTO'#9'10'#9'Data'#9'F'
        'FATORCORRECAO'#9'10'#9'Fator ~Pro Rata'#9'F'
        'CAL_SALDOPRORATA'#9'12'#9'Saldo ~Pro Rata'#9'F'
        'VLRPRESTACAO'#9'10'#9'Valor ~Amortizado'#9'F'
        'CAL_SALDOPOSAMORT'#9'12'#9'Saldo Pos ~Amortização'#9'F'
        'CAL_SALDODESCAP'#9'12'#9'Saldo ~Descapitalizado'#9'F'
        'CAL_PROPORCAO'#9'10'#9'Proporção'#9'F'
        'VLRCORRSALDO'#9'10'#9'Correção do ~Valor Amortizado'#9'F'
        'VLRNOMINAL'#9'10'#9'VLRNOMINAL'#9'F')
      TitleAlignment = taCenter
      TitleLines = 2
    end
    inherited pnlControles: TPanel [1]
      Width = 531
      Height = 164
      object Label3: TLabel
        Left = 32
        Top = 16
        Width = 119
        Height = 13
        Caption = 'Data da Amortização'
      end
      object Label4: TLabel
        Left = 240
        Top = 16
        Width = 121
        Height = 13
        Caption = 'Valor da Amortização'
      end
      object edDataAni: TCMDateTimePicker
        Left = 33
        Top = 32
        Width = 121
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        DataField = 'DATAVENCIMENTO'
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
        TabOrder = 0
        OnCloseUp = edDataAniCloseUp
        OnChange = edDataAniChange
        OnExit = edDataAniCloseUp
      end
      object edValAvali: TDBRealEdit
        Left = 239
        Top = 32
        Width = 132
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '0,00')
        TabOrder = 1
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'VLRPRESTACAO'
        DataSource = ds
      end
    end
  end
  inherited Dock972: TDock97
    Width = 533
  end
  inherited Dock971: TDock97
    Top = 311
    Width = 533
  end
  object Panel1: TPanel [3]
    Left = 0
    Top = 47
    Width = 533
    Height = 98
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 3
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
      Left = 272
      Top = 46
      Width = 139
      Height = 13
      Caption = 'Condição de Pagamento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
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
      Left = 118
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
    object edtComprador: TEdit
      Left = 12
      Top = 61
      Width = 245
      Height = 21
      Enabled = False
      TabOrder = 0
    end
    object dblcCondPag: TCMDBLookupCombo
      Left = 272
      Top = 61
      Width = 246
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DSCCOND'#9'34'#9'Vencimento    Valor Finaciado   Nr. Parcelas'#9'F')
      LookupTable = qryCondPag
      LookupField = 'DSCCOND'
      Options = [loTitles]
      Style = csDropDownList
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
      OnCloseUp = dblcCondPagCloseUp
    end
    object edtNumProp: TEdit
      Left = 12
      Top = 21
      Width = 105
      Height = 21
      Enabled = False
      TabOrder = 2
    end
    object edtNomProp: TEdit
      Left = 116
      Top = 21
      Width = 402
      Height = 21
      Enabled = False
      TabOrder = 3
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 256
    Top = 6
    TargetsData = (
      1
      1
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 379
    Top = 6
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update PARCFINANCIMOV'
      'set'
      '  IDCONDPAGIMOVEL = :IDCONDPAGIMOVEL,'
      '  DATAVENCIMENTO = :DATAVENCIMENTO,'
      '  VLRPRESTACAO = :VLRPRESTACAO,'
      '  VLRNOMINAL = :VLRNOMINAL,'
      '  VLRAMORTIZACAO = :VLRAMORTIZACAO,'
      '  NUMPARCELA = :NUMPARCELA,'
      '  VLRSALDODEVEDOR = :VLRSALDODEVEDOR,'
      '  FLGTIPOLANC = :FLGTIPOLANC,'
      '  FLGLANCINTEGRA = :FLGLANCINTEGRA,'
      '  IDINDCORRECAO = :IDINDCORRECAO,'
      '  FATORCORRECAO = :FATORCORRECAO,'
      '  VLRCORRSALDO = :VLRCORRSALDO'
      'where'
      '  IDPARCFINANCIMOV = :OLD_IDPARCFINANCIMOV')
    InsertSQL.Strings = (
      'insert into PARCFINANCIMOV'
      
        '  (IDPARCFINANCIMOV, IDCONDPAGIMOVEL, DATAVENCIMENTO, VLRPRESTAC' +
        'AO, VLRNOMINAL, '
      
        '   VLRAMORTIZACAO, NUMPARCELA, VLRSALDODEVEDOR, FLGTIPOLANC, FLG' +
        'LANCINTEGRA, '
      '   IDINDCORRECAO, FATORCORRECAO, VLRCORRSALDO)'
      'values'
      
        '  (:IDPARCFINANCIMOV, :IDCONDPAGIMOVEL, :DATAVENCIMENTO, :VLRPRE' +
        'STACAO, '
      
        '   :VLRNOMINAL, :VLRAMORTIZACAO, :NUMPARCELA, :VLRSALDODEVEDOR, ' +
        ':FLGTIPOLANC, '
      
        '   :FLGLANCINTEGRA, :IDINDCORRECAO, :FATORCORRECAO, :VLRCORRSALD' +
        'O)')
    DeleteSQL.Strings = (
      'delete from PARCFINANCIMOV'
      'where'
      '  IDPARCFINANCIMOV = :OLD_IDPARCFINANCIMOV')
    Left = 411
    Top = 6
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'CONTRATOIMOVEL.CONNUMERO'
      'CONTRATOIMOVEL.CONNOME'
      'CONTRATOIMOVEL.CONDATAINICIO'
      'CONTRATOIMOVEL.CONDATAASSINATURA'
      'PESSOA.RAZAOSOCIAL')
    TipodeDado.Strings = (
      'C'
      'C'
      'D'
      'D'
      'C')
    Descricao.Strings = (
      'Nr. do Contrato'
      'Nome do Contrato'
      'Data da Proposta'
      'Data do Contrato'
      'Comprador')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'CONTRATOIMOVEL'
      'PESSOA')
    CamposChave.Strings = (
      'CONTRATOIMOVEL.IDCONTRATOIMOVEL'
      'CONTRATOIMOVEL.CONNUMERO'
      'CONTRATOIMOVEL.CONNOME'
      'PESSOA.RAZAOSOCIAL')
    Filtro.Strings = (
      'CONTRATOIMOVEL.IDLOCATARIO = PESSOA.IDPESSOA'
      'CONTRATOIMOVEL.FLGTIPOCONTRATO = '#39'C'#39)
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '20'
      '60'
      '18'
      '18'
      '60')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    LookupSQL.Strings = (
      ''
      ''
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      ''
      '')
    Left = 501
    Top = 6
  end
  inherited ImlPadrao: TImageList
    Left = 297
    Top = 6
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 460
    Top = 6
  end
  inherited qry: TwwQuery
    OnCalcFields = qryCalcFields
    SQL.Strings = (
      'SELECT'
      '     IDPARCFINANCIMOV,'
      '     IDCONDPAGIMOVEL,'
      '     DATAVENCIMENTO,'
      '     VLRPRESTACAO,'
      '     VLRNOMINAL,'
      '     VLRAMORTIZACAO,'
      '     NUMPARCELA,'
      '     VLRSALDODEVEDOR,'
      '     FLGTIPOLANC,'
      '     FLGLANCINTEGRA,'
      '     IDINDCORRECAO,'
      '     FATORCORRECAO,'
      '     VLRCORRSALDO'
      'FROM'
      '     PARCFINANCIMOV'
      'WHERE'
      '      (FLGTIPOLANC = 5 )'
      '  AND (IDCONDPAGIMOVEL = :IDCONDPAGIMOVEL)'
      ''
      'ORDER BY DATAVENCIMENTO DESC'
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' ')
    Left = 338
    Top = 6
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCONDPAGIMOVEL'
        ParamType = ptUnknown
      end>
    object qryCAL_SALDOANT: TFloatField
      DisplayLabel = 'Saldo ~Inicial'
      DisplayWidth = 12
      FieldKind = fkCalculated
      FieldName = 'CAL_SALDOANT'
      DisplayFormat = '###,##0.00'
      Calculated = True
    end
    object qryDATAVENCIMENTO: TDateTimeField
      DisplayLabel = 'Data'
      DisplayWidth = 10
      FieldName = 'DATAVENCIMENTO'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryFATORCORRECAO: TFloatField
      DisplayLabel = 'Fator ~Pro Rata'
      DisplayWidth = 10
      FieldName = 'FATORCORRECAO'
      DisplayFormat = '##0.000000'
    end
    object qryCAL_SALDOPRORATA: TFloatField
      DisplayLabel = 'Saldo ~Pro Rata'
      DisplayWidth = 12
      FieldKind = fkCalculated
      FieldName = 'CAL_SALDOPRORATA'
      DisplayFormat = '###,##0.00'
      Calculated = True
    end
    object qryVLRPRESTACAO: TFloatField
      DisplayLabel = 'Valor ~Amortizado'
      DisplayWidth = 10
      FieldName = 'VLRPRESTACAO'
      DisplayFormat = '###,##0.00'
    end
    object qryCAL_SALDOPOSAMORT: TFloatField
      DisplayLabel = 'Saldo Pos ~Amortização'
      DisplayWidth = 12
      FieldKind = fkCalculated
      FieldName = 'CAL_SALDOPOSAMORT'
      DisplayFormat = '###,##0.00'
      Calculated = True
    end
    object qryCAL_SALDODESCAP: TFloatField
      DisplayLabel = 'Saldo ~Descapitalizado'
      DisplayWidth = 12
      FieldKind = fkCalculated
      FieldName = 'CAL_SALDODESCAP'
      DisplayFormat = '###,##0.00'
      Calculated = True
    end
    object qryCAL_PROPORCAO: TFloatField
      DisplayLabel = 'Proporção'
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'CAL_PROPORCAO'
      DisplayFormat = '##0.00'
      Calculated = True
    end
    object qryVLRCORRSALDO: TFloatField
      DisplayLabel = 'Correção do ~Valor Amortizado'
      DisplayWidth = 10
      FieldName = 'VLRCORRSALDO'
      Origin = 'BASEDADOS.PARCFINANCIMOV.VLRCORRSALDO'
      DisplayFormat = '###,##0.00'
    end
    object qryVLRNOMINAL: TFloatField
      DisplayWidth = 10
      FieldName = 'VLRNOMINAL'
      Origin = 'BASEDADOS."CM.PARCFINANCIMOV".VLRNOMINAL'
    end
    object qryVLRSALDODEVEDOR: TFloatField
      DisplayLabel = 'Saldo ~Inicial'
      DisplayWidth = 12
      FieldName = 'VLRSALDODEVEDOR'
      Visible = False
      DisplayFormat = '###,##0.00'
    end
    object qryFLGTIPOLANC: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGTIPOLANC'
      Visible = False
    end
    object qryIDPARCFINANCIMOV: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPARCFINANCIMOV'
      Visible = False
    end
    object qryIDCONDPAGIMOVEL: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCONDPAGIMOVEL'
      Visible = False
    end
    object qryIDINDCORRECAO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDINDCORRECAO'
      Visible = False
    end
    object qryFLGLANCINTEGRA: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGLANCINTEGRA'
      Visible = False
    end
    object qryVLRAMORTIZACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'VLRAMORTIZACAO'
      Visible = False
    end
    object qryNUMPARCELA: TFloatField
      DisplayWidth = 10
      FieldName = 'NUMPARCELA'
      Visible = False
    end
  end
  object qryCondPag: TwwQuery
    Tag = 5
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '       CP.IDCONTRATOIMOVEL,'
      '       CP.IDCONDPAGIMOVEL,'
      '       CP.IDCONDINICIAL,'
      '       CPI.DATAVENCIMENTO AS DATAVENCTOINICIAL,'
      '       DECODE(NVL(CP.VLRFINANC,0),0,'
      
        '         (TO_CHAR(CP.DATAVENCIMENTO,'#39'DD/MM/YYYY'#39') || '#39' '#39' || TO_C' +
        'HAR(CPI.VLRFINANC,'#39'99999,999,999.99'#39') || '#39'  '#39' || TO_CHAR(CP.NUMP' +
        'ARCELAS,'#39'999'#39')),'
      
        '         (TO_CHAR(CP.DATAVENCIMENTO,'#39'DD/MM/YYYY'#39') || '#39' '#39' || TO_C' +
        'HAR(CP.VLRFINANC,'#39'99999,999,999.99'#39') || '#39'  '#39' || TO_CHAR(CP.NUMPA' +
        'RCELAS,'#39'999'#39')) )  AS DSCCOND'
      'FROM'
      '       CONDPAGIMOVEL CP,'
      '       CONDPAGIMOVEL CPI,'
      '       PARCFINANCIMOV P'
      'WHERE'
      '      (CP.TIPOCONDPAG IN('#39'P'#39','#39'R'#39') )'
      '  AND  P.IDCONDPAGIMOVEL = CP.IDCONDPAGIMOVEL'
      '  AND  P.CODDOCUMENTO IS NULL'
      '  AND  P.FLGTIPOLANC IN(3,4)'
      '  AND  P.FLGLANCINTEGRA NOT IN (2,3,4,7)'
      '  AND (CP.IDREPACTUA IS NULL)'
      '  AND (CP.IDCONDINICIAL = CPI.IDCONDPAGIMOVEL)'
      '  AND (CP.IDCONTRATOIMOVEL = :IDCONTRATOIMOVEL)'
      ''
      ''
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 450
    Top = 94
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end>
    object qryCondPagDSCCOND: TStringField
      DisplayLabel = 'Vencimento    Valor Finaciado   Nr. Parcelas'
      DisplayWidth = 34
      FieldName = 'DSCCOND'
      Size = 34
    end
    object qryCondPagIDCONTRATOIMOVEL: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCONTRATOIMOVEL'
      Origin = 'BASEDADOS.CONDPAGIMOVEL.IDCONTRATOIMOVEL'
      Visible = False
    end
    object qryCondPagIDCONDPAGIMOVEL: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCONDPAGIMOVEL'
      Origin = 'BASEDADOS.CONDPAGIMOVEL.IDCONDPAGIMOVEL'
      Visible = False
    end
    object qryCondPagIDCONDINICIAL: TFloatField
      FieldName = 'IDCONDINICIAL'
    end
    object qryCondPagDATAVENCTOINICIAL: TDateTimeField
      FieldName = 'DATAVENCTOINICIAL'
    end
  end
  object qryVerifParc: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPARCFINANCIMOV,'
      '       IDCONDPAGIMOVEL,'
      '       VLRSALDODEVEDOR,'
      '       DATAVENCIMENTO'
      '  FROM PARCFINANCIMOV'
      ' WHERE ( IDCONDPAGIMOVEL = :pIDCONDPAGIMOVEL )'
      '   AND ( FLGTIPOLANC IN(1,2,3,4,5) )'
      '   AND ( DATAVENCIMENTO <= :pDTAMORTIZACAO )'
      ' ORDER BY DATAVENCIMENTO DESC'
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 288
    Top = 168
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIDCONDPAGIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'pDTAMORTIZACAO'
        ParamType = ptUnknown
      end>
    object qryVerifParcIDPARCFINANCIMOV: TFloatField
      FieldName = 'IDPARCFINANCIMOV'
    end
    object qryVerifParcIDCONDPAGIMOVEL: TFloatField
      FieldName = 'IDCONDPAGIMOVEL'
    end
    object qryVerifParcVLRSALDODEVEDOR: TFloatField
      FieldName = 'VLRSALDODEVEDOR'
    end
    object qryVerifParcDATAVENCIMENTO: TDateTimeField
      FieldName = 'DATAVENCIMENTO'
    end
  end
  object qryVerifDataAmort: TwwQuery
    Tag = 5
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT MAX(DATAVENCIMENTO) AS DATALIMITE'
      'FROM   PARCFINANCIMOV'
      'WHERE  IDCONDPAGIMOVEL = :PIDCONDPAGIMOVEL'
      '  AND  ( ( FLGTIPOLANC IN(2,3,4) AND'
      '           DATAPAGAMENTO IS NOT NULL ) OR'
      '         ( FLGTIPOLANC = 5 ) )'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 450
    Top = 174
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONDPAGIMOVEL'
        ParamType = ptUnknown
      end>
  end
  object qryVerifParcCondPagto: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPARCFINANCIMOV,'
      '       IDCONDPAGIMOVEL,'
      '       VLRSALDODEVEDOR,'
      '       DATAVENCIMENTO'
      '  FROM PARCFINANCIMOV'
      ' WHERE ( IDCONDPAGIMOVEL = :pIDCONDPAGIMOVEL )'
      '   AND ( FLGTIPOLANC = 1 )'
      '   AND ( DATAVENCIMENTO >= :pDTAMORTIZACAO )'
      ' ORDER BY DATAVENCIMENTO '
      ''
      ' ')
    ValidateWithMask = True
    Left = 280
    Top = 240
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIDCONDPAGIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'pDTAMORTIZACAO'
        ParamType = ptUnknown
      end>
    object qryVerifParcCondPagtoIDPARCFINANCIMOV: TFloatField
      FieldName = 'IDPARCFINANCIMOV'
      Origin = 'BASEDADOS.PARCFINANCIMOV.IDPARCFINANCIMOV'
    end
    object qryVerifParcCondPagtoIDCONDPAGIMOVEL: TFloatField
      FieldName = 'IDCONDPAGIMOVEL'
      Origin = 'BASEDADOS.PARCFINANCIMOV.IDCONDPAGIMOVEL'
    end
    object qryVerifParcCondPagtoVLRSALDODEVEDOR: TFloatField
      FieldName = 'VLRSALDODEVEDOR'
      Origin = 'BASEDADOS.PARCFINANCIMOV.VLRSALDODEVEDOR'
    end
    object qryVerifParcCondPagtoDATAVENCIMENTO: TDateTimeField
      FieldName = 'DATAVENCIMENTO'
      Origin = 'BASEDADOS.PARCFINANCIMOV.DATAVENCIMENTO'
    end
  end
end
