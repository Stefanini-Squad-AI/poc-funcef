inherited frmCadTipoCota: TfrmCadTipoCota
  HelpContext = 790054
  ClientHeight = 249
  ClientWidth = 423
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 423
    Height = 163
    inherited Bevel2: TBevel
      Width = 421
    end
    object Label1: TLabel [1]
      Left = 19
      Top = 73
      Width = 74
      Height = 13
      Caption = 'Tipo de Cota'
    end
    inherited pnlTitulo: TPanel
      Width = 421
      inherited lbNomItem: TfcLabel
        Left = 13
        Width = 128
        Caption = 'Tipo de Cota'
      end
    end
    object dbeDescTipoCota: TwwDBEdit
      Left = 19
      Top = 89
      Width = 382
      Height = 21
      DataField = 'DESCTIPOCOTA'
      DataSource = ds
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
  end
  inherited Dock972: TDock97
    Width = 423
  end
  inherited Dock971: TDock97
    Top = 210
    Width = 423
    inherited tb97Fundo: TToolbar97
      Left = 251
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 82
    end
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update TIPOCOTA'
      'set'
      '  DESCTIPOCOTA = :DESCTIPOCOTA'
      'where'
      '  IDTIPOCOTA = :OLD_IDTIPOCOTA')
    InsertSQL.Strings = (
      'insert into TIPOCOTA'
      '  (IDTIPOCOTA, DESCTIPOCOTA)'
      'values'
      '  (:IDTIPOCOTA, :DESCTIPOCOTA)')
    DeleteSQL.Strings = (
      'delete from TIPOCOTA'
      'where'
      '  IDTIPOCOTA = :OLD_IDTIPOCOTA')
  end
  inherited MontaSelect: TMontaSelect
    Caption = ''
    Colunas.Strings = (
      'TIPOCOTA.DESCTIPOCOTA')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Tipo de Cota')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'TIPOCOTA')
    CamposChave.Strings = (
      'TIPOCOTA.IDTIPOCOTA')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '100')
    RepeteConsulta = True
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '   IDTIPOCOTA,'
      '   DESCTIPOCOTA'
      'FROM'
      '   TIPOCOTA'
      'WHERE'
      '   IDTIPOCOTA =:IDTIPOCOTA'
      ' ')
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptResult
      end>
  end
end
