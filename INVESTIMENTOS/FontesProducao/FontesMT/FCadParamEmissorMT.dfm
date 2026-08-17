inherited FrmCadParamEmissorMT: TFrmCadParamEmissorMT
  Left = 287
  Top = 227
  HelpContext = 790113
  Caption = 'Cadastro'
  ClientHeight = 247
  ClientWidth = 537
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 537
    Height = 130
    inherited dbGrd: TwwDBGrid [0]
      Width = 535
      Height = 128
      Selected.Strings = (
        'DESCPARAMEMISSOR'#9'60'#9'Tipo de Indicador')
    end
    inherited pnlControles: TPanel [1]
      Width = 535
      Height = 128
      object LbLDescParamEmissor: TLabel
        Left = 15
        Top = 16
        Width = 58
        Height = 13
        Caption = 'Descrição'
      end
      object dbedescricao: TwwDBEdit
        Left = 15
        Top = 37
        Width = 383
        Height = 21
        DataField = 'DESCPARAMEMISSOR'
        DataSource = ds
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
  end
  inherited Dock972: TDock97
    Width = 537
  end
  inherited Dock971: TDock97
    Top = 208
    Width = 537
    inherited tb97Fundo: TToolbar97
      Left = 365
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 196
    end
  end
  inherited pnlTitulo: TPanel
    Width = 537
    inherited lbNomItem: TfcLabel
      Width = 175
      Caption = 'Tipo de Indicador'
    end
  end
  inherited ds: TwwDataSource
    Left = 398
    Top = 55
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyEdit = CmeCadastroApplyInsert
    ApplyDelete = CmeCadastroApplyInsert
    Left = 360
    Top = 7
  end
  inherited Cds: TCMClientDataSet
    Left = 380
    Top = 55
  end
  inherited MontaSelect: TMontaSelect
    Caption = ''
    Colunas.Strings = (
      'PARAMEMISSOR.DESCPARAMEMISSOR')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Tipo de Indicador')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'PARAMEMISSOR')
    CamposChave.Strings = (
      'PARAMEMISSOR.IDPARAMEMISSOR')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
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
    Left = 444
    Top = 65535
  end
  inherited pmnuFixaColunas: TPopupMenu
    Left = 472
    Top = 12
  end
  object Sql: TCMSqlParams
    SQL.Strings = (
      'SELECT                      '
      '    IDPARAMEMISSOR,'
      '    DESCPARAMEMISSOR'
      'FROM                        '
      '   PARAMEMISSOR               ')
    ClientDataSet = Cds
    Left = 384
    Top = 102
  end
end
