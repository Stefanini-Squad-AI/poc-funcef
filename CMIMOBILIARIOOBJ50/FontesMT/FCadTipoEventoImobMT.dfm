inherited frmCadastroGridMTImob1: TfrmCadastroGridMTImob1
  Left = 314
  Top = 397
  Caption = 'Tipos de Eventos Imobiliários'
  ClientHeight = 332
  ClientWidth = 471
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 471
    Height = 246
    inherited pnlControles: TPanel
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
        Width = 320
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
        DropDownWidth = 640
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
      object DBchkRateio: TDBCheckBox
        Left = 353
        Top = 74
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
    inherited dbGrd: TwwDBGrid
      Width = 469
      Height = 244
      ControlType.Strings = (
        'FLGRAD;CheckBox;1;0')
      Selected.Strings = (
        'DESCRICAO'#9'37'#9'Descrição'#9'F'
        'FLGRAD'#9'10'#9'RAD'#9'F'
        'FLGTIPOEVENTO'#9'13'#9'Tipo de Evento'#9'F')
    end
  end
  inherited Dock972: TDock97
    Width = 471
    inherited Toolbar971: TToolbar97
      inherited sbtnProcurar: TToolbarButton97
        Enabled = False
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
    Left = 262
    Top = 55
  end
  inherited ImlPadrao: TImageList
    Left = 65520
    Top = 65495
  end
  inherited CmeCadastro: TCmEventosCadastro
    OpenDsAutomatico = True
    Left = 368
    Top = 7
  end
  inherited Cds: TCMClientDataSet
    Active = True
    Left = 308
    Top = 7
    Data = {
      A70000009619E0BD010000001800000004000000000003000000A70010494454
      49504F4556454E544F494D4F4208000400000000000944455343524943414F01
      00490000000100055749445448020002003C0006464C47524144080004000000
      00000D464C475449504F4556454E544F01004900000002000753554254595045
      020049000A00466978656443686172000557494454480200020002000100044C
      4349440400010009080000}
    object CdsDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 37
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object CdsFLGRAD: TFloatField
      DisplayLabel = 'RAD'
      DisplayWidth = 10
      FieldName = 'FLGRAD'
    end
    object CdsFLGTIPOEVENTO: TStringField
      DisplayLabel = 'Tipo de Evento'
      DisplayWidth = 13
      FieldName = 'FLGTIPOEVENTO'
      FixedChar = True
      Size = 2
    end
    object CdsIDTIPOEVENTOIMOB: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOEVENTOIMOB'
      Visible = False
    end
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'TIPOEVENTOIMOB.DESCRICAO')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Descrição')
    SensivelACaixa.Strings = (
      'S')
    Tabelas.Strings = (
      'TIPOEVENTOIMOB')
    CamposChave.Strings = (
      'TIPOEVENTOIMOB.IDTIPOEVENTOIMOB')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
    OperComparador.Strings = (
      '0')
    LookupSQL.Strings = (
      '')
    LookupCampoChave.Strings = (
      '')
    LookupCampoExibe.Strings = (
      '')
    Top = 79
  end
  object CMSqlParams1: TCMSqlParams
    SQL.Strings = (
      'SELECT T.IDTIPOEVENTOIMOB'
      '     , T.DESCRICAO'
      '     , T.FLGRAD'
      '     , T.FLGTIPOEVENTO'
      '  FROM TIPOEVENTOIMOB T')
    ClientDataSet = Cds
    Left = 240
    Top = 143
  end
end
