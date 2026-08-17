inherited frmCadDeParaCRMT: TfrmCadDeParaCRMT
  Left = 97
  Top = 248
  Caption = 'De/Para de Centros de Responsabilidade'
  ClientHeight = 279
  ClientWidth = 711
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 711
    Height = 193
    object Panel1: TPanel
      Left = 24
      Top = 53
      Width = 321
      Height = 116
      TabOrder = 0
      object Label2: TLabel
        Left = 16
        Top = 18
        Width = 220
        Height = 13
        Caption = 'Plano de Centros de Responsabilidade'
      end
      object Label4: TLabel
        Left = 16
        Top = 66
        Width = 160
        Height = 13
        Caption = 'Centro de Responsabilidade'
      end
      object DBcboPlanCRIni: TwwDBLookupCombo
        Left = 16
        Top = 32
        Width = 288
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCPLANCRESPON'#9'60'#9'DESCPLANCRESPON'#9'F')
        DataField = 'IDPLANCRINI'
        DataSource = ds
        LookupTable = cdsPlano
        LookupField = 'IDPLANCRESPON'
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        UseTFields = False
        AllowClearKey = False
        OnCloseUp = DBcboPlanCRIniCloseUp
      end
      object DBcboCRIni: TwwDBLookupCombo
        Left = 16
        Top = 80
        Width = 288
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'CODEXTERNO'#9'15'#9'Código'#9'F'
          'NOME'#9'30'#9'Nome'#9'F')
        DataField = 'CODCRINI'
        DataSource = ds
        LookupTable = cdsCRIni
        LookupField = 'CODCENTRORESPON'
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
      end
    end
    object Panel2: TPanel
      Left = 368
      Top = 53
      Width = 321
      Height = 116
      TabOrder = 1
      object Label3: TLabel
        Left = 16
        Top = 18
        Width = 220
        Height = 13
        Caption = 'Plano de Centros de Responsabilidade'
      end
      object Label1: TLabel
        Left = 16
        Top = 66
        Width = 160
        Height = 13
        Caption = 'Centro de Responsabilidade'
      end
      object DBcboPlanCRFim: TwwDBLookupCombo
        Left = 16
        Top = 32
        Width = 288
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCPLANCRESPON'#9'60'#9'DESCPLANCRESPON'#9'F')
        DataField = 'IDPLANCRFIM'
        DataSource = ds
        LookupTable = cdsPlano
        LookupField = 'IDPLANCRESPON'
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        UseTFields = False
        AllowClearKey = False
        OnCloseUp = DBcboPlanCRFimCloseUp
      end
      object DBcboCRFim: TwwDBLookupCombo
        Left = 16
        Top = 80
        Width = 288
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'CODEXTERNO'#9'15'#9'CODEXTERNO'#9'F'
          'NOME'#9'30'#9'NOME'#9'F')
        DataField = 'CODCRFIM'
        DataSource = ds
        LookupTable = cdsCRFim
        LookupField = 'CODCENTRORESPON'
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
      end
    end
    object Panel4: TPanel
      Left = 368
      Top = 24
      Width = 321
      Height = 29
      Caption = 'Destino'
      Color = clNavy
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
    end
    object Panel5: TPanel
      Left = 24
      Top = 24
      Width = 321
      Height = 29
      Caption = 'Origem'
      Color = clNavy
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
    end
  end
  inherited Dock972: TDock97
    Width = 711
  end
  inherited Dock971: TDock97
    Top = 240
    Width = 711
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 970
    Top = 63
  end
  inherited ds: TwwDataSource
    Left = 344
    Top = 0
  end
  inherited ImlPadrao: TImageList
    Left = 968
    Top = 7
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 392
    Top = 0
  end
  inherited Cds: TCMClientDataSet
    Left = 312
    Top = 0
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'PCI.DESCPLANCRESPON'
      'CRI.CODEXTERNO'
      'CRI.NOME'
      'PCF.DESCPLANCRESPON'
      'CRF.CODEXTERNO'
      'CRF.NOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Plano de Origem'
      'Código de Origem'
      'C. Respon. de Origem'
      'Plano de Destino'
      'Código de Destino'
      'C. Respon. de Destino')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'DEPARACR       DCR'
      'CENTRESPON     CRI'
      'CENTRESPON     CRF'
      'PLANCENTRESPON PCI'
      'PLANCENTRESPON PCF')
    CamposChave.Strings = (
      'DCR.IDDEPARACR')
    Filtro.Strings = (
      'DCR.IDPLANCRINI   = PCI.IDPLANCRESPON'
      'DCR.CODCRINI      = CRI.CODCENTRORESPON'
      'DCR.IDEMPRESAPROP = CRI.IDPESSOA'
      'DCR.IDPLANCRFIM   = PCF.IDPLANCRESPON'
      'DCR.CODCRFIM      = CRF.CODCENTRORESPON'
      'DCR.IDEMPRESAPROP = CRF.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '25'
      '15'
      '25'
      '25'
      '15'
      '25')
    Left = 264
    Top = 0
  end
  object cdsPlano: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 464
    Top = 1
  end
  object sqlPlano: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   IDPLANCRESPON,'
      '   IDPLANOANTERIOR,'
      '   DESCPLANCRESPON,'
      '   DATAINI,'
      '   DATAFIM,'
      '   MASCARA'
      'FROM'
      '   PLANCENTRESPON'
      'ORDER BY'
      '   DESCPLANCRESPON')
    ClientDataSet = cdsPlano
    Left = 464
    Top = 17
  end
  object cdsCRIni: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 520
  end
  object sqlCRIni: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   CODCENTRORESPON,'
      '   IDPESSOA,'
      '   NOME,'
      '   ANALITICOSINTET,'
      '   ATIVO,'
      '   CODEXTERNO,'
      '   IDPLANCRESPON'
      'FROM'
      '   CENTRESPON'
      'WHERE'
      '       IDPESSOA      =:PIDPESSOA'
      '   AND IDPLANCRESPON =:PIDPLANCRESPON'
      'ORDER BY'
      '   CODEXTERNO, NOME, CODCENTRORESPON')
    ClientDataSet = cdsCRIni
    Left = 520
    Top = 17
  end
  object cdsCRFim: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 576
    Top = 65535
  end
  object sqlCRFim: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   CODCENTRORESPON,'
      '   IDPESSOA,'
      '   NOME,'
      '   ANALITICOSINTET,'
      '   ATIVO,'
      '   CODEXTERNO,'
      '   IDPLANCRESPON'
      'FROM'
      '   CENTRESPON'
      'WHERE'
      '       IDPESSOA      =:PIDPESSOA'
      '   AND IDPLANCRESPON =:PIDPLANCRESPON'
      'ORDER BY'
      '   CODEXTERNO, NOME, CODCENTRORESPON')
    ClientDataSet = cdsCRFim
    Left = 576
    Top = 15
  end
  object CMSqlParams1: TCMSqlParams
    SQL.Strings = (
      'select * from deparacr')
    ClientDataSet = Cds
    Left = 656
    Top = 1
  end
end
