inherited frmCadDeParaCCMT: TfrmCadDeParaCCMT
  Left = 222
  Top = 198
  Caption = 'De/Para de Centros de Custo'
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
        Width = 152
        Height = 13
        Caption = 'Plano de Centros de Custo'
      end
      object Label4: TLabel
        Left = 16
        Top = 66
        Width = 92
        Height = 13
        Caption = 'Centro de Custo'
      end
      object DBcboPlanCCIni: TwwDBLookupCombo
        Left = 16
        Top = 32
        Width = 288
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCPLANCENTCUST'#9'60'#9'DESCPLANCENTCUST'#9'F')
        DataField = 'IDPLANCCINI'
        DataSource = ds
        LookupTable = cdsPlano
        LookupField = 'IDPLANCENTCUST'
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        UseTFields = False
        AllowClearKey = False
        OnCloseUp = DBcboPlanCCIniCloseUp
      end
      object DBcboCCIni: TwwDBLookupCombo
        Left = 16
        Top = 80
        Width = 288
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'CODEXTERNO'#9'15'#9'Código'#9'F'
          'NOME'#9'30'#9'Nome'#9'F')
        DataField = 'CODCCINI'
        DataSource = ds
        LookupTable = cdsCCIni
        LookupField = 'CODCENTROCUSTO'
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
        Width = 152
        Height = 13
        Caption = 'Plano de Centros de Custo'
      end
      object Label1: TLabel
        Left = 16
        Top = 66
        Width = 92
        Height = 13
        Caption = 'Centro de Custo'
      end
      object DBcboPlanCCFim: TwwDBLookupCombo
        Left = 16
        Top = 32
        Width = 288
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCPLANCENTCUST'#9'60'#9'DESCPLANCENTCUST'#9'F')
        DataField = 'IDPLANCCFIM'
        DataSource = ds
        LookupTable = cdsPlano
        LookupField = 'IDPLANCENTCUST'
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        UseTFields = False
        AllowClearKey = False
        OnCloseUp = DBcboPlanCCFimCloseUp
      end
      object DBcboCCFim: TwwDBLookupCombo
        Left = 16
        Top = 80
        Width = 288
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'CODEXTERNO'#9'15'#9'Código'#9'F'
          'NOME'#9'30'#9'Nome'#9'F')
        DataField = 'CODCCFIM'
        DataSource = ds
        LookupTable = cdsCCFim
        LookupField = 'CODCENTROCUSTO'
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
      'PCI.DESCPLANCENTCUST'
      'CCI.CODEXTERNO'
      'CCI.NOME'
      'PCF.DESCPLANCENTCUST'
      'CCF.CODEXTERNO'
      'CCF.NOME')
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
      'C. Custo de Origem'
      'Plano de Destino'
      'Código de Destino'
      'C. Custo de Destino')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'DEPARACC     DCC'
      'CENTCUST     CCI'
      'CENTCUST     CCF'
      'PLANCENTCUST PCI'
      'PLANCENTCUST PCF')
    CamposChave.Strings = (
      'DCC.IDDEPARACC')
    Filtro.Strings = (
      'DCC.IDPLANCCINI   = PCI.IDPLANCENTCUST'
      'DCC.CODCCINI      = CCI.CODCENTROCUSTO'
      'DCC.IDEMPRESAPROP = CCI.IDEMPRESA'
      'DCC.IDPLANCCFIM   = PCF.IDPLANCENTCUST'
      'DCC.CODCCFIM      = CCF.CODCENTROCUSTO'
      'DCC.IDEMPRESAPROP = CCF.IDEMPRESA')
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
  object CMSqlParams1: TCMSqlParams
    SQL.Strings = (
      'select * from deparacC')
    ClientDataSet = Cds
    Left = 656
    Top = 1
  end
  object sqlPlano: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   IDPLANCENTCUST,'
      '   IDPLANOANTERIOR,'
      '   DATAFIM,'
      '   MASCARA,'
      '   DESCPLANCENTCUST,'
      '   DATAINI'
      'FROM'
      '   PLANCENTCUST'
      'ORDER BY'
      '   DESCPLANCENTCUST')
    ClientDataSet = cdsPlano
    Left = 464
    Top = 17
  end
  object cdsPlano: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 464
    Top = 1
  end
  object sqlCCIni: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   CODCENTROCUSTO,'
      '   IDEMPRESA,'
      '   NOME,'
      '   CODREDUZIDO,'
      '   ATIVO,'
      '   CODEXTERNO,'
      '   IDPLANCENTCUST'
      'FROM'
      '   CENTCUST'
      'WHERE'
      '       IDEMPRESA      =:PIDEMPRESA'
      '   AND IDPLANCENTCUST =:PIDPLANCENTCUST'
      'ORDER BY'
      '   CODEXTERNO, NOME, CODCENTROCUSTO')
    ClientDataSet = cdsCCIni
    Left = 520
    Top = 17
  end
  object cdsCCIni: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 520
  end
  object sqlCCFim: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   CODCENTROCUSTO,'
      '   IDEMPRESA,'
      '   NOME,'
      '   CODREDUZIDO,'
      '   ATIVO,'
      '   CODEXTERNO,'
      '   IDPLANCENTCUST'
      'FROM'
      '   CENTCUST'
      'WHERE'
      '       IDEMPRESA      =:PIDEMPRESA'
      '   AND IDPLANCENTCUST =:PIDPLANCENTCUST'
      'ORDER BY'
      '   CODEXTERNO, NOME, CODCENTROCUSTO')
    ClientDataSet = cdsCCFim
    Left = 576
    Top = 15
  end
  object cdsCCFim: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 576
    Top = 65535
  end
end
