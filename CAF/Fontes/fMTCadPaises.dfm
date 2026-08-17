inherited frmMTCadPaises: TfrmMTCadPaises
  Left = 185
  Top = 180
  HelpContext = 70006
  Caption = 'Países usados no Sistema'
  ClientHeight = 260
  ClientWidth = 415
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 415
    Height = 174
    object Label1: TLabel
      Left = 32
      Top = 16
      Width = 27
      Height = 13
      Caption = 'País'
    end
    object Label3: TLabel
      Left = 32
      Top = 64
      Width = 91
      Height = 13
      Caption = 'Moeda Corrente'
    end
    object dbcMoeda: TwwDBLookupCombo
      Left = 32
      Top = 80
      Width = 353
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'MOEDESC'#9'20'#9'Descrição')
      DataField = 'MOECODIGO'
      DataSource = ds
      LookupTable = cdsMoeda
      LookupField = 'MOECODIGO'
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      ShowMatchText = True
    end
    object dbcmbPais: TwwDBLookupCombo
      Left = 32
      Top = 32
      Width = 353
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOMEPAIS'#9'30'#9'Nome'#9'F')
      DataField = 'IDPAIS'
      DataSource = ds
      LookupTable = cdsPais
      LookupField = 'IDPAIS'
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      ShowMatchText = True
      OnChange = dbcmbPaisChange
    end
    object GroupBox4: TGroupBox
      Left = 32
      Top = 113
      Width = 353
      Height = 37
      TabOrder = 2
      TabStop = True
      object dbcbFlgContabil: TDBCheckBox
        Left = 11
        Top = 12
        Width = 332
        Height = 17
        Caption = 'Integrar os valores movimentados com a Contabilidade'
        DataField = 'FLGCONTABIL'
        DataSource = ds
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
    end
    object GroupBox1: TGroupBox
      Left = 40
      Top = 368
      Width = 377
      Height = 37
      Enabled = False
      TabOrder = 3
      object dbcbFlgMultiTaxa: TDBCheckBox
        Left = 11
        Top = 12
        Width = 358
        Height = 17
        Caption = 'Taxas de Depreciação serão aplicadas a todas as Moedas'
        DataField = 'FLGMULTITAXA'
        DataSource = ds
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
    end
  end
  inherited Dock972: TDock97
    Width = 415
    inherited Toolbar971: TToolbar97
      inherited sbtnAlterar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 221
    Width = 415
    inherited tb97Fundo: TToolbar97
      Left = 245
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 70006
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 78
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 690
    Top = 407
    TargetsData = (
      1
      1
      (
        '*'
        'Filter'
        0))
  end
  inherited ds: TwwDataSource
    Left = 358
    Top = 65535
  end
  inherited ImlPadrao: TImageList
    Left = 640
    Top = 479
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 288
    Top = 56
  end
  inherited Cds: TCMClientDataSet
    Left = 320
    Top = 0
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona País'
    Colunas.Strings = (
      'PAIS.NOMEPAIS'
      'MOEDA.MOEDESC')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'País'
      'Moeda')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'CAFPAISES'
      'PAIS'
      'MOEDA')
    CamposChave.Strings = (
      'CAFPAISES.IDCAFPAISES'
      'CAFPAISES.IDPESSOA')
    Filtro.Strings = (
      'CAFPAISES.IDPAIS=PAIS.IDPAIS'
      'CAFPAISES.MOECODIGO=MOEDA.MOECODIGO')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '30'
      '20')
    Left = 264
    Top = 0
  end
  object cdsMoeda: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 168
    Top = 104
  end
  object cdsGrupo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 448
    Top = 119
  end
  object sqlGrupo: TCMSqlParams
    SQL.Strings = (
      'SELECT PG.IDGRUPO'
      'FROM PLANOGRUPO PG'
      'WHERE PG.IDPESSOA = :IDPESSOA'
      'ORDER BY PG.IDGRUPO')
    ClientDataSet = cdsGrupo
    Left = 448
    Top = 104
  end
  object cdsPais: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 128
    Top = 56
  end
  object sqlPais: TCMSqlParams
    SQL.Strings = (
      'SELECT IDPAIS, NOMEPAIS, CODINTERNACIONAL'
      'FROM PAIS'
      'ORDER BY NOMEPAIS')
    ClientDataSet = cdsPais
    Left = 128
    Top = 42
  end
  object cdsCAFMoedaOficial: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 448
    Top = 216
  end
  object sqlCAFMoedaOficial: TCMSqlParams
    SQL.Strings = (
      'SELECT MOECODIGO'
      'FROM CAFMOEDAS'
      'WHERE IDPESSOA = :IDPESSOA'
      '  AND IDTIPOMOEDA = 1')
    ClientDataSet = cdsCAFMoedaOficial
    Left = 448
    Top = 201
  end
  object cdsSeqCAFPaises: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 576
    Top = 120
  end
  object sqlSeqCAFPaises: TCMSqlParams
    SQL.Strings = (
      'SELECT COUNT(IDCAFPAISES) AS QTD'
      'FROM CAFPAISES'
      'WHERE IDPESSOA = :IDPESSOA')
    ClientDataSet = cdsSeqCAFPaises
    Left = 576
    Top = 105
  end
  object cdsSrcCAFPaises: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 576
    Top = 184
  end
  object sqlSrcCAFPaises: TCMSqlParams
    SQL.Strings = (
      'SELECT IDCAFPAISES'
      'FROM CAFPAISES'
      'WHERE IDPESSOA = :IDPESSOA'
      '  AND IDCAFPAISES = :IDCAFPAISES'
      '')
    ClientDataSet = cdsSrcCAFPaises
    Left = 576
    Top = 169
  end
end
