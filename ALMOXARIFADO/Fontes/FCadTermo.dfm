inherited FrmCadTermo: TFrmCadTermo
  Left = 140
  Top = 108
  Caption = 'Termo de Inventário'
  ClientHeight = 353
  ClientWidth = 554
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 554
    Height = 267
    object memTexto: TDBMemo
      Left = 24
      Top = 72
      Width = 505
      Height = 177
      DataField = 'TEXTO'
      DataSource = ds
      MaxLength = 1000
      TabOrder = 0
    end
    object RagTermo: TDBRadioGroup
      Left = 24
      Top = 16
      Width = 505
      Height = 41
      Caption = ' Termo de '
      Columns = 2
      DataField = 'FLGABREFECHA'
      DataSource = ds
      Items.Strings = (
        'Abertura'
        'Fechamento')
      TabOrder = 1
      Values.Strings = (
        'A'
        'F')
    end
  end
  inherited Dock972: TDock97
    Width = 554
  end
  inherited Dock971: TDock97
    Top = 314
    Width = 554
    inherited tb97Fundo: TToolbar97
      Left = 384
      DockPos = 384
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 216
      DockPos = 216
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '      IDPESSOA,'
      '      FLGABREFECHA,'
      '      TEXTO'
      'FROM'
      '      TERMOINVENTARIO'
      'WHERE'
      '       (IDPESSOA     = :pIDPESSOA)'
      '   AND (FLGABREFECHA = :pFLGABREFECHA)'
      ' ')
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pFLGABREFECHA'
        ParamType = ptUnknown
      end>
    object qryIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'TERMOINVENTARIO.IDPESSOA'
    end
    object qryFLGABREFECHA: TStringField
      FieldName = 'FLGABREFECHA'
      Origin = 'TERMOINVENTARIO.FLGABREFECHA'
      Size = 1
    end
    object qryTEXTO: TMemoField
      FieldName = 'TEXTO'
      Origin = 'BASEDADOS.TERMOINVENTARIO.TEXTO'
      BlobType = ftMemo
      Size = 1000
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 779
    Top = 65523
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update TERMOINVENTARIO'
      'set'
      '  IDPESSOA = :IDPESSOA,'
      '  FLGABREFECHA = :FLGABREFECHA,'
      '  TEXTO = :TEXTO'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  FLGABREFECHA = :OLD_FLGABREFECHA')
    InsertSQL.Strings = (
      'insert into TERMOINVENTARIO'
      '  (IDPESSOA, FLGABREFECHA, TEXTO)'
      'values'
      '  (:IDPESSOA, :FLGABREFECHA, :TEXTO)')
    DeleteSQL.Strings = (
      'delete from TERMOINVENTARIO'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  FLGABREFECHA = :OLD_FLGABREFECHA')
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      
        'DECODE(TERMOINVENTARIO.FLGABREFECHA,'#39'A'#39','#39'TERMO DE ABERTURA'#39','#39'TER' +
        'MO DE FECHAMENTO'#39')')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Aberto/Fechado')
    Tabelas.Strings = (
      'TERMOINVENTARIO')
    CamposChave.Strings = (
      'TERMOINVENTARIO.IDPESSOA'
      'TERMOINVENTARIO.FLGABREFECHA')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '30')
  end
  inherited CmeCadastro: TCmEventosCadastro
    RepetirInsert = False
    OnFind = CmeCadastroFind
  end
end
