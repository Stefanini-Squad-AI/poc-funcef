inherited FrmCadServicos: TFrmCadServicos
  Left = 126
  Top = 143
  HelpContext = 190020
  Caption = 'Cadastro de Serviços que possam ser solicitados na RUB'
  ClientHeight = 256
  ClientWidth = 534
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 534
    Height = 170
    inherited pnlControles: TPanel
      Width = 524
      Height = 160
      object Nome: TLabel
        Left = 24
        Top = 36
        Width = 33
        Height = 13
        Caption = 'Nome'
      end
      object Label1: TLabel
        Left = 24
        Top = 96
        Width = 100
        Height = 13
        Caption = 'Regra do Servico'
      end
      object EdtDescricao: TwwDBEdit
        Left = 24
        Top = 56
        Width = 481
        Height = 21
        CharCase = ecUpperCase
        DataField = 'NOME'
        DataSource = ds
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dblkpRegra: TwwDBLookupCombo
        Left = 27
        Top = 115
        Width = 335
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMEREGRA'#9'60'#9'NOMEREGRA'#9'F')
        DataField = 'IDREGRA'
        DataSource = ds
        LookupTable = QryRegra
        LookupField = 'IDREGRA'
        Options = [loColLines, loTitles]
        TabOrder = 1
        AutoDropDown = False
        ShowButton = True
        OrderByDisplay = False
        AllowClearKey = False
      end
    end
    inherited dbGrd: TwwDBGrid
      Width = 524
      Height = 160
      Selected.Strings = (
        'NOME'#9'60'#9'Descrição do Serviço'
        'IDREGRA'#9'10'#9'IDREGRA')
    end
  end
  inherited Dock972: TDock97
    Width = 534
  end
  inherited Dock971: TDock97
    Top = 217
    Width = 534
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT IDSERVICOS,NOME,IDREGRA FROM SERVICO'
      'ORDER BY NOME')
    object qryNOME: TStringField
      DisplayLabel = 'Descrição do Serviço'
      DisplayWidth = 60
      FieldName = 'NOME'
      Origin = 'SERVICO.NOME'
      Required = True
      Size = 60
    end
    object qryIDREGRA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDREGRA'
      Origin = 'BASEDADOS.SERVICO.IDREGRA'
    end
    object qryIDSERVICOS: TFloatField
      DisplayLabel = 'Código'
      DisplayWidth = 10
      FieldName = 'IDSERVICOS'
      Origin = 'SERVICO.IDSERVICOS'
      Visible = False
    end
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update SERVICO'
      'set'
      '  IDSERVICOS = :IDSERVICOS,'
      '  NOME = :NOME,'
      '  IDREGRA = :IDREGRA'
      'where'
      '  IDSERVICOS = :OLD_IDSERVICOS')
    InsertSQL.Strings = (
      'insert into SERVICO'
      '  (IDSERVICOS, NOME, IDREGRA)'
      'values'
      '  (:IDSERVICOS, :NOME, :IDREGRA)')
    DeleteSQL.Strings = (
      'delete from SERVICO'
      'where'
      '  IDSERVICOS = :OLD_IDSERVICOS')
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'SERVICO.IDSERVICOS'
      'SERVICO.NOME')
    TipodeDado.Strings = (
      'N'
      'C')
    Descricao.Strings = (
      'Código'
      'Descrição do Serviço')
    Tabelas.Strings = (
      'SERVICO')
    CamposChave.Strings = (
      'SERVICO.IDSERVICOS')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '60')
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 358
    Top = 58
  end
  object QryRegra: TwwQuery
    AutoCalcFields = False
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select nomeregra,idregra '
      'from regra')
    ValidateWithMask = True
    Left = 421
    Top = 52
  end
end
