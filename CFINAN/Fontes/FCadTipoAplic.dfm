inherited frmCadTipoAplic: TfrmCadTipoAplic
  Left = 109
  Caption = 'Tipo de Aplicação'
  ClientHeight = 392
  ClientWidth = 753
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 753
    Height = 306
    object lblDescricao: TLabel
      Left = 12
      Top = 48
      Width = 58
      Height = 13
      Caption = 'Descrição'
    end
    object Label1: TLabel
      Left = 12
      Top = 8
      Width = 133
      Height = 13
      Caption = 'Código Correspondente'
    end
    object dbeDescricao: TwwDBEdit
      Left = 12
      Top = 64
      Width = 316
      Height = 21
      DataField = 'DESCRICAO'
      DataSource = ds
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbrFixaVariavel: TDBRadioGroup
      Left = 507
      Top = 9
      Width = 230
      Height = 80
      Caption = 'Tipo de Aplicação'
      DataField = 'FIXAVARIAVEL'
      DataSource = ds
      Items.Strings = (
        'Renda &Fixa'
        'Renda &Variável')
      TabOrder = 1
      Values.Strings = (
        'F'
        'V')
    end
    object dbrTipoResgate: TDBRadioGroup
      Left = 337
      Top = 9
      Width = 161
      Height = 80
      Caption = 'Tipo de Resgate'
      DataField = 'TIPORESGATE'
      DataSource = ds
      Items.Strings = (
        '&Único'
        '&Múltiplos')
      TabOrder = 2
      Values.Strings = (
        'U'
        'M')
    end
    object gbReaplicacao: TGroupBox
      Left = 12
      Top = 96
      Width = 317
      Height = 193
      Caption = ' Informações Padrões para Aplicação e Reaplicação '
      TabOrder = 3
      object lblMoedaCota: TLabel
        Left = 9
        Top = 15
        Width = 87
        Height = 13
        Caption = 'Moeda da Cota'
      end
      object lblTipoAplic: TLabel
        Left = 9
        Top = 151
        Width = 273
        Height = 13
        Caption = 'Reaplicação (Tipo) em outro Tipo de Aplicação '
      end
      object lblPrazoResg: TLabel
        Left = 9
        Top = 52
        Width = 84
        Height = 13
        Caption = 'Prazo Resgate'
      end
      object lblTxPrev: TLabel
        Left = 94
        Top = 52
        Width = 103
        Height = 13
        Caption = 'Tx. Juros Prevista'
      end
      object dblcMoeda: TCMDBLookupCombo
        Left = 9
        Top = 28
        Width = 297
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'MOEDESC'#9'20'#9'Descrição'
          'MOESIGLA'#9'10'#9'Sigla')
        DataField = 'MOECODIGO'
        DataSource = ds
        LookupTable = qryMoeda
        LookupField = 'MOECODIGO'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        OrderByDisplay = False
        AllowClearKey = True
        ShowMatchText = True
      end
      object dblcTipoAplic: TCMDBLookupCombo
        Left = 9
        Top = 166
        Width = 297
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'60'#9'Descrição')
        DataField = 'TIPOAPLICSUBST'
        DataSource = ds
        LookupTable = qryTipoAplic
        LookupField = 'TIPOAPLICACAO'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 5
        AutoDropDown = True
        ShowButton = True
        OrderByDisplay = False
        AllowClearKey = True
        ShowMatchText = True
      end
      object dbrePrazoResgate: TDBRealEdit
        Left = 9
        Top = 67
        Width = 81
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '0')
        TabOrder = 1
        WordWrap = False
        IntDigits = 4
        DecDigits = 0
        NumberFormat = iNumber
        Signal = False
        DataField = 'PRAZORESGATEPREV'
        DataSource = ds
      end
      object dbreJurosPrev: TDBRealEdit
        Left = 94
        Top = 67
        Width = 105
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '0,00000000')
        TabOrder = 2
        WordWrap = False
        IntDigits = 10
        DecDigits = 8
        NumberFormat = fNumber
        Signal = False
        DataField = 'TXJUROSPREV'
        DataSource = ds
      end
      object dbcbReaplica: TDBCheckBox
        Left = 207
        Top = 71
        Width = 97
        Height = 17
        Caption = 'Reaplica'
        DataField = 'FLGREAPLICA'
        DataSource = ds
        TabOrder = 3
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object gbDespesa: TGroupBox
        Left = 8
        Top = 91
        Width = 300
        Height = 56
        Caption = ' Percentual de Despesa '
        TabOrder = 4
        object lblPercCusto: TLabel
          Left = 10
          Top = 14
          Width = 73
          Height = 13
          Caption = 's/ Aplicação'
        end
        object lblDespRend: TLabel
          Left = 162
          Top = 14
          Width = 84
          Height = 13
          Caption = 's/ Rendimento'
        end
        object dbrePercCusto: TDBRealEdit
          Left = 10
          Top = 28
          Width = 103
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '0,00000000')
          TabOrder = 0
          WordWrap = False
          IntDigits = 10
          DecDigits = 8
          NumberFormat = fNumber
          Signal = False
          DataField = 'PERCUSTO'
          DataSource = ds
        end
        object dbrePercDescRend: TDBRealEdit
          Left = 162
          Top = 28
          Width = 103
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '0,00000000')
          TabOrder = 1
          WordWrap = False
          IntDigits = 10
          DecDigits = 8
          NumberFormat = fNumber
          Signal = False
          DataField = 'PERCUSTOREND'
          DataSource = ds
        end
      end
    end
    object gbDadosBasicos: TGroupBox
      Left = 337
      Top = 96
      Width = 400
      Height = 193
      Caption = ' Integração com o Fluxo Orçado '
      TabOrder = 4
      object lblUnidNegoc: TLabel
        Left = 9
        Top = 24
        Width = 108
        Height = 13
        Caption = 'Atividade / Projeto'
      end
      object lblTipoRD: TLabel
        Left = 9
        Top = 77
        Width = 122
        Height = 13
        Caption = 'Tipo de Recebimento'
      end
      object lblCentroRespon: TLabel
        Left = 204
        Top = 24
        Width = 160
        Height = 13
        Caption = 'Centro de Responsabilidade'
      end
      object lblCentCusto: TLabel
        Left = 204
        Top = 77
        Width = 92
        Height = 13
        Caption = 'Centro de Custo'
      end
      object lblContaOrcRec: TLabel
        Left = 9
        Top = 132
        Width = 179
        Height = 13
        Caption = 'Conta Orçamentária de Receita'
      end
      object lblContaOrcCus: TLabel
        Left = 204
        Top = 131
        Width = 184
        Height = 13
        Caption = 'Conta Orçamentária de Despesa'
      end
      object dblcUnidNegoc: TwwDBLookupCombo
        Left = 9
        Top = 40
        Width = 191
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'25'#9'Nome'
          'UNECODIGO'#9'10'#9'Código')
        DataField = 'UNIDNEGOC'
        DataSource = ds
        LookupTable = qryUnidNegocio
        LookupField = 'UNIDNEGOC'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object dblcTipoRD: TwwDBLookupCombo
        Left = 9
        Top = 93
        Width = 191
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'35'#9'Descrição'
          'CODTIPRECDES'#9'15'#9'Código')
        DataField = 'CODTIPRECDES'
        DataSource = ds
        LookupTable = qryTipoRD
        LookupField = 'CODTIPRECDES'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object dblcCentroRespon: TwwDBLookupCombo
        Left = 204
        Top = 40
        Width = 191
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'30'#9'Descrição'
          'CODCENTRORESPON'#9'10'#9'Código')
        DataField = 'CODCENTRORESPON'
        DataSource = ds
        LookupTable = qryCentroRespon
        LookupField = 'CODCENTRORESPON'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object dblcCentCusto: TwwDBLookupCombo
        Left = 204
        Top = 93
        Width = 191
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'30'#9'Descrição'
          'CODCENTROCUSTO'#9'10'#9'Código')
        DataField = 'CODCENTROCUSTO'
        DataSource = ds
        LookupTable = qryCentCust
        LookupField = 'CODCENTROCUSTO'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 3
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object cmpContaOrcRec: TCMProcura
        Left = 9
        Top = 147
        Width = 191
        Height = 27
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MostraMensagens = True
        Mensagens.EmBranco = 'Chave não pode estar em branco'
        Mensagens.NaoExiste = 'Chave não existe'
        PermiteChaveInvalida = False
        PermiteChaveEmBranco = False
        DataSource = ds
        DataField = 'IDCONTAORCREC'
        LookupChave = 'IDCONTAORCAMEN'
        LookupDescricao = 'IDCONTAORCAMEN'
        MontaSelect = msContaOrcamen
        LookupTabela = 'CONTASORCAMEN'
        DataBaseName = 'BaseDados'
        ReadOnly = False
      end
      object cmpContaOrcCus: TCMProcura
        Left = 204
        Top = 147
        Width = 191
        Height = 27
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MostraMensagens = True
        Mensagens.EmBranco = 'Chave não pode estar em branco'
        Mensagens.NaoExiste = 'Chave não existe'
        PermiteChaveInvalida = False
        PermiteChaveEmBranco = False
        DataSource = ds
        DataField = 'IDCONTAORCCUS'
        LookupChave = 'IDCONTAORCAMEN'
        LookupDescricao = 'IDCONTAORCAMEN'
        MontaSelect = msContaOrcamen
        LookupTabela = 'CONTASORCAMEN'
        DataBaseName = 'BaseDados'
        ReadOnly = False
      end
    end
    object dbeCodigoCorrespondente: TwwDBEdit
      Left = 12
      Top = 24
      Width = 316
      Height = 21
      DataField = 'CODCORRESP'
      DataSource = ds
      TabOrder = 5
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
  end
  inherited Dock972: TDock97
    Width = 753
  end
  inherited Dock971: TDock97
    Top = 353
    Width = 753
    inherited tb97Fundo: TToolbar97
      Left = 209
      DockPos = 209
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 40
      DockPos = 40
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 656
    Top = 0
  end
  inherited ds: TwwDataSource
    Left = 280
    Top = 0
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update TIPOAPLICACAO'
      'set'
      '  TIPOAPLICACAO = :TIPOAPLICACAO,'
      '  DESCRICAO = :DESCRICAO,'
      '  FIXAVARIAVEL = :FIXAVARIAVEL,'
      '  TIPORESGATE = :TIPORESGATE,'
      '  MOECODIGO = :MOECODIGO,'
      '  TXJUROSPREV = :TXJUROSPREV,'
      '  PRAZORESGATEPREV = :PRAZORESGATEPREV,'
      '  TIPOAPLICSUBST = :TIPOAPLICSUBST,'
      '  UNIDNEGOC = :UNIDNEGOC,'
      '  IDPESSOA = :IDPESSOA,'
      '  CODCENTRORESPON = :CODCENTRORESPON,'
      '  IDEMPRESA = :IDEMPRESA,'
      '  CODCENTROCUSTO = :CODCENTROCUSTO,'
      '  RECPAG = :RECPAG,'
      '  CODTIPRECDES = :CODTIPRECDES,'
      '  PERCUSTO = :PERCUSTO,'
      '  IDCONTAORCREC = :IDCONTAORCREC,'
      '  IDCONTAORCCUS = :IDCONTAORCCUS,'
      '  IDPLANOORCAMEN = :IDPLANOORCAMEN,'
      '  PERCUSTOREND = :PERCUSTOREND,'
      '  FLGREAPLICA = :FLGREAPLICA,'
      '  CODCORRESP = :CODCORRESP'
      'where'
      '  TIPOAPLICACAO = :OLD_TIPOAPLICACAO')
    InsertSQL.Strings = (
      'insert into TIPOAPLICACAO'
      
        '  (TIPOAPLICACAO, DESCRICAO, FIXAVARIAVEL, TIPORESGATE, MOECODIG' +
        'O, TXJUROSPREV, '
      
        '   PRAZORESGATEPREV, TIPOAPLICSUBST, UNIDNEGOC, IDPESSOA, CODCEN' +
        'TRORESPON, '
      
        '   IDEMPRESA, CODCENTROCUSTO, RECPAG, CODTIPRECDES, PERCUSTO, ID' +
        'CONTAORCREC, '
      
        '   IDCONTAORCCUS, IDPLANOORCAMEN, PERCUSTOREND, FLGREAPLICA, COD' +
        'CORRESP)'
      'values'
      
        '  (:TIPOAPLICACAO, :DESCRICAO, :FIXAVARIAVEL, :TIPORESGATE, :MOE' +
        'CODIGO, '
      
        '   :TXJUROSPREV, :PRAZORESGATEPREV, :TIPOAPLICSUBST, :UNIDNEGOC,' +
        ' :IDPESSOA, '
      
        '   :CODCENTRORESPON, :IDEMPRESA, :CODCENTROCUSTO, :RECPAG, :CODT' +
        'IPRECDES, '
      
        '   :PERCUSTO, :IDCONTAORCREC, :IDCONTAORCCUS, :IDPLANOORCAMEN, :' +
        'PERCUSTOREND, '
      '   :FLGREAPLICA, :CODCORRESP)')
    DeleteSQL.Strings = (
      'delete from TIPOAPLICACAO'
      'where'
      '  TIPOAPLICACAO = :OLD_TIPOAPLICACAO')
    Left = 312
    Top = 0
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'TipoAplicacao.Descricao'
      'TipoAplicacao.FixaVariavel'
      'TipoAplicacao.TipoResgate')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Descrição'
      'Tipo de Aplicação'
      'Tipo de Resgate')
    Tabelas.Strings = (
      'TipoAplicacao')
    CamposChave.Strings = (
      'TipoAplicacao.TipoAplicacao')
    Left = 360
    Top = 0
  end
  inherited ImlPadrao: TImageList
    Left = 712
    Top = 0
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 520
    Top = 0
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT TIPOAPLICACAO, DESCRICAO, FIXAVARIAVEL,'
      '       TIPORESGATE, MOECODIGO, TXJUROSPREV,'
      '       PRAZORESGATEPREV, TIPOAPLICSUBST, UNIDNEGOC,'
      '       IDPESSOA, CODCENTRORESPON, IDEMPRESA,'
      '       CODCENTROCUSTO, RECPAG, CODTIPRECDES, PERCUSTO,'
      '       IDCONTAORCREC, IDCONTAORCCUS, IDPLANOORCAMEN,'
      '       PERCUSTOREND, FLGREAPLICA,CODCORRESP'
      'FROM TIPOAPLICACAO'
      'WHERE (TIPOAPLICACAO = :TIPOAPLICACAO)'
      ' ')
    Left = 248
    Top = 0
    ParamData = <
      item
        DataType = ftInteger
        Name = 'TIPOAPLICACAO'
        ParamType = ptUnknown
      end>
    object qryTIPOAPLICACAO: TFloatField
      FieldName = 'TIPOAPLICACAO'
    end
    object qryDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object qryFIXAVARIAVEL: TStringField
      FieldName = 'FIXAVARIAVEL'
      Size = 1
    end
    object qryTIPORESGATE: TStringField
      FieldName = 'TIPORESGATE'
      Size = 1
    end
    object qryMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
    end
    object qryTXJUROSPREV: TFloatField
      FieldName = 'TXJUROSPREV'
    end
    object qryPRAZORESGATEPREV: TFloatField
      FieldName = 'PRAZORESGATEPREV'
    end
    object qryTIPOAPLICSUBST: TFloatField
      FieldName = 'TIPOAPLICSUBST'
    end
    object qryUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
    end
    object qryIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryCODCENTRORESPON: TStringField
      FieldName = 'CODCENTRORESPON'
      Size = 10
    end
    object qryIDEMPRESA: TFloatField
      FieldName = 'IDEMPRESA'
    end
    object qryCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      Size = 10
    end
    object qryRECPAG: TStringField
      FieldName = 'RECPAG'
      Size = 1
    end
    object qryCODTIPRECDES: TStringField
      FieldName = 'CODTIPRECDES'
      Size = 15
    end
    object qryPERCUSTO: TFloatField
      FieldName = 'PERCUSTO'
    end
    object qryIDCONTAORCREC: TStringField
      FieldName = 'IDCONTAORCREC'
      Size = 25
    end
    object qryIDCONTAORCCUS: TStringField
      FieldName = 'IDCONTAORCCUS'
      Size = 25
    end
    object qryIDPLANOORCAMEN: TFloatField
      FieldName = 'IDPLANOORCAMEN'
    end
    object qryPERCUSTOREND: TFloatField
      FieldName = 'PERCUSTOREND'
    end
    object qryFLGREAPLICA: TStringField
      FieldName = 'FLGREAPLICA'
      Size = 1
    end
    object qryCODCORRESP: TStringField
      FieldName = 'CODCORRESP'
      Origin = 'BASEDADOS.TIPOAPLICACAO.CODCORRESP'
    end
  end
  object qryMoeda: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT MOEDESC, MOECODIGO, MOESIGLA '
      'FROM MOEDA'
      'WHERE (MOEINATIVO <> '#39'I'#39')'
      'ORDER BY MOEDESC')
    ValidateWithMask = True
    Left = 176
    Top = 152
  end
  object qryTipoAplic: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT TIPOAPLICACAO, DESCRICAO'
      'FROM TIPOAPLICACAO'
      'ORDER BY DESCRICAO')
    ValidateWithMask = True
    Left = 589
    object qryTipoAplicTIPOAPLICACAO: TFloatField
      FieldName = 'TIPOAPLICACAO'
      Origin = 'TIPOAPLICACAO.TIPOAPLICACAO'
    end
    object qryTipoAplicDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'TIPOAPLICACAO.DESCRICAO'
      Size = 60
    end
  end
  object qryTipoRD: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODTIPRECDES, DESCRICAO'
      'FROM TIPORECEBDESEMB'
      'WHERE (RECPAG = '#39'R'#39') AND'
      '      (ANASINT = '#39'A'#39') AND'
      '      (IDPESSOA = :IDPESSOA)'
      'ORDER BY DESCRICAO')
    ValidateWithMask = True
    Left = 472
    Top = 208
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object qryTipoRDDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 35
      FieldName = 'DESCRICAO'
      Origin = 'TIPORECEBDESEMB.DESCRICAO'
      Size = 35
    end
    object qryTipoRDCODTIPRECDES: TStringField
      DisplayLabel = 'Código'
      DisplayWidth = 15
      FieldName = 'CODTIPRECDES'
      Origin = 'TIPORECEBDESEMB.CODTIPRECDES'
      Size = 15
    end
  end
  object qryCentroRespon: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODCENTRORESPON, NOME'
      'FROM CENTRESPON'
      'WHERE (IDPESSOA = :IDPESSOA) AND'
      '      (ANALITICOSINTET = '#39'A'#39') AND'
      '      ((ATIVO = '#39'S'#39') OR (ATIVO IS NULL))'
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 656
    Top = 160
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object qryCentroResponNOME: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 30
      FieldName = 'NOME'
      Origin = 'CENTRESPON.NOME'
      Size = 30
    end
    object qryCentroResponCODCENTRORESPON: TStringField
      DisplayLabel = 'Código'
      DisplayWidth = 10
      FieldName = 'CODCENTRORESPON'
      Origin = 'CENTRESPON.CODCENTRORESPON'
      Size = 10
    end
  end
  object qryUnidNegocio: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT UNIDNEGOC, NOME, UNECODIGO'
      'FROM UNIDNEGOCIO'
      'WHERE (IDPESSOA = :IDPESSOA) AND'
      '      (UNETIPO = '#39'A'#39')'
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 456
    Top = 160
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object qryUnidNegocioNOME: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 25
      FieldName = 'NOME'
      Origin = 'UNIDNEGOCIO.NOME'
      Size = 25
    end
    object qryUnidNegocioUNECODIGO: TStringField
      DisplayLabel = 'Código'
      DisplayWidth = 10
      FieldName = 'UNECODIGO'
      Origin = 'UNIDNEGOCIO.UNECODIGO'
      Size = 10
    end
    object qryUnidNegocioUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
      Origin = 'UNIDNEGOCIO.UNIDNEGOC'
      Visible = False
    end
  end
  object qryCentCust: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODCENTROCUSTO, NOME'
      'FROM CENTCUST'
      'WHERE (IDEMPRESA = :IDPESSOA) AND'
      '      (STATUSGRUPOCDC = '#39'A'#39') AND'
      '      ((ATIVO = '#39'S'#39') OR (ATIVO IS NULL))'
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 664
    Top = 208
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object qryCentCustNOME: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 30
      FieldName = 'NOME'
      Origin = 'CENTCUST.NOME'
      Size = 30
    end
    object qryCentCustCODCENTROCUSTO: TStringField
      DisplayLabel = 'Código'
      DisplayWidth = 10
      FieldName = 'CODCENTROCUSTO'
      Origin = 'CENTCUST.CODCENTROCUSTO'
      Size = 10
    end
  end
  object msContaOrcamen: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'CONTASORCAMEN.IDCONTAORCAMEN'
      'CONTASORCAMEN.NOMECONTAORCAMEN'
      'CONTASORCAMEN.TIPOCALCREALIZADO'
      'CONTASORCAMEN.TIPOCALCORCADO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Conta Orçamentária'
      'Descrição'
      'Tipo Calc. Real.'
      'Tipo Calc. Orc.')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'CONTASORCAMEN')
    CamposChave.Strings = (
      'CONTASORCAMEN.IDCONTAORCAMEN')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '25'
      '60'
      '1'
      '1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 440
  end
  object qryParamOrc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPLANOORCAMEN'
      'FROM PARAMORCAMENTO'
      'WHERE (IDPESSOA = :IDPESSOA)'
      '')
    ValidateWithMask = True
    Left = 688
    Top = 72
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object qryParamOrcIDPLANOORCAMEN: TFloatField
      FieldName = 'IDPLANOORCAMEN'
      Origin = 'PARAMORCAMENTO.IDPLANOORCAMEN'
    end
  end
end
