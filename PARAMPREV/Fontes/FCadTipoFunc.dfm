inherited frmCadTipoFunc: TfrmCadTipoFunc
  Left = 198
  Top = 196
  HelpContext = 160146
  Caption = 'Cadastro de Tipo de Função'
  ClientHeight = 197
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Height = 111
    object lblDescricao: TLabel
      Left = 24
      Top = 32
      Width = 58
      Height = 13
      Caption = 'Descrição'
    end
    object dbeDescricao: TDBEdit
      Left = 24
      Top = 48
      Width = 505
      Height = 21
      DataField = 'DESCRICAO'
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
  end
  inherited Dock971: TDock97
    Top = 158
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update TIPOFUNC'
      'set'
      '  IDTIPOFUNC = :IDTIPOFUNC,'
      '  DESCRICAO = :DESCRICAO'
      'where'
      '  IDTIPOFUNC = :OLD_IDTIPOFUNC')
    InsertSQL.Strings = (
      'insert into TIPOFUNC'
      '  (IDTIPOFUNC, DESCRICAO)'
      'values'
      '  (:IDTIPOFUNC, :DESCRICAO)')
    DeleteSQL.Strings = (
      'delete from TIPOFUNC'
      'where'
      '  IDTIPOFUNC = :OLD_IDTIPOFUNC')
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'TIPOFUNC.DESCRICAO')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Descrição')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'TIPOFUNC')
    CamposChave.Strings = (
      'TIPOFUNC.IDTIPOFUNC')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 358
    Top = 58
  end
  inherited qry: TwwQuery
    BeforePost = qryBeforePost
    SQL.Strings = (
      'SELECT IDTIPOFUNC, DESCRICAO'
      'FROM TIPOFUNC'
      'WHERE IDTIPOFUNC = :IDTIPOFUNC')
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNC'
        ParamType = ptUnknown
      end>
  end
end
