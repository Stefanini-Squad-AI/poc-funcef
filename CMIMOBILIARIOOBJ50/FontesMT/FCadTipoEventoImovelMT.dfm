inherited frmCadTipoEventoImovelMT: TfrmCadTipoEventoImovelMT
  Left = 518
  Top = 212
  HelpContext = 640101
  Caption = 'Tipos de Eventos Imobiliários'
  ClientHeight = 332
  ClientWidth = 471
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 471
    Height = 246
    inherited dbGrd: TwwDBGrid [0]
      Width = 469
      Height = 244
      ControlType.Strings = (
        'FLGRAD;CheckBox;1;0')
      Selected.Strings = (
        'DESCRICAO'#9'29'#9'Descrição'
        'FLGRAD'#9'4'#9'RAD'
        'DESCTIPOINTERNO'#9'27'#9'Tipo Processo')
    end
    inherited pnlControles: TPanel [1]
      Width = 469
      Height = 244
      object Label52: TLabel
        Left = 16
        Top = 7
        Width = 58
        Height = 13
        Caption = 'Descrição'
      end
      object Label1: TLabel
        Left = 16
        Top = 55
        Width = 100
        Height = 13
        Caption = 'Tipo de Processo'
      end
      object DBedtDescTpoEvento: TDBEdit
        Left = 15
        Top = 24
        Width = 413
        Height = 21
        DataField = 'DESCRICAO'
        DataSource = ds
        TabOrder = 0
      end
      object dbcbTpoProcesso: TwwDBComboBox
        Left = 15
        Top = 72
        Width = 413
        Height = 21
        ShowButton = True
        Style = csDropDownList
        MapList = True
        AllowClearKey = True
        AutoDropDown = True
        ShowMatchText = True
        DataField = 'FLGTIPOEVENTO'
        DataSource = ds
        DropDownCount = 6
        DropDownWidth = 413
        ItemHeight = 0
        Items.Strings = (
          'Acréscimo de Valores'#9'AC'
          'Aditivo Contratual'#9'AD'
          'Alteração Cadastral'#9'AR'
          'Aquisição do Imóvel'#9'AQ'
          'Baixa de Bem'#9'BB'
          'Baixa por Desmembramento'#9'BD'
          'Baixa por Encerramento de Obra'#9'BO'
          'Baixa por Remembramento'#9'BR'
          'Cancelamento da Suspensão'#9'CS'
          'Carta de Cobrança'#9'CC'
          'Confissão de Dívidas'#9'CD'
          'Contrato de Alienação'#9'CA'
          'Decréscimo de Valor'#9'DC'
          'Depreciação Inicial'#9'DP'
          'Desmembramento de Imóvel'#9'DM'
          'Encerramento Contratual'#9'EC'
          'Entrada por Desmembramento'#9'ED'
          'Entrada por Encerramento de Obra'#9'EO'
          'Evento do Usuário'#9'US'
          'Prorrogação Contratual'#9'PC'
          'Reajuste Contratual'#9'RJ'
          'Reavaliação Oficial do Imovel'#9'RV'
          'Reavaliação Valor de Mercado'#9'VM'
          'Recálculo de Cobrança'#9'RD'
          'Remembramento de Imóvel'#9'RM'
          'Renegociação Contratual'#9'RE'
          'Renovação Contratual'#9'RN'
          'Rescisão Contratual'#9'RC'
          'Suspensão Contratual'#9'SU'
          'Transferência de Tipo de Imóvel'#9'TT')
        Sorted = True
        TabOrder = 1
        UnboundDataType = wwDefault
      end
      object DBchkFlgRAD: TDBCheckBox
        Left = 17
        Top = 114
        Width = 75
        Height = 17
        Caption = 'Gera RAD'
        DataField = 'FLGRAD'
        DataSource = ds
        TabOrder = 2
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
    end
  end
  inherited Dock972: TDock97
    Width = 471
    inherited Toolbar971: TToolbar97
      inherited sbtnProcurar: TToolbarButton97
        Enabled = False
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 293
    Width = 471
    inherited tb97Fundo: TToolbar97
      Left = 299
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 130
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 34
    Top = 65495
  end
  inherited ds: TwwDataSource
    Left = 334
    Top = 191
  end
  inherited ImlPadrao: TImageList
    Left = 65520
    Top = 65495
  end
  inherited CmeCadastro: TCmEventosCadastro
    OpenDsAutomatico = True
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyEdit = CmeCadastroApplyInsert
    ApplyDelete = CmeCadastroApplyInsert
    Left = 368
    Top = 7
  end
  inherited Cds: TCMClientDataSet
    Left = 308
    Top = 7
    object CdsDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 29
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object CdsFLGRAD: TFloatField
      Alignment = taCenter
      DisplayLabel = 'RAD'
      DisplayWidth = 4
      FieldName = 'FLGRAD'
    end
    object CdsDESCTIPOINTERNO: TStringField
      DisplayLabel = 'Tipo Processo'
      DisplayWidth = 27
      FieldName = 'DESCTIPOINTERNO'
      Size = 32
    end
    object CdsFLGTIPOEVENTO: TStringField
      DisplayLabel = 'Tipo de Evento'
      DisplayWidth = 13
      FieldName = 'FLGTIPOEVENTO'
      Visible = False
      FixedChar = True
      Size = 2
    end
    object CdsIDTIPOEVENTOIMOB: TFloatField
      FieldName = 'IDTIPOEVENTOIMOB'
    end
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'TIPOEVENTOIMOB.DESCRICAO'
      'TIPOEVENTOIMOB.FLGRAD')
    TipodeDado.Strings = (
      'C'
      'N')
    Descricao.Strings = (
      'Descrição'
      'RAD')
    SensivelACaixa.Strings = (
      'S'
      'N')
    Tabelas.Strings = (
      'TIPOEVENTOIMOB')
    CamposChave.Strings = (
      'TIPOEVENTOIMOB.IDTIPOEVENTOIMOB')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '60'
      '10')
    OperComparador.Strings = (
      '0'
      '0')
    LookupSQL.Strings = (
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      '')
    Left = 400
    Top = 199
  end
  object CMSqlParams1: TCMSqlParams
    SQL.Strings = (
      'SELECT IDTIPOEVENTOIMOB'
      '     , DESCRICAO        '
      '     , FLGRAD  '
      '     , FLGTIPOEVENTO  '
      '     , DECODE(FLGTIPOEVENTO,'
      '              '#39'AC'#39', '#39'Acréscimo de Valores'#39','
      '              '#39'AD'#39', '#39'Aditivo Contratual'#39',     '
      '              '#39'AR'#39', '#39'Alteração Cadastral'#39','
      '              '#39'AQ'#39', '#39'Aquisição do Imóvel'#39','
      '              '#39'BB'#39', '#39'Baixa de Bem'#39','
      '              '#39'BD'#39', '#39'Baixa por Desmembramento'#39','
      '              '#39'BO'#39', '#39'Baixa por Encerramento de Obra'#39','
      '              '#39'BR'#39', '#39'Baixa por Remembramento'#39','
      '              '#39'CS'#39', '#39'Cancelamento da Suspensão'#39','
      '              '#39'CC'#39', '#39'Carta de Cobrança'#39','
      '              '#39'CD'#39', '#39'Confissão de Dívidas'#39','
      '              '#39'CA'#39', '#39'Contrato de Alienação'#39','
      '              '#39'DC'#39', '#39'Decréscimo de Valor'#39','
      '              '#39'DP'#39', '#39'Depreciação Inicial'#39','
      '              '#39'DM'#39', '#39'Desmembramento de Imóvel'#39','
      '              '#39'EC'#39', '#39'Encerramento Contratual'#39','
      '              '#39'ED'#39', '#39'Entrada por Desmembramento'#39','
      '              '#39'EO'#39', '#39'Entrada por Encerramento de Obra'#39','
      '              '#39'US'#39', '#39'Evento do Usuário'#39','
      '              '#39'PC'#39', '#39'Prorrogação Contratual'#39','
      '              '#39'RJ'#39', '#39'Reajuste Contratual'#39','
      '              '#39'RV'#39', '#39'Reavaliação Oficial do Imovel'#39','
      '              '#39'VM'#39', '#39'Reavaliação Valor de Mercado'#39','
      '              '#39'RD'#39', '#39'Recálculo de Cobrança'#39','
      '              '#39'RM'#39', '#39'Remembramento de Imóvel'#39','
      '              '#39'RE'#39', '#39'Renegociação Contratual'#39','
      '              '#39'RN'#39', '#39'Renovação Contratual'#39','
      '              '#39'RC'#39', '#39'Rescisão Contratual'#39','
      '              '#39'SU'#39', '#39'Suspensão Contratual'#39','
      '              '#39'TT'#39', '#39'Transferência de Tipo de Imóvel'#39
      '                   ) AS DESCTIPOINTERNO  '
      '  FROM TIPOEVENTOIMOB   '
      'ORDER BY DESCRICAO '
      ' ')
    Left = 272
    Top = 191
  end
end
