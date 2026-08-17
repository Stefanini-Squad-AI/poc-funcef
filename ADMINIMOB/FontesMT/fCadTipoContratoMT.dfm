inherited frmCadTipoContratoMT: TfrmCadTipoContratoMT
  Left = 412
  Top = 248
  HelpContext = 640093
  Caption = 'Cadastro de Tipo de Contrato'
  ClientHeight = 276
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Height = 190
    inherited pnlControles: TPanel
      Height = 188
      object lblSigla: TLabel
        Left = 48
        Top = 39
        Width = 29
        Height = 13
        Caption = 'Sigla'
      end
      object lblNome: TLabel
        Left = 48
        Top = 106
        Width = 33
        Height = 13
        Caption = 'Nome'
      end
      object edtSigla: TwwDBEdit
        Left = 48
        Top = 55
        Width = 121
        Height = 21
        DataField = 'SIGLA'
        DataSource = ds
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object edtNome: TwwDBEdit
        Left = 48
        Top = 122
        Width = 425
        Height = 21
        DataField = 'NOME'
        DataSource = ds
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
    inherited dbGrd: TwwDBGrid
      Height = 188
      Selected.Strings = (
        'SIGLA'#9'10'#9'SIGLA'
        'NOME'#9'56'#9'NOME'#9'F')
    end
  end
  inherited Dock971: TDock97
    Top = 237
  end
  inherited CmeCadastro: TCmEventosCadastro
    ApplyEdit = CmeCadastroApplyInsert
    ApplyDelete = CmeCadastroApplyInsert
  end
  inherited Cds: TCMClientDataSet
    object CdsSIGLA: TStringField
      DisplayWidth = 10
      FieldName = 'SIGLA'
      FixedChar = True
      Size = 5
    end
    object CdsNOME: TStringField
      DisplayWidth = 56
      FieldName = 'NOME'
      Size = 60
    end
    object CdsIDTIPOCONTRIMOB: TFloatField
      FieldName = 'IDTIPOCONTRIMOB'
      Visible = False
    end
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'TIPOCONTRIMOB.SIGLA'
      'TIPOCONTRIMOB.NOME')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Sigla'
      'Nome')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'TIPOCONTRIMOB')
    CamposChave.Strings = (
      'TIPOCONTRIMOB.IDTIPOCONTRIMOB')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '55')
    OperComparador.Strings = (
      '-1'
      '-1')
    LookupSQL.Strings = (
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      '')
  end
  object CMSqlParams1: TCMSqlParams
    SQL.Strings = (
      'select * from TIPOCONTRIMOB')
    ClientDataSet = Cds
    Left = 248
    Top = 87
  end
end
