inherited FrmCadAgenciaRiscoMT: TFrmCadAgenciaRiscoMT
  HelpContext = 790115
  Caption = 'Cadastro'
  ClientHeight = 318
  ClientWidth = 393
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 393
    Height = 201
    inherited pnlControles: TPanel
      Width = 391
      Height = 199
      object LbLDescParamEmissor: TLabel
        Left = 11
        Top = 15
        Width = 62
        Height = 13
        Caption = 'Descrição '
      end
      object dbeDescricao: TwwDBEdit
        Left = 11
        Top = 29
        Width = 366
        Height = 21
        DataField = 'DESCAGENCIARISCO'
        DataSource = ds
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
    inherited dbGrd: TwwDBGrid
      Width = 391
      Height = 199
      Selected.Strings = (
        'DESCAGENCIARISCO'#9'52'#9'Agência Risco')
    end
  end
  inherited Dock972: TDock97
    Width = 393
  end
  inherited Dock971: TDock97
    Top = 279
    Width = 393
    inherited tb97Fundo: TToolbar97
      Left = 221
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 52
    end
  end
  inherited pnlTitulo: TPanel
    Width = 393
    inherited lbNomItem: TfcLabel
      Width = 145
      Caption = 'Agência Risco'
    end
  end
  inherited ds: TwwDataSource
    Left = 22
    Top = 71
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyEdit = CmeCadastroApplyInsert
    ApplyDelete = CmeCadastroApplyInsert
    Left = 136
    Top = 103
  end
  inherited Cds: TCMClientDataSet
    Left = 20
    Top = 119
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'AGENCIARISCO.DESCAGENCIARISCO')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Agência Risco:')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'AGENCIARISCO')
    CamposChave.Strings = (
      'AGENCIARISCO.IDAGENCIARISCO')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '30')
    OperComparador.Strings = (
      '-1')
    LookupSQL.Strings = (
      '')
    LookupCampoChave.Strings = (
      '')
    LookupCampoExibe.Strings = (
      '')
  end
  inherited CdsAux: TCMClientDataSet
    Left = 132
    Top = 143
  end
  inherited pmnuFixaColunas: TPopupMenu
    Left = 136
    Top = 196
  end
  object CMSqlParams1: TCMSqlParams
    SQL.Strings = (
      'SELECT IDAGENCIARISCO, DESCAGENCIARISCO'
      'FROM AGENCIARISCO '
      'ORDER BY DESCAGENCIARISCO')
    ClientDataSet = Cds
    Left = 24
    Top = 166
  end
end
