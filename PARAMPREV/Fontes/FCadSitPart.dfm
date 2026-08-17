inherited FrmCadSitPart: TFrmCadSitPart
  Left = 199
  Top = 222
  HelpContext = 160170
  Caption = 'Cadastro da Situação do Participante na Fundação '
  ClientHeight = 276
  OnActivate = FormActivate
  OnCloseQuery = nil
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Height = 190
    inherited dbGrd: TwwDBGrid [0]
      Height = 188
      Selected.Strings = (
        'IDSITPART'#9'10'#9'Código'
        'DESCRICAO'#9'50'#9'Descrição')
    end
    inherited pnlControles: TPanel [1]
      Height = 188
      object LblFlagInterno: TLabel
        Left = 32
        Top = 80
        Width = 270
        Height = 13
        Caption = 'Tipo de Situação do Participante na Fundação '
      end
      object LblDescricao: TLabel
        Left = 32
        Top = 24
        Width = 62
        Height = 13
        Caption = 'Descrição '
      end
      object Label1: TLabel
        Left = 384
        Top = 24
        Width = 40
        Height = 13
        Caption = 'Código'
      end
      object dbedtDescricao: TwwDBEdit
        Left = 32
        Top = 40
        Width = 313
        Height = 21
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbedtCodigo: TwwDBEdit
        Left = 376
        Top = 40
        Width = 65
        Height = 21
        Color = clSilver
        DataField = 'IDSITPART'
        DataSource = ds
        Enabled = False
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object cbFlgInterno: TComboBox
        Left = 32
        Top = 112
        Width = 281
        Height = 21
        ItemHeight = 13
        TabOrder = 2
        Items.Strings = (
          'Ativo'
          'Mantido'
          'Mantido Parcial'
          'Assistido'
          'Manutenção de Saldo de Conta'
          'Cancelado'
          'Ativo Especial'
          'Pendente')
      end
    end
  end
  inherited Dock971: TDock97
    Top = 237
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 448
    Top = 22
  end
  inherited ds: TwwDataSource
    OnStateChange = dsStateChange
    Left = 315
    Top = 22
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update SITPART'
      'set'
      '  IDSITPART = :IDSITPART,'
      '  DESCRICAO = :DESCRICAO,'
      '  FLGINTERNO = :FLGINTERNO'
      'where'
      '  IDSITPART = :OLD_IDSITPART')
    InsertSQL.Strings = (
      'insert into SITPART'
      '  (IDSITPART, DESCRICAO, FLGINTERNO)'
      'values'
      '  (:IDSITPART, :DESCRICAO, :FLGINTERNO)')
    DeleteSQL.Strings = (
      'delete from SITPART'
      'where'
      '  IDSITPART = :OLD_IDSITPART')
    Left = 363
    Top = 22
  end
  inherited MontaSelect: TMontaSelect
    Caption = ''
    Colunas.Strings = (
      'SITPART.IDSITPART'
      'SITPART.DESCRICAO')
    TipodeDado.Strings = (
      'N'
      'C')
    Descricao.Strings = (
      'Código '
      'Descrição')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'SITPART')
    CamposChave.Strings = (
      'SITPART.IDSITPART')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '50')
    ExibePergunta = False
    Left = 493
    Top = 86
  end
  inherited ImlPadrao: TImageList
    Left = 265
    Top = 14
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 492
    Top = 142
  end
  inherited qry: TwwQuery
    AfterInsert = qryAfterInsert
    AutoRefresh = True
    Filtered = True
    SQL.Strings = (
      'SELECT IDSITPART, DESCRICAO,FLGINTERNO'
      'FROM  SITPART '
      'WHERE FLGINTERNO =:paramFLG'
      'ORDER BY DESCRICAO, IDSITPART'
      ''
      ''
      ' ')
    Left = 402
    Top = 30
    ParamData = <
      item
        DataType = ftString
        Name = 'paramFLG'
        ParamType = ptUnknown
      end>
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 501
    Top = 20
  end
end
