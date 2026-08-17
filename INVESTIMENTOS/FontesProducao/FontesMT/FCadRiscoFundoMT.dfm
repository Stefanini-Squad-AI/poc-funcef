inherited FrmCadRiscoFundoMT: TFrmCadRiscoFundoMT
  Left = 323
  Top = 207
  HelpContext = 790053
  Caption = 'FrmCadRiscoFundoMT'
  ClientWidth = 676
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 676
    inherited pnlControles: TPanel
      Width = 674
      object Label1: TLabel
        Left = 15
        Top = 21
        Width = 127
        Height = 13
        Caption = 'Código do Risco Ativo'
      end
      object lblNome: TLabel
        Left = 14
        Top = 64
        Width = 90
        Height = 13
        Caption = 'Nível do Risco '
      end
      object dbcSiglaRisco: TwwDBComboBox
        Left = 15
        Top = 35
        Width = 170
        Height = 21
        ShowButton = True
        Style = csDropDown
        MapList = True
        AllowClearKey = True
        AutoDropDown = True
        ShowMatchText = True
        DataField = 'SIGLARISCOFUNDO'
        DataSource = ds
        DropDownCount = 8
        ItemHeight = 0
        Items.Strings = (
          'BB - Baixo'#9'BB - Baixo'
          'MM - Médio'#9'MM - Médio'
          'AA - Alto'#9'AA - Alto'
          'MA - Médio Alto'#9'MA - Médio Alto')
        Sorted = False
        TabOrder = 0
        UnboundDataType = wwDefault
      end
      object dbeNivelRisco: TwwDBEdit
        Left = 15
        Top = 79
        Width = 434
        Height = 21
        DataField = 'NOMERISCOFUNDO'
        DataSource = ds
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
    inherited dbGrd: TwwDBGrid
      Width = 674
      Selected.Strings = (
        'SIGLARISCOFUNDO'#9'30'#9'Código do Risco Ativo'#9'F'
        'NOMERISCOFUNDO'#9'60'#9'Nível do Risco'#9'F')
    end
  end
  inherited Dock972: TDock97
    Width = 676
  end
  inherited Dock971: TDock97
    Width = 676
    inherited tb97Fundo: TToolbar97
      Left = 407
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 238
    end
  end
  inherited pnlTitulo: TPanel
    Width = 676
    inherited lbNomItem: TfcLabel
      Width = 270
      Caption = 'Nível de Risco dos Fundos'
    end
  end
  inherited ds: TwwDataSource
    Left = 142
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyEdit = CmeCadastroApplyInsert
    ApplyDelete = CmeCadastroApplyInsert
  end
  inherited Cds: TCMClientDataSet
    Left = 92
    object CdsSIGLARISCOFUNDO: TStringField
      DisplayLabel = 'Código do Risco Ativo'
      DisplayWidth = 30
      FieldName = 'SIGLARISCOFUNDO'
      Size = 30
    end
    object CdsNOMERISCOFUNDO: TStringField
      DisplayLabel = 'Nível do Risco'
      DisplayWidth = 60
      FieldName = 'NOMERISCOFUNDO'
      Size = 60
    end
    object CdsIDRISCOFUNDOINVES: TFloatField
      DisplayWidth = 10
      FieldName = 'IDRISCOFUNDOINVES'
      Visible = False
    end
  end
  inherited MontaSelect: TMontaSelect
    Caption = ''
    Colunas.Strings = (
      'RISCOFUNDOINVEST.SIGLARISCOFUNDO'
      'RISCOFUNDOINVEST.NOMERISCOFUNDO')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Código do Risco Ativo'
      'Nível de Risco')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'RISCOFUNDOINVEST')
    CamposChave.Strings = (
      'RISCOFUNDOINVEST.IDRISCOFUNDOINVES')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '30'
      '60')
    OperComparador.Strings = (
      '-1'
      '-1')
  end
  object CMSqlParams1: TCMSqlParams
    SQL.Strings = (
      'SELECT IDRISCOFUNDOINVES, SIGLARISCOFUNDO, NOMERISCOFUNDO'
      'FROM RISCOFUNDOINVEST'
      'ORDER BY NOMERISCOFUNDO')
    ClientDataSet = Cds
    Left = 608
    Top = 102
  end
end
