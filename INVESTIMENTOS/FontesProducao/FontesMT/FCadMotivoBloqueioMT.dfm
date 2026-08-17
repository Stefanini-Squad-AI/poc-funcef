inherited frmCadMotivoBloqueioMT: TfrmCadMotivoBloqueioMT
  Left = 454
  Top = 202
  HelpContext = 790119
  Caption = 'Cadastro'
  ClientHeight = 309
  ClientWidth = 408
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 408
    Height = 192
    inherited pnlControles: TPanel
      Width = 406
      Height = 190
      object LbLDescParamEmissor: TLabel
        Left = 12
        Top = 15
        Width = 62
        Height = 13
        Caption = 'Descrição '
      end
      object Label2: TLabel
        Left = 12
        Top = 63
        Width = 29
        Height = 13
        Caption = 'Sigla'
      end
      object dbeDescricao: TwwDBEdit
        Left = 12
        Top = 29
        Width = 388
        Height = 21
        DataField = 'DESCMOTBLOQ'
        DataSource = ds
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbeSigla: TwwDBEdit
        Left = 12
        Top = 85
        Width = 85
        Height = 21
        DataField = 'SIGLAMOTBLOQ'
        DataSource = ds
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
    inherited dbGrd: TwwDBGrid
      Width = 406
      Height = 190
      Selected.Strings = (
        'DESCMOTBLOQ'#9'39'#9'Motivo de Bloqueio'
        'SIGLAMOTBLOQ'#9'7'#9'Sigla')
    end
  end
  inherited Dock972: TDock97
    Width = 408
  end
  inherited Dock971: TDock97
    Top = 270
    Width = 408
    inherited tb97Fundo: TToolbar97
      Left = 236
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 67
    end
  end
  inherited pnlTitulo: TPanel
    Width = 408
    inherited lbNomItem: TfcLabel
      Width = 194
      Caption = 'Motivo de Bloqueio'
    end
  end
  inherited ds: TwwDataSource
    Left = 86
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyEdit = CmeCadastroApplyInsert
    ApplyDelete = CmeCadastroApplyInsert
  end
  inherited Cds: TCMClientDataSet
    Left = 148
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'MOTIVOBLOQUEIO.DESCMOTBLOQ'
      'MOTIVOBLOQUEIO.SIGLAMOTBLOQ')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Motivo de Bloqueio'
      'Sigla')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'MOTIVOBLOQUEIO')
    CamposChave.Strings = (
      'MOTIVOBLOQUEIO.IDMOTIVOBLOQUEIO')
    Filtro.Strings = (
      'MOTIVOBLOQUEIO.IDMOTIVOBLOQUEIO > 0')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '30'
      '3')
    OperComparador.Strings = (
      '-1'
      '-1')
  end
  object CMSqlParams1: TCMSqlParams
    SQL.Strings = (
      'SELECT'#9'IDMOTIVOBLOQUEIO, DESCMOTBLOQ, SIGLAMOTBLOQ'
      'FROM MOTIVOBLOQUEIO'
      'WHERE IDMOTIVOBLOQUEIO <> -1'
      'ORDER BY DESCMOTBLOQ'
      '')
    ClientDataSet = Cds
    Left = 200
    Top = 159
  end
end
