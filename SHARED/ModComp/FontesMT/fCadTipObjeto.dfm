inherited frmCadTipObjeto: TfrmCadTipObjeto
  Left = 330
  Top = 161
  Caption = 'Cadastro de Tipos de Objeto Reclamado em Processos'
  ClientHeight = 447
  ClientWidth = 466
  PixelsPerInch = 96
  TextHeight = 13
  inherited Dock972: TDock97 [0]
    Width = 466
  end
  inherited pnlFundo: TPanel [1]
    Width = 466
    Height = 361
    BorderWidth = 2
    object Label2: TLabel
      Left = 16
      Top = 11
      Width = 58
      Height = 13
      Caption = 'Descrição'
      FocusControl = dbedDescr
    end
    object Label3: TLabel
      Left = 16
      Top = 173
      Width = 100
      Height = 13
      Caption = 'Grupo de Objetos'
    end
    object Label1: TLabel
      Left = 16
      Top = 315
      Width = 99
      Height = 13
      Caption = 'Data da Vigência'
    end
    object dbedDescr: TDBEdit
      Left = 16
      Top = 27
      Width = 430
      Height = 21
      DataField = 'DESCRICAO'
      DataSource = ds
      TabOrder = 0
    end
    object dblcGrpObjeto: TwwDBLookupCombo
      Left = 16
      Top = 188
      Width = 431
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'40'#9'DESCRICAO')
      DataField = 'IDGRUPOOBJETO'
      DataSource = ds
      LookupTable = CdsGrpObjeto
      LookupField = 'IDGRUPOOBJETO'
      Style = csDropDownList
      TabOrder = 3
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
    end
    object dbrgRubrica: TDBRadioGroup
      Left = 16
      Top = 217
      Width = 431
      Height = 34
      Caption = 'Objeto Relacionado a uma Rubrica de Folha?'
      Columns = 2
      DataField = 'FLGPROVDESC'
      DataSource = ds
      Items.Strings = (
        'Sim'
        'Não')
      TabOrder = 4
      Values.Strings = (
        '1'
        '0')
      OnChange = dbrgRubricaChange
    end
    object gbxRubrica: TGroupBox
      Left = 16
      Top = 261
      Width = 431
      Height = 44
      Caption = 'Rubrica Relacionada'
      TabOrder = 5
      object dblcRubrica: TwwDBLookupCombo
        Left = 10
        Top = 15
        Width = 411
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRPROVDESC'#9'2'#9'DESCRPROVDESC'#9'F')
        DataField = 'IDPROVENTO'
        DataSource = ds
        LookupTable = CdsRubrica
        LookupField = 'IDPROVENTO'
        Style = csDropDownList
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        OnCloseUp = dblcRubricaCloseUp
      end
    end
    object gbxPrograma: TGroupBox
      Left = 16
      Top = 60
      Width = 431
      Height = 46
      Caption = 'Programa'
      TabOrder = 1
      object Label4: TLabel
        Left = 8
        Top = 63
        Width = 27
        Height = 13
        Caption = 'Para'
      end
      object dblckTipProc: TwwDBLookupCombo
        Tag = 1
        Left = 8
        Top = 20
        Width = 411
        Height = 21
        Hint = 'Programa'
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMETIPOPROC'#9'60'#9'Programa'#9'F')
        DataField = 'IDTIPOPROC'
        DataSource = ds
        LookupTable = qryLkpPrograma
        LookupField = 'IDTIPOPROC'
        Style = csDropDownList
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        UseTFields = False
        AllowClearKey = True
        OnCloseUp = dblckTipProcCloseUp
      end
      object wwDBLookupCombo1: TwwDBLookupCombo
        Left = 8
        Top = 75
        Width = 250
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMETIPOPROC'#9'60'#9'Tipo de Processo')
        DataField = 'IDTIPOPROC_PARA'
        LookupField = 'IDTIPOPROC'
        Style = csDropDownList
        Enabled = False
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        UseTFields = False
        AllowClearKey = True
      end
    end
    object gbxSubPrograma: TGroupBox
      Left = 16
      Top = 115
      Width = 431
      Height = 47
      Caption = 'Sub-Programa'
      TabOrder = 2
      object Label5: TLabel
        Left = 8
        Top = 63
        Width = 27
        Height = 13
        Caption = 'Para'
      end
      object wwDBLookupCombo3: TwwDBLookupCombo
        Left = 8
        Top = 75
        Width = 250
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMETIPOPROC'#9'60'#9'Tipo de Processo')
        DataField = 'IDTIPOPROC_PARA'
        LookupField = 'IDTIPOPROC'
        Style = csDropDownList
        Enabled = False
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        UseTFields = False
        AllowClearKey = True
      end
      object dblckTipoOperacao: TwwDBLookupCombo
        Tag = 1
        Left = 8
        Top = 20
        Width = 410
        Height = 21
        Hint = 'Sub-Programa'
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'TIPDESCRICAO'#9'45'#9'Sub_Programa'#9'F')
        DataField = 'TIPCODIGO'
        DataSource = ds
        LookupTable = qryLkpSub_Programa
        LookupField = 'TIPCODIGO'
        Style = csDropDownList
        DropDownCount = 10
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        UseTFields = False
        AllowClearKey = True
      end
    end
    object dbeDtVigencia: TCMDateTimePicker
      Left = 16
      Top = 330
      Width = 120
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
      TabOrder = 6
    end
  end
  inherited Dock971: TDock97
    Top = 408
    Width = 466
    inherited tb97Fundo: TToolbar97
      Left = 294
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 125
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 418
    Top = 14
  end
  inherited ds: TwwDataSource
    Left = 140
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 418
    Top = 1
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    Left = 353
    Top = 14
  end
  inherited Cds: TCMClientDataSet
    Left = 70
    Top = 19
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Tipo de Objeto Reclamado'
    Colunas.Strings = (
      'TIPOOBJPROCTRAB.CODTIPOOBJETO'
      'TIPOOBJPROCTRAB.DESCRICAO')
    TipodeDado.Strings = (
      'N'
      'C')
    Descricao.Strings = (
      'Código'
      'Descrição')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'TIPOOBJPROCTRAB')
    CamposChave.Strings = (
      'TIPOOBJPROCTRAB.CODTIPOOBJETO')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '100')
    ExibePergunta = False
    Left = 353
    Top = 1
  end
  object CdsRubrica: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 214
    Top = 24
  end
  object CdsGrpObjeto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 282
    Top = 1
  end
  object qryLkpPrograma: TwwQuery
    DatabaseName = 'BaseDados'
    Constrained = True
    SQL.Strings = (
      'select * from tipoprocesso'
      'order by nometipoproc')
    ValidateWithMask = True
    Left = 243
    Top = 114
    object qryLkpProgramaIDTIPOPROC: TFloatField
      FieldName = 'IDTIPOPROC'
      Origin = 'BASEDADOS.TIPOPROCESSO.IDTIPOPROC'
    end
    object qryLkpProgramaNOMETIPOPROC: TStringField
      FieldName = 'NOMETIPOPROC'
      Origin = 'BASEDADOS.TIPOPROCESSO.NOMETIPOPROC'
      Size = 60
    end
    object qryLkpProgramaPROCFIXO: TFloatField
      FieldName = 'PROCFIXO'
      Origin = 'BASEDADOS.TIPOPROCESSO.PROCFIXO'
    end
    object qryLkpProgramaTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
      Origin = 'BASEDADOS.TIPOPROCESSO.TRGDTINCLUSAO'
    end
    object qryLkpProgramaTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Origin = 'BASEDADOS.TIPOPROCESSO.TRGUSERINCLUSAO'
      Size = 30
    end
    object qryLkpProgramaFLGEXIGECCUSTO: TFloatField
      FieldName = 'FLGEXIGECCUSTO'
      Origin = 'BASEDADOS.TIPOPROCESSO.FLGEXIGECCUSTO'
    end
  end
  object qryLkpSub_Programa: TwwQuery
    DatabaseName = 'BaseDados'
    Constrained = True
    SQL.Strings = (
      'SELECT T.TIPCODIGO, T.TIPDESCRICAO            '
      'FROM TIPOPER T, JUR_PROGRAMAXSUBPROGRAMA J   '
      'WHERE T.TIPCODIGO = J.TIPCODIGO AND           '
      'J.IDTIPOPROC = 2 '
      'ORDER BY T.TIPCODIGO     '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 321
    Top = 180
    object qryLkpSub_ProgramaTIPCODIGO: TStringField
      FieldName = 'TIPCODIGO'
      FixedChar = True
      Size = 2
    end
    object qryLkpSub_ProgramaTIPDESCRICAO: TStringField
      FieldName = 'TIPDESCRICAO'
      Size = 25
    end
  end
  object qryAux: TQuery
    DatabaseName = 'BaseDados'
    Left = 156
    Top = 64
  end
  object CdsParamRH: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 347
    Top = 97
  end
end
