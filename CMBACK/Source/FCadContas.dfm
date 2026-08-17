inherited frmCadContas: TfrmCadContas
  Left = 161
  Top = 185
  Caption = 'Cadastro de Contas '
  ClientHeight = 371
  ClientWidth = 635
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 635
    Height = 285
    object lblBanco: TLabel
      Left = 12
      Top = 15
      Width = 37
      Height = 13
      Caption = 'Banco'
    end
    object lblAgencia: TLabel
      Left = 219
      Top = 15
      Width = 47
      Height = 13
      Caption = 'Agência'
    end
    object lblConta: TLabel
      Left = 12
      Top = 56
      Width = 86
      Height = 13
      Caption = 'Conta Corrente'
    end
    object lblDescricao: TLabel
      Left = 219
      Top = 56
      Width = 58
      Height = 13
      Caption = 'Descrição'
    end
    object lblMoeda: TLabel
      Left = 423
      Top = 15
      Width = 39
      Height = 13
      Caption = 'Moeda'
    end
    object Bevel1: TBevel
      Left = 12
      Top = 102
      Width = 338
      Height = 32
      Shape = bsFrame
    end
    object gbIntContab: TGroupBox
      Left = 11
      Top = 139
      Width = 610
      Height = 133
      Caption = ' Preencher para Integraçao Contábil '
      TabOrder = 5
      object lblCentroCusto: TLabel
        Left = 314
        Top = 10
        Width = 92
        Height = 13
        Caption = 'Centro de Custo'
      end
      object Label20: TLabel
        Left = 314
        Top = 48
        Width = 55
        Height = 13
        Caption = 'Subconta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblUnidNegoc: TLabel
        Left = 315
        Top = 88
        Width = 104
        Height = 13
        Caption = 'Atividade\Projeto:'
      end
      object CContabil: TCMProcuraMaskContabil
        Left = 8
        Top = 16
        Width = 289
        Height = 108
        Caption = ' Conta Contábil '
        TabOrder = 0
        OnExit = CContabilExit
        MostraMensagens = True
        MostraDescricao = True
        DataSource = ds
        DataField = 'PLACONTA'
        Mensagens.EmBranco = 'Conta Contábil não pode estar em branco'
        Mensagens.NaoExiste = 'Conta Contábil não existe'
        Mensagens.Sintetica = 'Conta Contábil não pode ser sintética'
        Mensagens.Analitica = 'Conta Contábil não pode ser analítica'
        PermiteChaveInvalida = False
        PermiteChaveEmBranco = False
        AceitaTipoConta = SoAnalitica
        Plano = 0
        Status = scSoAtiva
      end
      object dblcCCusto: TwwDBLookupCombo
        Left = 314
        Top = 25
        Width = 275
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'30'#9'Descricao'
          'CODCENTROCUSTO'#9'10'#9'Código')
        DataField = 'CODCENTROCUSTO'
        DataSource = ds
        LookupTable = qryccusto
        LookupField = 'CODCENTROCUSTO'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object dblkSubconta: TwwDBLookupCombo
        Left = 314
        Top = 64
        Width = 275
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMESUBCONTA'#9'30'#9'Nome'
          'CODSUBCONTA'#9'10'#9'Código')
        DataField = 'CODSUBCONTA'
        DataSource = ds
        LookupTable = qrySubConta
        LookupField = 'CODSUBCONTA'
        Style = csDropDownList
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object dblcUnidNegoc: TwwDBLookupCombo
        Left = 315
        Top = 104
        Width = 275
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'25'#9'Descrição'#9'No'
          'UNETIPO'#9'1'#9'T'#9'No'
          'UNECODIGO'#9'10'#9'Código'#9'No')
        DataField = 'UNIDNEGOC'
        DataSource = ds
        LookupTable = qryUnidNegocS
        LookupField = 'UNIDNEGOC'
        Options = [loColLines, loTitles]
        Style = csDropDownList
        TabOrder = 3
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnExit = dblcUnidNegocExit
      end
    end
    object dbeDescricao: TwwDBEdit
      Left = 219
      Top = 71
      Width = 403
      Height = 21
      DataField = 'DESCRICAO'
      DataSource = ds
      TabOrder = 4
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
      OnEnter = dbeDescricaoEnter
    end
    object dbeContaCorrente: TwwDBEdit
      Left = 12
      Top = 71
      Width = 201
      Height = 21
      DataField = 'NOCONTACORR'
      DataSource = ds
      TabOrder = 3
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dblcBanco: TwwDBLookupCombo
      Left = 12
      Top = 28
      Width = 196
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'60'#9'Nome')
      DataField = 'IDBANCO'
      DataSource = ds
      LookupTable = qryBanco
      LookupField = 'IDPESSOA'
      Style = csDropDownList
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      OrderByDisplay = False
      AllowClearKey = True
      ShowMatchText = True
      OnCloseUp = dblcBancoCloseUp
    end
    object dblcAgencia: TwwDBLookupCombo
      Left = 219
      Top = 28
      Width = 196
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'60'#9'Nome'
        'NUMAGENCIA'#9'15'#9'Número da Agência')
      DataField = 'IDAGENCIA'
      DataSource = ds
      LookupTable = qryAgencia
      LookupField = 'IDPESSOA'
      Options = [loTitles]
      Style = csDropDownList
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      OrderByDisplay = False
      AllowClearKey = True
      ShowMatchText = True
      OnCloseUp = dblcAgenciaCloseUp
      OnEnter = dblcAgenciaEnter
    end
    object dblcMoeda: TwwDBLookupCombo
      Left = 420
      Top = 28
      Width = 201
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'MOEDESC'#9'20'#9'MOEDESC')
      DataField = 'MOECODIGO'
      DataSource = ds
      LookupTable = qryMoeda
      LookupField = 'MOECODIGO'
      Style = csDropDownList
      TabOrder = 2
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object dbckGeraFluxo: TDBCheckBox
      Left = 39
      Top = 110
      Width = 308
      Height = 17
      Caption = 'Gera lançamentos desta Conta no Fluxo Real'
      DataField = 'FLGGRAVAFLUXO'
      DataSource = ds
      TabOrder = 6
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
    object DBRadioGroup1: TDBRadioGroup
      Left = 354
      Top = 97
      Width = 267
      Height = 37
      Caption = ' Status '
      Columns = 2
      DataField = 'FLGSTATUS'
      DataSource = ds
      Items.Strings = (
        'Conta Ativa'
        'Conta Inativa')
      TabOrder = 7
      Values.Strings = (
        'A'
        'I')
    end
  end
  inherited Dock972: TDock97
    Width = 635
  end
  inherited Dock971: TDock97
    Top = 332
    Width = 635
    inherited tb97Fundo: TToolbar97
      inherited bbtnSair: TBitBtn
        Tag = 9999
      end
    end
    inherited TB97oKCancelar: TToolbar97
      inherited bbtnCancelar: TBitBtn
        Tag = 9999
      end
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      
        '  CODPORTADOR, IDUSUARIOINCLUSAO, IDAGENCIA, CODCENTROCUSTO, MOE' +
        'CODIGO,'
      
        '  PLANO, PLACONTA, IDBANCO, NOCONTACORR, IDPESSOA, DESCRICAO, ID' +
        'EMPRESA,'
      '  FLGGRAVAFLUXO, UNIDNEGOC, CODSUBCONTA, FLGSTATUS'
      'FROM'
      '  PORTADORCONTA'
      'WHERE'
      '  CODPORTADOR = :CODPORTADOR')
    Left = 243
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CODPORTADOR'
        ParamType = ptUnknown
      end>
    object qryCODPORTADOR: TFloatField
      FieldName = 'CODPORTADOR'
      Origin = 'PORTADORCONTA.CODPORTADOR'
    end
    object qryIDUSUARIOINCLUSAO: TFloatField
      FieldName = 'IDUSUARIOINCLUSAO'
      Origin = 'PORTADORCONTA.IDUSUARIOINCLUSAO'
    end
    object qryIDAGENCIA: TFloatField
      FieldName = 'IDAGENCIA'
      Origin = 'PORTADORCONTA.IDAGENCIA'
    end
    object qryCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      Origin = 'PORTADORCONTA.CODCENTROCUSTO'
      Size = 10
    end
    object qryMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
      Origin = 'PORTADORCONTA.MOECODIGO'
    end
    object qryPLANO: TFloatField
      FieldName = 'PLANO'
      Origin = 'PORTADORCONTA.PLANO'
    end
    object qryPLACONTA: TStringField
      FieldName = 'PLACONTA'
      Origin = 'PORTADORCONTA.PLACONTA'
      Size = 18
    end
    object qryIDBANCO: TFloatField
      FieldName = 'IDBANCO'
      Origin = 'PORTADORCONTA.IDBANCO'
    end
    object qryNOCONTACORR: TStringField
      FieldName = 'NOCONTACORR'
      Origin = 'PORTADORCONTA.NOCONTACORR'
      Size = 15
    end
    object qryIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'PORTADORCONTA.IDPESSOA'
    end
    object qryDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'PORTADORCONTA.DESCRICAO'
      Size = 50
    end
    object qryIDEMPRESA: TFloatField
      FieldName = 'IDEMPRESA'
      Origin = 'PORTADORCONTA.IDEMPRESA'
    end
    object qryFLGGRAVAFLUXO: TStringField
      FieldName = 'FLGGRAVAFLUXO'
      Origin = 'PORTADORCONTA.FLGGRAVAFLUXO'
      Size = 1
    end
    object qryUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
      Origin = '"CM.TIPOAGRE".CODALTERADOR'
    end
    object qryCODSUBCONTA: TFloatField
      FieldName = 'CODSUBCONTA'
      Origin = '"CM.TIPOAGRE".VLRMINIMO'
    end
    object qryFLGSTATUS: TStringField
      FieldName = 'FLGSTATUS'
      Origin = 'PORTADORCONTA.FLGSTATUS'
      Size = 1
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 275
    Top = 171
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update portadorconta'
      'set'
      '  CODPORTADOR = :CODPORTADOR,'
      '  IDUSUARIOINCLUSAO = :IDUSUARIOINCLUSAO,'
      '  IDAGENCIA = :IDAGENCIA,'
      '  CODCENTROCUSTO = :CODCENTROCUSTO,'
      '  MOECODIGO = :MOECODIGO,'
      '  PLANO = :PLANO,'
      '  PLACONTA = :PLACONTA,'
      '  IDBANCO = :IDBANCO,'
      '  NOCONTACORR = :NOCONTACORR,'
      '  IDPESSOA = :IDPESSOA,'
      '  DESCRICAO = :DESCRICAO,'
      '  IDEMPRESA = :IDEMPRESA,'
      '  FLGGRAVAFLUXO = :FLGGRAVAFLUXO,'
      '  UNIDNEGOC = :UNIDNEGOC,'
      '  CODSUBCONTA = :CODSUBCONTA,'
      '  FLGSTATUS = :FLGSTATUS'
      'where'
      '  CODPORTADOR = :OLD_CODPORTADOR')
    InsertSQL.Strings = (
      'insert into portadorconta'
      
        '  (CODPORTADOR, IDUSUARIOINCLUSAO, IDAGENCIA, CODCENTROCUSTO, MO' +
        'ECODIGO, '
      
        '   PLANO, PLACONTA, IDBANCO, NOCONTACORR, IDPESSOA, DESCRICAO, I' +
        'DEMPRESA, '
      '   FLGGRAVAFLUXO, UNIDNEGOC, CODSUBCONTA, FLGSTATUS)'
      'values'
      
        '  (:CODPORTADOR, :IDUSUARIOINCLUSAO, :IDAGENCIA, :CODCENTROCUSTO' +
        ', :MOECODIGO, '
      
        '   :PLANO, :PLACONTA, :IDBANCO, :NOCONTACORR, :IDPESSOA, :DESCRI' +
        'CAO, :IDEMPRESA, '
      '   :FLGGRAVAFLUXO, :UNIDNEGOC, :CODSUBCONTA, :FLGSTATUS)')
    DeleteSQL.Strings = (
      'delete from portadorconta'
      'where'
      '  CODPORTADOR = :OLD_CODPORTADOR')
    Left = 177
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'PORTADORCONTA.DESCRICAO'
      'PORTADORCONTA.NOCONTACORR'
      'PBANCO.NOME'
      'PESSOA.NOME'
      'MOEDA.MOEDESC')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Descrição da Conta'
      'Número da Conta'
      'Banco'
      'Agência'
      'Moeda')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PORTADORCONTA'
      'PESSOA '
      'PESSOA PBANCO'
      'BANCO'
      'MOEDA')
    CamposChave.Strings = (
      'PORTADORCONTA.CODPORTADOR'
      'PORTADORCONTA.IDPESSOA')
    Filtro.Strings = (
      'PORTADORCONTA.IDAGENCIA=PESSOA.IDPESSOA(+)'
      'PORTADORCONTA.IDBANCO=BANCO.IDPESSOA(+)'
      'BANCO.IDPESSOA=PBANCO.IDPESSOA(+)'
      'PORTADORCONTA.MOECODIGO =MOEDA.MOECODIGO(+)')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '10'
      '10'
      '10'
      '10')
    Left = 532
    Top = 5
  end
  inherited ds: TwwDataSource
    Left = 294
    Top = 5
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 348
    Top = 58
  end
  object qryBanco: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '  BANCO.IDPESSOA,BANCO.NUMBANCO , PESSOA.RAZAOSOCIAL, PESSOA.NOM' +
        'E,'
      '  BANCO.MASCARACC, BANCO.MASCARAAGENCIA, BANCO.FLGVALIDACC'
      'FROM'
      '  PESSOA,'
      '  BANCO'
      'WHERE '
      '   PESSOA.IDPESSOA = BANCO.IDPESSOA'
      'ORDER BY'
      '   PESSOA.RAZAOSOCIAL  '
      '')
    ValidateWithMask = True
    Left = 348
    Top = 5
    object qryBancoNOME: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 60
      FieldName = 'NOME'
      Origin = 'PESSOA.NOME'
      Size = 60
    end
    object qryBancoIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BANCO.IDPESSOA'
      Visible = False
    end
    object qryBancoNUMBANCO: TStringField
      FieldName = 'NUMBANCO'
      Origin = 'BANCO.NUMBANCO'
      Visible = False
      Size = 10
    end
    object qryBancoRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Origin = '"CM.PESSOA".RAZAOSOCIAL'
      Visible = False
      Size = 60
    end
    object qryBancoMASCARACC: TStringField
      FieldName = 'MASCARACC'
      Origin = '"CM.BANCO".MASCARACC'
      Visible = False
      Size = 30
    end
    object qryBancoMASCARAAGENCIA: TStringField
      FieldName = 'MASCARAAGENCIA'
      Origin = '"CM.BANCO".MASCARAAGENCIA'
      Visible = False
      Size = 30
    end
    object qryBancoFLGVALIDACC: TStringField
      FieldName = 'FLGVALIDACC'
      Origin = '"CM.BANCO".FLGVALIDACC'
      Visible = False
      Size = 1
    end
  end
  object qryAgencia: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.NOME,A.IDPESSOA, A.NUMAGENCIA FROM PESSOA P, '
      'AGENCIABANCARIA A WHERE P.IDPESSOA=A.IDPESSOA AND'
      '(FLGATIVO = '#39'S'#39' OR FLGATIVO IS NULL)'
      'ORDER BY P.NOME')
    ValidateWithMask = True
    Left = 417
    Top = 5
    object qryAgenciaNOME: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 60
      FieldName = 'NOME'
      Origin = 'PESSOA.NOME'
      Size = 60
    end
    object qryAgenciaNUMAGENCIA: TStringField
      DisplayLabel = 'Número da Agência'
      DisplayWidth = 15
      FieldName = 'NUMAGENCIA'
      Origin = 'AGENCIABANCARIA.NUMAGENCIA'
      Size = 15
    end
    object qryAgenciaIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'AGENCIABANCARIA.IDPESSOA'
      Visible = False
    end
  end
  object qryMoeda: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select * from moeda')
    ValidateWithMask = True
    Left = 486
    Top = 8
  end
  object qryccusto: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  CENT.CODCENTROCUSTO,'
      '  CENT.NOME'
      'FROM'
      '  CONTASxCC CONT,CENTCUST CENT'
      'WHERE'
      '  (CONT.IDEMPRESA = :IDEMPRESA)              AND'
      '  (CONT.PLANO = :PLANO)                      AND'
      '  (RTRIM(CONT.PLACONTA) = :PLACONTA)  AND'
      '  (CONT.IDEMPRESA = CENT.IDEMPRESA)          AND'
      '  (CONT.CODCENTROCUSTO= CENT.CODCENTROCUSTO)')
    ValidateWithMask = True
    Left = 279
    Top = 248
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDEMPRESA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PLANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PLACONTA'
        ParamType = ptUnknown
      end>
    object qryccustoNOME: TStringField
      DisplayLabel = 'Descricao'
      DisplayWidth = 30
      FieldName = 'NOME'
      Size = 30
    end
    object qryccustoCODCENTROCUSTO: TStringField
      DisplayLabel = 'Código'
      DisplayWidth = 10
      FieldName = 'CODCENTROCUSTO'
      Size = 10
    end
  end
  object qrySubConta: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT CODSUBCONTA,IDPESSOA,NOMESUBCONTA FROM SUBCONTA WHERE IDP' +
        'ESSOA = :IDPESSOA'
      'ORDER BY NOMESUBCONTA')
    ValidateWithMask = True
    Left = 277
    Top = 284
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object qrySubContaNOMESUBCONTA: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 30
      FieldName = 'NOMESUBCONTA'
      Size = 60
    end
    object qrySubContaCODSUBCONTA: TFloatField
      DisplayLabel = 'Código'
      DisplayWidth = 10
      FieldName = 'CODSUBCONTA'
    end
    object qrySubContaIDPESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      Visible = False
    end
  end
  object qryUnidNegocS: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT UNIDNEGOC,NOME,UNECODIGO,UNETIPO FROM UNIDNEGOCIO WHERE (' +
        'IDPESSOA = :IDPESSOA) ORDER BY UNECODIGO,UNETIPO')
    ValidateWithMask = True
    Left = 278
    Top = 202
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object qryUnidNegocNOME: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 25
      FieldName = 'NOME'
      Origin = 'UNIDNEGOCIO.NOME'
      Size = 25
    end
    object qryUnidNegocUNETIPO: TStringField
      DisplayLabel = 'T'
      DisplayWidth = 1
      FieldName = 'UNETIPO'
      Origin = 'UNIDNEGOCIO.UNETIPO'
      Size = 1
    end
    object qryUnidNegocUNECODIGO: TStringField
      DisplayLabel = 'Código'
      DisplayWidth = 10
      FieldName = 'UNECODIGO'
      Origin = 'UNIDNEGOCIO.UNECODIGO'
      Size = 10
    end
    object qryUnidNegocUNIDNEGOC: TFloatField
      DisplayLabel = 'Código'
      DisplayWidth = 10
      FieldName = 'UNIDNEGOC'
      Origin = 'UNIDNEGOCIO.UNIDNEGOC'
      Visible = False
    end
  end
end
