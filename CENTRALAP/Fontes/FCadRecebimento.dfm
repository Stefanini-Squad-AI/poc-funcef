inherited FrmCadTpRecebXCancelamento: TFrmCadTpRecebXCancelamento
  Left = 223
  Top = 174
  HelpContext = 190022
  Caption = 'Cadastro de Tipos de recebimento e Cancelamento de RUB'
  ClientHeight = 348
  ClientWidth = 477
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 477
    Height = 262
    inherited pnlControles: TPanel
      Width = 467
      Height = 252
      object Label2: TLabel
        Left = 147
        Top = 17
        Width = 58
        Height = 13
        Caption = 'Descrição'
      end
      object TLabel
        Left = 16
        Top = 64
        Width = 306
        Height = 13
        Caption = 'Mensagem a ser guardada no Motivo do Recebimento'
      end
      object RgTipo: TDBRadioGroup
        Left = 16
        Top = 8
        Width = 121
        Height = 49
        Caption = ' Tipo  '
        DataField = 'TIPOOPERACAO'
        DataSource = ds
        Items.Strings = (
          'Recebimento'
          'Cancelamento')
        TabOrder = 0
        Values.Strings = (
          '0'
          '1')
      end
      object EdtDesc: TwwDBEdit
        Left = 147
        Top = 31
        Width = 308
        Height = 21
        DataField = 'DESCRICAO'
        DataSource = ds
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object MemMensagem: TDBMemo
        Left = 16
        Top = 80
        Width = 441
        Height = 161
        DataField = 'MENSAGEM'
        DataSource = ds
        ScrollBars = ssVertical
        TabOrder = 2
      end
    end
    inherited dbGrd: TwwDBGrid
      Width = 467
      Height = 252
      Selected.Strings = (
        'DESCRICAO'#9'50'#9'Descrição')
    end
  end
  inherited Dock972: TDock97
    Width = 477
  end
  inherited Dock971: TDock97
    Top = 309
    Width = 477
    inherited tb97Fundo: TToolbar97
      Left = 307
      DockPos = 307
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 139
      DockPos = 139
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT '
      
        '   IDCANCELAMENTO, DESCRICAO, MENSAGEM, STATUSRECEBIMENTO, TIPOO' +
        'PERACAO'
      'FROM '
      '   TPCANCELAMENTO'
      'ORDER BY'
      '   DESCRICAO')
    object qryDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 50
      FieldName = 'DESCRICAO'
      Origin = 'TPCANCELAMENTO.DESCRICAO'
      Size = 40
    end
    object qryTIPOOPERACAO: TFloatField
      DisplayLabel = 'Tipo'
      DisplayWidth = 10
      FieldName = 'TIPOOPERACAO'
      Origin = 'TPCANCELAMENTO.TIPOOPERACAO'
      Visible = False
    end
    object qryIDCANCELAMENTO: TFloatField
      DisplayLabel = 'Código'
      DisplayWidth = 10
      FieldName = 'IDCANCELAMENTO'
      Origin = 'TPCANCELAMENTO.IDCANCELAMENTO'
      Visible = False
    end
    object qrySTATUSRECEBIMENTO: TFloatField
      DisplayLabel = 'Situação'
      DisplayWidth = 10
      FieldName = 'STATUSRECEBIMENTO'
      Origin = 'TPCANCELAMENTO.STATUSRECEBIMENTO'
      Visible = False
    end
    object qryMENSAGEM: TMemoField
      FieldName = 'MENSAGEM'
      Origin = 'TPCANCELAMENTO.MENSAGEM'
      Visible = False
      BlobType = ftMemo
      Size = 1
    end
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update TPCANCELAMENTO'
      'set'
      '  IDCANCELAMENTO = :IDCANCELAMENTO,'
      '  DESCRICAO = :DESCRICAO,'
      '  MENSAGEM = :MENSAGEM,'
      '  STATUSRECEBIMENTO = :STATUSRECEBIMENTO,'
      '  TIPOOPERACAO = :TIPOOPERACAO'
      'where'
      '  IDCANCELAMENTO = :OLD_IDCANCELAMENTO')
    InsertSQL.Strings = (
      'insert into TPCANCELAMENTO'
      
        '  (IDCANCELAMENTO, DESCRICAO, MENSAGEM, STATUSRECEBIMENTO, TIPOO' +
        'PERACAO)'
      'values'
      
        '  (:IDCANCELAMENTO, :DESCRICAO, :MENSAGEM, :STATUSRECEBIMENTO, :' +
        'TIPOOPERACAO)')
    DeleteSQL.Strings = (
      'delete from TPCANCELAMENTO'
      'where'
      '  IDCANCELAMENTO = :OLD_IDCANCELAMENTO')
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'TPCANCELAMENTO.IDCANCELAMENTO'
      'TPCANCELAMENTO.DESCRICAO'
      'TPCANCELAMENTO.TIPOOPERACAO'
      'TPCANCELAMENTO.STATUSRECEBIMENTO')
    TipodeDado.Strings = (
      'N'
      'C'
      'N'
      'N')
    Descricao.Strings = (
      'Código'
      'Descrição'
      'Tipo'
      'Id do Tipo')
    Tabelas.Strings = (
      'TPCANCELAMENTO')
    CamposChave.Strings = (
      'TPCANCELAMENTO.IDCANCELAMENTO'
      'TPCANCELAMENTO.DESCRICAO')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '40'
      '10'
      '10')
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 358
    Top = 58
  end
end
