inherited frmCadMotivoConcessao: TfrmCadMotivoConcessao
  Left = 343
  Top = 250
  Caption = 'Motivo de bloqueio de concessão'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    inherited pnlControles: TPanel
      object Label1: TLabel
        Left = 72
        Top = 64
        Width = 118
        Height = 13
        Caption = 'Descrição do Motivo'
      end
      object edtMotivo: TDBEdit
        Left = 72
        Top = 80
        Width = 401
        Height = 21
        DataField = 'DESCRICAO'
        DataSource = ds
        TabOrder = 0
      end
    end
    inherited dbGrd: TwwDBGrid
      Selected.Strings = (
        'DESCRICAO'#9'200'#9'Motivos de bloqueio de concessão')
      TitleLines = 2
    end
  end
  inherited Dock972: TDock97
    inherited Toolbar971: TToolbar97
      inherited sbtnProcurar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    inherited tb97Fundo: TToolbar97
      inherited bbtnAjuda: TmaHelpBitBtn
        ClickHelpContext = 150056
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      1
      (
        ''
        'Filter'
        0))
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'UPDATE CM.MOTIVOSUSPCONCESSAO'
      '          SET DESCRICAO = :DESCRICAO'
      '         where IDMOTIVOSUSPCONCESSAO = :IDMOTIVOSUSPCONCESSAO')
    InsertSQL.Strings = (
      ' INSERT INTO CM.MOTIVOSUSPCONCESSAO                       '
      
        '                     (IDMOTIVOSUSPCONCESSAO,DESCRICAO)          ' +
        '             '
      
        '                    VALUES                                      ' +
        '             '
      '                    (:IDMOTIVOSUSPCONCESSAO,:DESCRICAO) ')
    DeleteSQL.Strings = (
      'DELETE FROM CM.MOTIVOSUSPCONCESSAO'
      'WHERE IDMOTIVOSUSPCONCESSAO = :IDMOTIVOSUSPCONCESSAO ')
    Left = 179
    Top = 118
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 236
    Top = 94
  end
  inherited qry: TwwQuery
    BeforePost = qryBeforePost
    BeforeDelete = qryBeforeDelete
    SQL.Strings = (
      
        'SELECT IDMOTIVOSUSPCONCESSAO, DESCRICAO FROM MOTIVOSUSPCONCESSAO' +
        ' ORDER BY  DESCRICAO ')
  end
  object qryAux: TwwQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      
        'SELECT MAX(IDMOTIVOSUSPCONCESSAO) AS IDMOTIVOSUSPCONCESSAO FROM ' +
        'MOTIVOSUSPCONCESSAO')
    ValidateWithMask = True
    Left = 336
    Top = 47
  end
  object qryUpd: TwwQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      ''
      'SELECT *'
      '          FROM suspconcessao sp, motivosuspconcessao m'
      
        '         WHERE sp.idmotivosuspconcessao = m.idmotivosuspconcessa' +
        'o'
      '         and m.idmotivosuspconcessao = :idmotivosuspconcessao')
    ValidateWithMask = True
    Left = 384
    Top = 47
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idmotivosuspconcessao'
        ParamType = ptInput
      end>
  end
  object qryDelete: TwwQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      'DELETE FROM CM.MOTIVOSUSPCONCESSAO'
      'WHERE IDMOTIVOSUSPCONCESSAO = :IDMOTIVOSUSPCONCESSAO')
    ValidateWithMask = True
    Left = 440
    Top = 47
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDMOTIVOSUSPCONCESSAO'
        ParamType = ptUnknown
      end>
  end
end
