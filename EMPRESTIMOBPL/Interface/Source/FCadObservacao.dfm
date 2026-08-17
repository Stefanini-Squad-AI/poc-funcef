inherited frmCadObservacao: TfrmCadObservacao
  Left = 202
  Top = 219
  Caption = ''
  ClientHeight = 270
  ClientWidth = 527
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label10: TLabel [0]
    Left = 392
    Top = 42
    Width = 44
    Height = 13
    Caption = 'Parcela'
  end
  inherited pnlFundo: TPanel
    Width = 527
    Height = 202
    object DBRichEdit1: TDBRichEdit
      Left = 1
      Top = 1
      Width = 525
      Height = 200
      Align = alClient
      DataField = 'HMEOBSERVACAO'
      DataSource = ds
      TabOrder = 0
    end
  end
  inherited Dock972: TDock97
    Width = 527
    inherited Toolbar971: TToolbar97
      Visible = False
      inherited sbtnInserir: TToolbarButton97
        Enabled = False
      end
      inherited sbtnAlterar: TToolbarButton97
        Enabled = False
      end
      inherited sbtnProcurar: TToolbarButton97
        Enabled = False
      end
      inherited sbtnApagar: TToolbarButton97
        Enabled = False
      end
      inherited btnRefresh: TToolbarButton97
        Enabled = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 237
    Width = 527
    inherited tb97Fundo: TToolbar97
      DockPos = 373
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 183
      DockPos = 201
      inherited ToolbarSep971: TToolbarSep97
        Visible = False
      end
      inherited bbtnCancelar: TBitBtn
        Enabled = False
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      1
      (
        'TDBRichEdit'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Top = 0
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update HISTMOVEMPTMO'
      'set'
      '  IDHISTMOVEMPTMO = :IDHISTMOVEMPTMO,'
      '  HMEOBSERVACAO = :HMEOBSERVACAO'
      'where'
      '  IDHISTMOVEMPTMO = :OLD_IDHISTMOVEMPTMO')
    Top = 0
  end
  inherited MontaSelect: TMontaSelect
    Left = 760
    Top = 0
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 696
    Top = 0
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '   IDHISTMOVEMPTMO, IDCONTRATOEMPTMO,'
      '   HMEOBSERVACAO'
      ''
      'FROM'
      '   HISTMOVEMPTMO'
      ''
      'WHERE'
      '   IDHISTMOVEMPTMO =:IDHISTMOVEMPTMO')
    Top = 0
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDHISTMOVEMPTMO'
        ParamType = ptUnknown
      end>
    object qryHMEOBSERVACAO: TMemoField
      FieldName = 'HMEOBSERVACAO'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.HMEOBSERVACAO'
      BlobType = ftMemo
      Size = 2000
    end
    object qryIDHISTMOVEMPTMO: TFloatField
      FieldName = 'IDHISTMOVEMPTMO'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.IDHISTMOVEMPTMO'
    end
    object qryIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.IDCONTRATOEMPTMO'
    end
  end
end
