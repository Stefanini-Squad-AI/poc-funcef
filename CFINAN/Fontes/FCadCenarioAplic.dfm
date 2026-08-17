inherited frmCadCenarioAplic: TfrmCadCenarioAplic
  Top = 392
  Caption = 'Cadastro de Cenários de Aplicação'
  ClientHeight = 183
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Height = 97
    object Label1: TLabel
      Left = 16
      Top = 36
      Width = 62
      Height = 13
      Caption = 'Descrição:'
      FocusControl = dbedDescricao
    end
    object dbedDescricao: TDBEdit
      Left = 88
      Top = 32
      Width = 449
      Height = 21
      DataField = 'NOMECENARIO'
      DataSource = ds
      TabOrder = 0
    end
  end
  inherited Dock971: TDock97
    Top = 144
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT *'
      'FROM'
      '   CenarioOrcamen'
      'WHERE'
      '   (IDCenarioOrcamen=:IDCenarioOrcamen)'
      ' ')
    Left = 354
    Top = 6
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDCenarioOrcamen'
        ParamType = ptInput
      end>
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 264
    Top = 6
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update CenarioOrcamen'
      'set'
      '  IDCENARIOORCAMEN = :IDCENARIOORCAMEN,'
      '  NOMECENARIO = :NOMECENARIO'
      'where'
      '  IDCENARIOORCAMEN = :OLD_IDCENARIOORCAMEN')
    InsertSQL.Strings = (
      'insert into CenarioOrcamen'
      '  (IDCENARIOORCAMEN, NOMECENARIO)'
      'values'
      '  (:IDCENARIOORCAMEN, :NOMECENARIO)')
    DeleteSQL.Strings = (
      'delete from CenarioOrcamen'
      'where'
      '  IDCENARIOORCAMEN = :OLD_IDCENARIOORCAMEN')
    Left = 435
    Top = 6
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'CENARIOORCAMEN.NOMECENARIO')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Descrição')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'CENARIOORCAMEN')
    CamposChave.Strings = (
      'CENARIOORCAMEN.IDCENARIOORCAMEN')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
    Left = 517
    Top = 6
  end
  inherited ds: TwwDataSource
    Left = 395
    Top = 6
  end
  inherited ImlPadrao: TImageList
    Left = 313
    Top = 6
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 476
    Top = 6
  end
end
