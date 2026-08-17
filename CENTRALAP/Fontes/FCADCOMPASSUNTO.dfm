inherited FRMCADCOMPLASSUNTO: TFRMCADCOMPLASSUNTO
  Left = 159
  Top = 145
  Caption = 'Complento do Grupo de Protocolo'
  ClientWidth = 587
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 587
    object Label1: TLabel
      Left = 32
      Top = 32
      Width = 111
      Height = 13
      Caption = 'Grupo de Protocolo'
    end
    object Label2: TLabel
      Left = 32
      Top = 96
      Width = 208
      Height = 13
      Caption = 'Complemento do Grupo de Protocolo'
    end
    object DBLKPASSUNTO: TwwDBLookupCombo
      Left = 32
      Top = 48
      Width = 529
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'100'#9'DESCRICAO'#9'F')
      LookupTable = qryassunto
      LookupField = 'IDFIARASS'
      TabOrder = 0
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = True
    end
    object MASCOMPLASSUNTO: TMaskEdit
      Left = 32
      Top = 112
      Width = 529
      Height = 21
      MaxLength = 100
      TabOrder = 1
    end
  end
  inherited Dock972: TDock97
    Width = 587
  end
  inherited Dock971: TDock97
    Width = 587
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 536
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'COMPLEMENTOASSUNTO.DESCRICAO'
      'FIARIOASSUNTO.DESCRICAO')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Descricao do Complemento'
      'Descrição do Assunto')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'COMPLEMENTOASSUNTO'
      'FIARIOASSUNTO')
    CamposChave.Strings = (
      'COMPLEMENTOASSUNTO.IDFIARASS'
      'COMPLEMENTOASSUNTO.IDCOMPLASS'
      'COMPLEMENTOASSUNTO.DESCRICAO'
      'FIARIOASSUNTO.DESCRICAO')
    Filtro.Strings = (
      'FIARIOASSUNTO.IDFIARASS = COMPLEMENTOASSUNTO.IDFIARASS')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '100'
      '100')
    Left = 317
    Top = 54
  end
  inherited ImlPadrao: TImageList
    Left = 505
    Top = 14
  end
  inherited qry: TwwQuery
    Left = 434
    Top = 6
  end
  object qryassunto: TwwQuery
    DatabaseName = 'BaseDados'
    Filtered = True
    SQL.Strings = (
      'select  IDFIARASS, DESCRICAO'
      ' from FIARIOASSUNTO')
    ValidateWithMask = True
    Left = 384
    Top = 47
    object qryassuntoDESCRICAO: TStringField
      DisplayWidth = 100
      FieldName = 'DESCRICAO'
      Origin = 'BASEDADOS.FIARIOASSUNTO.DESCRICAO'
      Size = 100
    end
    object qryassuntoIDFIARASS: TFloatField
      DisplayWidth = 10
      FieldName = 'IDFIARASS'
      Origin = 'BASEDADOS.FIARIOASSUNTO.IDFIARASS'
      Visible = False
    end
  end
  object qryincluir: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'insert into COMPLEMENTOASSUNTO'
      ' (IDCOMPLASS,IDFIARASS,DESCRICAO,DATAINCLUSAO)'
      'values'
      '(:IDCOMPLASS,:IDFIARASS,:DESCRICAO,:DATAINCLUSAO)'
      ' ')
    ValidateWithMask = True
    Left = 232
    Top = 207
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCOMPLASS'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDFIARASS'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DESCRICAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAINCLUSAO'
        ParamType = ptUnknown
      end>
  end
  object qryalterar: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'update COMPLEMENTOASSUNTO'
      'set'
      'DESCRICAO = :DESCRICAO   '
      'where'
      'IDCOMPLASS = :IDCOMPLASS         ')
    ValidateWithMask = True
    Left = 280
    Top = 207
    ParamData = <
      item
        DataType = ftString
        Name = 'DESCRICAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCOMPLASS'
        ParamType = ptUnknown
      end>
  end
  object qryexcluir: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'delete from  COMPLEMENTOASSUNTO'
      'where'
      'IDCOMPLASS = :IDCOMPLASS ')
    ValidateWithMask = True
    Left = 328
    Top = 207
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCOMPLASS'
        ParamType = ptUnknown
      end>
  end
  object Qryid: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'Select max(IDCOMPLASS)  as identificador  from COMPLEMENTOASSUNT' +
        'O'
      '')
    ValidateWithMask = True
    Left = 472
    Top = 39
    object QryidIDENTIFICADOR: TFloatField
      FieldName = 'IDENTIFICADOR'
      Origin = 'BASEDADOS.COMPLEMENTOASSUNTO.IDCOMPLASS'
    end
  end
end
