inherited FrmCadHstParamIRRFMT: TFrmCadHstParamIRRFMT
  Left = 204
  Top = 24
  HelpContext = 240029
  Caption = 'Histórico de Parâmetros do IRRF'
  ClientHeight = 660
  ClientWidth = 928
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 928
    Height = 574
    object Label25: TLabel
      Left = 470
      Top = 332
      Width = 241
      Height = 13
      Caption = 'Regra de Cálculo para Ação Judicial INSS'
    end
    object GroupBox10: TGroupBox
      Left = 8
      Top = 115
      Width = 449
      Height = 446
      Caption = ' Específicos para Rendimentos da Fundação'
      TabOrder = 0
      object Label4: TLabel
        Left = 16
        Top = 18
        Width = 359
        Height = 13
        Caption = 'Parc. Isenta Prov. Apos., Res, Ref e Pensão (65 anos ou mais)'
      end
      object Label9: TLabel
        Left = 16
        Top = 54
        Width = 411
        Height = 13
        Caption = 
          'Parc. Isenta Prov. Apos., Res, Ref e Pensão (65 anos ou mais) pa' +
          'ra 13º'
      end
      object Label10: TLabel
        Left = 16
        Top = 90
        Width = 359
        Height = 13
        Caption = 'Pensão, Prov. Apos. por Moléstia Grave ou por  Acid. em Serv.'
      end
      object Label14: TLabel
        Left = 16
        Top = 126
        Width = 269
        Height = 13
        Caption = 'Linha do Informe para Ação Judicial em Liminar'
      end
      object Label15: TLabel
        Left = 16
        Top = 162
        Width = 321
        Height = 13
        Caption = 'Linha do Informe para Ação Judicial em Liminar para 13º'
      end
      object Label22: TLabel
        Left = 16
        Top = 202
        Width = 296
        Height = 13
        Caption = 'Linha do Informe para Exigibilidade Suspensa - BUA'
      end
      object lblCompensaVlrNegativo: TLabel
        Left = 16
        Top = 240
        Width = 402
        Height = 13
        Caption = 
          'Linha do Informe Oriundo do Acerto de Valor Negativo de Contribu' +
          'ição'
      end
      object Label26: TLabel
        Left = 16
        Top = 280
        Width = 408
        Height = 13
        Caption = 
          'Linha do Informe Oriundo do Acerto de Valor Neg. de Contrib. de ' +
          'Isento'
      end
      object lblCompensaVlrNegativo13s: TLabel
        Left = 16
        Top = 320
        Width = 401
        Height = 13
        Caption = 
          'Linha do Informe Oriundo do Acerto de Valor Neg. de Contribuição' +
          ' 13º'
      end
      object lblInformeContribExtra: TLabel
        Left = 16
        Top = 362
        Width = 282
        Height = 13
        Caption = 'Linha do Informe para Contribuição Extraordinária'
      end
      object lblInformeContribExtra13: TLabel
        Left = 16
        Top = 402
        Width = 334
        Height = 13
        Caption = 'Linha do Informe para Contribuição Extraordinária para 13º'
      end
      object dblcAcima65Abono: TwwDBLookupCombo
        Left = 16
        Top = 68
        Width = 417
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMEINFORME'#9'60'#9'Linha do Informe'#9'F')
        DataField = 'IDINFORME65ANOS13'
        DataSource = ds
        LookupTable = cdsInforme
        LookupField = 'IDINFORME'
        Color = clWhite
        TabOrder = 1
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = True
      end
      object dblcAcima65: TwwDBLookupCombo
        Left = 16
        Top = 32
        Width = 417
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMEINFORME'#9'60'#9'Linha do Informe'#9'F')
        DataField = 'IDINFORME65ANOS'
        DataSource = ds
        LookupTable = cdsInforme
        LookupField = 'IDINFORME'
        Options = [loTitles]
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object dblcMolestiaGrave: TwwDBLookupCombo
        Left = 16
        Top = 104
        Width = 417
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMEINFORME'#9'60'#9'Linha do Informe'#9'F')
        DataField = 'IDINFORMEMOLESTIA'
        DataSource = ds
        LookupTable = cdsInforme
        LookupField = 'IDINFORME'
        Options = [loTitles]
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object dblcAcaoJudicial: TwwDBLookupCombo
        Left = 16
        Top = 140
        Width = 417
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMEINFORME'#9'60'#9'Linha do Informe'#9'F')
        DataField = 'IDINFORMEACJUD'
        DataSource = ds
        LookupTable = cdsInforme
        LookupField = 'IDINFORME'
        Options = [loTitles]
        TabOrder = 3
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object dblcAcaoJudicialAbono: TwwDBLookupCombo
        Left = 16
        Top = 176
        Width = 417
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMEINFORME'#9'60'#9'Linha do Informe'#9'F')
        DataField = 'IDINFORMEACJUD13'
        DataSource = ds
        LookupTable = cdsInforme
        LookupField = 'IDINFORME'
        Options = [loTitles]
        TabOrder = 4
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object dblcEgibilidadeSuspensa: TwwDBLookupCombo
        Left = 16
        Top = 216
        Width = 417
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMEINFORME'#9'60'#9'Linha do Informe'#9'F')
        DataField = 'IDExigibilidadeSuspensa'
        DataSource = ds
        LookupTable = cdsInforme
        LookupField = 'IDINFORME'
        Options = [loTitles]
        Color = clWhite
        TabOrder = 5
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object dblcInfRendCompNeg: TwwDBLookupCombo
        Left = 16
        Top = 254
        Width = 417
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMEINFORME'#9'60'#9'Linha do Informe'#9'F')
        DataField = 'IDINFRENDCOMPNEG'
        DataSource = ds
        LookupTable = cdsInforme
        LookupField = 'IDINFORME'
        Options = [loTitles]
        Color = clWhite
        TabOrder = 6
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object wwDBLookupCombo8: TwwDBLookupCombo
        Left = 16
        Top = 294
        Width = 417
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMEINFORME'#9'60'#9'Linha do Informe'#9'F')
        DataField = 'IDINFRENDCOMPNEGISENTO'
        DataSource = ds
        LookupTable = cdsInforme
        LookupField = 'IDINFORME'
        Options = [loTitles]
        Color = clWhite
        TabOrder = 7
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object dblcInfRendCompNeg13s: TwwDBLookupCombo
        Left = 16
        Top = 334
        Width = 417
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMEINFORME'#9'60'#9'Linha do Informe'#9'F')
        DataField = 'IDINFRENDCOMPNEG13S'
        DataSource = ds
        LookupTable = cdsInforme
        LookupField = 'IDINFORME'
        Options = [loTitles]
        Color = clWhite
        TabOrder = 8
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object dblcIDINFORMECONTRIBEXTRA: TwwDBLookupCombo
        Left = 16
        Top = 376
        Width = 417
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMEINFORME'#9'60'#9'Linha do Informe'#9'F')
        DataField = 'IDINFORMECONTRIBEXTRA'
        DataSource = ds
        LookupTable = cdsInforme
        LookupField = 'IDINFORME'
        TabOrder = 9
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
      end
      object dblcIDINFORMECONTRIBEXTRA13: TwwDBLookupCombo
        Left = 16
        Top = 416
        Width = 417
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMEINFORME'#9'60'#9'Linha do Informe'#9'F')
        DataField = 'IDINFORMECONTRIBEXTRA13'
        DataSource = ds
        LookupTable = cdsInforme
        LookupField = 'IDINFORME'
        TabOrder = 10
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
      end
    end
    object Geral: TGroupBox
      Left = 10
      Top = 8
      Width = 907
      Height = 89
      Caption = 'Geral'
      TabOrder = 1
      object lblDtIniVig: TLabel
        Left = 14
        Top = 23
        Width = 69
        Height = 26
        Caption = 'Data Início de Vigência'
        WordWrap = True
      end
      object lblIdadeIdoso: TLabel
        Left = 166
        Top = 35
        Width = 117
        Height = 13
        Caption = 'Idade para Dedução'
        WordWrap = True
      end
      object VlrIdoso: TLabel
        Left = 325
        Top = 23
        Width = 107
        Height = 26
        Caption = 'Valor da Dedução por Idade'
        WordWrap = True
      end
      object lblVlrDep: TLabel
        Left = 485
        Top = 23
        Width = 125
        Height = 26
        Caption = 'Valor da Dedução por Dependente'
        WordWrap = True
      end
      object lblPercIrExt: TLabel
        Left = 650
        Top = 23
        Width = 123
        Height = 26
        Caption = 'Alíquota para Residente no Exterior '
        WordWrap = True
      end
      object dbedDtIniVig: TCMDateTimePicker
        Left = 14
        Top = 52
        Width = 121
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        DataField = 'DATAINIVIGENCIA'
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
      end
      object dbedtIdadeIdoso: TDBEdit
        Left = 166
        Top = 52
        Width = 121
        Height = 21
        DataField = 'IDADEIDOSO'
        DataSource = ds
        TabOrder = 1
      end
      object dbredtVlrIdoso: TDBRealEdit
        Left = 324
        Top = 52
        Width = 121
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '0,00')
        TabOrder = 2
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'VLRIDOSO'
        DataSource = ds
      end
      object dbredtVlrDep: TDBRealEdit
        Left = 485
        Top = 52
        Width = 121
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '0,00')
        TabOrder = 3
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'VLRDEPENDENTE'
        DataSource = ds
      end
      object dbredtPercIrExt: TDBRealEdit
        Left = 649
        Top = 52
        Width = 121
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '0,00')
        TabOrder = 4
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'PERCIRRFEXTERIOR'
        DataSource = ds
      end
    end
    object gbInss: TGroupBox
      Left = 468
      Top = 115
      Width = 449
      Height = 205
      Caption = ' Específicos para Rendimentos INSS '
      TabOrder = 2
      object Label11: TLabel
        Left = 16
        Top = 18
        Width = 359
        Height = 13
        Caption = 'Parc. Isenta Prov. Apos., Res, Ref e Pensão (65 anos ou mais)'
      end
      object Label12: TLabel
        Left = 16
        Top = 90
        Width = 359
        Height = 13
        Caption = 'Pensão, Prov. Apos. por Moléstia Grave ou por  Acid. em Serv.'
      end
      object Label13: TLabel
        Left = 16
        Top = 54
        Width = 411
        Height = 13
        Caption = 
          'Parc. Isenta Prov. Apos., Res, Ref e Pensão (65 anos ou mais) pa' +
          'ra 13º'
      end
      object Label23: TLabel
        Left = 16
        Top = 126
        Width = 269
        Height = 13
        Caption = 'Linha do Informe para Ação Judicial em Liminar'
      end
      object Label24: TLabel
        Left = 16
        Top = 162
        Width = 321
        Height = 13
        Caption = 'Linha do Informe para Ação Judicial em Liminar para 13º'
      end
      object cboInforme65INSS: TwwDBLookupCombo
        Left = 16
        Top = 32
        Width = 417
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMEINFORME'#9'60'#9'Linha do Informe'#9'F')
        DataField = 'IDINFORME65INSS'
        DataSource = ds
        LookupTable = cdsInforme
        LookupField = 'IDINFORME'
        Options = [loTitles]
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object cboInformeMolINSS: TwwDBLookupCombo
        Left = 16
        Top = 104
        Width = 417
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMEINFORME'#9'60'#9'Linha do Informe'#9'F')
        DataField = 'IDINFORMEMOLINSS'
        DataSource = ds
        LookupTable = cdsInforme
        LookupField = 'IDINFORME'
        Options = [loTitles]
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object cboInforme65INSSAbono: TwwDBLookupCombo
        Left = 16
        Top = 68
        Width = 417
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMEINFORME'#9'60'#9'Linha do Informe'#9'F')
        DataField = 'IDINFORME65INSS13'
        DataSource = ds
        LookupTable = cdsInforme
        LookupField = 'IDINFORME'
        TabOrder = 1
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = True
      end
      object dblcAcaoJudicialInss: TwwDBLookupCombo
        Left = 16
        Top = 140
        Width = 417
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMEINFORME'#9'60'#9'Linha do Informe'#9'F')
        DataField = 'IdAcaoJudicialInss'
        DataSource = ds
        LookupTable = cdsInforme
        LookupField = 'IDINFORME'
        Options = [loTitles]
        Color = clWhite
        TabOrder = 3
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object dblcAcaoJudicialInss13: TwwDBLookupCombo
        Left = 16
        Top = 176
        Width = 417
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMEINFORME'#9'60'#9'Linha do Informe'#9'F')
        DataField = 'IdAcaoJudicialInss13'
        DataSource = ds
        LookupTable = cdsInforme
        LookupField = 'IDINFORME'
        Options = [loTitles]
        Color = clWhite
        TabOrder = 4
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
    end
    object dblcRegraAcaoJudicialINSS: TwwDBLookupCombo
      Left = 469
      Top = 348
      Width = 417
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOMEREGRA'#9'60'#9'Nome da Regra'#9'F')
      DataField = 'IdRegraInss'
      DataSource = ds
      LookupTable = cdsRegra
      LookupField = 'IDREGRA'
      Options = [loTitles]
      TabOrder = 3
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
  end
  inherited Dock972: TDock97
    Width = 928
  end
  inherited Dock971: TDock97
    Top = 621
    Width = 928
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 842
    Top = 11
    TargetsData = (
      1
      2
      (
        'TDBRealEdit'
        'Text'
        0)
      (
        ''
        'DisplayLabel'
        0))
  end
  inherited ds: TwwDataSource
    Left = 472
    Top = 13
  end
  inherited ImlPadrao: TImageList
    Left = 774
    Top = 13
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 322
    Top = 9
  end
  inherited Cds: TCMClientDataSet
    Left = 396
    Top = 11
    object CdsIDHSTPARAMIRRF: TFloatField
      FieldName = 'IDHSTPARAMIRRF'
    end
    object CdsVLRIDOSO: TFloatField
      FieldName = 'VLRIDOSO'
    end
    object CdsDATAINIVIGENCIA: TDateTimeField
      FieldName = 'DATAINIVIGENCIA'
    end
    object CdsVLRDEPENDENTE: TFloatField
      FieldName = 'VLRDEPENDENTE'
    end
    object CdsPERCIRRFEXTERIOR: TFloatField
      FieldName = 'PERCIRRFEXTERIOR'
    end
    object CdsIDADEIDOSO: TFloatField
      FieldName = 'IDADEIDOSO'
    end
    object CdsTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
    end
    object CdsTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Size = 30
    end
    object CdsIDINFORME65ANOS: TFloatField
      FieldName = 'IDINFORME65ANOS'
    end
    object CdsIDINFORME65ANOS13: TFloatField
      FieldName = 'IDINFORME65ANOS13'
    end
    object CdsIDINFORMEMOLESTIA: TFloatField
      FieldName = 'IDINFORMEMOLESTIA'
    end
    object CdsIDINFORMEACJUD: TFloatField
      FieldName = 'IDINFORMEACJUD'
    end
    object CdsIDINFORMEACJUD13: TFloatField
      FieldName = 'IDINFORMEACJUD13'
    end
    object CdsIDEXIGIBILIDADESUSPENSA: TFloatField
      FieldName = 'IDEXIGIBILIDADESUSPENSA'
    end
    object CdsIDINFRENDCOMPNEG: TFloatField
      FieldName = 'IDINFRENDCOMPNEG'
    end
    object CdsIDINFRENDCOMPNEGISENTO: TFloatField
      FieldName = 'IDINFRENDCOMPNEGISENTO'
    end
    object CdsIDINFRENDCOMPNEG13S: TFloatField
      FieldName = 'IDINFRENDCOMPNEG13S'
    end
    object CdsIDINFORME65INSS: TFloatField
      FieldName = 'IDINFORME65INSS'
    end
    object CdsIDINFORME65INSS13: TFloatField
      FieldName = 'IDINFORME65INSS13'
    end
    object CdsIDINFORMEMOLINSS: TFloatField
      FieldName = 'IDINFORMEMOLINSS'
    end
    object CdsIDACAOJUDICIALINSS: TFloatField
      FieldName = 'IDACAOJUDICIALINSS'
    end
    object CdsIDACAOJUDICIALINSS13: TFloatField
      FieldName = 'IDACAOJUDICIALINSS13'
    end
    object CdsIDREGRAINSS: TFloatField
      FieldName = 'IDREGRAINSS'
    end
    object CdsIDINFORMECONTRIBEXTRA: TFloatField
      FieldName = 'IDINFORMECONTRIBEXTRA'
    end
    object CdsIDINFORMECONTRIBEXTRA13: TFloatField
      FieldName = 'IDINFORMECONTRIBEXTRA13'
    end
  end
  inherited MontaSelect: TMontaSelect
    Caption = ''
    Colunas.Strings = (
      'H.DATAINIVIGENCIA'
      'H.IDADEIDOSO'
      'H.VLRIDOSO'
      'H.VLRDEPENDENTE'
      'H.PERCIRRFEXTERIOR')
    TipodeDado.Strings = (
      'D'
      'N'
      'N'
      'N'
      'N')
    Descricao.Strings = (
      'Data Início de Vigência'
      'Idade para Redução'
      'Val. da Redução para Idoso'
      'Valor por Dependente'
      'Perc. Residente Exterior')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'HSTPARAMIRRF H')
    CamposChave.Strings = (
      'H.IDHSTPARAMIRRF')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '3'
      '17'
      '17'
      '3')
    OperComparador.Strings = (
      '0'
      '0'
      '0'
      '0'
      '0')
    BeforeOpenCds = MontaSelectBeforeOpenCds
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
    Left = 256
    Top = 7
  end
  object SQLCds: TCMSqlParams
    SQL.Strings = (
      'SELECT * '
      'FROM HSTPARAMIRRF '
      ' WHERE IDHSTPARAMIRRF = -1')
    ClientDataSet = Cds
    Left = 195
    Top = 48
  end
  object cdsInforme: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 558
    Top = 14
  end
  object cdsRegra: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 650
    Top = 16
  end
end
