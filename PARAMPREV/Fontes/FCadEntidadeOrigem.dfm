inherited frmCadEntidadeOrigem: TfrmCadEntidadeOrigem
  Left = 406
  Top = 143
  AutoSize = True
  BorderStyle = bsNone
  Caption = 'Entidade de Origem'
  ClientWidth = 551
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 551
    object lblEntidadeOrigem: TLabel
      Left = 24
      Top = 16
      Width = 112
      Height = 13
      Caption = 'Entidade de Origem'
    end
    object lblCnpj: TLabel
      Left = 24
      Top = 80
      Width = 32
      Height = 13
      Caption = 'CNPJ'
    end
    object lblcnpb: TLabel
      Left = 24
      Top = 152
      Width = 81
      Height = 13
      Caption = 'CNPB/SUSEP'
    end
    object edtEntidadeOrigem: TDBEdit
      Left = 24
      Top = 32
      Width = 513
      Height = 21
      DataField = 'NOME'
      DataSource = ds
      TabOrder = 0
    end
    object edtCnpj: TMaskEdit
      Left = 24
      Top = 96
      Width = 137
      Height = 21
      EditMask = '99.999.999/9999-99;0;_'
      MaxLength = 18
      TabOrder = 1
      OnChange = edtCnpjChange
      OnExit = edtCnpjExit
    end
    object edtcnpb: TDBEdit
      Left = 24
      Top = 168
      Width = 137
      Height = 21
      DataField = 'CNPBSUSEP'
      DataSource = ds
      TabOrder = 2
      OnKeyPress = edtcnpbKeyPress
    end
    object rdgTipo: TDBRadioGroup
      Left = 352
      Top = 96
      Width = 185
      Height = 97
      Caption = 'Tipo'
      DataField = 'TIPO'
      DataSource = ds
      Items.Strings = (
        'Aberta'
        'Fechada')
      TabOrder = 3
      Values.Strings = (
        'A'
        'F')
    end
  end
  inherited Dock972: TDock97
    Width = 551
  end
  inherited Dock971: TDock97
    Width = 551
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 368
    Top = 54
  end
  inherited ds: TwwDataSource
    Left = 435
    Top = 110
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update CM.ENTIDADEORIGEM SET'
      '  NOME = :NOME,'
      '  CNPJ = :CNPJ,'
      '  TIPO = :TIPO,'
      '  CNPBSUSEP = :CNPBSUSEP'
      'where'
      '  IDENTIDADEORIGEM = :IDENTIDADEORIGEM ')
    InsertSQL.Strings = (
      'insert into CM.ENTIDADEORIGEM'
      '  (IDENTIDADEORIGEM, NOME, CNPJ, TIPO, CNPBSUSEP)'
      'values'
      '  (CM.SEQENTIDADEORIGEM.NEXTVAL, :NOME, :CNPJ, :TIPO, '
      ':CNPBSUSEP)')
    DeleteSQL.Strings = (
      'delete from CM.ENTIDADEORIGEM'
      'where'
      '  IDENTIDADEORIGEM= :IDENTIDADEORIGEM')
    Left = 347
    Top = 102
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'ENTIDADEORIGEM.NOME'
      'ENTIDADEORIGEM.CNPJ'
      'ENTIDADEORIGEM.TIPO'
      'ENTIDADEORIGEM.CNPBSUSEP')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Entidade de Origem'
      'CNPJ'
      'Tipo'
      'CNPB/SUSEP')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'CM.ENTIDADEORIGEM')
    CamposChave.Strings = (
      'ENTIDADEORIGEM.NOME'
      'ENTIDADEORIGEM.CNPJ'
      'ENTIDADEORIGEM.TIPO'
      'ENTIDADEORIGEM.CNPBSUSEP'
      'ENTIDADEORIGEM.IDENTIDADEORIGEM')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '50'
      '17'
      '8'
      '23')
    OperComparador.Strings = (
      '0'
      '1'
      '1'
      '0')
    LookupSQL.Strings = (
      ''
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      '')
    Left = 493
    Top = 110
  end
  inherited ImlPadrao: TImageList
    Left = 425
    Top = 54
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 476
    Top = 54
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT * FROM CM.ENTIDADEORIGEM '
      'WHERE IDENTIDADEORIGEM = :IDENTIDADEORIGEM ')
    Left = 386
    Top = 102
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDENTIDADEORIGEM'
        ParamType = ptInput
      end>
    object qryIDENTIDADEORIGEM: TFloatField
      FieldName = 'IDENTIDADEORIGEM'
      Origin = 'BASEDADOS.ENTIDADEORIGEM.IDENTIDADEORIGEM'
    end
    object qryNOME: TStringField
      FieldName = 'NOME'
      Origin = 'BASEDADOS.ENTIDADEORIGEM.NOME'
      Size = 200
    end
    object qryCNPJ2: TStringField
      FieldName = 'CNPJ'
      Origin = 'BASEDADOS.ENTIDADEORIGEM.CNPJ'
      Size = 14
    end
    object qryTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'BASEDADOS.ENTIDADEORIGEM.TIPO'
      Size = 1
    end
    object qryCNPBSUSEP: TStringField
      FieldName = 'CNPBSUSEP'
      Origin = 'BASEDADOS.ENTIDADEORIGEM.CNPBSUSEP'
    end
  end
  object qryAux: TwwQuery
    DatabaseName = 'BASEDADOS'
    ValidateWithMask = True
    Left = 283
    Top = 110
  end
  object qryCNPJ: TwwQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      'SELECT * FROM CM.ENTIDADEORIGEM'
      'WHERE CNPJ = :CNPJ')
    ValidateWithMask = True
    Left = 280
    Top = 168
    ParamData = <
      item
        DataType = ftString
        Name = 'CNPJ'
        ParamType = ptInput
      end>
  end
end
