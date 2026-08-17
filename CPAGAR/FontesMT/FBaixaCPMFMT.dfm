inherited FrmBaixaCPMFMT: TFrmBaixaCPMFMT
  Left = 303
  Top = 180
  BorderStyle = bsDialog
  Caption = 'Baixa CPMF'
  ClientHeight = 409
  ClientWidth = 508
  FormStyle = fsNormal
  Visible = False
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 508
    Height = 370
    object Bevel1: TBevel
      Left = 153
      Top = 21
      Width = 331
      Height = 43
      Shape = bsFrame
    end
    object Label5: TLabel
      Left = 23
      Top = 21
      Width = 99
      Height = 13
      Caption = 'Data Programada'
    end
    object Label1: TLabel
      Left = 165
      Top = 38
      Width = 181
      Height = 13
      Caption = 'Valor Total da CPMF para baixa'
    end
    object GbLancaAjuste: TGroupBox
      Left = 24
      Top = 71
      Width = 461
      Height = 273
      Enabled = False
      TabOrder = 3
      object lblUnidNegoc: TLabel
        Left = 15
        Top = 72
        Width = 104
        Height = 13
        Caption = 'Atividade\Projeto:'
      end
      object lblCentroRespon: TLabel
        Left = 15
        Top = 120
        Width = 107
        Height = 13
        Caption = 'Centro de Respon.'
      end
      object lblTipoRD: TLabel
        Left = 15
        Top = 168
        Width = 116
        Height = 13
        Caption = 'Tipo de Desembolso'
      end
      object Label6: TLabel
        Left = 15
        Top = 216
        Width = 92
        Height = 13
        Caption = 'Centro de Custo'
      end
      object lblValorDet: TLabel
        Left = 239
        Top = 216
        Width = 124
        Height = 13
        Caption = 'Valor Moeda Corrente'
      end
      object Label11: TLabel
        Left = 239
        Top = 120
        Width = 118
        Height = 13
        Caption = 'Plano Previdenciário'
      end
      object Label12: TLabel
        Left = 239
        Top = 168
        Width = 80
        Height = 13
        Caption = 'Patrocinadora'
      end
      object Label13: TLabel
        Left = 239
        Top = 72
        Width = 54
        Height = 13
        Caption = 'Programa'
      end
      object lblTipoDocum: TLabel
        Left = 15
        Top = 22
        Width = 112
        Height = 13
        Caption = 'Tipo de Documento'
      end
      object lblHistorico: TLabel
        Left = 239
        Top = 22
        Width = 142
        Height = 13
        Caption = 'Histórico do Lançamento'
      end
      object dblcUnidNegoc: TwwDBLookupCombo
        Left = 15
        Top = 89
        Width = 206
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'25'#9'Descrição'
          'UNETIPO'#9'1'#9'T'
          'UNECODIGO'#9'10'#9'Código')
        LookupTable = CdsUnidNegoc
        LookupField = 'UNIDNEGOC'
        Options = [loColLines, loTitles]
        Style = csDropDownList
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        OrderByDisplay = False
        AllowClearKey = True
        ShowMatchText = True
      end
      object dblcCentroRespon: TwwDBLookupCombo
        Left = 15
        Top = 137
        Width = 206
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'25'#9'Descrição'
          'ANALITICOSINTET'#9'1'#9'T'
          'CODCENTRORESPON'#9'10'#9'Código')
        LookupTable = CdsCentroRespon
        LookupField = 'CODCENTRORESPON'
        Options = [loColLines, loTitles]
        Style = csDropDownList
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        OrderByDisplay = False
        UseTFields = False
        AllowClearKey = True
        ShowMatchText = True
      end
      object dblcTipoRD: TwwDBLookupCombo
        Left = 15
        Top = 185
        Width = 206
        Height = 21
        DropDownAlignment = taRightJustify
        Selected.Strings = (
          'DESCRICAO'#9'35'#9'Descrição'
          'CODTIPRECDES'#9'15'#9'Código')
        LookupTable = CdsTipoRD
        LookupField = 'CODTIPRECDES'
        Options = [loColLines, loTitles]
        Style = csDropDownList
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        OrderByDisplay = False
        UseTFields = False
        AllowClearKey = True
        ShowMatchText = True
        OnCloseUp = dblcTipoRDCloseUp
      end
      object CmbCentCusto: TwwDBLookupCombo
        Left = 15
        Top = 233
        Width = 206
        Height = 21
        DropDownAlignment = taRightJustify
        Selected.Strings = (
          'NOME'#9'25'#9'Descrição'
          'CODCENTROCUSTO'#9'10'#9'Código'
          'STATUSGRUPOCDC'#9'1'#9'A/S')
        LookupTable = CdsCentroCusto
        LookupField = 'CODCENTROCUSTO'
        Options = [loColLines, loTitles]
        Style = csDropDownList
        TabOrder = 3
        AutoDropDown = True
        ShowButton = True
        OrderByDisplay = False
        UseTFields = False
        AllowClearKey = True
        ShowMatchText = True
      end
      object dbeValorDet: TRealEdit
        Left = 239
        Top = 233
        Width = 206
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        ParentShowHint = False
        ShowHint = False
        TabOrder = 7
        WordWrap = False
        IntDigits = 17
        DecDigits = 2
        NumberFormat = fNumber
        Signal = True
      end
      object CmbPlano: TCMDBLookupCombo
        Left = 239
        Top = 137
        Width = 206
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'50'#9'Plano Previdenciário')
        LookupTable = CdsPlanoPrev
        LookupField = 'IDPLANOPREV'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 5
        AutoDropDown = True
        ShowButton = True
        OrderByDisplay = False
        AllowClearKey = True
        ShowMatchText = True
      end
      object CmbPatro: TCMDBLookupCombo
        Left = 239
        Top = 185
        Width = 206
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'60'#9'Nome')
        LookupTable = CdsPatroPrev
        LookupField = 'IDPESSOA'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 6
        AutoDropDown = True
        ShowButton = True
        OrderByDisplay = False
        AllowClearKey = True
        ShowMatchText = True
      end
      object CmbPrograma: TCMDBLookupCombo
        Left = 239
        Top = 89
        Width = 205
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCPROGRAMA'#9'60'#9'Descrição'
          'CODPROGRAMA'#9'2'#9'Código')
        DataField = 'IDPROGRAMA'
        LookupTable = CdsProgramaPrev
        LookupField = 'IDPROGRAMA'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 4
        AutoDropDown = True
        ShowButton = True
        OrderByDisplay = False
        AllowClearKey = True
        ShowMatchText = True
      end
      object dblcTipoDoc: TwwDBLookupCombo
        Left = 15
        Top = 39
        Width = 206
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'35'#9'Descrição'
          'DEBCRE'#9'1'#9'D/C'
          'FLGDOCFISCAL'#9'1'#9'Doc. Fiscal'
          'FLGGERANUMDOC'#9'1'#9'Gera Num Doc')
        DataField = 'CODTIPDOC'
        LookupTable = CdsTipoDoc
        LookupField = 'CODTIPDOC'
        Options = [loColLines, loTitles]
        Style = csDropDownList
        DropDownWidth = 650
        TabOrder = 8
        AutoDropDown = True
        ShowButton = True
        OrderByDisplay = False
        UseTFields = False
        AllowClearKey = True
        ShowMatchText = True
      end
      object EdtHistorico: TEdit
        Left = 239
        Top = 40
        Width = 201
        Height = 21
        TabOrder = 9
        Text = 'Lancto Arredondamento de CPMF'
      end
    end
    object DtProgBaixaF: TCMDateTimePicker
      Left = 23
      Top = 38
      Width = 124
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
    object RevalCpmf: TRealEdit
      Left = 353
      Top = 31
      Width = 121
      Height = 21
      Alignment = taRightJustify
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Lines.Strings = (
        '      0,00')
      ParentFont = False
      TabOrder = 1
      WordWrap = False
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
    end
    object CkbArredonda: TCheckBox
      Left = 38
      Top = 68
      Width = 210
      Height = 17
      Caption = 'Lança Arredondamento da CPMF '
      TabOrder = 2
      OnClick = CkbArredondaClick
    end
  end
  inherited Dock971: TDock97
    Top = 370
    Width = 508
    inherited tb97Fundo: TToolbar97
      Left = 336
      inherited bbtnSair: TBitBtn
        Visible = False
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Visible = False
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 167
      inherited bbtnConfirmar: TBitBtn
        ModalResult = 0
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        ModalResult = 0
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 3
    Top = 243
    TargetsData = (
      1
      4
      (
        'TDBRealEdit'
        'Text'
        0)
      (
        'TRealEdit'
        'Text'
        0)
      (
        ''
        'Filter'
        0)
      (
        ''
        'DisplayLabel'
        0))
  end
  object CdsTipoDoc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 40
    Top = 95
  end
  object CdsUnidNegoc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 40
    Top = 151
  end
  object CdsCentroRespon: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 80
    Top = 207
  end
  object CdsTipoRD: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 136
    Top = 263
  end
  object CdsCentroCusto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 48
    Top = 351
  end
  object CdsProgramaPrev: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 272
    Top = 151
  end
  object CdsPlanoPrev: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 272
    Top = 199
  end
  object CdsPatroPrev: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 272
    Top = 255
  end
  object SQLTipoDoc: TCMSqlParams
    SQL.Strings = (
      'SELECT '
      
        '  CODTIPDOC,DESCRICAO,DEBCRE, FLGENGLOBAPARCELA, FLGGERANUMDOC, ' +
        'FLGDOCFISCAL'
      'FROM '
      '  TIPODOCRECPAG '
      'WHERE 1=2')
    ClientDataSet = CdsTipoDoc
    Left = 128
    Top = 103
  end
  object SQLUnidNegoc: TCMSqlParams
    SQL.Strings = (
      'SELECT '
      '   UNIDNEGOC,NOME,UNECODIGO,UNETIPO '
      'FROM '
      '  UNIDNEGOCIO '
      'WHERE '
      '  (IDPESSOA = :IDPESSOA) '
      'ORDER BY '
      '  UNECODIGO,UNETIPO')
    ClientDataSet = CdsUnidNegoc
    Left = 88
    Top = 151
  end
  object SQLCentroRespon: TCMSqlParams
    SQL.Strings = (
      'SELECT '
      '  CEN.CODCENTRORESPON,'
      '  CEN.NOME,'
      '  CEN.ANALITICOSINTET,'
      '  CEN.CODCENTROCUSTO '
      'FROM '
      '  CENTRESPON CEN, '
      '  PESSOAXCRESP PES '
      'WHERE '
      '  (CEN.CODCENTRORESPON=PES.CODCENTRORESPON)')
    ClientDataSet = CdsCentroRespon
    Left = 152
    Top = 191
  end
  object sqlTipoRD: TCMSqlParams
    SQL.Strings = (
      
        'SELECT CODTIPRECDES, RECPAG, PLACONTACREDITO, PLANO, PLACONTA, D' +
        'ESCRICAO, ANASINT, FLGOBRIGARESERVA, FLGCALCULAIMPOSTO, HITCODHI' +
        'ST'
      'FROM TIPORECEBDESEMB WHERE 1=2')
    ClientDataSet = CdsTipoRD
    Left = 168
    Top = 223
  end
  object SQLCentroCusto: TCMSqlParams
    SQL.Strings = (
      'SELECT '
      '   CODCENTROCUSTO, '
      '   NOME, '
      '   STATUSGRUPOCDC, '
      '   IDPROGRAMA '
      'FROM '
      '  CENTCUST '
      'WHERE 1=2')
    ClientDataSet = CdsCentroCusto
    Left = 120
    Top = 328
  end
  object SQLProgramaPrev: TCMSqlParams
    SQL.Strings = (
      
        'SELECT IDPROGRAMA, CODPROGRAMA, DESCPROGRAMA FROM PROGRAMA ORDER' +
        ' BY DESCPROGRAMA')
    ClientDataSet = CdsProgramaPrev
    Left = 320
    Top = 151
  end
  object SQLPlanoPrev: TCMSqlParams
    SQL.Strings = (
      'SELECT IDPLANOPREV, NOME FROM PLANPREVCONTABIL ORDER BY NOME')
    ClientDataSet = CdsPlanoPrev
    Left = 320
    Top = 199
  end
  object SQLPatroPrev: TCMSqlParams
    SQL.Strings = (
      'SELECT PATRO.IDPESSOA, PESSOA.NOME FROM  PESSOA, PATRO'
      'WHERE PESSOA.IDPESSOA = PATRO.IDPESSOA ORDER BY PESSOA.NOME')
    ClientDataSet = CdsPatroPrev
    Left = 320
    Top = 247
  end
  object Cds: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 272
    Top = 63
  end
  object SQL: TCMSqlParams
    ClientDataSet = Cds
    Left = 320
    Top = 55
  end
  object sqlForn: TCMSqlParams
    SQL.Strings = (
      'SELECT '
      '  CONTACFORN, '
      '  CODCENTROCUSTO, '
      '  UNIDNEGOC, '
      '  CODSUBCONTA '
      'FROM EMPRESAFORN '
      'WHERE IDFORCLI = :idforcli AND IDPESSOA = :idempresa')
    ClientDataSet = cdsForn
    Left = 280
  end
  object cdsForn: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 216
  end
end
