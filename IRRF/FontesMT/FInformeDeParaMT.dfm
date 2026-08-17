inherited FrmInformeDeParaMT: TFrmInformeDeParaMT
  HelpContext = 240025
  Caption = 'Associação de Linhas do Informe de Rendimento'
  ClientHeight = 215
  ClientWidth = 445
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 445
    Height = 129
    object lblSituacao: TLabel
      Left = 16
      Top = 8
      Width = 51
      Height = 13
      Caption = 'Situação'
    end
    object lblInformeOrigem: TLabel
      Left = 16
      Top = 50
      Width = 193
      Height = 13
      Caption = 'Informe de Rendimento de Origem'
    end
    object Label3: TLabel
      Left = 16
      Top = 90
      Width = 197
      Height = 13
      Caption = 'Informe de Rendimento de Destino'
    end
    object dblkSituacao: TwwDBLookupCombo
      Left = 16
      Top = 20
      Width = 202
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOMESITUACAO'#9'20'#9'Situação'#9'F')
      DataField = 'IDSITUACAO'
      DataSource = ds
      LookupTable = cdsSituacao
      LookupField = 'IDSITUACAO'
      TabOrder = 0
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
    end
    object dblkInformeOrigem: TwwDBLookupCombo
      Left = 16
      Top = 63
      Width = 402
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOMEINFORME'#9'30'#9'Linha do Informe'#9'F')
      DataField = 'IDINFORMEORIGEM'
      DataSource = ds
      LookupTable = cdsInformeOrigem
      LookupField = 'IDINFORME'
      TabOrder = 1
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
    end
    object dblkInformeDestino: TwwDBLookupCombo
      Left = 16
      Top = 103
      Width = 402
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOMEINFORME'#9'30'#9'Linha do Informe'#9'F')
      DataField = 'IDINFORMEDESTINO'
      DataSource = ds
      LookupTable = cdsInformeDestino
      LookupField = 'IDINFORME'
      TabOrder = 2
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
    end
  end
  inherited Dock972: TDock97
    Width = 445
  end
  inherited Dock971: TDock97
    Top = 176
    Width = 445
    inherited tb97Fundo: TToolbar97
      Left = 273
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 104
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 298
    Top = 15
  end
  inherited ds: TwwDataSource
    Left = 326
    Top = 15
  end
  inherited ImlPadrao: TImageList
    Left = 272
    Top = 15
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    Left = 384
    Top = 15
  end
  inherited Cds: TCMClientDataSet
    Left = 356
    Top = 15
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'STI.NOMESITUACAO'
      'INF.NOMEINFORME'
      'INF2.NOMEINFORME')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Situação'
      'Informe de Origem'
      'Informe de Destino')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'INFORMEDEPARA   IDP'
      'INFORME         INF'
      'INFORME         INF2'
      'CM.SITUACAOINFORME STI')
    CamposChave.Strings = (
      'STI.IDSITUACAO'
      'INF.IDINFORME'
      'INF2.IDINFORME ')
    Filtro.Strings = (
      'INF.IDINFORME      = IDP.IDINFORMEORIGEM'
      'INF2.IDINFORME     = IDP.IDINFORMEDESTINO'
      'IDP.IDSITUACAO     = STI.IDSITUACAO')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '20'
      '30'
      '30')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1')
    LookupSQL.Strings = (
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      '')
    Left = 408
    Top = 15
  end
  object cdsSituacao: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 280
    Top = 55
    Data = {
      8C0000009619E0BD01000000180000000200010000000300000073000A494453
      4954554143414F08000400000000000C4E4F4D45534954554143414F01004900
      0000010005574944544802000200280002000D44454641554C545F4F52444552
      02008200010000000200044C43494404000100090800000000000000000000F0
      3F0E4D6F6CE973746961204772617665}
  end
  object cdsInformeOrigem: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 280
    Top = 95
  end
  object cdsInformeDestino: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 280
    Top = 143
  end
  object CMSqlParams1: TCMSqlParams
    SQL.Strings = (
      'SELECT '
      '  STI.IDSITUACAO,'
      '  STI.NOMESITUACAO '
      'FROM '
      '  SITUACAOINFORME STI'
      ''
      'ORDER BY '
      '  STI.NOMESITUACAO '
      ' ')
    ClientDataSet = cdsSituacao
    Left = 336
    Top = 55
  end
  object cdsAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 392
    Top = 79
  end
end
