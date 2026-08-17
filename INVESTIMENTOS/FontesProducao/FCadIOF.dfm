inherited frmCadIOF: TfrmCadIOF
  Left = 231
  Top = 168
  HelpContext = 790137
  Caption = 'Cadastro de IOF'
  ClientHeight = 211
  ClientWidth = 345
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 345
    Height = 125
    object Label1: TLabel
      Left = 18
      Top = 11
      Width = 33
      Height = 13
      Caption = 'Prazo'
    end
    object Label2: TLabel
      Left = 18
      Top = 54
      Width = 62
      Height = 13
      Caption = 'Percentual'
    end
    object dbPrazo: TDBRealEdit
      Left = 18
      Top = 26
      Width = 79
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '000')
      TabOrder = 0
      WordWrap = False
      IntDigits = 3
      DecDigits = 0
      NumberFormat = iFixed
      Signal = False
      DataField = 'PRAZO'
      DataSource = ds
    end
    object dbPercentual: TDBRealEdit
      Left = 18
      Top = 69
      Width = 79
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '      0,00')
      TabOrder = 1
      WordWrap = False
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
      DataField = 'PERCENTUAL'
      DataSource = ds
    end
  end
  inherited Dock972: TDock97
    Width = 345
  end
  inherited Dock971: TDock97
    Top = 172
    Width = 345
    inherited tb97Fundo: TToolbar97
      Left = 172
      DockPos = 172
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 3
      DockPos = 3
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 32
    Top = 22
  end
  inherited ds: TwwDataSource
    Left = 197
    Top = 64
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'UPDATE TABELAIOF'
      'SET'
      '   IDTABELAIOF = :IDTABELAIOF,'
      '   PRAZO       = :PRAZO,'
      '   PERCENTUAL  = :PERCENTUAL'
      'WHERE'
      '   IDTABELAIOF = :OLD_IDTABELAIOF     ')
    InsertSQL.Strings = (
      'INSERT INTO TABELAIOF'
      '   (IDTABELAIOF, PRAZO, PERCENTUAL)'
      'VALUES'
      '   (:IDTABELAIOF, :PRAZO, :PERCENTUAL)       ')
    DeleteSQL.Strings = (
      'DELETE FROM TABELAIOF'
      'WHERE'
      '   IDTABELAIOF = :OLD_IDTABELAIOF     ')
    Left = 137
    Top = 64
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'TABELAIOF.PRAZO'
      'TABELAIOF.PERCENTUAL')
    TipodeDado.Strings = (
      'N'
      'N')
    Descricao.Strings = (
      'Prazo'
      'Percentual')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'TABELAIOF')
    CamposChave.Strings = (
      'TABELAIOF.IDTABELAIOF')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '10')
    Left = 237
    Top = 64
  end
  inherited ImlPadrao: TImageList
    Left = 73
    Top = 14
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 142
    Top = 106
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '   IDTABELAIOF,'
      '   PRAZO,'
      '   PERCENTUAL'
      'FROM'
      '   TABELAIOF'
      'WHERE'
      '   IDTABELAIOF =:pIDTABELAIOF   ')
    Left = 167
    Top = 64
    ParamData = <
      item
        DataType = ftFloat
        Name = 'pIDTABELAIOF'
        ParamType = ptUnknown
      end>
    object qryIDTABELAIOF: TFloatField
      FieldName = 'IDTABELAIOF'
      Origin = 'TABELAIOF.IDTABELAIOF'
    end
    object qryPRAZO: TFloatField
      FieldName = 'PRAZO'
      Origin = 'TABELAIOF.PRAZO'
    end
    object qryPERCENTUAL: TFloatField
      FieldName = 'PERCENTUAL'
      Origin = 'TABELAIOF.PERCENTUAL'
    end
  end
end
