object dmCds: TdmCds
  OldCreateOrder = False
  Left = 417
  Top = 243
  Height = 151
  Width = 159
  object sql: TCMSqlParams
    ClientDataSet = Cds
    Left = 17
    Top = 13
  end
  object Cds: TCMClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'EMPRESA'
        Attributes = [faFixed]
        DataType = ftString
        Size = 70
      end
      item
        Name = 'EMPREGADO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 70
      end
      item
        Name = 'DESCRICAO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 70
      end
      item
        Name = 'CARGO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 70
      end
      item
        Name = 'DATPLAN'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PERIODOINI'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PERIODOFIM'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'OBSERVA'
        Attributes = [faFixed]
        DataType = ftString
        Size = 11
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 65
    Top = 14
    Data = {
      CF0100009619E0BD010000001800000008000000000003000000CF0107454D50
      5245534101004900000002000753554254595045020049000A00466978656443
      6861720005574944544802000200460009454D5052454741444F010049000000
      02000753554254595045020049000A0046697865644368617200055749445448
      0200020046000944455343524943414F01004900000002000753554254595045
      020049000A004669786564436861720005574944544802000200460005434152
      474F01004900000002000753554254595045020049000A004669786564436861
      720005574944544802000200460007444154504C414E01004900000002000753
      554254595045020049000A004669786564436861720005574944544802000200
      0A000A504552494F444F494E4901004900000002000753554254595045020049
      000A0046697865644368617200055749445448020002000A000A504552494F44
      4F46494D01004900000002000753554254595045020049000A00466978656443
      68617200055749445448020002000A00074F4253455256410100490000000200
      0753554254595045020049000A00466978656443686172000557494454480200
      02000B000100044C4349440400010009080000}
  end
  object CmErroDlg: TCmErroDialiog
    Caption = 'Erro !'
    HeaderMesage.Strings = (
      
        'Ocorreu um erro no sistema que pode deixá-lo operacionalmente in' +
        'stável. '
      
        'Caso o problema persista, favor entrar em contato com a CM Soluç' +
        'ões.')
    AddEmpresaInfo = True
    AddVersionInfo = True
    AddWindowInfo = True
    BtnEmailVisible = True
    Left = 64
    Top = 64
  end
end
