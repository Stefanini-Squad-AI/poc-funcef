inherited frmCadMotivo: TfrmCadMotivo
  Left = 219
  Top = 112
  Caption = 'Tabela de Motivos e Ações'
  ClientHeight = 406
  ClientWidth = 401
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 401
    Height = 320
    BorderWidth = 2
    inherited pnlControles: TPanel
      Left = 4
      Top = 4
      Width = 393
      Height = 312
      object Label1: TLabel
        Left = 15
        Top = 11
        Width = 40
        Height = 13
        Caption = 'Código'
        FocusControl = dbedCodigo
      end
      object Label2: TLabel
        Left = 15
        Top = 50
        Width = 58
        Height = 13
        Caption = 'Descrição'
      end
      object Label3: TLabel
        Left = 15
        Top = 150
        Width = 73
        Height = 13
        Caption = 'Código RAIS'
        FocusControl = dbedCodRais
      end
      object Label4: TLabel
        Left = 291
        Top = 150
        Width = 76
        Height = 13
        Caption = 'Código FGTS'
        FocusControl = dbedCodFgts
      end
      object Label5: TLabel
        Left = 15
        Top = 189
        Width = 69
        Height = 13
        Caption = 'Observação'
      end
      object dbedCodigo: TDBEdit
        Left = 15
        Top = 26
        Width = 84
        Height = 21
        DataField = 'IDMOTIVO'
        DataSource = ds
        TabOrder = 0
      end
      object dbedDescr: TDBEdit
        Left = 15
        Top = 65
        Width = 361
        Height = 21
        DataField = 'DESCRICAO'
        DataSource = ds
        TabOrder = 1
      end
      object dbrgGrupo: TDBRadioGroup
        Left = 15
        Top = 91
        Width = 361
        Height = 55
        Caption = 'Grupo a Que Pertence'
        Columns = 2
        DataField = 'GRUPOMOTIVO'
        DataSource = ds
        Items.Strings = (
          'Tipo de Folha'
          'Desligamento/Afastamento'
          'Alteração Funcional'
          'Outro')
        TabOrder = 2
        Values.Strings = (
          'F'
          'D'
          'A'
          'O')
      end
      object dbedCodRais: TDBEdit
        Left = 15
        Top = 165
        Width = 84
        Height = 21
        DataField = 'MOTIVORAIS'
        DataSource = ds
        TabOrder = 3
      end
      object dbedCodFgts: TDBEdit
        Left = 291
        Top = 165
        Width = 84
        Height = 21
        DataField = 'MOTIVOFGTS'
        DataSource = ds
        TabOrder = 4
      end
      object dbedObs: TwwDBEdit
        Left = 15
        Top = 201
        Width = 361
        Height = 94
        AutoSize = False
        DataField = 'OBSERVACAO'
        DataSource = ds
        ShowVertScrollBar = True
        TabOrder = 5
        UnboundDataType = wwDefault
        WantReturns = True
        WordWrap = True
      end
    end
    inherited dbGrd: TwwDBGrid
      Left = 4
      Top = 4
      Width = 393
      Height = 312
      Selected.Strings = (
        'IDMOTIVO'#9'8'#9'Código'
        'DESCRICAO'#9'50'#9'Descrição')
      Font.Height = -11
      Font.Style = []
      ParentFont = False
    end
  end
  inherited Dock972: TDock97
    Width = 401
  end
  inherited Dock971: TDock97
    Top = 367
    Width = 401
    inherited tb97Fundo: TToolbar97
      Left = 231
      DockPos = 231
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 63
      DockPos = 63
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '  IDMOTIVO,'
      '  DESCRICAO,'
      '  IDMOVCONTRCAGED,'
      '  MOTIVORAIS,'
      '  MOTIVOFGTS,'
      '  OBSERVACAO,'
      '  GRUPOMOTIVO,'
      '  FLGTIPO'
      'FROM'
      '  MOTIVO'
      'ORDER BY'
      '  IDMOTIVO')
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update MOTIVO'
      'set'
      '  IDMOTIVO = :IDMOTIVO,'
      '  DESCRICAO = :DESCRICAO,'
      '  IDMOVCONTRCAGED = :IDMOVCONTRCAGED,'
      '  MOTIVORAIS = :MOTIVORAIS,'
      '  MOTIVOFGTS = :MOTIVOFGTS,'
      '  OBSERVACAO = :OBSERVACAO,'
      '  GRUPOMOTIVO = :GRUPOMOTIVO,'
      '  FLGTIPO = :FLGTIPO'
      'where'
      '  IDMOTIVO = :OLD_IDMOTIVO')
    InsertSQL.Strings = (
      'insert into MOTIVO'
      
        '  (IDMOTIVO, DESCRICAO, IDMOVCONTRCAGED, MOTIVORAIS, MOTIVOFGTS,' +
        ' OBSERVACAO, '
      '   GRUPOMOTIVO, FLGTIPO)'
      'values'
      
        '  (:IDMOTIVO, :DESCRICAO, :IDMOVCONTRCAGED, :MOTIVORAIS, :MOTIVO' +
        'FGTS, :OBSERVACAO, '
      '   :GRUPOMOTIVO, :FLGTIPO)')
    DeleteSQL.Strings = (
      'delete from MOTIVO'
      'where'
      '  IDMOTIVO = :OLD_IDMOTIVO')
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Tabela de Motivos e Ações'
    Colunas.Strings = (
      'MOTIVO.IDMOTIVO'
      'MOTIVO.DESCRICAO')
    TipodeDado.Strings = (
      'N'
      'C')
    Descricao.Strings = (
      'Código'
      'Descrição')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'MOTIVO')
    CamposChave.Strings = (
      'MOTIVO.IDMOTIVO')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '50')
    Left = 325
    Top = 72
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 326
    Top = 130
  end
end
