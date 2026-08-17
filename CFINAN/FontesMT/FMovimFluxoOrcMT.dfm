inherited frmMovimFluxoOrcMT: TfrmMovimFluxoOrcMT
  Left = 386
  Top = 62
  Caption = 'frmMovimFluxoOrcMT'
  ClientHeight = 522
  ClientWidth = 635
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 635
    Height = 436
    object Bevel2: TBevel
      Left = -1
      Top = 268
      Width = 634
      Height = 9
      Shape = bsTopLine
    end
    object lblUnidNegoc: TLabel
      Left = 16
      Top = 58
      Width = 108
      Height = 13
      Caption = 'Atividade / Projeto'
    end
    object lblCentroRespon: TLabel
      Left = 16
      Top = 106
      Width = 160
      Height = 13
      Caption = 'Centro de Responsabilidade'
    end
    object lblData: TLabel
      Left = 328
      Top = 106
      Width = 98
      Height = 13
      Caption = 'Data Vencimento'
    end
    object lblTipoRD: TLabel
      Left = 16
      Top = 206
      Width = 196
      Height = 13
      Caption = 'Tipo de Recebimento/Desembolso'
    end
    object Label1: TLabel
      Left = 328
      Top = 206
      Width = 44
      Height = 13
      Caption = 'Usuário'
    end
    object Label2: TLabel
      Left = 498
      Top = 206
      Width = 28
      Height = 13
      Caption = 'Data'
    end
    object Label4: TLabel
      Left = 16
      Top = 154
      Width = 84
      Height = 13
      Caption = 'Linha do Fluxo'
    end
    object Label6: TLabel
      Left = 16
      Top = 287
      Width = 69
      Height = 13
      Caption = 'Observação'
    end
    object lblValorDet: TLabel
      Left = 328
      Top = 154
      Width = 124
      Height = 13
      Caption = 'Valor Moeda Corrente'
    end
    object Label19: TLabel
      Left = 328
      Top = 58
      Width = 118
      Height = 13
      Caption = 'Plano Previdenciário'
    end
    object Label18: TLabel
      Left = 328
      Top = 12
      Width = 80
      Height = 13
      Caption = 'Patrocinadora'
    end
    object Bevel1: TBevel
      Left = 314
      Top = 0
      Width = 9
      Height = 268
      Shape = bsLeftLine
    end
    object lblRateio: TLabel
      Left = 16
      Top = 12
      Width = 118
      Height = 13
      Caption = 'Rateio Pré-definido: '
    end
    object Label3: TLabel
      Left = 467
      Top = 106
      Width = 131
      Height = 13
      Caption = 'Identificador de Rateio'
    end
    object dblcUnidNegoc: TwwDBLookupCombo
      Left = 16
      Top = 72
      Width = 288
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'30'#9'Descrição'#9'F')
      DataField = 'UNIDNEGOC'
      DataSource = ds
      LookupTable = cdsUnidNeg
      LookupField = 'UNIDNEGOC'
      Options = [loTitles]
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
    end
    object dblcCentroRespon: TwwDBLookupCombo
      Left = 16
      Top = 120
      Width = 288
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'30'#9'Nome'#9'F'
        'CODEXTERNO'#9'10'#9'Código'#9'F')
      DataField = 'CODCENTRORESPON'
      DataSource = ds
      LookupTable = cdsCentroRespon
      LookupField = 'CODCENTRORESPON'
      Options = [loTitles]
      TabOrder = 2
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      OnChange = dblcCentroResponChange
      OnDropDown = dblcCentroResponDropDown
      OnCloseUp = dblcCentroResponCloseUp
    end
    object dbeDataLanc: TCMDateTimePicker
      Left = 328
      Top = 120
      Width = 99
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      ButtonStyle = cbsCustom
      DataField = 'DATAPROGRAMADA'
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
      TabOrder = 7
    end
    object DBEdNomeUsuario: TDBEdit
      Left = 327
      Top = 224
      Width = 161
      Height = 21
      TabStop = False
      Color = clBtnFace
      DataField = 'NOMEUSUARIO'
      DataSource = ds
      ReadOnly = True
      TabOrder = 9
    end
    object DBEdData: TDBEdit
      Left = 496
      Top = 224
      Width = 131
      Height = 21
      TabStop = False
      Color = clBtnFace
      DataField = 'TRGDTINCLUSAO'
      DataSource = ds
      ReadOnly = True
      TabOrder = 10
    end
    object dblcTipoRD: TwwDBLookupCombo
      Left = 16
      Top = 224
      Width = 288
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'30'#9'Descrição'#9'F'
        'RECPAG'#9'1'#9'Rec/Pag'#9'F'
        'CODTIPRECDES'#9'15'#9'Código'#9'F')
      DataField = 'CODTIPRECDES'
      DataSource = ds
      LookupTable = cdsTipoRecDes
      LookupField = 'CODTIPRECDES'
      Options = [loColLines, loRowLines, loTitles]
      TabOrder = 4
      AutoDropDown = True
      ShowButton = True
      UseTFields = False
      AllowClearKey = True
      OnChange = dblcTipoRDChange
      OnCloseUp = dblcTipoRDCloseUp
      OnEnter = dblcTipoRDEnter
    end
    object dblcLinhasFluxo: TwwDBLookupCombo
      Left = 16
      Top = 170
      Width = 289
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'30'#9'Descrição'#9'F')
      DataField = 'CODLINHAFLUXO'
      DataSource = ds
      LookupTable = cdsLinhaFluxo
      LookupField = 'CODLINHAFLUXO'
      Options = [loTitles]
      TabOrder = 3
      AutoDropDown = True
      ShowButton = True
      UseTFields = False
      AllowClearKey = True
      OnChange = dblcLinhasFluxoChange
      OnCloseUp = dblcLinhasFluxoCloseUp
      OnEnter = dblcLinhasFluxoEnter
      OnExit = dblcLinhasFluxoExit
    end
    object dbmObs: TDBMemo
      Left = 16
      Top = 304
      Width = 596
      Height = 114
      DataField = 'OBSERVACAO'
      DataSource = ds
      MaxLength = 300
      TabOrder = 11
    end
    object dbeValor: TDBRealEdit
      Left = 328
      Top = 170
      Width = 124
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '      0,00')
      TabOrder = 8
      WordWrap = False
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
      DataField = 'VALOR'
      DataSource = ds
    end
    object dblcPlanoPrev: TwwDBLookupCombo
      Left = 328
      Top = 72
      Width = 288
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'30'#9'Descrição'#9'F')
      DataField = 'IDPLANOPREV'
      DataSource = ds
      LookupTable = cdsPlanoPrev
      LookupField = 'IDPLANOPREV'
      Options = [loTitles]
      TabOrder = 6
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      OnKeyDown = dblcPlanoPrevKeyDown
    end
    object dblcPatrocinador: TwwDBLookupCombo
      Left = 328
      Top = 28
      Width = 289
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'RAZAOSOCIAL'#9'30'#9'Descrição'#9'F')
      DataField = 'IDPATRO'
      DataSource = ds
      LookupTable = cdsPatrocinador
      LookupField = 'IDPESSOA'
      Options = [loTitles]
      TabOrder = 5
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      OnKeyDown = dblcPatrocinadorKeyDown
    end
    object DBcboGrupoRateioFluxo: TwwDBLookupCombo
      Left = 16
      Top = 28
      Width = 289
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'GRRFDESCRICAO'#9'60'#9'Grupo de Rateio'#9'F')
      LookupTable = cdsGrupoRateioFluxo
      LookupField = 'IDGRUPORATEIOFLUXO'
      DropDownWidth = 8
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
      OnExit = DBcboGrupoRateioFluxoExit
      OnKeyPress = DBcboGrupoRateioFluxoKeyPress
    end
    object dbeIdRateio: TDBEdit
      Left = 468
      Top = 120
      Width = 146
      Height = 21
      TabStop = False
      Color = clBtnFace
      DataField = 'IDENTIFICADORDERATEIO'
      DataSource = ds
      ReadOnly = True
      TabOrder = 12
    end
  end
  inherited Dock972: TDock97
    Width = 635
  end
  inherited Dock971: TDock97
    Top = 483
    Width = 635
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
    object FlgPermiteLancamentos: TCheckBox
      Left = 16
      Top = 2
      Width = 169
      Height = 17
      Caption = 'Flag Permite Lançam.'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      Visible = False
    end
    object FlgInclusaoAlteracaoExclusao: TCheckBox
      Left = 16
      Top = 18
      Width = 169
      Height = 17
      Caption = 'Flg Inclusao Alteracao Exclusao'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      Visible = False
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 626
    Top = 15
    TargetsData = (
      1
      5
      (
        'TRealEdit'
        'Text'
        0)
      (
        'TDBRealEdit'
        'Text'
        0)
      (
        'TwwDBRichEdit'
        'Text'
        0)
      (
        'TDBMemo'
        'Text'
        0)
      (
        ''
        'DisplayLabel'
        0))
  end
  inherited ds: TwwDataSource
    Left = 358
    Top = 7
  end
  inherited ImlPadrao: TImageList
    Left = 600
    Top = 65535
  end
  inherited CmeCadastro: TCmEventosCadastro
    RepetirInsert = False
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    Left = 280
    Top = 7
  end
  inherited Cds: TCMClientDataSet
    Left = 324
    Top = 7
  end
  inherited MontaSelect: TMontaSelect
    Caption = ''
    Colunas.Strings = (
      'FLUXOORCADO.DATAPROGRAMADA'
      'TIPORECEBDESEMB.DESCRICAO'
      'FLUXOORCADO.RECPAG'
      'CENTRESPON.NOME'
      'FLUXOORCADO.VALOR'
      'MONTAFLUXO.DESCRICAO'
      'USUARIOSISTEMA.NOMEUSUARIO'
      'FLUXOORCADO.IDENTIFICADORDERATEIO'
      'FLUXOORCADO.OBSERVACAO')
    TipodeDado.Strings = (
      'D'
      'C'
      'C'
      'C'
      'N'
      'C'
      'C'
      'N'
      'C')
    Descricao.Strings = (
      'Data de Vencimento'
      'Tipo Receb./Desemb.'
      'R/P               '
      'Centro de Responsabilidade'
      'Valor Moeda Corrente'
      'Linha do Fluxo'
      'Nome do Usuário'
      'Identificador de Rateio'
      'Observação')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'FLUXOORCADO'
      'TIPORECEBDESEMB'
      'MONTAFLUXO'
      'UNIDNEGOCIO'
      'CENTRESPON'
      'USUARIOSISTEMA')
    CamposChave.Strings = (
      'FLUXOORCADO.IDFLUXOORCADO'
      'FLUXOORCADO.CODLINHAFLUXO')
    Filtro.Strings = (
      'TIPORECEBDESEMB.CODTIPRECDES(+) = FLUXOORCADO.CODTIPRECDES'
      'TIPORECEBDESEMB.IDPESSOA(+) = FLUXOORCADO.IDPESSOA'
      'TIPORECEBDESEMB.RECPAG(+) = FLUXOORCADO.RECPAG'
      'MONTAFLUXO.CODLINHAFLUXO(+) = FLUXOORCADO.CODLINHAFLUXO'
      'UNIDNEGOCIO.UNIDNEGOC = FLUXOORCADO.UNIDNEGOC'
      'UNIDNEGOCIO.IDPESSOA = FLUXOORCADO.IDPESSOA'
      'CENTRESPON.CODCENTRORESPON = FLUXOORCADO.CODCENTRORESPON'
      'CENTRESPON.IDPESSOA = FLUXOORCADO.IDPESSOA'
      
        'RTRIM('#39'CM'#39' || TO_CHAR(USUARIOSISTEMA.IDUSUARIO)) = RTRIM(FLUXOOR' +
        'CADO.TRGUSERINCLUSAO)')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '10'
      '5'
      '10'
      '10'
      '60'
      '20'
      '10'
      '50')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    BeforeOpenCds = MontaSelectBeforeOpenCds
    LookupSQL.Strings = (
      ''
      ''
      ''
      ''
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
      ''
      ''
      ''
      ''
      '')
    Left = 416
    Top = 8
  end
  object cdsTipoRecDes: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 572
    Top = 407
  end
  object cdsCentroRespon: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 420
    Top = 415
  end
  object cdsUnidNeg: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 500
    Top = 415
  end
  object cdsTipoDoc: TCMClientDataSet
    Aggregates = <>
    FilterOptions = [foCaseInsensitive]
    Params = <>
    ProviderName = 'Dsp'
    Left = 388
    Top = 343
  end
  object cdsPlanoPrev: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 244
    Top = 415
  end
  object cdsPatrocinador: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 164
    Top = 415
  end
  object cdsMoeda: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 92
    Top = 415
  end
  object cdsLinhaFluxo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 28
    Top = 415
  end
  object cdsSegregaCriter: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 332
    Top = 415
  end
  object CdsFluxoCaixa: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 176
    Top = 303
  end
  object dsFluxoCaixa: TDataSource
    DataSet = CdsFluxoCaixa
    OnDataChange = dsFluxoCaixaDataChange
    Left = 280
    Top = 311
  end
  object cdsGrupoRateioFluxo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 140
    Top = 92
    object cdsGrupoRateioFluxoGRRFDESCRICAO: TStringField
      DisplayLabel = 'Grupo de Rateio'
      FieldName = 'GRRFDESCRICAO'
      Size = 60
    end
    object cdsGrupoRateioFluxoIDGRUPORATEIOFLUXO: TFloatField
      FieldName = 'IDGRUPORATEIOFLUXO'
      Visible = False
    end
  end
  object cdsPadraoRateioFluxo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 244
    Top = 92
  end
  object qryAux: TwwQuery
    DatabaseName = 'BASEDADOS'
    ValidateWithMask = True
    Left = 512
    Top = 71
  end
end
