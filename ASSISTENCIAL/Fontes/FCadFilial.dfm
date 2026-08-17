inherited frmCadFilial: TfrmCadFilial
  Left = 3
  Top = 48
  Caption = 'Filial'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    inherited pnlMestre: TPanel
      inherited lblDocumento: TLabel
        Width = 26
        Caption = 'CGC'
      end
    end
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'PESSOA.NOME')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Nome da Filial')
    Tabelas.Strings = (
      'FILIALPESSOA'
      'PESSOA')
    CamposChave.Strings = (
      'FILIALPESSOA.IDFILIALPESSOA')
    Filtro.Strings = (
      'PESSOA.IDPESSOA = FILIALPESSOA.IDFILIALPESSOA'
      'PESSOA.FLGFILIALPESSOA = 1')
  end
  inherited updSubTipo: TUpdateSQL
    ModifySQL.Strings = (
      'update FILIALPESSOA'
      'set'
      '  IDFILIALPESSOA = :IDFILIALPESSOA'
      'where'
      '  IDFILIALPESSOA = :OLD_IDFILIALPESSOA')
    InsertSQL.Strings = (
      'insert into FILIALPESSOA'
      '  (IDFILIALPESSOA)'
      'values'
      '  (:IDFILIALPESSOA)')
    DeleteSQL.Strings = (
      'delete from FILIALPESSOA'
      'where'
      '  IDFILIALPESSOA = :OLD_IDFILIALPESSOA')
  end
  inherited qrySubTipo: TwwQuery
    SQL.Strings = (
      'SELECT FILIALPESSOA.IDFILIALPESSOA'
      'FROM FILIALPESSOA'
      'WHERE ( FILIALPESSOA.IDFILIALPESSOA =  :IdPessoa )')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IdPessoa'
        ParamType = ptUnknown
      end>
    object qrySubTipoIDFILIALPESSOA: TFloatField
      FieldName = 'IDFILIALPESSOA'
      Origin = 'FILIALPESSOA.IDFILIALPESSOA'
    end
  end
  inherited dsEscolhePessoa: TwwDataSource
    Left = 317
    Top = 124
  end
  inherited Pessoa: TPessoa
    SubTipo = stFilial
  end
end
