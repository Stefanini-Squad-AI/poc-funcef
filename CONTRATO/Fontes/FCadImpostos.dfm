inherited frmCadImpostos: TfrmCadImpostos
  Left = 128
  Top = 132
  Caption = 'Cadastro de Imposto'
  ClientHeight = 350
  ClientWidth = 612
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 612
    Height = 264
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 45
      Height = 13
      Caption = 'Imposto'
    end
    object Label4: TLabel
      Left = 312
      Top = 16
      Width = 56
      Height = 13
      Caption = 'SubConta'
    end
    object DBNomeImposto: TwwDBEdit
      Left = 16
      Top = 32
      Width = 281
      Height = 21
      DataField = 'NOMEIMPOSTO'
      DataSource = ds
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object DBRadioGroup1: TDBRadioGroup
      Left = 315
      Top = 56
      Width = 105
      Height = 69
      Caption = 'Incide sobre'
      DataField = 'ITEMNOTA'
      DataSource = ds
      Items.Strings = (
        'Item'
        'Nota')
      TabOrder = 3
      Values.Strings = (
        'I'
        'N')
    end
    object DBRadioGroup2: TDBRadioGroup
      Left = 436
      Top = 56
      Width = 157
      Height = 69
      Caption = 'Opção'
      DataField = 'PERCVALOR'
      DataSource = ds
      Items.Strings = (
        'Digitar percentual'
        'Digitar valor')
      TabOrder = 4
      Values.Strings = (
        'P'
        'V')
    end
    object DBLookupComboSubConta: TwwDBLookupCombo
      Left = 315
      Top = 32
      Width = 278
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOMESUBCONTA'#9'60'#9'NOMESUBCONTA'#9'No'
        'CODSUBCONTA'#9'10'#9'CODSUBCONTA'#9'No')
      DataField = 'CODSUBCONTA'
      DataSource = ds
      LookupTable = qrySubConta
      LookupField = 'CODSUBCONTA'
      Enabled = False
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object gbIntContab: TGroupBox
      Left = 16
      Top = 136
      Width = 577
      Height = 113
      Caption = 'Preencher para Integraçao Contábil'
      TabOrder = 5
      object lblContaContabil: TLabel
        Left = 16
        Top = 16
        Width = 143
        Height = 13
        Caption = 'Conta Contábil de Débito'
      end
      object Label2: TLabel
        Left = 296
        Top = 16
        Width = 146
        Height = 13
        Caption = 'Conta Contábil de Crédito'
      end
      object Label3: TLabel
        Left = 16
        Top = 64
        Width = 117
        Height = 13
        Caption = 'Descrição da Conta:'
      end
      object Label5: TLabel
        Left = 296
        Top = 64
        Width = 117
        Height = 13
        Caption = 'Descrição da Conta:'
      end
      object Bevel1: TBevel
        Left = 16
        Top = 80
        Width = 265
        Height = 26
      end
      object Bevel2: TBevel
        Left = 296
        Top = 80
        Width = 265
        Height = 26
      end
      object lblContaCredito: TLabel
        Left = 304
        Top = 86
        Width = 253
        Height = 13
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblContaDebito: TLabel
        Left = 24
        Top = 86
        Width = 253
        Height = 13
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btnBuscaContaDebCre1: TBitBtn
        Tag = 1
        Left = 256
        Top = 32
        Width = 23
        Height = 22
        Hint = 'Busca um Locatário'
        TabOrder = 0
        OnClick = btnBuscaContaDebCre1Click
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
          777777777777F88F7777777777700F077777777777F8878F77777777700FFF07
          77777777F8877787F77777700FFFFFF077777778877777F8F7777778FFFFFCF0
          77777F78F77FF8787F771778FFCCCFFF07778FF87F88877F8F7711778FFFFFCF
          077788FF8F77FF8787F711178FFCCCFFF077888F8FF88877F87F71110000FFFC
          FF07788888887FF877877710E7E706CFFFF077887777888777F8770E7E7E70FF
          F887778F777778F7F8877707E7E7E0F88777778F777778F88777770E7E7E7087
          7777778F7777788777777707E7E7E07777777787F7777877777777707E7E0777
          777777787FFF8777777777770000777777777777888877777777}
        NumGlyphs = 2
      end
      object btnBuscaContaDebCre2: TBitBtn
        Tag = 2
        Left = 536
        Top = 32
        Width = 23
        Height = 22
        Hint = 'Busca um Locatário'
        TabOrder = 2
        OnClick = btnBuscaContaDebCre1Click
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
          777777777777F88F7777777777700F077777777777F8878F77777777700FFF07
          77777777F8877787F77777700FFFFFF077777778877777F8F7777778FFFFFCF0
          77777F78F77FF8787F771778FFCCCFFF07778FF87F88877F8F7711778FFFFFCF
          077788FF8F77FF8787F711178FFCCCFFF077888F8FF88877F87F71110000FFFC
          FF07788888887FF877877710E7E706CFFFF077887777888777F8770E7E7E70FF
          F887778F777778F7F8877707E7E7E0F88777778F777778F88777770E7E7E7087
          7777778F7777788777777707E7E7E07777777787F7777877777777707E7E0777
          777777787FFF8777777777770000777777777777888877777777}
        NumGlyphs = 2
      end
      object dbedtContaCredito: TwwDBEdit
        Left = 16
        Top = 32
        Width = 241
        Height = 21
        DataField = 'CONTADEBITO'
        DataSource = ds
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
        OnExit = dbedtContaCreditoExit
      end
      object dbedtContaDebito: TwwDBEdit
        Left = 296
        Top = 32
        Width = 241
        Height = 21
        DataField = 'CONTACREDITO'
        DataSource = ds
        TabOrder = 3
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
        OnExit = dbedtContaDebitoExit
      end
    end
    object DBRadioGroup3: TDBRadioGroup
      Left = 16
      Top = 56
      Width = 281
      Height = 69
      Caption = 'Tratamento'
      DataField = 'TRATAMENTO'
      DataSource = ds
      Items.Strings = (
        'Acrescenta no valor do contrato'
        'Abate no valor a pagar'
        'Somente calcula o valor')
      TabOrder = 2
      Values.Strings = (
        '1'
        '2'
        '3')
    end
  end
  inherited Dock972: TDock97
    Width = 612
  end
  inherited Dock971: TDock97
    Top = 311
    Width = 612
    inherited tb97Fundo: TToolbar97
      Left = 440
      DockPos = 442
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 271
      DockPos = 273
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 65507
    Top = 403
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 360
    Top = 0
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update IMPOSTOSCONTRATO'
      'set'
      '  IDIMPOSTO = :IDIMPOSTO,'
      '  NOMEIMPOSTO = :NOMEIMPOSTO,'
      '  CODSUBCONTA = :CODSUBCONTA,'
      '  TRATAMENTO = :TRATAMENTO,'
      '  IDPESSOA = :IDPESSOA,'
      '  CONTACREDITO = :CONTACREDITO,'
      '  PERCVALOR = :PERCVALOR,'
      '  ITEMNOTA = :ITEMNOTA,'
      '  PLANO = :PLANO,'
      '  CONTADEBITO = :CONTADEBITO'
      'where'
      '  IDIMPOSTO = :OLD_IDIMPOSTO')
    InsertSQL.Strings = (
      'insert into IMPOSTOSCONTRATO'
      
        '  (IDIMPOSTO, NOMEIMPOSTO, CODSUBCONTA, TRATAMENTO, IDPESSOA, CO' +
        'NTACREDITO, '
      '   PERCVALOR, ITEMNOTA, PLANO, CONTADEBITO)'
      'values'
      
        '  (:IDIMPOSTO, :NOMEIMPOSTO, :CODSUBCONTA, :TRATAMENTO, :IDPESSO' +
        'A, :CONTACREDITO, '
      '   :PERCVALOR, :ITEMNOTA, :PLANO, :CONTADEBITO)')
    DeleteSQL.Strings = (
      'delete from IMPOSTOSCONTRATO'
      'where'
      '  IDIMPOSTO = :OLD_IDIMPOSTO')
    Left = 280
    Top = 0
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'IMPOSTOSCONTRATO.NOMEIMPOSTO')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Nome do Imposto')
    Tabelas.Strings = (
      'IMPOSTOSCONTRATO')
    CamposChave.Strings = (
      'IMPOSTOSCONTRATO.IDIMPOSTO')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '10')
    Left = 424
    Top = 0
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 358
    Top = 58
  end
  inherited qry: TwwQuery
    AfterInsert = qryAfterInsert
    SQL.Strings = (
      'SELECT * FROM IMPOSTOSCONTRATO')
    Left = 320
    Top = 0
    object qryIDIMPOSTO: TFloatField
      FieldName = 'IDIMPOSTO'
      Origin = 'IMPOSTOSCONTRATO.IDIMPOSTO'
    end
    object qryNOMEIMPOSTO: TStringField
      FieldName = 'NOMEIMPOSTO'
      Origin = 'IMPOSTOSCONTRATO.NOMEIMPOSTO'
      Size = 60
    end
    object qryCODSUBCONTA: TFloatField
      FieldName = 'CODSUBCONTA'
      Origin = 'IMPOSTOSCONTRATO.CODSUBCONTA'
    end
    object qryTRATAMENTO: TStringField
      FieldName = 'TRATAMENTO'
      Origin = 'IMPOSTOSCONTRATO.TRATAMENTO'
      Size = 1
    end
    object qryIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'IMPOSTOSCONTRATO.IDPESSOA'
    end
    object qryCONTACREDITO: TStringField
      FieldName = 'CONTACREDITO'
      Origin = 'IMPOSTOSCONTRATO.CONTACREDITO'
      Size = 18
    end
    object qryPERCVALOR: TStringField
      FieldName = 'PERCVALOR'
      Origin = 'IMPOSTOSCONTRATO.PERCVALOR'
      Size = 1
    end
    object qryITEMNOTA: TStringField
      FieldName = 'ITEMNOTA'
      Origin = 'IMPOSTOSCONTRATO.ITEMNOTA'
      Size = 1
    end
    object qryPLANO: TFloatField
      FieldName = 'PLANO'
      Origin = 'IMPOSTOSCONTRATO.PLANO'
    end
    object qryCONTADEBITO: TStringField
      FieldName = 'CONTADEBITO'
      Origin = 'IMPOSTOSCONTRATO.CONTADEBITO'
      Size = 18
    end
  end
  object qryContaContabil: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM PLANOCONTA')
    ValidateWithMask = True
    Left = 512
    object qryContaContabilPLACONTA: TStringField
      FieldName = 'PLACONTA'
      Origin = 'PLANOCONTA.PLACONTA'
      Size = 18
    end
    object qryContaContabilPLATIPO: TStringField
      FieldName = 'PLATIPO'
      Origin = 'PLANOCONTA.PLATIPO'
      Size = 1
    end
    object qryContaContabilPLANOME: TStringField
      FieldName = 'PLANOME'
      Origin = 'PLANOCONTA.PLANOME'
      Size = 40
    end
    object qryContaContabilPLACCUST: TStringField
      FieldName = 'PLACCUST'
      Origin = 'PLANOCONTA.PLACCUST'
      Size = 1
    end
  end
  object MontaSelectConta: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'PLANOCONTA.PLACONTA'
      'PLANOCONTA.PLANOME'
      'PLANOCONTA.PLAREDUZ')
    TipodeDado.Strings = (
      'C'
      'C'
      'N')
    Descricao.Strings = (
      'Código'
      'Nome'
      'Código Reduzido')
    Tabelas.Strings = (
      'PLANOCONTA')
    CamposChave.Strings = (
      'PLANOCONTA.PLACONTA'
      'PLANOCONTA.PLANOME'
      'PLANOCONTA.PLASUBCONTA'
      'PLANOCONTA.PLACCUST')
    Filtro.Strings = (
      'PLANOCONTA.PLATIPO = '#39'A'#39)
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '18'
      '40'
      '10')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 424
    Top = 65523
  end
  object qryVerificaConta: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   PLACONTA, PLANOME, PLASUBCONTA, PLACCUST'
      'FROM'
      '  PLANOCONTA'
      'WHERE'
      '  ( PLANO =:PLANO ) AND'
      '  ( RTRIM(PLACONTA) =:CONTA ) AND'
      '  ( PLATIPO = '#39'A'#39')'
      '')
    ValidateWithMask = True
    Left = 512
    Top = 65524
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PLANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CONTA'
        ParamType = ptUnknown
      end>
  end
  object qrySubConta: TwwQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      'SELECT'
      '   CODSUBCONTA, NOMESUBCONTA'
      'FROM'
      '   SUBCONTA'
      'WHERE'
      '   IDPESSOA =:EMPRESAPROP'
      'ORDER BY'
      '   NOMESUBCONTA')
    ValidateWithMask = True
    Left = 512
    Top = 65512
    ParamData = <
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end>
  end
end
