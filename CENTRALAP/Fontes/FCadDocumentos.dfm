inherited FrmCadDocumentos: TFrmCadDocumentos
  Left = 147
  Top = 154
  HelpContext = 190021
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  Caption = 'Cadastro de Documentos a serem solicitados pela RUBS'
  ClientHeight = 253
  ClientWidth = 520
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 520
    Height = 167
    inherited dbGrd: TwwDBGrid [0]
      Width = 518
      Height = 165
      Selected.Strings = (
        'NOMEDOCUMENTO'#9'100'#9'Descrição do Documento')
    end
    inherited pnlControles: TPanel [1]
      Width = 518
      Height = 165
      object Label1: TLabel
        Left = 24
        Top = 7
        Width = 58
        Height = 13
        Caption = 'Descrição'
      end
      object Label2: TLabel
        Left = 24
        Top = 56
        Width = 69
        Height = 13
        Caption = 'Observação'
      end
      object EdtDescricao: TwwDBEdit
        Left = 23
        Top = 28
        Width = 466
        Height = 21
        CharCase = ecUpperCase
        DataField = 'NOMEDOCUMENTO'
        DataSource = ds
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object memObservacao: TDBMemo
        Left = 24
        Top = 72
        Width = 465
        Height = 73
        DataField = 'OBSERVACAO'
        DataSource = ds
        MaxLength = 2000
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 1
      end
    end
  end
  inherited Dock972: TDock97
    Width = 520
  end
  inherited Dock971: TDock97
    Top = 214
    Width = 520
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 65528
    Top = 198
    TargetsData = (
      1
      1
      (
        'TDBMemo'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 307
    Top = 6
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update DOCUMENTOS'
      'set'
      '  IDDOCUMENTO = :IDDOCUMENTO,'
      '  NOMEDOCUMENTO = :NOMEDOCUMENTO,'
      '  OBSERVACAO = :OBSERVACAO'
      'where'
      '  IDDOCUMENTO = :OLD_IDDOCUMENTO'
      ' ')
    InsertSQL.Strings = (
      'insert into DOCUMENTOS'
      '  (IDDOCUMENTO, NOMEDOCUMENTO,OBSERVACAO)'
      'values'
      '  (:IDDOCUMENTO, :NOMEDOCUMENTO,:OBSERVACAO)'
      ' ')
    DeleteSQL.Strings = (
      'delete from DOCUMENTOS'
      'where'
      '  IDDOCUMENTO = :OLD_IDDOCUMENTO')
    Left = 355
    Top = 6
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'DOCUMENTOS.IDDOCUMENTO'
      'DOCUMENTOS.NOMEDOCUMENTO')
    TipodeDado.Strings = (
      'N'
      'C')
    Descricao.Strings = (
      'Código'
      'Descrição do Documento')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'DOCUMENTOS')
    CamposChave.Strings = (
      'DOCUMENTOS.IDDOCUMENTO')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '100')
    Left = 469
    Top = 6
  end
  inherited ImlPadrao: TImageList
    Left = 49
    Top = 198
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyInsert
    Left = 412
    Top = 6
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '    IDDOCUMENTO,'
      '    NOMEDOCUMENTO,'
      '    OBSERVACAO'
      'FROM'
      '    DOCUMENTOS'
      'ORDER BY NOMEDOCUMENTO'
      ' ')
    Left = 258
    Top = 6
    object qryNOMEDOCUMENTO: TStringField
      DisplayLabel = 'Descrição do Documento'
      DisplayWidth = 100
      FieldName = 'NOMEDOCUMENTO'
      Origin = 'DOCUMENTOS.NOMEDOCUMENTO'
      Required = True
      Size = 100
    end
    object qryIDDOCUMENTO: TFloatField
      DisplayLabel = 'Código'
      DisplayWidth = 10
      FieldName = 'IDDOCUMENTO'
      Origin = 'DOCUMENTOS.IDDOCUMENTO'
      Visible = False
    end
    object qryOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      Origin = 'BASEDADOS.DOCUMENTOS.OBSERVACAO'
      BlobType = ftMemo
      Size = 2000
    end
  end
end
