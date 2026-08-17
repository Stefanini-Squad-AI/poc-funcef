inherited frmCadCarreira: TfrmCadCarreira
  Left = 251
  Top = 203
  HelpContext = 160145
  Caption = 'Cadastro de Carreira'
  ClientHeight = 206
  ClientWidth = 496
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 496
    Height = 120
    object lblCodigo: TLabel
      Left = 16
      Top = 13
      Width = 40
      Height = 13
      Caption = 'Código'
    end
    object lblNome: TLabel
      Left = 16
      Top = 61
      Width = 33
      Height = 13
      Caption = 'Nome'
    end
    object dbeCodigo: TDBEdit
      Left = 16
      Top = 29
      Width = 121
      Height = 21
      DataField = 'CODIGO'
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object dbeNome: TDBEdit
      Left = 16
      Top = 77
      Width = 457
      Height = 21
      DataField = 'NOME'
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
  end
  inherited Dock972: TDock97
    Width = 496
  end
  inherited Dock971: TDock97
    Top = 167
    Width = 496
    inherited tb97Fundo: TToolbar97
      Left = 324
      DockPos = 327
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 155
      DockPos = 158
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 83
    Top = 243
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update Carreira'
      'set'
      '  IDCARREIRA = :IDCARREIRA,'
      '  CODIGO = :CODIGO,'
      '  NOME = :NOME'
      'where'
      '  IDCARREIRA = :OLD_IDCARREIRA')
    InsertSQL.Strings = (
      'insert into Carreira'
      '  (IDCARREIRA, CODIGO, NOME)'
      'values'
      '  (:IDCARREIRA, :CODIGO, :NOME)')
    DeleteSQL.Strings = (
      'delete from Carreira'
      'where'
      '  IDCARREIRA = :OLD_IDCARREIRA')
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'CARREIRA.CODIGO'
      'CARREIRA.NOME')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Código'
      'Nome da Carreira')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'CARREIRA')
    CamposChave.Strings = (
      'CARREIRA.IDCARREIRA')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '15'
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
      'Select IdCarreira,'
      '           Codigo,'
      '           Nome'
      'From    Carreira'
      'Where IdCarreira =:IdCarreira')
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IdCarreira'
        ParamType = ptUnknown
      end>
  end
end
