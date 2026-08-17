object Form1: TForm1
  Left = 192
  Top = 180
  Width = 696
  Height = 480
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 256
    Top = 168
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Database1: TDatabase
    DatabaseName = 'teste'
    DriverName = 'ORACLE'
    LoginPrompt = False
    Params.Strings = (
      'SERVER NAME=centra'
      'USER NAME=cm'
      'NET PROTOCOL=TNS'
      'OPEN MODE=READ/WRITE'
      'SCHEMA CACHE SIZE=8'
      'LANGDRIVER='
      'SQLQRYMODE=SERVER'
      'SQLPASSTHRU MODE=SHARED AUTOCOMMIT'
      'SCHEMA CACHE TIME=-1'
      'MAX ROWS=-1'
      'BATCH COUNT=200'
      'ENABLE SCHEMA CACHE=FALSE'
      'SCHEMA CACHE DIR='
      'ENABLE BCD=FALSE'
      'ENABLE INTEGERS=FALSE'
      'LIST SYNONYMS=NONE'
      'ROWSET SIZE=20'
      'BLOBS TO CACHE=64'
      'BLOB SIZE=32'
      'OBJECT MODE=TRUE'
      'PASSWORD=cmsol')
    SessionName = 'Default'
    Left = 200
    Top = 80
  end
  object Query1: TQuery
    DatabaseName = 'teste'
    SQL.Strings = (
      'SELECT * FROM RESERVASFRONT WHERE'
      'IDRESERVASFRONT = 200000024')
    Left = 312
    Top = 80
    object Query1IDRESERVASFRONT: TFloatField
      FieldName = 'IDRESERVASFRONT'
      Origin = 'TESTE.RESERVASFRONT.IDRESERVASFRONT'
    end
    object Query1IDROOMLIST: TFloatField
      FieldName = 'IDROOMLIST'
      Origin = 'TESTE.RESERVASFRONT.IDROOMLIST'
    end
    object Query1IDCONTATOCLIENTE: TFloatField
      FieldName = 'IDCONTATOCLIENTE'
      Origin = 'TESTE.RESERVASFRONT.IDCONTATOCLIENTE'
    end
    object Query1STATUSRESERVA: TFloatField
      FieldName = 'STATUSRESERVA'
      Origin = 'TESTE.RESERVASFRONT.STATUSRESERVA'
    end
    object Query1IDHOTEL: TFloatField
      FieldName = 'IDHOTEL'
      Origin = 'TESTE.RESERVASFRONT.IDHOTEL'
    end
    object Query1CODUH: TStringField
      FieldName = 'CODUH'
      Origin = 'TESTE.RESERVASFRONT.CODUH'
      FixedChar = True
      Size = 8
    end
    object Query1IDTARIFA: TFloatField
      FieldName = 'IDTARIFA'
      Origin = 'TESTE.RESERVASFRONT.IDTARIFA'
    end
    object Query1CODSEGMENTO: TStringField
      FieldName = 'CODSEGMENTO'
      Origin = 'TESTE.RESERVASFRONT.CODSEGMENTO'
      Size = 10
    end
    object Query1IDDOCUMENTO: TFloatField
      FieldName = 'IDDOCUMENTO'
      Origin = 'TESTE.RESERVASFRONT.IDDOCUMENTO'
    end
    object Query1IDCLUBES: TFloatField
      FieldName = 'IDCLUBES'
      Origin = 'TESTE.RESERVASFRONT.IDCLUBES'
    end
    object Query1IDMEIOCOMUNICACAO: TFloatField
      FieldName = 'IDMEIOCOMUNICACAO'
      Origin = 'TESTE.RESERVASFRONT.IDMEIOCOMUNICACAO'
    end
    object Query1IDPROMOTOR: TFloatField
      FieldName = 'IDPROMOTOR'
      Origin = 'TESTE.RESERVASFRONT.IDPROMOTOR'
    end
    object Query1IDVEICULOS: TFloatField
      FieldName = 'IDVEICULOS'
      Origin = 'TESTE.RESERVASFRONT.IDVEICULOS'
    end
    object Query1IDORIGEM: TFloatField
      FieldName = 'IDORIGEM'
      Origin = 'TESTE.RESERVASFRONT.IDORIGEM'
    end
    object Query1IDMOTIVO: TFloatField
      FieldName = 'IDMOTIVO'
      Origin = 'TESTE.RESERVASFRONT.IDMOTIVO'
    end
    object Query1CLIENTEHOSPEDE: TFloatField
      FieldName = 'CLIENTEHOSPEDE'
      Origin = 'TESTE.RESERVASFRONT.CLIENTEHOSPEDE'
    end
    object Query1CONTRATOFINAL: TFloatField
      FieldName = 'CONTRATOFINAL'
      Origin = 'TESTE.RESERVASFRONT.CONTRATOFINAL'
    end
    object Query1CLIENTERESERVANTE: TFloatField
      FieldName = 'CLIENTERESERVANTE'
      Origin = 'TESTE.RESERVASFRONT.CLIENTERESERVANTE'
    end
    object Query1CONTRATOINICIAL: TFloatField
      FieldName = 'CONTRATOINICIAL'
      Origin = 'TESTE.RESERVASFRONT.CONTRATOINICIAL'
    end
    object Query1IDGRUPOUH: TFloatField
      FieldName = 'IDGRUPOUH'
      Origin = 'TESTE.RESERVASFRONT.IDGRUPOUH'
    end
    object Query1IDPACOTE: TFloatField
      FieldName = 'IDPACOTE'
      Origin = 'TESTE.RESERVASFRONT.IDPACOTE'
    end
    object Query1TIPOUHESTADIA: TFloatField
      FieldName = 'TIPOUHESTADIA'
      Origin = 'TESTE.RESERVASFRONT.TIPOUHESTADIA'
    end
    object Query1TIPOUHTARIFA: TFloatField
      FieldName = 'TIPOUHTARIFA'
      Origin = 'TESTE.RESERVASFRONT.TIPOUHTARIFA'
    end
    object Query1RESERVANTE: TStringField
      FieldName = 'RESERVANTE'
      Origin = 'TESTE.RESERVASFRONT.RESERVANTE'
      Size = 30
    end
    object Query1TELRESERVANTE: TStringField
      FieldName = 'TELRESERVANTE'
      Origin = 'TESTE.RESERVASFRONT.TELRESERVANTE'
    end
    object Query1DATACHEGPREVISTA: TDateTimeField
      FieldName = 'DATACHEGPREVISTA'
      Origin = 'TESTE.RESERVASFRONT.DATACHEGPREVISTA'
    end
    object Query1HORACHEGPREVISTA: TDateTimeField
      FieldName = 'HORACHEGPREVISTA'
      Origin = 'TESTE.RESERVASFRONT.HORACHEGPREVISTA'
    end
    object Query1DATAPARTPREVISTA: TDateTimeField
      FieldName = 'DATAPARTPREVISTA'
      Origin = 'TESTE.RESERVASFRONT.DATAPARTPREVISTA'
    end
    object Query1HORAPARTPREVISTA: TDateTimeField
      FieldName = 'HORAPARTPREVISTA'
      Origin = 'TESTE.RESERVASFRONT.HORAPARTPREVISTA'
    end
    object Query1ADULTOS: TFloatField
      FieldName = 'ADULTOS'
      Origin = 'TESTE.RESERVASFRONT.ADULTOS'
    end
    object Query1CRIANCAS1: TFloatField
      FieldName = 'CRIANCAS1'
      Origin = 'TESTE.RESERVASFRONT.CRIANCAS1'
    end
    object Query1CRIANCAS2: TFloatField
      FieldName = 'CRIANCAS2'
      Origin = 'TESTE.RESERVASFRONT.CRIANCAS2'
    end
    object Query1CODPENSAO: TStringField
      FieldName = 'CODPENSAO'
      Origin = 'TESTE.RESERVASFRONT.CODPENSAO'
      FixedChar = True
      Size = 1
    end
    object Query1VLRDIARIA: TFloatField
      FieldName = 'VLRDIARIA'
      Origin = 'TESTE.RESERVASFRONT.VLRDIARIA'
    end
    object Query1PERCDESCONTODIARIA: TFloatField
      FieldName = 'PERCDESCONTODIARIA'
      Origin = 'TESTE.RESERVASFRONT.PERCDESCONTODIARIA'
    end
    object Query1GARANTENOSHOW: TStringField
      FieldName = 'GARANTENOSHOW'
      Origin = 'TESTE.RESERVASFRONT.GARANTENOSHOW'
      FixedChar = True
      Size = 1
    end
    object Query1DATACONFIRMACAO: TDateTimeField
      FieldName = 'DATACONFIRMACAO'
      Origin = 'TESTE.RESERVASFRONT.DATACONFIRMACAO'
    end
    object Query1DATARESERVA: TDateTimeField
      FieldName = 'DATARESERVA'
      Origin = 'TESTE.RESERVASFRONT.DATARESERVA'
    end
    object Query1HORARESERVA: TDateTimeField
      FieldName = 'HORARESERVA'
      Origin = 'TESTE.RESERVASFRONT.HORARESERVA'
    end
    object Query1AJUSTE: TStringField
      FieldName = 'AJUSTE'
      Origin = 'TESTE.RESERVASFRONT.AJUSTE'
      FixedChar = True
      Size = 1
    end
    object Query1POOLLISTA: TStringField
      FieldName = 'POOLLISTA'
      Origin = 'TESTE.RESERVASFRONT.POOLLISTA'
      FixedChar = True
      Size = 1
    end
    object Query1VLRUPSAILING: TFloatField
      FieldName = 'VLRUPSAILING'
      Origin = 'TESTE.RESERVASFRONT.VLRUPSAILING'
    end
    object Query1AUTOCHECKOUT: TStringField
      FieldName = 'AUTOCHECKOUT'
      Origin = 'TESTE.RESERVASFRONT.AUTOCHECKOUT'
      FixedChar = True
      Size = 1
    end
    object Query1DATAINIDEPOSITO: TDateTimeField
      FieldName = 'DATAINIDEPOSITO'
      Origin = 'TESTE.RESERVASFRONT.DATAINIDEPOSITO'
    end
    object Query1DATAFIMDEPOSITO: TDateTimeField
      FieldName = 'DATAFIMDEPOSITO'
      Origin = 'TESTE.RESERVASFRONT.DATAFIMDEPOSITO'
    end
    object Query1DATADEPOSITO: TDateTimeField
      FieldName = 'DATADEPOSITO'
      Origin = 'TESTE.RESERVASFRONT.DATADEPOSITO'
    end
    object Query1VLRDIARIASDEPOSITO: TFloatField
      FieldName = 'VLRDIARIASDEPOSITO'
      Origin = 'TESTE.RESERVASFRONT.VLRDIARIASDEPOSITO'
    end
    object Query1VLREXTRASDEPOSITO: TFloatField
      FieldName = 'VLREXTRASDEPOSITO'
      Origin = 'TESTE.RESERVASFRONT.VLREXTRASDEPOSITO'
    end
    object Query1PERCPREPAGDEPOSITO: TFloatField
      FieldName = 'PERCPREPAGDEPOSITO'
      Origin = 'TESTE.RESERVASFRONT.PERCPREPAGDEPOSITO'
    end
    object Query1WALKIN: TStringField
      FieldName = 'WALKIN'
      Origin = 'TESTE.RESERVASFRONT.WALKIN'
      FixedChar = True
      Size = 1
    end
    object Query1OBSERVACOES: TMemoField
      FieldName = 'OBSERVACOES'
      Origin = 'TESTE.RESERVASFRONT.OBSERVACOES'
      BlobType = ftMemo
      Size = 1400
    end
    object Query1DOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      Origin = 'TESTE.RESERVASFRONT.DOCUMENTO'
      Size = 25
    end
    object Query1NUMRESERVA: TFloatField
      FieldName = 'NUMRESERVA'
      Origin = 'TESTE.RESERVASFRONT.NUMRESERVA'
    end
    object Query1FLAGCOMPARTILHADA: TStringField
      FieldName = 'FLAGCOMPARTILHADA'
      Origin = 'TESTE.RESERVASFRONT.FLAGCOMPARTILHADA'
      FixedChar = True
      Size = 1
    end
    object Query1DATACHEGADAREAL: TDateTimeField
      FieldName = 'DATACHEGADAREAL'
      Origin = 'TESTE.RESERVASFRONT.DATACHEGADAREAL'
    end
    object Query1HORACHEGADAREAL: TDateTimeField
      FieldName = 'HORACHEGADAREAL'
      Origin = 'TESTE.RESERVASFRONT.HORACHEGADAREAL'
    end
    object Query1DATAPARTIDAREAL: TDateTimeField
      FieldName = 'DATAPARTIDAREAL'
      Origin = 'TESTE.RESERVASFRONT.DATAPARTIDAREAL'
    end
    object Query1HORAPARTIDAREAL: TDateTimeField
      FieldName = 'HORAPARTIDAREAL'
      Origin = 'TESTE.RESERVASFRONT.HORAPARTIDAREAL'
    end
    object Query1VLRDIFDIARIA: TFloatField
      FieldName = 'VLRDIFDIARIA'
      Origin = 'TESTE.RESERVASFRONT.VLRDIFDIARIA'
    end
    object Query1VLRDIARIAPADRAO: TFloatField
      FieldName = 'VLRDIARIAPADRAO'
      Origin = 'TESTE.RESERVASFRONT.VLRDIARIAPADRAO'
    end
    object Query1IDRESERVAMULTROOM: TFloatField
      FieldName = 'IDRESERVAMULTROOM'
      Origin = 'TESTE.RESERVASFRONT.IDRESERVAMULTROOM'
    end
    object Query1NUMCANCELAMENTO: TFloatField
      FieldName = 'NUMCANCELAMENTO'
      Origin = 'TESTE.RESERVASFRONT.NUMCANCELAMENTO'
    end
    object Query1DATAVALCARTAO: TStringField
      FieldName = 'DATAVALCARTAO'
      Origin = 'TESTE.RESERVASFRONT.DATAVALCARTAO'
      Size = 10
    end
    object Query1USUARIO: TFloatField
      FieldName = 'USUARIO'
      Origin = 'TESTE.RESERVASFRONT.USUARIO'
    end
    object Query1DATAPRORROGRES: TDateTimeField
      FieldName = 'DATAPRORROGRES'
      Origin = 'TESTE.RESERVASFRONT.DATAPRORROGRES'
    end
    object Query1DATAULTALTERACAO: TDateTimeField
      FieldName = 'DATAULTALTERACAO'
      Origin = 'TESTE.RESERVASFRONT.DATAULTALTERACAO'
    end
    object Query1DATAREATIVACAO: TDateTimeField
      FieldName = 'DATAREATIVACAO'
      Origin = 'TESTE.RESERVASFRONT.DATAREATIVACAO'
    end
    object Query1DATAREATIVACAONS: TDateTimeField
      FieldName = 'DATAREATIVACAONS'
      Origin = 'TESTE.RESERVASFRONT.DATAREATIVACAONS'
    end
    object Query1DATACANCELAMENTO: TDateTimeField
      FieldName = 'DATACANCELAMENTO'
      Origin = 'TESTE.RESERVASFRONT.DATACANCELAMENTO'
    end
    object Query1FLGDIARIAFIXA: TStringField
      FieldName = 'FLGDIARIAFIXA'
      Origin = 'TESTE.RESERVASFRONT.FLGDIARIAFIXA'
      FixedChar = True
      Size = 1
    end
    object Query1TRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
      Origin = 'TESTE.RESERVASFRONT.TRGDTINCLUSAO'
    end
    object Query1TRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Origin = 'TESTE.RESERVASFRONT.TRGUSERINCLUSAO'
      Size = 30
    end
    object Query1NUMRESERVAGDS: TFloatField
      FieldName = 'NUMRESERVAGDS'
      Origin = 'TESTE.RESERVASFRONT.NUMRESERVAGDS'
    end
    object Query1IDUSUALTERACAO: TFloatField
      FieldName = 'IDUSUALTERACAO'
      Origin = 'TESTE.RESERVASFRONT.IDUSUALTERACAO'
    end
    object Query1IDEVENTO: TFloatField
      FieldName = 'IDEVENTO'
      Origin = 'TESTE.RESERVASFRONT.IDEVENTO'
    end
    object Query1LOCRESERVA: TFloatField
      FieldName = 'LOCRESERVA'
      Origin = 'TESTE.RESERVASFRONT.LOCRESERVA'
    end
    object Query1NUMVOO: TStringField
      FieldName = 'NUMVOO'
      Origin = 'TESTE.RESERVASFRONT.NUMVOO'
    end
    object Query1VLRPENSAO: TFloatField
      FieldName = 'VLRPENSAO'
      Origin = 'TESTE.RESERVASFRONT.VLRPENSAO'
    end
    object Query1REQVIAGEM: TStringField
      FieldName = 'REQVIAGEM'
      Origin = 'TESTE.RESERVASFRONT.REQVIAGEM'
    end
    object Query1MATRICFUNC: TStringField
      FieldName = 'MATRICFUNC'
      Origin = 'TESTE.RESERVASFRONT.MATRICFUNC'
      Size = 10
    end
    object Query1CENTROCUSTO: TStringField
      FieldName = 'CENTROCUSTO'
      Origin = 'TESTE.RESERVASFRONT.CENTROCUSTO'
    end
    object Query1NOMEDEPTO: TStringField
      FieldName = 'NOMEDEPTO'
      Origin = 'TESTE.RESERVASFRONT.NOMEDEPTO'
      Size = 10
    end
    object Query1NUMCARTVIRTUAL: TStringField
      FieldName = 'NUMCARTVIRTUAL'
      Origin = 'TESTE.RESERVASFRONT.NUMCARTVIRTUAL'
      Size = 54
    end
    object Query1ESTABELEC: TStringField
      FieldName = 'ESTABELEC'
      Origin = 'TESTE.RESERVASFRONT.ESTABELEC'
      Size = 10
    end
  end
end
